Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837366;
	b=tYNnSALFurP3veSMiYEr26Phjvme3i1hOznHbaHyY9lFM3SwqgBGxIcOK0M7+1742qLf
	 6/KgVB3ttsXEZIMqrCYWLi0qs0JNTqGBXEyZ9g8mWHMFDZ82zGw1ynn46X2OU8wZwwS02
	 l4sLxO6069bzLAP0aAmMMssyyZb18w5jO0Rs3jEoPVD7bj9zYQ+mGRS/91VG56gRzzrO6
	 yZxYhVRVPh2IYOEIZNqgWT2ju8wnM/zS7Tra8MXKJQBZDWGUf6CuFjHzEqItXEpUkjmYv
	 XQfio7sbX2BOZbdoSB9DtQJRiRlRTl1Tv48xmZCCB8Kp7ZxtAX5tWwprvAG/rFcwXOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=G063b33ppKwzBqn+pqxuSaXDcbf19CVVprNNlCUVJMV7MfKumfjGThJ6EMSycVUCmlvj
	 c/vs8MzrGWD9d/v+1KBkYOD/4N2p3NYFJdI6JuWnTcQmcAFYr2DxWRnZSCwgGfPDtVlgm
	 fmDEQD9scdR/w6hz43l8dO/oowlCYMd+FcKAMqWfQVHYuVSllfjnthQcnpBWgsnYyFJpR
	 QxbueF3yCWb4um+2iUXzz7sM2e1jW9z0gkLzSM2yA7y7KREI6RU/PHE+ICY/RKl3hmFGH
	 bHuP5WWwiiqAwKCQ9pT45WKVKzRX0PRejIx5hYiZAqJQrsqtuwQTv95wUSu89Ia3Rvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzYiptT3;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C32606A33D
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C32606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzYiptT3
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so19515a91.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837366; x=1794442166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=KzYiptT3HMTpwcUEgKTEdOZ1adOzA45MiGDH3xRGwEqKAkU0HIBEyOg9QgZ5eDNwIt
         WoJ09SFTFlA6x8W4uHWRI7Dr2kKyk5pkPrcz8swIRzka6lHPhIqFij1L+pJKyRmcPeaJ
         AhyIR2aVfOVRTG1waXp7x7jMI3m0u7UtabMGCq2TSnkXlY3Z981jZwJ15eut/bcCBRYk
         4r08iNX7HUJltHCiTqqmfyHX1+GOoL1v/6/egB1yH2aLEXKDQ6MjDQET677xtfeY820X
         0U3ZYSgKUV19epd+rkM6xY8M3GFLZyR2ySllE/iK1pE/o6mXHl/6tmCQkmiQxred/Cqm
         wkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837366; x=1794442166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=JmoH71Q/Fcgc31bZxpSuk0xyhy4DRnhyUQkrNfAshln7M5AGRJnpq9XlFZztdCpek2
         +xt43Cd6aJ30lk5DfsLNpwe6wKcuWj4cS+NVvbg1jEodCS+RjPEGvsj2RELMP9//dx+D
         w+ORSEfXps6jA5OC36kWtK7V1uH06pl58IY23SOif8/TnyoezwUOh23sQCP+oQR+NhTN
         Jb9stnjTSwNTUFEHN8mtDbdfDOfrc/xHYelZIUih3/MFZnwEmOn8wp41sUU6XJuf40fZ
         EqHkq8sBKq/c9I5ILxyP0W64gvrt/t9ofqItYrNH3lwtsSTU/ZoqGJWNQRMgdVXxBByl
         iDew==
X-Gm-Message-State: APuU4Z9unEqvwlXwkMGy3q3u0cDyEISDNvw+4oB/ZmqtgtxrKyD9T0Qi
	6gejyAJE4ZS7bZhC4rSY3DtFSn8TCN4OAWTl9vgffmhoRaq7ME1zQAEHjOoPpw==
X-Gm-Gg: AYBFou3tPQzRL02hGAB5KZUcbrW3ozF9quyWWSZE9PT2IRbuRQtxcpCMEE6vW1iTvmb
	dvXkNVNR+vWnAvMzNNNQEQbnhLyUjjmytwPINePcTLyUI3CdcJsyYSpR8TnGbGE0PwQAG2upb+9
	AVPPqBOqM43603jVLn3boi5v2FtkTzraauK9LuXsZUP1bhb9U/YD1iwZ3lZKEO5cYeRKBx4VI9b
	LiR9B0c9ZV0zvEYqMbW+L+ZQXy7T5KO0Jbd91zQMsF9VX/h87EGFHTXF1NC0g053KLtjlG46yNB
	o3jdhDBpIIu6z6sc6q5bIwMw1FFS2dcHNMgt14ViEOungGD5APLsZyUmPl0A71Q3WuuV2KzWbo8
	dPxnLcewJoFx9zgyQcNdlp9m5rB55Vkug3fsqWUjduwmWeygPp9V+VB9Yx8EwMugXNI3RJlOTu9
	ZyMyVQA+mQEhbfOofK/2Mpk4WmY3M+OVp2Isfq5UO/tV/YmNFFEQK/gYS5XO85gvVV47OTE54nv
	wRdPzwN9E+N4Y4F9kBBOBCDeRCCM0YjfRlKos3j7qatQwrR2Ym73anq0VcYlvEiLtvA2g5szJfv
	BR4vLFDNiHbxfiGVO3SdDIRPRhtaAwmj27JwAQS/ErCdpeuJNf5LNPRm8aF+lXfgnZ05G/apX4Z
	qQDin3azxJNa3UvDrOWVdOy55Gyb323D/jEANaDy/00rWkUI=
X-Received: by 2002:a17:90b:1d46:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b0a37a37e4mr2097706a91.25.1793837365788;
        Wed, 04 Nov 2026 16:09:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:25 -0800 (PST)
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
Subject: [PATCH v15 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 09:09:04 +0900
Message-ID: <20261105000915.15177-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
