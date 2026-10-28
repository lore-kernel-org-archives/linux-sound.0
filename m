Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180537;
	b=idYoxy9wBnlVKBPMIzsr4/i3SuqZI+YewZYTCZmH6gyxXER88NL81lET/vvnve1p6tpD
	 zfLc3HnlWgfQHL2pQkhemc90dzZiNoG4GB8kZ9xqOr049lskIgtYnxdV9amENwEjWf4we
	 KOCqZGnCet7HWh48jm1RXiTNwHqrJs4Jn6zjjZWod+Y50yP1JOchPkmhu8bwqNix+DbN7
	 ehN7qCpCSyQykbHNEzDp9W5hzfdjow9kS/lAV+rd6z+m7STpN+STj8POgD03nYmeMmnnX
	 lchjTvRO7L69zaQGYXCxOzdyPNi/7qFMgRvAJ+AxDao3mHB8S3vP+c0STmHJHG3HPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=yHpaDq4L/Xb62Bc+ktSNwwJlBkQD8lsCpQTriAB6tPqCyHUXQrW9N9qLt95dm/4scJ5s
	 xYCCkniJvdn/0fq0gBEFBo39EXvp+Wx8cqcABQJug+ghEsz94RXKNph+i0a+vVbXoEVzR
	 XH7IZdAYajpUT3RWZkD0B+lSxh74O1vcnW+iYlSKmG7fmQBVRVs3AfZtNDNCYv5GUelZY
	 qy3yuBdRXvMO3XHMjxdDg9H789+ZZMv/SdOVhHRvkyB1mPF28F/moa4zCtbO6w5i818Df
	 UQAPMZr7C8in0w98N42gYb+bb8qgE6Hh9vdpVqjs59gKGh4S9+mZwLLL/10409c6zjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZbh0t2d;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CD860A263F
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CD860A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZbh0t2d
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd3310348d2so850797a12.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180536; x=1793785336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=rZbh0t2dmtNId58W/OtED9F3sw76uxXRb0O+OwMvyUJJaVsbHftF8j1pg2EwLWaz7I
         90beBK4z7uYVZsfIyBSF4G+ep2N/6aDaekU1oTnnOXCbGpTMegO4qFxbpmRQh366PwG2
         s4mHTUV2Ctp4Nk81hls3/aIq3Js2N2+i4G/zkSizwvtJCRPAMNnu/yf6RUNjkdhKXILR
         8G4a80frNDlki8clJWblQcIA62hTaIkIc6xBUyB7u6pGTiVZc4zL9YNEl8CTJYFoiP6p
         NAQOLrZrsKCpn2H09k1enpC0rfGeP9BeombpyAWwg6yMDX3X2lqejfrbBcdEcIbM1uCj
         JaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180537; x=1793785337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=cKweBlfK2tNVcDhQq2BViPqT4gLjo8EXKp2lxUp85K1CcZtr9w28cczkDyeXfAkiZ+
         LbrXuvxgflfye9LnssdkaWS0TEffa41P4T2ZbXu8rG05HqLrFVhBETUixt+0qUjVnOo2
         vuNH78jrnaO47ln8U7cTt6mwMJRxsQdpV1i1gAWlwxhqc9x/F8i0R2K5MtW1b/airMJn
         mFlACb8fmXyR4MhBpNf7qmtgusYWzajSQepV7prQdXZv8HF/kdCE6MdnxKdaDHMUnCBo
         A+4SDFfnhfiWS2Sqc5cUeHCh9EpCfgNGopzjLvJaiRV6cqMMHooF14KKrA1IWk14hkOK
         iG9A==
X-Gm-Message-State: AFq9FYIOFkLbjOyXgI7eOp29ZEr38+l8obE0xPoVRY+VpNETfElvdc/N
	8FP0j5NdZb6jyUnlObjVSW9H+hbjVv2DAJM2uCN/QWAg8JK3VXSy3TX/+DsDkw==
X-Gm-Gg: AYBFou3jXyeAMnDntPwYyGPRww+LtaTxDDti7vU/yP5tn0VtaRi/iOlQyFtN30QJPTJ
	0T6lqfsTKc75obRFpCL0WM01eX9cn561OPsfEnSqjidpKIqTNDo9lwfKZ49Zqu/U5fKfNA/pU/S
	LTYqWZhphz2GX0cxYAMWEp4ivPgPseb//4S/koAWeLOmSDichA+Td350DLN6a/m7FjBj6MrmFC+
	oWovv3++CGIJzvcmzH+TM7rRFbo1z/GtsAhfWMqquEef5ONUL2n2qxU+tr5e4+nztdVC7vU1nsc
	cy9XiEsjedkYz8ae7u8r6AC/qa9R214BQn+xEldiaClVdF6Ts4GZa3/kAjiIRo5t8Oxzc30Ovr9
	apj9jj7uFNm43FAA23JRJKaeHftbsI9h2KlNsNR1cjo9Lek4AoA/pwEf8blJKB1JxRqCP/UW86B
	uSvGp7AhWupNGzdNJJ6MiGG/Fenkb/OM+Wfkzpmp6ptM01wkhObB8ocGBI9YvI2EEcfFIUb69At
	FH082GP98tiw+t5MjN5i8PDKnutExFuKWk6zvE+6namOfftwaI6wzO2DYAAMjPMP7rJicIU4+Ak
	amrvlqlNpZHsbRZ75pFE9pKCSVHQmrl3jQHoEqf6cC15MhGuuBJw7iw+rDdszpytXgVYdJ2yaDZ
	nqczK1Yh15XXF+OV0sJ6yr1gf1zMzGTtYl2aZUZjjcDgnDMR+wcpvLcdo13JYjVcczjqr
X-Received: by 2002:a17:90b:4b01:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3ae5c6c4316mr584601a91.1.1793180536606;
        Wed, 28 Oct 2026 02:42:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:16 -0700 (PDT)
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
Subject: [PATCH v7 10/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 18:41:26 +0900
Message-ID: <20261028094132.20364-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
