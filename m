Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAAB3ED5A6
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814204; cv=none; b=MmEh0SLTtqz6nKfEzXqgW3y2aOfQ5fAda2fgZoxprafqSzUC/i6tcpwvRXcaC0Qlgqkc+wWOgi9o6+s1zKojUQ0fqKn5HXZONABTqj6h0FuQkMboCw53WyfMkaooR1LVjnxq85p4jtyerzFx6VfdgO5njna8txb/HX2PNBP5ke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814204; c=relaxed/simple;
	bh=0qZO7XmVAQUfEbH9kbhH4BQqgkxpRNwcCwNVJpau3bg=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=h/nOHmu1Ulkph7tfIpm6hnW0XSffcGWLNSJjyd0JhA9IiGeXqdyB/+hQPnAF4wY98KK5YtmFOy93oheflAbUlPQSJoKesapIr+qRLRFf5s0pY+AO95b32Xa699cfP0YLtAxHlSzq/22GkaUV2EbU6JUYk5eNFks0RCM4LetC+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=thCqclFs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OnGSt/58; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=thCqclFs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OnGSt/58; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="thCqclFs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OnGSt/58";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="thCqclFs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OnGSt/58"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5DABE5BD91;
	Fri,  6 Mar 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772814201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fokpHWyQBHnYHjcZT6Fn6y/BRrejeSYcr7Lvs9YFSW4=;
	b=thCqclFsU79EFIQhfACjCLjpS5ulBTbeE2z77A1v4B4+40IFySB4iQN5mkV56+1GmQx9Go
	eEZzktfd3hOPpcMVjY+I2+1W/cqBshMRG2iRdlozvDR3NJFyEfd+6f4FkVXKmG2TGOED1N
	ZQk0lw+B2tw3+gyJl0O2yXslf5qZ55w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772814201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fokpHWyQBHnYHjcZT6Fn6y/BRrejeSYcr7Lvs9YFSW4=;
	b=OnGSt/58fJKFjo4GMiuFO5rjZqJx2Oll7nPnSPxEwMnvIDLsPa3apecw2gEVrUD+K95g9B
	s+xClEpXp/AwiBDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=thCqclFs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="OnGSt/58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772814201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fokpHWyQBHnYHjcZT6Fn6y/BRrejeSYcr7Lvs9YFSW4=;
	b=thCqclFsU79EFIQhfACjCLjpS5ulBTbeE2z77A1v4B4+40IFySB4iQN5mkV56+1GmQx9Go
	eEZzktfd3hOPpcMVjY+I2+1W/cqBshMRG2iRdlozvDR3NJFyEfd+6f4FkVXKmG2TGOED1N
	ZQk0lw+B2tw3+gyJl0O2yXslf5qZ55w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772814201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fokpHWyQBHnYHjcZT6Fn6y/BRrejeSYcr7Lvs9YFSW4=;
	b=OnGSt/58fJKFjo4GMiuFO5rjZqJx2Oll7nPnSPxEwMnvIDLsPa3apecw2gEVrUD+K95g9B
	s+xClEpXp/AwiBDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 321403EA75;
	Fri,  6 Mar 2026 16:23:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oqpWCnn/qmllOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Mar 2026 16:23:21 +0000
Date: Fri, 06 Mar 2026 17:23:20 +0100
Message-ID: <87qzpxudtz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0-rc3
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 5DABE5BD91
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

Linus,

please pull sound fixes for v7.0-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc3

The topmost commit is 8457669db968c98edb781892d73fa559e1efcbd4

----------------------------------------------------------------

sound fixes for 7.0-rc3

Again a collection of device-specific fixes.  Most of changes are
fairly small device-specific quirks of fixes for HD- and USB-audio,
ASoC Intel, AMD, fsl, Cirrus and co.  The only large LOC is for
plumbing ASoC ACP driver to add the Cirrus Logic codec support, so
this one is also just adding some tables.

----------------------------------------------------------------

Biju Das (1):
      ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G3L SoC

Charles Keepax (1):
      ASoC: SDCA: Add allocation failure check for Entity name

Johan Hovold (1):
      ALSA: us122l: drop redundant interface references

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio

Mark Brown (2):
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()

Matt DeVillier (1):
      ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headphone pin verb

Oliver Freyermuth (1):
      ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU

Richard Fitzgerald (2):
      ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink
      ASoC: cs35l56: Suppress pointless warning about number of GPIO pulls

Rong Zhang (1):
      ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP

Sheetal (2):
      ALSA: hda/hdmi: Add Tegra238 HDA codec device ID
      ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card

Shenghao Ding (1):
      ALSA: hda/tas2781: A workaround solution to lower-vol issue among lower calibrated-impedance micro-speaker on TAS2781

Shuming Fan (1):
      ASoC: rt1321: fix DMIC ch2/3 mask issue

Simon Trimmer (1):
      ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic parts

Takashi Iwai (1):
      ALSA: firewire: dice: Fix printf warning with W=1

Zhang Heng (2):
      ALSA: hda/realtek: Add quirk for HP Pavilion 15-eh1xxx to enable mute LED
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA

wangdicheng (2):
      ALSA: hda/senary: Use codec->core.afg for GPIO access
      ALSA: hda/senary: Ensure EAPD is enabled during init

---
 .../sound/nvidia,tegra-audio-graph-card.yaml       |   1 +
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   1 +
 Documentation/sound/alsa-configuration.rst         |   4 +
 include/sound/cs35l56.h                            |   1 +
 include/sound/tas2781.h                            |   1 +
 sound/firewire/dice/dice.c                         |   2 +-
 sound/hda/codecs/ca0132.c                          |   9 +
 sound/hda/codecs/hdmi/tegrahdmi.c                  |   1 +
 sound/hda/codecs/realtek/alc269.c                  |   1 +
 sound/hda/codecs/senarytech.c                      |  14 +-
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |  15 +-
 sound/soc/amd/acp/amd-acp63-acpi-match.c           | 413 +++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                      |   7 +
 sound/soc/codecs/cs35l56-shared.c                  |  16 +-
 sound/soc/codecs/cs35l56.c                         |  12 +-
 sound/soc/codecs/rt1320-sdw.c                      |   5 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |  94 +++++
 sound/soc/fsl/fsl_easrc.c                          |  14 +-
 sound/soc/intel/boards/sof_sdw.c                   |   8 +
 sound/soc/sdca/sdca_functions.c                    |   5 +-
 sound/usb/quirks.c                                 |   2 +
 sound/usb/usx2y/us122l.c                           |  12 +-
 22 files changed, 599 insertions(+), 39 deletions(-)

