Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9B1D7E42
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 17:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765472830; cv=none; b=STtjjHdbnZVrH6LpeY0SJ2H7hlDo8J5twlt38uFwevjjopBwgSgo5bQHALUvsj7cQMSIzABTfMNqoCsWxsPZaJQukS0PfGoFi3ekMJmaWgYVqNXb14yY6Az+OdZv2N7YkS89JwdTFKUpyOYMLySCpnlHXZBRO2EQRzCCfOLxUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765472830; c=relaxed/simple;
	bh=WWbq98uNJC8y7XIaAnMfpIdeRyxcr23avyHwi5wfJ60=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=sYmjl1VBeVH4wgVVLlA2zqVYmyzyQCAdKzoEh/oD14UtdxmS1jVShP6N+HI4UaMe1lDT+ahJH8BJ3R6h6arp9rBvo81gw817rhhBdRU2MuhTLrI/Jj4wBqsZSF8TrvzFFjwV49XO13YKWdPSD+rybEwG+w5SC32OqTwY8DqGyz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cARUUODk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=42BlJf3i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cARUUODk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=42BlJf3i; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cARUUODk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42BlJf3i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cARUUODk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42BlJf3i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5DD0F5BE11;
	Thu, 11 Dec 2025 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765472821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=dcqYQxFry4YMD4O33qi8RCQXRI+W8JX+xOCKsTI0HMM=;
	b=cARUUODkJjcYY7/Pt1h8JSgsGzx5fMwEbFHiWlsg/umCeVcnhrn5R27yo+3OgG9PskH42k
	p3BKF4yiPN85ANmKhCfNrBn7dtWuwOsZXJMxBAMwSEQGJdWAas5zSKmb0u2ZMUjAw2iPLC
	99TQg0I1QT+7sb5td+rU/iap41gFNUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765472821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=dcqYQxFry4YMD4O33qi8RCQXRI+W8JX+xOCKsTI0HMM=;
	b=42BlJf3ia+Le86h4wwDI0a/vJd+fIfLF88g5YMytfCWvhly/CfWEGgMmuFoaOTLrlTSgdj
	IKBugH8zkxf8OdBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765472821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=dcqYQxFry4YMD4O33qi8RCQXRI+W8JX+xOCKsTI0HMM=;
	b=cARUUODkJjcYY7/Pt1h8JSgsGzx5fMwEbFHiWlsg/umCeVcnhrn5R27yo+3OgG9PskH42k
	p3BKF4yiPN85ANmKhCfNrBn7dtWuwOsZXJMxBAMwSEQGJdWAas5zSKmb0u2ZMUjAw2iPLC
	99TQg0I1QT+7sb5td+rU/iap41gFNUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765472821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=dcqYQxFry4YMD4O33qi8RCQXRI+W8JX+xOCKsTI0HMM=;
	b=42BlJf3ia+Le86h4wwDI0a/vJd+fIfLF88g5YMytfCWvhly/CfWEGgMmuFoaOTLrlTSgdj
	IKBugH8zkxf8OdBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D5023EA63;
	Thu, 11 Dec 2025 17:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I8zSBTX6OmmxUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Dec 2025 17:07:01 +0000
Date: Thu, 11 Dec 2025 18:07:00 +0100
Message-ID: <87zf7p9ccr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.984];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]

Linus,

please pull sound fixes for v6.19-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.19-rc1

The topmost commit is fd324768eb2c132bb111ba76675b4c72406251d9

----------------------------------------------------------------

sound fixes for 6.19-rc1

The rest for 6.19 merge window.  The only slightly large change is
the enablement of CIX HD-audio controller, which took a bit time to
be cooked up, while most of other changes are device-specific small
trivial fixes.

- Default disablement of the kconfig for decades old pre-release
  alsa-lib PCM API; it's only the default config value change, so
  it can't lead to any regressions for the existing setups
- Support for CIX HD-audio controller
- A few ASoC ACP fixes
- Fixes for ASoC cirrus, bcm, wcd, qcom, ak platforms
- Trivial hardening for FireWire and USB-audio
- HD-audio Intel binding fix and quirks

----------------------------------------------------------------

Andres J Rosa (1):
      ALSA: uapi: Fix typo in asound.h comment

Baojun Xu (1):
      ALSA: hda/tas2781: Add new quirk for HP new project

David Heidelberg (1):
      ALSA: Do not build obsolete API

Denis Arefev (1):
      ALSA: hda: cs35l41: Fix NULL pointer dereference in cs35l41_hda_read_acpi()

Eric Biggers (1):
      ASoC: cros_ec_codec: Remove unnecessary selection of CRYPTO

Eric Naim (1):
      ASoC: cs35l41: Always return 0 when a subsystem ID is found

Haotian Zhang (1):
      ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()

