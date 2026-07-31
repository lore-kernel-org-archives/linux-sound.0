Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83651384CC4
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482771; cv=none; b=OISuTi1dz24sjckWw+uAIIBJi/9imEZwuN07nFZqPOBsaSFFKRtwFq79O3fdeN6SPL2wot01bH2NIMaVs0Qj4ednIxePD8vux0VAnUqs+7KUFMToF8xTY3zehEvdm4fhTiwgShFJXcBbMcsujXLed/DZXAPsEnEPwhR8BsznuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482771; c=relaxed/simple;
	bh=d4+No3LWMxrXCAbwJ6HrmpkmiawPpkqtQL3ek17ExiQ=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=PEnU/Bt39VDcUzqw3adQ4HXnb7r10sH/kVhCPjxuWagI4qdqc2Ze0fTR5vhkTT5XJQNYZzyeZdJsYe91j0jhjGs0mP6RNSjXGmPe2d2stNluQTR0TvcQRrVukqRPB3wJd0OWVDPnLX/mT7v7z7QFDfSoqgyEZVUg54dyeV1R588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0hLpRYb+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DZGJQTkq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j+T+KNdE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7OfIbjT6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0hLpRYb+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DZGJQTkq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j+T+KNdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OfIbjT6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A3F47DE17;
	Fri, 31 Jul 2026 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785482763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMVHXy/sDI42/SLqDwwb3rMFSWvp0TKr8vSicbNHKvQ=;
	b=0hLpRYb+KnWKzewhZLJByzz+yh7a9SEu1DdYYEcxeWK1AZCDJ08t++rFR34uEt/oJhLhrK
	RF8QwNvZS/rn5m82GoZHbnwqTkZNwIpCk1bRl2X5Lt9dTtYKDMTq4TUDFC10oJ6CWUixwf
	p8IXNcjDXH+V9r1RE0hlDfEAeubGUHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785482763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMVHXy/sDI42/SLqDwwb3rMFSWvp0TKr8vSicbNHKvQ=;
	b=DZGJQTkqyukkWdhTaRrRnfQZBXx17Gad+glFTHuBk1N+1LM95aZzaQwS8KoUr1rYqKweGb
	9Xgy9gST2utEh0AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785482759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMVHXy/sDI42/SLqDwwb3rMFSWvp0TKr8vSicbNHKvQ=;
	b=j+T+KNdE43CuYJRzZEvj11b0jH9FBGsYTA4/J28lfqCQ8mhfGfqn2f/Q2sDdH3+nf3dES1
	Kw7AEe8pojjv4A6pli53WPjf2LqFyolV5D+Yg9GB5fwDWNjPax9mAYn/1hCCRmMoFdwDVk
	WS0CByJgSQ3YrwRO8cr8Sfqse1AszXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785482759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMVHXy/sDI42/SLqDwwb3rMFSWvp0TKr8vSicbNHKvQ=;
	b=7OfIbjT6+BC0a3Z9AWxU/Q0jPozN3DLHjv/s/vpeOGzXAYpHxAVcCkhZRnMsqRxsCfCodI
	lzFW42/FJdlk/yBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31029779B0;
	Fri, 31 Jul 2026 07:25:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TN+OCgdObGqmXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 Jul 2026 07:25:59 +0000
Date: Fri, 31 Jul 2026 09:25:58 +0200
Message-ID: <875x1v1uyh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2-rc6
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

Linus,

please pull sound fixes for v7.2-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc6

The topmost commit is 2b6e56b848fcbe82d297805c927f4556123e5039

----------------------------------------------------------------

sound fixes for 7.2-rc6

A collection of sound fixes for the 7.2-rc6 cycle.  Again, it became
far larger than wished; I'll throttle from now on.

There are no major changes, just a normal flow of small fixes.
The majority of them are device-specific quirks and ASoC SDCA/codec
updates, but it includes a few ALSA core fixes as well.

ALSA Core:
- Fix for ALSA sequencer timer division-by-zero
- Fix potential race in ALSA timer core
- Wake up linked drain waiters on PCM stream unlink
- Fix double-free of converter objects on UMP rawmidi error path

