Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6F2F3635
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281932; cv=none; b=Rvat9fH3mSRxLDjd6vcIHrd8DF/Ikp0I2iPYjN+oPrYLkWQMJpM3C8qUlz90gD6n/OG98hXQuj5ujpuN9KtryzuKrq3YeGVJlPNqhYWYDuh3KcpZ6ADrM9ix+2jrS3gwVtqbWk84azJHDISxaqOz1rDc7oE4blI7oCMpo4agRBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281932; c=relaxed/simple;
	bh=dB9w3COgv+UEHqpbZNbzOsh0vGvMg2+ezCgEvYZ4zvc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=D4DmMoQW0jjTpQjhBzgf58OkkSnbuh+Mbu/NoLWjbCuQEVWunRbzBUD/0hA/GShvXPowpFanCeTlsoakku9j28HOQAThajpmYfHe1Qgz5IvzngqXM3s51vPlMe22XxAx4BSp3fHF56jAddlKZYQ7XhMFuMY6ZS7Xjtsv6R9RzG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qhV8MrkV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTDVg/2z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qhV8MrkV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTDVg/2z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qhV8MrkV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTDVg/2z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qhV8MrkV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTDVg/2z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 412A01FEDF;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z5BHKqGJ9wKMTaNTjHdsIcQpPeo1aN+qZbiFP6J+deg=;
	b=qhV8MrkVkNYytD5nhNUwrRf4DmZef4tIjsGt6j3fbUbAgyhtxKXKyUCG2BapqBXUL3k022
	eDJBfYpQijPuQkEgV4yvIrA4ClJU4a5djzSYF9cMs2ljKBAnKleXLLa2/UCobACY6LiU4L
	C+BqBEVMp6iKXhRYR5a6OhjoAdXq0WQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z5BHKqGJ9wKMTaNTjHdsIcQpPeo1aN+qZbiFP6J+deg=;
	b=hTDVg/2zSn2cjzZ2HOFvT9PLr2izaZlVMNlIgM6t+L1BUZJnEN2YTwlueajyyWlQ8uEVqW
	KXFvqzdXIzqI0vBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qhV8MrkV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="hTDVg/2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z5BHKqGJ9wKMTaNTjHdsIcQpPeo1aN+qZbiFP6J+deg=;
	b=qhV8MrkVkNYytD5nhNUwrRf4DmZef4tIjsGt6j3fbUbAgyhtxKXKyUCG2BapqBXUL3k022
	eDJBfYpQijPuQkEgV4yvIrA4ClJU4a5djzSYF9cMs2ljKBAnKleXLLa2/UCobACY6LiU4L
	C+BqBEVMp6iKXhRYR5a6OhjoAdXq0WQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z5BHKqGJ9wKMTaNTjHdsIcQpPeo1aN+qZbiFP6J+deg=;
	b=hTDVg/2zSn2cjzZ2HOFvT9PLr2izaZlVMNlIgM6t+L1BUZJnEN2YTwlueajyyWlQ8uEVqW
	KXFvqzdXIzqI0vBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2783C13310;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4bllCEO8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/11] ALSA: seq: Use auto-cleanup macros
Date: Wed, 27 Aug 2025 10:05:06 +0200
Message-ID: <20250827080520.7544-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 412A01FEDF
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
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.01

This is a revised patch set for ALSA sequencer code to clean up with
the auto-cleanup macros like guard() and CLASS().
Only code refactoring, and no behavior changes intended.

v1->v2:
* Drop buggy conversion in oss/seq_oss_midi.c
* Fix build errors with clang W=1


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
 sound/core/seq/oss/seq_oss_midi.c   | 116 ++---
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
 15 files changed, 463 insertions(+), 720 deletions(-)

-- 
2.50.1

