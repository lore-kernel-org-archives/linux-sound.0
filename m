Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327A3A719C
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256415; cv=none; b=imfNTjga8f1e7680M4d7pC/S/EDdbq3+nOcMxBxk+6JMURtg9p7dIGyKFhzkTWoiYXeZxEjabVuy1x/ZqWhi2yP1tfDAPaKh8bz6mCAeZ85huiWEjhi1/3AJ6mtDPWa67/f+M5DTNsaVM74MEcLjYv+Ggz2ux41Nmf/lGaXI6Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256415; c=relaxed/simple;
	bh=r0yp72qSUgHS581tdMd2OFK3wQ6/CDTbWukE4SLUhXI=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=k8xyCgLLz/JesklLl6eK9SVXR2njfaysh2pgRBeQkViOokAPgMk1VZtXswJYu4ElVT51Nu7sN3pHxY0BtOvBqCDRYVWqIiQwNBWD1vYnOX95Wk6gxQQVee4dF2JRLOj5eBz2cborhsNnjmRIerzqJ4d9WMw+F8fJ0wQeF5LniYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Das36oBk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BsN+Lkqf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Das36oBk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BsN+Lkqf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Das36oBk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BsN+Lkqf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Das36oBk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BsN+Lkqf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48B3A75C3C;
	Fri, 12 Jun 2026 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781256412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=bhvhtaDZioP0pawJ3gOQvHwWUTPyFWt330QayfKBxA8=;
	b=Das36oBkfhuOJ+R7Bp+4OPoSRk0yGZOQn8Arele3T1o0ucasio5zcyyN+3crbmmzTZXBZy
	Ob2ZUS6dN5DruTFq8SuX6BytvkQeNVjcGxtaGRaW3GPvmD3fBPxe6+5RppuKinJnTGlvv3
	6vmSmtBVPBS63VonU4qojilBmuAN8M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781256412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=bhvhtaDZioP0pawJ3gOQvHwWUTPyFWt330QayfKBxA8=;
	b=BsN+Lkqf2SDQPLNlsX7/MQWlQvyz9UIvpUNV1v1NrAHdEECdPhBvXuw0VhUDyQEQuQfZKZ
	CaMMxu4+YQJ3/fCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Das36oBk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BsN+Lkqf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781256412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=bhvhtaDZioP0pawJ3gOQvHwWUTPyFWt330QayfKBxA8=;
	b=Das36oBkfhuOJ+R7Bp+4OPoSRk0yGZOQn8Arele3T1o0ucasio5zcyyN+3crbmmzTZXBZy
	Ob2ZUS6dN5DruTFq8SuX6BytvkQeNVjcGxtaGRaW3GPvmD3fBPxe6+5RppuKinJnTGlvv3
	6vmSmtBVPBS63VonU4qojilBmuAN8M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781256412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=bhvhtaDZioP0pawJ3gOQvHwWUTPyFWt330QayfKBxA8=;
	b=BsN+Lkqf2SDQPLNlsX7/MQWlQvyz9UIvpUNV1v1NrAHdEECdPhBvXuw0VhUDyQEQuQfZKZ
	CaMMxu4+YQJ3/fCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CA1E779A7;
	Fri, 12 Jun 2026 09:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SgStBdzQK2oWfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 09:26:52 +0000
Date: Fri, 12 Jun 2026 11:26:51 +0200
Message-ID: <87cxxwhzxg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-final
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 48B3A75C3C
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Linus,

please pull sound fixes for v7.1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1

The topmost commit is b0d1553d51c3d188baae6d77e6f3dfb415a7b623

----------------------------------------------------------------

sound fixes for 7.1

A few small fixes for the last spurt.  All changes are small, mostly
consisting of driver-specific fixes, along with two UAF fixes for the
ALSA timer core.

* Core:
  - Two UAF fixes in ALSA timer core

* ASoC:
  - SDCA: Fix NULL pointer dereference
  - amd / yc: Add DMI quirk for ASUS ExpertBook PM1403CDA
  - SOF amd: Fix garbage/spurious warnings
  - wm_adsp: Fix potential NULL dereference when removing firmware
    controls
  - loongson: Fix negative position calculation
  - spi-rzv2h-rspi: Fix SPDR read access width on 16-bit RX path

----------------------------------------------------------------

Felix Gu (1):
      spi: rzv2h-rspi: Fix SPDR read access width for 16-bit RX

Kean Ren (1):
      ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions

Li Jun (1):
      ASoC: loongson: Fix invalid position error in ls_pcm_pointer

Richard Fitzgerald (1):
      ASoC: wm_adsp: Fix NULL dereference when removing firmware controls

Takashi Iwai (2):
      ALSA: timer: Forcibly close timer instances at closing
      ALSA: timer: Fix UAF at snd_timer_user_params()

Vijendar Mukunda (2):
      ASoC: SOF: amd: fix for ipc flags check
      ASoC: SOF: amd: set ipc flags to zero

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA

---
 drivers/spi/spi-rzv2h-rspi.c          |  3 ++-
 sound/core/timer.c                    | 17 ++++++++++-------
 sound/soc/amd/yc/acp6x-mach.c         |  7 +++++++
 sound/soc/codecs/wm_adsp.c            |  3 +++
 sound/soc/loongson/loongson_dma.c     | 12 ++++++++++--
 sound/soc/sdca/sdca_function_device.c | 24 +++++++++++++++++++++---
 sound/soc/sof/amd/acp-ipc.c           |  4 ++--
 sound/soc/sof/amd/acp.c               | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h               |  2 ++
 9 files changed, 85 insertions(+), 15 deletions(-)

