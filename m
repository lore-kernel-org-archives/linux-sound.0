Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268702522A4
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464024; cv=none; b=nPIV75Qp+c1QFRcT/3w6K1cJdB34RyRnwC0B0kUXynyb1um0pborQD6yj9qwfgwrln0Dnc1/k1VDRUKRn1093APuBa3Uw/CvmeJkeqpdOcpGfMGe6Ud4y9UQ/nRxJu1MkBU/kP7IarQB66bonrYb5WDgKSCg5ag+JfjGmkgmuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464024; c=relaxed/simple;
	bh=U6HfvVV1QbOaz3N9AgeLi3s3AhYnk2nZ+3MMftI68Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMVc6Q9mjS/LEJ9n4xcCQ+Ox99wtwv1q4fqsmGCsMau7v67mXE3ANcjo52COKLaC7BR3+FAgQKWTBsSZCZU3lJCm7u7zlkZVuPbMKJADAB6pLQdB5dAV6oqWPTCEliUJTiY1q340lElK39XXMgcUfWKb2heNFFKHa8ZFAEMWpcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.191.14] (unknown [61.8.147.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 08DCC61E647A7;
	Mon, 09 Jun 2025 12:13:17 +0200 (CEST)
Message-ID: <50c64ad3-960f-4837-a815-9839e49c93c0@molgen.mpg.de>
Date: Mon, 9 Jun 2025 12:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: C10 C-State possible when playing music on a laptop?
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
References: <51fbfbce-cbc9-4e7f-9ce0-0653379ef9f1@molgen.mpg.de>
 <08af40c9-25dc-4b11-9406-4a697e294fe9@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <08af40c9-25dc-4b11-9406-4a697e294fe9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Amadeusz,


Thank you for your insightful reply.


Am 09.06.25 um 10:40 schrieb Amadeusz Sławiński:

> First thing to check would be which driver is used on your machine?
>   lspci -k -d 8086:9d71
> Most likely it is snd_hda_intel.

Indeed it is.

     $ lspci -k -d 8086:9d71
     00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio 
(rev 21)
     	Subsystem: Dell Device 075b
     	Kernel driver in use: snd_hda_intel
     	Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_skl

> However looking at your device ID, your HW most likely has DSP support, 
> which should allow some power savings.

Indeed, there are some power savings. But according to PowerTOP’s *Idle 
stats* it only reaches Pkg(HW) C8 (pc8) instead of C10 (pc10), and 
*Device stats* shows:

   2.87 W    100.0%        Audio codec hwC0D0: Realtek (pipewire )

> If your BIOS has not blocked it, you should be able to change to DSP driver:
> # cat /etc/modprobe.d/avs.conf
> options snd_intel_dspcfg dsp_driver=4

Interesting. Thank you. Is there a way to check, what is automatically 
detected? Linux only logs:

     $ sudo dmesg | grep -i dsp
     [    0.019197] ACPI: SSDT 0x00000000651B6150 000161 (v02 INTEL 
HdaDsp   00000000 INTL 20160422)

Sorry for not providing the Linux messages the first time [1][2].

> You also need FW and topology files, usually should be provided by your 
> distribution by default. (If not I can give locations)

I am using Debian sid/unstable, so they should be installed for this 
“old” laptop.

> It should result in some power savings, as it is DSP which handles audio 
> signal then.

I’d be interesting, if that means C8 C-State at most, C10 C-State would 
be possible.


Kind regards,

Paul


[1]: https://alsa-project.org/db/?f=581ebf765fdb72b49922bc5d964ed25270e2c7b5
[2]: //linux-hardware.org/?probe=1373c64db3


> On 2025-06-08 14:57, Paul Menzel wrote:

>> On an Intel Kaby Lake Dell XPS 13 9360 with
>>
>>      $ lspci -nn -s 00:1f.3
>>      00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio [8086:9d71] (rev 21)
>>
>> and
>>
>>      Codec: Realtek ALC3246
>>      Address: 0
>>      AFG Function Id: 0x1 (unsol 1)
>>      Vendor Id: 0x10ec0256
>>      Subsystem Id: 0x1028075b
>>      Revision Id: 0x100002
>>
>> Playing music, for example a song, the system does not enter the 
>> lowest C-State C10 (pc10)¹ according to PowerTOP. No having heard 
>> something about off-loading support, I wanted to ask, if on x86 
>> laptops, the hardware would support C10 C-State when (just) audio is 
>> used. If yes, what would be needed on the software side?
>>
>>
>> Kind regards,
>>
>> Paul
>>
>>
>> ¹ In general it can only be entered after running the command below on 
>> that device.
>>
>>      $ echo 8 | sudo tee /sys/kernel/debug/pmc_core/ltr_ignore && sudo powertop --auto-tune
