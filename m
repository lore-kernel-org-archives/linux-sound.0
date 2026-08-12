Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B4132D0EE
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514784; cv=none; b=ohTJYPLlMgFqM2zogDDKbKqmX21ftCNeTkkmpGYpTAzXDJNkfA/7wehR2cHFWIsUryNkOvdtTKN9phdcs4zQdv7Kt3TdUJ7kdeebo228xNWT83JDVi+Gd5aCMxJM3eyOEpjr5GKzyNQOEZfLXHeA6o4MbrkCmE9OJPHb4wNmAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514784; c=relaxed/simple;
	bh=VmamiuqzJmNDEx2MbqM1/Gm/hVUBV3p+8xzHtvU0T5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfzDnFxDAEE/1wV3PkqznSlYkwv1r9W9Azo+6cMMPPG/ZI0YwmVihYM7LfB4zMTqpt1Bcp41mXYtWq4UEI4kRbVNKQSsx2bN54hzXxRWSegqoXjoywDmlsLm8ztUjkIismAbLnpttj+zUn/+AwZ3kzaI3P1yDgOOBn41TGIAD+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qy8btc4l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1KRSP2y6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dg4tjW/i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TESFRxk/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qy8btc4l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1KRSP2y6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dg4tjW/i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TESFRxk/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDF553E3E;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNWvV3EQIFNyFFlPyOVUHyFyBqpagvqHxKxQl65Z+zI=;
	b=Qy8btc4lgEFQ2+utFmTqLBBxoDrTcJFz73DdIgVyO6Qigb2aJKabOX9vKJnO5JRDw+ltgP
	9GPn57ZqCL+1fqvEy+Ovdew5dM9D1OCYmg8MHEEhjJFQHiLqd785hKzJ2Sn8me4t+cqop6
	oR0ktj3j5yCjczK3aThvODUnNUoLXN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNWvV3EQIFNyFFlPyOVUHyFyBqpagvqHxKxQl65Z+zI=;
	b=1KRSP2y6wjrh6texeLYvX6fCs77ZwZQnusCbk/YKXGllEWpgD1HYotqk8ZV2BWdVBZfHZj
	OgYxkf8zF5tZtSDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dg4tjW/i";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="TESFRxk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNWvV3EQIFNyFFlPyOVUHyFyBqpagvqHxKxQl65Z+zI=;
	b=dg4tjW/iTiZpXVfTskc5yNqcuHsNEX7k+uA/ah17JGviZ95vIBochClFYa3nsJow+Zo7NZ
	kUokbcYeJvtOxm3oBKEQkOjFaSr8ov6eYORdnYdEcVNalk6+ve4oydF0zKaCRgASsVftLb
	aP5qYzcxcAawXUYvp2A98r1M4Vzt7CQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNWvV3EQIFNyFFlPyOVUHyFyBqpagvqHxKxQl65Z+zI=;
	b=TESFRxk/P2qWR80IF4lOh8Mg5ssWuXdU8z0Oq2TK71zN30T1o0rxE3kg4AF1fSuXMJtnvO
	HTeW970JIdNLYMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA819779B3;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mNBWLFMNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/14] ALSA: pcm: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:34 +0200
Message-ID: <20260812060557.80445-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DDF553E3E
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h        | 10 ++++------
 include/sound/pcm_params.h | 13 +++++--------
 sound/core/pcm.c           | 12 +++++-------
 sound/core/pcm_misc.c      | 25 +++++++++++--------------
 sound/core/pcm_native.c    | 28 ++++++++++++++--------------
 5 files changed, 39 insertions(+), 49 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 76fc33dce537..ab96396a7444 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -145,7 +145,7 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_8000_768000	(SNDRV_PCM_RATE_8000_384000|\
 					 SNDRV_PCM_RATE_705600|\
 					 SNDRV_PCM_RATE_768000)
-#define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
+#define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << SNDRV_PCM_FORMAT_##fmt)
 #define SNDRV_PCM_FMTBIT_S8		_SNDRV_PCM_FMTBIT(S8)
 #define SNDRV_PCM_FMTBIT_U8		_SNDRV_PCM_FMTBIT(U8)
 #define SNDRV_PCM_FMTBIT_S16_LE		_SNDRV_PCM_FMTBIT(S16_LE)
@@ -228,7 +228,7 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_FMTBIT_U20		SNDRV_PCM_FMTBIT_U20_BE
 #endif
 
