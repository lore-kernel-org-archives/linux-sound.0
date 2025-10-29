Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A719A288
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761902; cv=none; b=UPKzz/eoJl1TLiNL2HU4LO+WQUb9a37VGGKyEV8BUgKnlEALwHKR3OQBqUoe2GYj5acKwcktgHftsxTZAuATfRrFnp/T53xU8DOEanPKbmqVyAEBAP4n4/2nc16wo841J8ZJwdDIycDOl0rlCHR6KWGR9y5TbozmigZteK6pyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761902; c=relaxed/simple;
	bh=ooacL6JlPaVFf5YvOxGwwAwuM7qsq5PLFLhcu6sftmA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WOY9Z+UgKTzaE+r9Xd7Fzu/5E9VGVvrIxv4yopFj/lyn2SfcK04JV930yH9a8NFCB3Sdzom7opwOWuXqk2hrRlwkecbzxGWQfB+Bw0MmfmP1EsXcg07mEcBF7Kfy3N9keWn1v8F+nTx3xqLlLCG6k0vg7Z8hKOeaUcYVrgsYwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nadim.email; spf=pass smtp.mailfrom=nadim.email; dkim=pass (2048-bit key) header.d=nadim.email header.i=@nadim.email header.b=vkf48/08; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OkvzfVFB; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nadim.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nadim.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nadim.email header.i=@nadim.email header.b="vkf48/08";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OkvzfVFB"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 7217F1D0015C;
	Wed, 29 Oct 2025 14:18:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 29 Oct 2025 14:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nadim.email; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1761761898; x=1761848298; bh=8y
	s6EZhWEYnhZTsMojjCxqs5ttIiY2Z7LRFyy/3Hq9k=; b=vkf48/08q7BbnGaL0E
	9VdfA1bPY+yKBg5actnkrJP7atHtQM0J+nelCTM+Xc2fxCULFxvp6OHAHH+mnmGy
	ViiZoftAC3YGduvvClvTvYfZrJkp4EjkXYavvzr3Gnk/FIbX8KWI3vxE7E4OzySN
	7PBgfVndWYnTAducopIh/1NgTz4eDrOE49O7nqhty88ENr7wODXX1AH6K41awmDX
	+Bg8af+EoIhjW7f6cWbVFrUNMC6QNZdzBH5ZHywanwJyajjJH9pA7qO/zW9rf4o2
	dlhJHYFK7QN5kj83cVruQcfrY7kJn+tWiB59rKb90LwS1IaXnOkRTm/V4gkTptuL
	LElg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1761761898; x=1761848298; bh=8ys6EZhWEYnhZTsMojjCxqs5ttIi
	Y2Z7LRFyy/3Hq9k=; b=OkvzfVFBXBRml7YTgctmoMEAZhGX7Fi+eCAQU8zkqCBJ
	hw3r2pDOc/er8gEfZ5qnhx63Bd93dSrDs/VzfrCgmsmrhQEI92E+YiZoHFpg8CN4
	EgI6mGCduZojzoncEVnAnvnJbggYN5KYV9U1vEoBIHITFG07CSv6h2Q0nUBfiPda
	OKdnJh+9+/e6HRLYjDHK0CBelg45LlIWYOrwBwaxFGdcFgEsDPPVLFPVMh7mo+3P
	XC+ryrf51Bn0deHDHyb7erkLNe+FMiwVRgodIi0HyHQNHD6cieBQI8Bu6yRamdOt
	c0hDal8w42DnfNf28D5JaT0vYc4Uv+cDUPmnjT+9RA==
X-ME-Sender: <xms:aVoCaSzYY0SM1l41FOL-B7mMNxhIeUUg-BZ863IUFi7dQzR93XC7DQ>
    <xme:aVoCaWAWFSyYkMx_nHnKoDYQEsnE9odR0IlLDVV-58LnDjhR3Xyt850TDZ5BMYfGi
    kr9z6cleilnwB-ZnwoZEn85WIjntTqDUY6S5fL7twPjboSX2UOGNf0>
