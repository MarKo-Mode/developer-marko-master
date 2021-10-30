using System;
using System.Collections.Generic;
using System.Diagnostics;
using GTANetworkAPI;

public class TimerEx : Script
{

    private static readonly List<TimerEx> timer = new List<TimerEx>();
    private static List<TimerEx> insertAfterList = new List<TimerEx>();
    private static Stopwatch stopwatch = new Stopwatch();
    public Action Func;
    public readonly uint ExecuteAfterMs;
    private ulong executeAtMs;
    public uint ExecutesLeft;
    public bool HandleException;
    private bool willRemoved = false;
    public bool IsRunning
    {
        get
        {
            return !willRemoved;
        }
    }

    public TimerEx()
    {
        stopwatch.Start();
    }

    private TimerEx(Action thefunc, uint executeafterms, ulong executeatms, uint executes, bool handleexception)
    {
        Func = thefunc;
        ExecuteAfterMs = executeafterms;
        executeAtMs = executeatms;
        ExecutesLeft = executes;
        HandleException = handleexception;
    }

    public static TimerEx SetTimer(Action thefunc, uint executeafterms, uint executes = 1, bool handleexception = false)
    {
        ulong executeatms = executeafterms + GetTick();
        TimerEx thetimer = new TimerEx(thefunc, executeafterms, executeatms, executes, handleexception);
        insertAfterList.Add(thetimer);
        return thetimer;
    }

    private static ulong GetTick()
    {
        return (ulong)stopwatch.ElapsedMilliseconds;
    }

    public void Kill()
    {
        willRemoved = true;
    }

    private void ExecuteMe()
    {
        Func();
        if (ExecutesLeft == 1)
        {
            ExecutesLeft = 0;
            willRemoved = true;
        }
        else
        {
            if (ExecutesLeft != 0)
                ExecutesLeft--;
            executeAtMs += ExecuteAfterMs;
            insertAfterList.Add(this);
        }
    }

    private void ExecuteMeSafe()
    {
        try
        {
            Func();
        }
        catch (Exception ex)
        {
            NAPI.Util.ConsoleOutput(ex.ToString());
        }
        finally
        {
            if (ExecutesLeft == 1)
            {
                ExecutesLeft = 0;
                willRemoved = true;
            }
            else
            {
                if (ExecutesLeft != 0)
                    ExecutesLeft--;
                executeAtMs += ExecuteAfterMs;
                insertAfterList.Add(this);
            }
        }
    }

    public void Execute(bool changeexecutems = true)
    {
        if (changeexecutems)
        {
            executeAtMs = GetTick();
        }
        if (HandleException)
            ExecuteMeSafe();
        else
            ExecuteMe();
    }

    private void InsertSorted()
    {
        bool putin = false;
        for (int i = timer.Count - 1; i >= 0 && !putin; i--)
            if (executeAtMs <= timer[i].executeAtMs)
            {
                timer.Insert(i + 1, this);
                putin = true;
            }

        if (!putin)
            timer.Insert(0, this);
    }

    [ServerEvent(Event.Update)]
    public static void OnUpdateFunc()
    {
        ulong tick = GetTick();
        for (int i = timer.Count - 1; i >= 0; i--)
        {
            if (!timer[i].willRemoved)
            {
                if (timer[i].executeAtMs <= tick)
                {
                    TimerEx thetimer = timer[i];
                    timer.RemoveAt(i);
                    if (thetimer.HandleException)
                        thetimer.ExecuteMeSafe();
                    else
                        thetimer.ExecuteMe();
                }
                else
                    break;
            }
            else
                timer.RemoveAt(i);
        }

        if (insertAfterList.Count > 0)
        {
            foreach (TimerEx timer in insertAfterList)
            {
                timer.InsertSorted();
            }
            insertAfterList.Clear();
        }
    }
}
