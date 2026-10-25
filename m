Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905189;
	b=NCEx+nYcWQpR8nje/QAv0JO8UMlsWu/Rp6fk8mEybsYvPZJNiAItd4aUEIQqI17w+ym8
	 gRk9FkIlgVCPdXu6HDMCnwdQ1KDpQasIF3U2ipNVqxzy0zDQl6TuOWUSiuLEp+eVLIDPA
	 ZkUYc72pKe1z0Xs5yAEsYfyhO0OvyW+9LAJqptDl+/lKtE1tg1W4U+s+sJm5/0ZHeqkjL
	 C4df62JzE7aDzPSHTJ976T3+cI6nBksfwBFqRH6vxBjtLeV2JGysUQpsKKhI/w9hIGX1G
	 Np5H0vOz2IyFcbhb1YH3Q9kdMc+/56OfIUkwzNDxpq4dfB4tXf0hN80xo3MTKMtNJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=dZSD2TKf8XVJaB9iGX/CcjV/yiB8eiw5DjHoi5VrawEk9y+/wU0Wk6ZFEm3RgwomzHqw
	 DaqCJM46OfhBo0okVsqYu3SjPDx0jKZfX0/Hquw32ln49CWHCcC2BUi1UqaGwbfU91Ncu
	 BA1tLwi7SBvbI3hhNihZJXmWsvoqozu0MC46AfyodzWW4NZc3uMvquxRFiG8pBDhrWc4b
	 ZQFeQpis68kc8HjMCuMFCpAFOn5xGK3eoWo0ofztgGIrs/hhBdbWTsniikwaUxC8Jlkq9
	 5FPJOqJL4AwpOFq40Jfvbu4ymIWMDjORxJbkye3E8Wgf6WLAe0Xsa2tIHACstiRIC6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gq4Ppgjg;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5FB606A323
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 05:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gq4Ppgjg
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3359130eec.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 22:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905188; x=1793509988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=Gq4PpgjgLRasFGFftL7CEtj4d/xJ88hLYYduIopBcHIwH2OGYvqGzp6Q4tsIMhxkjO
         +WGopa3xQoykhn8bSohiUY3f/AGO0/CcG6RjoXz3nldYOGFvfF8ObFgEl7kAnPNMzU1u
         P2+1BKOkgqCx7dAV3YE1t+m2N2LPd+ojPCFqXgnCzUk6HbV5MkUThpmjDSfSiMhTVDst
         k8AmFQUg9zYePE10sDmD5tJjFe+K2oBef5OeixfjGWgSZyIlyZTj65w119TavA25KB7W
         LYfb5QYLORt8I1LxN72W0bvBX/7B0kHQBQB4l1GvVfLUeW2nkrpYaPTYvWTcfbCL++Wo
         ftUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905188; x=1793509988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=yM8LEeG+r6mtcvA2EOXrHYor64P6eAR7amoEJMYVLgdPWEIioUKv/7Hkk74F6kzHqc
         RrMwYfcFQTD8u8XpZDIgGFu0GhAukl5UFmFB8sSM2z245tQWTZcEseG4f+xP4Hvbg9Bb
         iLcQtIqhkpQMQmOMOyzM3i6nDd9S+EdAiQmd3VV7o9G6kYFc5badDDh2aPr6FOubm7d+
         BfgfgRlGZkhbvuRkC/ZoXUqBcPDs1drqir3gc+sEOQkr6altnB9fyk/l/KKUvAsDi11C
         2hzKrNi4zpfutDQSDlD9w4EfFl8lkLGsyJam0/NqfJLXb7kK2xACBUExfjz4b0uvStuv
         VMbg==
X-Gm-Message-State: AFq9FYIKuaIDcLZ8Poj321804M/0tRo62YzX36lIlGfEUSrgJg+G+Ekm
	Ibclj6OP5C6Httq6B38VpOv5xXWX5LSh2F+bbmcc18Ey8AMiBDpspTP6IMd2n7+E
X-Gm-Gg: AYBFou1RrEnbWEPenCTMMvoJFhEw7NTD/jbg+p7c4mwFtO4EZ+rIlRr3LYNzHjbkXII
	LYFp1uxXTJYPeYHtal2OaSL9oAQ6/t1k+mKOSNlMRcJPsmjVxeNdkRpUmHwyFFUvfSxnn0zJxsp
	Ld6Xs5MulTlXYRVNXwE/0QcGNWfU1O8YTfGeCcTHiuCI4oaEomXLqKYUWvwptfGW2dEclyfjVOr
	rt897JvFlNmTL6kKiM+x9wlM+CZExpimIovPGde6nj4Bqq+BWWL5yzhSunuUkICv0mr7M1e+H7Z
	BTo/qsf/15NdbIXf8aEuEgmLp8sq5+DrWbKONKPFnlMoKlE7Amiaoh97juBD5TM+9C+zObmzlXo
	Axnfu/r4S/Fzu1uFhsxpWy1+jsLGSHBUTBMrbWZZRjeTsLacid9LddSVBMkuy4PL9LokkuoAvF3
	J/nxW+1amHWvyPkszqJ/+gogVJc2SZjVrCuJGgol/stTzH7JhjRju3lDjdY3XO+lBBK5FP3d9IL
	GC7B14wADz1LDyIzukAEn+52uC3D7ZE5u4O022ssTlki5xQaF56wBpf2uQmtG8P3vuI2X1Ndhza
	d9UcmpN5GE5WaAEHZKQw/ZImxII+NXCmWusVrPfRw6PBWP3mXdXTfCX8nf6/igrnIkW2Oqx1
X-Received: by 2002:a05:701b:4212:20b0:19d:6484:869f with SMTP id a92af1059eb24-19d648486dbmr1653830c88.7.1792905188364;
        Sat, 24 Oct 2026 22:13:08 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm12588456c88.14.2026.10.24.22.13.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 22:13:07 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v2 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sun, 25 Oct 2026 14:13:00 +0900
Message-ID: <20261025051301.54640-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025051301.54640-1-mynameisjune111@gmail.com>
References: <20261025051301.54640-1-mynameisjune111@gmail.com>
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
