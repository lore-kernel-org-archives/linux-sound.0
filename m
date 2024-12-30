Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A81A83EE
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735559349; cv=none; b=SFi4rjCL3GEuipALlillHoVXLuyhNYxj6yP25bX9+lu+Ok2OP7iHevm/zZ9ICHilO5ITrioruKIVt20H3XxKHZ3SW8b9YQeAHHYHuIrehKGY3s1B5Tt+BaGKVo8j4mHfTlF9xQ6312//DV4tdfldfTHkHc039TU8d5EzABpqnPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735559349; c=relaxed/simple;
	bh=iQhTfR18tV4uM8S0+mqalQkATCQt5lYTXS/OCSr9dpg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lVixw59CP/9pPADGP2E4Lkx13vComIdfrrYIJlfG63dp7t8dxC3wsc552pgjmuROKEX/n+ZRcmOWQE2qBntgpZb5Vkc9yOLjElaYN6JoFeCY9QFrr5nY4xV7OZ+M4DxCOvOJuekvJW1PV/W3FRkjfH90YU7BiZ2VCmJYivWay/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C5VXgUVz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6Dfg4Ju; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C5VXgUVz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6Dfg4Ju; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C5VXgUVz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6Dfg4Ju";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C5VXgUVz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6Dfg4Ju"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 003AC1F38C;
	Mon, 30 Dec 2024 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735559345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9cg5wKqMF92VwSpqGjILWnOaMElhvpGXTBmq3eZ5l7I=;
	b=C5VXgUVzCLoCKQLb8H9fdJuHHTLANiN7Gty42MCjUWou87tkRzH03TFVc0iWvXW2XrFRvc
	FkonwPOktRrz10zw0fyohvq5drFipcOHfwzVuUXAYaP9nhMxo+J8UXZJM6MhgMvl1sR3ZO
	vNXrHIDXRLySzBJLO7clKXJZWlt5euw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735559345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9cg5wKqMF92VwSpqGjILWnOaMElhvpGXTBmq3eZ5l7I=;
	b=f6Dfg4JuZKYs8U2up6AcE42vUupv7HbJPDcHjQXR5nO66NSnwZLTXyoKMtgrQGRk6TNEcy
	qMkrAC02pJ05iCAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C5VXgUVz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f6Dfg4Ju
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735559345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9cg5wKqMF92VwSpqGjILWnOaMElhvpGXTBmq3eZ5l7I=;
	b=C5VXgUVzCLoCKQLb8H9fdJuHHTLANiN7Gty42MCjUWou87tkRzH03TFVc0iWvXW2XrFRvc
	FkonwPOktRrz10zw0fyohvq5drFipcOHfwzVuUXAYaP9nhMxo+J8UXZJM6MhgMvl1sR3ZO
	vNXrHIDXRLySzBJLO7clKXJZWlt5euw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735559345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9cg5wKqMF92VwSpqGjILWnOaMElhvpGXTBmq3eZ5l7I=;
	b=f6Dfg4JuZKYs8U2up6AcE42vUupv7HbJPDcHjQXR5nO66NSnwZLTXyoKMtgrQGRk6TNEcy
	qMkrAC02pJ05iCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D67BD13A6C;
	Mon, 30 Dec 2024 11:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jtYsM7CIcmcMeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 11:49:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: Align the syntax of iov_iter helpers with standard ones
Date: Mon, 30 Dec 2024 12:49:02 +0100
Message-ID: <20241230114903.4959-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 003AC1F38C
X-Spam-Level: 
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

We introduced a couple of helpers for copying iomem over iov_iter, and
the functions were formed like the former copy_from/to_user(), and the
return value was adjusted to 0/-EFAULT, which made the code transition
a bit easier at that time.

OTOH, the standard copy_from/to_iter() functions have different
argument orders and the return value, and this difference can be
confusing.  It's not only confusing but dangerous; actually I did
write a wrong code due to that once :-<

