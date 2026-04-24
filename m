Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A053914FC
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028093; cv=none; b=iEuQTtto/TjMtSkKfh8JGKmOza7airR+v0KSgI08Jf6EIv+8Se/hD/gSkTECABD9nar9JYbldlwi8H8YJt9O6yISiHQM1eWHKRipr9Z1OXR3twdjIBGHGXzDoeTQpY5+BGqc+PNKHbVoa4Yjr4aPxZ819tOZAtycoe95fDbOo8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028093; c=relaxed/simple;
	bh=WkSTA7I3s2IvKd5iLnHsqXEb7/W2IsaEoD7Mmy1UhrQ=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=UP/LTQXYFwrIFubE89FUmyEwi80fMDmg2wQCMrnEk8L95kU2Ukgqv6jCXtyfNP8Bk/Ln/Q1YnS7wnrlXUe+SZIYzm1Jp5gVnWMSAGJh+QQfUVhUrBmq6GPoSYhsU6Apxra9LYnQU/NprLB3l3EngKJb6YARKP4YlHz4m4ZmIFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wF0BaBJF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H/EEiWme; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wF0BaBJF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H/EEiWme; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wF0BaBJF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/EEiWme";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wF0BaBJF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/EEiWme"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F0F36A836;
	Fri, 24 Apr 2026 10:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777028083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjHtjsADurGpBnf9RN9/TXTONXIr1ckIEsO31SzM/Wk=;
	b=wF0BaBJFzeT8jyIY7xLkVrTO2thIZPK0klw9FzFX3jFDbtdwuhWqOQuUFVYhKxrGTWc/FJ
	PCjVjVkwFW3jfjsUC5aq8Nlm8T2T7inCR7IZsm5/9Qe0npti9oRupxlyRuPPVHYAMnHiHg
	j2Qf3osGB1NAwvJ+UClh+fRc6C4UDXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777028083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjHtjsADurGpBnf9RN9/TXTONXIr1ckIEsO31SzM/Wk=;
	b=H/EEiWmeYGneddpFrtu2WbLTOx6z58ZZ7tE/sMpwLFysmVEeQJz5hMKDVcsUScVFukKqQR
	5g0urmORTpKFXaDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wF0BaBJF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="H/EEiWme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777028083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjHtjsADurGpBnf9RN9/TXTONXIr1ckIEsO31SzM/Wk=;
	b=wF0BaBJFzeT8jyIY7xLkVrTO2thIZPK0klw9FzFX3jFDbtdwuhWqOQuUFVYhKxrGTWc/FJ
	PCjVjVkwFW3jfjsUC5aq8Nlm8T2T7inCR7IZsm5/9Qe0npti9oRupxlyRuPPVHYAMnHiHg
	j2Qf3osGB1NAwvJ+UClh+fRc6C4UDXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777028083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjHtjsADurGpBnf9RN9/TXTONXIr1ckIEsO31SzM/Wk=;
	b=H/EEiWmeYGneddpFrtu2WbLTOx6z58ZZ7tE/sMpwLFysmVEeQJz5hMKDVcsUScVFukKqQR
	5g0urmORTpKFXaDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56AF6593A4;
	Fri, 24 Apr 2026 10:54:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KqP6E/NL62leGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Apr 2026 10:54:43 +0000
Date: Fri, 24 Apr 2026 12:54:42 +0200
Message-ID: <87y0ic1vd9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F0F36A836

Linus,

please pull sound fixes for v7.1-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.1-rc1

The topmost commit is 2724fbc90e5c133fbbd030e72fe8a3869a20df08

----------------------------------------------------------------

sound fixes for 7.1-rc1

Here are the rest of small updates for 7.1-rc1.  All small fixes
mostly for device-specific issues or regressions.

* Core:
- Fix a potential data race in fasync handling

* USB-audio:
- New device support: Line6 POD HD PRO, NexiGo N930W webcam
- Fixes for Audio Advantage Micro II SPDIF switch and E-MU sample rates
- Limit UAC2 rate parsing to prevent potential overflows

* HD-Audio:
- Device-specific quirks for HP, Acer, and Honor laptops
- Fix for TAS2781 SPI device abnormal sound
- Move Intel firmware loading into probe work to avoid stalling

* ASoC:
- New support for TI TAS5832
- Fixes for SoundWire SDCA/DisCo boolean parsing
- Driver-specific fixes for Intel SOF, ES8311, RT1320, and PXA2xx

* Misc:
- Fixes for resource leaks and data races in 6fire, caiaq, als4000,
  and pcmtest drivers

----------------------------------------------------------------

Arnd Bergmann (1):
      ASoC: tas2781: fix unused-const-variable warning

Baojun Xu (3):
      ALSA: hda/tas2781: Fix sound abnormal issue on some SPI device
      ASoC: dt-bindings: ti,tas2781: Add TAS5832 support
      ASoC: tas2781: Add tas5832 support

Bard Liao (2):
      ASoC: SOF: Intel: NVL: add platform name
      ASoC: SOF: Intel: NVL-S: add platform name

Bob Song (1):
      ALSA: hda/realtek: add quirk for Acer Nitro 16 AN16-41

