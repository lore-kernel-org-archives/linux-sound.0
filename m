Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C72322C6B
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421836; cv=none; b=eoMtDAO8ZxxooMR76cbU0NSo6e6RtyL4MTxPNb5D5g3SthpLYZr+xQgvdEOiLuqj2RGwXjmp5qLBlbfYUn6hLLqNFs4nXmv8e1T02OsiF25AVPVhm21GUJ1I+L7oLq8DtAX/QN7tMVdte9F0U0gD5oKvKoSl1nfwmxN+LIGpL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421836; c=relaxed/simple;
	bh=jujhy7fI53R76/Xp4CrKZAErlM9uE9gwwubr5rYUgYk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXbw9Fd+c5lLdLQB8oQjU1MIFWQjDhpeVp2bW4fLy8i8HH2wvSCWnQQ/5EtiucC+udWg8TFV045sND0qRezIIKWz/sEdPQcuHsWf0tFJ+gDbsxOWuR/WkM+Pw7h7tW1sz+OkDdQzFRvGitdSGCrBsQlSg9REHSEwDMG/sbiTUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=akSLJgGr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xKvRC+dq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=akSLJgGr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xKvRC+dq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="akSLJgGr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xKvRC+dq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="akSLJgGr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xKvRC+dq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B3F233B7E;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhLcstwSmyFmeCqY9F2xrkDi9BXch9q8J2DrwWK3xl4=;
	b=akSLJgGr5ev4B78l6C3qQph5FQqvz4GZw3+5z0z8zyvFkVMOvRU68JWV4s3xJbiq1hFxgs
	wodfLeC//De2H50EFmZI7jTTblYLIhkh9Mp3TDZP9ghSWXLcheg7X93+u1X06TP5V18BB7
	TW/2V3+UQYPvF1u8V9gRXBD2/O4y3D4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhLcstwSmyFmeCqY9F2xrkDi9BXch9q8J2DrwWK3xl4=;
	b=xKvRC+dqm5v3sbYxHw1LTGUyboqUG/qei/2lqDhuT3gpAVwixEgJxyysCrQnlfePCFBZMD
	K99KelMRQBNr+PAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhLcstwSmyFmeCqY9F2xrkDi9BXch9q8J2DrwWK3xl4=;
	b=akSLJgGr5ev4B78l6C3qQph5FQqvz4GZw3+5z0z8zyvFkVMOvRU68JWV4s3xJbiq1hFxgs
	wodfLeC//De2H50EFmZI7jTTblYLIhkh9Mp3TDZP9ghSWXLcheg7X93+u1X06TP5V18BB7
	TW/2V3+UQYPvF1u8V9gRXBD2/O4y3D4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhLcstwSmyFmeCqY9F2xrkDi9BXch9q8J2DrwWK3xl4=;
	b=xKvRC+dqm5v3sbYxHw1LTGUyboqUG/qei/2lqDhuT3gpAVwixEgJxyysCrQnlfePCFBZMD
	K99KelMRQBNr+PAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F12313ABF;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPpiIvYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/14] ALSA: parisc: Use guard() for spin locks
Date: Tue,  9 Sep 2025 14:43:26 +0200
Message-ID: <20250909124331.10670-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909124331.10670-1-tiwai@suse.de>
References: <20250909124331.10670-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/parisc/harmony.c | 99 +++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 60 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index 76dd2210f9ea..4b5a54da25fb 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -140,32 +140,25 @@ harmony_enable_interrupts(struct snd_harmony *h)
 static void
 harmony_mute(struct snd_harmony *h)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&h->mixer_lock, flags);
+	guard(spinlock_irqsave)(&h->mixer_lock);
 	harmony_wait_for_control(h);
 	harmony_write(h, HARMONY_GAINCTL, HARMONY_GAIN_SILENCE);
-	spin_unlock_irqrestore(&h->mixer_lock, flags);
 }
 
 static void
 harmony_unmute(struct snd_harmony *h)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&h->mixer_lock, flags);
+	guard(spinlock_irqsave)(&h->mixer_lock);
 	harmony_wait_for_control(h);
 	harmony_write(h, HARMONY_GAINCTL, h->st.gain);
