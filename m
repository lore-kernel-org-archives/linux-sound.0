From: douglas irving repetto <douglas@roar.music.columbia.edu>
Date: Mon, 29 May 2000 23:16:12 +0000
Subject: Re: External Midi Interface
Message-Id: <marc-linux-sound-95964292229870@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95935805013460@msgid-missing>
In-Reply-To: <marc-linux-sound-95935805013460@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

"D. Marcus Johnson" wrote:
> 
> Hi,
> 
> Has anyone got an external midi adapter, that uses the
> serial port, to work. I am looking for something that
> will work with a laptop that doesn't have a joystick
> port. I only need 1 in 1 out.
> 
> Thanks
> 



i just recently got a midiator ms-124w (the w is important!) to work
using hacked up drivers that david topper has been working on.


http://www.midiator.com


driver:
ftp://presto.music.virginia.edu/pub/midiator



i'm using it with a dell inspiron 7500 laptop, and it works well. of
course it's a custom driver, so it doesn't work with any of the existing
sound/midi APIs at this point. i think dave is talking to people to get
this driver folded into some source trees.

douglas



-- 
                        douglas irving repetto 
                  http://music.columbia.edu/~douglas 
                the music-dsp mailing list and website:
                  http://shoko.calarts.edu/musicdsp
