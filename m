Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634A31A556
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502590; cv=none; b=q8bM8FpBV83+TQTw8J29/Lt3cSR39VN9JmU2wKibv8Ndr7yD4JrDdT456WY1ZzMsItBoF1ckQhpHg73Zk/jTCRSaiGYVFLNDq1psxyk1P1GX/3Gh1zuSLfyef6kYCCA4IcuIKZxBaM8dwVvwCkBQrtFHTGpo2ZGumr51belSyew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502590; c=relaxed/simple;
	bh=nn5rnfLtyjC/iUQzMMjFYARzoGt4pDQbhQo+tLUig6M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XufNe+ncHjTAcjLmdoGvlKkqbU3EmVXdH/LonPiwI1b01vWZpttFx+BFoXXLoqdP+/LPSNVKLNRpoiYNtmorFtjDPpnl3+gW/cdPIW3+VheOkVIZGj0wX9a/Juss2S7VXgNzTUSmFwyyEIU7HbNcxSQ8VINUojjF5OZzW6bcT1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M5sVn6IR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y5U+aKvt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M5sVn6IR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y5U+aKvt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M5sVn6IR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y5U+aKvt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M5sVn6IR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y5U+aKvt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F17137830;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNHugkJS4pPD34/UNHmqTtU7iulmQzksM7b5dcGNkvo=;
	b=M5sVn6IRN71d1PAPgHgC0SsSTdDrHsioS9kloJVWS9s02GM+WGkpfBQboWNJkyvHSc7BnB
	A16v/yiHc6Tav3sxU6CfPhbniEUglyk/xZYYXHDAdLw0cyIf3FHAH4s7rFY4NW/wWrD/E5
	Y7RGeWxynj3bGT+TDveMtxL5bVYhya8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNHugkJS4pPD34/UNHmqTtU7iulmQzksM7b5dcGNkvo=;
	b=y5U+aKvtU+7ergqaRFuoQDvwzuKR9tElv3AykIoVqV/f++z19R+9wCvLHoT8zL/rT53yri
	n/Usb2hVvSopvWAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M5sVn6IR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y5U+aKvt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNHugkJS4pPD34/UNHmqTtU7iulmQzksM7b5dcGNkvo=;
	b=M5sVn6IRN71d1PAPgHgC0SsSTdDrHsioS9kloJVWS9s02GM+WGkpfBQboWNJkyvHSc7BnB
	A16v/yiHc6Tav3sxU6CfPhbniEUglyk/xZYYXHDAdLw0cyIf3FHAH4s7rFY4NW/wWrD/E5
	Y7RGeWxynj3bGT+TDveMtxL5bVYhya8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNHugkJS4pPD34/UNHmqTtU7iulmQzksM7b5dcGNkvo=;
	b=y5U+aKvtU+7ergqaRFuoQDvwzuKR9tElv3AykIoVqV/f++z19R+9wCvLHoT8zL/rT53yri
	n/Usb2hVvSopvWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 113C513A54;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KF0OA3lcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/14] ALSA: arm: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:18 +0200
Message-ID: <20250910110932.15234-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910110932.15234-1-tiwai@suse.de>
References: <20250910110932.15234-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2F17137830
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/aaci.c | 148 ++++++++++++++++++++++-------------------------
 1 file changed, 68 insertions(+), 80 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index 881d5b067c23..5548ed8e6b1c 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -210,45 +210,43 @@ static void aaci_fifo_irq(struct aaci *aaci, int channel, u32 mask)
 			return;
 		}
 
-		spin_lock(&aacirun->lock);
+		scoped_guard(spinlock, &aacirun->lock) {
+			ptr = aacirun->ptr;
+			do {
+				unsigned int len = aacirun->fifo_bytes;
+				u32 val;
 
-		ptr = aacirun->ptr;
-		do {
-			unsigned int len = aacirun->fifo_bytes;
-			u32 val;
+				if (aacirun->bytes <= 0) {
+					aacirun->bytes += aacirun->period;
+					period_elapsed = true;
+				}
+				if (!(aacirun->cr & CR_EN))
+					break;
 
-			if (aacirun->bytes <= 0) {
-				aacirun->bytes += aacirun->period;
-				period_elapsed = true;
-			}
-			if (!(aacirun->cr & CR_EN))
-				break;
+				val = readl(aacirun->base + AACI_SR);
+				if (!(val & SR_RXHF))
+					break;
+				if (!(val & SR_RXFF))
+					len >>= 1;
 
-			val = readl(aacirun->base + AACI_SR);
-			if (!(val & SR_RXHF))
-				break;
-			if (!(val & SR_RXFF))
-				len >>= 1;
+				aacirun->bytes -= len;
 
-			aacirun->bytes -= len;
+				/* reading 16 bytes at a time */
+				for( ; len > 0; len -= 16) {
+					asm(
+					    "ldmia	%1, {r0, r1, r2, r3}\n\t"
+					    "stmia	%0!, {r0, r1, r2, r3}"
+					    : "+r" (ptr)
+					    : "r" (aacirun->fifo)
+					    : "r0", "r1", "r2", "r3", "cc");
 
-			/* reading 16 bytes at a time */
-			for( ; len > 0; len -= 16) {
-				asm(
-					"ldmia	%1, {r0, r1, r2, r3}\n\t"
-					"stmia	%0!, {r0, r1, r2, r3}"
-					: "+r" (ptr)
-					: "r" (aacirun->fifo)
-					: "r0", "r1", "r2", "r3", "cc");
+					if (ptr >= aacirun->end)
+						ptr = aacirun->start;
+				}
+			} while(1);
 
-				if (ptr >= aacirun->end)
-					ptr = aacirun->start;
-			}
-		} while(1);
-
-		aacirun->ptr = ptr;
-
-		spin_unlock(&aacirun->lock);
+			aacirun->ptr = ptr;
+		}
 
 		if (period_elapsed)
 			snd_pcm_period_elapsed(aacirun->substream);
