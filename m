Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725044366
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037662; cv=none; b=ohjOZKwG41sTiYOZE6Kn8MzFWcExRBNzI/b1PBYw8p09P6D1FFLr9LN4pROti131sBCcH2hsd29X9nKDxOsnzcfLXPr2o8Qxae0GBldP3p22w0APVZaJ9nU1G1Ori7zBnUYyuiZP5X1Qo/V3MnSyCtAqf7PR++JYMX6WBOMHh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037662; c=relaxed/simple;
	bh=EnmyOz9al9cpR8VNpGcy/Gw/wmKyJZTyjQuv1iBCh+M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rmEyTmRirFkBQzVmIA65ImjqCvB6zwvw6fws2YPI3A9pvmDLk4w7RhhxHAl8JaPxE97sjV0zDHtaDo6Sfytbrk55k9GDm37T3xAKXw4vSFxqq9xMlGUEjEacULdeikmgB7V86p9kLxeNSk5UqSmhg6p8n4EWzWajib2T0m7P9Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qevrgUbZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wWxO0uAk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qevrgUbZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wWxO0uAk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qevrgUbZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWxO0uAk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qevrgUbZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWxO0uAk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C8EE31F396;
	Wed,  7 Aug 2024 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1W61PmSkKihglv+u8dbiLYmBAMk/H++ZGPLc72mG9Yg=;
	b=qevrgUbZKASfaUGsnpwN1MRM1XEuAFpsBmjkra1yfaQN3UyTjVwwRxm9XCzoxoFimNvNU5
	Q2DNZh8Wvmef8/bbywyHAZQ5FO8K9l7wyQj50h63ofKSDYcscoh9TmRzuMaCGWZ7s4Kl9O
	t5LUKHj/8uCoPk1aT+y6a7FR+R93qD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1W61PmSkKihglv+u8dbiLYmBAMk/H++ZGPLc72mG9Yg=;
	b=wWxO0uAkFG6Co7SCuxpURMLAXGdmPXIMxbfGFDgHqxoyBtC5vU7DRD4+tc08xDcSxynot6
	m9i8WpZRDg4ETFAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1W61PmSkKihglv+u8dbiLYmBAMk/H++ZGPLc72mG9Yg=;
	b=qevrgUbZKASfaUGsnpwN1MRM1XEuAFpsBmjkra1yfaQN3UyTjVwwRxm9XCzoxoFimNvNU5
	Q2DNZh8Wvmef8/bbywyHAZQ5FO8K9l7wyQj50h63ofKSDYcscoh9TmRzuMaCGWZ7s4Kl9O
	t5LUKHj/8uCoPk1aT+y6a7FR+R93qD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1W61PmSkKihglv+u8dbiLYmBAMk/H++ZGPLc72mG9Yg=;
	b=wWxO0uAkFG6Co7SCuxpURMLAXGdmPXIMxbfGFDgHqxoyBtC5vU7DRD4+tc08xDcSxynot6
	m9i8WpZRDg4ETFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE3EB13A7D;
	Wed,  7 Aug 2024 13:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MiRZKdh3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/54] ALSA: Drop legacy snd_print*()
Date: Wed,  7 Aug 2024 15:33:50 +0200
Message-ID: <20240807133452.9424-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.961];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.21

Hi,

this is a bit largish clean up patch series for dropping the legacy
snd_printd() and co.  Almost only the old drivers are still using
those API functions, and it's time to change them to the modern ones
like dev_err() and dev_dbg().

This ended up with the drop of a Kconfig item
CONFIG_SND_VERBOSE_PRINTK, too.


Takashi

===

