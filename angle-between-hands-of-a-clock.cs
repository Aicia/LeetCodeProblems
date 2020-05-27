
//https://leetcode.com/problems/angle-between-hands-of-a-clock/submissions/
public class Solution {
    public double AngleClock(int hour, int minutes) {
        
         
        double minangle = 6 * minutes;
        double hrangle = 30 * hour + .5 * minutes;
        
        
        double angle = 0;
        
        if(hrangle <= minangle)
            angle = minangle - hrangle;
        else
            angle = hrangle - minangle;
        
        if (360 - angle < angle)
            return 360-angle;
        else
            return angle;

    }
}