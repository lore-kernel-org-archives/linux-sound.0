Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFBA315D46
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 05:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135700; cv=none; b=XCpyUODYUDBugjRhRtb8IuWvHs4qJ5Yv3xN6xnx15yw4kt84wfQt2M9uSBIxOkp7ke4r/1GVk70U7I5Cgg2NHQ9bdQ4o59KMRoDeOB4blrYEzyp0lNdoBG8Ay2m+vAk4k/amGGL0wdSRh2Vzi0+9p7a7pUHc9BN0QTCTFtsaOnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135700; c=relaxed/simple;
	bh=w+GCPoK6vKDYdVM8F+WmoYsVXtZdV+F+ghfv4NXUTi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIGUdi+X7DENHszeCR0UprAc/1amEUn/eA/wvI8XCwmI5H4AGsmJSMCVr4TZq21IMWz+BFGyaWS/ivqth3gUi4Xw/efkr7B7fxntzgxoue0KkNqlSOQUy1R6Fdk4SEuIBU2hw2pzhWuYgYL6dudgQpA4DciDdI0KypfEk68/nyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SnhS56LZ; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SnhS56LZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764135641;
	bh=/gwjEQMk/Yo5KBkc/LXDJgVHq6lvgHxRTg+8YFy7p74=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SnhS56LZl3NYVBsu6oMJQBgwtOTcIvFQnwtCNnkc1KkRNgpsH8nA6CRz0PnCP6gTi
	 vpmDRMwLDdoCj79ykTT3wW8ePzaWHQa004LLDSa/qyMuqrfxShoupgJpg0SIGtH3PG
	 FYN2GJ+cFAoK3OYEEv1JBzf6pkrr3B2Qnfujo6BQ=
X-QQ-mid: zesmtpgz8t1764135635tf64b3cbb
X-QQ-Originating-IP: BxXmP65tf00gSjbt4Ib7b8lwZb0mOFymBmlLaCjkzm8=
Received: from [198.18.0.1] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 13:40:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2847395909065401198
Message-ID: <8E36970AA2645815+2ca6c6a0-7492-4636-84af-52c5cea87fdd@uniontech.com>
Date: Wed, 26 Nov 2025 13:40:33 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement jack detection for HP Thunderbolt Dock G2
To: Tasos Sahanidis <tasos@tasossah.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Jan_Sch=C3=A4r?= <jan@jschaer.ch>
References: <20251126003805.2705503-1-tasos@tasossah.com>
 <84FC3BDF7EA9F69A+14dcb273-e661-49b7-8609-020c3cf79eb7@uniontech.com>
 <74e957bb-95f9-428f-92f8-ad6fcb4becba@tasossah.com>
