From: Dave Mielke <dave@mielke.cc>
Date: Thu, 18 Nov 1999 22:06:48 +0000
Subject: Re: AWE64
Message-Id: <marc-linux-sound-94296322115156@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91965172830159@msgid-missing>
In-Reply-To: <marc-linux-sound-91965172830159@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Great One on November 18, 1999, at 21:54]

>i'm using Red Hat Linux 6.0
>and i can't install sound blaster awe64 here
>when i run kernel configuration everything
>appears to be ok. the option creative sb awe32/64
>is checked but it doesn't work.
>
>does anybody know how to solve this problem ?

Have you run the RedHat tool "sndconfig" yet? It'll put all the right stuff
into "/etc/conf.modules", which you'll need or your sound card will not work.
If you've done that already, then let me know and I'll help you check out your
kernel configuration. Attaching a copy of your ".config" file to your next
reply would be helpful.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
