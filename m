Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006523DBD7F
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748143; cv=none; b=fjw0oFWUIZgzh3kUW0Ko/l+9kL2ITpQWx0NAn2cbFtNRA8693wQjvUwkyHfGMWiSE36Ct72xt2HSn2c7WrKnJN0QxdUOvDRMOEgGVSfVjU2Q3uecVBNDmdn9e+R7AUIpQahtGY7sVGwMTG9rSjwn5rCoXr6crEooWJvUBBhh4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748143; c=relaxed/simple;
	bh=a0epygclV5kb75ekZXSzOVL9vpibNS49/Wd8Livh15c=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=dZHF3Dk3XmQLj4C/Khr3qCz6VLgOlzlwk9Bbdvavlvq1qP8nr0seTyBsKtrLMVFgpycoPcgbgM1ua9BPBRQLqUabr0gTzxmNaWpPhvZ6ASvkrcyjnYHjeKj+XxQgc+6qJgSjqvPJ5ocOrzVggzgoUVqnAFqqQ2lnuMumFOGbDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aR+Q7alu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tetEtCUH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aR+Q7alu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tetEtCUH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aR+Q7alu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tetEtCUH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aR+Q7alu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tetEtCUH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 50FC45BD2F;
	Thu,  9 Apr 2026 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775748140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=BbXvOMbNaTAa67Zrm+ufmrJXXwoA7z5K77JnqJi73i8=;
	b=aR+Q7aluyWh78fVXCW+liQNa0lw8eq0CVr+VGf5gzlDSsPBJNT2R28nYjMDlPgtbb+Fvry
	5/ZBizdmiDBkvAgRT8hCieANJjt/ujWZ6PO3iZeFQ85ohg/KdUjt0HyCursD3NZuskbVnv
	RaBLxbYP3aKOUokn1Z8wH20vmc12eM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775748140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=BbXvOMbNaTAa67Zrm+ufmrJXXwoA7z5K77JnqJi73i8=;
	b=tetEtCUHcIsB0dBANRoPljXjT95ek1/v1U2unOGnJSbWPDKzMXqkHTvAsFJXspyrnTdW1t
	ZgnmWrrdiwv1ynDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aR+Q7alu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tetEtCUH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775748140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=BbXvOMbNaTAa67Zrm+ufmrJXXwoA7z5K77JnqJi73i8=;
	b=aR+Q7aluyWh78fVXCW+liQNa0lw8eq0CVr+VGf5gzlDSsPBJNT2R28nYjMDlPgtbb+Fvry
	5/ZBizdmiDBkvAgRT8hCieANJjt/ujWZ6PO3iZeFQ85ohg/KdUjt0HyCursD3NZuskbVnv
	RaBLxbYP3aKOUokn1Z8wH20vmc12eM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775748140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=BbXvOMbNaTAa67Zrm+ufmrJXXwoA7z5K77JnqJi73i8=;
	b=tetEtCUHcIsB0dBANRoPljXjT95ek1/v1U2unOGnJSbWPDKzMXqkHTvAsFJXspyrnTdW1t
	ZgnmWrrdiwv1ynDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 213A74A0B3;
	Thu,  9 Apr 2026 15:22:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E1GKBizE12n8MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 15:22:20 +0000
Date: Thu, 09 Apr 2026 17:22:19 +0200
Message-ID: <87a4vci2fo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 50FC45BD2F

Linus,

please pull sound fixes for v7.0 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0

The topmost commit is 00afb1811fa638dacf125dd1c343b7a181624dfd

----------------------------------------------------------------

sound fixes for 7.0

Still a bit higher amount than wished, but nothing looks really scary,
and all changes are about nice and smooth device-specific fixes.

- HD-audio quirks, one revert for a regression and another oneliner
- AMD ACP quirks
- Fixes for SDCA interrupt handling
- A few Intel SOF, avs and NVL fixes
- Fixes for TAS2552 DT, NAU8325, and STM32

----------------------------------------------------------------

Cezary Rojewski (1):
      ASoC: Intel: avs: Fix memory leak in avs_register_i2s_test_boards()

Charles Keepax (1):
      ASoC: SDCA: Fix errors in IRQ cleanup

Kai Vehmanen (2):
      ALSA: hda/intel: enforce stricter period-size alignment for Intel NVL
      ASoC: SOF: Intel: hda: modify period size constraints for ACE4

Maciej Strozek (4):
      ASoC: SOF: Intel: Fix endpoint index if endpoints are missing
      ASoC: SOF: Intel: fix iteration in is_endpoint_present()
      ASoC: SDCA: Fix overwritten var within for loop
      ASoC: SDCA: mask Function_Status value

Marek Vasut (1):
      ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells

Mark Pearson (1):
      ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine

Neo Chang (1):
      ASoC: nau8325: Add software reset during probe

Richard Fitzgerald (1):
      ASoC: SDCA: Unregister IRQ handlers on module remove

Syed Saba Kareem (1):
      ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms

Takashi Iwai (1):
      Revert "ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone"

Tomasz Merta (1):
      ASoC: stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J

songxiebing (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IAH10

---
 .../devicetree/bindings/sound/ti,tas2552.yaml      | 13 +++-
 include/sound/sdca_interrupts.h                    |  5 ++
 sound/hda/codecs/realtek/alc269.c                  |  1 +
 sound/hda/codecs/realtek/alc662.c                  |  9 ---
 sound/hda/controllers/intel.c                      |  7 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            | 24 +++++--
 sound/soc/codecs/nau8325.c                         |  9 ++-
 sound/soc/intel/avs/board_selection.c              |  9 ++-
 sound/soc/sdca/sdca_class_function.c               | 17 +++++
 sound/soc/sdca/sdca_interrupts.c                   | 82 +++++++++++++++++++---
 sound/soc/sof/intel/hda-pcm.c                      | 14 +++-
 sound/soc/sof/intel/hda.c                          | 10 ++-
 sound/soc/stm/stm32_sai_sub.c                      |  3 +
 13 files changed, 165 insertions(+), 38 deletions(-)

