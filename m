Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792758;
	b=M8zwRpWrCdPjACLW5EkIvxntqJ+1TIhHAQF/yh9gT6Ts3EpZyo1OEEHV83o2wA6VG1Qg
	 eUsPISPCQY+R3uqxZplcvKX9LdAk4J7zq+YS3Tu4pPWKqTPCLK6d8+RQXvLQhle8lTM8G
	 UxvyaC3J4gxkIb3s9+tDhNT8bfOQoMy132tpBd6KaTPSu9J+8W9NOSAx0DdAsBkyfj8UO
	 TZnxjhM/4Br+GgjJFxb8BJeBYKng5QNnQa1sh6UKlWc93W8JCaS6OX+6iseR86w6DD6HK
	 xclxOZempQCS96+cqk+ygq9XoGSyrNhHfMnyL6cc11cWy/94So38sVolL/MWHbovD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792758;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=bEoLKWSEn34IGvUQS8bq69ZXl72O1X3UYsphHbW3p4U=;
	b=kapqMM3E/ZvR5dtVPpK/fOEkvd++Uok+kNYARi4EzrC1LuqQaPtaImXtuSKSxprT0hVU
	 2EE8KlJnVFlpsPwseZ935ptcgfCsBw9XTOOzbNMe0DJLWyHxvPa/3yiyIGpo6MPnTcMXi
	 PmgWBPBbRxxYB8/hL7pOUj/hC1A0Kb7HoOiWb2IuFiiMdBo0G51Reo48dFXOZvKUvGzAy
	 3H1KHxoCgp64w6nGGHpNZrzp/6OC5y2SvlpMwJvoHZION20iojp3koIS+Rd6ZNP1M6k1z
	 Y1GjQHfi0jaaf1U0ek46JzBKqC533k+nSUmY3wGmaSV5G5kCatI3uHOmxkf5r/Vp/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1jENU2J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Liyui8Yd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aa5wsK6W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zNqiXOsq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0E606A31C;
	Fri, 27 Nov 2026 15:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1jENU2J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Liyui8Yd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aa5wsK6W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zNqiXOsq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3348D1FD59;
	Fri, 27 Nov 2026 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795792755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bEoLKWSEn34IGvUQS8bq69ZXl72O1X3UYsphHbW3p4U=;
	b=u1jENU2JCSXGjp64N5RzZBNeGbNfGx7AR4unoVT3VthJEr/Q0uwjjAryc4g0p5i1Kne3bc
	VcGKag4cDftc+tWw/vJ9NXUd5lpDtZjKG4ikv2ZUvuYs4+X9ulnfuxUD5Gb77Nw4nHoT/0
	FpoQEjIYqAmOxZLMfPl9XvaqYJS1NZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795792755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bEoLKWSEn34IGvUQS8bq69ZXl72O1X3UYsphHbW3p4U=;
	b=Liyui8YdzrPTaCrh+xaMG+e5lsyxgjikaPk/5v4kEbvNeVd0xf6KPWs3z4CSVuhw22i5H3
	QJZ+upL/RmsGZ0DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795792754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bEoLKWSEn34IGvUQS8bq69ZXl72O1X3UYsphHbW3p4U=;
	b=Aa5wsK6WC+EGc1uSP6HgGVR4VQynnXNhS8iz1rXpi36Jt5Ud9BUBEmXw/2qFu/Zs0DE6Sa
	FJdLKLkh5FmAVc0dF4QW4oLrZsijHMyz60d7uBFgdWkwgG3YfxJv8xKTH5IcxCxf+84tog
	LaIv5zhLdpXYxYC6uGwyd94tzyUlJjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795792754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bEoLKWSEn34IGvUQS8bq69ZXl72O1X3UYsphHbW3p4U=;
	b=zNqiXOsqYLE90LrselIkHAYw87c245L+Kgfwo8mP6EBMoxvdpKtZ55aghwwFSz/Fb2b/L3
	qz9nyKyUjl4zY7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2C2913432;
	Fri, 27 Nov 2026 15:19:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id baieLXGfCWsUCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 15:19:13 +0000
