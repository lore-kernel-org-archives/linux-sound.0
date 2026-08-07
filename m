Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448752248B3;
	Fri,  7 Aug 2026 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092009; cv=none; b=CKy+M/pCzxf/EB5KM24uXDVjmK+Y4G0ochElOwqACH8yHGEPv61tVPRIxshp6pGzucEzsI+UTPb2ezLMQQcbGPxDjBYIjoS62fAYvBxdspdpFjGTmGcp0LEsZUrGukn5Lit2zr0/yE83cQ5m+hsu7ZmAw4nlPhieVRDmR10AvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092009; c=relaxed/simple;
	bh=goWW+8+SSlKzKVzK9NlvBnSbxWXTb//ePVmpCp2BkRo=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=qiOul1anz62DswDMgh0fjvuxfIdszFM7E9SZ6Ijc98wlgrRNAcc6ofmk2BKof8v5j16t+/+viBZZHxxGGX2H6oLGivPDzebpGDnB+RaqVjNkz4XJdLorl0ViWgYeg2NEKlH2ekpGsqEBD0ZNqZhLYLYKMAOLcKL4jG+mPIRxiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AvBDK7Bn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yFiR2Fn8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WwKIlX2y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9AS1nvOd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AvBDK7Bn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yFiR2Fn8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WwKIlX2y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9AS1nvOd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 731503DF4;
	Fri,  7 Aug 2026 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786092001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfNLg1Cnf+muFoYMxZuY+BB9yi6y9xjJeM72dG1PVho=;
	b=AvBDK7BnrlbCzAG+d+974qPmTjECbnnQ1gqBa4bemjECwR6Ot19aAl5LYGdcBKMYBjiIaa
	1rOLLHHAVWsz+TxBs8ToudQY/XqIax3tD9aXWZ0PqsSbswtbxzI65vmhVI0EWDK8rBrmao
	W6IYdPOdcTg+GHCvwFuHooXx4G2fLfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786092001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfNLg1Cnf+muFoYMxZuY+BB9yi6y9xjJeM72dG1PVho=;
	b=yFiR2Fn8zBkkM8FMvfR8C0WdhlU0mnOB7AFDQJhZRdussL0DHFn6VdOZ9w9TunSZYLt31J
	cZmnKqSu3cN6kdBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WwKIlX2y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9AS1nvOd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfNLg1Cnf+muFoYMxZuY+BB9yi6y9xjJeM72dG1PVho=;
	b=WwKIlX2yTE55+14+rUAmVy2OhogaRCOFxUtsZRvWXzYt8Oz8inbwAD7OWayseg+WirPL9m
	WKjw/MAu3Sf/5uCpQNodQJ8OM9YJD0WJ6m/FzzLILKRq1vJ5Qfc8HOBVTmLgksJ/XF23X+
	f4TJ55MPjodByHXilRK4D3Bf4SYGxz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfNLg1Cnf+muFoYMxZuY+BB9yi6y9xjJeM72dG1PVho=;
	b=9AS1nvOdZOSFUi88sd4M9Hi9EMj4uPLppRybSsJvW/iimCaNKsMoLHdEX3qZFrlqRCb7P2
	F33lh/LpDeGXTKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AF40779B6;
	Fri,  7 Aug 2026 08:39:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P5UXEd2ZdWoiWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 08:39:57 +0000
Date: Fri, 07 Aug 2026 10:39:56 +0200
Message-ID: <87v79mb9yb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2-rc7
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 731503DF4
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.2-rc7 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc7

The topmost commit is a8934c2c6dfd72901cf3cc0de28e85eb902a61a4

----------------------------------------------------------------

sound fixes for 7.2-rc7

A collection of small fixes since the last pull request.
More than few, but an enough-manageable amount at this time.

USB-audio:
- UAF, OOB and such hardening fixes for USB-audio, usx2y and us144mkii
- Mixer regression fixes for Logitech PRO X 2 LIGHTSPEED headset and
  M-Audio Fast Track Ultra

