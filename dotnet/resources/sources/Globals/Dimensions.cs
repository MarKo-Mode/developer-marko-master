using GTANetworkAPI;
using NeptuneEvo.Plugins;
using System;
using System.Collections.Generic;

namespace NeptuneEvo.Globals
{
    class Dimensions : Script
    {
        private static nLog Log = new nLog("Dimensions");

        private static Dictionary<int, Entity> DimensionsInUse = new Dictionary<int, Entity>();
        private static ICollection<int> Keys = DimensionsInUse.Keys;

        public static uint RequestPrivateDimension(Player requester)
        {
            int firstUnusedDim = 10000;

            lock (DimensionsInUse)
            {
                while (DimensionsInUse.ContainsKey(--firstUnusedDim))
                {
                }
                DimensionsInUse.Add(firstUnusedDim, requester);
            }
            Log.Debug($"Dimension {firstUnusedDim.ToString()} is registered for {requester.Name}.");
            return (uint)firstUnusedDim;
        }
        public static void DismissPrivateDimension(Player requester)
        {
            try
            {
                foreach (KeyValuePair<int, Entity> dim in DimensionsInUse)
                {
                    if (dim.Value == requester.Handle)
                        DimensionsInUse.Remove(dim.Key);
                    break;
                }
            }
            catch (Exception e) { Log.Write("DismissPrivateDimension: " + e.Message, nLog.Type.Error); }
        }
        public static uint GetPlayerDimension(Player player)
        {
            foreach (var key in Keys)
                if (DimensionsInUse[key] == player) return (uint)key;
            return 0;
        }
    }
}
