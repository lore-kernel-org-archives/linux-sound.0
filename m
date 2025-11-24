Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE62989B0;
	Mon, 24 Nov 2025 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003311; cv=pass; b=oq3vzhT2oNs0i6mdvq8zD1O2x2dQT+urcui84swmZQ+A3K7QaR7wMuaots88U9qRFIvZtty+mB7XQCr/4WhEDaRn5HTus6fRmaiBkTBl+3uP0VxaR8fOhpgnvkKiwXWCtvTJGHBvOyGWKRNiL8t5K9Qb8z8/uBeqtkE7w4llVcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003311; c=relaxed/simple;
	bh=qJmpGjVwimPXmqlkxrvy7otwbxzI3W89ViqO+2Uzb98=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=KVuxOk4MR0lxPkygFxNAPiHrO85IZ1DdNvedSaP4tnu4Drr6JwqA/ZfNhALwBHuVjv5lzhacDeToj6o55LdvqKI/nUocqpBDbPAyy2D83cDWdwI4I/e6MUb52CY5ZEtoAxO3Mq5vII1WJr3cyfAgzmIV9+RWvu0qKc8i2I3Bews=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=HnZygdtX; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="HnZygdtX"
ARC-Seal: i=1; a=rsa-sha256; t=1764003295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z//xtmpj8ufXYIShMVG10hFOhnANjPk9qLEL/A4beFyeCj5c58U7h9wuPaqMa2aMcI9VU0HT2uMql5WmczcYVPkNkLO0J78bnKP+c3KPWfNEklopxdwjmBi90Bn/MXGhwlgN18XDm8M3KuXik7LB82a8Fo/H/70y+Pv856lQuNI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764003295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SUzqdYk5DeMSz/q279LFrpIqBz8muri9CYYQRi8jj3Y=; 
	b=BlO0/ujcI+S4qMZgPnG7ErBlL6y6xzrA1AvHw69ynOnG2Tm/cOM2nRjOGizUmEpLmB0AvgM+yDORb0YK3HSvCtemOH0gyY5S9cRtY3lb1Nq8GzlgmCxJC5IQ8bJFyk76K1+fpG9EiKaFGd5W6KxCo43Ya2ilJBbJFYl8pr2Id2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764003295;
	s=zmail; d=harin.net; i=me@harin.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SUzqdYk5DeMSz/q279LFrpIqBz8muri9CYYQRi8jj3Y=;
	b=HnZygdtX45l5gjOmzeZl0uW9JCN0EL0II5wgqy3jBimz7P14MUJo144KjK20Ld+x
	3jCDvw3YwfuYm0OZJ36l4OWeKkPyKSPsf21xGK/LupdYRGxM116jw2ZSZGkGRas4puz
	qBSAIYH9GIDEMG4fptea1KEZXWOOq/MSQveHU67KBushPGA42qy0bRMHW5MCJ6U/+bv
	xGRDQ22w9GBNtgPKLl6nNSWuT1j7Z3qALFgsOHh1TC5GlZd1wnAAgy4/1wVrTP3PJZ5
	JKRhMa8sr6v7FKxy7cT6dkRlsXVKFgKanKK0BD7SZyYqaoigUEb9tLq2DMnPkC5p4jh
	hqowpLncRg==
Received: by mx.zohomail.com with SMTPS id 1764003291599118.16304253428655;
	Mon, 24 Nov 2025 08:54:51 -0800 (PST)
Message-ID: <5fbaa51e-8220-4350-b805-abd451cc7b16@harin.net>
Date: Tue, 25 Nov 2025 01:54:47 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
To: Takashi Iwai <tiwai@suse.de>
References: <20251121152221.1152523-1-me@harin.net>
 <4df3c2ac-88cd-42d1-9f1e-c5c2c5a2b00f@harin.net>
 <87o6oul8kf.wl-tiwai@suse.de>
 <cecd1398-b072-4830-9495-c4bf8d7a3570@harin.net>
 <87cy57hlk1.wl-tiwai@suse.de>
 <74ffacd4-437d-4df9-b068-a5ec2d051a5b@harin.net>
 <87zf8bpgs0.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
From: Harin Lee <me@harin.net>
In-Reply-To: <87zf8bpgs0.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Thanks for the suggestion.

Since this control only affects the routing between the RCA and Front
outputs (excluding S/PDIF), "Analog Playback Route" is the technically
correct name.

I will use "Analog Playback Route" as the ALSA control name and address
the points we discussed in v3.

Thanks,
Harin Lee

