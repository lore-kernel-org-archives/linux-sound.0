Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664273;
	b=xk7nV2bCAmmlP3cegNbvptfomDfY+XPR7J/7ifdrlXxyrpm9KZafuH0EkEBe5XjAyd3u
	 TMjTeCbor2Xi6yzJWYV19h6J7mWrZ581rYWLHYPFVso/2lB2vzijtaMKZttwlLzLn7xnN
	 rAVn5GA00111QWjq/T8jCXgqawgbDbWGRUTx1wRIPv51xGZpMjzP+nvVFBP5+JTS6hoCx
	 GYgUWEtmVHGFih5gHGVzLsVoY8trODYq10J7fY1Lko8wlwyR3lMLqO8dZID0CSBQNOE4s
	 4IJgG9wbsBLr56z0HiMjgO78osbXYsRCVTXqSSpr+HAXCgD39HHLwBXiTtYKqdqJkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=gGBRoS7UhB7eIhe9orCOPAn6EXkAOSnMrEgAwQ8pUx6A3BlzCoI+bRV3AjTWCDwkV5K7
	 wx2EXuap3taoaAySPv5Qx0U984PADggFCoEFjMWvoioTQRHpbMQOUhtXXN33O8pucndy5
	 gQp8PPY1hzR8yHYuuGchow8OwF8+TZ2ahAIbR0zvpsJGKktDoM1MlKQXS0OsyncRkvML2
	 oTfx1x80RdxSmKVWPckz2rU72VlfoJADdkLTmO4Y5JdnUBaP1l5MgKczmKFMlS8xyEzoI
	 9wn3EJdKmsXVXHBCMTfTa5c8yiZGwNmXGIhk+lL+1saA9StYocpwvN0yDPimEh7ZRoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS79BCWk;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94A606A33C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C94A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS79BCWk
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so2625543a91.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664273; x=1794269073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=oS79BCWkU6xOxfGT4UT/e1Z6abDqg4BH7MNQH7NPNeHPCedvaJ1IlsAip5gLybpFO2
         NG/Wq+S7Egyj1guPDDcpAwpSf+wPetmbNOI/VRhAZx4JqEhyQnj/oLcH+wEKFZGurs4x
         wMIB7nmljpE1m/vzh30edWmP3I4uly4keshKV/n9mot4Q3cE35tOuq7lJlXDQAFZjcKC
         b7fVDkAcVtkzhfuMS66ecM2/AdtVGr53iIf5q+7E5QTPoxTo+JoGMuwNLwPV11DkBa6T
         kRcMMK5x+jW1yJFQhPxADUTr3O8TeaZLK6W/Yi5Af9lAEBzgkMmnsObOHHt16AejS8Af
         HPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664273; x=1794269073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=Ba52Lh4asvcSlGCxLNi/HqZYsbogJEv8mQW94MAzColFkKhIEvupxPDj8HAYDkYvRC
         cb4n+flcrNJ7DFXoY4UDiw2OCI8pUJSs59Mu2yk8bXs69R40MrOq1annRz9pHh34ORCc
         YDOe4+EcJ0sirgw4w7MIpk2NX7LyzUIUmdhO+22vkFiHhw02RR5GEDqyt9RmDvPFIljp
         7nFX32FoaeBR87iSU5WQ9HgyIWhgCvXxxD52RC/OTfmnzJDowZ2sQyD67lphsd+YbbwP
         zJYj1iYdlHZiTH65UWM0OC15DLhPpTkhO1wOIKkHl6gEbyf9fCpz2dAQPBjNllPTD6vp
         M52w==
X-Gm-Message-State: APuU4Z/F9wg27MlvKj7F/LaLngcE7DVWgn3j6wT8yMIHqOjK8fqDNasO
	qHhV2WjZltnusU5Ez826QZSlmucG+wA2PdAncIQrgOnDs11qlnx78c/r2KurHQ==
X-Gm-Gg: AYBFou0q0gyeS7KdqMgintfFvJi84uoIXuk7VtXO+GY6uFuhA83Zeq/3Cbt4rdWbKJ+
	FXwPlhlCRTm19B/kE2iAV/VsS5mry+0bBEna1/rZ4yOtMgo6kH2iA4jes8DA2xR7Ft7gKDovJEM
	jqRo9Xx/6zX84GY7axwTxgsh0OSySHIwEUX4mlxAkHNAH5AjfPGqq0xWU9cVZBWl4MIo+lO6qws
	WOsKrXkzzz9xMbUnhbcJ7hQ52ryCU5eU/Z/GmLFXxju+Weba4V7B+AUyCv4oWakaUlH8ClZhlO6
	5FyfXApjmu38JkZyqolSdV+Wj47wdhK7O870wZEUO6tDcTOpZCMl3sgMmMcNotCN/DS8LRY9fWr
	GVARRxyJvZsU8Ro2L4CRkvOhRIU7dbYatnzVLr9Ue2qtWTI7065hXLZ2qlO+wMlTElV+/0w7R7V
	CB5GpYviZmrPoll03yPITDlDFafkvYcHlWfaHFNVmmR/A0whGWtyt3LS5bIwnG8GTI19up+V1OS
	erHERnzrKt+awiP0wP47EzWH0MAAkyrwfPtm+bASIvOjD5PfxxHY4RLH0+9uFslGGH7nUbU07Eh
	Q2zPH2g4BlprIBIsUs8S3O4gpQg91lQRPv+D2sdjw0aWUbnLXNB75Zl42q+UjKRwt8COThcAwVP
	IJ6U0ThZGyjdAuabe59B+bNJJ0dhn7q0ZA5ks50IgFvLu4jkA35m1xUkcF031IA+Gg6VR
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr9974284a91.16.1793664272643;
        Mon, 02 Nov 2026 16:04:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:32 -0800 (PST)
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
Subject: [PATCH v12 07/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue,  3 Nov 2026 09:03:58 +0900
Message-ID: <20261103000403.67106-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
