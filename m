Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD2374721
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532311; cv=none; b=kWEruMQwopoO0nFW6olJHRs27Lqycg4lwn4piLUsY0HzVB22fwhErFRIb/+KOMwJnehzjJHLQEd8W0utYxdqeNr04qEeVSAhB58kbt3utogXP5gWXI07YJ79Fj+3EZYVGQc18ojRnta4CCwWJMtaV75dtAdEUSuu6HM5TawkHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532311; c=relaxed/simple;
	bh=mM+oYE43F1t49WtADJTqPqlr6amm//KDWr02Xih2Zhg=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=ejP+m0pbLTvqumL+HXUaTqzobzDPgeXOUyaF2LbAoQHv4D/hsyVeGTxuohIh9sFCjoJrDIn25+m6qLgfezO5AYGSiFHRnpuKjsBgL3MgEYAdFNk0f7dUcZRi8KeCzTs8QatJzKByQk9cHwqHTTUKkNtYGRFrZbGZOh5ViQOC7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IlRcv3oa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4RbLp9vp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IlRcv3oa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4RbLp9vp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IlRcv3oa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4RbLp9vp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IlRcv3oa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4RbLp9vp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E3C95BD6F;
	Thu, 30 Apr 2026 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777532308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kdwARfmslrdZLcC2G5hK4YizNDQ8UpXXlF6r4MOyrL4=;
	b=IlRcv3oaH7kfmXI4ykP1T051xVKG9ij/vh6IBGZfVSfhMTb3FsRCy0PKAfpdQDRbRi8Vlg
	yA/QYGoe7B7JHcuVl5oc1qyLQqiq0/DeYVbZkSVsMILR9myiR2QXBHr1LRrXrjGt8HMfS2
	YlKzWdAGCeT1oVAYs8OQqUM1tIRTbyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777532308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kdwARfmslrdZLcC2G5hK4YizNDQ8UpXXlF6r4MOyrL4=;
	b=4RbLp9vpc0oux3m9PnGT+uNT7/ihVE/d3XzWaE1w4aS4uoULp4cta0mZzHP7VPC/Li/8ng
	P8R0CV6LjNLEo4Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777532308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kdwARfmslrdZLcC2G5hK4YizNDQ8UpXXlF6r4MOyrL4=;
	b=IlRcv3oaH7kfmXI4ykP1T051xVKG9ij/vh6IBGZfVSfhMTb3FsRCy0PKAfpdQDRbRi8Vlg
	yA/QYGoe7B7JHcuVl5oc1qyLQqiq0/DeYVbZkSVsMILR9myiR2QXBHr1LRrXrjGt8HMfS2
	YlKzWdAGCeT1oVAYs8OQqUM1tIRTbyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777532308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kdwARfmslrdZLcC2G5hK4YizNDQ8UpXXlF6r4MOyrL4=;
	b=4RbLp9vpc0oux3m9PnGT+uNT7/ihVE/d3XzWaE1w4aS4uoULp4cta0mZzHP7VPC/Li/8ng
	P8R0CV6LjNLEo4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D81E8593B0;
	Thu, 30 Apr 2026 06:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CPCCM5P98mnpKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Apr 2026 06:58:27 +0000
Date: Thu, 30 Apr 2026 08:58:27 +0200
Message-ID: <87ik99ndd8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc2
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.1-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc2

The topmost commit is e052a1f7199260eda4d6ca08a59c3b98738f8491

----------------------------------------------------------------

sound fixes for 7.1-rc2

A bunch of small fixes.  One minor fix is found in the core side for
data race in PCM OSS layer, while remaining changes are various
device-specific fixes and quirks.

- Core: PCM OSS data race fix
- HD-audio: Fixes for TAS2781, CS35L56, and Realtek/Conexant quirks;
  avoidance of a WARN_ON for HDMI channel mapping
- USB-audio: Improvements in UAC3 parsing robustness (leaks, size
  checks) and fixes for potential endless loops
- ASoC: Driver-specific fixes for CS35L56, Intel bytcr_wm5102,
  Spacemit, AW88395, and others, plus a new quirk for Steam Deck OLED.
- Misc: A UAF fix in aloop driver, division by zero fix in ua101
  driver and leak fixes in caiaq driver

----------------------------------------------------------------

Abhinav Mahadevan (1):
      ALSA: usb-audio: Fix quirk entry placement for PreSonus AudioBox USB

Ajay Kumar Nandam (1):
      ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls

Bard Liao (1):
      ASoC: SOF: Intel: add an empty adr_link

Christian A. Ehrhardt (1):
      ASoC: codecs: ab8500: Fix casting of private data

