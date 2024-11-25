Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2ED192B7F
	for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544448; cv=none; b=aACh/ssfC/Q5ZHB2CLLFp2a/BjtlZwlifYAmxYQUAML4ghJzKUgi+iEZGFHwD8pPrLzhtldx26VxRQP/E8mgAL0CsL43k7twCmLiCGSp3ahuCmvAkYpgYRjs+3K1sOjQ+fAD3BipoddVRgylhRE25z9VpLB0bc+MLvzJBpIiisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544448; c=relaxed/simple;
	bh=Z8Z4Tpc5yyO6wdNg1Y8y+6pFPlQEDXb9FfcnoGYM+ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlsa2YC424Og6EKhgV99KHPf/a2dcMRglU2aglCUuY9Da5SszsC+hqNXrD/kaUyZBhZG8swR+1ndp+M4GPgQoTgGoNqk/wBtfMB7ZcAdJs7Se2jICcEcXGz2yFefMsbk4gm+pvClKDFy/7U+pxqVmicmoOcT1UHhC2Hc8jqXc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WWhvsf0D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cDMPLLfI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WWhvsf0D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cDMPLLfI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WWhvsf0D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cDMPLLfI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WWhvsf0D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cDMPLLfI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8ED6621181;
	Mon, 25 Nov 2024 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732544444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TQBI/WxSnms/YYDOMRjcN90T/ApOvQuEokn1JQE2IhM=;
	b=WWhvsf0DGlnNYalAEtkVwBMjfZY6qgtigdOTzy5sE+Z8ezbHVQQ5M6hnlT8Lhn3musDX99
	uxGmWC9f6lrJIhjJ0ETuYBPqRoOwYJNgUN9UGV/bsOHHqVCjymeX1leSXZd7cfD4sFQWud
	QICR/Xfyta8q1upSlcju5M1ySvJVLz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732544444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TQBI/WxSnms/YYDOMRjcN90T/ApOvQuEokn1JQE2IhM=;
	b=cDMPLLfIaLRQ8r2DdIXfD8fT8A6hiYw6ZLBqlTmPHW6S3bHzmPUs8wPmh+SBCGtMRerXQj
	U4ASAn2QV+w+OKCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732544444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TQBI/WxSnms/YYDOMRjcN90T/ApOvQuEokn1JQE2IhM=;
	b=WWhvsf0DGlnNYalAEtkVwBMjfZY6qgtigdOTzy5sE+Z8ezbHVQQ5M6hnlT8Lhn3musDX99
	uxGmWC9f6lrJIhjJ0ETuYBPqRoOwYJNgUN9UGV/bsOHHqVCjymeX1leSXZd7cfD4sFQWud
	QICR/Xfyta8q1upSlcju5M1ySvJVLz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732544444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TQBI/WxSnms/YYDOMRjcN90T/ApOvQuEokn1JQE2IhM=;
	b=cDMPLLfIaLRQ8r2DdIXfD8fT8A6hiYw6ZLBqlTmPHW6S3bHzmPUs8wPmh+SBCGtMRerXQj
	U4ASAn2QV+w+OKCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6782413890;
	Mon, 25 Nov 2024 14:20:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lM70F7yHRGfNRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Nov 2024 14:20:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Eric Dumazet <eric.dumazet@gmail.com>
Subject: [PATCH] ALSA: rawmidi: Fix kvfree() call in spinlock
Date: Mon, 25 Nov 2024 15:20:25 +0100
Message-ID: <20241125142041.16578-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

At the conversion of locking with guard(), I overlooked that kvfree()
must not be called inside the spinlock unlike kfree(), and this was
caught by syzkaller now.

This patch reverts the conversion partially for restoring the kvfree()
call outside the spinlock.  It's not trivial to use guard() in this
context, unfortunately.

Fixes: 84bb065b316e ("ALSA: rawmidi: Use guard() for locking")
Reported-by: syzbot+351f8764833934c68836@syzkaller.appspotmail.com
Reported-by: Eric Dumazet <eric.dumazet@gmail.com>
Closes: https://lore.kernel.org/6744737b.050a0220.1cc393.007e.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 03306be5fa02..348ce1b7725e 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -724,8 +724,9 @@ static int resize_runtime_buffer(struct snd_rawmidi_substream *substream,
 		newbuf = kvzalloc(params->buffer_size, GFP_KERNEL);
 		if (!newbuf)
 			return -ENOMEM;
-		guard(spinlock_irq)(&substream->lock);
+		spin_lock_irq(&substream->lock);
 		if (runtime->buffer_ref) {
+			spin_unlock_irq(&substream->lock);
 			kvfree(newbuf);
 			return -EBUSY;
 		}
@@ -733,6 +734,7 @@ static int resize_runtime_buffer(struct snd_rawmidi_substream *substream,
 		runtime->buffer = newbuf;
 		runtime->buffer_size = params->buffer_size;
 		__reset_runtime_ptrs(runtime, is_input);
+		spin_unlock_irq(&substream->lock);
 		kvfree(oldbuf);
 	}
 	runtime->avail_min = params->avail_min;
-- 
2.43.0