On 11/25/25 12:54 AM, Takashi Iwai wrote:
> On Mon, 24 Nov 2025 11:22:32 +0100,
> Harin Lee wrote:
>>
>> Thank you for the review.
>>
>> The SE-300PCIE features separate hardware routing and DACs for the
>> Hi-Fi RCA output and the 7.1ch Front output, unlike other X-Fi cards
>> where the Front port serves both purposes.
>>
>> While ALSA resources typically map 1:1 to hardware, exposing a separate
>> mixer for the RCA port would likely confuse users and applications
>> regarding which device to use as the primary output. Therefore, the
>> "Dedicated Output Playback Enum" control is designed to let the user
>> select which physical output port (RCA or Front) is used for the
>> primary output.
>>
>> If you could suggest a standardized ALSA Enum name for this control, or
>> any better method to handle this, please let me know.
> 
> So it chooses the exclusive output for the main playback streams?
> Then it could be something like "Master Playback Route".
> If it doesn't include the digital outputs like SPDIF, it could be
> "Analog Playback Route" or whatever, too.
> 
> 
> HTH,
> 
> Takashi
> 
>>
>> Thanks,
>> Harin Lee
>>
>> On 11/24/25 5:38 PM, Takashi Iwai wrote:
>>> On Sat, 22 Nov 2025 12:33:51 +0100,
>>> Harin Lee wrote:
>>>>
>>>> Hi Takashi,
>>>>
>>>> The official Windows driver does not expose a specific mixer control
>>>> for this. It implicitly reserves RCA for stereo output and Front for
>>>> 7.1ch surround, and simply appears as 'Speaker' device in the Control
>>>> Panel.
>>>>
>>>> Please let me know if there are any additional points I should address
>>>> before I send v3.
>>>
>>> Then maybe we should reconsider what exactly this control serves for.
>>> It's for a dedicated control for what and how?
>>>
>>> The dedicated mic stuff seems rather internal-only, so it wasn't
>>> explicitly exposed.  But when we expose this, it should look more
>>> intuitive.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>>
>>>> Thanks,
>>>> Harin Lee
>>>>
>>>> On 11/22/25 6:29 PM, Takashi Iwai wrote:
>>>>> On Sat, 22 Nov 2025 10:00:29 +0100,
>>>>> Harin Lee wrote:
>>>>>>
>>>>>> I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
>>>>>> safe due to the bounds check, I plan to switch it to 'unsigned int' for
>>>>>> strict correctness.
>>>>>>
>>>>>> I also have two questions regarding conventions:
>>>>>>
>>>>>> 1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
>>>>>> acceptable, or would you prefer a simpler name?
>>>>>
>>>>> I personally prefer a simpler one, but maybe it'd be a question how
>>>>> this (or equivalent) control is called on Windows or other OS.
>>>>> If it's also "Dedicated Output", then we can use it as is, too.
>>>>>
>>>>>> 2. CA20K2 port logic (on patch 6): The condition
>>>>>> 'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
>>>>>> the non-standard RCA port mapping. Does this line require additional
>>>>>> comments or a helper function for better readability?
>>>>>
>>>>> Sure, a more comment wouldn't hurt.
>>>>>
>>>>>
>>>>> thanks,
>>>>>
>>>>> Takashi
>>>>>
>>>>>> Please let me know if you would prefer me to send a v3.
>>>>>>
>>>>>> On 11/22/25 12:22 AM, Harin Lee wrote:
>>>>>>> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
>>>>>>> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
>>>>>>> DAC for 7.1ch output, and a CS5364 ADC. This model differs
>>>>>>> significantly from other CA20K2-based variants.
>>>>>>>
>>>>>>> Since official driver support for this hardware was discontinued a long
>>>>>>> time ago, this patch series enables the card to be used on modern
>>>>>>> platforms.
>>>>>>>
>>>>>>> This patch series was developed using QEMU vfio tracing, and PCIe BAR
>>>>>>> dumps. Tested with analog output (up to 192kHz) and line/microphone
>>>>>>> input (up to 96kHz) at various sample rates.
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>>      - Fix coding style issue (mixed declaration and code) in
>>>>>>>        dedicated_rca_put().
>>>>>>>
>>>>>>> Harin Lee (6):
>>>>>>>       ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
>>>>>>>       ALSA: ctxfi: Add ADC helper functions for GPIO
>>>>>>>       ALSA: ctxfi: Use explicit output flag for DAIO resources
>>>>>>>       ALSA: ctxfi: Refactor resource alloc for sparse mappings
>>>>>>>       ALSA: ctxfi: Add support for dedicated RCA switching
>>>>>>>       ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
>>>>>>>
>>>>>>>      sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
>>>>>>>      sound/pci/ctxfi/ctatc.h      |  8 +--
>>>>>>>      sound/pci/ctxfi/ctdaio.c     | 18 ++++---
>>>>>>>      sound/pci/ctxfi/ctdaio.h     |  3 ++
>>>>>>>      sound/pci/ctxfi/cthardware.h |  4 +-
>>>>>>>      sound/pci/ctxfi/cthw20k1.c   |  3 +-
>>>>>>>      sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
>>>>>>>      sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
>>>>>>>      8 files changed, 223 insertions(+), 62 deletions(-)
>>>>>>>
>>>>>>
>>>>
>>

