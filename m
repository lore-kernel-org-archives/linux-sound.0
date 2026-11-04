Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758678;
	b=MHBj4ivbUmY0XuefTkCxQ5owTS2+vr74m1ExynZYfTjTZ0oI/anmvnHElawSZLGJ/tre
	 u25UhC//szqjsEojFQx5+iZ7odFOytl2Do7yIQB62DdugNmiW2sOjrNHlhCrslmGiDhBj
	 scfnrQQqSe0YNx3NCdQ50IcmZ7rQfp1eccXrMHUmB9+SWfEVb6lzJzhtjn+D9cCvrs8rD
	 EFJJxzjVgk8seoY4+cP0H5g6CZabkb7lGVIChwYEw01esbiFI9LWjToj5ShXaYWxrwlZb
	 xZQQVv0UjoYuWAN3/GZRoRgi16fO3dt/xAUVDBm2Zfi3e2TuYh5zUBy7rPd9P4RxTAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=nRekeSSHe1DynyCMjdFhrlLwekqVwab7gTYzNlMog5G3EMWVrQfYD+V06xN9WcEpMOQn
	 H+siA91Qh2m/HenuBBrBfGfyUsJfOZO5khxI+U2EgLphfnBY7buYY4whLXK1Kv1qtS1tg
	 MT8kTa06YkSxBDSD4F3idciyhzBltjlFmxhpfrRDROr9ZpuLb9Zf3shDKzqaONErE4c6j
	 KQBoh9p+uTYm9QJLfvyWgRuAGkUJ8f6aMvnl5QBc2xgIWIywUhM6s9R6Lcs079soujLlC
	 u11hbqqt+CaqtpBrb29ko3PWPYmDNZMWPEXuF2Ezp+7J6n2hPBpitxk0QaEE9KygJLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXVJxd45;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDD3606A32C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FDD3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXVJxd45
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso130537a91.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 18:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758676; x=1794363476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=VXVJxd45zz8QpVB5JFLOxvi7OiNrlNeel4et1ZZx/4I1QqBYe+XSER0oQowVoMs6+Q
         CfpH2MH/ONQQbQcOeu88iCjoW0gQ0hxwD+Y8oV3h/863ZXSTZ2jwjyZNqjCSGXWmYAHL
         kn9cU/6kB+MkIKImgHRourQpaauVeXOh2fVKr4d8R81i2yC6397IVv/1bWDKGBgeeMCS
         +XGY+c70W5mKXAHPlpLGA+n0sMhSTvYDLnkH2CbmFrOGISjEaoERAZvS6KimqkxjPdS/
         UA19cZswZyO8X0Pqubszxqfeo979s8FSV0Mhp1W1YKnaraBf9+37PRV0oDGEneWxmnZu
         TjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758676; x=1794363476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=oiiraj/Va5mceAx/C4FRVAeRrFh+tE8xZXqK+yUCpJT71b/S6kIoJSnxFx79+jIAfG
         sefJmPsx0iJ08Hc+FM7JQXUw3E+7ZHy/hyr4g4u8c427ESn0DBmxpitp/DG15GXvVrFG
         fN2hY7hR7ffT5cUOBIJKYXuZyY1ai17xyCEhtlH/J1+8sOog43nAY01Gz70O3WFXk1fy
         9ssTltBaF7e3t40bayyPnpgfd6tz9bObramUikKfr58bmSbOCAe/i/IuXyPHuGiXBKBc
         k1slkBrdinrBsSrOtHW13CpMQr3uvl/2uvaub4b982MNvHiMPcMnQeuWz0NejfMEBwW2
         9nVQ==
X-Gm-Message-State: APuU4Z+KMMDmCWvD/moACfIJ+dNRT3Mf38zDFHSz/J4PKjh2IRyXGnUV
	p+aBY2wgN1U05BN4PnYgu/5ZX/6B5yW8EdP+WSgeTM70MJekYUghA8qBjjp2ZA==
X-Gm-Gg: AYBFou3cG03tUs8LYT2pZsSkqsE1xuA0h25487si+U0/QiqqEbthOnhRAr1ACE5NvAJ
	+WU5JX0u6os+u4WvSPtj9ay54VilgreMYZkOn6BHFWMpiL9zEgptI56oDYVf51K031RuB0eFmdD
	qOn71NRUonoerOUVcVCesA4Vml8fBND8i3TdbNfflnCo6PJOj4C3FeYrB8eplID94Zs9oeYgbVP
	QcDjbTY2BirJVM07zzNgbyNqAfy7l9S05hweG4JVjSEixVLH1lTczWdytLoBoltBhIpiedvinHV
	a4pj0ZpBGGlT6+W9YhJxa50ssHi/kkQLYKRgO070frTZPhw5VGlwin0elZtDq+V/HYYt7owD2Ht
	phQaIR9ZgDTQKVa7qtowtuZWy8ts+cQF4CcWvUza+rupAc7KxpQvFKEtVaaF01y+L5f1bpH5+eA
	WTlV8jT0LUN6pSWXda56AswzaaTKmn4sJ1rkd8J169lGdwxQ6FkOUklAT3vNI2QOOgcW5x2uUCe
	GkZzxRHq8zhfhg1m4ibFt0GjCIgKhhGRIK4KWzRJwONz/dJSrRDOuus1pIsrHg/b9miOLgfkiFJ
	UpE6wSpizfxf9aGyVkvfeU23a+CXnV1x3cBwUD0BClf67/NsdPEP0iPa5AAoDS/9kDkiIff4RkS
	HnTYa2xvRtQhzWjdJ/TUfs9p26GkMNiGUHhnBzvxkzfJlivKwjq66c6dFYj6AtmPaHfZ2
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr11117473a91.37.1793758676321;
        Tue, 03 Nov 2026 18:17:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:55 -0800 (PST)
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
Subject: [PATCH v14 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed,  4 Nov 2026 11:17:34 +0900
Message-ID: <20261104021745.57733-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
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