-#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT((__force int)SNDRV_PCM_SUBFORMAT_##fmt)
+#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT(SNDRV_PCM_SUBFORMAT_##fmt)
 #define SNDRV_PCM_SUBFMTBIT_STD		_SNDRV_PCM_SUBFMTBIT(STD)
 #define SNDRV_PCM_SUBFMTBIT_MSBITS_MAX	_SNDRV_PCM_SUBFMTBIT(MSBITS_MAX)
 #define SNDRV_PCM_SUBFMTBIT_MSBITS_20	_SNDRV_PCM_SUBFMTBIT(MSBITS_20)
@@ -1515,7 +1515,7 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
  */
 static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 {
-	return 1ULL << (__force int) pcm_format;
+	return 1ULL << pcm_format;
 }
 
 /**
@@ -1523,9 +1523,7 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
  * @f: the iterator variable in snd_pcm_format_t type
  */
 #define pcm_for_each_format(f)						\
-	for ((f) = SNDRV_PCM_FORMAT_FIRST;				\
-	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
-	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
+	for ((f) = SNDRV_PCM_FORMAT_FIRST; (f) <= SNDRV_PCM_FORMAT_LAST; (f)++)
 
 /* printk helpers */
 #define pcm_err(pcm, fmt, args...) \
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index fbf35df6e5cf..bc43955fcb76 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -71,7 +71,7 @@ static inline void snd_mask_set(struct snd_mask *mask, unsigned int val)
 static inline void snd_mask_set_format(struct snd_mask *mask,
 				       snd_pcm_format_t format)
 {
-	snd_mask_set(mask, (__force unsigned int)format);
+	snd_mask_set(mask, format);
 }
 
 static inline void snd_mask_reset(struct snd_mask *mask, unsigned int val)
@@ -132,7 +132,7 @@ static inline int snd_mask_test(const struct snd_mask *mask, unsigned int val)
 static inline int snd_mask_test_format(const struct snd_mask *mask,
 				       snd_pcm_format_t format)
 {
-	return snd_mask_test(mask, (__force unsigned int)format);
+	return snd_mask_test(mask, format);
 }
 
 static inline int snd_mask_single(const struct snd_mask *mask)
@@ -302,8 +302,7 @@ static inline int snd_interval_eq(const struct snd_interval *i1, const struct sn
  */
 static inline snd_pcm_access_t params_access(const struct snd_pcm_hw_params *p)
 {
-	return (__force snd_pcm_access_t)snd_mask_min(hw_param_mask_c(p,
-		SNDRV_PCM_HW_PARAM_ACCESS));
+	return snd_mask_min(hw_param_mask_c(p, SNDRV_PCM_HW_PARAM_ACCESS));
 }
 
 /**
@@ -312,8 +311,7 @@ static inline snd_pcm_access_t params_access(const struct snd_pcm_hw_params *p)
  */
 static inline snd_pcm_format_t params_format(const struct snd_pcm_hw_params *p)
 {
-	return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
-		SNDRV_PCM_HW_PARAM_FORMAT));
+	return snd_mask_min(hw_param_mask_c(p, SNDRV_PCM_HW_PARAM_FORMAT));
 }
 
 /**
@@ -323,8 +321,7 @@ static inline snd_pcm_format_t params_format(const struct snd_pcm_hw_params *p)
 static inline snd_pcm_subformat_t
 params_subformat(const struct snd_pcm_hw_params *p)
 {
-	return (__force snd_pcm_subformat_t)snd_mask_min(hw_param_mask_c(p,
-		SNDRV_PCM_HW_PARAM_SUBFORMAT));
+	return snd_mask_min(hw_param_mask_c(p, SNDRV_PCM_HW_PARAM_SUBFORMAT));
 }
 
 /**
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index bfedf571e021..41c2cab7a52c 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -211,11 +211,9 @@ static const char * const snd_pcm_format_names[] = {
  */
 const char *snd_pcm_format_name(snd_pcm_format_t format)
 {
-	unsigned int format_num = (__force unsigned int)format;
-
-	if (format_num >= ARRAY_SIZE(snd_pcm_format_names) || !snd_pcm_format_names[format_num])
+	if (format >= ARRAY_SIZE(snd_pcm_format_names) || !snd_pcm_format_names[format])
 		return "Unknown";
-	return snd_pcm_format_names[format_num];
+	return snd_pcm_format_names[format];
 }
 EXPORT_SYMBOL_GPL(snd_pcm_format_name);
 
