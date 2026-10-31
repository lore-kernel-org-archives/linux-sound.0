Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412563;
	b=XnFdfq9Afir0uOLALO1XeOCZPT5sadBhCBSQtACQLWZR3CIePU/wPcvsJ1FwKA8Pzil+
	 AN8yWFF8UqzfeupkbJVTsW48FX1yl+78JZyUN70EDTiPvmDMIGScLtmR7IWYAopdS0a/x
	 klE8L1h15J77HUnogUZQlcjY8eX6teFgzGlv/gGdPHAP/Wo7HVQptSuxdc7/XDBjif4zd
	 UDQlatUUUZinV2T64bGO/aQY1u6deAnnTXBaL3ctX2gp/VY8ZY6wmUSoDS2mODUZW29rt
	 nA8HEDBQ48Ma8mf4CVQB99C2Bs6eqQxoNK4z4XuerMY3mNuU7xhiyAOFOeuAPn/J+AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=L5U6uyuKpo+O7864s65a0cksk5gLj2tUJxMDcktFzqXZ63q0WHhhSitG+PGdk23gTGYP
	 LhJrc7zTA+Nd46otVWNPFMLz1yn42BjJckfy0x7TGzI6KN+jUpmA54PpFScnb50AxFFOS
	 JYo+2SgjaNTZ4PrxErkOBo9S8vhMwBOTNRz1gtuAOLNwULprnl5OPYEKVHFHX/XTJHcz3
	 G/OMHdI1Kll5zeBcn+OGG8k1EKOZ3/49x6xbzdz4tIjOZclmOidgoL6kGKe7jIOSJjlJH
	 6bJl6122TwHA162ehl2QZEuPxJ/zao2uw4XOmlCqn7oz9QchVZSm5yGPnO9TIsjFE6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLEar4NH;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D93606A325
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLEar4NH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso2679603eec.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412562; x=1794017362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=PLEar4NHS6whdrmAaC7HjlkeXnIV5cygTdxWVs2irViAPaa6qYALbmaCCQvHfx7gG0
         kelX6F/yxvqaHyohJoM2vHYpzkESkEWa2j1yXYwNsWxuSAB0y1SZovIeJYrhAdvRNi1o
         59l7zv/AvcWsHhFiYh4sIUCb8o86GbX4tnQHfxS8N4CN3U/G/QK2HIueGNM4v5nSWUcV
         jPjFkYjcpJad1LP1U09ZrFZFDNaR3sEOzpZJvp2Ny59CsfXU3N63dtdQqYyAMj1NcSpt
         1dQwggw+CCxbWJtDsy1rdwOhg158roGH5TPKGpD4o5oX29r7EU+cCM5FKnnODp3RMttd
         SqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412562; x=1794017362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=LRgAA6Ue2UHRZu1kGQ8YJXxUnCThFuT8j7FF5eNxsL8jI7yMKOiqyvdS1Fdqeb0Nn4
         aY2lLAFWNOWm2XF7gNgPLJbNX0B+PPCKrO/VEhH63n+wJQ9vmfkwB7vK0ivRJijzLOO1
         KOVfHxCgaH2+JHQGVGkYvtwogDnD+LcG1ifKmghS+vy5dlDJcV5sUQEyMCtu1KjVyzzb
         DcTPaM0cF3H1RhDQzUp2MyJjjxdePhMcxRG8Sp2A80k9yyIO2cGKi7dNWsO6VFFUxffY
         0Utfc9742snt5MhyMoaMuxVRHa6gv9x2F7AEFRbDjUDlNtBAGmduUreWk7KdUHcVJ8k1
         PIpA==
X-Gm-Message-State: AFq9FYIszpyshzQ8GSS2t+TLlh3bjn7mGkq8baDiY6Ki3UZbrjCsFPEY
	epoz7IOjW3Z9xkI367Ca3BSqwG4jB35lLMQL15D2WgJ85ovnEPfOszsgrNUOk2xx
X-Gm-Gg: AYBFou1mVjzuKitCL21zxzAeB+zv3RA++DCQh56rKaSAmmn2cA1ZVFWqb1G3PGQ6349
	fZzWbMSgzm0KxXGovOuxTAD0E2NIY0oMGwxuR9yWMzx19Gx+v7TCG3UWTEx56XVf+etEOcIsKBc
	zhUkGqvU3o9iPZd2ZUIQa19kAwyNtX8GVQ1yBEpcWx+FkJFXdabGpW2TpcACg5Ng5ZosiDdPkbK
	rtitsOxKY28u9Wy242vAOE4Ups2Uw78mi7qbqYDOBcN+9bHS4yRix/kbWpbfCuyzewOeRBAtv6m
	VOGZrDcHuNe+fexmp9QF9TL7+VJOmBcwp3HEIf3MpKGL+Cm+fTN8rewlnKmF/SW6C++aIKESzgJ
	Hsw+qoinXavqi+KCiCxSTi/LRF8Bh8xb4Wk+6zE7xVBH4Z3/cVqWqVIj7or0u2r5hCC6Fmerxyh
	8WCOVbXseMyjRDQ61rWs2sN6ufFdRkha/h/z+pG41YgIugyyFJZH05cY/wPAM96mnu42c6lV6IU
	H+/+cPNbb1BKmtLp2s5YmBx6FDGVqqHQ08w1lXe14DQbbvMgL7RvKo6WgLTWr1UMQUba/pwgp7r
	ZhqsjYBQD+AXgUf42Y5ooo0RJeyY1CIOTRxb4tmr4DzmaXifcQphD23lCxpPWs/hZ8stM13/3ab
	EJOxQFzwYSV29wQDpDlM7hS+MPRNFKVcu8We2e7sFbUigWXdwSGs+i8vtscPvnR47Zbc=
X-Received: by 2002:a05:7300:2a91:b0:36a:1bd4:627f with SMTP id 5a478bee46e88-36a423a9d6fmr5462617eec.14.1793412561785;
        Fri, 30 Oct 2026 19:09:21 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:21 -0700 (PDT)
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
Subject: [PATCH v11 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat, 31 Oct 2026 11:08:48 +0900
Message-ID: <20261031020855.2402-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
