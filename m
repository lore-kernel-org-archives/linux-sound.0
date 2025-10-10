Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FDE2153FB
	for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760103776; cv=none; b=sBQyJ7MAwHrWcOYzY0FnFxzeYLQSx0SieV6lSVOPHdGxSvZ36lQ5bGXZren7c5KvkcF5thhCl1cV2diu5wqyhIUBI7EsSKBaCWO9cNEaCAEK0LnxqVVtNluY6qbg+OxAOfXPS53sgKZ+8u8FOSdP8Il4mPhsJ5Pc2TY33KJfkW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760103776; c=relaxed/simple;
	bh=7POQ6g50llIdBKqra8f4cvq0CN8MSC7FzYHXu0Qu9SQ=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=ZRCxlVOTWKL7pmMp4JgZoimQzV88JkK2fhnvNyvX+2r1MJUipI/ptP9UXcR6kq/69P145aeACgiImkpktsR76Ehmp/oaL1ndLkKutA1zYWU2Zm7CpXm/SwkznfolCIBB1EP1wox9973+A0a2GSuRqO7OtqmJ2ty1LXzCxGl7UxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fw1MrOLw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jFTeQ5lL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fw1MrOLw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jFTeQ5lL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fw1MrOLw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jFTeQ5lL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fw1MrOLw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jFTeQ5lL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 611661F399;
	Fri, 10 Oct 2025 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760103772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=7AHQxGj7m7EZh9mK3E3fwIi/wyZ/+SGDFXyBuhwh9Rk=;
	b=fw1MrOLwzvEKXzt5CC0f+E4KSAEMq17aeDKfzO7CWJsqiaXjo+u/Byuon+sABT7KEKH3k1
	k9f60he9mbX4TEsLXBxaNXtBexh9K85fr0DArNH3+HOJC9/Xx1zpz02lSOg7lJmj3w/6TK
	0yCkF0UbH4FGlswKt5X1BHbWmBxD7wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760103772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=7AHQxGj7m7EZh9mK3E3fwIi/wyZ/+SGDFXyBuhwh9Rk=;
	b=jFTeQ5lL6vKGJPorkk8H46pIY9v6WhsG0NRVTgg6O9FZMPZ4an0C3S/AbpksM1anV2X8pO
	V6HDt+mquLZ1oQDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fw1MrOLw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jFTeQ5lL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760103772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=7AHQxGj7m7EZh9mK3E3fwIi/wyZ/+SGDFXyBuhwh9Rk=;
	b=fw1MrOLwzvEKXzt5CC0f+E4KSAEMq17aeDKfzO7CWJsqiaXjo+u/Byuon+sABT7KEKH3k1
	k9f60he9mbX4TEsLXBxaNXtBexh9K85fr0DArNH3+HOJC9/Xx1zpz02lSOg7lJmj3w/6TK
	0yCkF0UbH4FGlswKt5X1BHbWmBxD7wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760103772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=7AHQxGj7m7EZh9mK3E3fwIi/wyZ/+SGDFXyBuhwh9Rk=;
	b=jFTeQ5lL6vKGJPorkk8H46pIY9v6WhsG0NRVTgg6O9FZMPZ4an0C3S/AbpksM1anV2X8pO
	V6HDt+mquLZ1oQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 355951375D;
	Fri, 10 Oct 2025 13:42:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5SOqC1wN6WjHagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Oct 2025 13:42:52 +0000
Date: Fri, 10 Oct 2025 15:42:51 +0200
Message-ID: <87zf9yan50.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.18-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 611661F399
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

Linus,

please pull sound fixes for v6.18-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.18-rc1

The topmost commit is ca7a2317993efa26eb2100a1523548f1b3a07af0

----------------------------------------------------------------

sound fixes for 6.18-rc1

A few more small fixes for 6.18-rc1.
Most of changes are about ASoC Intel and SOF drivers, while a few
other device-specific fixes are found for HD-audio, USB-audio, ASoC
RT722VB and Meson.

----------------------------------------------------------------

Adam Holliday (1):
      ALSA: hda/realtek: Add quirk for ASUS ROG Zephyrus Duo

Bhanu Seshu Kumar Valluri (1):
      ALSA: emu10k1: Fix typo in docs

Kai Vehmanen (3):
      ASoC: SOF: ipc4-pcm: fix delay calculation when DSP resamples
      ASoC: SOF: ipc4-pcm: fix start offset calculation for chain DMA
      ASoC: SOF: ipc4-pcm: do not report invalid delay values

Pedro Demarchi Gomes (1):
      ALSA: usb: fpc: replace kmalloc_array followed by copy_from_user with memdup_array_user

Peter Ujfalusi (5):
      ASoC: SOF: ipc4-topology: Correct the minimum host DMA buffer size
      ASoC: SOF: ipc4-topology: Account for different ChainDMA host buffer size
      ASoC: SOF: Intel: hda-pcm: Place the constraint on period time instead of buffer time
      ASoC: SOF: sof-audio: add dev_dbg_ratelimited wrapper
      ASoC: SOF: Intel: Read the LLP via the associated Link DMA channel

Ranjani Sridharan (1):
      ASoC: SOF: ipc3-topology: Fix multi-core and static pipelines tear down

Shenghao Ding (1):
      ALSA: hda/tas2781: Enable init_profile_id for device initialization

Shuming Fan (1):
      ASoC: rt722: add settings for rt722VB

Steven 'Steve' Kendall (1):
      ALSA: hda/hdmi: Add pin fix for HP ProDesk model

Valerio Setti (1):
      ASoC: meson: aiu-encoder-i2s: fix bit clock polarity

---
 Documentation/sound/cards/emu-mixer.rst        |   2 +-
 sound/hda/codecs/hdmi/hdmi.c                   |   1 +
 sound/hda/codecs/realtek/alc269.c              |  10 +++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  12 +++
 sound/soc/codecs/rt722-sdca-sdw.c              |   2 +-
 sound/soc/codecs/rt722-sdca.c                  |  14 ++++
 sound/soc/codecs/rt722-sdca.h                  |   6 ++
 sound/soc/meson/aiu-encoder-i2s.c              |   9 ++-
 sound/soc/sof/intel/hda-pcm.c                  |  29 +++++--
 sound/soc/sof/intel/hda-stream.c               |  29 ++++++-
 sound/soc/sof/ipc3-topology.c                  |  10 +--
 sound/soc/sof/ipc4-pcm.c                       | 104 +++++++++++++++++++------
 sound/soc/sof/ipc4-topology.c                  |  10 ++-
 sound/soc/sof/ipc4-topology.h                  |   9 ++-
 sound/soc/sof/sof-audio.h                      |   5 ++
 sound/usb/fcp.c                                |   9 +--
 16 files changed, 206 insertions(+), 55 deletions(-)