-	spin_unlock_irqrestore(&h->mixer_lock, flags);
 }
 
 static void
 harmony_set_control(struct snd_harmony *h)
 {
 	u32 ctrl;
-	unsigned long flags;
 
-	spin_lock_irqsave(&h->lock, flags);
+	guard(spinlock_irqsave)(&h->lock);
 
 	ctrl = (HARMONY_CNTL_C      |
 		(h->st.format << 6) |
@@ -174,8 +167,6 @@ harmony_set_control(struct snd_harmony *h)
 
 	harmony_wait_for_control(h);
 	harmony_write(h, HARMONY_CNTL, ctrl);
-
-	spin_unlock_irqrestore(&h->lock, flags);
 }
 
 static irqreturn_t
@@ -184,53 +175,53 @@ snd_harmony_interrupt(int irq, void *dev)
 	u32 dstatus;
 	struct snd_harmony *h = dev;
 
-	spin_lock(&h->lock);
-	harmony_disable_interrupts(h);
-	harmony_wait_for_control(h);
-	dstatus = harmony_read(h, HARMONY_DSTATUS);
-	spin_unlock(&h->lock);
+	scoped_guard(spinlock, &h->lock) {
+		harmony_disable_interrupts(h);
+		harmony_wait_for_control(h);
+		dstatus = harmony_read(h, HARMONY_DSTATUS);
+	}
 
 	if (dstatus & HARMONY_DSTATUS_PN) {
 		if (h->psubs && h->st.playing) {
-			spin_lock(&h->lock);
-			h->pbuf.buf += h->pbuf.count; /* PAGE_SIZE */
-			h->pbuf.buf %= h->pbuf.size; /* MAX_BUFS*PAGE_SIZE */
+			scoped_guard(spinlock, &h->lock) {
+				h->pbuf.buf += h->pbuf.count; /* PAGE_SIZE */
+				h->pbuf.buf %= h->pbuf.size; /* MAX_BUFS*PAGE_SIZE */
 
-			harmony_write(h, HARMONY_PNXTADD, 
-				      h->pbuf.addr + h->pbuf.buf);
-			h->stats.play_intr++;
-			spin_unlock(&h->lock);
+				harmony_write(h, HARMONY_PNXTADD,
+					      h->pbuf.addr + h->pbuf.buf);
+				h->stats.play_intr++;
+			}
                         snd_pcm_period_elapsed(h->psubs);
 		} else {
-			spin_lock(&h->lock);
-			harmony_write(h, HARMONY_PNXTADD, h->sdma.addr);
-			h->stats.silence_intr++;
-			spin_unlock(&h->lock);
+			scoped_guard(spinlock, &h->lock) {
+				harmony_write(h, HARMONY_PNXTADD, h->sdma.addr);
+				h->stats.silence_intr++;
+			}
 		}
 	}
 
 	if (dstatus & HARMONY_DSTATUS_RN) {
 		if (h->csubs && h->st.capturing) {
-			spin_lock(&h->lock);
-			h->cbuf.buf += h->cbuf.count;
-			h->cbuf.buf %= h->cbuf.size;
+			scoped_guard(spinlock, &h->lock) {
+				h->cbuf.buf += h->cbuf.count;
+				h->cbuf.buf %= h->cbuf.size;
 
-			harmony_write(h, HARMONY_RNXTADD,
-				      h->cbuf.addr + h->cbuf.buf);
-			h->stats.rec_intr++;
-			spin_unlock(&h->lock);
+				harmony_write(h, HARMONY_RNXTADD,
+					      h->cbuf.addr + h->cbuf.buf);
+				h->stats.rec_intr++;
+			}
                         snd_pcm_period_elapsed(h->csubs);
 		} else {
-			spin_lock(&h->lock);
-			harmony_write(h, HARMONY_RNXTADD, h->gdma.addr);
-			h->stats.graveyard_intr++;
-			spin_unlock(&h->lock);
+			scoped_guard(spinlock, &h->lock) {
+				harmony_write(h, HARMONY_RNXTADD, h->gdma.addr);
+				h->stats.graveyard_intr++;
+			}
 		}
 	}
 
-	spin_lock(&h->lock);
-	harmony_enable_interrupts(h);
-	spin_unlock(&h->lock);
+	scoped_guard(spinlock, &h->lock) {
+		harmony_enable_interrupts(h);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -297,7 +288,7 @@ snd_harmony_playback_trigger(struct snd_pcm_substream *ss, int cmd)
 	if (h->st.capturing)
 		return -EBUSY;
 
-	spin_lock(&h->lock);
+	guard(spinlock)(&h->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		h->st.playing = 1;
@@ -316,11 +307,9 @@ snd_harmony_playback_trigger(struct snd_pcm_substream *ss, int cmd)
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	default:
-		spin_unlock(&h->lock);
 		snd_BUG();
 		return -EINVAL;
 	}
-	spin_unlock(&h->lock);
 	
 	return 0;
 }
@@ -333,7 +322,7 @@ snd_harmony_capture_trigger(struct snd_pcm_substream *ss, int cmd)
 	if (h->st.playing)
 		return -EBUSY;
 
-	spin_lock(&h->lock);
+	guard(spinlock)(&h->lock);
         switch (cmd) {
         case SNDRV_PCM_TRIGGER_START:
 		h->st.capturing = 1;
@@ -352,11 +341,9 @@ snd_harmony_capture_trigger(struct snd_pcm_substream *ss, int cmd)
         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
         case SNDRV_PCM_TRIGGER_SUSPEND:
 	default:
-		spin_unlock(&h->lock);
 		snd_BUG();
                 return -EINVAL;
         }
-	spin_unlock(&h->lock);
 		
         return 0;
 }
