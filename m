Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444435;
	b=Whdt5pYz2nLbNokaMeu/fxrlRGA6rvN3mVAx9vw22636BAM9APbHgF/In4f7ib4qjKJM
	 wBqdfFhSIQDbLhs101/IxalcgPcEgDw5OR2w74dKwTd6cyk3EUNW6LC6qkvU0/33l1bkl
	 RUvetX/fbDYPc2qXFkd5+qcB6KzjGYIwu6SUB8E/3okpLhEK89jUtJ7flm0YInDWJEV1t
	 2JUiFbK+hFarqydnL7+KcM2frsw9zH5LRE6oYVAJ8+89PyEMFpApjvKjZ4zutZrTQcaty
	 0sTpPm/XTz1NMYKRDYvL0jNX0L84x1+j9McTo5aQElnCQBqLm0t/7VO0PPxtNDgZ61Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=hMJ4224b3a9evfql5vs9QbGXO17ruua0fnhWOb/3eATvUGSg7/swf3wJsj0x2KEtGuxC
	 nr5xWGir23UIB3pYSrN85cI5C2kRBDWp4npwMv4JWmB+n2VMp5KFqsZMTB/ApQUr7Ps/B
	 DqSr0OCi5rLd6j0YGJ/9N102S1JUrtzaPrAzSmHVUxFZwBgHmozhHWgWLrZiPWeay9iMD
	 /uApMaINz6Vt+Yw6D4cNr4R0nqWOxWlme8MhVoGpDcbUUXK0CI3cE42b5wVbK+waBQZeK
	 VE1UQS0onlsTT2UZ0vZI5uMJApwJd56CzNtYYeFVIZ8Ztyel4hKn6E4Kd+0I6Qfk+0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtNzIk8;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B263606A89C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B263606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtNzIk8
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b24f4b15c4so129185c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444434; x=1795049234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=JgtNzIk8WG/gZnOwdXMzS8FZ2NJ6YLpXjm4JUQ9gD6GntFJ/SiWL1NooVxJRIPepPB
         N5Ver9xlyCHRCutBkk54tDFYxjAh6cBI7Zl0o9e/16kOZQ9Skq3hPqMrFdbpTjs8D23u
         FQHAPNP1HBCdNA2jPBlKZ8jUgUC6CnCQ8SXwrk1wVJuKgfs/YXIuNTEhRnwDpwixf1/Z
         spN5O3mbuRfQH0/btIHNUtkuVBvTAidg52n/YNInY0TpV3592CqxKIpdpW29JVZn2KtM
         6UNxcBpAWBNQFRW7VvgWugtzxz3+xv0Vr0aLDberQ9oyOHkUtaQhuU/DvhRrtCA3YaGp
         QRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444434; x=1795049234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=GqjAv30HAl8kSlgEsNaYQ6ZmqpGxaccqbR5/VnheFPvHunTND0kbaUWDYZPVD4FgFO
         t4SGG1GKB/pG0iRWpbs0N+SucEH3qtfusMSn5dRvwHZ+B+dn65Frdspcb3L85Ok4m2M5
         shtqtHaQu4b9vL9vj2oB9AXrM2BxvoEhp49ULYeKjFzjZT8ScgnJw1rMLWywg12KAqNF
         IQ+r5bqOnFXhD+Gnm4LWSu7lMaiT9R/jZ0b+VgNTmInZiwQt1QyWN/4P+Id+gvCib9rM
         0v6SLXCNjeHZ8af48ta4hG0w1PMY61fMvcIIcL6AhTYXmDvjEnNW4uMyiJmr8IjzkzNH
         YYpw==
X-Gm-Message-State: APuU4Z9cUXJdtznr5ooxcNnXpq+uEkTorCSB2nB2Y8Rxf4LYgeDPMP7e
	GAuLa0QiX+B4qnz2ScGsMCXvaPbk4c7embIuhV8E+1ZN2uhEXAOv5ghSu0QYeQ==
X-Gm-Gg: AYBFou3mHwPPN3zpabR1TkRLrjRm1xQ126hFubmdoVxOZ3SQ2tyvP1pDN+g/iL9+vZj
	JwCPq5KtLAFMs+t6IBqL/kKASFfC+8VFsH2uh47/iwD9mfCEzmABnjKgfFDVP6QYnZxuynFPwhX
	U4o7yoePy5BdC9JCQw2axUd7F6CejdvrFHAHpHDBJOFxmYTnfo316Nf61CYVWBU99Y7mGQuB15U
	0HysW7xMP/9Hde54NwPB+aOstIuKr03ugPJQREe6dmntaAph17hurzMCn0FE5nCvjrSNI2T60gj
	VS00s/wKP8x/aXtR+gBlF1bqVsBgL+UjflOMLH5eTTlBSE2J6hLoPqryKt/OvIV/OuWbgj/prRi
	QbW048xS7fdPR+PMT7/sS/R1g/KwJGycAjt1DCG4ZSHIyIb5izmYQrgeBtPmkYT0hgmVwcUhRxA
	xXVaPleXVM+hxbgcmzW6kcKGbz6jMHBu46j5fyIv9EbXCAbbc7Iz0N04xyOypTk7oGvmG0u/TIa
	nx7QOscxYAvnXoVuyrCdbmDDXqy4ef3vZAVj/P+byijeSebhpOobV+MzOQUp//mTqjwsnOaKDcz
	cfHB4yUb25MzSLgWxsJ5j0cbIxRmV1jcYGvmNTRw8yJnt0wK3kmAN4IuLwGDhOTCTkmOJEY/0Z7
	6iCKNS3SnvXqif2ta4x6htmhzCShVhl1AT4Q12bKI/810Wd4=
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr902229c88.10.1794444433999;
        Wed, 11 Nov 2026 16:47:13 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:13 -0800 (PST)
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
Subject: [PATCH v27 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 09:46:48 +0900
Message-ID: <20261112004704.49758-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
