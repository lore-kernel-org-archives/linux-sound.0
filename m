Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6581A3FE3D
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=Rj+sROjnTLH7TTyQNBUCVEGrJwt4Z15Qn6+VgI0rQHpPC3uPfmXb0WkQv+IQbviKo79CLS1YxR8uQt24mQ1Qn95QtQzqtCkC96tleJsgMlb7kV5mq0CeQfsxwBef4TMyqmMTcSd3bLvQ1S+XuE6TtnBzrH85dLtMO3Nb6yY4bsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=JuCWc29ufHbl909SuTivK1tkJLztEm0PSzQNZxvZbh8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rkKHJJKErLtCGPbmGU11j+EeGgW/EKaoXAyDAJBWcjEcVvb+STnYnQ8KT1VIVT8X6PXiLLY+LDSyV8R88M/HNndARiL/apbZ++dJLuxtGhtZm/Zd9552gGHyQnCOusEOxWdxXW+cnCl4YsL/9JScCdddEmI92X19l4maJSgNXx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lH2E6/hv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Oemsl/Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lH2E6/hv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Oemsl/Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lH2E6/hv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Oemsl/Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lH2E6/hv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Oemsl/Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ADF811F7B9;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzP2H9VnWXIfqEwaUY9AGhWaJ1LxbpfvJPyC/YnhFg0=;
	b=lH2E6/hv1dnIbSV/15LOCNhVuX9KU9S6RdzU8T5ENXD2JOIQb1GppdgBsQhpjjx0SSRe4r
	iGaUpq9SmWV5dfvwjqJWq7hEYFuqfShc/ORzH6BOGWHDUEXMeXWIy9QFX64U77X+Z4QeFT
	VMcNH6LidDCLfjhp1TE84Njn/3trL5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzP2H9VnWXIfqEwaUY9AGhWaJ1LxbpfvJPyC/YnhFg0=;
	b=/Oemsl/ZnoDiLPd7YYlKuWXlEBKU6jauf/yKucBNmRm1tU1mbts6tUb4wt774CWwvbrBta
	v8UL7QrFPtrk9bAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzP2H9VnWXIfqEwaUY9AGhWaJ1LxbpfvJPyC/YnhFg0=;
	b=lH2E6/hv1dnIbSV/15LOCNhVuX9KU9S6RdzU8T5ENXD2JOIQb1GppdgBsQhpjjx0SSRe4r
	iGaUpq9SmWV5dfvwjqJWq7hEYFuqfShc/ORzH6BOGWHDUEXMeXWIy9QFX64U77X+Z4QeFT
	VMcNH6LidDCLfjhp1TE84Njn/3trL5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzP2H9VnWXIfqEwaUY9AGhWaJ1LxbpfvJPyC/YnhFg0=;
	b=/Oemsl/ZnoDiLPd7YYlKuWXlEBKU6jauf/yKucBNmRm1tU1mbts6tUb4wt774CWwvbrBta
	v8UL7QrFPtrk9bAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 963EC13ADB;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cJx6I8Ms12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/9] ALSA: compress_offload: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:03 +0100
Message-Id: <20240222111509.28390-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="lH2E6/hv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/Oemsl/Z"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: ADF811F7B9
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

A caveat is that some allocations are memdup_user() and they return an
error pointer instead of NULL.  Those need special cares and the value
has to be cleared with no_free_ptr() at the allocation error path.

Other than that, the conversions are straightforward.

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 36 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 619371aa9964..5d926c5b737d 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -465,7 +465,7 @@ static int
 snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
 {
 	int retval;
-	struct snd_compr_codec_caps *caps;
+	struct snd_compr_codec_caps *caps __free(kfree) = NULL;
 
 	if (!stream->ops->get_codec_caps)
 		return -ENXIO;
@@ -476,12 +476,9 @@ snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
 
 	retval = stream->ops->get_codec_caps(stream, caps);
 	if (retval)
-		goto out;
+		return retval;
 	if (copy_to_user((void __user *)arg, caps, sizeof(*caps)))
-		retval = -EFAULT;
-
-out:
-	kfree(caps);
+		return -EFAULT;
 	return retval;
 }
 #endif /* !COMPR_CODEC_CAPS_OVERFLOW */
@@ -586,7 +583,7 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 static int
 snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_compr_params *params;
+	struct snd_compr_params *params __free(kfree) = NULL;
 	int retval;
 
 	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
@@ -596,24 +593,22 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		 */
 		params = memdup_user((void __user *)arg, sizeof(*params));
 		if (IS_ERR(params))
-			return PTR_ERR(params);
+			return PTR_ERR(no_free_ptr(params));
 
 		retval = snd_compress_check_input(params);
 		if (retval)
-			goto out;
+			return retval;
 
 		retval = snd_compr_allocate_buffer(stream, params);
-		if (retval) {
-			retval = -ENOMEM;
-			goto out;
-		}
+		if (retval)
+			return -ENOMEM;
 
 		retval = stream->ops->set_params(stream, params);
 		if (retval)
-			goto out;
+			return retval;
 
 		if (stream->next_track)
-			goto out;
+			return retval;
 
 		stream->metadata_set = false;
 		stream->next_track = false;
@@ -622,15 +617,13 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 	} else {
 		return -EPERM;
 	}
-out:
-	kfree(params);
 	return retval;
 }
 
 static int
 snd_compr_get_params(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_codec *params;
+	struct snd_codec *params __free(kfree) = NULL;
 	int retval;
 
 	if (!stream->ops->get_params)
@@ -641,12 +634,9 @@ snd_compr_get_params(struct snd_compr_stream *stream, unsigned long arg)
 		return -ENOMEM;
 	retval = stream->ops->get_params(stream, params);
 	if (retval)
-		goto out;
+		return retval;
 	if (copy_to_user((char __user *)arg, params, sizeof(*params)))
-		retval = -EFAULT;
-
-out:
-	kfree(params);
+		return -EFAULT;
 	return retval;
 }
 
-- 
2.35.3

