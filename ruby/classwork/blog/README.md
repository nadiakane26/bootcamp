# README

This README would normally document whatever steps are necessary to get the
application up and running, but right now I'm running into several issues while going through the guide



1. Created Article is not shown/added -- Resolved
2. Anyone can destroy or create despite having the authentication 
3. Had issues with copying code  -- Resolved (Was copying version 8.0.0 onto 7.2.2 )
- `textarea` changed to `text_area`
- `params.expect(comment: [:commenter, :body, :status])` changed to `params.require(:comment).permit(:commenter, :body)`
    
    
4. Comments are not showing up -- Resolved