Takashi Iwai (54):
  ALSA: portman2x4: Use standard print API
  ALSA: mts64: Use standard print API
  ALSA: mpu401: Use standard print API
  ALSA: mpu401_uart: Use standard print API
  ALSA: mtpav: Use standard print API
  ALSA: opl3: Use standard print API
  ALSA: opl4: Use standard print API
  ALSA: serial-u16550: Use standard print API
  ALSA: virmidi: Use standard print API
  ALSA: vx_core: Drop unused dev field
  ALSA: vx_core: Use standard print API
  ALSA: aloop: Use standard print API
  ALSA: dummy: Use standard print API
  ALSA: pcsp: Use standard print API
  ALSA: i2c: cs8427: Use standard print API
  ALSA: i2c: pt2258: Use standard print API
  ALSA: i2c: Drop commented old debug prints
  ALSA: ad1816a: Use standard print API
  ALSA: als100: Use standard print API
  ALSA: azt2320: Use standard print API
  ALSA: cmi8328: Use standard print API
  ALSA: cmi8330: Use standard print API
  ALSA: cs4236: Use standard print API
  ALSA: es1688: Use standard print API
  ALSA: es18xx: Use standard print API
  ALSA: gus: Use standard print API
  ALSA: msnd: Use standard print API
  ALSA: opl3sa2: Use standard print API
  ALSA: opti9xx: Use standard print API
  ALSA: sb: Use standard print API
  ALSA: control_led: Use dev_err()
  ALSA: pcm: oss: Use pr_debug()
  ALSA: sc6000: Use standard print API
  ALSA: sscape: Use standard print API
  ALSA: wavefront: Use standard print API
  ALSA: wss: Use standard print API
  ALSA: riptide: Use standard print API
  ALSA: korg1212: Use standard print API
  ALSA: lx6464es: Cleanup the print API usages
  ALSA: azt3328: Use pr_warn()
  ALSA: emu10k1: Use dev_warn()
  ALSA: trident: Use standard print API
  ALSA: emux: Use standard print API
  ALSA: usx2y: Use standard print API
  ALSA: usb-audio: Use standard print API
  ALSA: intel8x0: Drop unused snd_printd() calls
  ALSA: vxpocket: Use standard print API
  ALSA: pdaudiocf: Use standard print API
  ALSA: ppc: Use standard print API
  ALSA: sh: Use standard print API
  ALSA: sparc: Use standard print API
  ALSA: asihpi: Use standard print API
  ALSA: docs: Drop snd_print*() stuff
  ALSA: core: Drop snd_print stuff and co

 Documentation/sound/hd-audio/notes.rst        |   6 -
 .../kernel-api/writing-an-alsa-driver.rst     |  25 --
 include/sound/aci.h                           |   1 +
 include/sound/core.h                          |  67 ------
 include/sound/es1688.h                        |   1 +
 include/sound/snd_wavefront.h                 |   4 -
 include/sound/soundfont.h                     |   6 +-
 include/sound/vx_core.h                       |   1 -
 sound/core/Kconfig                            |   9 -
 sound/core/control_led.c                      |   2 +-
 sound/core/misc.c                             |  71 ------
 sound/core/oss/pcm_plugin.h                   |   2 +-
 sound/drivers/aloop.c                         |   2 +-
 sound/drivers/dummy.c                         |   5 +-
 sound/drivers/mpu401/mpu401.c                 |  16 +-
 sound/drivers/mpu401/mpu401_uart.c            |  31 +--
 sound/drivers/mtpav.c                         |  14 +-
 sound/drivers/mts64.c                         |  18 +-
 sound/drivers/opl3/opl3_lib.c                 |  18 +-
 sound/drivers/opl3/opl3_midi.c                |  95 ++++----
 sound/drivers/opl3/opl3_oss.c                 |  12 +-
 sound/drivers/opl3/opl3_synth.c               |   4 +-
 sound/drivers/opl4/opl4_lib.c                 |   8 +-
 sound/drivers/opl4/yrw801.c                   |   2 +-
 sound/drivers/pcsp/pcsp.c                     |  21 +-
 sound/drivers/pcsp/pcsp_lib.c                 |  38 ++--
 sound/drivers/pcsp/pcsp_mixer.c               |   2 +-
 sound/drivers/portman2x4.c                    |  19 +-
 sound/drivers/serial-u16550.c                 |  41 ++--
 sound/drivers/virmidi.c                       |   8 +-
 sound/drivers/vx/vx_core.c                    |  64 +++---
 sound/drivers/vx/vx_hwdep.c                   |   4 +-
 sound/drivers/vx/vx_pcm.c                     |  23 +-
 sound/drivers/vx/vx_uer.c                     |   3 +-
 sound/i2c/cs8427.c                            |  37 +--
 sound/i2c/other/ak4113.c                      |   2 -
 sound/i2c/other/ak4114.c                      |  12 -
 sound/i2c/other/ak4117.c                      |  13 --
 sound/i2c/other/ak4xxx-adda.c                 |   2 -
 sound/i2c/other/pt2258.c                      |   6 +-
 sound/i2c/tea6330t.c                          |   3 -
 sound/isa/ad1816a/ad1816a.c                   |  16 +-
 sound/isa/ad1816a/ad1816a_lib.c               |  16 +-
 sound/isa/als100.c                            |  16 +-
 sound/isa/azt2320.c                           |  14 +-
 sound/isa/cmi8328.c                           |  42 ++--
 sound/isa/cmi8330.c                           |  36 ++-
 sound/isa/cs423x/cs4236.c                     |  31 +--
 sound/isa/cs423x/cs4236_lib.c                 |  56 ++---
 sound/isa/es1688/es1688.c                     |   2 +-
 sound/isa/es1688/es1688_lib.c                 |  55 ++---
 sound/isa/es18xx.c                            |  87 +++----
 sound/isa/gus/gus_dma.c                       |  37 +--
 sound/isa/gus/gus_io.c                        | 215 ++++++++++++------
 sound/isa/gus/gus_irq.c                       |   7 +-
 sound/isa/gus/gus_main.c                      |  29 ++-
 sound/isa/gus/gus_mem.c                       |   2 +-
 sound/isa/gus/gus_pcm.c                       |  33 +--
 sound/isa/gus/gus_reset.c                     |   8 +-
 sound/isa/gus/gus_uart.c                      |  21 +-
 sound/isa/gus/gus_volume.c                    |   7 +-
 sound/isa/gus/gusclassic.c                    |   4 +-
 sound/isa/gus/gusextreme.c                    |   4 +-
 sound/isa/gus/gusmax.c                        |  16 +-
 sound/isa/gus/interwave.c                     |  61 ++---
 sound/isa/msnd/msnd.c                         |  46 ++--
 sound/isa/msnd/msnd_midi.c                    |   4 -
 sound/isa/msnd/msnd_pinnacle.c                | 184 +++++++--------
 sound/isa/opl3sa2.c                           |  46 ++--
 sound/isa/opti9xx/miro.c                      | 163 ++++++-------
 sound/isa/opti9xx/opti92x-ad1848.c            |  62 ++---
 sound/isa/sb/emu8000.c                        |  11 +-
 sound/isa/sb/emu8000_patch.c                  |   1 -
 sound/isa/sb/emu8000_synth.c                  |   2 +-
 sound/isa/sb/jazz16.c                         |  49 ++--
 sound/isa/sb/sb16.c                           |  42 ++--
 sound/isa/sb/sb16_csp.c                       |  38 ++--
 sound/isa/sb/sb16_main.c                      |  13 +-
 sound/isa/sb/sb8.c                            |  12 +-
 sound/isa/sb/sb_common.c                      |  27 +--
 sound/isa/sb/sb_mixer.c                       |   4 +-
 sound/isa/sc6000.c                            | 177 +++++++-------
 sound/isa/sscape.c                            |  96 ++++----
 sound/isa/wavefront/wavefront.c               |  61 ++---
 sound/isa/wavefront/wavefront_fx.c            |  36 +--
 sound/isa/wavefront/wavefront_midi.c          |  15 +-
 sound/isa/wavefront/wavefront_synth.c         | 196 ++++++++--------
 sound/isa/wss/wss_lib.c                       | 178 ++++++++-------
 sound/pci/asihpi/asihpi.c                     | 101 ++++----
 sound/pci/asihpi/hpioctl.c                    |   2 +-
 sound/pci/azt3328.c                           |   2 +-
 sound/pci/emu10k1/emu10k1_patch.c             |   5 +-
 sound/pci/intel8x0.c                          |   3 -
 sound/pci/intel8x0m.c                         |   3 -
 sound/pci/korg1212/korg1212.c                 |  30 +--
 sound/pci/lx6464es/lx_core.c                  |   8 +-
 sound/pci/lx6464es/lx_core.h                  |   3 -
 sound/pci/riptide/riptide.c                   | 193 ++++++++--------
 sound/pci/trident/trident_memory.c            |  10 +-
 sound/pcmcia/pdaudiocf/pdaudiocf.c            |  21 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_core.c       |  36 +--
 sound/pcmcia/pdaudiocf/pdaudiocf_irq.c        |   3 +-
 sound/pcmcia/vx/vxp_ops.c                     |  10 +-
 sound/pcmcia/vx/vxpocket.c                    |  25 +-
 sound/ppc/awacs.c                             |   4 +-
 sound/ppc/daca.c                              |   2 +-
 sound/ppc/keywest.c                           |   5 +-
 sound/ppc/pmac.c                              |  52 ++---
 sound/ppc/powermac.c                          |   2 +-
 sound/ppc/tumbler.c                           |  21 +-
 sound/sh/aica.c                               |   7 +-
 sound/sh/sh_dac_audio.c                       |   8 +-
 sound/sparc/amd7930.c                         |   8 +-
 sound/sparc/cs4231.c                          |  78 ++++---
 sound/synth/emux/emux_hwdep.c                 |   6 +-
 sound/synth/emux/emux_oss.c                   |  11 +-
 sound/synth/emux/emux_seq.c                   |  13 +-
 sound/synth/emux/emux_synth.c                 |  12 +-
 sound/synth/emux/soundfont.c                  |  67 +++---
 sound/usb/midi.c                              |   6 +-
 sound/usb/usx2y/us122l.c                      |  45 ++--
 sound/usb/usx2y/usX2Yhwdep.c                  |  25 +-
 sound/usb/usx2y/usb_stream.c                  |  92 ++++----
 sound/usb/usx2y/usb_stream.h                  |   1 +
 sound/usb/usx2y/usbusx2y.c                    |   7 +-
 sound/usb/usx2y/usbusx2yaudio.c               |  67 +++---
 sound/usb/usx2y/usx2yhwdeppcm.c               |  54 +++--
 127 files changed, 1950 insertions(+), 2094 deletions(-)

-- 
2.43.0

