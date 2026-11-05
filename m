Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845911;
	b=uKha/wY+YJpmB2aU+DMcGAa36K0ypb23/QBIzlrMaaPdJ7q0W8UuUqjnherYUjR9K+CT
	 Kn/VbgD2WGs7mWyZBjDtTlJqPGUt6BMwo6Psj/tLH0pfuvACktbwkg8tNIE25UwzTMV+T
	 4YNtkl3jezIhkzjPL1nokZqnBnG4hTnT8dyQkHenCDodYJDSfwMd8wY9XUemWEf4aQfcg
	 i7gwRD/XmX/wS9RLJPy9e4iArXT7v/mWjJqXsG42v2dqKpW0xkACIU8nEp9Ac1FuQ0iuS
	 orKcdyCl9zLza56XdFjKWd286P7qgP4i9ZTwIsitZ326M23t5xzg2QaFBiC+t0YTjjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=FJrpt2tnR0GmIKnPEEIaI7uoQWpbFKs9ieUOjQ04w4ls9Ifku9Ox/Tf9PnblEPQaTI7Z
	 95AFjwTuuHbfz+OVzsJLSFZHsY0+NkaPL5kPvaIQS/j1l+VEsVxYStG1veOQq19YkZkrt
	 zFVcwxTwyyagKzpid1xD7H5vMr41uPKjw2+5EHl/djQhQgksBQGRx+KKgUQXu0bpY4FLp
	 fj17N7GsyE6BNqxSbWkQgR4XmdVkYLL2QwyHWy4K0lTFajGknEbLwpBpE1+QkWR9uq+Xp
	 XRIWKZrQ+WLj40h+9hu2OFgwgRp7UPT/t6DVG8evSRJbHanX9imoIKqIoDMn+yAELPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ERWZzjP/";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5CB606A32D
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5CB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERWZzjP/
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso658190a91.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845911; x=1794450711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=ERWZzjP/Jgq+vdv/PRd4mYf6G0EIVbYd65eH1Xsd5vkwNTW/SwBNjvM9nRTjZq5xGx
         pNMlhQO8KmtfdU6vuY3zT9PAmamJe4yREYs7MNabfqW3IHknPM/oeb/D/Pcy573qB+xV
         7+39y+aYqlCIAToZ9bjPxA/i3AoOZ6TzQ/aWdY0XH2f9NKv8qUwHYpJFqutcYAuJj7u/
         4S6+d/if2rnINHVd//HZexiH5bWOECeG6xh5fHzoFA42Xpdv19icKnVyllQMbyejOvbY
         SgQ2u96rwzE/FKBgMBsZwBj7SY+yA+hSL1chQ5wkC/+lu703bezXl0//LLyinjn1Vazi
         axZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845911; x=1794450711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=mqaz1yrFuOAQ6NqG50VsN33ax9gtdrAY1QM326xkSUw5nl6fmegHg1mLeMDssvWGCd
         GdiFBmIHMUvQk3ksb86yW93jeXM6ZtOpmOEvwN0WDG5RHM0Xc/XVXBXjpLxu6Up+G6Cy
         ijOO391REvSUw90o+22oTdm4agwcKJLfJ+TQmjF34UpdpEmkPkTI0xk81eOwnjOYOOX6
         j53xfdSW21K+mniy/zrmJKhPFThjMTZsddCDWVd/AlE02i5R5rMlBTqQTWajQBsSGXAs
         9JhrA4diRMogsvt/vg3hS3i3G2Y/xIn+m3wHvMcayNnnCOSgyOFKNwf8jOCgtFfX+JEY
         d3LA==
X-Gm-Message-State: APuU4Z+TavrkQec7gVjvV+02CMmCXSixOPFSUm1Y9t5fl859+b6tFyJ+
	lUTZTHgbOXk+pTnfquGtgfJDrLyR3M/4VH9VmJyiLXOy9JH154sr/FNry6Kjug==
X-Gm-Gg: AYBFou3WkThiDkvR7DFgD7MReZEAFvdJCvHQSFpEcIGxtYwQ2vOkKh9wvm+Ouzw8JOQ
	LZGbZgTEIpUZ4pl4tAlhKLl5tqKSuEyi6j6jTY9Beu4iaMhtnLKi200jcSFId5vGAKr21AViFPr
	zdITWrG+aQUQQv1vA7fhXzdw9abjMSrzP/8T22xTP8facnsVeDZfXCgCERtkTVkHEYuyBZzqD0P
	cG4YP80v1X5vIZjczkC0QimanCXPvzCXBiIMPlagDaMlZYBySF66Y7xY3D+14+oB77Zyl0QP8Xi
	B0gD2U3aTWCXTgdBum/C6dzk/mj8Ymn10mdPQdrd0w/Pf8XREyLyKehgITmnnXgvYyXi+Yjvx5b
	sm5yR7nH4hdq7xL6qfMocKs6QysFsqR8y4tSqpyOXnx+6aFhIDv6Jqgn7wl2Ghqp8VAPVSd4XqG
	VA3vLTsBk6vO6xd88uPCuMEGTuoEAFzfmCZBmz/wYPPiah840pmxqgc4toK4FvYSDHPc2BH2uxB
	VErWDm3Y7rpo5ilGGsh7EKzlrAhB8ktt0V3jOh8ZGnPyryH1LEMdRtfIaJcpRwADTqUqsrsKBTY
	/8TeMZfVuyPQ5bXsbd7SPXNcySU7hJPzJBdNHzz/zalODBLAPbeGShxCqzGBUa1DNNdaPW7magU
	RZAYrX9XSd93bclbAxE8UoRdYpEuvkOAaPm7s3mu1kdZrZ8M=
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr15530386a91.52.1793845910857;
        Wed, 04 Nov 2026 18:31:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:50 -0800 (PST)
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
Subject: [PATCH v16 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 11:31:29 +0900
Message-ID: <20261105023140.18373-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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
