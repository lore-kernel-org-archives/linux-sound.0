Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43886221DB3;
	Mon, 24 Nov 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979777; cv=pass; b=e0YdGsD2mV7VVSn4Mn5YPpX8gzX6g88s2qs1O3d7KXjWph6rGQI7VVxCCVxTTXviaWR956a2BdE3aT4lN1uEzIlbnHB/IcVYePiB5q973pPG8RJ9B/Aj9POM1qLssJ/ooA37AnPlVCwCUD/DXQVDbWQSvZmd1XsmncHQeWHYm08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979777; c=relaxed/simple;
	bh=760Vj88hBnbM4i4nKFL7RZjo8YDonogYi33dPdZkCH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=m7Wlswp/T7q2qhSA2QcFWA2CSlFhi0LjT1nYNw3V278Fm2NWbSqsZU5n9eNl6tbE1XbjrBvWMdIeC76Q5dfk3Q+8OLTolU1xMyvjedHX0lJt+eUD8iI0mor2tUb6M6yVSqgxfsC6TYTHazdsCdExzRG/+zS0eG2X2ZqeFvx2lL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=eJW/hQlv; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="eJW/hQlv"
ARC-Seal: i=1; a=rsa-sha256; t=1763979759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=apSurWVOnRWH2HRCSeskMB/qK5px/KdfiUff6eavuBKrLQdSt/9YdVoYMxL0ynKeK4KXS2nit1QmJaRFIevBcl7lm0PCCL0qPybjp6BpRLQanaTG+6cI7XonmLk6221ybhXF18sYy9iXo+Jrqqz5bVHCAdV9CLsuLExAZZWQ+wE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763979759; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xwbT75EhxZ15RziblH5Fj9hqkKDKr8+ZTzs0nBG87W8=; 
	b=Zo8HeM8A2XzRfsPxoaUcnY8ZK/nc/8BF2yQUJ+I6FomLQXGXZlDxJlHCzYSTD90fOoRZNixYk1aIEXD/KsylSLyzV05y5YLhkg8RrXEFiftjYpTHdYY9twOXrSNhcNMXwsk0+NyNz6nnlzpiH1cnP4wov8hzO2w1QT9pD6LaGf4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763979759;
	s=zmail; d=harin.net; i=me@harin.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xwbT75EhxZ15RziblH5Fj9hqkKDKr8+ZTzs0nBG87W8=;
	b=eJW/hQlvdyVzSKP7/KjA9T0ZGm83fi333ERJhFLLSE2QvuVOis6fvTSKjLsVMvBu
	CvGIR0ESjNWeBG7wYl8Xv3240mz7dU4Bfl+l4NlNCJ4hInC3PIPrVu9eG9S5OADtqsg
	MZzp6ld9Uz1sCDeM4nwsswBCCz8loA9OOtn3dLub0rujx/6UwrAxc4ZjW44HVplE6mN
	eTg+H5aaNfr/j3EhPKYn0oWAOuU0BQFGPg6PamW7MDM3uzAOEvKwqA6hAaGhkwtOSjT
	NcAIS7Oj3x9LBwVWBTpkNn3ayxA1W6e9oSl4wdqjm1X4NvmMzWMPOLgmpN+tnpfNNkV
	iEpH7mhqbQ==
Received: by mx.zohomail.com with SMTPS id 1763979756445859.3189943918745;
	Mon, 24 Nov 2025 02:22:36 -0800 (PST)
Message-ID: <74ffacd4-437d-4df9-b068-a5ec2d051a5b@harin.net>
Date: Mon, 24 Nov 2025 19:22:32 +0900
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
Content-Language: en-US
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
From: Harin Lee <me@harin.net>
In-Reply-To: <87cy57hlk1.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Thank you for the review.

The SE-300PCIE features separate hardware routing and DACs for the
Hi-Fi RCA output and the 7.1ch Front output, unlike other X-Fi cards
where the Front port serves both purposes.

