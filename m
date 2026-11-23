Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426829;
	b=PxUJwJaWHSIEKEkO7uXzMYHsPFDio+mgabusDj0D2SPSZAb0ZxWmRoB8pLWxRmSbPBSo
	 5cuDfnCYImS0F3V92kcX8HdG/vaIvxD/l9/18KH2BMyCkkO+qr2hk2R84cS8yqsOhh12B
	 Aesbiih9q6S/Zqil1Ol/6qvJ8nxkTOskPfqXSK2ZBkGoP+tcK9Yl1qQ3kX0aGBh/I4mPA
	 YyTkbQpQT0xF0j5ye4FbczCmZMePCXlon4/svNH4M74iCN5MJD6AcVD066llfhQf+M/zO
	 5JpbcPqGDlNArUL18FGTe8G4yrm3ToEfhhnACtjUs7KMr9zT4RbBZ0v3x3kClYXoAHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iKskzoKZj9NRVAxwFO2tBMPVCpXNejSJ46PRl9iGtdA=;
	b=3S0cNP0pu1Ait/JlhHhxph6xbD7doRYB7+DhlgfwfpJXjz8rAJbxoUbq452mgS6D+73E
	 BKVEMuArheIwal1/AwJMJkiaHVkPiPgXmpoLt925xAgYojAnDPK0OB3CIoAKT/XflOmL9
	 9uQqNDAkFErTXojZ6isJ52T+waQog6zeaquRpiKGGDRpuVboZsAgwsi6Avi/a1dYPmsB8
	 O1vpfjryQhQPD8b7NL3dTtFa6sOeI0Y3SjhIUFAwMr/Yxqj47uPEUOSuys+qVDwuQnK9W
	 alP1YxifBYSasuToTFV4TuEBA/+5d2KigJ4CyTz794/cAKJ4oAJhuY71q7QBbC533bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XL206UDw;
	arc=none smtp.remote-ip=95.215.58.235
Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1812606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1812606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XL206UDw
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XrjFy0RnNK1OlKeHfhVMc79i/VFdZ8uvcsGtDK2aGoc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795426826; v=1; x=1796031626;
 b=XL206UDw9MRA5FYNUmu1g9jy3eZIDOUVeLkFjtxkHsPX+psN2F8Tyo6FcWV0CLDIZ6cDcKLg
 NUL6SKPxx9vjmYABOuscwtKFLdOEcb9yB9ZIXLWaqkvSHT1dLzHNZ8tuUmjen2Re3n/aTCfhsSO
 qtQNxv/GJkjdbKZ8/d2PzB68=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f269c79cfa28cc5b;
	Mon, 23 Nov 2026 09:40:26 +0000
X-Mizu-Trace-ID: f269c79cfa28cc5b
X-Migadu-Flow: FLOW_OUT
Message-ID: <a965bf35-5735-4ff4-90f5-9a85edf42a98@linux.dev>
Date: Mon, 23 Nov 2026 10:11:35 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sof_sdw Xiaomi Book Pro 14 TM2424 speakers randomly silent
 - SoundWire link 3 rt721+rt1320 bus clash
