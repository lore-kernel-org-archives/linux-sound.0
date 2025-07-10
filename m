Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA262D59E8
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142062; cv=none; b=ZcZg3Ef7H7ctey+AEKq1xz4EdG4HwY5TM74fASOhOD/zemmnIx6Wo5AGVk5HQ/ll0VAvSIgYB0HhvjamOUuz3HxnHgNfVzjEkgM1LOy8e/uT3pe+VYPeU+NuWHvZUdpDiGxSleSlxXMguikw2ngIPJAnX46DVC4V5tW+v0yQ/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142062; c=relaxed/simple;
	bh=U16UGOshdHqXOct1rJO0YijgvdYAtcexF1Zoj1MvMvY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=F1n/FtKV2VXzpouo1QqUOMNz/29NR7eogp6DbC7/1GNJZIeyixLwMGOibeYrCVG7xT6oBBYuhgnN6U50sT/mg/NrskrbrB61SEfO5Eud5U/4y9+ibjVHdbTLuxhmFVx/XD2x1IExJyREbqh2gpg5x3GVNVPs21AaMeq671MaPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FYeSEUs4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=17ueAnvL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FYeSEUs4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=17ueAnvL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FYeSEUs4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="17ueAnvL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FYeSEUs4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="17ueAnvL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC4FB2116F;
	Thu, 10 Jul 2025 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qUEEYxutruclB1QPV33tngbHDaTh4EYcmGMzO3WUzGM=;
	b=FYeSEUs4EvMMPaOK41lAVSzU/WObcraiWtEW8BOjoOv9ADagQWL81PLn7SQDfLUOxCp3a4
	MkDunrCEUvV6qE2iRwwrxOTe699sSqjc8Vdgqk6JPghkvJIC0pW1mVVhWk+5uwSm0Pxqg9
	Ovlr94i0acrl0b4bPW3DPJWribbvxwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qUEEYxutruclB1QPV33tngbHDaTh4EYcmGMzO3WUzGM=;
	b=17ueAnvLzMv5gEfkWAGPNffvTOf8WzZ/bvsWMCUVhb6VTYQn/MbXzurxAQw63MHlEM5Gle
	KEgGr4w5Qtj+/yBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qUEEYxutruclB1QPV33tngbHDaTh4EYcmGMzO3WUzGM=;
	b=FYeSEUs4EvMMPaOK41lAVSzU/WObcraiWtEW8BOjoOv9ADagQWL81PLn7SQDfLUOxCp3a4
	MkDunrCEUvV6qE2iRwwrxOTe699sSqjc8Vdgqk6JPghkvJIC0pW1mVVhWk+5uwSm0Pxqg9
	Ovlr94i0acrl0b4bPW3DPJWribbvxwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qUEEYxutruclB1QPV33tngbHDaTh4EYcmGMzO3WUzGM=;
	b=17ueAnvLzMv5gEfkWAGPNffvTOf8WzZ/bvsWMCUVhb6VTYQn/MbXzurxAQw63MHlEM5Gle
	KEgGr4w5Qtj+/yBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91572136DC;
	Thu, 10 Jul 2025 10:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rFNEIuiQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 000/103] ALSA: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:42 +0200
Message-ID: <20250710100727.22653-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Hi,

this is a collection of small and pretty trivial patches to replace
the strcpy() calls with strscpy().  Most of changes (except for a few
last ones) are systematic replacement with strscpy() where the copy is
done against arrays, so pretty safe.


Takashi

===

