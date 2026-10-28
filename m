Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156036;
	b=0Qp2TK/hOj1eIKLbIiBrJMSt7b0+FtsFEKnjoFYgwKgYJ4Gc3VO+7YsJeCdNEqQ8Fwo1
	 3zPGdtOk+zfHBtAvTvKIYcmyManaQkkidiITKzJVGTVJ0Xum+apIEmNm2kfKd5Xl3zv00
	 m6QpWoK/ysPkIRb0yVpL1ggBmfxaKjDcg8q2/qer5TrRDMqHTdFJd6Uf4HraFcC8qQOJl
	 ocTDrT3IFH8hNkNlaVMIqrIWa8CbMlI1MF7V3aQmvszqYp62pe64WWfXATPiQH5kXP4ZN
	 5jUqcS4kBnwgjUpKvTBpa+tTI4iKXg1RDeIJk8aRnNAjApZ/6xHfvbDU/U7d03Gmx/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=LPMRPRQ1oST/Q7z4nDZByQ+XtJFU4n6FQG8JGojVJUMXj7iwzXeJBT2/0lGo2SKVQDKJ
	 wb7divct6s4NZkbLOyPqDEfzO6QGN5IOqlhhuQEkYvm43qDT9DfXE8THXC95TyoG/HhoR
	 IK4TvzshyUGwFY8r6B79lGdea0uK1E7gL8/rplLG3HpzubEINZBwuZARojRNLKOa7VSa0
	 u1mjSsHvVexUvpaeejGOXgan/NPvQxrTLuUtRlL7oJihDSD3QRd4Nh3HX3DkqbwIEu/9M
	 eWBI8u7t52easRdxBpq9/acuehrs826i3zznFuYAgn7bEATf7Yt9fQn9KeByiN94keQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtlOS1HN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792E60A3807
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D792E60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtlOS1HN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso781177eec.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156035; x=1793760835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=DtlOS1HN/lPRDERq/L4CWKWOWJTRrPcFCxqObl76LU7v3PRxxlWsCZwYTccQ0vLfkI
         VGzYHLsj9oDMkYO8RMbT3lRkeTZsfbifPU4IKZdHmfzD0+bjzyb/x7a4onw1MFc4rY12
         c7QfGHjSLX8rw1VMNLuFtckc7h2amQYjzghSuYkZ1OoOxgqFli0eDklrSKKz5RP+xv2y
         slMZ+0vFfz4KzSyKI873S5FI1Jkp3UxJeWySGX4jHbpZT3cvpDPWUWADukPOJ1iloYW/
         mitXvsrBhSJETdeECIFpEaf0txh4pir4cPB3L1BfZXYYvOGMo7uUOFoTzzw57obw6TEt
         uG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156035; x=1793760835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=sE7QkD7lvjaC6E2/KCV0vBwmQMBwyMCXAMdwFVLPYZV0b0yrz84233iT3TaNZW1y/N
         fXelBAZ1c+deqIl+iiX7wC2LjuRlAqx1vIEIvIxCPF/NYoE2gU0mgTja0DsD3iApabTl
         rAoNckZIw7EpCwtgYt5hcd5Ip4FqrKAJ6C8S3z4mS1kVyS52QMYWIRkJvbIqb3nQZrl7
         REbCLJrtyQECLth8vW9yYl1AaUXp109CRMQ6I6MAh8UNV6JHa+fm5//kCw7Mg0PR4QXE
         ApRRejmWQG69zx8UNwHcYVHRYfZFSmHXY0GzkuXqASEoWOCz7dZM3/EAw1gVILBTY/B9
         1vDQ==
X-Gm-Message-State: AFq9FYKHhs0Q7lRctSeGc9qR+J0/VS6SCAsXQbut3E9dyRavVfyeB4Nd
	0WUmB53QPCB9D3/InGkXX+mU/Y3xIk3ULA7jIOCUxXLfT+rPCgpf7yGQi9kygA==
X-Gm-Gg: AYBFou3pUiEGppf1uVwmf75Z2IciCOJ/ShgTepVoG5dj1bYTLUfhKv3C1WYOzVC9iAJ
	Rein84DP31E+CxTUM4pBc6elpbp2m5iyNPTe4wC2UWbRQb7S0dCEQO1Ebi3su0ThTRsU1RbftSC
	LHPkb5f/QPjTc9ZdkHybImXdIQZ2/WvAy90loyihApXhXpCzKw8SMPUp5WSwtVKRmQ4x77UuNvY
	gd96MroWw0lzNDqWfK2jCcsgQQHoP9ct2he+SggxxeVF1u9KovSQQZDP+eVvwwAfWMciMvmb+Sx
	e9eOWOXC/K+/hORFAg1TZSfqZXfd+rOEB8oqjBYU+mbJ/STJnHJJuUCmBv5NQUeBoA9TBjCiQPK
	OQO7VSqr2T30KJz3yJsSvxPMb8UDUbOcBi5HnzeFmLBjjusUz64sKwQr+uv/kijnQ3YLh4Oi3wp
	XF+d72VA7ODrFBLKa5kP4gtONMlW1YwNg444BkMelg0ioLfkG+fZl5ZvOmgF5wY1B1ofXdUQ8OU
	v2K6lcIR6aXZMa6uTQGBaYd332EZoYOhJEgG4s7ZJtKst59rAYETDl+9AbwtBS0NajZDNchiT6c
	W9azL8ESo8c3qaNKzZ08E/MOyGJjAtpWVdCyB5Bz5YYQclRyx2+LnPNNDmMh5noirumde8LGkGI
	UAJaxB4hpTq5J116QdBzyg2YtriTlpsnGS6DCERrajggGnLOapvIBRyDvl/3e+gi2Befc
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-36a203f18f1mr1809613eec.14.1793156034971;
        Tue, 27 Oct 2026 19:53:54 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:54 -0700 (PDT)
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
Subject: [PATCH v6 10/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 11:53:13 +0900
Message-ID: <20261028025317.92450-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
