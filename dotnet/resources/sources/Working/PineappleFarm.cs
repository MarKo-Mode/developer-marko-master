using GTANetworkAPI;
using NeptuneEvo.Globals;
using NeptuneEvo.Plugins;
using NeptuneEvo.Settings;
using System;
using System.Collections.Generic;

namespace NeptuneEvo.Working
{
    class Pineapple : Script
    {
        private static nLog Log = new nLog("Pineapple");
        private static Dictionary<int, ColShape> Cols = new Dictionary<int, ColShape>();
        private void cf_onEntityEnterColShape(ColShape shape, Player entity)
        {
            try
            {
                NAPI.Data.SetEntityData(entity, "INTERACTIONCHECK", shape.GetData<int>("INTERACT"));
            }
            catch (Exception ex) { Log.Write("gp_onEntityEnterColShape: " + ex.Message, nLog.Type.Error); }
        }
        private void cf_onEntityExitColShape(ColShape shape, Player entity)
        {
            try
            {
                NAPI.Data.SetEntityData(entity, "INTERACTIONCHECK", 0);
            }
            catch (Exception ex) { Log.Write("gp_onEntityExitColShape: " + ex.Message, nLog.Type.Error); }
        }
        [ServerEvent(Event.ResourceStart)]
        public void onResourceStart()
        {
            try
            {
                NAPI.Blip.CreateBlip(76, new Vector3(2865.28735, 4730.23975, 47.59451), 1, 46, Main.StringToU16("Сбор ананасов"), 255, 0, true, 0, 0);
                Cols.Add(1, NAPI.ColShape.CreateCylinderColShape(new Vector3(2865.28735, 4730.23975, 47.59451) , 1, 2, 0));// get clothes
                Cols[1].OnEntityEnterColShape += cf_onEntityEnterColShape;
                Cols[1].OnEntityExitColShape += cf_onEntityExitColShape;
                Cols[1].SetData("INTERACT", 383);
                NAPI.TextLabel.CreateTextLabel(Main.StringToU16("Начать сбор"), new Vector3(2865.28735, 4730.23975, 47.59451) + new Vector3(0, 0, 1), 10F, 0.6F, 0, new Color(0, 180, 0));
				
				Cols.Add(2, NAPI.ColShape.CreateCylinderColShape(new Vector3(1962.11548, 5184.89453, 46.86264), 1, 2, 0)); // Pineapple seller
                Cols[2].OnEntityEnterColShape += cf_onEntityEnterColShape;
                Cols[2].OnEntityExitColShape += cf_onEntityExitColShape;
                Cols[2].SetData("INTERACT", 383);
                NAPI.TextLabel.CreateTextLabel(Main.StringToU16("Продать ананасы"), new Vector3(1962.11548, 5184.89453, 46.86264), 10F, 0.6F, 0, new Color(0, 180, 0));
                int i = 0;
				foreach (var Check in Checkpoints)
				
                {
                    var col = NAPI.ColShape.CreateCylinderColShape(Check.Position, 1, 2, 0);
                    col.SetData("NUMBER", i);
                    col.OnEntityEnterColShape += PlayerEnterCheckpoint;
                    i++;
                }

            }
            catch (Exception e) { Log.Write("ResourceStart: " + e.Message, nLog.Type.Error); }
        }
        public static void StartWorkDay(Player player)
        {

            if (player.GetData<bool>("ON_WORK"))
            {
                Customization.ApplyCharacter(player);
                player.SetData("ON_WORK", false);
                Trigger.ClientEvent(player, "deleteCheckpoint", 15);
                Trigger.ClientEvent(player, "deleteWorkBlip");
                int UUID = Main.Players[player].UUID;
                var Pineapple = nInventory.Items[UUID].Find(t => t.Type == ItemType.pineapple);
                if (Pineapple != null)
                {
                    nInventory.Remove(player, Pineapple.Type, Pineapple.Count);
                    GUI.Dashboard.sendItems(player);
                    int payment = (int)(Pineapple.Count * 500);
                    MoneySystem.Wallet.Change(player, payment);
                    Plugins.Notice.Send(player, Plugins.TypeNotice.Success, Plugins.PositionNotice.TopCenter, $"Вы продали {Pineapple.Count} ананасов  за {payment}$", 3000);

                }

                Plugins.Notice.Send(player, Plugins.TypeNotice.Info, Plugins.PositionNotice.TopCenter, $"Вы закончили рабочий день", 3000);
                return;
            }
            else
            {
                Customization.ClearClothes(player, Main.Players[player].Gender);
                if (Main.Players[player].Gender)
                {
                    player.SetClothes(3, 85, 0);
                    player.SetClothes(11, 42, 0);
                    player.SetClothes(4, 41, 0);
                    player.SetClothes(6, 37, 0);
                }
                else
                {
                    player.SetClothes(3, 17, 0);
                    player.SetClothes(11, 150, 1);
                    player.SetClothes(4, 1, 5);
                    player.SetClothes(6, 52, 0);
                }

                var check = WorkManager.rnd.Next(0, Checkpoints.Count - 1);
                player.SetData("WORKCHECK", check);
				BasicSync.AttachObjectToPlayer(player, NAPI.Util.GetHashKey("prop_cs_trowel"), 57005, new Vector3(0.1, 0, 0), new Vector3(90, 50, -30));
                Trigger.ClientEvent(player, "createCheckpoint", 15, 1, Checkpoints[check].Position, 1, 0, 255, 0, 0);
                Trigger.ClientEvent(player, "createWorkBlip", Checkpoints[check].Position);

                player.SetData("ON_WORK", true);
                Plugins.Notice.Send(player, Plugins.TypeNotice.Info, Plugins.PositionNotice.TopCenter, "Вы начали рабочий день", 3000);
                return;
            }
        }
        public static void interactPressed(Player client, int id)
        {
            switch (id)
            {
                case 383:
                    try
                    {
                        if (!Main.Players.ContainsKey(client)) return;
                        StartWorkDay(client);
                        if (!Main.Players.ContainsKey(client)) return;
                        if (Main.Players[client].FractionID != 12) return;
                        int UUID = Main.Players[client].UUID;
                        var Pineapple = nInventory.Items[UUID].Find(t => t.Type == ItemType.pineapple);
                        if (Pineapple == null)
                        {
                            Plugins.Notice.Send(client, Plugins.TypeNotice.Error, Plugins.PositionNotice.TopCenter, "У вас нет ананасов", 3000);
                            return;
                        }
                        nInventory.Remove(client, Pineapple.Type, Pineapple.Count);
                        GUI.Dashboard.sendItems(client);
                        int payment = (int)(Pineapple.Count * 500);
                        MoneySystem.Wallet.Change(client, payment);
                        Plugins.Notice.Send(client, Plugins.TypeNotice.Success, Plugins.PositionNotice.TopCenter, $"Вы продали {Pineapple.Count} ананасов  за {payment}$", 3000);

                    }
                    catch (Exception e) { Log.Write("PlayerExitVehicle: " + e.Message, nLog.Type.Error); }
                    return;
            }

        }
        private static void PlayerEnterCheckpoint(ColShape shape, Player player)
        {
            try
            {
                if (!Main.Players.ContainsKey(player)) return;
                if ( !player.GetData<bool>("ON_WORK") || shape.GetData<int>("NUMBER") != player.GetData<int>("WORKCHECK")) return;

                if (Checkpoints[(int)shape.GetData<int>("NUMBER")].Position.DistanceTo(player.Position) > 3) return;



                NAPI.Entity.SetEntityPosition(player, Checkpoints[shape.GetData<int>("NUMBER")].Position + new Vector3(0, 0, 1.2));
                NAPI.Entity.SetEntityRotation(player, new Vector3(0, 0, Checkpoints[shape.GetData<int>("NUMBER")].Heading));
                Main.OnAntiAnim(player);
                player.PlayAnimation("amb@world_human_gardener_plant@male@base", "base", 39);
                player.SetData("WORKCHECK", -1);
                NAPI.Task.Run(() => {
                    try
                    {
                        if (player != null && Main.Players.ContainsKey(player))
                        {
                            player.StopAnimation();
                            Main.OffAntiAnim(player);
                            var tryAdd = nInventory.TryAdd(player, new nItem(ItemType.pineapple, 1));
                            if (tryAdd == -1 || tryAdd > 0) Plugins.Notice.Send(player, Plugins.TypeNotice.Error, Plugins.PositionNotice.TopCenter, "Недостаточно места в инвентаре", 3000);                       
                            else nInventory.Add(player, new nItem(ItemType.pineapple, 1, ""));
                            var nextCheck = WorkManager.rnd.Next(0, Checkpoints.Count - 1);
                            while (nextCheck == shape.GetData<int>("NUMBER")) nextCheck = WorkManager.rnd.Next(0, Checkpoints.Count - 1);
                            player.SetData("WORKCHECK", nextCheck);
                            Trigger.ClientEvent(player, "createCheckpoint", 15, 1, Checkpoints[nextCheck].Position, 1, 0, 255, 0, 0);
                            Trigger.ClientEvent(player, "createWorkBlip", Checkpoints[nextCheck].Position);
                        }
                    }
                    catch { }
                }, 4000);

            }
            catch (Exception e) { Log.Write("PlayerEnterCheckpoint: " + e.Message, nLog.Type.Error); }
        }