Cássio Gabriel (4):
      ALSA: hda: cs35l56: Propagate ASP TX source control errors
      ALSA: aloop: Fix peer runtime UAF during format-change stop
      ALSA: usb-audio: Fix UAC3 cluster descriptor size check
      ASoC: Intel: bytcr_wm5102: Fix MCLK leak on platform_clock_control error

Deepanshu Kartikey (1):
      ALSA: caiaq: fix usb_dev refcount leak on probe failure

Guilherme G. Piccoli (1):
      ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED

James Calligeros (2):
      ASoC: tas2764: Mark die temp register as volatile
      ASoC: tas2770: Fix order of operations for temperature calculation

Li Jian (1):
      ASoC: ES8389: convert to devm_clk_get_optional() to get clock

Naser Al-Asbahi (1):
      ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A315-44P

Richard Fitzgerald (2):
      ASoC: cs35l56: Fix illegal writes to OTP_MEM registers
      ALSA: hda: cs35l56: Fix uninitialized value in cs35l56_hda_read_acpi()

Rosalie Wanders (1):
      ALSA: usb-audio: apply quirk for Playstation PDP Riffmaster

Sasha Levin (2):
      ASoC: tegra: Remove stale snd-soc-tegra-utils composite module definition
      ALSA: hda: Remove duplicate cmedia entries in codecs Makefile

SeungJu Cheon (1):
      sound: ua101: fix division by zero at probe

Shenghao Ding (1):
      ALSA: hda/tas2781: Fix incorrect bit update for non-book-zero or book 0 pages >1

Takashi Iwai (6):
      ALSA: pcm: oss: Fix data race at accessing runtime.oss.trigger
      ALSA: caiaq: Fix potentially leftover ep1_in_urb at error path
      ALSA: caiaq: Don't abort when no input device is available
      ALSA: usb-audio: Fix potential leak of pd at parsing UAC3 streams
      ALSA: usb-audio: Avoid potential endless loop in convert_chmap_v3()
      ALSA: hda: Avoid WARN_ON() for HDMI chmap slot checks

Troy Mitchell (2):
      ASoC: spacemit: move hw constraints from hw_params to startup
      ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size

Yuxuan Qiu (1):
      ALSA: hda/realtek: enable mute LED support on ThinkBook 16p

wangdicheng (2):
      ASoC: aw88395: Fix kernel panic caused by invalid GPIO error pointer
      ALSA: hda/conexant: Fix missing error check for jack detection

---
 sound/core/oss/pcm_oss.c                       | 29 +++++++++---
 sound/drivers/aloop.c                          | 43 ++++++++++++------
 sound/hda/codecs/Makefile                      |  2 -
 sound/hda/codecs/conexant.c                    |  8 +++-
 sound/hda/codecs/realtek/alc269.c              | 14 +++++-
 sound/hda/codecs/side-codecs/cs35l56_hda.c     | 31 ++++++++-----
 sound/hda/codecs/side-codecs/cs35l56_hda.h     |  1 +
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 14 ++++--
 sound/hda/core/hdmi_chmap.c                    | 11 +++--
 sound/soc/amd/acp/acp-legacy-mach.c            |  2 +-
 sound/soc/amd/acp/acp-mach-common.c            | 22 +++++++--
 sound/soc/amd/acp/acp-mach.h                   |  4 ++
 sound/soc/amd/acp/acp-sof-mach.c               |  2 +-
 sound/soc/codecs/ab8500-codec.c                |  6 +--
 sound/soc/codecs/aw88395/aw88395.c             |  9 ++--
 sound/soc/codecs/cs35l56-shared.c              |  7 ++-
 sound/soc/codecs/es8389.c                      |  2 +-
 sound/soc/codecs/tas2764.c                     |  1 +
 sound/soc/codecs/tas2770.c                     |  4 +-
 sound/soc/codecs/wcd937x.c                     | 26 ++++++++++-
 sound/soc/intel/boards/bytcr_wm5102.c          |  1 +
 sound/soc/sof/intel/hda.c                      |  3 +-
 sound/soc/spacemit/k1_i2s.c                    | 49 +++++++++++++-------
 sound/soc/tegra/Makefile                       |  1 -
 sound/usb/caiaq/device.c                       |  6 +--
 sound/usb/caiaq/input.c                        |  2 +-
 sound/usb/misc/ua101.c                         |  7 +++
 sound/usb/mixer.c                              | 10 +++++
 sound/usb/quirks-table.h                       |  4 +-
 sound/usb/quirks.c                             |  2 +-
 sound/usb/stream.c                             | 62 +++++++++++---------------
 sound/usb/stream.h                             |  3 +-
 32 files changed, 266 insertions(+), 122 deletions(-)

