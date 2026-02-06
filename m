Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F78350A17
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770371119; cv=none; b=CHQvKt8cWChY4PXc5ro3azhhAN1gv4ku07UKCA1a7xMtewULpp9cVPr14zVOgGYh1tgkbaLHghnCgraWs4hushBHS0othfAQeIach2kX4q/21l34qNF2BDpqv8cwoGHcwSmVF05GpEXj4EtyFybdhLjRSNwRUXknbPusCUmbbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770371119; c=relaxed/simple;
	bh=PzFwXnhVlPMQz9czgCDLFhlAddyJb1P0AjEtW3rYpJ4=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=cNeOBzQdlnSeT9pNxV8vOADuAu/cKOm/bDHmzKYhGNNFJc2o0TUagWska+K8XSfkhIFQvCwKlAHPuO0mpdDvwGn857kweI/3U+pqhuAW3c8u1uV9o651sO5ksMIAoA6dRZid4iATIqI3W3kaQBG6kaX4U4yPWBJH5dUva91s6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dDkDTNoP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X4vZG2pJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dDkDTNoP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X4vZG2pJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dDkDTNoP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X4vZG2pJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dDkDTNoP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X4vZG2pJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 304553E6D4;
	Fri,  6 Feb 2026 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770371117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Pj9eYxSkjjOUJW2K2At9l/4+KF6qnHytY4W99eYRZ10=;
	b=dDkDTNoPQo7taO0pFxjF87kgT0adenNvxS7swssMLxoRJOOD8JLQ9z327694wuNwl66jx0
	9EE2mBN7WsxsEdF62PAcl+YutD9sh1/Vn26qrjz29TftPeh1nSYahFCIplC5O6xOL9aWbu
	D2f6jgJ9GV+NhmY5GH+BGM1Bf6qb6xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770371117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Pj9eYxSkjjOUJW2K2At9l/4+KF6qnHytY4W99eYRZ10=;
	b=X4vZG2pJAG4SLyJ/i2r+rkWCGaXP1fcqzZ5sASUm0ogK8zdzOeKce2c4QBGsWElwZ8VXjv
	85eSezb7nYrGeCAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dDkDTNoP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X4vZG2pJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770371117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Pj9eYxSkjjOUJW2K2At9l/4+KF6qnHytY4W99eYRZ10=;
	b=dDkDTNoPQo7taO0pFxjF87kgT0adenNvxS7swssMLxoRJOOD8JLQ9z327694wuNwl66jx0
	9EE2mBN7WsxsEdF62PAcl+YutD9sh1/Vn26qrjz29TftPeh1nSYahFCIplC5O6xOL9aWbu
	D2f6jgJ9GV+NhmY5GH+BGM1Bf6qb6xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770371117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Pj9eYxSkjjOUJW2K2At9l/4+KF6qnHytY4W99eYRZ10=;
	b=X4vZG2pJAG4SLyJ/i2r+rkWCGaXP1fcqzZ5sASUm0ogK8zdzOeKce2c4QBGsWElwZ8VXjv
	85eSezb7nYrGeCAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0F4A3EA63;
	Fri,  6 Feb 2026 09:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S3TSNCy4hWkUQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Feb 2026 09:45:16 +0000
Date: Fri, 06 Feb 2026 10:45:16 +0100
Message-ID: <87h5rub3yr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
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
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 304553E6D4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Linus,

please pull sound fixes for v6.19 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19

The topmost commit is 51db05283f7c9c95a3e6853a3044cd04226551bf

----------------------------------------------------------------

sound fixes for 6.19

A collection of small fixes.  It became a bit larger than wished,
but all of them are device-specific small fixes, and it should be
still fairly safe to take at the last minute.

Included are a few quirks and fixes for Intel, AMD, HD-audio, and
USB-audio, as well as a race fix in aloop driver and corrections
of Cirrus firmware kunit test

----------------------------------------------------------------

Bard Liao (1):
      ASoC: SOF: Intel: use hdev->info.link_mask directly

Breno Baptista (1):
      ALSA: hda/realtek: Enable headset mic for Acer Nitro 5

Charles Keepax (1):
      ASoC: cs42l43: Correct handling of 3-pole jack load detection

Chris Bainbridge (1):
      ASoC: amd: fix memory leak in acp3x pdm dma ops

Dirk Su (1):
      ASoC: amd: yc: Add quirk for HP 200 G2a 16

Frank Li (1):
      ASoC: dt-bindings: ti,tlv320aic3x: Add compatible string ti,tlv320aic23

Maciej Strozek (1):
      ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43

Richard Fitzgerald (1):
      firmware: cs_dsp: rate-limit log messages in KUnit builds

Sergey Shtylyov (1):
      ALSA: usb-audio: fix broken logic in snd_audigy2nx_led_update()

Shuming Fan (1):
      ASoC: rt1320: fix intermittent no-sound issue

Tagir Garaev (1):
      ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9

Takashi Iwai (1):
      ALSA: aloop: Fix racy access at PCM trigger

Ziyi Guo (1):
      ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()

---
 .../devicetree/bindings/sound/ti,tlv320aic3x.yaml  |  1 +
 drivers/firmware/cirrus/cs_dsp.c                   | 37 +++++++++++++
 drivers/firmware/cirrus/cs_dsp.h                   | 18 +++++++
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     | 22 +++++++-
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   | 24 ++++++---
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c    | 26 ++++++++-
 .../firmware/cirrus/test/cs_dsp_test_wmfw_error.c  | 24 ++++++---
 drivers/firmware/cirrus/test/cs_dsp_tests.c        |  1 +
 sound/drivers/aloop.c                              | 62 +++++++++++++---------
 sound/hda/codecs/realtek/alc269.c                  |  1 +
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |  2 +
 sound/soc/amd/yc/acp6x-mach.c                      |  7 +++
 sound/soc/codecs/cs42l43-jack.c                    | 37 ++++++++++---
 sound/soc/codecs/rt1320-sdw.c                      |  2 +
 sound/soc/fsl/fsl_xcvr.c                           |  3 ++
 sound/soc/intel/boards/sof_es8336.c                |  9 ++++
 sound/soc/sof/intel/hda.c                          |  5 +-
 sound/usb/mixer_quirks.c                           |  9 +---
 18 files changed, 234 insertions(+), 56 deletions(-)
 create mode 100644 drivers/firmware/cirrus/cs_dsp.h