Date: Fri, 27 Nov 2026 16:19:13 +0100
Message-ID: <87y0aemhe6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.4-rc5
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[kode54.net:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.4-rc5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc5

The topmost commit is e79163b531eca7f3fdc05031f4b43b6f7c51d3bc

----------------------------------------------------------------

sound fixes for 7.4-rc5

A collection of various small fixes across the sound subsystem.
Mostly the device-specific quirks and driver fixes as usual, along
with a few race and deadlock fixes in ALSA core and ASoC drivers.

Here are the highlights:

* ALSA core:
- Fix potential ABBA deadlock at snd_pcm_action_nonatomic()
- Prevent hw_params/hw_refine changes during PCM buffer access
- Simplify PCM buffer access gate with auto-cleanup helpers
- Fix deadlock regression at OSS device unregistration
- Refine slave hw_params after setting format in PCM OSS
- Protect slave timer instance flags with the timer lock

* HD-audio:
- Fix unbalanced display power reference on delayed probe failure
- Fix NULL pointer dereference on unbind in TAS2781 SPI driver
- Revert for regression on Higole F9B due to generic SSID conflict
- Device-specific quirks and fixups (ASUS, Acer, Lenovo, HP, Infinix)

* USB-audio:
- Fix playback URB list corruption
- Add quirk flags for Logitech PRO X 2 LIGHTSPEED headset
- Generic implicit feedback quirks for Elgato XLR Dock and Wave:3
- Native DSD support for Fosi Audio DS2 and iBasso Macaron

FireWire:
- Abort in-flight transactions on bus reset in FCP and Fireworks

* ASoC:
- Tegra: Add Tegra268 ADMAIF driver and dt-bindings support
- NXP / FSL: Fixes for fsl_asrc and fsl_easrc regarding memory safety,
  pair/context ownership, repeated hw_params, and FIFO drain bounds check
- SOF: Reject out-of-range enum control values
- AMD: ACP70 ACPI flag overrides (LG gram, Lenovo) and ACP6x DMIC quirks
  (HP, MSI, Xiaomi)
- Codec fixes for Everest ES8326 (clock, calibration delay, pop noise),
  Awinic AW88166 and AW88399

----------------------------------------------------------------

Abhiraj Dutta (2):
      ALSA: hda/realtek: Add quirk for HP Spectre x360 2-in-1 Laptop 16-f2xxx
      ALSA: hda/realtek: Fix duplicate LEDs on HP Spectre x360 16-f2xxx

Akhil Arul (1):
      ALSA: hda/tas2781-spi: Set tas_hda->dev in probe

Alen Ti¨ljar (1):
      ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22)

Andrea Di Pietro (1):
      ALSA: hda/realtek: Enable mute LEDs for HP OmniBook 7 14-hg0xxx

Anupama Kunkulagunta (2):
      ASoC: dt-bindings: tegra: Add Tegra268 ADMAIF support
      ASoC: tegra: ADMAIF: Add Tegra268 support

Arnav Kapoor (1):
      ASoC: SOF: control: reject out-of-range enum values

Arshdeep Singh (1):
      ALSA: hda/realtek: Add quirk for HP Pavilion 15-cs3xxx

Dennis Rijsdijk (1):
      ALSA: usb-audio: Add generic implicit feedback quirk for Elgato Wave:3

Gianluca Boiano (1):
      ALSA: usb-audio: Enable native DSD for Fosi Audio DS2

Hengyu Liang (1):
      ALSA: pcm: oss: Refine slave hw_params after setting format

JaeHoon Kim (1):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 15Z95U

James Barnette (1):
      ALSA: usb-audio: Add generic implicit feedback quirk for Elgato XLR Dock

James X. Nelson (1):
      ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX A8WGKG

Kai Vehmanen (1):
      ALSA: hda: intel: Release i915 power also when delayed probe fails

Marco Giunta (2):
      ASoC: aw88166: fix backup restoring the RE value instead of saving it
      ASoC: aw88399: fix register used to disable I2S TX

Markus Paltian (1):
      ASoC: amd: acp: Add Lenovo IdeaPad Slim 5 16AKP10 to ACP70 override table

Mikolaj Kucharski (1):
      ASoC: amd: yc: Add DMI quirk for Xiaomi REDMI Book 14 2025 (AMD)

Oleg Antonyan (1):
      ALSA: hda/realtek: Fix headset mic on ASUS Zenbook S 13 UX5304MA