To: wqy <qianywu@gmail.com>, linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <59a8eaf5-d406-4996-8834-e45a8c45516f@gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <59a8eaf5-d406-4996-8834-e45a8c45516f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 07:37, wqy wrote:
> [BUG] sof_sdw: Xiaomi Book Pro 14 (TM2424, PTL) internal speakers randomly
>  go silent; SoundWire link 3 rt721+rt1320 reports bus clash / parity error
> 
> TL;DR
> -----
> Internal speakers on the Xiaomi Book Pro 14 2026 (TM2424, Panther Lake)
> randomly stop producing sound while PipeWire still reports RUNNING and
> the mixer state is untouched. dmesg shows Bus clash / Parity error on
> SoundWire link 3 (RT721 + RT1320). A card profile toggle (bus reset)
> restores audio without a reboot. No board match entry or DMI quirk
> exists for this machine, so the generic machine driver with function
> topologies is used.
> 
> Environment
> -----------
>   Machine   : XIAOMI Xiaomi Book Pro 14, board TM2424 V14E1,
>               SKU TM2424-77079
>   BIOS      : XMAPT4B0P0A0A (2026-06-17)
>   CPU       : Intel Core Ultra X7 358H (Panther Lake)
>   Audio PCI : 8086:e428
>   Kernel    : 7.3.5-2-cachyos (distro build, no external audio patches)
>   Userspace : PipeWire 1.6.11, WirePlumber, alsa-ucm-conf
>   Codecs link 3: 025d:0721:01 RT721, 025d:1320:01 RT1320
> 
> Boot log:
> 
>   sof-audio-pci-intel-ptl 0000:00:1f.3: No SoundWire machine driver found
>     for the ACPI-reported configuration:
>   sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x025d part_id 0x0721
>     version 0x3
>   sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x025d part_id 0x1320
>     version 0x3
>   sof-audio-pci-intel-ptl 0000:00:1f.3: Use SoundWire default machine driver
>     with function topologies
> 
> Loaded topologies: sof-sdca-jack-id0.tplg, sof-sdca-mic-id4.tplg,
> sof-sdca-1amp-id2.tplg.
> 
> Symptom
> -------
> Playback to the internal speakers works after boot, then at some point
> stops producing sound. Userspace sees nothing wrong:
> 
>   pactl:  State: RUNNING, Mute: no, volume 70%
>   amixer: 'Speaker' [on], 'rt1320-1 FU21' 87/87 (100%)
> 
> aplay / speaker-test also open the PCM and "play" without error.
> 
> Recovery (no reboot)
> --------------------
>   pactl set-card-profile alsa_card.pci-0000_00_1f.3-platform-sof_sdw off
>   sleep 1
>   pactl set-card-profile alsa_card.pci-0000_00_1f.3-platform-sof_sdw HiFi
> 
> Sound comes back immediately and no further link errors are logged. This
> is consistent with the bus reset described in
> Documentation/driver-api/soundwire/error_handling.rst ("after a number
> of such errors are detected the bus might be reset").
> 
> dmesg around the failure
> ------------------------
> Suspend/resume in the same boot: 01:46, 01:48, 01:50, 01:51, 10:28,
> 15:35, 20:27, 20:42.
> 
>   Nov 22 17:55:48 soundwire_intel.link.3: Bus clash for control word
>   Nov 22 17:55:48 soundwire_intel.link.3: Bus clash for data word
>   Nov 22 17:55:48 rt1320-sdca sdw:0:3:025d:1320:01: Bus clash detected
>   Nov 22 18:00:06 soundwire_intel.link.3: Bus clash for control word
>   Nov 22 18:00:06 soundwire_intel.link.3: Bus clash for data word
>   Nov 22 18:11:10 soundwire_intel.link.3: Bus clash for control word
>   Nov 22 18:11:10 soundwire_intel.link.3: Bus clash for data word
>   Nov 22 18:19:36 soundwire_intel.link.3: Bus clash for control word
>   Nov 22 18:19:36 soundwire_intel.link.3: Bus clash for data word
>   Nov 22 20:42:15 rt721-sdca sdw:0:3:025d:0721:01: Bus clash detected before
>     INT mask is enabled
>   Nov 22 22:01:22 soundwire_intel.link.3: Bus clash for data word
>   Nov 22 22:05:50 soundwire_intel.link.3: Parity error
>   Nov 22 22:05:50 soundwire_intel.link.3: Bus clash for control word
>   Nov 22 22:05:50 soundwire_intel.link.3: Bus clash for data word
>   Nov 22 22:05:50 rt721-sdca sdw:0:3:025d:0721:01: Parity error detected
>   Nov 22 22:09:50 soundwire_intel.link.3: Bus clash for control word
>   Nov 22 22:09:50 soundwire_intel.link.3: Bus clash for data word

best to file an issue here: https://github.com/thesofproject/linux/issues

This bus clash is a low-level electrical issue, so either the hardware
timings are borderline or the initialization sequence isn't done right.

> Notes:
> - The clashes at 17:55-18:19 have no suspend nearby, so this is not only
>   a resume path problem.
> - 20:42:15 is the resume instant; that one matches the known spurious
>   "clash before INT mask is enabled" pattern.
> - At 22:05 / 22:09 both master and slave report errors, i.e. actual data
>   word corruption on the wire.
> 
> Extra observation: -61 on the RT721 endpoints after the bus reset
> ----------------------------------------------------------------
> Right after re-initialising the card, the speaker path comes back but
> the jack/mic endpoints fail with -ENODEV:
> 
>   rt721-sdca sdw:0:3:025d:0721:01: ASoC error (-61): at
>     snd_soc_pcm_component_pm_runtime_get() on sdw:0:3:025d:0721:01
>    SDW3-Playback-SimpleJack: ASoC error (-61): at __soc_pcm_open()
>    Jack Out: ASoC error (-61): at dpcm_be_dai_startup()
>    SDW3-Capture-SmartMic: ASoC error (-61): at __soc_pcm_open()
> 
> Runtime PM state of link 3
> --------------------------
>   sdw:0:3:025d:0721:01: control=auto status=suspended
>   sdw:0:3:025d:1320:01: control=auto status=suspended
> 
> Both peripherals autosuspend (SoundWire clock stop) when idle; the
> silence occurs on the idle -> streaming transition.
> 
> Why I think it is not a hardware fault
> --------------------------------------
> - The same RT1320 plays fine right after a bus reset, no reboot, same
>   mixer values.
> - Both peripherals stay Attached; their controls remain readable.
> - No error is surfaced to userspace, which is the main annoyance.
> 
> Related reports on other PTL machines (same codec family, generic fallback)
> --------------------------------------------------------------------------
> - Lenovo Yoga Slim 7i 14IPH11 (83QM): rt721 + rt1320 on link 3, a ghost
>   RT722 in ACPI makes the default machine driver misbuild the card, -61
>   and silence; DMI quirk proposed (ptl_sdw_rt721_l3_rt1320_l3, and the
>   ghost must be dropped).
> - MSI Prestige 16 AI+ C3MG: RT1320 + RT713, silent internal speakers with
>   the generic fallback.
> - Surface Pro 11 (Intel): DMI quirk for a ghost RT1320.
> 
> On TM2424 there is no ghost RT722 - only 0721 and 1320 are enumerated on
> link 3 - so the Lenovo quirk does not directly apply.
> 
> Questions
> ---------
> 1. Is this a known SoundWire clock-stop/restart race on PTL with
>    RT721 + RT1320, or should TM2424 get its own soc-acpi match entry /
>    DMI quirk so the machine driver knows the two-peripheral layout?
> 2. Is -61 from snd_soc_pcm_component_pm_runtime_get() on the RT721
>    endpoints after a bus reset expected, or a second issue?
> 3. Would setting power/control = on for the link 3 peripherals be a
>    valid way to confirm the clock-stop theory? I am happy to test
>    patches, module parameters, or debugfs changes on this hardware.
> 
> Attachments
> -----------
> - alsa-info.txt     full alsa-info.sh dump
> - dmesg-audio.txt   filtered sof/sdw/rt1320/rt721 log
> - hardware.txt      DMI, kernel, lspci, aplay -l
> - card-info.txt     /proc/asound cards and pcm
> 
> Thanks,
> wqy <qianywu@gmail.com>

