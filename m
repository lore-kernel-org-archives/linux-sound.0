Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721534;
	b=4D96zTY3NRR1Pxt+DMmr35DSEKq2edAPJaCn1LrJct7KL4b1Jd+fnrFBQbIClCbZNzKG
	 +4gdCfxB60y53x0qbo7cFLJEvmJIdUvkzpGkX/eWK67+ao8/9z2KSwxAPTc0vyq63l3C7
	 /iXXyai8FyhJx7yJoH7wHKHA+kGR6j3f4sP6x+/b1/hJTiDPPoO9ZGnsw+f8EUNVTEIje
	 bq1YNgP8Ee4iT30pFajkL6UNt7X7TLUimFkbHr9RUrpCMoeQKlWitsyI5EArdUpOJ3yUY
	 WCE845tZVfwuuK+e+V//eXNF5L4i/ICDx75TkOSkJJgYrppq+oQ4vMxXwy//jXg8Ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721534;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=1x09zS6hIaMebBTyEQ9sdELi8+WLLVGdTEpLi2hGYlQ=;
	b=FCIVYBo4+xDX4Dt2ohGwXn0IiPEPNbKkZ5MoEQidOfmY/Fh70ufkpbYrN4O1F6lpBY01
	 OK/ALsm9Vlul72G8BVahtgQIIvoSkzmQBTTptPrqDVIsN8NJYwk3WSP4vZ3vVWhwH5tIC
	 L81mqqlN2VkzZQdr+aMxlWngsy2SigFGiLFloVNYBhEmstkoVzNtaW9d/6ex3Wo8MXwSX
	 jdIAcPcc2fIcnw3ZhXn2NoXk0m4Gcx6gQUnAWzldRn0kc13HmDv6FKNs5wtfDwcj4O1Pk
	 T6QDPWr7g7DO862i4VdUnTSH14f9lcQT2uNUScwajYGoJGBRFImXl276Ao77KkmDXPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JfOT4LjW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HKzr0paQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YbXiuGa6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ym6xggyP;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C157606A32C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 15:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C157606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JfOT4LjW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HKzr0paQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YbXiuGa6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ym6xggyP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 59BD322224;
	Tue,  3 Nov 2026 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793721532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1x09zS6hIaMebBTyEQ9sdELi8+WLLVGdTEpLi2hGYlQ=;
	b=JfOT4LjWBvD2BURfG1BsMgjcFV3q5ysgmCy4wr9L9oBlp4DqLxtpD0/sU+uDMdyPmAcDsz
	oTUyMUqCti87lHDbRYe/sOX+dLxFh6dRFbEYiHM5Nwtqr1ptguqte5TGSMxKCvR8PL69br
	6CAOFlihE/6TqDacLLEq3TC2iq6rOZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793721532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1x09zS6hIaMebBTyEQ9sdELi8+WLLVGdTEpLi2hGYlQ=;
	b=HKzr0paQDl0siCqjyMBxehbzJj9FvVTEmauHT3CmLRKrEOGY8A49QvzQ+XIyi5omzo/Ja6
	WwwfjUmkv0MCUeCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793721531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1x09zS6hIaMebBTyEQ9sdELi8+WLLVGdTEpLi2hGYlQ=;
	b=YbXiuGa6xlA1itb+d6enyXlht984Ow2BaaM3lEB616Nr4ZpBwvAlsh4ghzsz8hdUTCy3XH
	eBklgVuHw2VzUqYk8dKm/F/BJo/BIe8BNXBNsmzqgALCI8X+QzFpLVdU+gx1RDugmg9kdL
	syyiTGP8r1ccwdG0TA4IYUZ4PV0BnX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793721531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1x09zS6hIaMebBTyEQ9sdELi8+WLLVGdTEpLi2hGYlQ=;
	b=Ym6xggyPk3ifIHfgd0gQxe6Fdgoqvj/EMDLZEildnPusqRBMSzEls2wCvK7VyxOC/5DLEL
	BjJcDtc8y8R+h5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 288C1134B8;
	Tue,  3 Nov 2026 15:58:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KnMfAbsE6mrNXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 15:58:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Bo Cao <treebacker@foxmail.com>
Subject: [PATCH] ALSA: pcm: Prevent O_APPEND open on OSS streams
Date: Tue,  3 Nov 2026 16:58:40 +0100
Message-ID: <20261103155844.120838-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[foxmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com]
X-Spam-Score: -11.80

ALSA PCM core accepts to re-use the existing stream when O_APPEND is
passed, and it's been used for dmix, etc.  However, this mode isn't
supposed to be used for OSS: the OSS stream allows re-configuration
via its hw_params/hw_refine procedure even while it's being mmapped,
so it implies the usage of only a single stream.  Because of this
assumption, the sanity check is skipped for OSS streams, and if user
may attach to an existing OSS stream with O_APPEND, it may result in a
UAF of the mapped pages which could be used as a privilege escalation
exploit.

For addressing it, this patch simply prohibits the O_APPEND behavior
on the OSS stream.  O_APPEND is never used for OSS layer itself, so
this can't break for the right applications.

Fixes: 0df63e44c3e3 ("[ALSA] Add O_APPEND flag support to PCM")
Cc: stable@vger.kernel.org
Reported-by: Bo Cao <treebacker@foxmail.com>
Link: https://lore.kernel.org/tencent_E90BB4F086165FAA3313723567A5C675EA06@qq.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c        | 2 ++
 sound/core/pcm_local.h  | 6 ++++++
 sound/core/pcm_native.c | 6 ------
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..6c8274414c22 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -929,6 +929,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 			return -ENODEV;
 		if (! SUBSTREAM_BUSY(substream))
 			return -EBADFD;
+		if (is_oss_stream(substream))
+			return -EINVAL;
 		substream->ref_count++;
 		*rsubstream = substream;
 		return 0;
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index ecb21697ae3a..4b134d435c24 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -80,4 +80,10 @@ static inline void snd_pcm_dma_buffer_sync(struct snd_pcm_substream *substream,
 		snd_dma_buffer_sync(snd_pcm_get_dma_buf(substream), mode);
 }
 
+#if IS_ENABLED(CONFIG_SND_PCM_OSS)
+#define is_oss_stream(substream)	((substream)->oss.oss)
+#else
+#define is_oss_stream(substream)	false
+#endif
+
 #endif	/* __SOUND_CORE_PCM_LOCAL_H */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 35152fae74ca..bec797398acf 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -749,12 +749,6 @@ int snd_pcm_runtime_buffer_set_silence(struct snd_pcm_runtime *runtime)
 }
 EXPORT_SYMBOL_GPL(snd_pcm_runtime_buffer_set_silence);
 
-#if IS_ENABLED(CONFIG_SND_PCM_OSS)
-#define is_oss_stream(substream)	((substream)->oss.oss)
-#else
-#define is_oss_stream(substream)	false
-#endif
-
 static void pcm_qos_req_clear(struct snd_pcm_substream *substream)
 {
 	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
-- 
2.55.0