Takashi Iwai (103):
  ALSA: control: Use safer strscpy() instead of strcpy()
  ALSA: rawmidi: Use safer strscpy() instead of strcpy()
  ALSA: seq: Use safer strscpy() instead of strcpy()
  ALSA: mpu401: Use safer strscpy() instead of strcpy()
  ALSA: opl3: Use safer strscpy() instead of strcpy()
  ALSA: opl4: Use safer strscpy() instead of strcpy()
  ALSA: pcsp: Use safer strscpy() instead of strcpy()
  ALSA: portman2x4: Use safer strscpy() instead of strcpy()
  ALSA: serial-generic: Use safer strscpy() instead of strcpy()
  ALSA: serial-u16550: Use safer strscpy() instead of strcpy()
  ALSA: virmidi: Use safer strscpy() instead of strcpy()
  ALSA: vx: Use safer strscpy() instead of strcpy()
  ALSA: firewire: bebob: Use safer strscpy() instead of strcpy()
  ALSA: firewire: dice: Use safer strscpy() instead of strcpy()
  ALSA: firewire: digi00x: Use safer strscpy() instead of strcpy()
  ALSA: firewire: fireface: Use safer strscpy() instead of strcpy()
  ALSA: firewire: fireworks: Use safer strscpy() instead of strcpy()
  ALSA: firewire: isight: Use safer strscpy() instead of strcpy()
  ALSA: firewire: motu: Use safer strscpy() instead of strcpy()
  ALSA: firewire: oxfw: Use safer strscpy() instead of strcpy()
  ALSA: firewire: tascam: Use safer strscpy() instead of strcpy()
  ALSA: ad1816a: Use safer strscpy() instead of strcpy()
  ALSA: adlib: Use safer strscpy() instead of strcpy()
  ALSA: als100: Use safer strscpy() instead of strcpy()
  ALSA: cmi8328: Use safer strscpy() instead of strcpy()
  ALSA: cmi8330: Use safer strscpy() instead of strcpy()
  ALSA: cs423x: Use safer strscpy() instead of strcpy()
  ALSA: es1688: Use safer strscpy() instead of strcpy()
  ALSA: es18xx: Use safer strscpy() instead of strcpy()
  ALSA: galaxy: Use safer strscpy() instead of strcpy()
  ALSA: gus: Use safer strscpy() instead of strcpy()
  ALSA: msnd: Use safer strscpy() instead of strcpy()
  ALSA: opl3sa2: Use safer strscpy() instead of strcpy()
  ALSA: opti9xx: Use safer strscpy() instead of strcpy()
  ALSA: sc6000: Use safer strscpy() instead of strcpy()
  ALSA: sscape: Use safer strscpy() instead of strcpy()
  ALSA: wavefront: Use safer strscpy() instead of strcpy()
  ALSA: wss: Use safer strscpy() instead of strcpy()
  ALSA: mips: Use safer strscpy() instead of strcpy()
  ALSA: parisc: Use safer strscpy() instead of strcpy()
  ALSA: ac97: Use safer strscpy() instead of strcpy()
  ALSA: ad1889: Use safer strscpy() instead of strcpy()
  ALSA: ak4531: Use safer strscpy() instead of strcpy()
  ALSA: ali5451: Use safer strscpy() instead of strcpy()
  ALSA: als300: Use safer strscpy() instead of strcpy()
  ALSA: als4000: Use safer strscpy() instead of strcpy()
  ALSA: asihpi: Use safer strscpy() instead of strcpy()
  ALSA: atiixp: Use safer strscpy() instead of strcpy()
  ALSA: au88x0: Use safer strscpy() instead of strcpy()
  ALSA: aw2: Use safer strscpy() instead of strcpy()
  ALSA: azt3328: Use safer strscpy() instead of strcpy()
  ALSA: bt87x: Use safer strscpy() instead of strcpy()
  ALSA: ca0106: Use safer strscpy() instead of strcpy()
  ALSA: cmipci: Use safer strscpy() instead of strcpy()
  ALSA: cs4281: Use safer strscpy() instead of strcpy()
  ALSA: cs46xx: Use safer strscpy() instead of strcpy()
  ALSA: cs5530: Use safer strscpy() instead of strcpy()
  ALSA: cs5535audio: Use safer strscpy() instead of strcpy()
  ALSA: ctxfi: Use safer strscpy() instead of strcpy()
  ALSA: echoaudio: Use safer strscpy() instead of strcpy()
  ALSA: emu10k1: Use safer strscpy() instead of strcpy()
  ALSA: ens1370: Use safer strscpy() instead of strcpy()
  ALSA: es1938: Use safer strscpy() instead of strcpy()
  ALSA: es1968: Use safer strscpy() instead of strcpy()
  ALSA: fm801: Use safer strscpy() instead of strcpy()
  ALSA: ice1712: Use safer strscpy() instead of strcpy()
  ALSA: ice1724: Use safer strscpy() instead of strcpy()
  ALSA: intel8x0: Use safer strscpy() instead of strcpy()
  ALSA: korg1212: Use safer strscpy() instead of strcpy()
  ALSA: lola: Use safer strscpy() instead of strcpy()
  ALSA: lx6464es: Use safer strscpy() instead of strcpy()
  ALSA: maestro3: Use safer strscpy() instead of strcpy()
  ALSA: mixart: Use safer strscpy() instead of strcpy()
  ALSA: nm256: Use safer strscpy() instead of strcpy()
  ALSA: oxygen: Use safer strscpy() instead of strcpy()
  ALSA: pcxhr: Use safer strscpy() instead of strcpy()
  ALSA: riptide: Use safer strscpy() instead of strcpy()
  ALSA: rme32: Use safer strscpy() instead of strcpy()
  ALSA: rme96: Use safer strscpy() instead of strcpy()
  ALSA: hdsp: Use safer strscpy() instead of strcpy()
  ALSA: hdspm: Use safer strscpy() instead of strcpy()
  ALSA: rme9652: Use safer strscpy() instead of strcpy()
  ALSA: Use safer strscpy() instead of strcpy()
  ALSA: sonicvibes: Use safer strscpy() instead of strcpy()
  ALSA: trident: Use safer strscpy() instead of strcpy()
  ALSA: via82xx: Use safer strscpy() instead of strcpy()
  ALSA: ymfpci: Use safer strscpy() instead of strcpy()
  ALSA: pdaudiocf: Use safer strscpy() instead of strcpy()
  ALSA: vxpocket: Use safer strscpy() instead of strcpy()
  ALSA: ppc: Use safer strscpy() instead of strcpy()
  ALSA: sh: Use safer strscpy() instead of strcpy()
  ALSA: sparc: Use safer strscpy() instead of strcpy()
  ALSA: spi: Use safer strscpy() instead of strcpy()
  ALSA: synth: Use safer strscpy() instead of strcpy()
  ALSA: 6fire: Use safer strscpy() instead of strcpy()
  ALSA: line6: Use safer strscpy() instead of strcpy()
  ALSA: usx2y: Use safer strscpy() instead of strcpy()
  ALSA: ua101: Use safer strscpy() instead of strcpy()
  ALSA: usb-audio: Use safer strscpy() instead of strcpy()
  ALSA: ac97: Copy string more safely
  ALSA: cmipci: Copy string more safely
  ALSA: usb-audio: Copy string more safely
  ALSA: core: Copy string more safely

 sound/core/control.c                       |  2 +-
 sound/core/init.c                          | 16 +++++-----
 sound/core/rawmidi.c                       |  6 ++--
 sound/core/seq/oss/seq_oss_init.c          |  4 +--
 sound/core/seq/seq_clientmgr.c             |  2 +-
 sound/core/seq/seq_midi.c                  |  2 +-
 sound/core/seq/seq_system.c                |  4 +--
 sound/core/seq/seq_ump_client.c            |  2 +-
 sound/core/seq/seq_virmidi.c               |  2 +-
 sound/drivers/mpu401/mpu401.c              |  4 +--
 sound/drivers/opl3/opl3_lib.c              | 14 ++++-----
 sound/drivers/opl4/opl4_lib.c              |  2 +-
 sound/drivers/pcsp/pcsp.c                  |  4 +--
 sound/drivers/pcsp/pcsp_lib.c              |  2 +-
 sound/drivers/pcsp/pcsp_mixer.c            |  2 +-
 sound/drivers/portman2x4.c                 |  6 ++--
 sound/drivers/serial-generic.c             |  4 +--
 sound/drivers/serial-u16550.c              |  6 ++--
 sound/drivers/virmidi.c                    |  6 ++--
 sound/drivers/vx/vx_core.c                 |  2 +-
 sound/drivers/vx/vx_mixer.c                |  2 +-
 sound/drivers/vx/vx_pcm.c                  |  2 +-
 sound/firewire/bebob/bebob.c               |  6 ++--
 sound/firewire/bebob/bebob_hwdep.c         |  2 +-
 sound/firewire/dice/dice-hwdep.c           |  2 +-
 sound/firewire/dice/dice-pcm.c             |  2 +-
 sound/firewire/dice/dice.c                 | 10 +++----
 sound/firewire/digi00x/digi00x-hwdep.c     |  2 +-
 sound/firewire/digi00x/digi00x.c           |  6 ++--
 sound/firewire/fireface/ff-hwdep.c         |  2 +-
 sound/firewire/fireface/ff.c               |  6 ++--
 sound/firewire/fireworks/fireworks.c       |  6 ++--
 sound/firewire/fireworks/fireworks_hwdep.c |  2 +-
 sound/firewire/isight.c                    |  8 ++---
 sound/firewire/motu/motu-hwdep.c           |  2 +-
 sound/firewire/motu/motu-pcm.c             |  2 +-
 sound/firewire/motu/motu.c                 |  6 ++--
 sound/firewire/oxfw/oxfw-hwdep.c           |  2 +-
 sound/firewire/oxfw/oxfw-pcm.c             |  2 +-
 sound/firewire/oxfw/oxfw.c                 |  6 ++--
 sound/firewire/tascam/tascam-hwdep.c       |  2 +-
 sound/firewire/tascam/tascam.c             |  6 ++--
 sound/isa/ad1816a/ad1816a.c                |  4 +--
 sound/isa/ad1816a/ad1816a_lib.c            |  6 ++--
 sound/isa/adlib.c                          |  4 +--
 sound/isa/als100.c                         |  8 ++---
 sound/isa/cmi8328.c                        | 20 ++++++-------
 sound/isa/cmi8330.c                        |  8 ++---
 sound/isa/cs423x/cs4236.c                  |  2 +-
 sound/isa/cs423x/cs4236_lib.c              |  2 +-
 sound/isa/es1688/es1688_lib.c              |  4 +--
 sound/isa/es18xx.c                         |  2 +-
 sound/isa/galaxy/galaxy.c                  |  4 +--
 sound/isa/gus/gus_main.c                   | 16 +++++-----
 sound/isa/gus/gus_mixer.c                  |  2 +-
 sound/isa/gus/gus_pcm.c                    |  2 +-
 sound/isa/gus/gus_timer.c                  |  4 +--
 sound/isa/gus/gus_uart.c                   |  2 +-
 sound/isa/gus/gusextreme.c                 |  8 ++---
 sound/isa/gus/gusmax.c                     | 16 +++++-----
 sound/isa/gus/interwave.c                  | 34 +++++++++++-----------
 sound/isa/msnd/msnd.c                      |  2 +-
 sound/isa/msnd/msnd_pinnacle.c             | 22 +++++++-------
 sound/isa/msnd/msnd_pinnacle_mixer.c       |  2 +-
 sound/isa/opl3sa2.c                        | 20 ++++++-------
 sound/isa/opti9xx/miro.c                   |  8 ++---
 sound/isa/opti9xx/opti92x-ad1848.c         | 18 ++++++------
 sound/isa/sc6000.c                         | 20 ++++++-------
 sound/isa/sscape.c                         |  4 +--
 sound/isa/wavefront/wavefront.c            | 16 +++++-----
 sound/isa/wss/wss_lib.c                    |  6 ++--
 sound/mips/hal2.c                          |  6 ++--
 sound/parisc/harmony.c                     |  8 ++---
 sound/pci/ac97/ac97_codec.c                | 23 ++++++++-------
 sound/pci/ac97/ac97_local.h                |  2 +-
 sound/pci/ac97/ac97_patch.c                |  8 ++---
 sound/pci/ac97/ac97_proc.c                 |  2 +-
 sound/pci/ad1889.c                         |  6 ++--
 sound/pci/ak4531_codec.c                   |  2 +-
 sound/pci/ali5451/ali5451.c                |  6 ++--
 sound/pci/als300.c                         |  4 +--
 sound/pci/als4000.c                        |  4 +--
 sound/pci/asihpi/asihpi.c                  | 10 +++----
 sound/pci/asihpi/hpi6000.c                 |  2 +-
 sound/pci/atiixp.c                         | 10 +++----
 sound/pci/atiixp_modem.c                   |  6 ++--
 sound/pci/au88x0/au88x0.c                  |  4 +--
 sound/pci/au88x0/au88x0_mixer.c            |  2 +-
 sound/pci/aw2/aw2-alsa.c                   | 10 +++----
 sound/pci/azt3328.c                        | 12 ++++----
 sound/pci/bt87x.c                          |  6 ++--
 sound/pci/ca0106/ca0106_main.c             |  6 ++--
 sound/pci/ca0106/ca0106_mixer.c            |  4 +--
 sound/pci/ca0106/ca_midi.c                 |  2 +-
 sound/pci/cmipci.c                         | 25 ++++++++--------
 sound/pci/cs4281.c                         |  8 ++---
 sound/pci/cs46xx/cs46xx.c                  |  4 +--
 sound/pci/cs46xx/cs46xx_lib.c              | 20 ++++++-------
 sound/pci/cs46xx/dsp_spos.c                |  8 ++---
 sound/pci/cs5530.c                         |  4 +--
 sound/pci/cs5535audio/cs5535audio.c        |  4 +--
 sound/pci/cs5535audio/cs5535audio_pcm.c    |  2 +-
 sound/pci/ctxfi/ctmixer.c                  |  2 +-
 sound/pci/echoaudio/midi.c                 |  2 +-
 sound/pci/emu10k1/emumpu401.c              |  2 +-
 sound/pci/emu10k1/emupcm.c                 | 10 +++----
 sound/pci/emu10k1/p16v.c                   |  2 +-
 sound/pci/emu10k1/timer.c                  |  2 +-
 sound/pci/ens1370.c                        | 10 +++----
 sound/pci/es1938.c                         |  8 ++---
 sound/pci/es1968.c                         | 14 ++++-----
 sound/pci/fm801.c                          |  6 ++--
 sound/pci/ice1712/ice1712.c                | 14 ++++-----
 sound/pci/ice1712/ice1724.c                | 18 ++++++------
 sound/pci/intel8x0.c                       | 14 ++++-----
 sound/pci/intel8x0m.c                      | 10 +++----
 sound/pci/korg1212/korg1212.c              |  6 ++--
 sound/pci/lola/lola.c                      |  4 +--
 sound/pci/lx6464es/lx6464es.c              |  4 +--
 sound/pci/maestro3.c                       |  8 ++---
 sound/pci/mixart/mixart.c                  |  6 ++--
 sound/pci/nm256/nm256.c                    |  6 ++--
 sound/pci/oxygen/oxygen_lib.c              |  6 ++--
 sound/pci/oxygen/oxygen_pcm.c              |  8 ++---
 sound/pci/pcxhr/pcxhr.c                    |  4 +--
 sound/pci/riptide/riptide.c                |  6 ++--
 sound/pci/rme32.c                          | 12 ++++----
 sound/pci/rme96.c                          | 16 +++++-----
 sound/pci/rme9652/hdsp.c                   | 12 ++++----
 sound/pci/rme9652/hdspm.c                  |  8 ++---
 sound/pci/rme9652/rme9652.c                | 12 ++++----
 sound/pci/sis7019.c                        |  6 ++--
 sound/pci/sonicvibes.c                     |  8 ++---
 sound/pci/trident/trident.c                |  6 ++--
 sound/pci/trident/trident_main.c           | 14 ++++-----
 sound/pci/via82xx.c                        | 20 ++++++-------
 sound/pci/via82xx_modem.c                  |  4 +--
 sound/pci/ymfpci/ymfpci.c                  |  2 +-
 sound/pci/ymfpci/ymfpci_main.c             |  8 ++---
 sound/pcmcia/pdaudiocf/pdaudiocf.c         |  2 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c     |  2 +-
 sound/pcmcia/vx/vxpocket.c                 |  2 +-
 sound/ppc/awacs.c                          |  2 +-
 sound/ppc/burgundy.c                       |  2 +-
 sound/ppc/daca.c                           |  2 +-
 sound/ppc/pmac.c                           |  2 +-
 sound/ppc/powermac.c                       |  8 ++---
 sound/ppc/snd_ps3.c                        |  8 ++---
 sound/sh/aica.c                            |  8 ++---
 sound/sh/sh_dac_audio.c                    |  6 ++--
 sound/sparc/cs4231.c                       | 14 ++++-----
 sound/spi/at73c213.c                       |  8 ++---
 sound/synth/emux/emux_hwdep.c              |  2 +-
 sound/synth/emux/emux_oss.c                |  2 +-
 sound/usb/6fire/chip.c                     |  4 +--
 sound/usb/6fire/midi.c                     |  2 +-
 sound/usb/6fire/pcm.c                      |  2 +-
 sound/usb/card.c                           | 13 +++++----
 sound/usb/line6/driver.c                   |  8 ++---
 sound/usb/line6/midi.c                     |  4 +--
 sound/usb/line6/pcm.c                      |  2 +-
 sound/usb/line6/toneport.c                 |  2 +-
 sound/usb/midi.c                           |  2 +-
 sound/usb/midi2.c                          |  3 +-
 sound/usb/misc/ua101.c                     |  6 ++--
 sound/usb/mixer.c                          | 24 +++++++--------
 sound/usb/mixer_scarlett.c                 | 31 +++++++++++---------
 sound/usb/mixer_scarlett2.c                | 14 +++++----
 sound/usb/proc.c                           |  2 +-
 sound/usb/stream.c                         |  5 ++--
 sound/usb/usx2y/us122l.c                   |  2 +-
 sound/usb/usx2y/usX2Yhwdep.c               |  2 +-
 sound/usb/usx2y/usbusx2y.c                 |  2 +-
 173 files changed, 588 insertions(+), 576 deletions(-)

-- 
2.50.0

