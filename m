Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182110;
	b=cFd8ha7quHcf/OGZ9YuZaWTAN6h6OfV6NPX+FXZEvZoicPlRSrtiDgZ+ajAnpIYlZh1s
	 084HiZehZ8QUXUMvL2CfIHYrLFQCFvIoyLBVsY8RB3bZf5AbR5V6gVqgyGITFqTJg2iXp
	 Rj7TqmjJ62IeyYAZQSniJv4cNf5F9Mk2FssIMjs4Y/ANBGP8a8vUsxKs71cbbbEU/pOc1
	 IKdvTUq1iAc7vfJhSCNcXMb0CJtFC9D59kUevraVtJVBYNDwT/+6HFIXcuHrL/SMKauPL
	 saGV+dKWwCenixT9Y97vDXLQ6tG6JcvVaJVSA8bDKHU9UGO5WwDcPwgtQnweY+L41EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=pSjmdVjdfDEaOXhLWMd1mVRCKRdGyzwX3vquueSARpE4GWC1s+QKu3hs19DqMEgeImP2
	 0goBkvlxZqBd1+3IBdZocc+OMbtvkkdF9rw5D450jO/7y7bUYkHeRAnEw7Z4JkUYAnAoM
	 ivYgqBrJ5j4+SV3erASmHfjmIgpmoL4/tVUx5A/gD+y+lFx+PXiF9xZwOhWlH2HbDIOat
	 k1KQzq0QisjQh/M6LogNYe8+w/hq7pqUizsXhhjueR/m56Vp6/i1ZcoUpGJ6lbd21apiR
	 KvIs6rvIdL1QRvPghKt4yiA9HHh/x63afUBYrsh32TBea7AyCWKa3xrZ0N4OPbJ0Ppw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcUIo68R;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E276606A326
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E276606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcUIo68R
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso1664355ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182109; x=1794786909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=kcUIo68RUScRY0ZqUggpTUfqo+8eYwH1EDLHD9KKqiPbN2cs8Vl0f8o9MgEKge2UQP
         k5NuTFWfBjUDq+qkDH1a30+Ct+MxtIV8trUWsPC1VvHuhfbuFEFmDaCPV0K2glNaIh9B
         2oFmhi0KqgIBTkWOCc6wcSHxn+ICs4yi4ZNJ8BM6089J/KlGzfo7d4dTekkUmL2IWmRz
         XFVlhbrFWn8XKL01NYr8Yg+w+4w8DE3XUG48+O749rwxK5zR7UPPjlTL+rDmJ/mboZZ9
         g5uHw0fgfFtvn/sebL9kb9WrTAd8eClTeZ0Cjwxzrk0PhGdAthj0h4QGlmHb0scgfs9G
         eatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182109; x=1794786909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=YHCe3VcxMEVb6e1n9vIlRvinyiOxqTeikjjZAx2daEvqTKd3OVs6AYyf89qYPhGibW
         uWiOysP3otNGrFHyp64JvhhcgykB+KvWZjMLgu8L90vIgQZcmRhCGftU+IN2ZoybMuif
         hAgnKWOBDNFEADWKdldI5nzda//QcRNlFNDdjCPJw3lcQi4Tfc/4umkH4YkRGBL2INbc
         4fg1myd15sg4pb4TCcaznGJNgW5+nqV/oobu9CaAc6f4sDcVuwIvqIwHlPEOHsJoNYcc
         U4SPfSMorDp4hyBfl0Xd0rewMP3KigXaOXIgKq3/PkXqz2cmH7XXu64s2SFKiopUdKXF
         Qxcw==
X-Gm-Message-State: APuU4Z/Pj1C8Rl3TA6aDcsguIxcRWwB/fUP83iFfTYKcZuQS2aHE8mG0
	Yb1vnMkuf8sW16esS+tgrLHCVknZ08msERhFKnu56D1IPu/+uYg3LjbWWS2q8Q==
X-Gm-Gg: AYBFou1qIp6UfHJ812zBigbMnX7pwX3GjsMeDsjfMwdiofA80su5qrxApSRbhx7m4Ap
	cQCTcd0vPMC64YrA99Qn1jJY2tVyJhltuNQJen9TwRqQGKcd6XJdKPqsD8WD4gfDqK1MjjH3dbi
	11KChq1NmDucsDOQVDaj0ahD2lYnMA4OXXIIwwBu//gW9PvdKSVMlHqtR5Gde+7Ygzs1kjcE9aN
	fCzHcIlDMAwD69m2/r3zFTPQlnd4HYGWbTNzk8AJB3cMPryK5PzP01dA3I+Q7EZJ9GbsLQeqCIx
	FRDgFeM/wLwngccgS+8O/LCxoQAZ3q3S9++tZ38V+dSBn5nGitvWSzMvvqZ2sKAUMyaHM/GsCQP
	6pgzgJG9qxxBN7pD085COc+xI8jZ1GncQMueQfpeeTJ7698EYT2cBPFTbfwENpn6q8NOtBe3rak
	pyoBoDhTUgGHQEudRuLCptFgJ7A56I2f8ERna4xQ73To3vSxwaQe1kD/UtwrIZcGbwdl/+Kbft7
	TvwN3T+0ERkdugo1VbQHPHGb+BVeOmjCrs8NY3LY1i3zOAlkDkD6p5lwTX5Qoe1UbUPWBdCGEoX
	CJOX6FX//DgTFJoRX9oZRIZk+fKSFDnwQ2CIyfRMRiq1lArfzQBbBnmrZrQ2bMTyjIpzRV8pX6h
	57dq6oOXuOvO5yg+oVntFKYVDrMU6xlj5uHT7qCKuPYhqBkPKHWS6xnvBwtuUQTCc2nej
X-Received: by 2002:a17:903:2289:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2ed8378477amr25176185ad.45.1794182109426;
        Sun, 08 Nov 2026 15:55:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:08 -0800 (PST)
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
Subject: [PATCH v21 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Mon,  9 Nov 2026 08:54:46 +0900
Message-ID: <20261108235457.12688-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
