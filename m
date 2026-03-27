Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44123A7846
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607430; cv=none; b=QVJFKUZFFNute9R4W+KNvbpZo5Ajjp+E2mEiMIrb0gcaEm8wfRHQA/JfI83uidm4R5aUgM4CHdDxd54UDoRy/ttrvVB/IfBV7Lm12wjAbk/kQiguIsBdDJUJSbgdQgUdZQZIUUhKZygICaifHwhsOktnVrwwsagjj6aCNQoFM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607430; c=relaxed/simple;
	bh=oJEWmwKoCPHcim4KAGvWIHz1ugO+nMeRKVeslpA8cSY=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=aCFDHZmcTQjpj4/QbKbefAAIrM0OZYh0sNBMy27l/7qm1ct6gmgFpnlXiMkVduZKovhLkLwBjUxdG/s9K/3ZPIlrtKeLHdZF3DCLjkLa5zo0fN3MwqBkj5NAadc3nwWr/49XbeVoYxf0XgKFv50Cq4QAdOJajXP/0A+qUVaq75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vQT28lES; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2CVj18Ev; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vQT28lES; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2CVj18Ev; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vQT28lES";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2CVj18Ev";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vQT28lES";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2CVj18Ev"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F0D04D1C7;
	Fri, 27 Mar 2026 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774607419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5gcT+WJLm8vkYTYGpAox8hKwYFpn7my8CrNr4LH9zD8=;
	b=vQT28lESXXWXdsXz5ZkfQxAWUhs2+xp39S09c4HORSeX5Vq9vxLrmRj3RMowgehfzcX3r9
	PvZBZH7XBLaDa6kbdGFUM7aXSRpAZ3R27aIr+OFfMoDdXeBhJrDxsztSHBinYhtua4pcXw
	lG3niUB3/41hYaS+FxRPOkHRmqrdW/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774607419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5gcT+WJLm8vkYTYGpAox8hKwYFpn7my8CrNr4LH9zD8=;
	b=2CVj18EvQHGTrshSbnUa9Mp7HPKDkhNvThaQ0lRONqcYCEm4eyZFI9a248Yr3MGhTpunGf
	TKj4pFdxfrL4LGBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vQT28lES;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2CVj18Ev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774607419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5gcT+WJLm8vkYTYGpAox8hKwYFpn7my8CrNr4LH9zD8=;
	b=vQT28lESXXWXdsXz5ZkfQxAWUhs2+xp39S09c4HORSeX5Vq9vxLrmRj3RMowgehfzcX3r9
	PvZBZH7XBLaDa6kbdGFUM7aXSRpAZ3R27aIr+OFfMoDdXeBhJrDxsztSHBinYhtua4pcXw
	lG3niUB3/41hYaS+FxRPOkHRmqrdW/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774607419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5gcT+WJLm8vkYTYGpAox8hKwYFpn7my8CrNr4LH9zD8=;
	b=2CVj18EvQHGTrshSbnUa9Mp7HPKDkhNvThaQ0lRONqcYCEm4eyZFI9a248Yr3MGhTpunGf
	TKj4pFdxfrL4LGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 049184A0A2;
	Fri, 27 Mar 2026 10:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rg5nOzpcxmnuXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 10:30:18 +0000
Date: Fri, 27 Mar 2026 11:30:18 +0100
Message-ID: <87zf3tr2dh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0-rc6
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2F0D04D1C7

Linus,

please pull sound fixes for v7.0-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc6

The topmost commit is ed4da361bf943b9041fc63e5cb6af01b3c0de978

----------------------------------------------------------------

sound fixes for 7.0-rc6

This became a slightly big PR partly due to my time off in the last
week.  But all changes are about device-specific fixes, so it should
be safely applicable.

* ASoC:
- Fix double free in sma1307
- Fix uninitialized variables in simple-card-utils/imx-card
- Address clock leaks and error propagation in ADAU1372
- Add DMI quirks and ACP/SDW support for ASUS
- Fix Intel CATPT DMA mask
- Fix SOF topology parsing
- Fix DT bindings for RK3576 SPDIF, STM32 SAI and WCD934x

* HD-audio:
- Quirks for Lenovo, ASUS, and various HP models, as well as speaker
  pop fix on Star Labs StarFighter.
- Revert MSI X870E Tomahawk denylist again.

* USB-Audio:
- Fix distorted audio on Focusrite Scarlett 2i2/2i4 1st Gen
- Add iface reset quirk for AB17X
- Update Qualcomm USB audio Kconfig dependencies and license

