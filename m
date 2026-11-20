Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182198;
	b=qphQtnrPgov4oRabWQBsIDm3fMvd7tIGXTZDMpWEzsbkdsFjGC+RH9A/3C4iYz5P+z2O
	 fnHV6h2oquSgVFtRpj8jNO1cknH4ARn+S6DINWw9zpmcJRU6yyaf0ska14YVF+pFDuJOe
	 YCcWSyYvVENysLPasFAEpv7ns9T5Tre2Ao+dbf1qYxfbFwlg5ymXTcskoIbxWIX1h4bg0
	 d2TnvsgUh+p7rsEZiHfMGA/+hRKvhK5aPlLTEIsimjY3ffp24Zp+r/qzh6fZ9kTVQQoFr
	 udKhTVM8ivWcaZI2ml9bIgB2VWla+sUNhOZP90KrmsBkN7sDVGwaoBBUSncjdaYHJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182198;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=A7ic0CVjCzukvSTgJx4WMC2o+tIKJQMs35wGW1e+9fA=;
	b=Mz12TWRJwilWpO9wGNz31u3V9rAzL+AcpnJHjVWG7FCFGdmPqAYDt5QgLH4t5/n2Zza+
	 jGGXl/wLzJ6rZxapWI5M/keXh/JDe6BQ51xiB8bzpQvtqgyRCJ4dDuytMvZKQbTqs4RJK
	 2DwTSBeYoNlM3pJWv2/taR4K3B8mY+6lspMCvnTYTQ77f4nVV2opMWccJt35IlmUqXVU8
	 fsNUboPfF4HzJRPBMwRAwmPgTmPrbvjSTEyO1lEV2K6wFI3e5bvupRDH84H9yMx9i787V
	 QmbAekoAB8WuYe9E7BFSp8DVUYcwXq19pzDhR/keg0vS3Z4KIadM7l/P8oXr7rq6H4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q61mpzs5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wNCeRlBF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="oTWLN/I/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sVCOfaoM;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9A606A334;
	Fri, 20 Nov 2026 13:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE9A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q61mpzs5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wNCeRlBF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oTWLN/I/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sVCOfaoM
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAC4922520;
	Fri, 20 Nov 2026 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795182195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=A7ic0CVjCzukvSTgJx4WMC2o+tIKJQMs35wGW1e+9fA=;
	b=Q61mpzs5eM0a7yPOnUBHq4qHsIw7TNvSNkd2wAKyaxGBJrSsaoQ8/eV9D6PT1dnslijOim
	Lypr6wNvxK060ZQwnYxceuBkeWLuL4utmsBOSGVdU3cycmWy1TkZD5yFIW30AqIvbbSo5S
	RTZu/3G6aYpVFDiejBt0CTtNGfXHDFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795182195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=A7ic0CVjCzukvSTgJx4WMC2o+tIKJQMs35wGW1e+9fA=;
	b=wNCeRlBFB192MPmF4eMcfpkMPavBUz1aeJ1HSctTY+Jl8izwFo26Ti6nf+fO5EHt+9vF26
	EYvGKld6XXRmNwDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="oTWLN/I/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sVCOfaoM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795182194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=A7ic0CVjCzukvSTgJx4WMC2o+tIKJQMs35wGW1e+9fA=;
	b=oTWLN/I/Aj6srHUlaWOUPJnwDLDVK52sPrl7c7HGpltF1nI1JcFVNs+lWf4Q4KhBXZngd/
	1nA7+FZ+6tAYHdVb9cpPEyGrao4ll9c/MVrROfShwhZuKud0DqmdizPXhD9pWmZJrnRC/Q
	SYVj1m3n6hr3cbxzjv26kfAxyRJf78U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795182194;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=A7ic0CVjCzukvSTgJx4WMC2o+tIKJQMs35wGW1e+9fA=;
	b=sVCOfaoMV8xQSCWPegSf5zyvmpVF21SCzHKv6oDqNkhIMz5MrYCDnm4XS9TsFv1s61JQPX
	4rpu/fSRTY+t5cDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DF051348F;
	Fri, 20 Nov 2026 13:43:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id avdnGHJOAGvffAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 13:43:14 +0000
