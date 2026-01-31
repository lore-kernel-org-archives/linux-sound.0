Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DD2C21FE
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769852088; cv=none; b=u4qomGvFFRVX0cIv8BDZ+n22pV39SRs+U/mCqJKMZPAdIwRc3hY62K0vx55kXmdYfXvcLVd3MaeqUnq0v34uIRm80g1T6vIMqaPV8TvzjdbM0W6AGu2GE/CSBf8g1+jY/bcrwLkp+06cOg+QEInSvC96B6CVEFtbysdbT5ALytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769852088; c=relaxed/simple;
	bh=U6A3IJ6W+tJymm2cwAp75LWkmc/w/tL0oEpub6Ozva0=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=e4RAgNr94wLUt8kF18oyfRuXsjZQHJO8ftTlZT4/bydW6c+voOnSOAKO9wRCmJGmnVwxFf5Ah3zV7LRApsJdQI2HPTTok6cl/gazNV8UI8QTnJoQJBHVOPeU2gm/T2y6hHiVDJfp7vLhhUWCg42UOA+0behSa2eN1amBFcpBEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15z5L8yx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wju04W8n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15z5L8yx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wju04W8n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15z5L8yx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wju04W8n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15z5L8yx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wju04W8n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0763C34BBE;
	Sat, 31 Jan 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769852085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=qH3A1TWBooe3dwRBAcAOC1tSb8HJDgQGCRR1hluR3oU=;
	b=15z5L8yxtbs4ct81tY29J1Y/LGQ7CI2sNXv7G6KGd6V5AbNrRc+sQjjKpRIhmzQj1Rx3j2
	ikQW2ekBd+nmHEa8MKwH4ir57mAukRa95nXFYeO964nHQOpeD4Gen0nAD0x4rSQ7ODjt7X
	dji2aDg1a5RN5gNrApjA8TzlM8zfSAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769852085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=qH3A1TWBooe3dwRBAcAOC1tSb8HJDgQGCRR1hluR3oU=;
	b=Wju04W8nLoUhkJXJIKhAC1mq5FRcwEp14nqT4gG8dTzCpNJKjSE/HI7j2wviLGgDBxMpGH
	E/iEHV7GO447QuCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769852085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=qH3A1TWBooe3dwRBAcAOC1tSb8HJDgQGCRR1hluR3oU=;
	b=15z5L8yxtbs4ct81tY29J1Y/LGQ7CI2sNXv7G6KGd6V5AbNrRc+sQjjKpRIhmzQj1Rx3j2
	ikQW2ekBd+nmHEa8MKwH4ir57mAukRa95nXFYeO964nHQOpeD4Gen0nAD0x4rSQ7ODjt7X
	dji2aDg1a5RN5gNrApjA8TzlM8zfSAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769852085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=qH3A1TWBooe3dwRBAcAOC1tSb8HJDgQGCRR1hluR3oU=;
	b=Wju04W8nLoUhkJXJIKhAC1mq5FRcwEp14nqT4gG8dTzCpNJKjSE/HI7j2wviLGgDBxMpGH
	E/iEHV7GO447QuCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C691B3EA62;
	Sat, 31 Jan 2026 09:34:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QN44L7TMfWktIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Jan 2026 09:34:44 +0000
Date: Sat, 31 Jan 2026 10:34:44 +0100
Message-ID: <87bjiaazwr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19-rc8
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Level: 
X-Spam-Flag: NO

Linus,

please pull sound fixes for v6.19-rc8 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc8

The topmost commit is 00f32dfceda29f8dc6c34b159123f3bf78ad3b4c

----------------------------------------------------------------

sound fixes for 6.19-rc8

Just a few device-specific fixes; all small and mostly trivial,
should be pretty safe to take at the late stage.

----------------------------------------------------------------

Anatolii Shirykalov (1):
      ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list

Bard Liao (1):
      ASoC: soc-acpi-intel-ptl-match: fix name_prefix of rt1320-2

Fabio Estevam (1):
      ASoC: fsl: imx-card: Do not force slot width to sample width

Kailang Yang (1):
      ALSA: hda/realtek - fixed speaker no sound

Maciej Strozek (1):
      ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43

Ricardo Rivera-Matos (1):
      ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel

Shengjiu Wang (1):
      ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform

Tagir Garaev (1):
      ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion

Werner Sembach (1):
      ALSA: hda/realtek: Really fix headset mic for TongFang X6AR55xU.

Zhang Heng (3):
      ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machine
      ALSA: hda/realtek: Add quirk for Inspur S14-G1
      ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO

---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml |  1 +
 sound/hda/codecs/realtek/alc269.c                    | 18 ++++++++++++++----
 sound/soc/amd/yc/acp6x-mach.c                        | 15 +++++++++++++++
 sound/soc/codecs/cs35l45.c                           |  2 +-
 sound/soc/fsl/imx-card.c                             |  1 -
 sound/soc/intel/boards/sof_es8336.c                  |  2 +-
 sound/soc/intel/boards/sof_sdw.c                     |  1 +
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c    |  2 +-
 8 files changed, 34 insertions(+), 8 deletions(-)

