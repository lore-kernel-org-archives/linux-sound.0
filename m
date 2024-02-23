Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3218633
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677774; cv=none; b=OUydth98FyUhlqb9EF2QI4m3puepUAcRTvDhefh+dYSrXXs9V/eLrHT76sLKRYnnXhg9WYAQMcGc9hmFdoWvViaKW7EpJngt6BBqo6kE9PYfLzcjTdThYyK+q+5uJFERjFTF9Yt0EPkqF7MGJpimON1a4lQap3uOBxSuUN+0IbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677774; c=relaxed/simple;
	bh=3cYVLKzSZhujWHVLZdmR0QZh77LMPk5BOTMhG4GhQok=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a6x6XTdoLxmr18DWFbFPAza0lOoRWpCWXX5jhqi90mV7wcLYDZ79996Cpmny9E63eTtUMfEWqfUT6+8hj0am/sYjyLJ9HsfDkfCjK75O2MQeEkpwV/o3YfY40Esw2rLSJkBn1fOB4amXuDod0vb+AKsMY1O2Zo0sfA6cQhI2/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RQlsdi8U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YbXIFoeP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RQlsdi8U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YbXIFoeP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RQlsdi8U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YbXIFoeP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RQlsdi8U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YbXIFoeP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1A04A22150;
	Fri, 23 Feb 2024 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CafaoYU92oJjoO0wgUiqhOmaq3YRDX/7o+MiYDlEoIA=;
	b=RQlsdi8UKhgoPf57p82vXfFHuVwhpF19CDoNkzQvso6JWjk1R2bXIHcGCA04rruRa5kCys
	9D3rnLZ7WmnlqKyQWGu3YDKP1WZadS4kK/lClwRp1k9x2pZAQrutT9/36vJjNS9otedueU
	7yv/x0NQePyk+ZhI/WKhobXjfMGLT8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CafaoYU92oJjoO0wgUiqhOmaq3YRDX/7o+MiYDlEoIA=;
	b=YbXIFoePNVRqtJfpRIBnHR/AjEKr1p+C65Ye9ffDbCc75pC2S0tO80a4yzjQ6KPj+WKHk8
	iY0NEuh7b7TfqtBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CafaoYU92oJjoO0wgUiqhOmaq3YRDX/7o+MiYDlEoIA=;
	b=RQlsdi8UKhgoPf57p82vXfFHuVwhpF19CDoNkzQvso6JWjk1R2bXIHcGCA04rruRa5kCys
	9D3rnLZ7WmnlqKyQWGu3YDKP1WZadS4kK/lClwRp1k9x2pZAQrutT9/36vJjNS9otedueU
	7yv/x0NQePyk+ZhI/WKhobXjfMGLT8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CafaoYU92oJjoO0wgUiqhOmaq3YRDX/7o+MiYDlEoIA=;
	b=YbXIFoePNVRqtJfpRIBnHR/AjEKr1p+C65Ye9ffDbCc75pC2S0tO80a4yzjQ6KPj+WKHk8
	iY0NEuh7b7TfqtBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC5F713AB6;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CORiOIpa2GVDOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:42:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: pcm_oss: ump: Use automatic cleanup of kfree()
Date: Fri, 23 Feb 2024 09:42:41 +0100
Message-Id: <20240223084241.3361-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223084241.3361-1-tiwai@suse.de>
References: <20240223084241.3361-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RQlsdi8U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YbXIFoeP
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[42.59%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 1A04A22150
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 728c211142d1..e4e292b2db06 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -377,7 +377,7 @@ static int snd_pcm_hw_param_near(struct snd_pcm_substream *pcm,
 				 snd_pcm_hw_param_t var, unsigned int best,
 				 int *dir)
 {
-	struct snd_pcm_hw_params *save = NULL;
+	struct snd_pcm_hw_params *save __free(kfree) = NULL;
 	int v;
 	unsigned int saved_min;
 	int last = 0;
@@ -404,38 +404,30 @@ static int snd_pcm_hw_param_near(struct snd_pcm_substream *pcm,
 	saved_min = min;
 	min = snd_pcm_hw_param_min(pcm, params, var, min, &mindir);
 	if (min >= 0) {
-		struct snd_pcm_hw_params *params1;
+		struct snd_pcm_hw_params *params1 __free(kfree) = NULL;
 		if (max < 0)
 			goto _end;
 		if ((unsigned int)min == saved_min && mindir == valdir)
 			goto _end;
 		params1 = kmalloc(sizeof(*params1), GFP_KERNEL);
-		if (params1 == NULL) {
-			kfree(save);
+		if (params1 == NULL)
 			return -ENOMEM;
-		}
 		*params1 = *save;
 		max = snd_pcm_hw_param_max(pcm, params1, var, max, &maxdir);
-		if (max < 0) {
-			kfree(params1);
+		if (max < 0)
 			goto _end;
-		}
 		if (boundary_nearer(max, maxdir, best, valdir, min, mindir)) {
 			*params = *params1;
 			last = 1;
 		}
-		kfree(params1);
 	} else {
 		*params = *save;
 		max = snd_pcm_hw_param_max(pcm, params, var, max, &maxdir);
-		if (max < 0) {
-			kfree(save);
+		if (max < 0)
 			return max;
-		}
 		last = 1;
 	}
  _end:
- 	kfree(save);
 	if (last)
 		v = snd_pcm_hw_param_last(pcm, params, var, dir);
 	else
@@ -789,7 +781,7 @@ static int choose_rate(struct snd_pcm_substream *substream,
 		       struct snd_pcm_hw_params *params, unsigned int best_rate)
 {
 	const struct snd_interval *it;
-	struct snd_pcm_hw_params *save;
+	struct snd_pcm_hw_params *save __free(kfree) = NULL;
 	unsigned int rate, prev;
 
 	save = kmalloc(sizeof(*save), GFP_KERNEL);
@@ -808,10 +800,8 @@ static int choose_rate(struct snd_pcm_substream *substream,
 			ret = snd_pcm_hw_param_set(substream, params,
 						   SNDRV_PCM_HW_PARAM_RATE,
 						   rate, 0);
-			if (ret == (int)rate) {
-				kfree(save);
+			if (ret == (int)rate)
 				return rate;
-			}
 			*params = *save;
 		}
 		prev = rate;
@@ -821,7 +811,6 @@ static int choose_rate(struct snd_pcm_substream *substream,
 	}
 
 	/* not found, use the nearest rate */
-	kfree(save);
 	return snd_pcm_hw_param_near(substream, params, SNDRV_PCM_HW_PARAM_RATE, best_rate, NULL);
 }
 
@@ -1847,7 +1836,7 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 	struct snd_pcm_substream *substream;
 	int err;
 	int direct;
-	struct snd_pcm_hw_params *params;
+	struct snd_pcm_hw_params *params __free(kfree) = NULL;
 	unsigned int formats = 0;
 	const struct snd_mask *format_mask;
 	int fmt;
@@ -1873,7 +1862,7 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 	_snd_pcm_hw_params_any(params);
 	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
-		goto error;
+		return err;
 	format_mask = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	for (fmt = 0; fmt < 32; ++fmt) {
 		if (snd_mask_test(format_mask, fmt)) {
@@ -1883,9 +1872,7 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 		}
 	}
 
- error:
-	kfree(params);
-	return err < 0 ? err : formats;
+	return formats;
 }
 
 static int snd_pcm_oss_set_format(struct snd_pcm_oss_file *pcm_oss_file, int format)
-- 
2.35.3