Charles Keepax (2):
      regmap: sdw-mbq: Allow defers on undeferrable controls
      ASoC: SDCA: Fix reading of mipi-sdca-control-deferrable

Chris Chiu (1):
      ALSA: hda/realtek: Add LED fixup for HP EliteBook 6 G2a Laptops

Cássio Gabriel (7):
      ALSA: usb-audio: stop parsing UAC2 rates at MAX_NR_RATES
      ALSA: 6fire: Fix input volume change detection
      ALSA: caiaq: Fix control_put() result and cache rollback
      ALSA: als4000: Fix capture trigger chip->mode race
      ALSA: pcmtest: Fix resource leaks in module init error paths
      ALSA: usb-audio: Avoid false E-MU sample-rate notifications
      ALSA: usb-audio: Fix Audio Advantage Micro II SPDIF switch

Guangshuo Li (1):
      ALSA: pcmtest: fix reference leak on failed device registration

Hsieh Hung-En (2):
      ASoC: es8311: Check regcache_sync() error in resume
      ASoC: es8311: Fix clock leak and check update_bits in set_bias_level()

Johnathan Penberthy (1):
      ALSA: usb-audio: Add quirk entries for NexiGo N930W webcam

Juan Pablo Fuentealba Bizama (1):
      ALSA: usb-audio: Add quirk for SmartlinkTechnology M01

Maciej Strozek (1):
      ASoC: sdw_utils: cs42l43: allow spk component names to be combined

Peng Fan (1):
      ASoC: pxa2xx-ac97: fix error handling for reset GPIO descriptor

Phil Willoughby (1):
      ALSA: usb-audio/line6: Add support for POD HD PRO

Randy Dunlap (2):
      ALSA: virtio: drop an extaneous kernel-doc comment
      ALSA: vx: use correct function name in kernel-doc comment

Rong Zhang (1):
      ALSA: usb-audio: Tidy up error check for processing unit

Shuming Fan (1):
      ASoC: rt1320: fix the warning 'rae_fw' from request_firmware() not released

Spencer Payton (1):
      ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa2xxx

Takashi Iwai (9):
      ALSA: caiaq: Handle probe errors properly
      ALSA: 6fire: Cover the whole probe and disconnect calls with register_mutex
      ALSA: 6fire: Fix leftover global pointers after probe failures
      ALSA: 6fire: Reduce multi-level conditionals in usb6fire_chip_disconnect()
      ALSA: 6fire: Drop unnecessary NULL checks
      ALSA: hda/intel: Move firmware loading into the probe work
      ALSA: core: Fix potential data race at fasync handling
      Revert "ALSA: usb-audio: Add quirk for SmartlinkTechnology M01"
      Revert "ALSA: pcmtest: fix reference leak on failed device registration"

Timofey Tarasenko (1):
      ALSA: hda/realtek: add quirk for HONOR MRB-XXX M1020

Tobias Heider (1):
      ASoC: qcom: x1e80100: limit speaker volumes

---
 .../devicetree/bindings/sound/ti,tas2781.yaml      |   7 +-
 drivers/base/regmap/regmap-sdw-mbq.c               |  36 +++----
 include/sound/tas2781.h                            |   1 +
 sound/arm/pxa2xx-ac97-lib.c                        |  15 +--
 sound/core/misc.c                                  |  13 ++-
 sound/drivers/pcmtest.c                            |  15 ++-
 sound/drivers/vx/vx_cmd.h                          |   2 +-
 sound/hda/codecs/realtek/alc269.c                  |  17 ++++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |   1 +
 sound/hda/common/hda_controller.h                  |   4 -
 sound/hda/controllers/intel.c                      |  58 +++--------
 sound/pci/als4000.c                                |  44 ++++----
 sound/soc/codecs/es8311.c                          |  22 ++--
 sound/soc/codecs/rt1320-sdw.c                      |   1 +
 sound/soc/codecs/tas2781-fmwlib.c                  |   7 +-
 sound/soc/codecs/tas2781-i2c.c                     |  15 ++-
 sound/soc/qcom/x1e80100.c                          |  19 ++++
 sound/soc/sdca/sdca_functions.c                    |   7 +-
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c       |   6 --
 sound/soc/sdw_utils/soc_sdw_cs42l43.c              |  12 +--
 sound/soc/sdw_utils/soc_sdw_utils.c                |  20 +++-
 sound/soc/sof/intel/nvl.c                          |   2 +
 sound/usb/6fire/chip.c                             | 113 ++++++++++-----------
 sound/usb/6fire/control.c                          |  10 +-
 sound/usb/caiaq/control.c                          |  52 +++++++---
 sound/usb/caiaq/device.c                           |  33 ++++--
 sound/usb/format.c                                 |   2 +-
 sound/usb/line6/podhd.c                            |  14 +++
 sound/usb/mixer.c                                  |  34 +++----
 sound/usb/mixer_quirks.c                           |  12 ++-
 sound/usb/quirks.c                                 |   2 +
 sound/virtio/virtio_pcm.h                          |   1 -
 32 files changed, 339 insertions(+), 258 deletions(-)

