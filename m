Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9C3EDE63
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016360; cv=none; b=HmfA0ZG6C6nlH7vOTIDYiWWMw4bYwDdUhcs5lU1Nvn50fV5pm/ZsIPwgMRp6g5dOdQqiRc6NUE/2jKCLsgxj604VRxqDF4SG/0JIZIq1yfnyghnq9DaiEmO04VwVExyV1TRZLlqXtrcvP68W07IfpfXL5eAR8j/NcTkxWYU7G34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016360; c=relaxed/simple;
	bh=VDQvOtlyQeE/lKZB2wZJuX2lGGpJ8EMYDBDRMihvVuI=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=fTMyaavHn57UZfvJXskImyRtlJDyz3ZDJINZ1r+p++QuOtPRPsm7QLbzuaZHee8TUF//ecbvceDLOMk19yZRr9IjG+zNhwsRSet8SWdxVLmmqnvL4VJhbA88Il07z/G/+yH7bw1CpqyYfH0RyDV33Ja6ZeiwqksePOL/LFXYsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hbn+8IR+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jRsOLDJm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hbn+8IR+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jRsOLDJm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hbn+8IR+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRsOLDJm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hbn+8IR+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRsOLDJm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8929277D85;
	Tue, 14 Jul 2026 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784016356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8w9KM2y0aAbVMxSka4RyXnTX+LGuLu74azFakQPyv0o=;
	b=Hbn+8IR+cA9GpQBt9zlg/CFiXTyD9280dNOsrH4HKJs5d05LAIPRUHC2NfoJoU8ATfTPwM
	npIo4nd9NCvGwZAb+ZP6MpYZUGgdO3dCvuHOYEmY+KkX+ROkQIN/qLhGz3XjLz1CCEm04g
	/Z2uz9TdpFC3Ysw6eZEQrIo8sW2K22c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784016356;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8w9KM2y0aAbVMxSka4RyXnTX+LGuLu74azFakQPyv0o=;
	b=jRsOLDJm8Kl1TCkvCRI5OLU8xCCfq9YLa5qFslu7pPDbmdPwvgDFR5guXHLLx1ydko7cGm
	1U5SaTKJhlts9YDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hbn+8IR+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jRsOLDJm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784016356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8w9KM2y0aAbVMxSka4RyXnTX+LGuLu74azFakQPyv0o=;
	b=Hbn+8IR+cA9GpQBt9zlg/CFiXTyD9280dNOsrH4HKJs5d05LAIPRUHC2NfoJoU8ATfTPwM
	npIo4nd9NCvGwZAb+ZP6MpYZUGgdO3dCvuHOYEmY+KkX+ROkQIN/qLhGz3XjLz1CCEm04g
	/Z2uz9TdpFC3Ysw6eZEQrIo8sW2K22c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784016356;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8w9KM2y0aAbVMxSka4RyXnTX+LGuLu74azFakQPyv0o=;
	b=jRsOLDJm8Kl1TCkvCRI5OLU8xCCfq9YLa5qFslu7pPDbmdPwvgDFR5guXHLLx1ydko7cGm
	1U5SaTKJhlts9YDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D499779AE;
	Tue, 14 Jul 2026 08:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +3qBFeTtVWqgGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 08:05:56 +0000
Date: Tue, 14 Jul 2026 10:05:55 +0200
Message-ID: <87o6gayp0c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2-rc4
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8929277D85
X-Spam-Score: -3.51

Linus,

please pull sound fixes for v7.2-rc4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc4

The topmost commit is 5caf27a2bf7f86f92f03e851d252901b64ed498c

----------------------------------------------------------------

A collection of small fixes.  All are device-specific fixes (including
regression fixes) or quirks accumulated since the last update.
Some highlights:

* USB-audio:
- Fix per-channel volume imbalance regression for sticky mixers
- Validate input packet length in caiaq driver
- Quirks for iBasso DC-Elite, Musical Fidelity M6s DAC, and Redragon
  H510-PRO Wireless headset

* HD-audio:
- Fix a long-standing bug of cached processing coefficient verbs
- Make cs35l56 driver failing with missing firmware
- Fix cirrus codec Kconfig dependency, update MAINTAINERS
- Remove unneeded mic bias threshold override on Conexant
- Realtek codec quirks for ASUS ROG Ally X (headphone & mic), Dell
  QCM1255, Legion Pro 7, HP/Victus laptops, Framework, and TongFang
  laptops

* ASoC:
- Add Eliza audio support on Qualcomm sc8280xp/sm8250 SoCs
- Fix SDCA linker error with ACP on AMD
- A few fixes for AMD ACP PCI driver
- Add TAS2783 support on AMD ACP 7.0 platforms
- Reset RT712-SDCA codec to fix silent headphone issue
- Soft reset S/PDIF datapath on Meson AIU FIFO
- Jack report fix for cs42l43
- TAS2562 shutdown GPIO clearing fix
- Sidecar amps quirk for Lenovo laptop in SOF SDW driver

* Misc:
- Drop redundant mod_devicetable.h includes from FireWire drivers
- Fix memory leak and format mismatch in mixer kselftest

----------------------------------------------------------------

Agustin Luzardo (1):
      ALSA: usb-audio: Add quirk for Redragon H510-PRO Wireless headset

Baojun Xu (1):
      ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783 support

