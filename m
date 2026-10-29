Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263872;
	b=ARo4JAbpx1K73zS8FMFw9Vg4U2KtHUKxnLuq1PPdfjLJO6aB4jr9uVvMVh8uv1FPLlOm
	 zUTP1qFrhGoHzgD2QIHLnLALMlogAsra/vZMAoyc4jBzK5WU0AZAEf1VykoWcXlYRIanI
	 8I81ujKvgzHxg5unwRB7BzEPPRU5PARp/CQxnergwLpH7LFcoyctqv8UB3cGAWXh7OeJ+
	 yU78PJ1OpdC99bTyo2Eaaw6aSCwUcqrNa4sk+1RZCpFBHUbNapshRYDv1BOh7rQ29N3xW
	 qTsjpjTL+C5ZlwEzGwrfRTq7k0M0ZtOVTT8tZvwaeMcppS9dcWk8oxuuT7hjV4leMCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=MwFgsSNzFYDpdPKGTYzOfRVqUfJPPQCVgAWNDdzlrS8WiNS4m32ELFLMd9c8wMiVlcB5
	 qYqEMopvLXrfUjkYbiz1OjcNFYNOD155zID00vOAApQIIgM+Xxf3OO0fQp6WIdOj4Qnuc
	 8a+HUOMmBzQgy2Y2KUL4BBIWn3XCBz9LnC6NgW0kmJ73bQBbeRs35Cq4pDY+OmTKVem9w
	 zL7NOp28WV6tLVsq1iIY1afaGEtNpZbjKWSbK8RcJL5jHs4qe72yhq034RKwFnw+36PjW
	 yBQuOH2mte8lhwce9RuItyjjoI4fmz5kyUzMjX2kgNzXnBNIzYLgFy6mIvxjbNRfm1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcvVyl1U;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6130606A31E
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6130606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcvVyl1U
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9ae391a05so3608765ad.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263871; x=1793868671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=xcvVyl1UK+hhO2fTI7lH5vns5F8yjWGhFUMSks+bbyK0vuanDc9OwXfxOuwnzJkzew
         rbQqQ966CBmd7i3OmFUq8Qwg3bHWKDstZnrIxjUILrNC+dD+7Zoy9M/ovJt3ITS+tvKl
         Hg6EUPhNm2eqf7hNzdBBs1HKFIlfLX0n5ragIz72/CX2aFItaGVdiRcBd3Qi2/JuqXCj
         u+geZUQpxGfj/gbbbTIKmlv/SC5GdxfMw7CaV+y6p+vQ91YHNUik7jymZ470grNl5d3O
         zvY9DlWIiaoaAH3Z2/jOEe6F/BvPeeGon4QSU9UePie1YMkMPzHbv2ZEBBCBTF0I0d1G
         btEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263871; x=1793868671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=yn+Tq5HUKK8hVLMAcRtaPJHBSrTi2e8tbVaI/X0T4T9ta38qYwH72ipZ16W44eBprP
         jbtQZ01T2SwJZxltATmwd6zyzuAuIPldyzjNzwguWD9N246Lvr/J45BZf9Ta92Ms8avP
         xd2RUi8PPEjOMJzhVliKtpQZWihNbB0u5zfwpigfOrTAE6fCeVDE+RyewD+rgXhKLanX
         e+qrjrihTsaBE9snobfUJH8yz+4/w0OPrjbcyBvkqeS0TePlJ0+hZ810hAu+IgLMwE1B
         9CPYwYDftRVzvnqbyK/5H4Cp6zE+Yoj0VBo7wfkuYWx4dMtAwdD89SbYxnyHcOOQvVmp
         rOPQ==
X-Gm-Message-State: AFq9FYIBMqTmvVAvHRNkxYAvkpIOTzaLoEMlem61ZxsRV1FBGbWlw7vt
	kXb7ncBcANg6Z6l5LQ/THLpDrNoRz6JBgetXR1IbHTW6RdZu7u2tjDWI1O2Rcw==
X-Gm-Gg: AYBFou2BkgFYCTtl8sOC6EWxmYehlykDkXUTTTpSgfpWjEl0ehOWvnpQudhFFpHQaA1
	qndARSnqSEK+o0TrGaIWMeAdjbidX1EAp3SxUlUc0zwH8U4YCdwzBKUQTQ61nlInyDFv6OC7953
	AvEpegHG5OYY6tdLBc+R7T3EUA4iOtrI6D+se2Ae2hsHJ0D6mNWlT5MUfoeqXhwywa2JW1PkT/0
	Q8+DZ0FfkPmDxTy9hQ956AP3h1xS9RyQf766ChnaY3tMfo4mzcMJrhjOaJZ6H/uzrrYGIu38lru
	/aexRj+NJnmNZ0eJ2xzzqT24kdXuK8T3PWgkCMWvfyJPY7kUsYNJothE3PqaOtmL7RBz2nSdv0a
	31Ms/y8MtkgdT3cPNPja7iOV9Y4nvHDqcBcGJoTPksv3lTCkKqULuGVPqeot2fi56BaOhxxPT3T
	+SDmc9I/PdK7TtPBMhW+yklw9fDWQuejMPIBrjz1pDmmid9JrAYeuxNaVS9iYToi6PQbKfRa1H1
	D7kS+zuffi/7xeaE87T1LvT9gs6J72ITw9wbsQ32i6uvrYZZpMFIMZl9/cyZb8IrJiDHL4byR/P
	Zmmsyu2BuZWn6exYCZiJzOlDyJXQCHZZ4GJ6l0P9UMYhxGfUIkQAwhBTYzBeOp+2HYHwixjue4f
	WTzqicH/bVPDKEdC/ipKnj82jiTixK0QCfq5gfdu4lg==
X-Received: by 2002:a17:903:19e7:b0:2e9:64b9:a338 with SMTP id d9443c01a7336-2eb1aab220cmr12773445ad.7.1793263871292;
        Thu, 29 Oct 2026 01:51:11 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:10 -0700 (PDT)
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
Subject: [PATCH v9 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 29 Oct 2026 17:50:25 +0900
Message-ID: <20261029085032.70689-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
