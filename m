Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AD339399;
	Fri, 14 Aug 2026 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709136; cv=none; b=nYuDX/81wHqpfPHUjVx2lYfu6YvWZS/vwN7J8s09ojFPJUoYENyQegCXGJXKZ5nBXNUOcyZEv0euKsb+PJWRhhe0/PP0K1IBdNH4nCOQoit9vhLmxJqwDWrZgERvMQFDjT/4rwL7AWZZhAeHrn7BopE/64yeXN7pz9gVVjwDVkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709136; c=relaxed/simple;
	bh=qnwfW74PNtgJSydHuve2IB7SxXRvjzcQ3URnAMcdqc8=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=fwZijDCRtJHzb+YmB+tNHo7x82+6+HhUlbTESNij3zD+g2LNIIzyDA9ZvMR2cit0qwRuVaNyviZN/xLoqniaSv9s3b6efTQ0PZRXrYpRzlZDnhddHfILtavwza563EffLSfnh/kaNpUK86mAp1KTkt5cxUSe2kd8Rr+p6CqiExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lggvKrz2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9InIGTdv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PN3TllXM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gcrUgQ/K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lggvKrz2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9InIGTdv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PN3TllXM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gcrUgQ/K"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 202E33EB1;
	Fri, 14 Aug 2026 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786709129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=G3skxfAnTN0a3Mn9FwEhDnFg4hMb4F7UIyFrAWUmPyA=;
	b=lggvKrz209sEq2ECCend9r54O0swnOr3rYUYPWCBFJf7aZfZ28mrvAj4m4sgTh8pYmO5pM
	VAIsN1A/T1mguiqVNBCnS7pG+XtYta8grJ6xpT83x3bEgKnOl1ZXkZKu3Q1TbLmwgacUHb
	HMIBOlQ7U0YKhOjsMCvXWjcgseT0TZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786709129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=G3skxfAnTN0a3Mn9FwEhDnFg4hMb4F7UIyFrAWUmPyA=;
	b=9InIGTdv0qOPsv58lNIMYdXJB39QTKdfLRcSWpPAsxV2ic/PMs5ETXM3vizE+znFS5nsov
	h0uc33bbhoZxesBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PN3TllXM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="gcrUgQ/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786709125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=G3skxfAnTN0a3Mn9FwEhDnFg4hMb4F7UIyFrAWUmPyA=;
	b=PN3TllXMruoOe3gXR3VI5e4JGdWYIKRNibzgm6LfPwY9r7qt2snXbbYKeu+f0PNIxEu7x7
	DLKerg2JDGbu+sdQCcCs/ocwZUpAmUg5rSokz6Su1Aj94+wnFY1Po7xr4aeCH8+qNRu7AI
	yF89x7sDElgsFszrNLr4F30INMmnAYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786709125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=G3skxfAnTN0a3Mn9FwEhDnFg4hMb4F7UIyFrAWUmPyA=;
	b=gcrUgQ/KPdsm0ubUDt52vWgnOaQz3yYVRz+RnWdZXGvPlW2q075LmHQz/LtDZEv5rSIbN+
	9S7gqF4RNYC9gGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E584578382;
	Fri, 14 Aug 2026 12:05:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XXjhNoQEf2rSfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Aug 2026 12:05:24 +0000
Date: Fri, 14 Aug 2026 14:05:24 +0200
Message-ID: <87a4qoewl7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 202E33EB1
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2

The topmost commit is a92ee0d2486a8b3cd1483afdb6db21b51853867e

----------------------------------------------------------------

sound fixes for 7.2

A handful of small device-specific quirks, regression fixes, and build
fixes.  Nothing really stands out.

- Fix for a potential UAF in in USB-audio MIDI2 endpoint handling
- Fix for a mixer regression on SteelSeries Arctis Nova 5 in USB-audio
- ASoC Intel HDMI-In capture, ACPI match table additions and quirks
- ASoC AMD quirk for HyperX OMEN
- Fix for ASoC Xilinx about crash in pcm formatter IRQ handlers
- Fixes for ASoC Realtek rt1320 and rt5645 codecs
- Fixes for ASoC TI tas2781 and tac5xx2-sdw build errors

----------------------------------------------------------------

Balamurugan C (3):
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in NVL match table
      ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for NVL.
      ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards.

Lin Xianglin (1):
      ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx

Niranjan H Y (1):
      ASoC: tac5xx2-sdw: select REGMAP_SOUNDWIRE_MBQ

Rosen Penev (1):
      ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers

Rudi Heitbaum (1):
      ASoC: rt5645: Perform the initial jack detect at probe

Sergey Lebedev (1):
      ASoC: rt1320: run the initialisation preset on the first hardware init

Shenghao Ding (1):
      ASoC: tas2781: fix clang build error for goto bypassing cleanup variable

Takashi Iwai (2):
      ALSA: usb: Fix UAF at delayed release of MIDI2 EPs
      ALSA: usb-audio: Fix mixer regression on SteelSeries Arctis Nova 5

---
 sound/soc/amd/yc/acp6x-mach.c                     |  7 +++++++
 sound/soc/codecs/Kconfig                          |  1 +
 sound/soc/codecs/rt1320-sdw.c                     |  2 +-
 sound/soc/codecs/rt5645.c                         |  4 ++++
 sound/soc/codecs/tas2781-i2c.c                    | 18 ++++++++--------
 sound/soc/intel/boards/sof_es8336.c               | 10 +++++++++
 sound/soc/intel/boards/sof_rt5682.c               |  7 +++++++
 sound/soc/intel/boards/sof_ssp_amp.c              |  6 ++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 25 +++++++++++++++++++++++
 sound/soc/xilinx/xlnx_formatter_pcm.c             | 10 ++++-----
 sound/usb/midi2.c                                 |  9 ++++++++
 sound/usb/quirks.c                                |  2 ++
 12 files changed, 85 insertions(+), 16 deletions(-)

