From: Venkat S <venks@surffast.com>
Date: Tue, 22 Oct 2002 03:56:16 +0000
Subject: Re: /dev/dsp : no such device
Message-Id: <marc-linux-sound-103525919530082@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103520484301557@msgid-missing>
In-Reply-To: <marc-linux-sound-103520484301557@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi
 
Yes, I checked lsmod. the sound module had been autounloaded,
but the next open(/dev/dsp) resulted in the drivers being 
loaded, and hence the open succeeded. this, although i had the 
program waiting for the external trigger for quite some time(the
problem scenario). Now i am lost!
 
So, do you think there could be a problem with open() failing
before the insmod of the sound modules can complete?
 
venkat


--- Zwane Mwaikambo <zwane@linuxpower.ca> wrote:
>On Mon, 21 Oct 2002, Venkat S wrote:
>
>> Now, the problem is that, sometimes, when i send a trigger to the main thread to start the ring tone, i start the pthread for playing ringtone, and when i try opening /dev/dsp1, it gives me
>> a perror with "No such Device". After some observation, I found that there seemed to some pattern. If I were to leave this program running for some time without any tone being played, and THEN provided an external trigger to start the tone, the open on the device always fails. On the other hand, if I were to continually toggle between playing and stopping the tone, it seems to work fine, without any issues.
>> What am I doing wrong? and would any of you have any idea about the root cause.
>
>Perhaps the driver is being 'autounloaded' ? Check with lsmod
>
>	Zwane
>-- 
>function.linuxpower.ca

_____________________________________________________________
Surf the Web with SURF FAST.com ---> http://www.surffast.com

_____________________________________________________________
Select your own custom email address for FREE! Get you@yourchoice.com w/No Ads, 6MB, POP & more! http://www.everyone.net/selectmail?campaign=tag
