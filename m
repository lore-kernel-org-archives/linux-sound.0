From: Zwane Mwaikambo <zwane@linuxpower.ca>
Date: Mon, 21 Oct 2002 12:26:00 +0000
Subject: Re: /dev/dsp : no such device
Message-Id: <marc-linux-sound-103520484301557@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 21 Oct 2002, Venkat S wrote:

> Now, the problem is that, sometimes, when i send a trigger to the main thread to start the ring tone, i start the pthread for playing ringtone, and when i try opening /dev/dsp1, it gives me
> a perror with "No such Device". After some observation, I found that there seemed to some pattern. If I were to leave this program running for some time without any tone being played, and THEN provided an external trigger to start the tone, the open on the device always fails. On the other hand, if I were to continually toggle between playing and stopping the tone, it seems to work fine, without any issues.
> What am I doing wrong? and would any of you have any idea about the root cause.

Perhaps the driver is being 'autounloaded' ? Check with lsmod

	Zwane
-- 
function.linuxpower.ca

