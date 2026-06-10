Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AE426D2E
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106351; cv=none; b=ckL8rtzjRqiFxUu55XN8JyCUw8GmcmbptalFv+vP6EV2Ua6hCLgDDmZwfC8NTVtLuf2wHMKMCRtunKhfXgfmDNHG9TXi6oS8qltAv72grt6MKTniT/djL4W8E31/oCoZIW9PXTINhT/nCvGrW2CXVqCXLLEZLT9Xm6B3CUI7UHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106351; c=relaxed/simple;
	bh=9hq4dxhCz+vTgv6bb0YYNZ5Y9A0DNSGCm9xuo9b1Nno=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nt2WRNzr78L16Mrw8MpmLNGr4QBCfHiSOQ1U66f/OLfUz/Ev+WUCdxc80wiJqf0HWOIVoDNxDpsu8dOSh2VFLngn5SPhXJijWk+pe4IRmdeXvsbdtgJRyI3RLSTlEm4bXeeWRVQ3YEaUFgla3PaYY0t3gINbEcG9gsiyDSGWk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pDSRg3l2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wB2LoRs3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pDSRg3l2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wB2LoRs3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pDSRg3l2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wB2LoRs3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pDSRg3l2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wB2LoRs3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A92C06AF4B;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGwBp1fBxssZ/XBVgq3vmxXGo+wSy+sotojtAiu8E1w=;
	b=pDSRg3l2Imrnuw2G9r61ik4/Qv3KgO2CWdm8nM47WhlGjBiJHjzjGglBBq2bujaIjYXvRd
	UvrPR5Ep8PvjQpDWMdrBG1f9pHCQVA93aY7TVN4MVLEV90IVPASI/4xhkeisIrNoIPrYSH
	YVvfgZ8uwDkVcmkAF4WE0GzgO7xlOgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGwBp1fBxssZ/XBVgq3vmxXGo+wSy+sotojtAiu8E1w=;
	b=wB2LoRs3pqVA67tM6SMI2LDBH04lDx+V9xc9jYxnqZQcqqiSNZoAgvKE/fgBBhmJ0pk0ou
	dtBlG/zLPjO0dNAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pDSRg3l2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wB2LoRs3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGwBp1fBxssZ/XBVgq3vmxXGo+wSy+sotojtAiu8E1w=;
	b=pDSRg3l2Imrnuw2G9r61ik4/Qv3KgO2CWdm8nM47WhlGjBiJHjzjGglBBq2bujaIjYXvRd
	UvrPR5Ep8PvjQpDWMdrBG1f9pHCQVA93aY7TVN4MVLEV90IVPASI/4xhkeisIrNoIPrYSH
	YVvfgZ8uwDkVcmkAF4WE0GzgO7xlOgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGwBp1fBxssZ/XBVgq3vmxXGo+wSy+sotojtAiu8E1w=;
	b=wB2LoRs3pqVA67tM6SMI2LDBH04lDx+V9xc9jYxnqZQcqqiSNZoAgvKE/fgBBhmJ0pk0ou
	dtBlG/zLPjO0dNAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 897FA779A7;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OFVNIKaGKWo5MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 15:45:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	linux-kernel@vber.kernel.org
Subject: [PATCH 4/5] ALSA: aloop: Use the new helper for stop-count refcount
Date: Wed, 10 Jun 2026 17:45:34 +0200
Message-ID: <20260610154538.51076-5-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610154538.51076-1-tiwai@suse.de>
References: <20260610154538.51076-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A92C06AF4B
X-Spam-Score: -3.01

Replace the open-code for managing the stop-count refcount with the
new helpers.
Only a code cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 3f8488716a08..06bfe09eae1a 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -100,8 +100,7 @@ struct loopback_cable {
 	spinlock_t lock;
 	struct loopback_pcm *streams[2];
 	/* in-flight peer stops running outside cable->lock */
-	atomic_t stop_count;
-	wait_queue_head_t stop_wait;
+	struct snd_refcount stop_count;
 	struct snd_pcm_hardware hw;
 	/* flags */
 	unsigned int valid;
@@ -371,7 +370,7 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 				return -EIO;
 			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING) {
 				/* close must not free the peer runtime below */
-				atomic_inc(&cable->stop_count);
+				snd_refcount_get(&cable->stop_count);
 				stop_capture = true;
 			}
 		}
@@ -404,8 +403,7 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 
 	if (stop_capture) {
 		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
-		if (atomic_dec_and_test(&cable->stop_count))
-			wake_up(&cable->stop_wait);
+		snd_refcount_put(&cable->stop_count);
 	}
 
 	return 0;
@@ -1070,7 +1068,7 @@ static void free_cable(struct snd_pcm_substream *substream)
 	}
 
 	/* Pair with the stop_count increment in loopback_check_format(). */
-	wait_event(cable->stop_wait, !atomic_read(&cable->stop_count));
+	snd_refcount_sync(&cable->stop_count);
 	if (other_alive)
 		return;
 
@@ -1274,8 +1272,7 @@ static int loopback_open(struct snd_pcm_substream *substream)
 			goto unlock;
 		}
 		spin_lock_init(&cable->lock);
-		atomic_set(&cable->stop_count, 0);
-		init_waitqueue_head(&cable->stop_wait);
+		snd_refcount_init(&cable->stop_count);
 		cable->hw = loopback_pcm_hardware;
 		if (loopback->timer_source)
 			cable->ops = &loopback_snd_timer_ops;
-- 
2.54.0

