Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3243B52E1
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441388; cv=none; b=b7tgttsO7F4Lv9swZ34C2jxUOIrXYh7576VH6439u5f+mUl90vpZ4iejUaSSKLAJoO7eMFQ3tAT7AUMnxIn+wJkEiOhmSuBgpc4Mr3cqyW7W1M4W3+6rv8RUQXQJnB534Beoe7HxJrSKzy0g5O9iofBjp+HCuLlY3By4bKsbtk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441388; c=relaxed/simple;
	bh=heLrrMtpDr8i+jxF5zAg47JeqIUbBHDOY2nqswaSTyc=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=r4UJeZcx0C8t+bym2X1C31Avbhbb/0jn6IuUTm2xI63F+GSfWl+VkzwjKfqAg2wWojI8XItErfsN3fJE80K3z3iGwuPgBTFIx1BPspC2dlSPSg8+oBcgffyScdpGNqmBEbwqToXOEvvZZ7+t1givLFs7S+B8Y8RCjd6WjXDLI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=THSwhp5f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JOIGinYv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=THSwhp5f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JOIGinYv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="THSwhp5f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JOIGinYv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="THSwhp5f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JOIGinYv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A19C7671F4;
	Fri, 22 May 2026 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779441382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aLa2SrmzDnbYGq6oIFukBshfCjC+OqjiLG0YePlUzgc=;
	b=THSwhp5f07NfC1hvnSK18m48MM7acbC0Q7FficIWtX98zPqTrAq/a6tJhS3SrTsF8VMNg+
	E1nZywBz070KtYK+UWYSklvv9sGwYc8ACQ2H0piTuUgJFxN46TzysZrKbn3Af3PCLAoVfg
	jG0zn5N6/yWE/PUf9Nb+29LDApYACg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779441382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aLa2SrmzDnbYGq6oIFukBshfCjC+OqjiLG0YePlUzgc=;
	b=JOIGinYv2A6Jcub4+hf7A5UPUMcxJOi/QomOdCCMx41XigFk9SyYdXix+Ur66Y0Z456hKJ
	BqxFpg84/Dky7xDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=THSwhp5f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JOIGinYv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779441382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aLa2SrmzDnbYGq6oIFukBshfCjC+OqjiLG0YePlUzgc=;
	b=THSwhp5f07NfC1hvnSK18m48MM7acbC0Q7FficIWtX98zPqTrAq/a6tJhS3SrTsF8VMNg+
	E1nZywBz070KtYK+UWYSklvv9sGwYc8ACQ2H0piTuUgJFxN46TzysZrKbn3Af3PCLAoVfg
	jG0zn5N6/yWE/PUf9Nb+29LDApYACg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779441382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aLa2SrmzDnbYGq6oIFukBshfCjC+OqjiLG0YePlUzgc=;
	b=JOIGinYv2A6Jcub4+hf7A5UPUMcxJOi/QomOdCCMx41XigFk9SyYdXix+Ur66Y0Z456hKJ
	BqxFpg84/Dky7xDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64103593A8;
	Fri, 22 May 2026 09:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8bO8FuYeEGq+OgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 May 2026 09:16:22 +0000
Date: Fri, 22 May 2026 11:16:21 +0200
Message-ID: <87ecj3iz2y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc5
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A19C7671F4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	internal_greylist_whitelist(0.00)[2a07:de40:b281:104:10:150:64:97];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.1-rc5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc5

The topmost commit is 2519003dd5fb6f89f10f031e3a97ecb7c9d1b816

----------------------------------------------------------------

sound fixes for 7.1-rc5

As expected, we still continue receiving lots of small fixes.
One major change is about HD-audio pending IRQ handling, but this
would influence only on odd machines or slow VMs.  There are a few
other fixes for the core part, but most of them are not-too-serious
UAF fixes, while the rest are mostly device-specific fixes and quirks.

ALSA Core:
- Fix for PCM silencing with bogus iov_iter
- Fixes for past-the-end iterators in timer and seq
- Serialization of UMP output teardown
- Rate-limit ELD parsing errors

HD-audio:
- Fixes for IRQ work handling and SSID matching
- Various Realtek quirks for HP and ASUS laptops, including LED fixes

ASoC:
- Intel: ACPI match table updates for PTL, NVL, and ARL platforms
- Cirrus Logic: Fixes for cs-amp-lib and cs35l56 codecs
- Various platform fixes for AMD, FSL SAI, TI OMAP, and Qualcomm
- DT-binding fix for MediaTek

Others:
- USB ua101: Reject too-short USB descriptors
- Scarlett2: Fix for flash writes
- ASIHPI: Fix for potential OOB access
- AMD SPI: Fix for bus number in ACPI probe

MAINTAINERS:
- Updates for SOF and TI maintainers

----------------------------------------------------------------

Alexander A. Klimov (1):
      ASoC: codecs: fs210x: fix possible buffer overflow

Andy Shevchenko (1):
      ASoC: cs35l56: Drop malformed default N from Kconfig