@@ -674,7 +661,7 @@ snd_harmony_volume_get(struct snd_kcontrol *kc,
 	int invert = (kc->private_value >> 24) & 0xff;
 	int left, right;
 	
-	spin_lock_irq(&h->mixer_lock);
+	guard(spinlock_irq)(&h->mixer_lock);
 
 	left = (h->st.gain >> shift_left) & mask;
 	right = (h->st.gain >> shift_right) & mask;
@@ -687,8 +674,6 @@ snd_harmony_volume_get(struct snd_kcontrol *kc,
 	if (shift_left != shift_right)
 		ucontrol->value.integer.value[1] = right;
 
-	spin_unlock_irq(&h->mixer_lock);
-
 	return 0;
 }  
 
@@ -704,7 +689,7 @@ snd_harmony_volume_put(struct snd_kcontrol *kc,
 	int left, right;
 	int old_gain = h->st.gain;
 	
-	spin_lock_irq(&h->mixer_lock);
+	guard(spinlock_irq)(&h->mixer_lock);
 
 	left = ucontrol->value.integer.value[0] & mask;
 	if (invert)
@@ -722,8 +707,6 @@ snd_harmony_volume_put(struct snd_kcontrol *kc,
 
 	snd_harmony_set_new_gain(h);
 
-	spin_unlock_irq(&h->mixer_lock);
-	
 	return h->st.gain != old_gain;
 }
 
@@ -743,13 +726,11 @@ snd_harmony_captureroute_get(struct snd_kcontrol *kc,
 	struct snd_harmony *h = snd_kcontrol_chip(kc);
 	int value;
 	
-	spin_lock_irq(&h->mixer_lock);
+	guard(spinlock_irq)(&h->mixer_lock);
 
 	value = (h->st.gain >> HARMONY_GAIN_IS_SHIFT) & 1;
 	ucontrol->value.enumerated.item[0] = value;
 
-	spin_unlock_irq(&h->mixer_lock);
-
 	return 0;
 }  
 
@@ -761,7 +742,7 @@ snd_harmony_captureroute_put(struct snd_kcontrol *kc,
 	int value;
 	int old_gain = h->st.gain;
 	
-	spin_lock_irq(&h->mixer_lock);
+	guard(spinlock_irq)(&h->mixer_lock);
 
 	value = ucontrol->value.enumerated.item[0] & 1;
 	h->st.gain &= ~HARMONY_GAIN_IS_MASK;
@@ -769,8 +750,6 @@ snd_harmony_captureroute_put(struct snd_kcontrol *kc,
 
 	snd_harmony_set_new_gain(h);
 
-	spin_unlock_irq(&h->mixer_lock);
-	
 	return h->st.gain != old_gain;
 }
 
-- 
2.50.1

