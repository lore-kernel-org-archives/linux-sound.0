Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923614;
	b=lpaObXkFJX+iMM9gh6ghABfkHWxbQDSOhzgCjG0Q4Teovrnkf0jZCSERSpCh+/CWcQty
	 GjSWRlPosxb3QYNGm+i/ZkIbNgJCF4IMEfbiaEQbAMYGKiSD2s3MfdXIfC8wuc1ewh/Zv
	 oufAM57CQpDQFzkLaKZW3JJ3Zk0ND1y11RwEUva1RWJlri3zgzw1IhJHh89oZjYJHpalP
	 Tt70DUeBE0xtoPP44GQE4h+h+0i1THFn80tuciJKIfBPBKmP/ptQTE6tCFdHumTrTGgIn
	 ntQqgftpHsrJrTOn9rqYIuDskzdXDL7UGVzvLCaZdWhzd0KohoYdTowLVFmIvpFQ/fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=BqBR/PIx1SyPBKsNYxSCTxmUqcEpXgoThj1cUy+rwzlnhLgIlArtEyCHX3SVQPkZjVY/
	 aiRu+WNw2igM28zwLxuu6bysHQPytx9QOjk2MpiWQQviawfm2/FpDGitg6hHux2xX0A0D
	 wf6kA/tLDJOvO7slq1/UhLUU4psY2mk8LeriW/URAk6yqJkyrmhtwTO5q91pwq7DMZV4z
	 9JSexPtQfb10c6uA5nbR0BZi3e1QaFShDdLcl55Mjjjs1OQHpAiT2UvyZsnHDdTknGhVm
	 YHXFDb7yi/4lv1aaW5ym/MiumbUPh8bcA3sRvzM+MJqqwp6j7uaJp9u0rQYK9TDlWLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtC9qfoL;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8529606A328
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 00:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8529606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtC9qfoL
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1aefd1bf74aso96375c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923613; x=1794528413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=qtC9qfoLIOl8SwNDiqEg0PQFJpaoyL3MUnBvLMIb1ym/hUftiSXJXdt9XbIMw3B2Uk
         SVEBWgj+UVnCSlxt/jPUl3PODiiD2ELoS+/xGxgu7gk1I5/txZhCVJXWnP4Gj2PA6kJD
         ANoKqR65OYSsI3Uw53iGHgZkOS5CmK3B/UuXQWVjnNzo2JSSjGLX6S46ObSV8+isHyBK
         cDMWITKqP7ndTDTepn1KgStLqOiup1byymyjUR3pKQgZud7aW+pDqi8BEuwUstHJpbjx
         UheLtxOnS3lPLZrcCZMAsdxNz3yGyrCzWOw1rIqQBGHKO4QMk/GSsk3ANqTcGt5qfLA8
         CX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923613; x=1794528413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=1zLyzgjncyp8f3DSnzm9ZwSqoQ/Ko+B4+0lZALcBUXejTt9ekZ10VglZEXWC4rA+KR
         WoRvX9DyiKJAK01LBB5kHt+ZhnEW/KsT84y8IyxaqC4WSTGCGcaZIyEdp0FjPSkY4+pp
         Ltz3KH+YhqfJQSuNQAdIKCjXKhrO5GZPUO8Dh/RXphUo9di94lgJk0RlEj5lqkr5BPoL
         lqJWkwanfFarkbTigRiwhlYHSaA+5lM5Qh6cVnGfe3T7023TjzZ0qfv+1XTQCgXkNImX
         YXwxRc2DSRymJEgtTQfkeQV9DUCyvwGYHPal43ijjdkqIklzFBswCRo00nLKGFGwXQi5
         xeZA==
X-Gm-Message-State: APuU4Z8tzFwRtu66f3Bn6o8U2FnMWl5lDYuwYV8EMXeOyTVEa9oU8bGC
	bD5fQfzcJQ5C2JJrHqPDwRnMXy83RmtTquayNAPZF+8BZaUd7JWOBnVigtpT9Q==
X-Gm-Gg: AYBFou0DdfQdT/BGcI2oUeSQECqOs/MYA31vt5nhMJ9EUdJXwcp3Udd9HyaTX9FYJPa
	Qfdeo1lnueuJBm8nGtBEz7+wnZUAX8/R0K1E2izS6by0Yf2yOjwfFkqMEduvpMkqoIj/BZVYqQS
	Z/l/wY2cgA/rko+3t2kDdRb9MiFFOqJdRGxspuCMs8h6wKZvrrKs95LZpY/QGfYileOA0QPsZPR
	a0Xoq6TrPNBs+PdX/ydvxoDKRnlbRZ9ObAwsil7SEZzxbGXOPJXqgrCCEuA0QqO4DVWpTy4uZjb
	jxzJcZvFNR5WP+XwNiIvfkQdCSHNAOpTPv4pQ81Vjj7IW/v/B6+WFkQzDMH6TGe3x9hsqHzhys1
	YlPSxF3CRHLg1NLH3XqAgat7OeLUYymwJvGxvFzs0p8HXs9FYm05gGnfSc0cJgf/bWZQkUAdXcH
	0wjcpmI/zmH63azNQphbJ3K0qNy19FeCRWQ6a/HEKtvs7YZ51J3Wb3LYlxgslkokLAsXYmC9RWF
	M66cRLYyt7ACNBwUGaN+bDxxD7L+W6ssReHWV7FmtVA+Np7YFwfpp/jYzJy+qOhmA8/Os8F5jYJ
	OC6u+F26KZ4yD4hEsMRXLbes4qwvpcfX1vqKonN0dEc0mEJb0mI4s060+XfU5VQb9t7fkUOoXBF
	rDHGpAOb563b3X0P7GTcK+s0OXWwo0Mll1ECAeAQIt4wV3Yc=
X-Received: by 2002:a05:701b:260d:b0:1b2:459d:331f with SMTP id a92af1059eb24-1b24f4d01b2mr4820315c88.16.1793923612880;
        Thu, 05 Nov 2026 16:06:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:52 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v18 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Fri,  6 Nov 2026 09:06:33 +0900
Message-ID: <20261106000644.20460-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
