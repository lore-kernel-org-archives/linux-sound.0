Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464697;
	b=ZouBQqyPXePHE2eEBakOq9NE4Lfu/KRYDONYywXXkZbY1/+nBtrAkRdJHyanrl3V3eP7
	 YD8Kb4bCVVt1+pHapag+y2vZFboVZtyL3JB6ZzqWEMGmtTHqtSEX9Rk+XLmkZ0zK/zCPl
	 fsRCBUYg9Dj/brBOAQPSmJFlA2FbmC5aFFToxxIfLFGL1kTaeWHLvoKaZ0m2x6JwyGs4O
	 qI/iw3I3s0K0LRc3sj9k/+CGtPqSJesm6WaKIkD4gtmRUGjOS/m5YOHxKbuUo8dXW8zRk
	 BK13Z8iIXuk719rit5pxP47pB+YeKgu/abaxt2UCfsJDPIM/bPiUH7V2oUKb+vWGk8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=yqzRk/m4F956Rg6U+JVTuE01mrmnvaxJ3/uTw7JV5jgRFwE0KamdTidR1IYc3RgjrESG
	 ZAVm7mY8vJj6yEKtGaQ5+Af+xSDdrq73KNx2zm6qnN9qJz0flx71zKKtg0Hl8Sosoz/JC
	 IeL76Mnx/3RP6A7D6hxseweBIbxbN/JTCGAjm6eZE0hiUPyAHjD8MZwYJjXlfXjxeswhX
	 oM68vQFrJjaH7b8yWyV6pHlfpeR3uAZdnQO67n3cP5o+U8imvq4nEu4w54C5kD32WlM28
	 qhcMILaC2tpsklcQ5imFqfNsuK46SG25RluYhf5/Jx3dSyogrMP0+0ZwosWedAYksbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8ckgRV;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8217606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8217606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8ckgRV
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea7190aea1so16269955ad.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464696; x=1795069496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=TR8ckgRVmKh2zAdNhJOq28GIP/TT+y0Qxh5sVo6OGEV8ZmX/hV5FazpxkoqGgfsUAa
         XbYx/75DCDTL6cFz4S9XLOM249xvT9a1PyJCYjnSmaPbfv5OG3zCRsftGeuVzoaEAzuW
         Mo37Z6xuk1P9gU6wEgZMb1hQ0H4tZ8QefmMcwyHc2Pfha8jfdJkYIdAd2eXpCca442be
         Hugv4wclFzUmD/Cs9elZQbdbMEuAK00dtXGMXuzTHjBjcJtZKXChYplYb34GxwKzzkGc
         x+mj6w1WcasJvvkDxL8/k65zpgGvCWsDB+C0ijyEO4N7Oly0m6k+T6n8YIXB/WDm2ccr
         rc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464696; x=1795069496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=HhyZOcIwaznUyg7yRwWdgtsDbOpjbcWLCMcU5zUZt7C/QAARLlTUotNvYbGNuVsYgh
         jm5r+k/DDdpTd40ivB1sNfe03l4ghcZ4iRFWfNBNNqZ2UvXW9dZlqWGLZUOo/ha/jKfW
         4cE5Utkz0aCQ+IFcNFtW7sAospzfDS8KJKzV+UsQtJ4oX+JxQ24YCUcDu6yJytWyqma1
         l8HNiGSwF23IuI8mHPYL/zfQsb7w7FCUe68+P9wrtRmFmsHCmYdMZ4SeTurUTGLJTLPy
         ih1ZdWL8j1ilb5AsJl1uEgv8OsTvPbwaZcktsk4y6hd875N6mPBG8RVk+zMNAkneH971
         9bRQ==
X-Gm-Message-State: APuU4Z8GQ99/ZOKxHRi8gU5x3rtXCgdKZlwDmHZtJq14oRyQyQyjU7P4
	3Msj5cLdRWys44KuVUUScxVk6BwJYmFzBO4v4Td1ztXtQGtjmg8EeKKhylZhWA==
X-Gm-Gg: AYBFou2zqtaEzEJIo+PnlrA8YhelVJfhAKH0pC5Zzdolyjj1MkUhjcF6njk3po/CFKi
	wLNqRacKdckt3LTOCUmM/Mx2jNfy0SPZRrTEBj6/2Y/L/o8bIsy/ENe3pyWWONA8s612mzZ5Z9D
	uwzQo9z36Ok5v6lVOXC5qrqnBsujrFQ8wwzVq225z5ynsMX8s9v7D7qhmILTREkaX8MqAy9jfwv
	JjMB7Lx6WOfh+w0FaUoBb4xbwVY2ZvcojjtuAH3coMTjW78JxHzP78Ay3qu3wKciZWCorzHti94
	W6W8YIHMAN9EUHo7+xYZ4wPBJ1T1A64rjwwot0XIIW0NCbKdws5wMPewZWmKO4A8tTuEQF8Ok1j
	FbqKLoruO5HVtxINPMPu/YLvH7wVErjBC28pa1mCDAB1zLSKIrxyx7AMGpp+yyx9jK+bDpwjfCM
	RUmKURIjGGFFytQv15SF/EwJNAuuWZuH0xDxVV6Fjw7wcjuucnuN1/zwTCbroic4mpRfmM1YDsv
	Snp5VZTF8cP3js4xoztqVGbd1Ut/RUUfuXz+lgXjx7eIPs6qpszps18re2aTzbGDyG9AL78SJrR
	U3QHUW6teLv92to4tC1+Gihrz2BsEvE4zBjYaXfyUVOMeyOYu0bF2uvrvNPBYwxv4JVtDjYKvgx
	sgtNY+wXfW66uOY2wisHDIUSoyhcxs7Wyc2EBtHBuar1XPJs=
X-Received: by 2002:a17:903:1a8c:b0:2ed:a8bc:6d48 with SMTP id d9443c01a7336-2edd7a86c7amr46594825ad.43.1794464696003;
        Wed, 11 Nov 2026 22:24:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:55 -0800 (PST)
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
Subject: [PATCH v30 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 15:24:30 +0900
Message-ID: <20261112062446.159-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
staged-capture policy sampling.

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