@@ -270,45 +268,43 @@ static void aaci_fifo_irq(struct aaci *aaci, int channel, u32 mask)
 			return;
 		}
 
-		spin_lock(&aacirun->lock);
+		scoped_guard(spinlock, &aacirun->lock) {
+			ptr = aacirun->ptr;
+			do {
+				unsigned int len = aacirun->fifo_bytes;
+				u32 val;
 
-		ptr = aacirun->ptr;
-		do {
-			unsigned int len = aacirun->fifo_bytes;
-			u32 val;
+				if (aacirun->bytes <= 0) {
+					aacirun->bytes += aacirun->period;
+					period_elapsed = true;
+				}
+				if (!(aacirun->cr & CR_EN))
+					break;
 
-			if (aacirun->bytes <= 0) {
-				aacirun->bytes += aacirun->period;
-				period_elapsed = true;
-			}
-			if (!(aacirun->cr & CR_EN))
-				break;
+				val = readl(aacirun->base + AACI_SR);
+				if (!(val & SR_TXHE))
+					break;
+				if (!(val & SR_TXFE))
+					len >>= 1;
 
-			val = readl(aacirun->base + AACI_SR);
-			if (!(val & SR_TXHE))
-				break;
-			if (!(val & SR_TXFE))
-				len >>= 1;
+				aacirun->bytes -= len;
 
-			aacirun->bytes -= len;
+				/* writing 16 bytes at a time */
+				for ( ; len > 0; len -= 16) {
+					asm(
+					    "ldmia	%0!, {r0, r1, r2, r3}\n\t"
+					    "stmia	%1, {r0, r1, r2, r3}"
+					    : "+r" (ptr)
+					    : "r" (aacirun->fifo)
+					    : "r0", "r1", "r2", "r3", "cc");
 
-			/* writing 16 bytes at a time */
-			for ( ; len > 0; len -= 16) {
-				asm(
-					"ldmia	%0!, {r0, r1, r2, r3}\n\t"
-					"stmia	%1, {r0, r1, r2, r3}"
-					: "+r" (ptr)
-					: "r" (aacirun->fifo)
-					: "r0", "r1", "r2", "r3", "cc");
+					if (ptr >= aacirun->end)
+						ptr = aacirun->start;
+				}
+			} while (1);
 
-				if (ptr >= aacirun->end)
-					ptr = aacirun->start;
-			}
-		} while (1);
-
-		aacirun->ptr = ptr;
-
-		spin_unlock(&aacirun->lock);
+			aacirun->ptr = ptr;
+		}
 
 		if (period_elapsed)
 			snd_pcm_period_elapsed(aacirun->substream);
@@ -577,10 +573,8 @@ static void aaci_pcm_playback_start(struct aaci_runtime *aacirun)
 static int aaci_pcm_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct aaci_runtime *aacirun = substream->runtime->private_data;
-	unsigned long flags;
-	int ret = 0;
 
-	spin_lock_irqsave(&aacirun->lock, flags);
+	guard(spinlock_irqsave)(&aacirun->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -606,12 +600,10 @@ static int aaci_pcm_playback_trigger(struct snd_pcm_substream *substream, int cm
 		break;
 
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
 
-	spin_unlock_irqrestore(&aacirun->lock, flags);
-
-	return ret;
+	return 0;
 }
 
 static const struct snd_pcm_ops aaci_playback_ops = {
@@ -661,10 +653,8 @@ static void aaci_pcm_capture_start(struct aaci_runtime *aacirun)
 static int aaci_pcm_capture_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct aaci_runtime *aacirun = substream->runtime->private_data;
-	unsigned long flags;
-	int ret = 0;
 
-	spin_lock_irqsave(&aacirun->lock, flags);
+	guard(spinlock_irqsave)(&aacirun->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -690,12 +680,10 @@ static int aaci_pcm_capture_trigger(struct snd_pcm_substream *substream, int cmd
 		break;
 
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
 
-	spin_unlock_irqrestore(&aacirun->lock, flags);
-
-	return ret;
+	return 0;
 }
 
 static int aaci_pcm_capture_prepare(struct snd_pcm_substream *substream)
-- 
2.50.1

