Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9197541A8F;
	Sat, 22 Nov 2025 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811254; cv=pass; b=K0k6MvVvrXt/HGWvNo/Te32VV43sR96sdzZM61gU9+H+tSsGsbCNthRmG8F2qpyK8znK9Fo0OMv7cFAa3DmV7losVgl0rfyJ866T+s9rAkSKPm9dtcQK9l4dplHBJuFKaK1WXiWqQyhQB30tsKZ16GPgJmqOaWV0gdwlp7hWYQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811254; c=relaxed/simple;
	bh=RzZsvQNweQg/LrbF8ygcLx5PJPRHssznEeRiPDOS/QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=k4e8cMkwylwMi3Q14/uhvYLvjpvOaJdbSQ7rWDY+1XCLcZuCxTqze++RLf1FNr2wt5V+et/FC7WhxX0j7rdhtRQenxBpP8d/ys2W/GYZjBGsLeCckL6V9X58w3vDpQA2X+tpO1i+W7FLbHt1PO97UY4i94Fpz1uuOD2Vfv4knsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=LUPIRqbV; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="LUPIRqbV"
ARC-Seal: i=1; a=rsa-sha256; t=1763811239; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K5n86TphLBBo7b1L6pGKtgSfDpJfvrX2ORBohPG2u8k2TTQ/UU1FTJLVvaYZFkX2M133MHvrUsQcEGw1DrWGkU9TKZeVBQjrX9e+pmMJ1tBX1nlSaChr7M0InRDlhVyeWTwuW0357Cs2oL34QlG0+rsWHiaL8TKZcyGRUkTVKZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763811239; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tBg6uuy4XcpmN39w1lGYeCRpN5eNkiEsxlfaifcChTs=; 
	b=MoxUaqQCPTEsh4eljAlJV+EdG448G8gPCBBvJdrsPltG8yh7gDQz73QnJybtLF3yEZQAEv9J97AaiVNp2wKiXVBZ3qwjJ4HBoZa6cz201E5e+ap1spV8RXcHy9Idd6FZrprO+tRZMRVVAVCk+LH584lYljIq89GZ20rCzifIUYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763811239;
	s=zmail; d=harin.net; i=me@harin.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tBg6uuy4XcpmN39w1lGYeCRpN5eNkiEsxlfaifcChTs=;
	b=LUPIRqbV0hkXOZnDm77RfmPJL8r4H8J/DzeUxF7MW+he1qPSkMpOWTQCPz5SK2lo
	NektzPcj1f02x5Yj7NLOx1IrCduIGemTF0DwFKhvp9kGlPX8SP2xy3vFIIc/F/vHAAx
	le+sGzvQFYPi/GSh4ii0i0tMeehQAzMBRqNTRq1pilfGdK1VU0yNxs5EmLshqcjrjAp
	9bycksVmBon2yvBnck/u7B9HqP0U0O+RD69Cn1RNE6qWu16yVcBymcYOoya/WsM9gFR
	qPtlDBGqh+GTFblF8NOYgegoGKOEJwS8qPSMdYhdvdAEwGATSeEviX+weEjtPbqe7//
	FqnifzQxOw==
Received: by mx.zohomail.com with SMTPS id 17638112361281021.1634634017535;
	Sat, 22 Nov 2025 03:33:56 -0800 (PST)
Message-ID: <cecd1398-b072-4830-9495-c4bf8d7a3570@harin.net>
Date: Sat, 22 Nov 2025 20:33:51 +0900
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
Content-Language: en-US
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
From: Harin Lee <me@harin.net>
In-Reply-To: <87o6oul8kf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Takashi,

The official Windows driver does not expose a specific mixer control
for this. It implicitly reserves RCA for stereo output and Front for
7.1ch surround, and simply appears as 'Speaker' device in the Control
Panel.

Please let me know if there are any additional points I should address
before I send v3.

Thanks,
Harin Lee

On 11/22/25 6:29 PM, Takashi Iwai wrote:
> On Sat, 22 Nov 2025 10:00:29 +0100,
> Harin Lee wrote:
>>
>> I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
>> safe due to the bounds check, I plan to switch it to 'unsigned int' for
>> strict correctness.
>>
>> I also have two questions regarding conventions:
>>
>> 1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
>> acceptable, or would you prefer a simpler name?
> 
> I personally prefer a simpler one, but maybe it'd be a question how
> this (or equivalent) control is called on Windows or other OS.
> If it's also "Dedicated Output", then we can use it as is, too.
> 
>> 2. CA20K2 port logic (on patch 6): The condition
>> 'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
>> the non-standard RCA port mapping. Does this line require additional
>> comments or a helper function for better readability?
> 
> Sure, a more comment wouldn't hurt.
> 
> 
> thanks,
> 
> Takashi
> 
>> Please let me know if you would prefer me to send a v3.
>>
>> On 11/22/25 12:22 AM, Harin Lee wrote:
>>> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
>>> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
>>> DAC for 7.1ch output, and a CS5364 ADC. This model differs
>>> significantly from other CA20K2-based variants.
>>>
>>> Since official driver support for this hardware was discontinued a long
>>> time ago, this patch series enables the card to be used on modern
>>> platforms.
>>>
>>> This patch series was developed using QEMU vfio tracing, and PCIe BAR
>>> dumps. Tested with analog output (up to 192kHz) and line/microphone
>>> input (up to 96kHz) at various sample rates.
>>>
>>> Changes in v2:
>>>    - Fix coding style issue (mixed declaration and code) in
>>>      dedicated_rca_put().
>>>
>>> Harin Lee (6):
>>>     ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
>>>     ALSA: ctxfi: Add ADC helper functions for GPIO
>>>     ALSA: ctxfi: Use explicit output flag for DAIO resources
>>>     ALSA: ctxfi: Refactor resource alloc for sparse mappings
>>>     ALSA: ctxfi: Add support for dedicated RCA switching
>>>     ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
>>>
>>>    sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
>>>    sound/pci/ctxfi/ctatc.h      |  8 +--
>>>    sound/pci/ctxfi/ctdaio.c     | 18 ++++---
>>>    sound/pci/ctxfi/ctdaio.h     |  3 ++
>>>    sound/pci/ctxfi/cthardware.h |  4 +-
>>>    sound/pci/ctxfi/cthw20k1.c   |  3 +-
>>>    sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
>>>    sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
>>>    8 files changed, 223 insertions(+), 62 deletions(-)
>>>
>>