Aryan Kushwaha (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14

Balamurugan C (1):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in NVL match table.

Charles Keepax (2):
      ASoC: soc-acpi-intel-ptl-match: Make Chrome matches conditional
      ASoC: Intel: soc-acpi-intel-ptl-match: Remove unnecessary cs42l43 match

Cássio Gabriel (4):
      ASoC: sdw_utils: Check speaker component string allocation
      ASoC: amd: acp-sdw-legacy: check CPU DAI name before logging
      ALSA: ua101: Reject too-short USB descriptors
      ALSA: scarlett2: Allow flash writes ending at segment boundary

Eric Naim (1):
      ALSA: hda/realtek: Use ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5

Francesco Saverio Pavone (1):
      ALSA: pcm_drm_eld: rate-limit ELD parsing errors

Gary C Wang (1):
      ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support

Ingyu Jang (1):
      ASoC: ti: omap-dmic: Fix IS_ERR() vs NULL check bug in omap_dmic_select_fclk()

Jairaj Arava (1):
      ASoC: Intel: sof_sdw: Add support for nvlrvp in NVL platform

Jang Pyohwan (1):
      ASoC: Intel: soc-acpi: add LG Gram 16Z90U RT713 + single RT1320 quirk

Jasper Smet (1):
      ASoC: amd: acp: Add DMI quirk for ASUS Zenbook S16 UM5606GA

Jeongjun Park (1):
      ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put()

Krishnamoorthi M (1):
      spi: amd: Set correct bus number in ACPI probe path

Mac Chiang (3):
      ASoC: Intel: soc-acpi-intel-arl-match: Reorder ACPI machine tables
      ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
      ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC

Maoyi Xie (2):
      ALSA: timer: avoid past-the-end iterator in snd_timer_dev_register()
      ALSA: seq: avoid past-the-end iterator in snd_seq_create_port()

Mario Limonciello (1):
      ASoC: SOF: amd: Fix error code handling in psp_send_cmd()

Marius Hoch (1):
      ALSA: hda/realtek: Add LED quirk for HP ProBook 430 G6

Minxi Hou (1):
      ALSA: hda/realtek: Add quirk for HP Z66 G6 14 laptop

Peter Ujfalusi (2):
      MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as maintainer
      MAINTAINERS: ASoC: Intel/SOF: Remove Ranjani Sridharan as maintainer

Richard Fitzgerald (5):
      ASoC: cs35l56: Check for successful runtime-resume in cs35l56_dsp_work()
      ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()
      ASoC: cs-amp-lib: Fix wrong sizeof() in _cs_amp_set_efi_calibration_data()
      ASoC: cs-amp-lib: Fix missing dput() after debugfs_lookup()
      ASoC: cs-amp-lib: Fix typo in error message: write -> read

Rob Herring (Arm) (1):
      ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints

Robertus Diawan Chris (1):
      ASoC: soc-utils: Add missing va_end in snd_soc_ret()

Sergio Boglione (1):
      ALSA: hda/realtek: Add quirk for HP 250 G10 (103c:8b34)

Shengjiu Wang (1):
      ASoC: fsl_sai: Eliminate possible interrupt storm during probe

Simon Trimmer (1):
      ASoC: cs35l56: Log SoundWire status updates only on changes

Srinivas Kandagatla (1):
      ASoC: qcom: q6apm-dai: Allocate an extra page for PCM buffers

Takashi Iwai (5):
      ALSA: asihpi: Fix potential OOB array access at reading cache
      ALSA: hda: Avoid quirk matching with zero PCI SSID
      ALSA: pcm: Don't setup bogus iov_iter for silencing
      ALSA: hda: Move irq pending work into hda-intel stream
      ALSA: hda/intel: Make sure to cancel irq-pending work at closing PCM stream

Zhang Cen (1):
      ALSA: seq: Serialize UMP output teardown with event_input

Zhang Heng (1):
      ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP 16 Piston OmniBook X

---
 .../sound/mediatek,mt8173-rt5650-rt5514.yaml       |   2 +
 MAINTAINERS                                        |  11 +-
 drivers/spi/spi-amd.c                              |   2 +-
 sound/core/pcm_drm_eld.c                           |   4 +-
 sound/core/pcm_lib.c                               |   3 +
 sound/core/seq/seq_ports.c                         |   7 +-
 sound/core/seq/seq_ump_client.c                    |  22 +++-
 sound/core/timer.c                                 |  19 ++-
 sound/hda/codecs/realtek/alc269.c                  |  18 +--
 sound/hda/common/auto_parser.c                     |   4 +-
 sound/hda/common/controller.c                      |  28 ++---
 sound/hda/common/hda_controller.h                  |  14 ++-
 sound/hda/controllers/intel.c                      | 106 +++++++++++-----
 sound/hda/controllers/intel.h                      |  15 ++-
 sound/pci/asihpi/hpicmn.c                          |   6 +
 sound/soc/amd/acp-config.c                         |   7 ++
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |   2 +-
 sound/soc/codecs/Kconfig                           |   3 -
 sound/soc/codecs/cs-amp-lib.c                      |  17 ++-
 sound/soc/codecs/cs35l56-sdw.c                     |   8 +-
 sound/soc/codecs/cs35l56.c                         |  13 +-
 sound/soc/codecs/fs210x.c                          |   2 +-
 sound/soc/codecs/pcm512x.c                         |   6 +-
 sound/soc/fsl/fsl_sai.c                            |  43 +++++--
 sound/soc/intel/boards/sof_sdw.c                   |   8 ++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |  71 ++++++++---
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  13 ++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  | 134 +++------------------
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.c  |  16 +++
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.h  |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   7 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |  14 ++-
 sound/soc/soc-utils.c                              |   1 +
 sound/soc/sof/amd/acp.c                            |   2 +-
 sound/soc/ti/omap-dmic.c                           |   2 +-
 sound/usb/misc/ua101.c                             |   5 +-
 sound/usb/mixer_scarlett2.c                        |   7 +-
 37 files changed, 384 insertions(+), 259 deletions(-)