While ALSA resources typically map 1:1 to hardware, exposing a separate
mixer for the RCA port would likely confuse users and applications
regarding which device to use as the primary output. Therefore, the
"Dedicated Output Playback Enum" control is designed to let the user
select which physical output port (RCA or Front) is used for the
primary output.

If you could suggest a standardized ALSA Enum name for this control, or
any better method to handle this, please let me know.

Thanks,
Harin Lee

On 11/24/25 5:38 PM, Takashi Iwai wrote:
> On Sat, 22 Nov 2025 12:33:51 +0100,
> Harin Lee wrote:
>>
>> Hi Takashi,
>>
>> The official Windows driver does not expose a specific mixer control
>> for this. It implicitly reserves RCA for stereo output and Front for
>> 7.1ch surround, and simply appears as 'Speaker' device in the Control
>> Panel.
>>
>> Please let me know if there are any additional points I should address
>> before I send v3.
> 
> Then maybe we should reconsider what exactly this control serves for.
> It's for a dedicated control for what and how?
> 
> The dedicated mic stuff seems rather internal-only, so it wasn't
> explicitly exposed.  But when we expose this, it should look more
> intuitive.
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Thanks,
>> Harin Lee
>>
>> On 11/22/25 6:29 PM, Takashi Iwai wrote:
>>> On Sat, 22 Nov 2025 10:00:29 +0100,
>>> Harin Lee wrote:
>>>>
>>>> I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
>>>> safe due to the bounds check, I plan to switch it to 'unsigned int' for
>>>> strict correctness.
>>>>
>>>> I also have two questions regarding conventions:
>>>>
>>>> 1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
>>>> acceptable, or would you prefer a simpler name?
>>>
>>> I personally prefer a simpler one, but maybe it'd be a question how
>>> this (or equivalent) control is called on Windows or other OS.
>>> If it's also "Dedicated Output", then we can use it as is, too.
>>>
>>>> 2. CA20K2 port logic (on patch 6): The condition
>>>> 'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
>>>> the non-standard RCA port mapping. Does this line require additional
>>>> comments or a helper function for better readability?
>>>
>>> Sure, a more comment wouldn't hurt.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>> Please let me know if you would prefer me to send a v3.
>>>>
>>>> On 11/22/25 12:22 AM, Harin Lee wrote:
>>>>> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
>>>>> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
>>>>> DAC for 7.1ch output, and a CS5364 ADC. This model differs
>>>>> significantly from other CA20K2-based variants.
>>>>>
>>>>> Since official driver support for this hardware was discontinued a long
>>>>> time ago, this patch series enables the card to be used on modern
>>>>> platforms.
>>>>>
>>>>> This patch series was developed using QEMU vfio tracing, and PCIe BAR
>>>>> dumps. Tested with analog output (up to 192kHz) and line/microphone
>>>>> input (up to 96kHz) at various sample rates.
>>>>>
>>>>> Changes in v2:
>>>>>     - Fix coding style issue (mixed declaration and code) in
>>>>>       dedicated_rca_put().
>>>>>
>>>>> Harin Lee (6):
>>>>>      ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
>>>>>      ALSA: ctxfi: Add ADC helper functions for GPIO
>>>>>      ALSA: ctxfi: Use explicit output flag for DAIO resources
>>>>>      ALSA: ctxfi: Refactor resource alloc for sparse mappings
>>>>>      ALSA: ctxfi: Add support for dedicated RCA switching
>>>>>      ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
>>>>>
>>>>>     sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
>>>>>     sound/pci/ctxfi/ctatc.h      |  8 +--
>>>>>     sound/pci/ctxfi/ctdaio.c     | 18 ++++---
>>>>>     sound/pci/ctxfi/ctdaio.h     |  3 ++
>>>>>     sound/pci/ctxfi/cthardware.h |  4 +-
>>>>>     sound/pci/ctxfi/cthw20k1.c   |  3 +-
>>>>>     sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
>>>>>     sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
>>>>>     8 files changed, 223 insertions(+), 62 deletions(-)
>>>>>
>>>>
>>

