Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0221D3CC
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762202; cv=none; b=Wq2yjFskKVMuUaa5ym2y9rajQKmIFOwftEZ5cdUmbBRdZloC6TLq3YrVXKGFxOYC1Qs7LQaHpF1R8otKnaRI6RPCSzjgmUwHLIGFIaL0ZcU8cDiv9wBd3MwYQ6e9Z6TpwGBZ1G18Ikkmuh1nlL+uklRXJruc2VnOsrKAVRshpKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762202; c=relaxed/simple;
	bh=1xtIxT6BiEk3re8CQ8NKt3rqN4A86O+VdHR8vihjmoQ=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=D0Chy+ve113nHxzJ+aK+qloGUkihg2cJiMyINp1iv0H4D5BmKX77LDBI0IdOT4nRYeMhCX4KPuVw0twMlIqyWVmHEi+uaMFk47WHJcBHl1zwFzq022cFaLutflVRdXGAnJ6YB8NEPjha+VOOt7JLPcAjZjVGB/m+j0e73+Vm1NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBTpDcVz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WL9amWwO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBTpDcVz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WL9amWwO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBTpDcVz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WL9amWwO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBTpDcVz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WL9amWwO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F20BB6AE2C;
	Sat,  6 Jun 2026 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QySeFQuh1jPdhIAMf9VaBQnRALaVlxcB98bSbIQ40oI=;
	b=PBTpDcVzLlQ8OIAROz5ZXgIoGc9tnuVVod0u3MgBF6IL6Dj6TRUYeZqkWuU6XtBECha01n
	366zhKVAUFGnGDCsia14ZdaJ5gjtIKU6c1qU1NFf/fdhuHq38wiuJQUbEVei+OVdXe6OLN
	aPQnEOAyqb1j8x5j8uR03jsgjntyqWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QySeFQuh1jPdhIAMf9VaBQnRALaVlxcB98bSbIQ40oI=;
	b=WL9amWwO2IADmgKuKlJLwf9DTm3Z4wGhYk+Xe02OpvHREBbooiTfMcCxXLb6evRXJqq0OO
	S8V78Sb7YpqoMBAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PBTpDcVz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WL9amWwO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QySeFQuh1jPdhIAMf9VaBQnRALaVlxcB98bSbIQ40oI=;
	b=PBTpDcVzLlQ8OIAROz5ZXgIoGc9tnuVVod0u3MgBF6IL6Dj6TRUYeZqkWuU6XtBECha01n
	366zhKVAUFGnGDCsia14ZdaJ5gjtIKU6c1qU1NFf/fdhuHq38wiuJQUbEVei+OVdXe6OLN
	aPQnEOAyqb1j8x5j8uR03jsgjntyqWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QySeFQuh1jPdhIAMf9VaBQnRALaVlxcB98bSbIQ40oI=;
	b=WL9amWwO2IADmgKuKlJLwf9DTm3Z4wGhYk+Xe02OpvHREBbooiTfMcCxXLb6evRXJqq0OO
	S8V78Sb7YpqoMBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9A43779A7;
	Sat,  6 Jun 2026 16:09:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qkSxK1ZGJGrLbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jun 2026 16:09:58 +0000
Date: Sat, 06 Jun 2026 18:09:58 +0200
Message-ID: <87wlwbsl9l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc7
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: F20BB6AE2C
X-Spam-Score: -3.51

Linus,

please pull sound fixes for v7.1-rc7 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc7

The topmost commit is 2b5ff4db5d7aa5b981d966df02e687f79ad7b311

----------------------------------------------------------------

sound fixes for 7.1-rc7

It's getting calmer, but we cam up with still a handful small fixes,
including two core fixes.  All look sane and safe.

* Core:
- Fix wait queue list corruption in snd_pcm_drain() on linked streams
- Fix UMP event stack overread in seq dummy driver

* USB-audio:
- Add quirk for AB13X USB Audio
- Fix the regression with sticky mixer volumes in 7.1-rc

* ASoC:
- Fix 32-slot TDM breakage on Freescale SAI
- Varioud DMI quirks for AMD ACP

----------------------------------------------------------------

Aleksander Pshenitsyn (1):
      ASoC: amd: acp70: add standalone RT721 SoundWire machine

Chancel Liu (1):
      ASoC: fsl_sai: Fix 32 slots TDM broken by integer shift UB in xMR write

David Glushkov (1):
      ASoC: amd: yc: Add MSI Raider A18 HX A9WJG to quirk table

Jackie Dong (1):
      ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 15ASH11

Ji'an Zhou (1):
      ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on linked streams

João Miguel (1):
      ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF

Kyle Zeng (1):
      ALSA: seq: dummy: fix UMP event stack overread

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio

Rong Zhang (1):
      ALSA: usb-audio: Set the value of potential sticky mixers to maximum

---
 sound/core/pcm_native.c                  |  7 +++--
 sound/core/seq/seq_dummy.c               | 15 ++++++-----
 sound/soc/amd/acp-config.c               |  7 +++++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c            | 14 ++++++++++
 sound/soc/fsl/fsl_sai.c                  |  2 +-
 sound/usb/mixer.c                        | 33 +++++++++++++++++++++---
 sound/usb/quirks.c                       |  2 ++
 8 files changed, 109 insertions(+), 15 deletions(-)