HariKrishna Sagala (1):
      ALSA: usb-audio: Initialize status1 to fix uninitialized symbol errors

Hemalatha Pinnamreddy (2):
      ASoC: amd: acp: Audio is not resuming after s0ix
      ASoC: amd: acp: update tdm channels for specific DAI

Joakim Zhang (3):
      ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
      ALSA: hda/core: add addr_offset field for bus address translation
      ALSA: hda: add CIX IPBLOQ HDA controller support

Johan Hovold (4):
      ASoC: codecs: wcd937x: fix OF node leaks on probe failure
      ASoC: codecs: wcd938x: fix OF node leaks on probe failure
      ASoC: codecs: wcd939x: fix OF node leaks on probe failure
      ASoc: qcom: q6afe: fix bad guard conversion

Junrui Luo (2):
      ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
      ALSA: firewire-motu: add bounds check in put_user loop for DSP events

Krzysztof Kozlowski (2):
      ASoC: codecs: nau8325: Silence uninitialized variables warnings
      ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)

Nathan Chancellor (1):
      ALSA: hda: cix-ipbloq: Use modern PM ops

Richard Fitzgerald (2):
      ASoC: cs-amp-lib: Revert use of __free(kfree) back to normal C cleanup
      ASoC: cs35l56: Fix incorrect select SND_SOC_CS35L56_CAL_SYSFS_COMMON

Shengjiu Wang (3):
      ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
      ASoC: ak4458: Disable regulator when error happens
      ASoC: ak5558: Disable regulator when error happens

Stefan Binding (2):
      ALSA: hda/realtek: Add support for HP Turbine Laptops
      ALSA: hda/realtek: Add support for ASUS UM3406GA

Takashi Iwai (1):
      ALSA: hda: intel-dsp-config: Prefer legacy driver as fallback

---
 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |   5 +-
 .../bindings/sound/cix,sky1-ipbloq-hda.yaml        |  62 +++
 arch/arm/configs/am200epdkit_defconfig             |   1 -
 arch/arm/configs/lpc32xx_defconfig                 |   1 -
 arch/arm/configs/omap1_defconfig                   |   1 -
 arch/arm/configs/tegra_defconfig                   |   1 -
 arch/mips/configs/gcw0_defconfig                   |   1 -
 arch/mips/configs/loongson1_defconfig              |   1 -
 arch/mips/configs/qi_lb60_defconfig                |   1 -
 arch/mips/configs/rbtx49xx_defconfig               |   1 -
 arch/mips/configs/rs90_defconfig                   |   1 -
 arch/powerpc/configs/85xx-hw.config                |   1 -
 arch/powerpc/configs/86xx-hw.config                |   1 -
 arch/powerpc/configs/mpc5200_defconfig             |   1 -
 arch/powerpc/configs/ppc6xx_defconfig              |   1 -
 arch/sh/configs/edosk7760_defconfig                |   1 -
 arch/sh/configs/se7724_defconfig                   |   1 -
 arch/sh/configs/sh7785lcr_32bit_defconfig          |   1 -
 include/sound/hdaudio.h                            |   3 +
 include/uapi/sound/asound.h                        |   2 +-
 sound/core/Kconfig                                 |   2 +-
 sound/firewire/motu/motu-hwdep.c                   |   7 +-
 sound/hda/codecs/realtek/alc269.c                  |   4 +
 sound/hda/codecs/side-codecs/cs35l41_hda.c         |   2 +
 sound/hda/controllers/Kconfig                      |  14 +
 sound/hda/controllers/Makefile                     |   2 +
 sound/hda/controllers/cix-ipbloq.c                 | 436 +++++++++++++++++++++
 sound/hda/core/bus.c                               |   1 +
 sound/hda/core/controller.c                        |  12 +-
 sound/hda/core/intel-dsp-config.c                  |   3 +-
 sound/hda/core/stream.c                            |  10 +-
 sound/soc/amd/acp/acp-i2s.c                        |   2 +
 sound/soc/amd/acp/acp-legacy-common.c              |  30 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |   4 +-
 sound/soc/codecs/Kconfig                           |   3 +-
 sound/soc/codecs/ak4458.c                          |  10 +-
 sound/soc/codecs/ak5558.c                          |  10 +-
 sound/soc/codecs/cs-amp-lib.c                      |  29 +-
 sound/soc/codecs/cs35l41.c                         |   7 +-
 sound/soc/codecs/nau8325.c                         |   4 +-
 sound/soc/codecs/wcd937x.c                         |   4 +-
 sound/soc/codecs/wcd938x.c                         |   3 +-
 sound/soc/codecs/wcd939x.c                         |   3 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |   4 +-
 sound/soc/rockchip/rockchip_pdm.c                  |   2 +-
 sound/usb/mixer_quirks.c                           |   1 +
 46 files changed, 626 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

