namespace CoffeeShop.File
{
    public class FileIO
    {
        public static string path = "./CSharp.json";

        //save to file
        public static void SaveToFile(string data)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(path))
                {
                    writer.Write(data);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        
    }
}