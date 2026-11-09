Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201388;
	b=Xd+gEuhccC6rQOzMGHZaHmc3At8B1efze19kSijOzpHw/efXoa5JUNErjc7MJdNcxVml
	 dFek/gckLK8YH/QEwkadei7mrDHk2ewgIcFWTYEdqs0F0vFj6qtXKuLvW66xPzlqnxY/O
	 F5DN47U2UfbX1rqGmO+t2RxoUW8n+3PXIVQHy2SxzJLAkG306agCU1MM7dZCh3DQQtx0f
	 ZRYpVGHCWRzN8q2JojerO27/8Gg2jOevcWbD/HMcWomPKVWaiwJBOX01mc4p8jdp25zBB
	 Nc5mzBZVzK7pjGLCYWlMFBerb8IEMA5af78YG1mt6OX5mKqhfpiSqE4PASNHE+HzNhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=QJC+iYJTdwVhFcn2kb7foQuvP4Axfcupq8oUW7KhrE+tiY3pkK5aeCEGPxIKPtbjcQrS
	 R6PHue+fw2LTxR9MVs3h29n3mb1Qky+bnskdux4MBpz2Z6Pwr7BAvxi5ih4QG3cdqn2yf
	 7aDVObXJU/QY5gpMwKnwRmBz4Bs8Wl/hpxaR8M2TAmI5tkLYr1qM6tJv1e3vzYa+3aYwG
	 FRn6qwFcs0fsVa47FYjZLoWJdfbzwykEpV6Ns08PbM8BbLKyVPjH5baePP4UCpO2i42b1
	 PwgMqSrX2YJWMjoLC6kBYs7QYgN7yZ7XtFy4kFjxh7kNwTF7dTlM+fI4vgHQgFTKZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06MkglJ5;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5824606A333
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5824606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06MkglJ5
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a8cc11ac42so298187c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201387; x=1794806187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=06MkglJ5FY1s6DB2TSqzZ4qQ4hkx7EOIM9N1gGEu3eVg58tFqiQERaWJe5tHTFnm9m
         VI//0HTN7ThVuXiicuw9NQkwwvvTFEykv368+BvwVPr/a7lmqqdWZUiny6RBZ1NeRSgt
         LmXimky/C+1EHMOSANnZK1puI5Acyr6D4VxieZSaqxkzOW2dhNdDS0sBRcn+yRIOzFGk
         pZw0innVGsOmeffxdG+eYIz4/ew5mp40F8+6GAHmB6uK+OXqPtXVCqFWRn9p8+EQBSwL
         M1pXfjVrDjKcJeGarQLVX11BWAZoLCDVivdYV11c8F/pu4nE0VPnqL5r+AVOkZJw694i
         iTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201387; x=1794806187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=L9NUDpTRGSX1hjqEQMhFdWegQ6/Q0svV2VtsHt8JJ5l8IwPtjOnaNCRSHq5cbRHmmO
         83icNavxkjYnE6Icd5aLJrE4us9T8/0Nr7XhuYNtdGZmm6NjfGJzgH0NWvxVhPdtfq6T
         sCzsBa/nu5w72p16fv8sDE8PtjrikJWbkQCLMVRmn0KcbuP4E23njHqCRC7lhmMlIiMb
         3pYow77icYOyaPIbCO2N6njFX63J6W2lKcJkY5rKtWtbPn7FxhDBwQNsCrLQmQehvHmM
         IhscU0J7wfLXbX/cA6PXXIMajcwJbCZE0X/HdJeAzg+AYA/C/RlfjEmcBQg4qrbaaXXx
         hrLQ==
X-Gm-Message-State: APuU4Z8Bh/dr42PAfrnxp5UlPXZrz4VIfXKnaMfpl98cw2kbySVcc6cs
	iYo+Uy8uC94jhfb0RMlp3PGjhrTSae9MrJy/COUV8Df2o8mMj/qKt6qFnJA0fQ==
X-Gm-Gg: AYBFou32nCuwtHaXSQkqdwv6+5NDqlxxLa7EZFi9d7ZQFrW6Uth1Cn5rHnfUPeO1BjC
	WQ3IG6Ab1GQeD41C2pGwvvnYOjD3I8v9JfcFAItPgkrxfLvnOQLVKYsPngPn2a0B/V3/sOswqEN
	6HR+1SdaaP8cJEQGKTEbmk4BUUbJlRYMxVCQhOorbux1jKzMndWD+E4/QZ8xf96qvkxyOl8PoXn
	tqfny3NbAp5FLI7/aXvX24UsGHYv1k04jIxQYLphovGBwwVmhdQiY6NCZ0TOk3tJeeteYZagI21
	v2krqYqHzy18q/0OfPBtCTxDiIdRtF0rpYtiWyu7Pba9J/S6ULwdGZgVEfWywWT7lDLhrxjlMZR
	FWNAj0zuvs1aTMqVD7WT7+F95KKH/Q7LHBtPWwm+QuenPI6z6C+FywkbqTFd5RzlesPg2AW3mmA
	MQ7Z5Wig6E9kFR3f5MFKKfzFG98ZY/YoqXjLL6P265sAOoEqBPx4HHugtdqN5B0+rVbg5ToLZhI
	OsaCeUW6CfOGMPcNOT6WCIDuJ9VFJ67nucN2XjVoxFFnPXpX/Bnq6HKb3QzSMPgje99LPv2b1Dy
	nILwM5Os/P8LeWtorWtb3eIhpDPDA07NCVdAu9e93TmD0bgw+5endd1BEoc0H3CyOzX+ae3MSud
	c/0tGIGshbvHp3VuSD8kjYSErdXbqPYf/CYjBy95+4+jlycc=
X-Received: by 2002:a05:701b:450c:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b39fe87361mr5510996c88.11.1794201386847;
        Sun, 08 Nov 2026 21:16:26 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:26 -0800 (PST)
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
Subject: [PATCH v22 01/13] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Mon,  9 Nov 2026 14:16:06 +0900
Message-ID: <20261109051618.22506-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