Date: Fri, 20 Nov 2026 14:43:14 +0100
Message-ID: <87pkvzmxe5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.4-rc4
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
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: DAC4922520
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

Linus,

please pull sound fixes for v7.4-rc4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc4

The topmost commit is 3c3db0de2aa937e80ef96e21da940dc8816d3c16

----------------------------------------------------------------

sound fixes for 7.4-rc4

A collection of various small fixes.  Nothing really stands out.
While we still get more fixes than before, things look still well
manageable (fingers crossed).  Here are the highlights:

* ALSA core:
- Fix page leaks at buffer allocation retries
- Fix in compress-offload API for setting metadata_set flag
- Parameter flag handling fixes on setup and error in PCM OSS layer

* HD-audio:
- Fix AE-5 LED strip color corruption during animation in ca0132
- Correct boost values for CS35L41 on several HP laptops
- Realtek quirk regression fixes for Lenovo Legion and V14 G2 ITL
- Fix quiet speakers on HP 250 G6
- Various Realtek quirks and mute LED fixups (HP, Lenovo, THUNDEROBOT)

* USB-audio:
- Fix UBSAN array bounds warning and period wake-up issue in usx2y
- Quirk for Yamaha MODX M

* ASoC:
- Intel / SoundWire: Support for Senary SN6245 codec
- AMD: Fix ACP7.x DMIC/PDM ring buffer address on resume, ACP quirks
- Fixes for Qualcomm to reject oversized compress ring buffers,
  AudioReach routing disconnect, LPASS clocks probe ordering and
  WCD934x MCLK initialization
- Fixes for Meson about locking and sleeping in atomic context
- Rockchip fix to avoid stuck clear condition in I2S/TDM consumer mode
- Mediatek fix for ETDM3_OUT DAI startup error on MT8195
- Codec fixes for CS35L56, TAS2781, ES9039Q2M, and WM8962

----------------------------------------------------------------

Adolfo Morales Tena (1):
      ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ

Arnav Kapoor (1):
      ALSA: hda/realtek: Don't apply the Legion Slim 7 quirk to Lenovo V14 G2 ITL

Chen Yuxi (1):
      ASoC: wm8962: Fix broken headset button caused by wrong guard constant

Devin Christensen (1):
      ALSA: hda/ca0132: Fix AE-5 LED strip color corruption during animation

Dirk Su (1):
      ALSA: hda/realtek: Add LED fixup for HP ZBook Ultra G1a Laptops

Dustin Tacy (1):
      ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15t-ek000

Gaurav Suman (1):
      ASoC: codecs: wcd934x: keep MCLK enabled so init writes reach the codec

Geoffrey D. Bennett (1):
      ALSA: usb-audio: Add always_set_rate quirk for Yamaha MODX M

HyeongJun An (1):
      MAINTAINERS: Add myself as a reviewer for the virtual PCM test driver

Josh Klecka (1):
      ALSA: hda/realtek: Add mute LED support for HP Pavillion Aero 13-be1xxx

Julius Bairaktaris (2):
      ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buffer
      ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buffer

Karl Asseily (1):
      ASoC: es9039q2m: Enable the DAC clock at component probe

Louis-Alexis Eyraud (1):
      ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error

Marc Herrero (2):
      ASoC: qcom: audioreach: use a 32-bit container for S24_LE PCM
      ASoC: qcom: audioreach: only disconnect the route a mixer control owns

Marek Vasut (1):
      ALSA: doc: cs35l56: Point to kernel.org firmware repository

Nicholas E. Andrade (1):
      ASoC: amd: acp: fix PDM ring buffer address on ACP7.x resume

Qianghua Wang (1):
      ASoC: sn624x: add support for the SN6245 part ID

