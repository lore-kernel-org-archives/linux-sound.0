Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C951FF7CD
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496593; cv=none; b=SOvd3nHjs2uzUSxL0Z9bp2zfDYZfxq4nFMeuTXnURo9jbX9FdfJllsMvXguEyDimDnNDknoHGSHWFzKq8urk+WqDKFlHs86KHLjTO2FfRuI7O0OD6HpjfSIDFPt5P6UFF+4dCdC3WJeH3FRGyH8XblCqtwCfEoKHYC5ozgeBIMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496593; c=relaxed/simple;
	bh=gpplrspKYtXDwUhGZxtBVLwHCyAHYcsyMOss17VqeT4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=I9VTk/EqWt13dZ9oxSSrua66n/pFo49d0il8wqQiudS02UyZm/rXRgTPPRC8Xw+M6WD00dxCRYidGVg6Ltsxrohc9BRdOynjeq50LbrfXrHILLdJiL2pWXRafX1FMu6RUoLMiwPYaDc5Z/OUbryjeVlAy0qUHG9vsd8ZJ15WKp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X2X5+z9A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sVw/ODxx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X2X5+z9A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sVw/ODxx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X2X5+z9A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sVw/ODxx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X2X5+z9A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sVw/ODxx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C81891F37C;
	Wed, 13 Nov 2024 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnCJwm0UNhCnzhGAXXuYaqBG6HMZIxmgQJDhWoN0+Ok=;
	b=X2X5+z9AwUUdSeFxgFeie9sLJUy+LAurSsezbpW5HRW3cmiT1B7+pFdqCG+dQfZGduh0Tc
	9DesITORNEU0viyPb3oVHKz+3gx0M2itITJ7IpUnio5TfDUzNsCpRsTGOvmRUDYsVjAwHH
	opUeMMumEQCME8k3fckLWBpoIA5kFLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnCJwm0UNhCnzhGAXXuYaqBG6HMZIxmgQJDhWoN0+Ok=;
	b=sVw/ODxxxS3o8Gl2rT4YwCI5aF0M6qeEKWaAY566JFd8d9lsjIAQrQWIygmVhnjQXRqqn3
	58VR2NlTmUDxdzBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnCJwm0UNhCnzhGAXXuYaqBG6HMZIxmgQJDhWoN0+Ok=;
	b=X2X5+z9AwUUdSeFxgFeie9sLJUy+LAurSsezbpW5HRW3cmiT1B7+pFdqCG+dQfZGduh0Tc
	9DesITORNEU0viyPb3oVHKz+3gx0M2itITJ7IpUnio5TfDUzNsCpRsTGOvmRUDYsVjAwHH
	opUeMMumEQCME8k3fckLWBpoIA5kFLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnCJwm0UNhCnzhGAXXuYaqBG6HMZIxmgQJDhWoN0+Ok=;
	b=sVw/ODxxxS3o8Gl2rT4YwCI5aF0M6qeEKWaAY566JFd8d9lsjIAQrQWIygmVhnjQXRqqn3
	58VR2NlTmUDxdzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC22213301;
	Wed, 13 Nov 2024 11:16:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iJaoKI2KNGeVVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:16:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Define snd_pcm_mmap_data_{open|close}() locally
Date: Wed, 13 Nov 2024 12:16:27 +0100
Message-ID: <20241113111628.17069-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

snd_pcm_mmap_data_open() and _close() are defined as inline functions
in the public sound/pcm.h, but those are used only locally in
pcm_native.c, hence they should be better placed there.

Also, those are referred as callbacks, the useless inline is dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 24 ------------------------
 sound/core/pcm_native.c | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ef9cbeaf3784..67c99ffbf51b 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1393,30 +1393,6 @@ snd_pcm_sgbuf_get_chunk_size(struct snd_pcm_substream *substream,
 	return snd_sgbuf_get_chunk_size(snd_pcm_get_dma_buf(substream), ofs, size);
 }
 
-/**
- * snd_pcm_mmap_data_open - increase the mmap counter
- * @area: VMA
- *
- * PCM mmap callback should handle this counter properly
- */
-static inline void snd_pcm_mmap_data_open(struct vm_area_struct *area)
-{
-	struct snd_pcm_substream *substream = (struct snd_pcm_substream *)area->vm_private_data;
-	atomic_inc(&substream->mmap_count);
-}
-
-/**
- * snd_pcm_mmap_data_close - decrease the mmap counter
- * @area: VMA
- *
- * PCM mmap callback should handle this counter properly
- */
-static inline void snd_pcm_mmap_data_close(struct vm_area_struct *area)
-{
-	struct snd_pcm_substream *substream = (struct snd_pcm_substream *)area->vm_private_data;
-	atomic_dec(&substream->mmap_count);
-}
-
 int snd_pcm_lib_default_mmap(struct snd_pcm_substream *substream,
 			     struct vm_area_struct *area);
 /* mmap for io-memory area */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index b465fb6e1f5f..47027fa4eb28 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3773,6 +3773,26 @@ static int snd_pcm_mmap_control(struct snd_pcm_substream *substream, struct file
 }
 #endif /* coherent mmap */
 
+/*
+ * snd_pcm_mmap_data_open - increase the mmap counter
+ */
+static void snd_pcm_mmap_data_open(struct vm_area_struct *area)
+{
+	struct snd_pcm_substream *substream = area->vm_private_data;
+
+	atomic_inc(&substream->mmap_count);
+}
+
+/*
+ * snd_pcm_mmap_data_close - decrease the mmap counter
+ */
+static void snd_pcm_mmap_data_close(struct vm_area_struct *area)
+{
+	struct snd_pcm_substream *substream = area->vm_private_data;
+
+	atomic_dec(&substream->mmap_count);
+}
+
 /*
  * fault callback for mmapping a RAM page
  */
-- 
2.43.0

