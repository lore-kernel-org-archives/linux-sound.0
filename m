Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391F322545
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480077; cv=none; b=joQmfZJkkDdgEfSb9D4P0p68bnjaxtdKmTnp94rpgRml/+mjfP7VLQJQBYN6aBS6alTUWVq3xG05xyxuLsuVJP7ff+aOapq1YnH+VsBKuDLoDpaHyaM78BbopjCxn2M/AuOrLh9advJQbz7yOXWxM4cKZHVyUPAZdtI0sdWaBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480077; c=relaxed/simple;
	bh=pY3ess6NK+E3sFc8V6LX4HC7NTh92eXPFq12kGNYm7g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIBGmT8tlRpQ1dzTaZP4j/CGxqnZARV1uZTaDh3tmRTe0HpFe+ywk7liQ51oQzIiwanBkd/gVL66YH1FScvZN4IbuIJbeVOm74P/J09l032DGEQX/jy5edMIGGPQ1Ca2n1IMhnrfxx50p/dCQxVT6EjN04ScECDDcsY5Ky3eSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wzh9zlpc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T0ru5qBD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wzh9zlpc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T0ru5qBD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wzh9zlpc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T0ru5qBD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wzh9zlpc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T0ru5qBD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C36F33EF8;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pS/cWG6qbSi9sc6NhDmg4xB5imnRmveX5VtfmeIznKY=;
	b=Wzh9zlpcDqR4Ea4o8nQRWGCOmJfryWBdNkNMm+Vw1Ta2YVUuuPWOZjJI+Nm264mruHqe/o
	Ps35sTkDWSeu1dfyLCUFwb3zOkILh4kZM3iQc/pbbx6i47aeiv+0TcE8347MB5yT+Y8tBf
	hoSFMHbRD6o9evA+dnybkhKL0TWjmUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pS/cWG6qbSi9sc6NhDmg4xB5imnRmveX5VtfmeIznKY=;
	b=T0ru5qBDep4Kh8/8vqY/WIKCyQaZRBlZyL2KWh1qErlWxvsTSatQRtZdhsAEEHd3Ebuk1J
	Ld7AOgeXBwWGWcDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pS/cWG6qbSi9sc6NhDmg4xB5imnRmveX5VtfmeIznKY=;
	b=Wzh9zlpcDqR4Ea4o8nQRWGCOmJfryWBdNkNMm+Vw1Ta2YVUuuPWOZjJI+Nm264mruHqe/o
	Ps35sTkDWSeu1dfyLCUFwb3zOkILh4kZM3iQc/pbbx6i47aeiv+0TcE8347MB5yT+Y8tBf
	hoSFMHbRD6o9evA+dnybkhKL0TWjmUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pS/cWG6qbSi9sc6NhDmg4xB5imnRmveX5VtfmeIznKY=;
	b=T0ru5qBDep4Kh8/8vqY/WIKCyQaZRBlZyL2KWh1qErlWxvsTSatQRtZdhsAEEHd3Ebuk1J
	Ld7AOgeXBwWGWcDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61B0C13ABB;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aFT2FTfCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: caiaq: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:07:17 +0200
Message-ID: <20250829150724.6886-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/audio.c | 39 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 05f964347ed6..95d425dd9d70 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -51,29 +51,24 @@ static void
 activate_substream(struct snd_usb_caiaqdev *cdev,
 	           struct snd_pcm_substream *sub)
 {
-	spin_lock(&cdev->spinlock);
+	guard(spinlock)(&cdev->spinlock);
 
 	if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		cdev->sub_playback[sub->number] = sub;
 	else
 		cdev->sub_capture[sub->number] = sub;
-
-	spin_unlock(&cdev->spinlock);
 }
 
 static void
 deactivate_substream(struct snd_usb_caiaqdev *cdev,
 		     struct snd_pcm_substream *sub)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&cdev->spinlock, flags);
+	guard(spinlock_irqsave)(&cdev->spinlock);
 
 	if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		cdev->sub_playback[sub->number] = NULL;
 	else
 		cdev->sub_capture[sub->number] = NULL;
-
-	spin_unlock_irqrestore(&cdev->spinlock, flags);
 }
 
 static int
@@ -285,25 +280,18 @@ snd_usb_caiaq_pcm_pointer(struct snd_pcm_substream *sub)
 {
 	int index = sub->number;
 	struct snd_usb_caiaqdev *cdev = snd_pcm_substream_chip(sub);
-	snd_pcm_uframes_t ptr;
 
-	spin_lock(&cdev->spinlock);
+	guard(spinlock)(&cdev->spinlock);
 
-	if (cdev->input_panic || cdev->output_panic) {
-		ptr = SNDRV_PCM_POS_XRUN;
-		goto unlock;
-	}
+	if (cdev->input_panic || cdev->output_panic)
+		return SNDRV_PCM_POS_XRUN;
 
 	if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		ptr = bytes_to_frames(sub->runtime,
-					cdev->audio_out_buf_pos[index]);
+		return bytes_to_frames(sub->runtime,
+				       cdev->audio_out_buf_pos[index]);
 	else
-		ptr = bytes_to_frames(sub->runtime,
-					cdev->audio_in_buf_pos[index]);
-
-unlock:
-	spin_unlock(&cdev->spinlock);
-	return ptr;
+		return bytes_to_frames(sub->runtime,
+				       cdev->audio_in_buf_pos[index]);
 }
 
 /* operators for both playback and capture */
@@ -601,7 +589,6 @@ static void read_completed(struct urb *urb)
 	struct device *dev;
 	struct urb *out = NULL;
 	int i, frame, len, send_it = 0, outframe = 0;
-	unsigned long flags;
 	size_t offset = 0;
 
 	if (urb->status || !info)
@@ -638,10 +625,10 @@ static void read_completed(struct urb *urb)
 		offset += len;
 
 		if (len > 0) {
-			spin_lock_irqsave(&cdev->spinlock, flags);
-			fill_out_urb(cdev, out, &out->iso_frame_desc[outframe]);
-			read_in_urb(cdev, urb, &urb->iso_frame_desc[frame]);
-			spin_unlock_irqrestore(&cdev->spinlock, flags);
+			scoped_guard(spinlock_irqsave, &cdev->spinlock) {
+				fill_out_urb(cdev, out, &out->iso_frame_desc[outframe]);
+				read_in_urb(cdev, urb, &urb->iso_frame_desc[frame]);
+			}
 			check_for_elapsed_periods(cdev, cdev->sub_playback);
 			check_for_elapsed_periods(cdev, cdev->sub_capture);
 			send_it = 1;
-- 
2.50.1

