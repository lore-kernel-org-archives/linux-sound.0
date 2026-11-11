Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355554;
	b=sA+N8y0cW+YhSpjShAI8Hpj8ZuZDSflkMIev9x+abXhDloc9XLJU5Cwe+D68Sq+vJTOd
	 zB9ki7rLBnLuKrMrhztRWdPkncnoFPydpQ6f/W/D0Cl7Cn4eZjx9gYEs+L8CmnbWUQTJ1
	 9/Qf+o4y7J2Ws+4rnn8mEVa8cUIbMxiYU4RbEvT1VC+6YuXxXqbsKdO/CbmtKo7JjefX8
	 d7bfE2Q3+RSZ+ZSNnUyGWeiBpSf2j+vECuBVV+3ts4IKTsNp99jxMMYGiCrYBHjjXd9xK
	 Jdl9dtgL2Jv4l+9PD8T/mSnTsxYfFW+cRQGxYZoNkfpjM0IQVWD4MSxIZrbuKhacPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=iZ4SH0AVR/fOOEOMZY0B11aYk7Xk0TNyrBQgv7uOM6pz8INMW0Tu3rn2zOMUVjt27avD
	 Chst/SLPKZDVHVYNkuhhfMe4+SEK2XQumtdeTXgugQh73XFWy1vbwLf9RohLJWVetFnPW
	 P3Yp+q9Sy1S7QORhSnvsLRQvID+zJJCczFu1VTTDlYSElW8Xy1YYTuWKkxggMwcnTyQe/
	 j8RCTTzosIlZlPe6uPIFfMA+J4s5zODLLlFdnqPdMLZnt0jVONqKBpTvLd79eXwtpIC+b
	 0YrS2C4Nps0GugcY42YcaONzTqNWl+zWG3MlRkEIDo0NFUW3NHEuwyFO5ThPfRvMX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpV1k9cV;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B247606A333
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B247606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpV1k9cV
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1194657b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355553; x=1794960353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=MpV1k9cVRo42tR/lASLz7dwsoXaP6lc/cQKqmFLqaK3MhIAZ19v0VVf//zYTsvvzL0
         BXi59ypQMnyJftH9KWQwqfo22HKxPeMDDq74sEaKaPmBGoQAr47xWzFXWBy0CEtg8zc1
         rviZj/Mz1vOfCySzRf3KPc0JdvB5gVGC61GyGbDfB9ahxNfsoEvSdlglAedX+AtqUVoc
         02iaKuxfPAlMAByITTTB5l84rsQYJZ0G5SiK4hWarjTSjMQovDKh6Tw1OwUt7DyxGlwF
         aCkF1xsFszmsA9wJo6uD2XM5T9BESfES8jNSvbS5HE1hffyoaThQMt4OTQF3rDEGvXAr
         eVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355553; x=1794960353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=Ct2Tz9VABbb3yBNTxg45EBYb2QuhedWBdPiOsCCn2hRzSsjo1KKhvj9C9czuJL2Cft
         tGTIVZ8r9wE1NCQb8tnVDGTX/MBXaJYuqwPVB96Jw/MJFHWJ3DRXrptOEpfQ1AQGEQs/
         I/usq2YYV6Ou7ec3CrURetuJsbjX/fNuTRw1T58VhnfTAK73MsukocWhQA5T+2rvOzmi
         ZhnWdnkaQ9IpWjmu2mgrvB1zbrRLSMyEoyijAe6b/NNznNb5+WObg99IiwBYvyi1CniH
         0RNJOKmSfOWAnD7+4Kj1aFtEE0D7O7xvz9OVMgBpzAbino0Gcxcp+6mGsiC6wHEJuHCy
         nN2w==
X-Gm-Message-State: APuU4Z/Zv3I3G0kccHwgaFh0Xado8wi/HiC1RdHiDrLdO0YSfWBbctgB
	vGcThOd9giCWu49SsYq9JqpzmEsaWd+lxQHMKZYSqFXvwdQ7/hwdk4N/fjVyeg==
X-Gm-Gg: AYBFou0sokVTxXcdYF8f7JYlbplz2hNm/vvjQq1VFJ6EZcZERSuHvENg0UMmQjTmYS+
	FFGZUE09KxpLRXFKhfOp5sJTHNwjchJjs6nQ1Rl/b0CkTWcxKHC6dxTdXGA9R7+YK3hobugwBXC
	1gnU+5QCCe8obwuSUgi1jI3ZWotQpNKrmiRSBjLJxLrhs0ieKj30brN5vqTcgRmfDMqj5mF7ZLK
	pS28EkK7lZiihnXtKwpMjqi8p50MzwxzrnhDJCHXZ01gwFgtRG15/pPTZm70hmGFHGYmLO2gYQt
	uuaUXjfwNgWgSeySIW60UJUUFm18Fm4MOTViexfhWYVxljna/6FbQEV0bRNg+BQIdSPXRXnZ4iL
	WqiZEaxNSaV2eVePXHBSg4jEHKLxu6lTlu0mKdjUHoM9z5s0OkmOq9wWAMExPYvTE/6QBchmz3p
	8m1k3W30ih+8z4wkOIMICSbe/cAMJC1EL3A1NnzThkPku6w2TeVknafQf8Ydf9rIdYSG0ylnf49
	LA1+D34Uz2U4AE975TdSRQVK0CaYlAE/pXBd3xwjzMm0xXoyNIuLogp72ySI/7B4QRSLvyuX1su
	wDkPUbs86g23DFq0odwEvgzmQ/8JXf+2iFq0vJMlLD7ZZaz37KpQYkdAdKjV+G4mpDapAQc4yop
	J5lAoahB9aacAzb/Y+26a9rUjWFfIAwmVhyFedWQWb+qq6no=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr614942a91.43.1794355552868;
        Tue, 10 Nov 2026 16:05:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:51 -0800 (PST)
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
Subject: [PATCH v24 01/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 11 Nov 2026 09:05:28 +0900
Message-ID: <20261111000543.28550-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