HD-audio:
- Fix for an ACPI reference leak in TAS2781 HDA side-codec

ASoC:
- Fixes the default tables for Cirrus Logic codecs
- Fixes for invalid enum accesses for Qualcomm LPASS
- Error handling and robustness fixes for Intel SOF & Soundwire
- DMI quirks for a few AMD devices

----------------------------------------------------------------

Bard Liao (2):
      ASoC: SOF: topology: Use acpi mach from the machine driver
      ASoC/soundwire: Intel: reset the PCMSyCM registers in hda_sdw_bpt_close

Baul Lee (4):
      ALSA: FCP: fix OOB write in fcp_meter_ctl_get()
      ALSA: us144mkii: re-anchor capture URBs on resubmission
      ALSA: usb-audio: fix OOB write on Type II inbound URBs
      ALSA: usx2y: bound the hwdep mmap fault offset

Dawid Wróbel (2):
      ASoC: codecs: lpass-tx-macro: Fix enum kcontrol accesses
      ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol accesses

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Refresh copier IPC payload before widget setup
      ASoC: SOF: sof-audio: Fix error path in sof_widget_setup_unlocked()
      ASoC: SOF: ipc4-pcm: Continue the pipeline trigger in case of IPC timeout
      ASoC: cs35l41: sort the register default table
      ASoC: cs35l45: sort the register default table
      ASoC: cs4265: sort the register default table

Rong Zhang (1):
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Logitech PRO X 2 LIGHTSPEED

Rudi Heitbaum (1):
      ASoC: rt5645: Make the Kconfig symbol user selectable

Takashi Iwai (1):
      ALSA: usb-audio: Fix sticky mixer regressions on M-Audio Fast Track Ultra

Troy Mitchell (1):
      MAINTAINERS: add SpacemiT K1/K3 I2S entry

Xu Rao (1):
      ALSA: hda/tas2781: fix ACPI reference handling

Zhang Heng (3):
      ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
      ASoC: amd: yc: Add DMI quirk for Xiaomi RedmiBook 16 2025
      ASoC: amd: yc: Add DMI quirk for MSI Raider A18 HX A7VHG

---
 MAINTAINERS                                        |  6 ++++
 drivers/soundwire/intel_ace2x.c                    |  4 ++-
 include/sound/hda-sdw-bpt.h                        |  5 ++--
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |  3 +-
 sound/soc/amd/yc/acp6x-mach.c                      | 22 ++++++++++++++-
 sound/soc/codecs/Kconfig                           |  2 +-
 sound/soc/codecs/cs35l41-lib.c                     |  2 +-
 sound/soc/codecs/cs35l45-tables.c                  | 32 ++++++++++-----------
 sound/soc/codecs/cs4265.c                          |  4 +--
 sound/soc/codecs/lpass-tx-macro.c                  |  4 +--
 sound/soc/codecs/lpass-wsa-macro.c                 |  8 +++---
 sound/soc/intel/common/sof-function-topology-lib.c |  7 ++++-
 sound/soc/sof/intel/hda-sdw-bpt.c                  | 31 ++++++++++++++++++--
 sound/soc/sof/ipc4-pcm.c                           | 25 ++++++++++++----
 sound/soc/sof/ipc4-topology.c                      | 33 ++++++++++++++++++++++
 sound/soc/sof/sof-audio.c                          |  9 +++---
 sound/usb/endpoint.c                               |  6 ++--
 sound/usb/fcp.c                                    | 10 ++++++-
 sound/usb/quirks.c                                 |  6 ++++
 sound/usb/usx2y/us144mkii_capture.c                |  1 +
 sound/usb/usx2y/usX2Yhwdep.c                       |  2 ++
 sound/usb/usx2y/usx2yhwdeppcm.c                    |  2 ++
 22 files changed, 175 insertions(+), 49 deletions(-)

