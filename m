Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907832;
	b=b9C1gJJmhcHN4ym3dS3oPjClS8yODrt//e4qe7t2Ke16ndSvRW1ZpjgZpvaOlkC5G/rM
	 IMhuUb6/Y4b3L3Ww4WpoFzt/SHbitkmext/YB97Ac5bguDLQGEqGRb4jjvoucrY1EfUKM
	 EfgyfBJwg0QQgdBRfDKAKkLbgthfkjY/LrVL7Pjq3zyy3lMAgnt67ry3/AgcMCDQMiqt8
	 +6GOtQsKPAydFkmD4euFY3inGJrgkJtuPRJuR4W0xuZCvShyPzlF1qfPQuP4FmEzx6UUE
	 zOzAYgQJgpfwzzhodW6saZ0MkxxhZxKJGPesXt7ypsc7IDGZsIRFMGBGlw1F9QYKeEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=4MjAMRB2GYl02KooPtZVhRvQpMKOGx63jq2arK91BvW/Xj3YpAEr4cmiqDQGzmRfH/Fp
	 DtZEPd7o4knLe36NTcThTnBWhKlgh1v95CnmFL362kCrLfh6gIKY8TXMj7okLilEkGPjx
	 AXvOXMu4js/FvD1NZinX/TbboH6Zuv+wuxZa+Hqmg+vFeMIDumNbhBKV2evXwrvXhMupe
	 ZddIRQlzwiB6q3EElf2VUd+w/otupoGrSUxiLEZ2etC+p0yXzNRe4hDaalEP6Zxin5cmL
	 MzPhoNkZsLyv0BLm/+gr0G0Q2gEKbJL/cfKZ6VI71oWDD7icvIxzlMSsRmpZVAKGs7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BIxbGW9p;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB374606A325
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 05:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB374606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BIxbGW9p
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35d0be18c71so3565080eec.1
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792907831; x=1793512631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=BIxbGW9pO97vdtgMgDXF4UHmyz99zPRNUX61xF/4qtJC1BtDSmx9jQ0a3n5UyibYQA
         PXQ/PMJwURRdAvIexALEJ+eoXmCdaolC/iTx747Qaiswm934Lf0KJSIrn8rm8PcwuHEt
         dbnFoTNKDaeYQSpJLWQJKeSIZLKA3C0IeKnbaoGn5JBOyxWwdPxt6UccyIdnPgqIS3ri
         qvkPHk5i6sZmi3V00S6lmQSVlXwSHKCGY0W9TtKcXvxujJL0vYvhZlgaYBnVzWezUnCX
         39ARkmUG3ov1/qBMQHzHsGHgZMBrnLonviEF+kUjK+GgwP39jRItcQcaHGhVVNi4sFwm
         amdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792907831; x=1793512631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=n8LPfodGfmmTviD1TqocvXAJz2LPvsXEKa2lbfnJuOKkoNp5A5J3NA+W7p3RLjYhNy
         j9PlwzDh4rtDtQqeaQNg+bAfek8Pf8emRibIDvWyFOeQ1CDfOr+OPDyt+mVKeu5LN6sX
         8uJB864GQtKG9lfIGibkA8bZHpDyG2NABmVLOZvsqbd3b/tkom4TXKZO9yBTXfw0k0Ax
         82SwybSpEfqQrXg/IDXjTOQQemm8nRFg8R3hvkO9R2jaibyfARP+pkiGmnmBRGBTUp+q
         PLVfJsDkKY0e/pSa3MP0q8Bx+OTLIuErtwyP7e5YH96lOJfDwMrJuueR0VqJoYjhSUVW
         fX0w==
X-Gm-Message-State: AFq9FYKOoe/t+G6xYQMQoaP++sMRIkJJCVdBTcOf702bD2X6X3wOxsk5
	mEYMfeMQVAo7rzvw6EP83iQrz29lKzwx5QNlj3mlUSGfqYlbEgrpi6/BFlD6+Sop
X-Gm-Gg: AYBFou25enKYPGw3nhHRpUsOlr4keHTQKg2zIAvUEtK0wr33/iWjM1v0F4URssaWsft
	H2L6jOoVQGlpk8UXqPNR8rOjTJtjsx1wY7t2fIPJywMZkTiQnup50+qJTfWv3q57gstfReh4JdS
	4hZ9GNcuc4KH3dHl31J+XGLLyfVQNem+Z2LALG7p5tfa9kmise0aheQZ9NyeHY59g3Jag9Dfpru
	HHiYAtL+P+YLCZ9XLZT28crGXr4V539yuZL1sla9wrB/yCBEr82bxx/v2bEPjZ5QMevndtDBHy1
	CpYrtAOatELmigP76W6fwtVwY3juei0YHcHUGS2FiFul0rFDleEPA8PCVzUREOZDhwcfKr/UQ/w
	V5JKcNm2VrvQazXWyfRrJSeBePcGV1/bjwVa2WcsWJH+1BjMEDodzahUsBC4DB5LRHFwdJvF7Q8
	yBVSvJLLxuNDBSsKAA2DDshObs3vb9yUW6k/6IuwgOpZNtKHp58pf0jpK8jK+45CqwHMihBNL4q
	UsrEDqmSXUO+ZLAdvf5gEolfdvdgItkPsIkth9zQhylpl8rH3nVlWpXN+0kHxHZ39OaKW+zdOyk
	/8V1CRauXBXjz2j2fXj3XFLiaP7Bbu1qQlpmUumRKEPtbGfygPhjgS8XIneV/yRM4E2TCA+TxGs
	SXsaLx6RH8cr/+VvjlMY=
X-Received: by 2002:a05:7022:5f0c:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1993505e277mr4456002c88.10.1792907830883;
        Sat, 24 Oct 2026 22:57:10 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d9307bsm16046244eec.14.2026.10.24.22.57.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 22:57:10 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v3 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sun, 25 Oct 2026 14:57:01 +0900
Message-ID: <20261025055702.69259-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025055702.69259-1-mynameisjune111@gmail.com>
References: <20261025055702.69259-1-mynameisjune111@gmail.com>
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
