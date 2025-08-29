Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DC314A9C
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479194; cv=none; b=Sw+vO6n0EbJeQFOL9LxYM3iXgqgnc1PAyH3risOf+z27dq6aQ8USAKqlsOd6JiC1JYNgeXmEiuSMTNb0yVyQ5RpcU2dQ03ybCxDeEvByjS2bcsYBc/espg841xxim/8WyyT9excO41zoSbJ2wtvPB9Vs/Zr+m8oQndkGvtltCXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479194; c=relaxed/simple;
	bh=rnylBpQJBmpwXzqnnzBQrLSVFfYgzOBoajAMljH8hoc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LY9iLCdSzED6yPVrVk6vh8BZSfi/zySBMZrIHgs9Rl3tBGe2lG4SKJ2scuPTvMBhtdJK5HivDUJ10M0ynRvPoc/xHcIrOPJjVXLC42aYZAc4WmmmxvoDg0G6tTcwTCDGUh7JbThh5cB8WkaTxPusezrNDX7yxj2coePeADHspUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bM1gfSYD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VNAsG67U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bM1gfSYD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VNAsG67U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bM1gfSYD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VNAsG67U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bM1gfSYD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VNAsG67U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC2E722678;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xXG8vSIYRY+Mk9kKdt69BnDm91M6cQCoHJjW+Qp2b60=;
	b=bM1gfSYDMiB/23HNJkyBz2euoc9/LOpVPmDoScdJeumZI2sHTVNVzCyTu2N6GE9HNZyraO
	kVwr7rMGw6Gva6h69CkKdboOcEE9HeE0FDA1MEwsHdujmJDayupveAIDFN9ydXHgd8c37n
	KxH/wia8+nvJeXB4BWIkze9tg3HnyIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xXG8vSIYRY+Mk9kKdt69BnDm91M6cQCoHJjW+Qp2b60=;
	b=VNAsG67UloOuVhLv8Im2HMMZlejRDjtY6onFcziZWxoaecdiKeoXq7E4xt9N+Gjn9GNORQ
	v5WtKWsTg2MXrRAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bM1gfSYD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VNAsG67U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xXG8vSIYRY+Mk9kKdt69BnDm91M6cQCoHJjW+Qp2b60=;
	b=bM1gfSYDMiB/23HNJkyBz2euoc9/LOpVPmDoScdJeumZI2sHTVNVzCyTu2N6GE9HNZyraO
	kVwr7rMGw6Gva6h69CkKdboOcEE9HeE0FDA1MEwsHdujmJDayupveAIDFN9ydXHgd8c37n
	KxH/wia8+nvJeXB4BWIkze9tg3HnyIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xXG8vSIYRY+Mk9kKdt69BnDm91M6cQCoHJjW+Qp2b60=;
	b=VNAsG67UloOuVhLv8Im2HMMZlejRDjtY6onFcziZWxoaecdiKeoXq7E4xt9N+Gjn9GNORQ
	v5WtKWsTg2MXrRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E04813326;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ckw0Ida+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/18] ALSA: Use auto-cleanup macros for ISA drivers
Date: Fri, 29 Aug 2025 16:52:40 +0200
Message-ID: <20250829145300.5460-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AC2E722678
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.01

This is yet another patch set for applying the auto-cleanup macros
to sound/isa/* drivers.  Merely code refactoring and no functional
changes are expected.


Takashi

===

Takashi Iwai (18):
  ALSA: ad1816a: Use guard() for spin locks
  ALSA: cmi8330: Use guard() for spin locks
  ALSA: cs423x: Use guard() for mutex locks
  ALSA: cs423x: Use guard() for spin locks
  ALSA: es1688: Use guard() for spin locks
  ALSA: es18xx: Use guard() for spin locks
  ALSA: gus: Use guard() for mutex locks
  ALSA: gus: Use guard() for spin locks
  ALSA: msnd: Use guard() for spin locks
  ALSA: opl3sa2: Use guard() for spin locks
  ALSA: opti9xx: Use guard() for spin locks
  ALSA: sb: Use guard() for mutex locks
  ALSA: sb: Use guard() for spin locks
  ALSA: emu8000: Use guard() for spin locks
  ALSA: sscape: Use guard() for spin locks
  ALSA: wss: Use guard() for mutex locks
  ALSA: wss: Use guard() for spin locks
  ALSA: wavefront: Use guard() for spin locks

 include/sound/gus.h                   |   1 -
 sound/isa/ad1816a/ad1816a_lib.c       | 117 ++++-------
 sound/isa/cmi8330.c                   |  15 +-
 sound/isa/cs423x/cs4236_lib.c         | 133 +++++-------
 sound/isa/es1688/es1688_lib.c         | 276 ++++++++++++-------------
 sound/isa/es18xx.c                    |  58 ++----
 sound/isa/gus/gus_dma.c               |  88 ++++----
 sound/isa/gus/gus_dram.c              |   8 +-
 sound/isa/gus/gus_io.c                |  65 ++----
 sound/isa/gus/gus_main.c              |  65 +++---
 sound/isa/gus/gus_mem.c               |  33 +--
 sound/isa/gus/gus_mixer.c             |  12 +-
 sound/isa/gus/gus_pcm.c               | 177 ++++++++--------
 sound/isa/gus/gus_reset.c             |  66 ++----
 sound/isa/gus/gus_timer.c             |  16 +-
 sound/isa/gus/gus_uart.c              |  24 +--
 sound/isa/gus/gusextreme.c            |  21 +-
 sound/isa/gus/interwave.c             |  33 ++-
 sound/isa/msnd/msnd.c                 |  29 +--
 sound/isa/msnd/msnd_pinnacle.c        |  11 +-
 sound/isa/msnd/msnd_pinnacle_mixer.c  |   8 +-
 sound/isa/opl3sa2.c                   |  29 +--
 sound/isa/opti9xx/miro.c              |  17 +-
 sound/isa/opti9xx/opti92x-ad1848.c    |  21 +-
 sound/isa/sb/emu8000.c                |  94 ++++-----
 sound/isa/sb/emu8000_pcm.c            |  46 ++---
 sound/isa/sb/sb16.c                   |  11 +-
 sound/isa/sb/sb16_csp.c               | 225 +++++++++-----------
 sound/isa/sb/sb16_main.c              | 123 +++++------
 sound/isa/sb/sb8_main.c               | 168 +++++++--------
 sound/isa/sb/sb8_midi.c               | 121 +++++------
 sound/isa/sb/sb_common.c              |  17 +-
 sound/isa/sb/sb_mixer.c               |  61 ++----
 sound/isa/sscape.c                    | 184 ++++++++---------
 sound/isa/wavefront/wavefront_midi.c  | 129 +++++-------
 sound/isa/wavefront/wavefront_synth.c |  18 +-
 sound/isa/wss/wss_lib.c               | 285 ++++++++++----------------
 37 files changed, 1121 insertions(+), 1684 deletions(-)

-- 
2.50.1

