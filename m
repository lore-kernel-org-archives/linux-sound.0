Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338019;
	b=C0U1Gs1NTX2ACNt5q//NeVxL3m/lsv7elaRVPIipJSPBT1e3iahvk1VsoNRJyB67ngx3
	 06d+0CYoFgkYQ6hs/br72LnfYsuHMRa+41aOs0U59ccIhf0RCknmlyWPEVnhZorcZi0pf
	 758q4T6OQskc4qeCrOecSV9upWhxnVff9XgmAAT1Ja6Z7NjieGnoKMuKU/YjvISK8ktaY
	 QpVEnjsk0UYrKt0kvtUu91ag38Zhyhh1OkDjx25ZJRNrMuZkKynJWZjn0ukUel3F+7umo
	 lS2w3Oyw4rE3+lVt6dG5NI2HuH4HXkMycSP3zYhpJ4mxu7QRQ/Q9PFC8KFstTohI9rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=miba4A2Atds4Zl8xclrraeboRcdhjEdV647V79xXDM3HO/Smc+2Y6Vl3QAruY+QYu7n+
	 mq08uU/yeiZOzV0qeM/d+g6/H2cyMprN2mqQRHxQFDMWciGCtyzxznVnM4z6eRgHlknJ2
	 Sm0Etu2ZtvBiqyd+Y7/8831wTIvITrSbFIj5fEe/NctglNOQW8kXHWZL1jjXqycEyQ4wa
	 O47BMiHDNOLJGRb0nNsg3JGmWt+vFpbuW30Ybl7CThlFOrhcZnOsZZmNPw1j1SljhZUch
	 qGtUO6LjuM7wSuHoiGvn66VVGIx0XLhpr419Gds75OQ6OepJ/kJD+k8pMlaWDTLckzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3iPL2qk;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B02606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3iPL2qk
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc751eddf25so172661a12.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338019; x=1793942819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=k3iPL2qkrn5ii0cv0MZSTew3qcDwMegLK9e5Ssy7BJdyMTKpFKVgjYzaFCd7UPfFEo
         sF1GioGfBNgjXHN+Sz3IW2k05yHzp4LHwBdMiw8lCG7yZTlRfGGDhajnaaJSUxAp1Uhb
         Xj0k+/PoVpDpHq4KNlHhVOP315NCVmGWH8zESQNxGJK197CR4vDDuD+qCwm0lLycO2KI
         Sxi3WNbNxaThUI4z7zIpZnjt0CjEdEVi1HmojNSYt99oA9L+AlcxWzISdt4aofJ0utP/
         Kyz1wrOubpzrwcxH8+zMONt49wuIe3aVrCaXW95JZF4r+Fsl6BCrl5m14P2PEG5vIJ7/
         WHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338019; x=1793942819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=GEc23kVuJl16cqYDnCdNRojNdWKyQ3rJq9pKvXvjntUwAgW4EtnU8+4VJHxoUm2ZYM
         WYuel0In/vaLhmVkk1VbEHGbAgp+QhEj1aYZrI3xt9+Pcv4Co0+BgYT9c9eZaFLYqJYe
         ytN4iwGyOjF9EHg1i29XvchSd5Ox3EKonCzSs4ANJGh11eLw/wJjUKr3OHOIYCbI2dKm
         DBHWk8FMjIzVkXvAJsOJtFSn+hf11i8p7voKOWaCwS6ncsR0ZwIjUjf1sTwkHtSBMYYj
         5G7P9GCGLIVYsMbOnrZ41SFl8Cebl1KERHsCEABTKk5U3arDsO+swEqdaw6lQhTUFiPk
         Ad8Q==
X-Gm-Message-State: AFq9FYKzWGUYImEXezJwNdBpDdpqcSTqtkVxDVKng4tjFsqdVqpSMqWe
	ATfy86Ba6wTX3a6nRTTkOt5WE83e5C+f8XoD08aYYSx7vxtL8JeHi1d0CqHR3Q==
X-Gm-Gg: AYBFou1HgveFd2XCmKCE421IOqMOdnHm/FAaG3CErZA2Dr4ZHetQKf1hdgFQWQH6w73
	oXlxmgDp2DZl1Q67iVrWVQibmcbCeoVr1ZUsdFXYYFJcbuf5QtdARkfYmFNreFMvIP/8k6mc/f0
	zDARMsXQwWS1s/LSEbWblJkz70A7ncfwkJHkXlMelsha17Aif/Y/obaIi6nXclueAtxtAlEH5na
	cYO2bz/PuCWZ1BThOEZY5qr2BZ8CAbivwTQ2Czd7PTCTcPKH/asCXo4G9kKBY0/JxpjB/ufDwkN
	X53I47w4Y2mjayR/X02xZWHWGAo7haGrWOH69t+J/cbc++gU5D+IsgN4Db94H/hdgM4p65oWqgQ
	PDmfss57Hi11eKOPCu5kIuDNdhnQPz1qUL78BS3QH8OYxgXZXKVyV4nNS7nlWWSdoXj3mwCqdJT
	NCgOzxed6xX8oMImc1M4nPhxbj9cjkqCn9b46BFul1mUYLRIdwMoh0+q3pKEmHX22FaNrU6pJiU
	mnWhK+lOAi2V/4eK0OlNiAsBn4yXXqZXDMmuhoT93ltCkNj2HS9j7SEgrs3zRHOBskoeUcf1Cfb
	09mpAMBMx3PPO5Vhbk39u8vXptncnJGJdRTohU1EQ3Pte+Q6hgVxF4HugY9r3VRPPjwSwZ/NK8R
	p1WBmLU1Aw9brCCCMANwMWfsxrUNgtT+WMRT+MXPXRq9Ah9c=
X-Received: by 2002:a17:90a:e7cd:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae89839170mr906333a91.42.1793338018851;
        Thu, 29 Oct 2026 22:26:58 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:58 -0700 (PDT)
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
Subject: [PATCH v10 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Fri, 30 Oct 2026 14:26:22 +0900
Message-ID: <20261030052629.27742-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