For reducing the confusion, this patch changes the syntax of those
helpers to align with the standard copy_from/to_iter().  The argument
order is changed and the return value is the size of copied bytes.
The callers of those functions are updated accordingly, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h             |  7 +++---
 sound/core/memory.c             | 41 +++++++++++++++++++++------------
 sound/pci/nm256/nm256.c         |  8 +++++--
 sound/pci/rme32.c               | 13 +++++++----
 sound/pci/rme96.c               | 13 +++++++----
 sound/soc/qcom/lpass-platform.c |  6 +++--
 6 files changed, 56 insertions(+), 32 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 67c99ffbf51b..8becb4504887 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1532,9 +1532,10 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 	dev_dbg((pcm)->card->dev, fmt, ##args)
 
 /* helpers for copying between iov_iter and iomem */
-int copy_to_iter_fromio(struct iov_iter *itert, const void __iomem *src,
-			size_t count);
-int copy_from_iter_toio(void __iomem *dst, struct iov_iter *iter, size_t count);
+size_t copy_to_iter_fromio(const void __iomem *src, size_t bytes,
+			   struct iov_iter *iter) __must_check;
+size_t copy_from_iter_toio(void __iomem *dst, size_t bytes,
+			   struct iov_iter *iter) __must_check;
 
 struct snd_pcm_status64 {
 	snd_pcm_state_t state;		/* stream state */
diff --git a/sound/core/memory.c b/sound/core/memory.c
index 2d2d0094c897..d683442b4c97 100644
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -27,38 +27,43 @@ int copy_to_user_fromio(void __user *dst, const volatile void __iomem *src, size
 
 	if (import_ubuf(ITER_DEST, dst, count, &iter))
 		return -EFAULT;
-	return copy_to_iter_fromio(&iter, (const void __iomem *)src, count);
+	if (copy_to_iter_fromio((const void __iomem *)src, count, &iter) != count)
+		return -EFAULT;
+	return 0;
 }
 EXPORT_SYMBOL(copy_to_user_fromio);
 
 /**
  * copy_to_iter_fromio - copy data from mmio-space to iov_iter
- * @dst: the destination iov_iter
  * @src: the source pointer on mmio
  * @count: the data size to copy in bytes
+ * @dst: the destination iov_iter
  *
  * Copies the data from mmio-space to iov_iter.
  *
- * Return: Zero if successful, or non-zero on failure.
+ * Return: number of bytes to be copied
  */
-int copy_to_iter_fromio(struct iov_iter *dst, const void __iomem *src,
-			size_t count)
+size_t copy_to_iter_fromio(const void __iomem *src, size_t count,
+			   struct iov_iter *dst)
 {
 #if defined(__i386__) || defined(CONFIG_SPARC32)
-	return copy_to_iter((const void __force *)src, count, dst) == count ? 0 : -EFAULT;
+	return copy_to_iter((const void __force *)src, count, dst);
 #else
 	char buf[256];
+	size_t res = 0;
+
 	while (count) {
 		size_t c = count;
 		if (c > sizeof(buf))
 			c = sizeof(buf);
 		memcpy_fromio(buf, (void __iomem *)src, c);
 		if (copy_to_iter(buf, c, dst) != c)
-			return -EFAULT;
+			return res;
 		count -= c;
 		src += c;
+		res += c;
 	}
-	return 0;
+	return res;
 #endif
 }
 EXPORT_SYMBOL(copy_to_iter_fromio);
@@ -79,37 +84,43 @@ int copy_from_user_toio(volatile void __iomem *dst, const void __user *src, size
 
 	if (import_ubuf(ITER_SOURCE, (void __user *)src, count, &iter))
 		return -EFAULT;
-	return copy_from_iter_toio((void __iomem *)dst, &iter, count);
+	if (copy_from_iter_toio((void __iomem *)dst, count, &iter) != count)
+		return -EFAULT;
+	return 0;
 }
 EXPORT_SYMBOL(copy_from_user_toio);
 
 /**
  * copy_from_iter_toio - copy data from iov_iter to mmio-space
  * @dst: the destination pointer on mmio-space
- * @src: the source iov_iter
  * @count: the data size to copy in bytes
+ * @src: the source iov_iter
  *
  * Copies the data from iov_iter to mmio-space.
  *
- * Return: Zero if successful, or non-zero on failure.
+ * Return: number of bytes to be copied
  */
-int copy_from_iter_toio(void __iomem *dst, struct iov_iter *src, size_t count)
+size_t copy_from_iter_toio(void __iomem *dst, size_t count,
+			   struct iov_iter *src)
 {
 #if defined(__i386__) || defined(CONFIG_SPARC32)
-	return copy_from_iter((void __force *)dst, count, src) == count ? 0 : -EFAULT;
+	return copy_from_iter((void __force *)dst, count, src);
 #else
 	char buf[256];
+	size_t res = 0;
+
 	while (count) {
 		size_t c = count;
 		if (c > sizeof(buf))
 			c = sizeof(buf);
 		if (copy_from_iter(buf, c, src) != c)
-			return -EFAULT;
+			return res;
 		memcpy_toio(dst, buf, c);
 		count -= c;
 		dst += c;
+		res += c;
 	}
-	return 0;
+	return res;
 #endif
 }
 EXPORT_SYMBOL(copy_from_iter_toio);
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 11ba7d4eac2a..44085237fb44 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -696,7 +696,9 @@ snd_nm256_playback_copy(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct nm256_stream *s = runtime->private_data;
 
-	return copy_from_iter_toio(s->bufptr + pos, src, count);
+	if (copy_from_iter_toio(s->bufptr + pos, count, src) != count)
+		return -EFAULT;
+	return 0;
 }
 
 /*
@@ -710,7 +712,9 @@ snd_nm256_capture_copy(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct nm256_stream *s = runtime->private_data;
 
-	return copy_to_iter_fromio(dst, s->bufptr + pos, count);
+	if (copy_to_iter_fromio(s->bufptr + pos, count, dst) != count)
+		return -EFAULT;
+	return 0;
 }
 
 #endif /* !__i386__ */
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 02144bbee6d5..a8c2ceaadef5 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -256,8 +256,10 @@ static int snd_rme32_playback_copy(struct snd_pcm_substream *substream,
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	return copy_from_iter_toio(rme32->iobase + RME32_IO_DATA_BUFFER + pos,
-				   src, count);
+	if (copy_from_iter_toio(rme32->iobase + RME32_IO_DATA_BUFFER + pos,
+				count, src) != count)
+		return -EFAULT;
+	return 0;
 }
 
 /* copy callback for halfduplex mode */
@@ -267,9 +269,10 @@ static int snd_rme32_capture_copy(struct snd_pcm_substream *substream,
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	return copy_to_iter_fromio(dst,
-				   rme32->iobase + RME32_IO_DATA_BUFFER + pos,
-				   count);
+	if (copy_to_iter_fromio(rme32->iobase + RME32_IO_DATA_BUFFER + pos,
+				count, dst) != count)
+		return -EFAULT;
+	return 0;
 }
 
 /*
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index d50ad25574ad..1265a7efac60 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -322,8 +322,10 @@ snd_rme96_playback_copy(struct snd_pcm_substream *substream,
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 
-	return copy_from_iter_toio(rme96->iobase + RME96_IO_PLAY_BUFFER + pos,
-				   src, count);
+	if (copy_from_iter_toio(rme96->iobase + RME96_IO_PLAY_BUFFER + pos,
+				count, src) != count)
+		return -EFAULT;
+	return 0;
 }
 
 static int
@@ -333,9 +335,10 @@ snd_rme96_capture_copy(struct snd_pcm_substream *substream,
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 
-	return copy_to_iter_fromio(dst,
-				   rme96->iobase + RME96_IO_REC_BUFFER + pos,
-				   count);
+	if (copy_to_iter_fromio(rme96->iobase + RME96_IO_REC_BUFFER + pos,
+				count, dst) != count)
+		return -EFAULT;
+	return 0;
 }
 
 /*
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index addd2c4bdd3e..9946f12254b3 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1232,14 +1232,16 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		if (is_cdc_dma_port(dai_id)) {
-			ret = copy_from_iter_toio(dma_buf, buf, bytes);
+			if (copy_from_iter_toio(dma_buf, bytes, buf) != bytes)
+				ret = -EFAULT;
 		} else {
 			if (copy_from_iter((void __force *)dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
 		}
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		if (is_cdc_dma_port(dai_id)) {
-			ret = copy_to_iter_fromio(buf, dma_buf, bytes);
+			if (copy_to_iter_fromio(dma_buf, bytes, buf) != bytes)
+				ret = -EFAULT;
 		} else {
 			if (copy_to_iter((void __force *)dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
-- 
2.43.0

