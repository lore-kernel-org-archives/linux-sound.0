Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048932BC01
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758111213; cv=none; b=BmBVXqzF7BXzWp5lxIQjqfVuShLlRDpLjejvaoNivjGF9qqZNWRSFTkb1A1BzHi9e965rRSF54GS54a5L8R6AM8YxHHtnMM40ENgVkZPvrbdwWSJ3SnLUfZYFNWBOL2skKcNeKwMmsLX9ZbPvIloyxYoXrYKCqj/KaV5cYv///M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758111213; c=relaxed/simple;
	bh=/M3GsDUKICgB/fhkW72LfmmHfT4OpELTNYCapcMCYuY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dW39Tjyry00eb6PR/8PZmkeflKnyDbzBB6ZkhPvljcn4iaPMU+TCcKfYssn8dTyUU2kGXiTJDis03DZdEk4yKVppOcc8p3RtNIec+Er8nfRrN/buPhP/WLXVSECqn79zDFFgnVwb4Xp8Yk4xsRCME7vxrKP9swy7KKDS8Caf6Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rmaSXAKY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VSYWh05V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rmaSXAKY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VSYWh05V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rmaSXAKY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VSYWh05V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rmaSXAKY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VSYWh05V"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B115220AE;
	Wed, 17 Sep 2025 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758111210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6DDMcoL1sA7ycU6pklyfSDukJQS40qYTfxpScv7VaPA=;
	b=rmaSXAKY8ZVFwgRipwgwdpRJ7PRwp1IJ7MzEl+ox7f3exwfYBxsIgOs2Lw7k32wUofN2oM
	Bcwdu0zjotYobvOka7qfMzHrNDXigV/f9PmdmPGgIhAn2xfAyjOMUtOm1z1ywCi6O9+a4G
	mX0rnL5XjPWpsgonh+UNDqaHh0/xSRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758111210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6DDMcoL1sA7ycU6pklyfSDukJQS40qYTfxpScv7VaPA=;
	b=VSYWh05VbZpKMthVUwtYFNdT1V18va/3zOp6Q6yeEwyJbqwzwM1c12S2QV+e3+l/1GrZd6
	67sM0OMha2GG61BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rmaSXAKY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VSYWh05V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758111210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6DDMcoL1sA7ycU6pklyfSDukJQS40qYTfxpScv7VaPA=;
	b=rmaSXAKY8ZVFwgRipwgwdpRJ7PRwp1IJ7MzEl+ox7f3exwfYBxsIgOs2Lw7k32wUofN2oM
	Bcwdu0zjotYobvOka7qfMzHrNDXigV/f9PmdmPGgIhAn2xfAyjOMUtOm1z1ywCi6O9+a4G
	mX0rnL5XjPWpsgonh+UNDqaHh0/xSRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758111210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6DDMcoL1sA7ycU6pklyfSDukJQS40qYTfxpScv7VaPA=;
	b=VSYWh05VbZpKMthVUwtYFNdT1V18va/3zOp6Q6yeEwyJbqwzwM1c12S2QV+e3+l/1GrZd6
	67sM0OMha2GG61BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F7E2137C3;
	Wed, 17 Sep 2025 12:13:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zdgaDuqlymjsWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Sep 2025 12:13:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix KCSAN data-race warning at snd_seq_fifo_poll_wait()
Date: Wed, 17 Sep 2025 14:13:27 +0200
Message-ID: <20250917121328.6783-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 5B115220AE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

snd_seq_fifo_poll_wait() evaluates f->cells without locking after
poll_wait(), and KCSAN doesn't like it as it appears to be a
data-race.  Although this doesn't matter much in practice as the value
is volatile, it's still better to address it for the mind piece.

Wrap it with f->lock spinlock for avoiding the potential data race.

Reported-by: syzbot+c3dbc239259940ededba@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=c3dbc239259940ededba
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_fifo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index f23c6b7ae240..91cce1890111 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -210,6 +210,7 @@ int snd_seq_fifo_poll_wait(struct snd_seq_fifo *f, struct file *file,
 			   poll_table *wait)
 {
 	poll_wait(file, &f->input_sleep, wait);
+	guard(spinlock_irq)(&f->lock);
 	return (f->cells > 0);
 }
 
-- 
2.50.1

