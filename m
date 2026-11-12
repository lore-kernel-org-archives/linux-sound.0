Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461696;
	b=pL3lb6jJwOFoU8I/0LIjV61oPIzuWqqIa8yg00sQcF5ozohadZ41OrOog7WYb3Of9M/o
	 ThYzfk+9rotiWB7IYBNZGiO20drx91U8EovLxVhNhmz1CkepjP1GpD28aO78ieWmAZvqA
	 FIlUwTjx5aDGfljxNRkq2imIklDxO3LFysIaL8TPrINuslpgX+9JDnoZrhpkeCecelGYT
	 7Nqm2MmfkY180HD/BeCQb+Nrq3QhcP9gyHg1UOezuC2wmgxxR36x8MfeNSh4Wb4fz2zxj
	 kf2+4UnTiF46+oPVVV8pdms8lD7lOZZv9kD88kqwIl+TZWuoGxHQSSBJWpeebnGPEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=uG1g829HyU90ZbQsaPY1T6Zq4vK+KpxXJWW4utBZw0/u130tngEiMkStGATH9lCZ7ynk
	 bKfnGvTLcx/yyyNmBvc//wW2l2xD+9JioINwOt4J5RuV0iW1vw6/1LHM9iZiY8/tszIs7
	 h2hudgx7APAQMKRulMgI3b4JI/dI8j6Pg6XpQZZ1PtEdc6SeP09egstzpQP4tcgQs0EDr
	 cq9EdbbeqJp69TicyjWSM3fYBSa+f0ZD30E9hrjW8yms7PiW1x0RLnBT77ssjeV7wTEvj
	 EZnJABWSdpCQ0cJrwYqZvRKl4Ez7Iq7s9td5hXs1xJSgOoUNv37O1938NZDFJY5g4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ+iAVGr;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11E606A882
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A11E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ+iAVGr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1aefd1bf74aso424642c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461695; x=1795066495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=dQ+iAVGrs40P3mvOnsMx386F8x4T7hbt6QJVwaw4bN3WscCPOFlAT769rRBBC2dE7m
         6CtlmkSISj8zLFXvkwVDmd2CxyC2uvv1EYh/lasvpNnmiUXyjoqzG+Fi7u60tyz9br4J
         KwIz8yLlNpgIj885KK9b5Vb02B1EJOL6C+yvJvLLKrvf71di9USNV7R+u2nW1L2ilNG2
         3BB0EKujATiVzo0W5IMWOgiqLRKmi/+0wvWoNdLdFGF3Za0UVxOl6EhgStNKz6ltq5ex
         O12e0xKNHDW6j+k7Njl5mg/6h8B3rgp5kwlOsp3Pjr0baIAdD8Wqr8LN2CK734UfLr6L
         O/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461695; x=1795066495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=uHOYdJgVZHEgeSO9db6+FXyz7rv3mnuKmw7kPAZLAK/2yECa/hFrBwfJPAJO/y87lc
         OJRd/jx5EwFAamTbkwEOU/eRn5ro+FPYINwB20dYqmkdKkYqSuWZ78Lx/cW68lFxc/5N
         j9jX/+D6BRivduCjP79jvOCSD+D9bh688ZqJgFSmfAhuu+J82/bPzEQFn6Y36QDzLF2b
         69kb4vk0S+mDs6BOeGiy/3ql/XAMUcu+3px9JDrIuASTXoSYdwsdWEdI/xpJijZJPbim
         gPKazCXSJZKzjlvA42c0HL9Z7vJabgbEKp+/SNJCbSm8Fp5mUmSHsqD3Rjj5n9L8nSzT
         e74w==
X-Gm-Message-State: APuU4Z/vOLMmJ5A4eVUdl8fXrT6FaMo77oBGPuXqPZ1rQbdFPujDI0zB
	gysWT46ckO8c4ymfdXxGDnPR31O73xPA3U4fsi5q+ZJpdenYC4wcP5LRqaQWxA==
X-Gm-Gg: AYBFou1ylOA+W6c0XW6jvUOnbxMD57w0xjavNrGRvPKl9Ja9bYEyh5pRGJdVy7T98Ti
	TBEvSoahGkmhMlieCGcz5TGqkHA7IzIZB8Vgs+vP86bRGlCaPdiPFsM7b0G2w2x+aTW4rqfYTsp
	wT0/uH2u9PKGgU7QzINuMGb61rjycLNo+7l1AElz7ELJv7CmviyXl2RViY4QjbTUcSiQXlFQJWD
	fSRQD3zXP52VmZg2Uq+pYjBwF+/V9sd9pyAK7qRcMjGJ7zh4FwDrccBNGueegQo5p0og88qGuNE
	Kf7JC9CfkZz8vshUWqvGMww58xRMll+J2IGO1MQQCwd69hLBXDU4nkqUuw2YX7X4QBa8q4ZmBat
	WjaYW8Io3G8nVTT+UZhDMwN81GInYNgIG8/EzHn+VEl9747/7dvnXZQ9rJ11w3J/WKM5WQ9/hRX
	uu2Mw648keQWAQOAsVH93zbe9IrfKLYyNh6X2UWY7YcDi/vOyIdowzoJkSScrnaOEmXiezn6kMP
	yLUzlOvUC8DN2ntuaTd3+1vnppikG5cVKV6L2UpmoaYU3WwRSLH4BUHNipQPZ/BAhV9U3JnwNQZ
	2YFv+QyhqqdIg/LwkmbHij7v8eD7BMZXRqYVn/VsFu6hYpvf9V1RpUd+t9XWBKf1QYMrJ8yhWED
	DZnGt9yWW4xbI14qk9KYoMfVmGOcfYV/xgiTUPTUKY4cCq07Byqw1vz9YATXTBNQrqkJp
X-Received: by 2002:a05:701b:420f:20b0:1b3:a87e:8040 with SMTP id a92af1059eb24-1b4f5eba049mr1425278c88.20.1794461695410;
        Wed, 11 Nov 2026 21:34:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:54 -0800 (PST)
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
Subject: [PATCH v29 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 14:34:30 +0900
Message-ID: <20261112053446.73504-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