        private static List<Checkpoint> Checkpoints = new List<Checkpoint>()
        {
        new Checkpoint(new Vector3(2830.65869, 4701.396, 45.5043449), 190.0567),
        new Checkpoint(new Vector3(2820.89014, 4713.809, 45.4104652), 330.1701),
        new Checkpoint(new Vector3(2804.42554, 4712.3916, 45.1695938), 181.3819),
        new Checkpoint(new Vector3(2797.189, 4703.55469, 44.9917145), 212.4535),
        new Checkpoint(new Vector3(2786.394, 4736.50049, 44.9526443), 296.01),
        new Checkpoint(new Vector3(2782.611, 4770.63135, 45.0343628), 14.9411),
        new Checkpoint(new Vector3(2790.533, 4787.96875, 45.25111), 330.3615),
        new Checkpoint(new Vector3(2812.73877, 4807.86768, 46.3578644), 217.2057),
        new Checkpoint(new Vector3(2811.41528, 4816.364, 45.9144859), 305.2057),
        new Checkpoint(new Vector3(2826.731, 4793.14746, 47.99354), 117.2057),
        new Checkpoint(new Vector3(2821.52124, 4766.19238, 46.5818863), 90.2057),
        new Checkpoint(new Vector3(2840.057, 4757.73633, 47.17172), 53.2057),
        new Checkpoint(new Vector3(2846.212, 4735.615, 46.7008476), 114.2057),
        new Checkpoint(new Vector3(2849.33472, 4711.2373, 45.77686), 52.2057),
        };
        internal class Checkpoint
        {
            public Vector3 Position { get; }
            public double Heading { get; }

            public Checkpoint(Vector3 pos, double rot)
            {
                Position = pos;
                Heading = rot;
            }
        }
    }
}
