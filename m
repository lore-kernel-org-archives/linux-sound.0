Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252668;
	b=PEMH6hd/EgdXTJ0RrY2L2QUs9dhaTcu8Wuq9wKMfp4thkxcOWfnZeeXEJzc1vTPJoBAC
	 1wtzavQn6ePpjCZOMEbnrc09RAHmIOxwx/2fJO2M67UiFTdmd2PwJOefU0x76Qz3Apa4l
	 hrQfIZ5JMHLVPVCRbZ0KzGxHFNyqjHO+ITsK3C3ZEGb31MUK6NAJ0WzRW5AZbJqHRet8a
	 EVmWwdlJja+oeTNUdvZheZl1Pe2EmD6CJAKAsiNS5Puz4GsJlmQtybXYuahC/9gENl8rq
	 Kr1Fi7btbF3+lvA57/pKgHGoF1S4+EWMD3nq/Fi/56kTC1/FUNXb9RgGpe7w3BQ+Wqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=mPIsOc4dppHI2Ja7Q4dxxFI8ic3u7+BuKY4X8F+HRZ713hmL7vT92SSBC4bps23PaLw4
	 6IVEECe/QvWuN9g/L0iSbAXHxUin3COIqi2X6kDlyosAfGlfhBiOUIS9+ckguhlf5h2PZ
	 Qy3K57bDxhaF5Q3MXpVGTRRNBkJtTZV9mXU7RwwPMHyigWLncpQ4JTzNcN9EUfQiMuHOM
	 A6saljCi3UkTFxpyz++2dxHdBDJWVJ7cAILT0s18FlgyLNXIMTniTwp6U9ycZtu9Za1z3
	 yQ94v78sGt7U2iZgz+g4GwsotMNfI5Sp5haO0oDdNGMVJ3I26QqQqPdZpx5avqSx/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="epPelA/e";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89016606A327
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89016606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epPelA/e
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1054430a91.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252668; x=1793857468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=epPelA/ebjfKFIqUn76ZkmnCEM8hEnqTKQBTqZWyzD9GSxOXK9i0OABVBwkMEDQqEb
         mrp9w0LSE0NmyrG0aKBQcZzPaUQCMbYvJ2BJynrtADLpfG4Vz6ugsAbCaEBNFtgyPLWM
         3DvXcC5tX4J50e21gwS0bHS7YgzuJBauc2kTX8ftvjmb8Iji5m90vZ6bd8LH6+EndCKK
         9CbkEkggyvQ9g/3Rk0iCu78IkbvbUm+LjRYu7NDuUs1rkWsbl6i3l3qcfPBEEOulW7JT
         rZqv9uN6a8bCyq3FQrk/ML79I2IexbKQb9QdZC4h+jHFfsyiA+abn1GqUznCloayheEw
         QQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252668; x=1793857468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=WHwLOm1IkPGti36nnKgmxvFQl1KPPxpRdm4MCJMSIjEMhc9IhUmmqrtTOScMyg9GRJ
         YEFoowCm14VLbPb/aobH7lxukID4S1+zCqm8WawHPv7zo5kWgvd5KUh2PDn/vgy4qcRm
         biDzCup/C/p4NeOPz43eHFikbY86a+Bs3ORgep/r6B6+exj9g2H5lxWE6ZSYz+3fJE+p
         w9O2/Ij/Ws1zJIpss4dbFYaQMXDG4iKAM2s73lVKAkSNaki21YMcD5e30wqyEwORx5pZ
         1V1iYM4eamxCDCa2BBkj1RqlFajBSeqnBtWz3hxJnie+nQmo3kEKdasddOAPUr48Okgf
         W6Hw==
X-Gm-Message-State: AFq9FYJWYasTCBkXHXM1k/4n5Oh10mzaw0xl8J9gCSgcrUqMPZTeBc6G
	RnT0bI1HAIoRXmRjeEx33Wih5yS5wcLJ78MqwNPNkBU7wUTk9aqkQWHGGbu2lQ==
X-Gm-Gg: AYBFou1xjc/BsRVKFv0ELinP9UmHkqTjVtBLJ/Xxvp349p9YRo7bV2XPmPLYaHHU1re
	lrIqlbzU6aX2QSraTdWslV0xvLO5ESpqWxEukdzg62Jgewnulh4VGSr2Pf+Go7EQjIcwbsecNlY
	DHlGhMoC67I3blgF+7DdM0lZ25hvnsenn3j3AjfgfYNyF0gVap8NWEIqS5pQSUiM0LFWu+H/JJO
	BrHo1XA433DnAtzNj6rn9j5HxPaBS7C6trB5qeRUJKS5RgOhrkMy3Sl608H5C+Y6HIJ9wrU5qOh
	ohw/KAV/mF/DXU/+XQrxKvOrsHAfJG0KU6imojfB5S09WN4Ki7r5ddEtR7Aab8mVTMBYZ/2EEEj
	vI2Ph82VeLhUtIYRKyofFd3aIr4HRTMpxcvwyTnD12Z3xaPWEBqaTu9F0F+z8XIIRabCHcW4Rha
	u3tdtFJMNDiahC+EIPYgYRF2NI5MMSxhMLfu2P5GnXW6D01BhXjEndbN0wI+yPAW0kiagFg5lYQ
	rtRj4aKDQ0W6FXvccO8TJ5ZuPfBNQkXex1TfGELnPetEZrgSDwRbXixrcxx/FrfzUQXeZYjYSQj
	nLR5JGQ5apePRKKUnkTDcgoueQ9g/czTNGSo0U4ET/tm/1PQ1OC22f4peLPgU6MCA4m5cIt9Jch
	AsffRRXD/9EQE1wmo+VznPgy7xriQ6swBnXMzlt3T0me3RDQ=
X-Received: by 2002:a17:90b:3142:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3ae58362f48mr3595933a91.63.1793252667831;
        Wed, 28 Oct 2026 22:44:27 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:27 -0700 (PDT)
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
Subject: [PATCH v8 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 29 Oct 2026 14:43:47 +0900
Message-ID: <20261029054354.2931-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in the following patch.

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

