From: Paul McGovern <isles@sevendust.org>
Date: Sat, 16 Mar 2002 01:04:16 +0000
Subject: es1370 i/o problem?
Message-Id: <marc-linux-sound-101624080129356@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello all! I have been fighting with this problem since I started using
this es1370-based card a few weeks ago, and everything I have tried has
been for naught.

Here is the problem: the card and kernel driver work perfectly fine under
most situations, however there seems to be a problem pertaining to the
blocking/non-blocking I/O of the driver. When one program is using the
device (i.e. xmms, playing mp3s) and another tries to access it, the
latter locks up and does nothing until the device becomes available (i.e.
when there is a pause between songs, or when I manually hit "stop"). The
end result is very annoying... when using a program such as GAIM with its
on-event sounds, I get hit with a flood of sounds (from people signing on
and off, and any IMs that have been received or sent) between songs. So
that's fine, I can disable the GAIM sounds since they didn't do much for
me anyway. However, the much worse problem is with Mozilla and the
Shockwave Flash plugin. If the audio device is in use, and Mozilla comes
across a page with anything written in Flash, the browser locks up
completely until the device frees up since the Flash player attempts to
access /dev/dsp even if the animation in question has no sound. With the
abundance of Flash-filled web pages these days, you can imagine that
listening to music while browsing the web can be a rather irritating
experience. I can disable the Flash plugin, but then every time I am on a
page with Flash, I get the lovely pop-up box informing me that I need to
download and install the plugin. It's basically a lose/lose situation. My
last sound card was an ISA ESS1688 AudioDrive, and it did not have this
problem... if the audio device was in use, the program trying to access it
would realize this and go on its merry way.

I have looked over the es1370 driver code to see if there was anything I
could modify which would solve the problem, but came up with nothing.
After talking to several people via IRC who are well-versed in Linux, I
still have been unable to resolve this issue. Thanks to all in advance for
any information you can offer.

--
Paul McGovern
http://isles.krad.org
Team Slow Northeast - http://www.teamslow.org

