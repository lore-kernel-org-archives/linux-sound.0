Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F852367DF
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908379; cv=none; b=TNkJuHI6Yk2V+Nh2j3fwOUjofTwi1ulSNcpnM2AjWfbgi3sgNCm1a4YhKgO2SVY/FlSprda/V3eIJXlM+SShBhAH0D4YMW9I8tO3P8GnvkEiixT2QiDb+62ZlXDJBDuxZM324AFeFCzMSedgglU/OAUCYHsQkXyC/2Yqswx8rs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908379; c=relaxed/simple;
	bh=UxaVSOnbEGZgKZ5bi43AvAAK7zkRmHztREjOjQBXVKg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sM3SsKMQXyPwNqkvz7MlqT2fzNnLKNsW1sB4hdCOkPKdPghXJyQQFfJ5oCu8vbeghDqlpOaLegTSEywd2yThfOY6duVDElCOo4qZYIJqnfVI4nlkz4o/ElXv/I9q8ZmfP5CWXANgZrswilflpMOpfokTjOcj2pJT6GrVZ+zAuA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JavU+gxJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rbxZYZ3Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V2a09S5E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lxFNupeT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JavU+gxJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rbxZYZ3Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V2a09S5E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lxFNupeT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DAD925BDE7;
	Mon, 11 Aug 2025 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4bMR7kslzgPNA5DjBL2zDodphhtTq6Bi3PPGxmVDc9o=;
	b=JavU+gxJv5e0/NLW2iJaEOgp1CIjTiXgd+s94c5JoxQ+6Dx/ZvjUdxGR9WXlR20A1tHOyp
	U71jZF1j2gmj3K/p+hf5kZFAzjZ6sOaOpIFiZ3J8t/4OI6rBnUIqLIhfATlNdjF+ECNWbX
	fzQ67ZC3bTu+DsuGONt9TQrCmVUyp/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4bMR7kslzgPNA5DjBL2zDodphhtTq6Bi3PPGxmVDc9o=;
	b=rbxZYZ3YDKpScZZ3l3URPFMS4kXc1EvSty5jCfnT9Ku4BTBD5s2HkVFEJqR5xp8NmJVns0
	Kn7AacqWaTlJ8OCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V2a09S5E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lxFNupeT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4bMR7kslzgPNA5DjBL2zDodphhtTq6Bi3PPGxmVDc9o=;
	b=V2a09S5ElRhxatxZfYyidLIIkDrPanYPy2Vh4ElhY8ZMiihgcb3f3jey1HjC2G3kw4As/t
	UGzm3Pm7Pwfaw9odKh3dV4XgM54d2GjMmDfSkPZuEnwnCwjJrjuHOQiGumlC4VnfJ99sqH
	WGwMgew+Ys22hrmrFuF5iWoE5g1kxeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4bMR7kslzgPNA5DjBL2zDodphhtTq6Bi3PPGxmVDc9o=;
	b=lxFNupeTxUVq28kC8duA0o2NfMyB72uwiDkbTUZzSZDxG8epNJXu9y4a+Rg/vx8sy1FVWp
	nzI+oyyyGEeZ52BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C077B13479;
	Mon, 11 Aug 2025 10:32:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UZvILdXGmWjEDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:32:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/11] ALSA: seq: Use auto-cleanup macros
Date: Mon, 11 Aug 2025 12:32:36 +0200
Message-ID: <20250811103249.10644-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DAD925BDE7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

this is a series of changes to ALSA sequencer code for cleaning up
with the auto-cleanup macros.  Only code refactoring, and no behavior
changes intended.


Takashi

===

Takashi Iwai (11):
  ALSA: seq: Simplify internal command operation from OSS layer
  ALSA: seq: Clean up spin lock with guard()
  ALSA: seq: Use guard() for mutex and rwsem locks
  ALSA: seq: Use auto-cleanup for client refcounting
  ALSA: seq: Clean up port locking with auto cleanup
  ALSA: seq: Clean up queue locking with auto cleanup
  ALSA: seq: Clean up fifo locking with guard
  ALSA: seq: oss: Clean up core code with guard()
  ALSA: seq: oss/midi: Cleanup with guard and auto-cleanup
  ALSA: seq: oss/synth: Clean up with guard and auto cleanup
  ALSA: seq: oss/rw: Cleanup with guard

 sound/core/seq/oss/seq_oss.c        |  24 +-
 sound/core/seq/oss/seq_oss_device.h |   7 +-
 sound/core/seq/oss/seq_oss_midi.c   | 125 ++---
 sound/core/seq/oss/seq_oss_readq.c  |  10 +-
 sound/core/seq/oss/seq_oss_synth.c  | 125 ++---
 sound/core/seq/oss/seq_oss_writeq.c |   5 +-
 sound/core/seq/seq_clientmgr.c      | 759 ++++++++++++----------------
 sound/core/seq/seq_clientmgr.h      |  17 +-
 sound/core/seq/seq_fifo.c           |  15 +-
 sound/core/seq/seq_fifo.h           |   1 +
 sound/core/seq/seq_ports.c          |  19 +-
 sound/core/seq/seq_ports.h          |   2 +
 sound/core/seq/seq_queue.c          |  76 +--
 sound/core/seq/seq_queue.h          |   2 +
 sound/core/seq/seq_timer.c          |   5 +-
 15 files changed, 467 insertions(+), 725 deletions(-)

-- 
2.50.1

