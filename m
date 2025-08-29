Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B1322770
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478634; cv=none; b=fjIRf3u+N/UnLKv2bwfn8BZ3xX2Jw2LxZ1LFU8Ew2ftvd8QC+W0ITSjf8ro/e9ly4z11Kcj+ARPWpj+A6ZV64yfL6O/Y2ZTQjKRvi5J9jTdsCVM/G9EHk3CyC9EMBmmiGX9fS7gXFprei6rChjPZORC2SPMQrc9dQ9ANvxEBgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478634; c=relaxed/simple;
	bh=57KEmEYMUqc7BW76OyS1oEmY7g0JR3vYUs5qi8FMnlo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9/Kr0HSvmIL89+2mgIviEfb1O1ubeQCohKiWpKiAlRTieKGrAZkeOC0Q65/zeGm/Y1otbxfLl/ahB0rUttFShsYO9+A8ECLI2Q1izOzAQ1bOZw8bOnhSrKkwt+5OPMTT4nyvPc/E7YeHZoL2sAFea+HhTgjeBlkNEwhXuySr5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2UNfoTP5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zUUwpysp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2UNfoTP5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zUUwpysp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2UNfoTP5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zUUwpysp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2UNfoTP5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zUUwpysp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 346B75C092;
	Fri, 29 Aug 2025 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tzOXcYCnuYmqJ8Q15Px+KnwWmyqswkGEf2hbXSetcc=;
	b=2UNfoTP5Fl7LauVAK9UHW5pwc5K8wua4Rf/DyA6I/88z2GpbWp1+cXvibU2QW+JPJ7ZqK7
	24aR9TuHAhMbKDMLy2bXhnw8KVsene2+kVW7A6abOVttKlhOilwlhnlLviEy86GUWDrhV8
	uvjTM8+b/GjsxfB+vr2ULiZ1NzPOWGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tzOXcYCnuYmqJ8Q15Px+KnwWmyqswkGEf2hbXSetcc=;
	b=zUUwpyspBVWUAZhNjqyHPgueBJugu++zoAL/8EgXWmmbDCOpmkc9aj4/MXbcDT1gelY3YD
	7LwanqDTfCFVoPDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tzOXcYCnuYmqJ8Q15Px+KnwWmyqswkGEf2hbXSetcc=;
	b=2UNfoTP5Fl7LauVAK9UHW5pwc5K8wua4Rf/DyA6I/88z2GpbWp1+cXvibU2QW+JPJ7ZqK7
	24aR9TuHAhMbKDMLy2bXhnw8KVsene2+kVW7A6abOVttKlhOilwlhnlLviEy86GUWDrhV8
	uvjTM8+b/GjsxfB+vr2ULiZ1NzPOWGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tzOXcYCnuYmqJ8Q15Px+KnwWmyqswkGEf2hbXSetcc=;
	b=zUUwpyspBVWUAZhNjqyHPgueBJugu++zoAL/8EgXWmmbDCOpmkc9aj4/MXbcDT1gelY3YD
	7LwanqDTfCFVoPDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD49713A3E;
	Fri, 29 Aug 2025 14:43:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CCHxMKW8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/61] ALSA: ac97: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:37 +0200
Message-ID: <20250829144342.4290-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
 sound/pci/ac97/ac97_pcm.c | 47 ++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index fa14a562fe87..4715d88ff8f4 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -570,33 +570,31 @@ int snd_ac97_pcm_open(struct ac97_pcm *pcm, unsigned int rate,
 					return err;
 			}
 	}
-	spin_lock_irq(&pcm->bus->bus_lock);
-	for (i = 3; i < 12; i++) {
-		if (!(slots & (1 << i)))
-			continue;
-		ok_flag = 0;
-		for (cidx = 0; cidx < 4; cidx++) {
-			if (bus->used_slots[pcm->stream][cidx] & (1 << i)) {
-				spin_unlock_irq(&pcm->bus->bus_lock);
-				err = -EBUSY;
+	scoped_guard(spinlock_irq, &pcm->bus->bus_lock) {
+		for (i = 3; i < 12; i++) {
+			if (!(slots & (1 << i)))
+				continue;
+			ok_flag = 0;
+			for (cidx = 0; cidx < 4; cidx++) {
+				if (bus->used_slots[pcm->stream][cidx] & (1 << i)) {
+					err = -EBUSY;
+					goto error;
+				}
+				if (pcm->r[r].rslots[cidx] & (1 << i)) {
+					bus->used_slots[pcm->stream][cidx] |= (1 << i);
+					ok_flag++;
+				}
+			}
+			if (!ok_flag) {
+				dev_err(bus->card->dev,
+					"cannot find configuration for AC97 slot %i\n",
+					i);
+				err = -EAGAIN;
 				goto error;
 			}
-			if (pcm->r[r].rslots[cidx] & (1 << i)) {
-				bus->used_slots[pcm->stream][cidx] |= (1 << i);
-				ok_flag++;
-			}
-		}
-		if (!ok_flag) {
-			spin_unlock_irq(&pcm->bus->bus_lock);
-			dev_err(bus->card->dev,
-				"cannot find configuration for AC97 slot %i\n",
-				i);
-			err = -EAGAIN;
-			goto error;
 		}
+		pcm->cur_dbl = r;
 	}
-	pcm->cur_dbl = r;
-	spin_unlock_irq(&pcm->bus->bus_lock);
 	for (i = 3; i < 12; i++) {
 		if (!(slots & (1 << i)))
 			continue;
@@ -664,7 +662,7 @@ int snd_ac97_pcm_close(struct ac97_pcm *pcm)
 #endif
 
 	bus = pcm->bus;
-	spin_lock_irq(&pcm->bus->bus_lock);
+	guard(spinlock_irq)(&pcm->bus->bus_lock);
 	for (i = 3; i < 12; i++) {
 		if (!(slots & (1 << i)))
 			continue;
@@ -673,7 +671,6 @@ int snd_ac97_pcm_close(struct ac97_pcm *pcm)
 	}
 	pcm->aslots = 0;
 	pcm->cur_dbl = 0;
-	spin_unlock_irq(&pcm->bus->bus_lock);
 	return 0;
 }
 
-- 
2.50.1

