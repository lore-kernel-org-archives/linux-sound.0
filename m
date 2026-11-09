Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267660;
	b=1oACagqFUTyiypicXg2z/zcFcf3Xbb9zyXZUYbkpVQ/BcR/s67v+TEoiZleuu1m9PxEN
	 yzdm1aGj/pJDHW6EAGohg5Y6nznZP/EL0xQ4352m+NjL0uyHN8CUfaamXQVtIvL2i5rXG
	 A6YcfSf93sdC+yxyXVwEpkwUrOPX0s0p1UKyiwiPul42VFbEDMoJx5TO7kPLd9XUaqL2a
	 tdnl/DBLYPYL/Gal9PAB6JBZqk72PFL7cschhrE5snDpkMJThhBRHsCi8NDgiIcXHdjLP
	 EU4eCmbdFuA7XDIiNdI6zTpG5qXpxsUVT7tpjMgcCNuFVH0EnrN9+68sBVfPZvj4WbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=385C56tWO9wgYBAdf4UaHjzQ7DnwAqpKqnZPEKnNPJ2LB48cymelpE9ZhzSlx/VJslQ3
	 OZ2Q4svflq072IZmjIMkSmWLvgDvclX7ESPrM0gM+tNloFuRPAYy0sI1CtSHkwBe0EIVQ
	 DmPaV8L/IWrnkeu0RBU6Ej5/MGWNe7rqv9pi6Z1RY1M1J73BhaEGFeMFkelaLIbPU1MAJ
	 8Old+cetpEE5AkYzBVpJdkFBP2MSjD8PHTpQV+eGVTNpKDv+Ux3NXchC8rsFlBl3iCdMH
	 zo5NTyEssZ0i8l1Gr9n64+oqTuHocVw49572ucqeQC1Uv0aboSTixqQ88StlKFCqsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMEblv5E;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA85606A330
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA85606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMEblv5E
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so1499251c88.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267659; x=1794872459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=CMEblv5E/ZYdTwKbuiQF2TJwj8bc+53lpi3+wCxvA8s8Loec99E7MJE/Ob/VbEfBs2
         j9ZeFwNWVDFp96V5UwVvuC6sr0NZDY9aHU6ucxO0/sO9ebK6DzWqK70Wqj5fN8PzfkGw
         ENUJ4nppKN98VxMR2JMJlL5wWJkjFCOoRaKIf2kYOuYpZ+h5u5FSbpwlUpcax2Bg+bku
         ZMAuJvqcMyVRXSxnvg8v3dVOrtM7xxzLTUiFrzZuuXbIDBBAZ3xj+Fz8zaZaZmrAKVAJ
         6U0HMSS0xOzCQr57co9bTZSl9q4eApC9TjKAcutp5siVaP7jGHnSRJKKjWWHinIhy/yB
         doyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267659; x=1794872459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=2UzyQFEJirnL5bWBxSrAY+S5sWJYsut+M3bydKLBp5r7wXthFaLU6MgMVjWltFRkw0
         q36tStXmJMR7+V7UgNXJvyXxuCWVmeV3qiVOgdc6M19nWFJrFY2EC/MyweSttt0NFAyT
         xY7zRt01uLSCfF1QMg0MKQWXLHlK5oLbTJkaq/z/i4Wbp5aVWhdXtBBn5yEWKEMtv8ly
         7PFNqEah/8RQvZ63L1LUpTM8lFA5efjOYUMxClgzgmfHWip8xhdgnj9uhzMMEDgLuP9K
         TEGh7VYO53sauhmIlzk9mdW6T1hqV+8cnnMs5Kk1BY7ckex2Of4ezhY6l8/1X43FfgdO
         HpsA==
X-Gm-Message-State: APuU4Z+x32SRvBoFBxKe+2+sUmmqPF2mfIKmraBo5QZRAVeLmmxp9BaE
	UpHgdTQrZhvT0493/upa0I5F6dRLUHdqB2UPfRNMe11lujHkcc5Jka0SQDptpQ==
X-Gm-Gg: AYBFou3lqv2dyHzzbu4pVQpAit/WZ0NQuldeM6Q16nYOf3164sCQGPZX4SBcTyTotzY
	1aV9EkoRzf8xc602ozqh6udOrX5FdaxQm0opE6GrvCNeovEiFKJvnf7zt6TVLCXlzziJcWA6Y2Q
	FwnsAmCoa+fhffA4VEQ6obRYG4p18XeUsH9v3AAyKy6ymyTiNZZr1yNSdnA5cVCM53FdSck/EEY
	HWbCNlSLS+sW7r6TNxs65IgoHAekMURi6abzQp5WsHGnsc+bWXGWaCpYgILb/lQovinsXLQAVUs
	YSFld8JAj8lsEtZthEi+Z2DRNVHs8Efw980qlq/bwMINskkLU26jq3VAUyPb0cDtTbAOt1byyY+
	kHaMlqQaAOuq6fh4O7L8tgfTHIbvkfAoY5oWptKliaFqXLRL9VjYKeYsB7lBapIt1dmFSjfJA7b
	cJ7hn8drgMkPsU8sJF2vdbV38cnURWtibmNxPwuSWllsuWa5i1Y28MU8M7tAUotbl2kHOQIGXVA
	AQ4LkWfCfuskEiGx3VL/1ouQlvsRe7rC67oGDNqtrWd0mzgLhv0oQjQ9zzvFtOX2nOxoVuzYyE5
	iJQzggnNchd+zdR5KrFgQV5SgfPWOSzKgF2R9XdsUi45MTu70WsSw6B/osuEFpHidAI74KbrGWU
	ke9X3DiENvdJOEe3NtS1i6IdNCU0M/q9+hohUIKnmW67xQfI=
X-Received: by 2002:a05:7023:a4b:10b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b3b618cd61mr1286428c88.40.1794267658673;
        Mon, 09 Nov 2026 15:40:58 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:40:57 -0800 (PST)
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
Subject: [PATCH v23 01/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue, 10 Nov 2026 08:40:36 +0900
Message-ID: <20261109234049.79534-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
