Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693332;
	b=sLj8+/3TjGD2nJ1eeEfUhwHX5Ry2kImT0R5n1MImibiq5EPKJ+p/BSk8uNEF+3zE68xP
	 mzxPgO1li2Z5Ah9vnLRkAkXJ9Et3i85vDX7H4P5jm6nyy2KWsydSY24F5XChanS7WI7zD
	 Ppu1aW7GJMcWx2Nm2IvozvScPjVsvHv6zR1/ZSldEWH+52fX8kEEJK+cA29D+jso4DxOW
	 FxcmTSKwqhJXJyW16OWi0ALDVHa/F/j8mMx5lxz3iaQKtWIJpLb+FG7sPqcBUS/kdPvWk
	 4QaAAp0frWcpa3DCCAZ6tfHHjaLmzAH5JEWEhKERUB4IgevLz9eRyneMivr5B6IjKTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
	b=zbQtmAZu/6dWtYfxn9Fv+ZbuZcR5zbxamomxywUbD2QmKhpuUjyJpS8oWYc8X6YopuTR
	 EqTbgIc735B/7UwzSdvCW5F+Ew83wQLBhaDutFb8miPrGuDzCT4lnTKGzAWV9OEJEyeEl
	 USq1FcHhtLCKejWf/ptzbNOafsystqhyJwV14Qo1ylYG9K5KsfG3BJTjrFK/t8ZpuutDy
	 HvKabGEMfCbO2R6XLmzY/mxFBmZ4fqm9o6cDTWlv39gLklbmy7FAtx//Th8nPXEL/Nkub
	 m8R5ktv1yZDRdLfe1SNX/8MYTyftKqbdqhwT6g/QEXS0Dbnx3wppJKeY4uocACS6Kjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEZPp85k;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB531606D807
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB531606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEZPp85k
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4677738c88.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693331; x=1794298131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
        b=fEZPp85kJlvBbh0IJ2NzN+HSKzk2HejEAGocdGhx/Od5ZxC8dP0Dvp5hXSD4y6R6ku
         Hi/DQPgs/7xYUIaXnJ/e5yUoDSnFou+M1zWVqGdLxCVdCwQuUa6QjcZtW18zjpynz4rU
         Fv3/+3s4BYDx0bzbGROcu5syr00OBdnrX7Bjy6YbCRx7RxlkTkwwOm9pRO2r/aDPtB7y
         5+vGUWRF8DKKj+4TbY+c5BexZNKNY2w+j2qkQKF8Iw0vgWWC1UMeSgilJN0DH5RQRdIz
         l/sRsRUKElhxyAx3P49AIvN8/MRhmCsshNL++5p1h6drg851LOgerUalNLnyEfRUIfVI
         SB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693331; x=1794298131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
        b=Y0YMv9mDddNea3HcNKSPF8NHtGfZjZhEm0nDfV3sm3p7sEYGvXKaQFG0KyRgvcgCyq
         RTTfcCrM9fYzV/va96WRUHH+AYslemehR/rkJgbCyiWca5MR/5mQoSvGb8b804Kr5+5Y
         hI3fUbUhLet9GU9LRslMeqArAC7R5xyYllFvNKQmeyEBmtLtFg7a5iey4XoFriH05aUe
         VQtLpskXw5CUrOx34NmVdnhIKqBumjiXHuoE+vsl729/c+dPkwk9zPjjRkmULe2DbPFv
         ecDNyWrjuS9D/NDYmtSwSI/fKwSvKMxQy3zq3V2Ii9qLs5AYlYjLI4qe7z3F72bnrpE9
         tJTg==
X-Gm-Message-State: APuU4Z+VUvvClWvbOQrOXmmwKapqa8bugQYgaC//htuZMUyP/s0o/HJB
	m40p65DG0zfDrG5zDSKpC3NXWxgSYOMfvkU0IPOWogWON+PxGx0bVjQGokKJ6Q==
X-Gm-Gg: AYBFou23qeYiPO50G10yNxXJufAd+51dtffOtcOzLg9wggyv421psudRJkB1nIV0Tfg
	awI2SZSg91Vsjh+8Gy+G3aOb8VhYrz0L0yvP/TKxkNjGBqYGd2mJtt49IBFMrweL9KXegZGTZlA
	kCKPCq64uEYG3XfP2hYqYANa+I2kjFwnBtlwFde8DPhpcHnHKDXWQdnt+/HBqL74lgwpN51fA1S
	RjB/s3LVJNkzQjhMECCnRNAS8vNymU16ofQOOdZt+15bN6iW+PLNPpXzQ9DPwZbf1hAyA+3ROuj
	GAY4DbU1Z72658VAjNfjEOLlmjJODkGWAsGYsT3zvcHdfbcohw2zi6YmHl36Enl507nfRbgGd2P
	Js4ld6kwwT3n1Devi4Z3CufQN9X+sPYmIl+nGGJ/r7FSPjMMIazFUpGXdBIeQQCdMqPsL66Zyjs
	85CDgaphQ7fKr476ztcJAvx3sBGu5JtaJnX75yUWIeSkGe1j9mPBfP1xw7KRCwFmh2H1xMM6rlR
	Hpxdvs4q5bAbPjy1lfkkjYqoGSsm0sgaugHVcoJw12scMEL8eWHQ0Cd1v1nzGEKHmqgeZdtUYix
	t/ARGAOIsG5zykpqOmwdwOaC0GoYuqQDYnjSMQow15XbRVTiLBTS+0g94HnBvVJhOwiYl/43Dqu
	nKcL15OYK1Z8EMZ3Y0vHQbAHZQdG4tg2fjs/z9FYbd4QY+JMHp6SvAr5SZMyp160arU/Z
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr17468985eec.39.1793693330692;
        Tue, 03 Nov 2026 00:08:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:50 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v13 07/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue,  3 Nov 2026 17:08:16 +0900
Message-ID: <20261103080821.16983-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
