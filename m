From: Thorsten Knabe <linux@thorsten-knabe.de>
Date: Fri, 29 Jul 2005 15:58:18 +0000
Subject: Re: [Alsa-devel] Re: [2.6 patch] schedule obsolete OSS drivers for
Message-Id: <Pine.LNX.4.61.0507291735500.31150@tek01.intern.thorsten-knabe.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
 <Pine.LNX.4.61.0507281636040.20815@tek01.intern.thorsten-knabe.de>
 <Pine.LNX.4.61.0507290849050.8400@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0507290849050.8400@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Adrian Bunk <bunk@stusta.de>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On Fri, 29 Jul 2005, Jaroslav Kysela wrote:

> On Thu, 28 Jul 2005, Thorsten Knabe wrote:
>
>> On Tue, 26 Jul 2005, Adrian Bunk wrote:
>>
>>> This patch schedules obsolete OSS drivers (with ALSA drivers that
>>> support the same hardware) for removal.
>>
>> Hello Adrian.
>>
>> I'm the maintainer of the OSS AD1816 sound driver. I'm aware of two
>> problems of the ALSA AD1816 driver, that do not show up with the OSS
>> driver:
>> - According to my own experience and user reports audio is choppy with
>>   some VoIP Softphones like gnophone at least when used with the ALSA
>>   OSS emulation layer, whereas the OSS driver is crystal clear.
>> - Users reported, that on some HP Kayak systems the on-board AD1816A was
>>   not properly detected by the ALSA driver or was detected, but there
>>   was no audio output. I'm not sure if the problem is still present in
>>   the current ALSA driver, as I do not own such a system.
>>
>> Maybe the OSS driver should stay in the kernel, until those problems are
>> fixed in the ALSA driver.
>
> The problem is that nobody reported us mentioned problems. We have no
> bug-report regarding the AD1816A driver. Perhaps, it would be a good idea
> to add a notice to the help file and/or driver that the ALSA driver should
> be tested and bugs reported to the ALSA bug-tracking-system.

Hello Jaroslav.

I'll do some testing during the upcoming weekend to confirm, that the 
mentioned problems still exist with the current ALSA release. Last time I 
checked was sometime around Linux 2.6.10. I'll file a bug report of my 
findings to the ALSA bug tracking system and contact the author of the 
driver. Initially I had not spent much time on those problems, because I 
had an alternative working OSS driver, but since removal of the OSS seems 
to get closer, it's probably time to fix these issues now.

Regards
Thorsten

-- 
___
  |        | /                 E-Mail: linux@thorsten-knabe.de
  |horsten |/\nabe                WWW: http://linux.thorsten-knabe.de
