Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1F346FCA
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595014; cv=none; b=N9ew1tuRPnJmStqVLr0Dx3BqA3D9M6uzM61vIxc91dFg0WW4x2pDW14+V73fQjTWZ6c9ld2Xm+anIDrlw48OOmeDc19LAz22TI8oOLfpFl/9VHm6mPYIn1ApbafH5hqWQsGdl24F5YBpGmqXrKfQ9vo4VlFlAPRk4LyVyqlvwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595014; c=relaxed/simple;
	bh=6dgxDVPXGEL8zGn68bc3A/vBil16MHZb7WyZfVVCztM=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=BaI+7kTyPQUucwzcPQ1+iFyKTpdrAdNnJCWUmAxjdNTREh2ChG0sT0Km5qsxD4UDMqyNpC/qzS6aIBN08nQH1fZk5tKPj/MpgPfaa6HT4n9TeRLSbScphmHvuFoJ1mlF+FoaPashRjxUrLErUHMMmumVrLvBVYa62Jsu2BqMuJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ld+vlCuQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kT0mtwaF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ld+vlCuQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kT0mtwaF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ld+vlCuQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kT0mtwaF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ld+vlCuQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kT0mtwaF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D021B3E6C3;
	Fri, 20 Feb 2026 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771595010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7PrXxxxM3wJ/d1jvKymQniQEhUMsCQcAUoOSZzgFY7g=;
	b=Ld+vlCuQvZEJ1EFyntksCFs2YaxCpw03T8x6VrNPXm32gq5/7ZU1IyLXcYfK3Hf76CC15I
	2AJayCmsx+VJNjPCg2hSGaTBZykTmEHYh8Iu1EwHNIbpM+OSemZLBz0PzAO6u8sg1VVwNf
	fVsGjKWnlQ9yTpN9zECUbPQz7Yu+tHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771595010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7PrXxxxM3wJ/d1jvKymQniQEhUMsCQcAUoOSZzgFY7g=;
	b=kT0mtwaFbrXQceADeoz2R3j4LN/SNu+8qtz3Hsbau2ZqDZGgCkTgr/bXBiCBefmS5cv+mE
	DM6DdnsXTdv61lAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ld+vlCuQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kT0mtwaF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771595010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7PrXxxxM3wJ/d1jvKymQniQEhUMsCQcAUoOSZzgFY7g=;
	b=Ld+vlCuQvZEJ1EFyntksCFs2YaxCpw03T8x6VrNPXm32gq5/7ZU1IyLXcYfK3Hf76CC15I
	2AJayCmsx+VJNjPCg2hSGaTBZykTmEHYh8Iu1EwHNIbpM+OSemZLBz0PzAO6u8sg1VVwNf
	fVsGjKWnlQ9yTpN9zECUbPQz7Yu+tHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771595010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7PrXxxxM3wJ/d1jvKymQniQEhUMsCQcAUoOSZzgFY7g=;
	b=kT0mtwaFbrXQceADeoz2R3j4LN/SNu+8qtz3Hsbau2ZqDZGgCkTgr/bXBiCBefmS5cv+mE
	DM6DdnsXTdv61lAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CBF23EA65;
	Fri, 20 Feb 2026 13:43:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id onPLJAJlmGkNcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Feb 2026 13:43:30 +0000
Date: Fri, 20 Feb 2026 14:43:30 +0100
Message-ID: <87qzqfo7i5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: D021B3E6C3
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

Linus,

please pull sound fixes for v7.0-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.0-rc1

The topmost commit is 89339d889d63a4f981f185d048796762e86aa6c0

----------------------------------------------------------------

sound fixes for 7.0-rc1

here are a bunch of updates, but there should be no big surprises;
mostly device-specific quirks and fix-ups or non-code changes.

- Quirks for ASoC AMD, HD-audio and USB-audio
- Fixes in ASoC fsl, rockchip, renesas, aw codecs
- Fixes for USB-audio packet handling in the implicit feedback mode
- Updates of SPDX license IDs in some files

----------------------------------------------------------------

Aaron Erhardt (1):
      ALSA: hda/hdmi: Add quirk for TUXEDO IBS14G6

Alexandre Ferrieux (1):
      ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init

Baojun Xu (1):
      ALSA: hda/tas2781: Ignore reset check for SPI device

Claudiu Beznea (1):
      ASoC: renesas: rz-ssi: Fix playback and capture

Detlev Casanova (1):
      ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk

Eric Naim (1):
      ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)

Erik Sanjaya (1):
      ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3405MA

Gustavo Salvini (1):
      ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR

Jack Yu (1):
      ASoC: rt721-sdca: Fix issue of fail to detect OMTP jack type

Lewis Mason (1):
      ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)

Luca Weiss (1):
      ASoC: qcom: sm8250: Add quinary MI2S support

Niranjan H Y (1):
      ASoC: tas2783A: add explicit port prepare handling

