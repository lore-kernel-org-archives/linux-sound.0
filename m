Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603853AA4E6
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413757; cv=none; b=KDdjo/pH/gqkVsj4N8seY4jLaqWeqPENlzwe1IxFcotSS3MANx1C2NvfEAEFeBT99PskpSdt3vthFPUB6Ib/xlllMhYdZeBxZV7GVrQg/E4bD/UVKEYVcDgY+Ez33ezfouSwkN7NCGIksgH88QXAjDDanMbdgqVig/6Uws3+sIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413757; c=relaxed/simple;
	bh=L00RY02PSrV0S+XSzB4RF2tLpb4q4RgYwDnKNeIIz80=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=dzNtcr2O6bv+QGeAa3HaJyaAAiNUiu8mtk6ltIAyr/cYdsmMFn9S2wt2ZOEFMWXYiZ9a1nWN1sftL45yuEhMYFu9g4lhR2gldACIhWeTwrzjpRwuIUsjS1ZQEWYP2UqHHF2DEFiC/o5DcbkxXRqL7Sw4+HQ59PF6wEXp/gzAnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EJDTCw8Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=32E9/FnX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EJDTCw8Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=32E9/FnX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EJDTCw8Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="32E9/FnX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EJDTCw8Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="32E9/FnX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E6785BCEF;
	Fri, 13 Mar 2026 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773413753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gp4EiERhf29hJlvG1iVKK/q3OhBj8ilJLFdKX9dcVlQ=;
	b=EJDTCw8QOkG6l0juJiagoxggProce/gfCmSKGri9NwycrU+4cs6OILkzxVMGcRqsCM1xJk
	o7m//kTTbwGGViUaazInw0PgLEhA9bqgWvmIGZtAm9ueccdxprNdKZw7RsPi1vTzZ68dmn
	j9PaXDa8B8V7TFRI9/2LPQRNk+GVZ2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773413753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gp4EiERhf29hJlvG1iVKK/q3OhBj8ilJLFdKX9dcVlQ=;
	b=32E9/FnX++U0tK9DQooSFB9cUhaNmGeo3LlhRF2+xTouEOsI3SV1GymJTLcpwbqqjiudpv
	pJyxZ4pcx4E/6GDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EJDTCw8Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="32E9/FnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773413753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gp4EiERhf29hJlvG1iVKK/q3OhBj8ilJLFdKX9dcVlQ=;
	b=EJDTCw8QOkG6l0juJiagoxggProce/gfCmSKGri9NwycrU+4cs6OILkzxVMGcRqsCM1xJk
	o7m//kTTbwGGViUaazInw0PgLEhA9bqgWvmIGZtAm9ueccdxprNdKZw7RsPi1vTzZ68dmn
	j9PaXDa8B8V7TFRI9/2LPQRNk+GVZ2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773413753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gp4EiERhf29hJlvG1iVKK/q3OhBj8ilJLFdKX9dcVlQ=;
	b=32E9/FnX++U0tK9DQooSFB9cUhaNmGeo3LlhRF2+xTouEOsI3SV1GymJTLcpwbqqjiudpv
	pJyxZ4pcx4E/6GDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53F76405A2;
	Fri, 13 Mar 2026 14:55:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z9weE3kltGnSXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Mar 2026 14:55:53 +0000
Date: Fri, 13 Mar 2026 15:55:52 +0100
Message-ID: <87cy17bwxz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.0-rc4
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8E6785BCEF

Linus,

please pull sound fixes for v7.0-rc4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc4

The topmost commit is 9250673cf23572b08c51bcdbb2919e9982bfc36b

----------------------------------------------------------------

sound fixes for 7.0-rc4

There have been continuous flux but most of them are device-specific
small fixes, while we see a few core fixes at this time (minor PCM fix
for linked streams and a few ASoC core fixes for delayed work, etc).

Core:
- PCM: Fix use-after-free in linked stream drain

* ASoC:
- core: Fixes for delayed works, empty DMI string handling and DT overlay
- qcom: qdsp6: Fix ADSP stop/start crash via component removal ordering
- tegra: Add support for Tegra238 audio graph card
- amd: Fix missing error checks for clock acquisition
- rt1011: Fix incorrect DAPM context retrieval helper

HD-audio:
- Add quirk for Gigabyte H610M, ASUS UM6702RC, HP 14s-dr5xxx, and
  ThinkPad X390

USB-audio:
- Scarlett2: Fix NULL dereference for malformed endpoint descriptors
- Add quirk for SPACETOUCH

----------------------------------------------------------------

Casey Connolly (1):
      ASoC: detect empty DMI strings

Chen Ni (2):
      ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
      ASoC: amd: acp-mach-common: Add missing error check for clock acquisition

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for SPACETOUCH USB Audio

Liucheng Lu (1):
      ALSA: hda/realtek: add HP Laptop 14s-dr5xxx mute LED quirk

Mehul Rao (1):
      ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()

Peter Ujfalusi (1):
      ASoC: codecs: rt1011: Use component to get the dapm context in spk_mode_put

Ravi Hothi (1):
      ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start

Richard Fitzgerald (1):
      firmware: cs_dsp: Fix fragmentation regression in firmware download

Sen Wang (1):
      ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays

Sheetal (1):
      ASoC: tegra: Add support for Tegra238 soundcard

Takashi Iwai (1):
      ALSA: usb-audio: Check endpoint numbers at parsing Scarlett2 mixer interfaces

Uzair Mughal (1):
      ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390

Zhang Heng (2):
      ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone
      ALSA: hda/realtek: add quirk for ASUS UM6702RC

matteo.cotifava (2):
      ASoC: soc-core: drop delayed_work_pending() check before flush
      ASoC: soc-core: flush delayed work before removing DAIs and widgets

---
 drivers/firmware/cirrus/cs_dsp.c         | 24 ++++++++++++++++++------
 sound/core/pcm_native.c                  | 19 ++++++++++++++++---
 sound/hda/codecs/realtek/alc269.c        |  3 +++
 sound/hda/codecs/realtek/alc662.c        |  9 +++++++++
 sound/soc/amd/acp/acp-mach-common.c      | 18 ++++++++++++++----
 sound/soc/amd/acp3x-rt5682-max9836.c     |  9 +++++++--
 sound/soc/codecs/rt1011.c                |  2 +-
 sound/soc/generic/simple-card-utils.c    | 12 ++++++++----
 sound/soc/qcom/qdsp6/q6apm-dai.c         |  1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c  |  1 +
 sound/soc/qcom/qdsp6/q6apm.c             |  1 +
 sound/soc/soc-core.c                     | 11 ++++++++---
 sound/soc/tegra/tegra_audio_graph_card.c | 11 +++++++++++
 sound/usb/mixer_scarlett2.c              |  2 ++
 sound/usb/quirks.c                       |  2 ++
 15 files changed, 102 insertions(+), 23 deletions(-)