@@ -275,12 +273,12 @@ static const char *snd_pcm_stream_name(int stream)
 
 static const char *snd_pcm_access_name(snd_pcm_access_t access)
 {
-	return snd_pcm_access_names[(__force int)access];
+	return snd_pcm_access_names[access];
 }
 
 static const char *snd_pcm_subformat_name(snd_pcm_subformat_t subformat)
 {
-	return snd_pcm_subformat_names[(__force int)subformat];
+	return snd_pcm_subformat_names[subformat];
 }
 
 static const char *snd_pcm_tstamp_mode_name(int mode)
@@ -290,7 +288,7 @@ static const char *snd_pcm_tstamp_mode_name(int mode)
 
 static const char *snd_pcm_state_name(snd_pcm_state_t state)
 {
-	return snd_pcm_state_names[(__force int)state];
+	return snd_pcm_state_names[state];
 }
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 180b6b64a448..13de3b02aa34 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -24,15 +24,12 @@ struct pcm_format_data {
 	unsigned char silence[8];	/* silence data to fill */
 };
 
-/* we do lots of calculations on snd_pcm_format_t; shut up sparse */
-#define INT	__force int
-
 static bool valid_format(snd_pcm_format_t format)
 {
-	return (INT)format >= 0 && (INT)format <= (INT)SNDRV_PCM_FORMAT_LAST;
+	return format >= 0 && format <= SNDRV_PCM_FORMAT_LAST;
 }
 
