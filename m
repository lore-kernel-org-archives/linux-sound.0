Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862539;
	b=MvQSCmHseM3uH5OKW52b8U7JEka3YAnB+I3zJ4KZE87NuFlUplKqIOLJ4YzNzhZIDqe+
	 wvWJUHmdwvNx1rnPEtog7IRw/w5OIrXRq822edTXdjRCg1ZVme6r0ar+fyKGUwRAGb4p8
	 yjYhtao2Dip4kWj2Jh5IP2ARthuIbTAInoFCJXDTG+nn8FVQS9aI1k27NyUNWkUwut6UY
	 pGPDb6Oi1/fT1VU/Sm7YMePCrBKdcfGb+EOli2G5Mp+3Gg9aX8FeKmZFs48LQ49k6DfEx
	 AaH5YLQzVNQc8on8Z7a19lu6XgL1bsNZYdhW8gz6slpsNLwVjGW/oHKOF4364DrmlnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=NKY94NZ1tsM1QxRjWLH5EN28j4L3kgAvPwz3D84qR1Q/XkcE/nLgUyw1kHHGWJkplpR0
	 RBROLZhNQS59bVzLGeQUTJDnylos+YoHL0fQ1DbgflK//6P/tsC4Rns40R/Z5sRueD9ha
	 J68xY7rpmeMsxZ2yuSYUhd88OmgxwARnZS1C/ZoPZ8tVfLqNUeGoEtV/HllOZlpRi8i6r
	 rC9zWqTIJx//iGAKSoq2H54ly4q07EyBuLGYGLiRSiLfqNvnGnnAIomheASSoU7mdCiCk
	 QXDtGX37IQBAqpKZ3gUXUHNgMfW7UnjQXplwdAPMTYU2OkDVBU1qWtmYRl2a4LKLUNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRwVEz9S;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B56606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRwVEz9S
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so2995091eec.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862539; x=1794467339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=JRwVEz9Spf6C1WlqEzlOYtqnrPDl/3FEVt70uoSP8uLaseHiniVppo4JLAbiCs20qR
         c6wQbZe/KPAw03GtZsrSsPxHac+nWAtewASVK0BLg0RSl9/RhGaHiDAYwwYHnAPpBzJq
         HMB/YlhZCLrnUZY6gJiMSZ8kP+/liHbofRzxSp7Wz+epLQXueI+GVmnwQGeBG1xHTQNP
         ZWOld9weCKequkid9nybE69agS2rWyJ+ThdpLYyHO/PK9Tp+ZKKx4caLn7A5THW9WL5i
         8R3QveyJewGZ+wXT4/zqer143B6ch6/BffENfaZdiulZeCuk8PHsHzhxWN3ut3ofmhim
         XWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862539; x=1794467339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=IVnwk2cgVBij5tBwiYf65qEicKS12ldy0Kx6I5jKRx8IkYh9k0GPNbHf3ujjVnRdN4
         U3a0BWkK+mkltbR/KW4RBA97Ll85P+mkNnAzESi6Q/rwzvV2FfMoxbV6XMfUg4N9XcsO
         a695l5OzmNEZJ5/xTx9m4SPsOHkfcCd4oOuOBXQnjyd+rgaNDOHf9n2Z1RIDuQfk/lhZ
         sm+00E9nqaP7AWy4J/0ugF8uXVsrCx5dD0w2Q8pWrouzBW+gpbl9VbGIEKHY30PbGPvg
         84YVBmcbOE/dXDqFI5yUs2ljYgaLO15xm8KexrJ4q4Ga5YUw4ZIh9+ODxOsHN9N8QwNB
         Szzw==
X-Gm-Message-State: APuU4Z9vkfKJsvxMNlc+DCQNhpENOliVktWVY0aQmRdeLWk64va1spPf
	76i7ppOzl/robA2QPlJiybHroggnT3nb4Vb25CCVarOVQoaBx2hueSC3N+kojg==
X-Gm-Gg: AYBFou1/l/+klKI944Xr4pYVdkfBnK6GGYWCBlSuS030s91EJn2nZU4dRTAabBl6627
	5N9ZjijtaooscKHG/mFUMwDq4LpW8I49N3rkV0iPF5bJqLcTAT1qlaZDBHC0JiSbDB0DAKimo+l
	WcD5KsnUYTxfSTOpxDwrmoUN5cXixEK3PPMCWWth7ykOdnAC6PXZMnpB2uZO1zttbA57FuVFUFe
	/XnvfK22DsuRwti0vGpFIQqqjC4qLCHBRVz2IiuuZhzNZCG7Fcyhh1Wh+XRzGO//aMlJCqYLQq/
	mi7iAl93Zv7Sg1w0BOUtt7t1P5fH9XDhLDQuHSb+4UB1csW6F2hnjYMeTMc4D7XnMhw/q0WdS8X
	Vvy0xO8oE4SneB+4MADiDonzjI3j8CmlR4KaBDoJzXk8AM+8ksEV0qJ5Yi0fNZB731EpBNwazy2
	w7yP0PAZGyFwzpLt24skmwMToP/ITwKDw/5t7nBWsx6C7oH3CgoYoTtvdendFPCfdb3tm2rScrl
	2PH4OVrIxEyvXAIsdVocSBVT9nFXTtWgiPJW3P8GF9Uv7D6kknEyf7zz61QAW31rQ2HMPiG/TUM
	4Q0R2egvcN4BB8iuNeFg8Z9VXOv8CWU8JEw9zdqg8bj532YBAj1/qOz1UN4yLs7m/bYBCsr7IBc
	ngA9QrNfnFcSDw1iggyBnN0Hfc61txF9Yk5rIIBjfwnCGrXJgM2FbGYVRDXEK99w30mGF
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-36a423408a1mr27277012eec.8.1793862538357;
        Wed, 04 Nov 2026 23:08:58 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:08:57 -0800 (PST)
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
Subject: [PATCH v17 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 16:08:34 +0900
Message-ID: <20261105070845.6449-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
