Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6C56470
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023997; cv=none; b=HQ4H9H5M+BOu20990fs+knNMLjVHR6pdR5IQ4RAKp8u//CHyywULNjjBGrZg1qNGpR3m3PA21+/FknaQRco49XiE+ZVPAMfXwtWOzwgaVOLak78qZoz0ZJ7FVKC2y5L0Rf8Y0Fj0FZt9NMUNQ6SIJRVeqaj6GcD8OHYXVSXa9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023997; c=relaxed/simple;
	bh=BpSlOZ535YwwQi1/ndKBN/Yf8jmFdwK4rIjefcWkCsw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iL9aS3gyab9bmo341bXXceuaqx+vm4z2vtC5+zeJ+5fkmUPJBijgJhtIwXwr+/9jlGAMVKdF9KYq1nGb9Bcmb2uGZHF6hikk6DceWIeq2pgv0remTyyXfumZxsmKaeufa3mrnXb96K7S9dJUnDtNmL4WdeMO3zzEoR2PicKuBSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TdwFqOOd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Yx2Tbi6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TdwFqOOd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Yx2Tbi6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TdwFqOOd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Yx2Tbi6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TdwFqOOd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Yx2Tbi6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58EF71FB94;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=TdwFqOOdSqrMXoxK1OJY699DSzUbBBrVSgclF2FjuPhmCq00IpeTfIRnvgMufz6uwV0IUK
	Y/AvXtD7BmF4UUcqd8xG+9cN3B/zQ0UtomJZM8gSw804GR9+VqhQUian9Gzc5Tem7GYhz2
	+XFnz9O3DC893vk1SxycerNaSiK8xMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=8Yx2Tbi6IIpZG3HnoEoejp3eEBQ1JwdVsG5cJ1cgm4xtqd/f/BlSQpaL4dHthujADGbkOh
	8vFWPP7o9hEE5kDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=TdwFqOOdSqrMXoxK1OJY699DSzUbBBrVSgclF2FjuPhmCq00IpeTfIRnvgMufz6uwV0IUK
	Y/AvXtD7BmF4UUcqd8xG+9cN3B/zQ0UtomJZM8gSw804GR9+VqhQUian9Gzc5Tem7GYhz2
	+XFnz9O3DC893vk1SxycerNaSiK8xMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=8Yx2Tbi6IIpZG3HnoEoejp3eEBQ1JwdVsG5cJ1cgm4xtqd/f/BlSQpaL4dHthujADGbkOh
	8vFWPP7o9hEE5kDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DE9613AD7;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QBDtDfqi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 01/24] ALSA: ump: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:43 +0100
Message-Id: <20240227085306.9764-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ******
X-Spam-Score: 6.50
X-Spamd-Result: default: False [6.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 NEURAL_SPAM_SHORT(2.60)[0.868];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[24.79%]
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index fe7911498cc4..fd6a68a54278 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -985,13 +985,11 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 	struct snd_ump_endpoint *ump = substream->rmidi->private_data;
 	int dir = substream->stream;
 	int group = ump->legacy_mapping[substream->number];
-	int err = 0;
+	int err;
 
-	mutex_lock(&ump->open_mutex);
-	if (ump->legacy_substreams[dir][group]) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	guard(mutex)(&ump->open_mutex);
+	if (ump->legacy_substreams[dir][group])
+		return -EBUSY;
 	if (dir == SNDRV_RAWMIDI_STREAM_OUTPUT) {
 		if (!ump->legacy_out_opens) {
 			err = snd_rawmidi_kernel_open(&ump->core, 0,
@@ -999,17 +997,14 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 						      SNDRV_RAWMIDI_LFLG_APPEND,
 						      &ump->legacy_out_rfile);
 			if (err < 0)
-				goto unlock;
+				return err;
 		}
 		ump->legacy_out_opens++;
 		snd_ump_convert_reset(&ump->out_cvts[group]);
 	}
-	spin_lock_irq(&ump->legacy_locks[dir]);
+	guard(spinlock_irq)(&ump->legacy_locks[dir]);
 	ump->legacy_substreams[dir][group] = substream;
-	spin_unlock_irq(&ump->legacy_locks[dir]);
- unlock:
-	mutex_unlock(&ump->open_mutex);
-	return err;
+	return 0;
 }
 
 static int snd_ump_legacy_close(struct snd_rawmidi_substream *substream)
@@ -1018,15 +1013,13 @@ static int snd_ump_legacy_close(struct snd_rawmidi_substream *substream)
 	int dir = substream->stream;
 	int group = ump->legacy_mapping[substream->number];
 
-	mutex_lock(&ump->open_mutex);
-	spin_lock_irq(&ump->legacy_locks[dir]);
-	ump->legacy_substreams[dir][group] = NULL;
-	spin_unlock_irq(&ump->legacy_locks[dir]);
+	guard(mutex)(&ump->open_mutex);
+	scoped_guard(spinlock_irq, &ump->legacy_locks[dir])
+		ump->legacy_substreams[dir][group] = NULL;
 	if (dir == SNDRV_RAWMIDI_STREAM_OUTPUT) {
 		if (!--ump->legacy_out_opens)
 			snd_rawmidi_kernel_release(&ump->legacy_out_rfile);
 	}
-	mutex_unlock(&ump->open_mutex);
 	return 0;
 }
 
@@ -1078,12 +1071,11 @@ static int process_legacy_output(struct snd_ump_endpoint *ump,
 	const int dir = SNDRV_RAWMIDI_STREAM_OUTPUT;
 	unsigned char c;
 	int group, size = 0;
-	unsigned long flags;
 
 	if (!ump->out_cvts || !ump->legacy_out_opens)
 		return 0;
 
-	spin_lock_irqsave(&ump->legacy_locks[dir], flags);
+	guard(spinlock_irqsave)(&ump->legacy_locks[dir]);
 	for (group = 0; group < SNDRV_UMP_MAX_GROUPS; group++) {
 		substream = ump->legacy_substreams[dir][group];
 		if (!substream)
@@ -1099,7 +1091,6 @@ static int process_legacy_output(struct snd_ump_endpoint *ump,
 			break;
 		}
 	}
-	spin_unlock_irqrestore(&ump->legacy_locks[dir], flags);
 	return size;
 }
 
@@ -1109,18 +1100,16 @@ static void process_legacy_input(struct snd_ump_endpoint *ump, const u32 *src,
 	struct snd_rawmidi_substream *substream;
 	unsigned char buf[16];
 	unsigned char group;
-	unsigned long flags;
 	const int dir = SNDRV_RAWMIDI_STREAM_INPUT;
 	int size;
 
 	size = snd_ump_convert_from_ump(src, buf, &group);
 	if (size <= 0)
 		return;
-	spin_lock_irqsave(&ump->legacy_locks[dir], flags);
+	guard(spinlock_irqsave)(&ump->legacy_locks[dir]);
 	substream = ump->legacy_substreams[dir][group];
 	if (substream)
 		snd_rawmidi_receive(substream, buf, size);
-	spin_unlock_irqrestore(&ump->legacy_locks[dir], flags);
 }
 
 /* Fill ump->legacy_mapping[] for groups to be used for legacy rawmidi */
-- 
2.35.3