-static const struct pcm_format_data pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] = {
+static const struct pcm_format_data pcm_formats[SNDRV_PCM_FORMAT_LAST+1] = {
 	[SNDRV_PCM_FORMAT_S8] = {
 		.width = 8, .phys = 8, .le = -1, .signd = 1,
 		.silence = {},
@@ -251,7 +248,7 @@ int snd_pcm_format_signed(snd_pcm_format_t format)
 	int val;
 	if (!valid_format(format))
 		return -EINVAL;
-	val = pcm_formats[(INT)format].signd;
+	val = pcm_formats[format].signd;
 	if (val < 0)
 		return -EINVAL;
 	return val;
@@ -300,7 +297,7 @@ int snd_pcm_format_little_endian(snd_pcm_format_t format)
 	int val;
 	if (!valid_format(format))
 		return -EINVAL;
-	val = pcm_formats[(INT)format].le;
+	val = pcm_formats[format].le;
 	if (val < 0)
 		return -EINVAL;
 	return val;
@@ -337,7 +334,7 @@ int snd_pcm_format_width(snd_pcm_format_t format)
 	int val;
 	if (!valid_format(format))
 		return -EINVAL;
-	val = pcm_formats[(INT)format].width;
+	val = pcm_formats[format].width;
 	if (!val)
 		return -EINVAL;
 	return val;
@@ -356,7 +353,7 @@ int snd_pcm_format_physical_width(snd_pcm_format_t format)
 	int val;
 	if (!valid_format(format))
 		return -EINVAL;
-	val = pcm_formats[(INT)format].phys;
+	val = pcm_formats[format].phys;
 	if (!val)
 		return -EINVAL;
 	return val;
@@ -390,9 +387,9 @@ const unsigned char *snd_pcm_format_silence_64(snd_pcm_format_t format)
 {
 	if (!valid_format(format))
 		return NULL;
-	if (! pcm_formats[(INT)format].phys)
+	if (! pcm_formats[format].phys)
 		return NULL;
-	return pcm_formats[(INT)format].silence;
+	return pcm_formats[format].silence;
 }
 EXPORT_SYMBOL(snd_pcm_format_silence_64);
 
@@ -416,12 +413,12 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 		return -EINVAL;
 	if (samples == 0)
 		return 0;
-	width = pcm_formats[(INT)format].phys; /* physical width */
+	width = pcm_formats[format].phys; /* physical width */
 	if (!width)
 		return -EINVAL;
-	pat = pcm_formats[(INT)format].silence;
+	pat = pcm_formats[format].silence;
 	/* signed or 1 byte data */
-	if (pcm_formats[(INT)format].signd == 1 || width <= 8) {
+	if (pcm_formats[format].signd == 1 || width <= 8) {
 		unsigned int bytes = samples * width / 8;
 		memset(data, *pat, bytes);
 		return 0;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f44dc334aac6..4a5057e7629d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -257,7 +257,7 @@ int snd_pcm_info_user(struct snd_pcm_substream *substream,
 }
 
 /* macro for simplified cast */
-#define PARAM_MASK_BIT(b)	(1U << (__force int)(b))
+#define PARAM_MASK_BIT(b)	(1U << (b))
 
 static bool hw_support_mmap(struct snd_pcm_substream *substream)
 {
@@ -489,7 +489,7 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 			params->msbits = snd_interval_value(i);
 		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
 		if (snd_mask_single(m)) {
-			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
+			snd_pcm_format_t format = snd_mask_min(m);
 			params->msbits = snd_pcm_format_width(format);
 		}
 	}
@@ -497,13 +497,13 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 	if (params->msbits) {
 		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
 		if (snd_mask_single(m)) {
-			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
+			snd_pcm_format_t format = snd_mask_min(m);
 
 			if (snd_pcm_format_linear(format) &&
 			    snd_pcm_format_width(format) != params->msbits) {
 				m_rw = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
 				snd_mask_reset(m_rw,
-					       (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+					       SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
 				if (snd_mask_empty(m_rw))
 					return -EINVAL;
 			}
@@ -1252,7 +1252,7 @@ static void snd_pcm_trigger_tstamp(struct snd_pcm_substream *substream)
 	runtime->trigger_master = NULL;
 }
 
-#define ACTION_ARG_IGNORE	(__force snd_pcm_state_t)0
+#define ACTION_ARG_IGNORE	0
 
 struct action_ops {
 	int (*pre_action)(struct snd_pcm_substream *substream,
@@ -1635,7 +1635,7 @@ EXPORT_SYMBOL_GPL(snd_pcm_stop_xrun);
 /*
  * pause callbacks: pass boolean (to start pause or resume) as state argument
  */
-#define pause_pushed(state)	(__force bool)(state)
+#define pause_pushed(state)	(bool)(state)
 
 static int snd_pcm_pre_pause(struct snd_pcm_substream *substream,
 			     snd_pcm_state_t state)
@@ -1707,14 +1707,14 @@ static const struct action_ops snd_pcm_action_pause = {
 static int snd_pcm_pause(struct snd_pcm_substream *substream, bool push)
 {
 	return snd_pcm_action(&snd_pcm_action_pause, substream,
-			      (__force snd_pcm_state_t)push);
+			      (snd_pcm_state_t)push);
 }
 
 static int snd_pcm_pause_lock_irq(struct snd_pcm_substream *substream,
 				  bool push)
 {
 	return snd_pcm_action_lock_irq(&snd_pcm_action_pause, substream,
-				       (__force snd_pcm_state_t)push);
+				       (snd_pcm_state_t)push);
 }
 
 #ifdef CONFIG_PM
@@ -1982,7 +1982,7 @@ static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
 	snd_pcm_state_t cur_state = snd_pcm_get_state(substream);
-	int f_flags = (__force int)state;
+	int f_flags = state;
 
 	if (cur_state == SNDRV_PCM_STATE_OPEN ||
 	    cur_state == SNDRV_PCM_STATE_DISCONNECTED)
@@ -2050,7 +2050,7 @@ static int snd_pcm_prepare(struct snd_pcm_substream *substream,
 
 	return snd_pcm_action_nonatomic(&snd_pcm_action_prepare,
 					substream,
-					(__force snd_pcm_state_t)f_flags);
+					(snd_pcm_state_t)f_flags);
 }
 
 /*
@@ -2461,7 +2461,7 @@ static int snd_pcm_hw_rule_format(struct snd_pcm_hw_params *params,
 		if (bits <= 0)
 			continue; /* ignore invalid formats */
 		if ((unsigned)bits < i->min || (unsigned)bits > i->max)
-			snd_mask_reset(&m, (__force unsigned)k);
+			snd_mask_reset(&m, k);
 	}
 	return snd_mask_refine(mask, &m);
 }
@@ -2543,16 +2543,16 @@ static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
 
 	snd_mask_none(&m);
 	/* All PCMs support at least the default STD subformat. */
-	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
+	snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_STD);
 
 	pcm_for_each_format(f) {
-		if (!snd_mask_test(fmask, (__force unsigned)f))
+		if (!snd_mask_test(fmask, f))
 			continue;
 
 		if (f == SNDRV_PCM_FORMAT_S32_LE && *subformats)
 			m.bits[0] |= *subformats;
 		else if (snd_pcm_format_linear(f))
-			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+			snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
 	}
 
 	return snd_mask_refine(sfmask, &m);
-- 
2.55.0

