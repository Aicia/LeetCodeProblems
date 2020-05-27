//https://leetcode.com/problems/unique-morse-code-words/submissions/
public class Solution 
{
    public int UniqueMorseRepresentations(string[] words) 
    {
        string[] morse = { ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.." };
            string[] trans = new string[words.Length];

            int i = 0;
            foreach (string s in words)
            {
                if(s != "")
                {
                    foreach (char c in s)
                    {
                        trans[i] += morse[c - 'a'];
                    }
                    i++;
                }
            }
        
            Dictionary<string, int> dict = new Dictionary<string, int>();
        
            foreach (string s in trans)
            {
                if (!dict.ContainsKey(s))
                    dict.Add(s, 1);
                else
                    dict[s]++;
            }

            return dict.Count();
    }
}