Charles Keepax (1):
      ASoC: cs42l43: Correct report for forced microphone jack

Chen Bowen (1):
      ALSA: hda/realtek: Fix speakers on MECHREVO WUJIE Series

Christian Hewitt (1):
      ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop

Damien Laine (1):
      ALSA: hda/realtek: Fix speakers on Legion Pro 7 16ARX8H with codec SSID 17aa:38a7

Daniel Schaefer (1):
      ALSA: hda/realtek: add quirk for Framework F111:0010

Eckhart Mohr (1):
      ALSA: hda/realtek: Add quirk for TongFang X6xx45xU

Federico Lombardo (1):
      ALSA: hda/realtek: Enable mute LED quirk for HP Laptop 15-dw0xxx

Kailang Yang (1):
      ALSA: hda/realtek - Fixed Headphone noise issue for Dell QCM1255

Kshamendra Kumar Mishra (1):
      ALSA: hda/realtek: Add mic mute LED quirk for HP Laptop 15-fd0xxx

Lianqin Hu (1):
      ALSA: usb-audio: Add delay quirk for iBasso DC-Elite

Longlong Xia (1):
      ALSA: firewire: Drop redundant mod_devicetable.h includes

Maciej Strozek (1):
      ASoC: sof_sdw: Add a quirk for 0x17aa383c laptop using sidecar amps with cs42l43

Malaya Kumar Rout (2):
      selftests/alsa: Fix memory leak in find_controls error path
      selftests/alsa: Fix format specifier and function mismatch in mixer-test

Matthew Schwartz (2):
      ALSA: hda/realtek: Fix headphone output on ASUS ROG Ally X
      ALSA: hda/realtek: Fix headset mic on ASUS ROG Ally X

Pengpeng Hou (1):
      ALSA: usb-audio: caiaq: validate EP1 reply lengths

Ravi Hothi (3):
      ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
      ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
      ASoC: qcom: sc8280xp: Add support for Eliza

Richard Fitzgerald (3):
      ALSA: hda/cirrus_scodec: Make Kconfig visible if KUNIT
      ALSA: hda: MAINTAINERS: Fix missing cirrus* file reference
      ALSA: hda: cs35l56: Fail if wmfw file is missing

Rohit Sinha (1):
      ALSA: hda/realtek - Add quirk for HP Victus 15-fa0xxx (MB 8A50)

Rong Zhang (1):
      ALSA: usb-audio: Fix imbalance per-channel volume of sticky mixers

Syed Saba Kareem (1):
      ASoC: amd: acp: Fix linker error with SDCA quirks

Takashi Iwai (1):
      ALSA: usb-audio: Skip DSD quirk for Musical Fidelity M6s DAC

Tianze Shao (1):
      ASoC: rt712-sdca: reset codec at io_init to fix silent headphone

Uday Khare (1):
      ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup

Vijendar Mukunda (3):
      ASoC: amd: ps: disable MSI on resume in ACP PCI driver
      ASoC: amd: ps: fix wrong ACP version string in pci_request_regions()
      ASoC: amd: ps: replace bitwise OR with logical OR in IRQ return check

Xu Rao (1):
      ALSA: hda: Fix cached processing coefficient verbs

Zhang Heng (1):
      ALSA: hda: conexant: Remove mic bias threshold override

---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 MAINTAINERS                                        |  1 +
 sound/firewire/bebob/bebob.h                       |  1 -
 sound/firewire/dice/dice.h                         |  1 -
 sound/firewire/digi00x/digi00x.h                   |  1 -
 sound/firewire/fireface/ff.h                       |  1 -
 sound/firewire/fireworks/fireworks.h               |  1 -
 sound/firewire/motu/motu.h                         |  1 -
 sound/firewire/oxfw/oxfw.h                         |  1 -
 sound/firewire/tascam/tascam.h                     |  1 -
 sound/hda/codecs/conexant.c                        |  3 --
 sound/hda/codecs/realtek/alc269.c                  | 49 +++++++++++++++++++++-
 sound/hda/codecs/side-codecs/Kconfig               |  2 +-
 sound/hda/codecs/side-codecs/cs35l56_hda.c         | 30 ++++---------
 sound/hda/core/regmap.c                            |  4 +-
 sound/soc/amd/acp/Kconfig                          | 10 +++--
 sound/soc/amd/acp/Makefile                         |  3 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 47 ++++++++++++++++++++-
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c       |  4 --
 sound/soc/amd/ps/pci-ps.c                          | 33 ++++++++++++++-
 sound/soc/codecs/cs42l43-jack.c                    |  3 +-
 sound/soc/codecs/rt712-sdca.c                      | 11 +++++
 sound/soc/codecs/tas2562.c                         |  5 ++-
 sound/soc/intel/boards/sof_sdw.c                   |  1 +
 sound/soc/meson/aiu-fifo-spdif.c                   |  5 +++
 sound/soc/qcom/sc8280xp.c                          |  1 +
 sound/usb/caiaq/device.c                           | 17 ++++++--
 sound/usb/caiaq/input.c                            |  6 +++
 sound/usb/mixer.c                                  |  2 +-
 sound/usb/quirks.c                                 |  6 +++
 tools/testing/selftests/alsa/mixer-test.c          |  5 ++-
 35 files changed, 203 insertions(+), 58 deletions(-)

