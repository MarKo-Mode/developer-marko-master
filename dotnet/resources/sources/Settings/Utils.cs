using GTANetworkAPI;
using NeptuneEvo.Infodata;

namespace NeptuneEvo.Settings
{
    public class Utils
    {
        public static AccountData GetAccount(Player client)
        {
            return client.GetData<AccountData>("AccData");
        }
        public static CharacterData GetCharacter(Player client)
        {
            return client.GetData<CharacterData>("CharData");
        }
    }
}
