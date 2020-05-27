// https://leetcode.com/problems/valid-parentheses/

public class Solution {
    public bool IsValid(string s) {
        //Initial checks to prevent issues later
        if(s == "" )
        {
            return true;
        }
        if(s.Length % 2 == 1)
        {
            return false;
        }
        
        Stack<char> st = new Stack<char>();
        
        //List that contains all the open brackets
        List<char> left = new List<char>();
        left.Add('(');
        left.Add('{');
        left.Add('[');
        
        //List that contains all the closed brackers
        List<char> right = new List<char>();
        right.Add(')');
        right.Add('}');
        right.Add(']');
        
        char temp;
        
        //Begins iterating through string
        foreach(char c in s)
        {
            if(left.Contains(c))
            {
                st.Push(c);
            }
            else
            {
                if(st.Count > 0)
                {
                    temp = st.Pop();
                }
                else
                {
                    return false;
                }
                
                if(temp != left[right.IndexOf(c)])
                {
                    return false;
                }
            }
        }
        
        //Last validation before returning final answer
        if(st.Count == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}