Richard Fitzgerald (2):
      ASoC: cs35l56: Only write ASP1TXn registers when widget is powered-up
      ASoC: cs35l56: Fix unwanted writes to ASP config registers

Sinan Turunc (2):
      ALSA: usx2y: Count completions apart from the URB array length
      ALSA: usx2y: Account for every period a URB completes

Sreeraj S Kurup (2):
      ALSA: compress: Set metadata_set only after successful callback
      ALSA: memalloc: Fix DMA allocation retry cleanup

Stefan Binding (1):
      ALSA: hda: cs35l41: Correct Boost values for several laptops with overridden ACPI

Takashi Iwai (2):
      ALSA: hda/realtek: Fix regression on Lenovo Legion 16IRX9H
      ASoC: tas2781: Avoid possible zero-division

Tim Surber (1):
      ASoC: rockchip: i2s-tdm: Don't reset a pending clear in consumer mode

Valerio Setti (3):
      ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      ASoC: meson: gx-formatter: add lockdep_assert_held check

Ye Weihua (2):
      ALSA: pcm: oss: Restore params flag after failed reconfiguration
      ALSA: pcm: oss: Clear params flag only after successful setup

Zhang Heng (5):
      ALSA: hda/realtek: Add quirk for THUNDEROBOT Gravity16G2Pro
      ALSA: hda/realtek: Add quirk for HP Pavilion 15-cw1xxx
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP9
      ALSA: hda/realtek: Enable mute LEDs on HP Laptop 15-fd1xxx
      ALSA: hda/realtek: Fix quiet speakers on HP 250 G6

suso (1):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U

yzddMr6 (1):
      ASoC: qcom: q6dsp-lpass-clocks: Set driver data before registering clocks

---
 Documentation/sound/codecs/cs35l56.rst             |   2 +-
 MAINTAINERS                                        |   1 +
 include/sound/cs35l56.h                            |   2 +-
 sound/core/compress_offload.c                      |   4 +-
 sound/core/memalloc.c                              |   8 +-
 sound/core/oss/pcm_oss.c                           |   6 +-
 sound/hda/codecs/ca0132.c                          |  54 +++-----
 sound/hda/codecs/realtek/alc269.c                  |  48 +++++++
 .../hda/codecs/side-codecs/cs35l41_hda_property.c  |   8 +-
 sound/soc/amd/acp-config.c                         |   7 +
 sound/soc/amd/acp/acp-legacy-common.c              |   5 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   7 +
 sound/soc/codecs/cs35l56-shared.c                  |  38 +-----
 sound/soc/codecs/cs35l56.c                         | 147 ++++++++++++++++-----
 sound/soc/codecs/cs35l56.h                         |   1 +
 sound/soc/codecs/es9039q2m.c                       |  12 ++
 sound/soc/codecs/sn624x-sdca-sdw.c                 |   2 +
 sound/soc/codecs/tas2781-fmwlib.c                  |   2 +-
 sound/soc/codecs/wcd934x.c                         |   6 +
 sound/soc/codecs/wm8962.c                          |   2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |  18 ++-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  18 ++-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  18 ++-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |   9 ++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |  30 ++++-
 sound/soc/meson/aiu-fifo-i2s.c                     |  15 ++-
 sound/soc/meson/aiu-fifo-spdif.c                   |  14 +-
 sound/soc/meson/aiu-fifo.c                         |   3 +-
 sound/soc/meson/gx-formatter.c                     |  26 ++--
 sound/soc/meson/gx-formatter.h                     |   4 +
 sound/soc/meson/gx-interface.h                     |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |  10 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   3 +
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |   3 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |  14 +-
 sound/soc/qcom/qdsp6/topology.c                    |   4 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |  47 +++++++
 sound/soc/sdw_utils/soc_sdw_utils.c                |  56 +++++++-
 sound/usb/quirks.c                                 |   4 +
 sound/usb/usx2y/usbusx2y.h                         |   1 +
 sound/usb/usx2y/usbusx2yaudio.c                    |  11 +-
 41 files changed, 510 insertions(+), 163 deletions(-)

