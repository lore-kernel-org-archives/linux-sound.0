Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981929;
	b=vTkH5VInwbW9V5cmPyw3hLzgcLYwmoM4P1oerYgbqwM5uyOnyjkpRc/v7a1GbW4cfdzE
	 MwaArP2kUS6/QpezRew/PQbtMBwTl9AWR4PANcXz8MIgQ1p9zRt+n6N8AWPfZhHzxHza7
	 a//2qMc84hKFjq7OgJ9YxCRKgGrktfQdOuLIBd5j2a/lhwr8k8X2xyEXn68PD92ycXlE/
	 NEHcEilchEOMdQBK5BXTVyDwtuEUWRe4w1GVJrRCm4Wht/lFCvxLMArhKhNDUlXv76udV
	 HNyCttqOXly6gPs7gOLEGUEjzina/u6H77k9vmHnrVq1WdpQdA1RlQK2cZw5zW9JOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=ZzUJRMoSsLQzcfEVHnJMM00HGQNqmrwdD8MiRxb7DaFYayH91T8zvtMPJ0dlDJ6oCmjx
	 2WvOTaMYeg8Jn794df9djVK874hWZ6DzLZt5L3CcFvnnYiqeREH1nNjTVMwZwLrZ3/Xzf
	 qyBrxAnA88HdKvLMocXujM3/ASCGtLuTdMp/jmDkEU83a5K34duS2D3XrSwSdNM8BMO2T
	 KYXgfvazDkuYO/dg8qmagX8zSdYsA0KybbhFBpVUbL5Oxz4Q/4hpQQQhS/gnhlwLu1uWV
	 6vmrT+gdnaW9qHqCDdI56g1G706tvjq8/iozZxGsXDOJN/Z75iLeyvvGvObyBYA2NUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMFFgtsv;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F618606D82B
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F618606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMFFgtsv
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so1671232c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981928; x=1794586728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=ZMFFgtsvkKDyDqvniJJOn5eDH4rdYDFBtMDrtd5ISMmvKFQ6hqu7694rbrkwLgCUlR
         NLN4AJCpIjS52xEmPJ76TEXopfaM9i+vple5wgMYG/NPr4dH9xPSfRnOGvr+OaXNWPTT
         b1X5XKWd6AuW1Qs7y7l6g/CP0kNNUgRF6yxY7VrZ736ixZvHvo0C7BHFTMpaQtaFM559
         B4ZiLjzw8AVMG4o90NmUiGVm0eH4TUT+hEaxMNt8glxFMSmrwLn0RY1f7Q8Ro+JF0BCJ
         cKtN0UPUQ8EF+kO5usk4USxkpPEEvJDH8BbmOG74rJo7RPf5GCkRHIJvD3CjOFZxCI1q
         BGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981928; x=1794586728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=dcu2cT3OIaeHPB9q0wHxLxh4EnI+zdAUk2eJtirUxT4r5of88btRYY031v+e/kN0BV
         6QcewOZkNNorkRgHxMqjxDRPWVTPAZdnguiXLGU8HLzhBZtZL92z9fHmU+wxHerI8a5k
         wCjRYePw9vAXkAyRGHvqmgjmNp9wIIgmi+i7MpbJXnOjezXQLGOOUXzf1aws09fs0/vk
         y8W4r4uUqRNMvlshuN2mv+NQyUKnBij9Oh5GJvc0eTpaGWJqbzeIfxWMU/xHXeiIG2zm
         d55ZefHCmnerKD1tLmU/jk5sS46FvBVCKog2v2PC0Y+WvnU6nhgEMyZ4VLmJ6ABt/D0r
         PjbQ==
X-Gm-Message-State: APuU4Z8dnc7F8wruXWHt2wSd156XJpNN9HsO5i/jz2z8jyAieJVaTrOc
	BUHYoHcwCfl8R24K21uApATE07uGD4feiK59orvYZ4JNYzDRZZts2vyML75jMVT4
X-Gm-Gg: AYBFou35pCRT/iBlj+ET57DF+koaLQaSzGQUAI0Jx/0gLOllkOqKlceuWTB4YsMi9KF
	3K3pU0aUblNNFQ8MNhXKuenk8R9KwRz73Je1hgOEg9ibSsAESMGE6l/97Fd4afXciLNHrLJvCeb
	P5zlH7xP8iNV279NC7OZ0KmBxr95ylHvQuKSSdFTUw93WmQLkhfkOmXLCkHjxTiKpgLvqpZiKZl
	Z+c4sNIBt2bb/MDzry5g9qq55KKO5C00VTqCjAoyCt9ImtmnjTFO/hl5NgbZB5UlWpkvyudwbug
	NAsRAj//ms4Zj2Qi0JGs7DrfagbOQJHzkfxySxs/jSapvoSOFClRD5++3KvArhWNZdKEelmbq/z
	YtrgPf+er16OeqgG9A/Lbc8+SBGpJu7CnWT2H7P5G65qIIhGfXKnneCPTnWlJ3Z6lRIsreBrbeD
	R45o1Qt7lR00zOtisxfAALsJyiCVaPFdEwcxu6l1aQ0yvB1Z5mDe0b0tkBjJHZdqIP3g5qOiE7a
	XRqhKKNMt/63zTvT2gGN9nfsZ+V5mDkQ1M7Ylz6CZ/FKT7dfFkzvfEKUag7s90HaYO+RkiZEON6
	bl62bgd3m8vBfU2R6MfyuALQdKdgRDxvFA4/SaQXIfoHxf9WTYO9SrkkodBkSe7t4D5pbQAZgS1
	oX7Wbx5KZY/01YeMq4VOvWIZvrlUfe4n402oefJNaSiWYVg==
X-Received: by 2002:a05:7022:ea8c:b0:19b:98bc:326f with SMTP id a92af1059eb24-1b25d31f475mr3820669c88.18.1793981926801;
        Fri, 06 Nov 2026 08:18:46 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:46 -0800 (PST)
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
Subject: [PATCH v19 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat,  7 Nov 2026 01:18:27 +0900
Message-ID: <20261106161838.94308-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