USB-audio:
- Fix a few potential out-of-bounds access bugs
- Prevent stack info leak in RME Digiface status
- Fix UAF during UMP endpoint destruction
- Fix UAF at error handling during probe in Line6 6fire driver
- Quirks for C-Media CM6206, Corsair Virtuoso, Razer Barracuda X 2.4,
  JKY Technology, and generic USB headphones

HD-audio:
- Quirks for HP Victus 16, HP Dragonfly Folio G3, Lenovo Legion 7, HP
  Laptop 14s, Acer Nitro 5, TongFang X6SP45xU, Infinix INBOOK X3, and
  HP Pavilion All-in-One

ASoC:
- Comprehensive cleanups and bug fixes for SoundWire/SDCA drivers
- DMI quirks for AMD ACP/YC on Lenovo Legion 7, Acer Aspire, MSI
  Crosshair A16, and ASUS ExpertBook
- ACPI match table entry for SOF RT5682 on Intel Nova Lake
- Device-specific mixer / clock, irq fixes for TI TAS2562, TI TAS2781,
  Sophgo cv1800b ADC, Maxim MAX98090/98095, FSL ASRC/EASRC and Realtek
  RT5640

----------------------------------------------------------------

Andr®¶ Pragosa (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Victus 16-e0xxx (MB 88ED)

Balamurugan C (1):
      ASoC: Intel: soc-acpi: Add entry for sof_rt5682 in NVL match table.

Baul Lee (4):
      ALSA: usb-audio: fix use-after-free in ump_to_endpoint()
      ALSA: ump: fix double free of out_cvts on rawmidi error
      ALSA: usb-audio: fix stack info leak in RME Digiface status
      ALSA: usb-audio: fix OOB write in snd_usbmidi_akai_output()

Charles Keepax (11):
      ASoC: SDCA: Correct pointer passed to devm_acpi_table_put
      ASoC: SDCA: Always free firmware in FDL path
      ASoC: SDCA: Make UMP message size check more robust
      ASoC: SDCA: Ensure that Control Range is large enough for header
      ASoC: SDCA: Rename sdca_irq_allocate() to include devm
      ASoC: SDCA: Add sdca_irq_cleanup_late()
      ASoC: SDCA: Remove devm from primary IRQ cleanup
      ASoC: SDCA: Populate IRQ data earlier
      ASoC: Add a component fixup_controls callback
      ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
      ASoC: SDCA: Move kcontrol search out of IRQ

Eckhart Mohr (1):
      ALSA: hda/realtek: Add quirk for TongFang X6SP45xU

Fabio Estevam (1):
      ASoC: dt-bindings: realtek,rt5640: Make interrupts optional

Gunal Seenivasagan (1):
      ALSA: hda/realtek: Add quirk for Infinix INBOOK X3 Slim

Haidar Lee (2):
      ASoC: tas2562: fix DVC coefficient write order
      ASoC: tas2562: fix broken entries in the volume lookup table

Jackie Dong (2):
      ALSA:hda/realtek:ALC269 fixup for Legion 7 15ASH11 Mic Mute LED
      ASoC: amd: acp: Add DMI quirk for Lenovo Legion 7 15ASH11

Jorn Baayen (1):
      ASoC: amd: yc: Add DMI quirk for Acer Aspire AG14-22P

Lianqin Hu (2):
      ALSA: usb-audio: Add iface reset and delay quirk for Generic USB Headphone
      ALSA: usb-audio: Add iface reset and delay quirk for JKY Technology Q2A

Madhavender Singh (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Laptop 14s-dr1xxx

Marcos Paulo Medeiros (1):
      ALSA: hda/realtek: Fix headset mic on Acer Nitro 5 AN515-46

Mark Brown (3):
      ASoC: tas2562: Validate values for volume writes
      ASoC: tas2562: Fix event generation for volume control
      ASoC: tas2562: Fix default digital volume

Markus Lindner (1):
      ALSA: usb-audio: Add dB map quirk for Razer Barracuda X 2.4

Michael Diesen (1):
      ALSA: hda/realtek: Add quirk for HP Dragonfly Folio G3 2-in-1 (103c:8a05)

Mikhail Gavrilov (1):
      ALSA: usb-audio: Add GET_SAMPLE_RATE quirk for C-Media CM6206

Norbert Szetei (3):
      ALSA: seq: Fix division by zero in initialize_timer()
      ALSA: timer: Clear SNDRV_TIMER_IFLG_DEAD once the close completes
      ALSA: pcm: wake linked drain waiters on unlink

Robert Abrahamse (1):
      ALSA: usb-audio: Add quirk for Corsair Virtuoso (later revision)

Shengjiu Wang (2):
      ASoC: fsl_asrc: fix m2m_init error path to use goto instead of bare return
      ASoC: fsl_easrc: fix m2m_init error path to use goto instead of bare return

Shuming Fan (1):
      ASoC: rt722: reset codec to fix abnormal sound

Sonali Pradhan (2):
      ALSA: usb-audio: Fix DMA buffer out-of-bounds write when fill_max is set
      ALSA: usb-audio: Clamp frame size in implicit-feedback mode

Surendra Singh Chouhan (1):
      ASoC: sophgo: return 1 on volume change in cv1800b_adc_volume_set()

Takashi Iwai (1):
      ALSA: 6fire: Fix UAF at error handling during probe

Uday Khare (2):
      ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup
      ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup

Xu Rao (1):
      ALSA: lx6464es: fix period byte count for 16-bit streams

Zhang Heng (2):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA
      ALSA: hda/realtek: Add quirk for HP Pavilion All-in-One 27-ca1xxx

wangdicheng (1):
      ASoC: tas2781: Use correct calibration data for SINEGAIN2 register

÷£∫Ë‘¥ (1):
      ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to quirk table

---
 .../devicetree/bindings/sound/realtek,rt5640.yaml  |   1 -
 include/sound/sdca_fdl.h                           |   2 +
 include/sound/sdca_interrupts.h                    |  14 +-
 include/sound/sdca_jack.h                          |   3 +
 include/sound/soc-component.h                      |   2 +
 sound/core/pcm_native.c                            |   7 +
 sound/core/seq/seq_timer.c                         |   9 +-
 sound/core/timer.c                                 |   2 +
 sound/core/ump.c                                   |   1 +
 sound/hda/codecs/realtek/alc269.c                  |  57 ++++++-
 sound/hda/controllers/intel.c                      |   2 +
 sound/pci/lx6464es/lx6464es.c                      |   5 +-
 sound/pci/lx6464es/lx_core.c                       |   5 +-
 sound/soc/amd/acp-config.c                         |   7 +
 sound/soc/amd/yc/acp6x-mach.c                      |  22 +++
 sound/soc/codecs/max98090.c                        |   5 +-
 sound/soc/codecs/max98095.c                        |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   4 +
 sound/soc/codecs/rt722-sdca.c                      |  14 ++
 sound/soc/codecs/tas2562.c                         |  46 ++++--
 sound/soc/codecs/tas2781-i2c.c                     |   4 +-
 sound/soc/fsl/fsl_asrc.c                           |   2 +-
 sound/soc/fsl/fsl_easrc.c                          |   2 +-
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  13 ++
 sound/soc/sdca/sdca_class.c                        |   4 +-
 sound/soc/sdca/sdca_class_function.c               |   6 +-
 sound/soc/sdca/sdca_device.c                       |   2 +-
 sound/soc/sdca/sdca_fdl.c                          |  18 ++-
 sound/soc/sdca/sdca_functions.c                    |   2 +
 sound/soc/sdca/sdca_interrupts.c                   | 174 ++++++++++++---------
 sound/soc/sdca/sdca_jack.c                         |  88 ++++++-----
 sound/soc/sdca/sdca_ump.c                          |   4 +-
 sound/soc/soc-component.c                          |  10 ++
 sound/soc/soc-core.c                               |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               |  10 +-
 sound/usb/6fire/chip.c                             |   4 +
 sound/usb/endpoint.c                               |  14 +-
 sound/usb/midi.c                                   |   2 +
 sound/usb/midi2.c                                  |   4 +-
 sound/usb/mixer_maps.c                             |  25 +++
 sound/usb/mixer_quirks.c                           |   2 +-
 sound/usb/quirks.c                                 |   7 +
 42 files changed, 444 insertions(+), 171 deletions(-)