Content-Language: en-US
From: Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <74e957bb-95f9-428f-92f8-ad6fcb4becba@tasossah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MhJ5K6/MvAhhGHtF4ew99VJgmMd234YxtDJE4uvHyCAgaS6NPlWTgnb/
	lEoO4g6ujchF13iMquhm+AqdkrpFg1drbdJMvNQRdKsOrQmZ6nYh5SbBmDhtFWVNJakA1xt
	NnMDMIdmsmpDo3b5V6+yccJBWBYWF02qeiqVtgg9fQba/Aog69wcjPHxrVIbPvnctoB/62u
	k1EARK8DUJGYM7OErIdZkNFBuqWoJDUJBGMCFXqxCV8fSAx5XCDKF1BUAtdiIMh+WSjvTlo
	ByJ4DG1Bbe91ik4UTRCDDg/CMY0TkDPUmp1R2oV2KXv0pnZYi0sT+O25+P12R74MiONtoLW
	1d0APkt3fxlwCe5iv7xeJCPx1BkhuYL2ogoYD4IzMqwgVpE77GMHaqMgRw1nNzXYTXsgIsQ
	LHg/c177Ks59b0cmCbs2ULhzz3Rs9brKLF9zF/O7g4u/C9c2iEkDNAevOS14QpYNEiJkL2f
	4wUnOUM8C2Kp8lLkUa9s0rDjf2kLHO5lt+oRlyatzi7I7sK7411fdgR+GkQSUzzT72lpO6P
	NkYMgnWg0dn3L6h8w8pxLPIBtJ7tHej05HqvCefHozTDELbZHCabh8KTXQUFWDCENXzgPPM
	pl0rEI54gMuhZCzFMnd/aokrhGAU71eXryGgkKuvDIIfHc6uVbkESWpMrHNvqSbbFblX3rG
	AeAhXoB0huAzy1f1toTG2/Pzh555mhgz1TKlBmfMiexNlAXRZJVmZAy3+KzDTOMv0rjfQW2
	u0dq0iE//DiHhHi5amAnG3ZNOKW6Hw/qPt05rsc6Uk3HX7SfGWEGkd8uZMqd0Sc+6l9W7hC
	u4Goyb6wieoKtfOtnqWRsrppTacf4jyO1GgbgNKmRM29DnQKW0vR2RKtiy7Ztj3BOrwdH0X
	MfrtD5KsoWzGabhtzt6Ziblhg3DODtr2vA0ypFVxvg6h12y/1C6hla/1O0PEEpetFwqOymH
	gg0+lZjugWZcAsIj84IR08pVPrKap3Ic57PG1/UVHXRsJJrod6FX/T24IEx3icHFrAuLRMu
	JyrHBElpLzpOMOv2s3pbYc5V/AK5EnS4vBYnfB0Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0



On 26/11/2025 11.36, Tasos Sahanidis wrote:
> On 2025-11-26 04:58, Cryolitia PukNgae wrote:
>>
>>
>> On 26/11/2025 08.29, Tasos Sahanidis wrote:
>>> This series adds jack detection support for the HP Thunderbolt Dock G2.
>>>
>>> The first patch modifies the existing realtek quirk for the Dell WD15/19
>>> docks to allow changing the commands/algorithm used for jack detection.
>>
>> Does the HP Thunderbolt Dock G2 use a realtek chip?
> 
> Yes, it does. When plugged in, it loads RtUsbA64.sys.
> 
> Looking up a teardown online, it appears to be an ALC4102, however I
> could not locate any public information about it. The only other Realtek
> IC in the dock is the NIC (RTL8153).
> 
> lsusb doesn't reveal much, either:
>   idVendor           0x03f0 HP, Inc
>   idProduct          0x0269 USB Audio
>   bcdDevice            0.17
>   iManufacturer           3 Generic
>   iProduct                1 USB Audio
> 
> I am unsure if this is an HP specific jack implementation (in firmware)
> or if Realtek changed it for some devices.

The ALC4102 is widely used in a wide variety of devices. As far as I know,
this chip has programmable firmware that allows downstream manufacturers
to customize its behavior. I'm curious to what extent this jack detection
implementation can be generalized to other devices that also use the
ALC4102. Perhaps we can examine its behavior under operating systems like
Windows? Does Windows have a similar jack detection function, and is this
function provided by HP or Realtek's driver?

>>> The second patch implements the detection for the HP dock.
>>>
>>> This series was tested against both a WD19TB, with no regressions, and
>>> an HP TB Dock G2 without the optional USB speaker audio module. The
>>> module shows up as an additional USB device, so this should not affect
>>> its functionality.
>>>
>>> Tasos Sahanidis (2):
>>>   ALSA: usb-audio: Modularize realtek_add_jack in mixer_quirks
>>>   ALSA: usb-audio: Implement jack detection for HP Thunderbolt Dock G2
>>>
>>>  sound/usb/mixer_quirks.c | 122 ++++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 115 insertions(+), 7 deletions(-)
>>>
>>
>> thanks
>>
>> Best regards,
>> Cryolitia PukNgae
>>
> 
> 

thanks

Best regards,
Cryolitia PukNgae