X-ME-Received: <xmr:aVoCaXZC9gFLtEQMTgJXoX69_LWOsxJ1RHGMI2XjODCyAbKIlUZhvcyB1ROM3krb6pI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeggeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvvefhufgtgfesthekredttd
    dvjeenucfhrhhomheppfgrughimhcumfhosggvihhsshhiuceonhesnhgrughimhdrvghm
    rghilheqnecuggftrfgrthhtvghrnhepieefhfegleekfeeutedtledtudevuefhfedvle
    dvvdffgeejffevvdeihfefteefnecuffhomhgrihhnpehtphhlghdrhhhofidpkhgvrhhn
    vghlrdhorhhgpdhgrghruhgurghlihhnuhigrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhesnhgrughimhdrvghmrghilhdpnhgs
    pghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugi
    dqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtihgrfihi
    sehsuhhsvgdruggvpdhrtghpthhtohepphgvthgvrhdruhhjfhgrlhhushhisehlihhnuh
    igrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:aVoCaWjR6bh8f3YyVjSCrzzHv41QZiE6yMBm4Tiw-iA4Ws67Z04nIQ>
    <xmx:aVoCaR6jZHciUNA9lk4rd42H2r_Y-4J21odBsC2p5q4EcIQuPQHDng>
    <xmx:aVoCaV4oPQdHGwSplzSCXz0FI7e-Fa9xdD2WesEs1M182_l0WhnJUA>
    <xmx:aVoCadex4C8afHdU1BbrPl5IMykjyDT66oDAd5X5VtddJHwDjK2IsA>
    <xmx:aloCaVyHtemjiglFzcCZ2Easv1EgjGmZIV7KNUDmqVFBpXGlfIAaA4Sn>
Feedback-ID: ica9149ee:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 14:18:17 -0400 (EDT)
Message-ID: <2a5892fb-7858-48f1-a91c-1f3ff4a3a9e0@nadim.email>
Date: Wed, 29 Oct 2025 20:18:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: tiawi@suse.de, peter.ujfalusi@linux.intel.com
From: Nadim Kobeissi <n@nadim.email>
Subject: [HELP NEEDED] Legion Pro 7 16IAX10H - Missing ALC287+AW88399 topology
 and quirks
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear linux-sound group and Mr. Takashi Iawai,

I was advised to contact you by Mr. Péter Ujfalusi from Intel after 
reporting the audio issues being faced on the Lenovo Pro 7 16IAX10H on 
the Sound Open Firmware (SOF) mailing list.

The issue is as follows:

Right now, the laptop speakers on the Lenovo Legion Pro 7 16IAX10H 
(subsystem ID 17aa:3906/17aa:3907) do not work. This laptop uses an 
Intel Arrow Lake-S platform with:

- Codec: Realtek ALC287 (detected as ALC287, but listed on the spec 
sheet as ALC3306)
- Amplifiers: Awinic AWDZ8399 (x2) on i2c-2 at 0x34 and 0x35
- ACPI device: _SB.PC02.I2C2.SPKR with device ID “AWDZ8399"

Current Status:

The good news is that the snd_soc_aw88399 codec driver exists (kernel 
6.7+) and successfully binds to the I2C devices. When I force SOF with 
snd_intel_dspcfg.dsp_driver=3:

- sof-audio-pci-intel-mtl claims the device successfully
- SOF firmware loads: intel/sof-ipc4/arl-s/sof-arl-s.ri (v2.13.0.1)
- However, it falls back to the generic machine driver (skl_hda_dsp_generic)
- This loads intel/sof-ace-tplg/sof-hda-generic.tplg
- This topology only includes HDA codec paths - NO I2C amplifier integration

The Problem:

Without proper topology and machine driver integration, the AW88399 
amplifiers aren't connected to the audio pipeline. Currently, audio is 
extremely quiet and tinny (sounds like only tweeters working?)

What's Needed:

- A topology file for ALC287 + AW88399 combination (e.g., 
"sof-arl-alc287-aw88399.tplg")
- ACPI/DMI quirk entries for 17aa:3906 and 17aa:3907 that:
- Force SOF driver instead of legacy snd_hda_intel
- Select appropriate machine driver (not generic)
- Configure SSP routing for codec + I2C amplifiers
- This might be distantly similar to existing implementations like 
sof-mtl-rt5682-max98357a.tplg.

How I Can Help:

I'm happy to:

- Test patches and provide detailed logs
- Provide ACPI dumps or any other system information needed
- Help with debugging and validation

This issue affects multiple recent Lenovo laptops with ALC3306 codecs 
(see kernel bugzilla #219651), so a fix would benefit many users.

We've already discussed this issue extensively here: 
https://bugzilla.kernel.org/show_bug.cgi?id=218329

There are also discussions here: 
https://forum.garudalinux.org/t/audio-issues-on-lenovo-legion-pro-7-16iax10h/46291

Finally, Péter provided the following insight:

 > $ cat sound/hda/codecs/realtek/alc269.c | grep "Legion Pro"
 >        HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", 
ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f 
below */
 >       SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", 
ALC287_FIXUP_CS35L41_I2C_2),
 >
 > Looks like the Legion Pro 7 comes in pretty wide array of config as 
well, but you need some thing along these lines.

Also, Péter mentioned that it would be a good idea to capture the HDA 
verbs used by the Windows driver. Could anyone share some guidance on 
how I can do this so that I can share my findings?

Any guidance or pointers would be greatly appreciated!

Thank you!

-- 
Nadim
Sent from my computer

