Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A49713DB8F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710614; cv=none; b=JsGIokzZTunCNok1p74hZmBj1GdhSMeSPlvYzS+IV3vZrNMe0ft31tSsZDYVhkbfoL04ZkWWU5G0/7BBxppy1mfzrtKUm0OwM2RMaZGtAPOnmD6DjbLUpWvz8qUwe5GyJkdhDIr5bZxaUWOpkA3DUZ661pLFRecx5kudenH2Uuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710614; c=relaxed/simple;
	bh=BpSlOZ535YwwQi1/ndKBN/Yf8jmFdwK4rIjefcWkCsw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OIqZsLkkmhp31Xru/OVB+VgkwpWMm593CeQHr350cfZ+fXU8lglo1i150avX22TMIKAMjvTZRAjwSLJ5WREJf77MbbHB5aCKGDtDiVf6D4dZ6/RIaZ/WvoQr0GjZDz5SYy3TiUPz+HH0Wh1l+aVZ5L+7JbzuuXPCxW6fWkGtsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vwiaLcc3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MpY/Ho1U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vwiaLcc3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MpY/Ho1U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vwiaLcc3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MpY/Ho1U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vwiaLcc3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MpY/Ho1U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC2D02214A;
	Fri, 23 Feb 2024 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=vwiaLcc3edHFO3mwjm6IKUh/ORWrXv0x8CTXo3/Bpdb7QpILh4WwwYSzMx8oI4IIOd6ESE
	4eiuwYfoyU9KPix/lBYMJ/Py24qcH3dgf43gdcw9LaQirtw6DXQKYic0vacnJyklgVWbw1
	4LKOemszqeDZlNAG9FufB+XVWDHeUbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=MpY/Ho1Upp7s7XmGQtFf0GjotDEtGvyr0pvVshi5ASTAQnGVBod0eYaGjea0xkI9ALI6Jr
	Dl+eCuJmWvu7tMBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=vwiaLcc3edHFO3mwjm6IKUh/ORWrXv0x8CTXo3/Bpdb7QpILh4WwwYSzMx8oI4IIOd6ESE
	4eiuwYfoyU9KPix/lBYMJ/Py24qcH3dgf43gdcw9LaQirtw6DXQKYic0vacnJyklgVWbw1
	4LKOemszqeDZlNAG9FufB+XVWDHeUbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bRc6mbFpX76JpER1AM+3rwWySo1dyIymwDJTRX+Amc=;
	b=MpY/Ho1Upp7s7XmGQtFf0GjotDEtGvyr0pvVshi5ASTAQnGVBod0eYaGjea0xkI9ALI6Jr
	Dl+eCuJmWvu7tMBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9219913AC1;
	Fri, 23 Feb 2024 17:50:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2E0wItLa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 01/24] ALSA: ump: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:38 +0100
Message-Id: <20240223175001.24375-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[24.36%]
X-Spam-Level: ****
X-Spam-Score: 4.90
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