* Misc:
- Fix minor compile warnings for firewire and asihpi drivers

----------------------------------------------------------------

Alexey Nepomnyashih (1):
      ALSA: firewire-lib: fix uninitialized local variable

Andrii Kovalchuk (1):
      ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk

Arnd Bergmann (1):
      ALSA: asihpi: avoid write overflow check warning

Baojun Xu (1):
      ASoC: tas2781: Add null check for calibration data

Cezary Rojewski (1):
      ASoC: Intel: catpt: Fix the device initialization

Cássio Gabriel (1):
      ASoC: SOF: topology: reject invalid vendor array size in token parser

César Montoya (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg0xxx

Daniel Lezcano (1):
      ALSA: usb-audio: qcom: Fix the license marking

Frank Zhang (1):
      ALSA:usb:qcom: add AUXILIARY_BUS to Kconfig dependencies

Geoffrey D. Bennett (2):
      ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen from SKIP_IFACE_SETUP
      ALSA: usb-audio: Exclude Scarlett 2i4 1st Gen from SKIP_IFACE_SETUP

Guangshuo Li (1):
      ASoC: sma1307: fix double free of devm_kzalloc() memory

Hasun Park (3):
      ASoC: amd: acp: add DMI override for ACP70 flag
      ASoC: amd: acp: add PX13 SoundWire machine link for rt721+tas2783x2
      ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine

Jihed Chaibi (3):
      ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
      ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
      ASoC: adau1372: Fix clock leak on PLL lock failure

Kailang Yang (1):
      ALSA: hda/realtek - Fixed Speaker Mute LED for HP EliteBoard G1a platform

Kshamendra Kumar Mishra (1):
      ALSA: hda/realtek: add HP Laptop 15-fd0xxx mute LED quirk

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for AB17X USB Audio

Mario Limonciello (1):
      Revert "ALSA: hda/intel: Add MSI X870E Tomahawk to denylist"

Matthew Schwartz (1):
      ALSA: hda/realtek: Add quirk for ASUS ROG Flow Z13-KJP GZ302EAC

Peter Ujfalusi (1):
      ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload

Sean Rhodes (1):
      ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter

Sebastian Reichel (1):
      ASoC: dt-bindings: rockchip: Add compatible for RK3576 SPDIF

Shengjiu Wang (2):
      ASoC: simple-card-utils: Check value of is_playback_only and is_capture_only
      ASoC: fsl: imx-card: initialize playback_only and capture_only

Shuming Fan (2):
      ASoC: SDCA: remove the max count of initialization table
      ASoC: SDCA: fix finding wrong entity

Srinivas Kandagatla (1):
      ASoC: codecs: wcd934x: fix typo in dt parsing

Vee Satayamas (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA

Zhang Heng (3):
      ALSA: hda/realtek: add quirk for Lenovo Yoga 7 2-in-1 16AKP10
      ALSA: hda/realtek: add quirk for ASUS Strix G16 G615JMR
      ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF

---
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  1 +
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |  2 +-
 include/sound/sdca_function.h                      |  5 --
 sound/firewire/amdtp-stream.c                      |  2 +-
 sound/hda/codecs/realtek/alc269.c                  | 66 +++++++++++++++++++---
 sound/hda/controllers/intel.c                      |  1 -
 sound/pci/asihpi/hpimsgx.c                         |  6 +-
 sound/soc/amd/acp-config.c                         | 15 ++++-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |  8 +++
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 61 ++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++
 sound/soc/codecs/adau1372.c                        | 34 +++++++----
 sound/soc/codecs/sma1307.c                         |  6 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |  3 +
 sound/soc/codecs/wcd934x.c                         |  2 +-
 sound/soc/fsl/imx-card.c                           |  2 +
 sound/soc/generic/simple-card-utils.c              |  4 +-
 sound/soc/intel/catpt/device.c                     | 10 +++-
 sound/soc/intel/catpt/dsp.c                        |  3 -
 sound/soc/sdca/sdca_functions.c                    | 14 +++--
 sound/soc/sof/ipc4-topology.c                      |  2 +-
 sound/soc/sof/topology.c                           |  2 +-
 sound/usb/Kconfig                                  |  1 +
 sound/usb/qcom/qc_audio_offload.c                  |  2 +-
 sound/usb/quirks.c                                 |  4 ++
 25 files changed, 226 insertions(+), 44 deletions(-)

