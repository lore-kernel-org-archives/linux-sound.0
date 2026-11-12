Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466180;
	b=XKYgAKe9FJ6E4oyzWDaqHI2wQctlqyExO5q0FiJ2gIXVtFMJAdv1Akip5AVaEo6O78Tu
	 xbCYIPHJHqoGAvQ/+U1ztN81x8/KTwgaIaN+U4qSkl/4SIUnNHlq3w2nVurGel6xXVSe9
	 QkHYfaQLRegEQHzSNWo9/Gjpr9v9XdxW9ajeZi3kHZVzxTB+u8ngj+m144Hz/vBjAahlV
	 A44ppU3l5sKG4GmrSnCYw1gTuZIbnFxMDOMsU+liNnt22q+ySrrBq2+TZDX3F/y89sIxi
	 YBldaPrF7fWSNFHwwQ5FeIhGD9X+9URgr05hxODMYvi6kMQ2q/kREOVO3hPz2YSqZAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=cbyg9AK4s2t5MirTJPUKs2dN1wd/0ta2HXrbglyR4+0WyZkrUFEZUjYvLAdEhxZYLzDz
	 utO594Awqod/oSBOMqRGEFLG4SiSuZUShyGDNWRgEx8JgP6Q/acxIR9N7VC3ftRT7Tr/b
	 bbe7nz/vjZG53kwaJ/j9Iv//IfeT9RSzFfieYV1Awn1iJ3P3vkXg1UflT+R9Lhk42LRsN
	 4+6ZTQB2lQH/FZ/1wu87ulntGAAKlg/rssZmjyjVkFyzeM7Va0bJ3hJDEBL/JSGyKLnzY
	 RjOuYwhIa1gk2KE9GRCqeuuMM+SgyPsLeFkDa9YRZSExu4loN1xKL/MQNz2gRwqF4wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="goqwm/iU";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D82606A882
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0D82606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goqwm/iU
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1907866b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466179; x=1795070979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=goqwm/iUnzzSoI/jO1rA0nrlUA2LqEgD8+jxtyvkTVbn8KpBwn5ptAG6gyEqulz2XF
         sXafkazu1RvJ2AK/yu4k3FJyjmsqpy0l/mgZwinua70n4X1ijoNufzHI9QteSE4sVATe
         /drjQOCitDPmmV6RvbNWyJqyvEegtxxub6yzwi5VClseF3MsMoBzEA3pDvRaev0oJjub
         LgIEC0LaTOCLweYrL2Nr+8A2h/SVknrhXfipDlAEbLZ/saoZKsYgD9o4HAi6kQucyzIX
         t8M3EFtL1v/YJmm8Cg6k/yUo/JUOBQnQSNHO+JpW3alincxWTkPYP5pR5DDMElQeGUp+
         xAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466179; x=1795070979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=UhXbUl03mi4MZDNps5lDuc+SjrLRb4kkkZ+VklNKTCc6rflkxnwTMKyqbWWG3JPlsY
         WEyiByaj+Y80gpEh/RRgJfOaswaujmGXUVatE4wCcznep/Qp9hkGNBBH/mjvE6uGW3NJ
         05Aj8cl3fjeoVdjC69W0LOHbqXyFlI7W+ZwOZ54VtY5+vAvIRKpah0i05Uy51GL4xUii
         UmTL1+BXUiBwCAWo+ls1xGflg+ORSVv9ej20kFVFOj+JVntkfd3Bc2YXsO+dKrCv/1AV
         EHGkpcLaj6NVj6281IL0B1ElAb04o6qTWkONo0avSng5MyEerniTlTrgUCcyUrvhRJic
         sKew==
X-Gm-Message-State: APuU4Z+e4RchiLW9xzT+G07iJVShqrEcFnsrAeNg9Bxsw+iMrW+xJFZ4
	eLDCtbx6FQNmrIbG+FQXZTb1z8CjhWvpAeAsEp8Xxbi0d7TQIIwIYLvfuBKtUQ==
X-Gm-Gg: AYBFou07IX4+fle4PRuTSIYhPpi4JHYqoyl0OiETIA3e5wFQMxs85EaxG4HjodPp0ln
	nQ6rW+x1GYKQFiuumCe8NQostVxI7BbKN/4duKrK3Gv1lzOOdSHFac9XeKbdXpl+sVZTwUCByqF
	aBWyzRQVp2Iv3MdExBNaiNUUnv6sp6lxkesHkdpuDkYWAfpDxM6LYAQKHtgB1X39cHizoDGpBnN
	fP5q4La5YuJqF0GN2rp8o9DJNjYu3LY2iRVzDGUFOOgKCa68CgPI/LWCCpS4e4lN0lUOskqtHxJ
	kEaqucVNhc6ee5zR9lzP03DJRQCenvvOSxR/qAJC43fqK0r2nnjOwVph+OZtNM65DZj8DmYaAvi
	DnOMx4XOzHR87XST7eaYmqwfWvwEuhZm+txDlIzB8sb5vy5Gqzpm7Ayqu98YarcA+7rF6pkMut2
	oj8Jwl8Pmhc0v97rgQptNoFXonKRVzqiEMmJK0parwmBxX3ZFUoLc6ZuuE5S/6Sqqj9A4o3RrTE
	35MjlH3ALdFnDtjACJ5Kc+FHuYcfa77JbgiufWGuQWM2k9Qpz8OVdsSF+cet3e/B+IuBMtuT4pO
	0z+h2AV+FjYRaHcQpVrUR5WOjfq+prlZ8ZAmlfVBhGGm5xjYF0GvjqmR9oWU2LybF9ZR6/tHjST
	0A4SXWU43KpW3ylwREaiwDZ5Kjp890yvx50Mu6Fa/uk1668c=
X-Received: by 2002:a05:6a00:3390:b0:8a0:76ea:36a2 with SMTP id d2e1a72fcca58-8bc1deef1damr4766908b3a.54.1794466179289;
        Wed, 11 Nov 2026 22:49:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:38 -0800 (PST)
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
Subject: [PATCH v31 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 15:49:13 +0900
Message-ID: <20261112064929.11211-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
