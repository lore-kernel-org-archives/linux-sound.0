Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47B5695
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767856672; cv=none; b=mDDMKpnBWNA3GLa7LsxvgXl9MWPVoTYDX/UAw2VAd8aFLEKV/8pVQKiBE9EWkn5C22ZdMPk09aSOCLCTmetJLzAQcG99WmraXZZKFEcKMZgRfwQvpjrgzsPAAvdAXKXVJz1J03ZYpBOlWbKtKVodNrCh4aBSiRMbtQOFBgxi3wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767856672; c=relaxed/simple;
	bh=xLOKUARNRsr7HlGhqG3MalsSROEJR9VAh8S8yEijrBY=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=BBKfxxJ/4qhX2EnvMm3UbbQnhnWce9LX0jYTUUzI+1sioLWOsDHhRenmqfcRR7Aqqvfn6SATwS5QkSKsko6jm14fcilwvKJXvckD91hJdt3m8G50C5tgvEL8S8yqNTnGTcXkpAJ8ohy37v9JSElWNlhvoTD+6pyPgCdAhdzasgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4692QGm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LsQQ9SDG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGvA4CPQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I0yTLA1U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4692QGm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LsQQ9SDG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGvA4CPQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I0yTLA1U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E819333699;
	Thu,  8 Jan 2026 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767856668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T5SmfBZ1yHHxnf/4/ZgoiVJWqyNsbO9/YDpiggKQw1Y=;
	b=y4692QGm0WMaN1t0Lhc1d+AXVcIrww1IGDK14gg9X20wjTaOVRaAXpAVQkwCFS0waAHYFm
	sZvlVEXn89F9/IBtA2uSTMJ4rtxnBiZDXqnjRUBzRP7ihRthT+C+fW2O0cTtnE8lyqCAAR
	4bwanKo16OfAJEyoyig5h6FhKUwqKpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767856668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T5SmfBZ1yHHxnf/4/ZgoiVJWqyNsbO9/YDpiggKQw1Y=;
	b=LsQQ9SDG5UZQIjaScc3OkYVUJcQk1brfR/IOLSvoq8/Jm6cei32wRrSNYdMcsc9kram2bf
	2Y+cuU1mpwtluLBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DGvA4CPQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I0yTLA1U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767856667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T5SmfBZ1yHHxnf/4/ZgoiVJWqyNsbO9/YDpiggKQw1Y=;
	b=DGvA4CPQo8LLI4qhZGqRBjafcMkDjj7WrMApxUGsrZfH5EKiWuY/lgBLBIxOgrQbSC1LJL
	LI/R2PO+SWIou8MpuhEolXzq+yIk0ziXpJkTTXJsyjK6+iXIFPiLb7EpuRjOsrCmVuYY5T
	8q8FR10zFd07dDH3HdgzxBmUIW9pIbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767856667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T5SmfBZ1yHHxnf/4/ZgoiVJWqyNsbO9/YDpiggKQw1Y=;
	b=I0yTLA1UAOG5dSd8N34wIJ2RudaZXp1dlWGPcEUD2nZ5V7axMbnc00ysOQCvL7uG8DUJmN
	bxd9jaFQQIv6afBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C07213EA63;
	Thu,  8 Jan 2026 07:17:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4JLkLRtaX2kiHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Jan 2026 07:17:47 +0000
Date: Thu, 08 Jan 2026 08:17:47 +0100
Message-ID: <87jyxsh8tg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19-rc5
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: E819333699
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

Linus,

please pull sound fixes for v6.19-rc5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc5

The topmost commit is 9ed7a28225af02b74f61e7880d460db49db83758

----------------------------------------------------------------

sound fixes for 6.19-rc5

A collection of small device-specific fixes.

* ASoC Intel topology fixes for conflicting Bluetooth bits
* Cleanups of ASoC drivers for superfluous NULL checks
* Fix for error handling in the AC97 bus
* A regression fix for TAS2781 speaker ID handling
* HD-audio quirks

----------------------------------------------------------------

August Wikerfors (1):
      ALSA: hda/tas2781: properly initialize speaker_id for TAS2563

Bard Liao (1):
      ASoC: SOF: Intel: add -bt tplg suffix if BT is present

Chen-Yu Tsai (1):
      ASoC: sun4i-spdif: Add missing kerneldoc fields for sun4i_spdif_quirks

Haoxiang Li (1):
      ALSA: ac97: fix a double free in snd_ac97_controller_register()

Johan Hovold (4):
      ASoC: codecs: pm4125: drop bogus container_of() error handling
      ASoC: codecs: wcd937x: drop bogus container_of() error handling
      ASoC: soc_sdw_utils: drop bogus container_of() error handling
      ASoC: codecs: pm4125: clean up bind() device reference handling

Mac Chiang (1):
      ASoC: Intel: sof_sdw: shift SSP BT mask bits.

Matou¹ Lánský (1):
      ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55

Ruslan Krupitsa (1):
      ALSA: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk

---
 sound/ac97/bus.c                               | 10 +++++-----
 sound/hda/codecs/realtek/alc269.c              |  2 ++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  4 +++-
 sound/soc/codecs/pm4125.c                      | 17 ++---------------
 sound/soc/codecs/wcd937x.c                     |  5 -----
 sound/soc/intel/boards/sof_sdw_common.h        |  6 +++---
 sound/soc/sdw_utils/soc_sdw_utils.c            |  4 ----
 sound/soc/sof/intel/hda.c                      | 14 +++++++++++++-
 sound/soc/sunxi/sun4i-spdif.c                  |  2 ++
 9 files changed, 30 insertions(+), 34 deletions(-)