Parmjot Singh (1):
      ALSA: hda/realtek: Enable mute LEDs on HP Envy x360 15-ew0xxx

Rongen Wang (1):
      ALSA: timer: Protect the slave instance flags with the timer lock

Sophiel Zhou (1):
      ALSA: usb-audio: Enable native DSD for iBasso Macaron

Stefan Ghetu (5):
      ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining the output FIFO
      ASoC: fsl_asrc: fix pair ownership on repeated or failed hw_params
      ASoC: fsl_asrc_dma: release DMA channels on repeated hw_params
      ASoC: fsl_easrc: fix context ownership on repeated hw_params
      ASoC: fsl_asrc_m2m: allow only one task at a time per stream

SungHwan Jung (2):
      ALSA: hda/realtek: Fix mic mute LED on Acer Predator PHN16-71
      ALSA: hda/realtek: Fix distorted headphone audio on Acer Predator PHN16-71

Suyuan Wang (2):
      ALSA: firewire-lib: Abort the FCP transaction on a bus reset
      ALSA: fireworks: Abort the transaction on a bus reset

Takashi Iwai (7):
      ALSA: pcm: Fix potential ABBA deadlock at snd_pcm_action_nonatomic()
      ALSA: pcm: Simplify PCM buffer access gate with auto-cleanup helpers
      ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access
      Revert "ALSA: hda/realtek: Fix silent speaker on Higole F9B"
      ALSA: hda/realtek: Fix regression on another Lenovo Legion 16IRX9H model
      ALSA: oss: Fix deadlock at unregistering (again)
      ALSA: usb-audio: Don't queue playback URBs after stop

William Alberto Jimenez Muñoz (1):
      ALSA: hda/realtek: Add quirk for ASUS VivoBook X509UA

Zhang Yi (4):
      ASoC: codecs: ES8326: Modify Clock Configuration
      ASoC: codecs: ES8326: issue about capture pop
      ASoC: codecs: ES8326: Modify the Initialization Configuration
      ASoC: codecs: ES8326: Adjust the delay during calibration

chris@kode54.net (2):
      ALSA: usb-audio: Ignore trailing whitespace in quirk_flags
      ALSA: usb-audio: Add quirk flags for Logitech PRO X 2 LIGHTSPEED

sandrees2007-ctrl (1):
      ALSA: hda/realtek: Add quirk for Infinix BL51A7H

---
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |  22 ++++
 sound/core/oss/pcm_oss.c                           |   3 +-
 sound/core/pcm_compat.c                            |   3 +
 sound/core/pcm_lib.c                               |   7 +-
 sound/core/pcm_local.h                             |  26 +++++
 sound/core/pcm_native.c                            | 125 ++++++++++++---------
 sound/core/sound_oss.c                             |  35 +++---
 sound/core/timer.c                                 |  50 +++++++--
 sound/firewire/fcp.c                               |   5 +-
 sound/firewire/fireworks/fireworks_transaction.c   |   4 +-
 sound/hda/codecs/realtek/alc269.c                  |  33 +++++-
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |   1 +
 sound/hda/controllers/intel.c                      |   5 +-
 sound/soc/amd/acp-config.c                         |  14 +++
 sound/soc/amd/yc/acp6x-mach.c                      |  22 ++++
 sound/soc/codecs/aw88166.c                         |   2 +-
 sound/soc/codecs/aw88399-lib.c                     |   2 +-
 sound/soc/codecs/es8326.c                          |   8 +-
 sound/soc/fsl/fsl_asrc.c                           |  22 ++++
 sound/soc/fsl/fsl_asrc_dma.c                       |  27 +++--
 sound/soc/fsl/fsl_asrc_m2m.c                       |  30 +++--
 sound/soc/fsl/fsl_easrc.c                          |  10 ++
 sound/soc/sof/control.c                            |   5 +
 sound/soc/tegra/tegra210_admaif.c                  |  66 +++++++++++
 sound/soc/tegra/tegra210_admaif.h                  |  18 +++
 sound/usb/endpoint.c                               |   3 +
 sound/usb/quirks.c                                 |  13 ++-
 27 files changed, 443 insertions(+), 118 deletions(-)