Shengjiu Wang (4):
      ASoC: dt-bindings: asahi-kasei,ak5558: Reference common DAI properties
      ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
      ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
      ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names

Takashi Iwai (5):
      ALSA: usb-audio: Update the number of packets properly at receiving
      ALSA: usb-audio: Optimize the copy of packet sizes for implicit fb handling
      ALSA: usb-audio: Add sanity check for OOB writes at silencing
      ALSA: usb-audio: Avoid potentially repeated XRUN error messages
      ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314

Tim Bird (3):
      ALSA: core: Add SPDX license id to files
      ALSA: isa: Add SPDX id lines to some files
      ALSA: echoaudio: Add SPDX ids to some files

Vijendar Mukunda (2):
      ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
      ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models

Ziyi Guo (1):
      ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()

ºúÁ¬ÇÚ (1):
      ALSA: usb-audio: Add iface reset and delay quirk for GHW-123P

---
 .../bindings/sound/asahi-kasei,ak4458.yaml         |  6 +-
 .../bindings/sound/asahi-kasei,ak5558.yaml         |  9 ++-
 sound/core/oss/copy.c                              | 17 +-----
 sound/core/oss/io.c                                | 17 +-----
 sound/core/oss/linear.c                            | 17 +-----
 sound/core/oss/mulaw.c                             | 16 +-----
 sound/core/oss/pcm_plugin.c                        | 17 +-----
 sound/core/oss/rate.c                              | 17 +-----
 sound/core/oss/route.c                             | 17 +-----
 sound/core/pcm_misc.c                              | 19 +-----
 sound/hda/codecs/conexant.c                        | 10 ++++
 sound/hda/codecs/hdmi/hdmi.c                       |  1 +
 sound/hda/codecs/realtek/alc269.c                  | 14 ++++-
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     | 20 +++----
 sound/hda/core/trace.c                             |  1 +
 sound/isa/gus/interwave-stb.c                      |  1 +
 sound/isa/msnd/msnd_classic.c                      |  1 +
 sound/isa/opti9xx/opti92x-cs4231.c                 |  1 +
 sound/isa/opti9xx/opti93x.c                        |  1 +
 sound/isa/sb/jazz16.c                              |  7 +--
 sound/isa/sb/sbawe.c                               |  1 +
 sound/oss/dmasound/dmasound_core.c                 |  5 +-
 sound/pci/echoaudio/darla20_dsp.c                  | 17 +-----
 sound/pci/echoaudio/darla24_dsp.c                  | 17 +-----
 sound/pci/echoaudio/echo3g_dsp.c                   | 17 +-----
 sound/pci/echoaudio/echoaudio.h                    | 17 +-----
 sound/pci/echoaudio/echoaudio_3g.c                 | 17 +-----
 sound/pci/echoaudio/echoaudio_dsp.c                | 17 +-----
 sound/pci/echoaudio/echoaudio_dsp.h                | 17 +-----
 sound/pci/echoaudio/echoaudio_gml.c                | 17 +-----
 sound/pci/echoaudio/gina20_dsp.c                   | 17 +-----
 sound/pci/echoaudio/gina24_dsp.c                   | 17 +-----
 sound/pci/echoaudio/indigo_dsp.c                   | 17 +-----
 sound/pci/echoaudio/indigo_express_dsp.c           | 17 +-----
 sound/pci/echoaudio/indigodj_dsp.c                 | 17 +-----
 sound/pci/echoaudio/indigodjx_dsp.c                | 17 +-----
 sound/pci/echoaudio/indigoio_dsp.c                 | 17 +-----
 sound/pci/echoaudio/indigoiox_dsp.c                | 17 +-----
 sound/pci/echoaudio/layla20_dsp.c                  | 17 +-----
 sound/pci/echoaudio/layla24_dsp.c                  | 16 +-----
 sound/pci/echoaudio/mia_dsp.c                      | 17 +-----
 sound/pci/echoaudio/midi.c                         | 17 +-----
 sound/pci/echoaudio/mona_dsp.c                     | 17 +-----
 sound/pci/ens1371.c                                |  1 +
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            | 16 ++++++
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 37 ++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                      |  8 ++-
 sound/soc/codecs/aw88261.c                         |  3 +-
 sound/soc/codecs/rt721-sdca.c                      |  4 +-
 sound/soc/codecs/tas2783-sdw.c                     | 43 ++++++++++++++
 sound/soc/fsl/fsl_xcvr.c                           |  3 -
 sound/soc/qcom/sm8250.c                            |  8 +++
 sound/soc/renesas/rz-ssi.c                         |  2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 10 ++++
 sound/usb/card.h                                   |  2 +-
 sound/usb/endpoint.c                               | 67 +++++++++++++---------
 sound/usb/quirks.c                                 |  2 +
 57 files changed, 247 insertions(+), 530 deletions(-)

