Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144673;
	b=OPaxn8iF4A0Sh7k2kkH4XidAePU4ml/8btuNZ0LySOkInYQTEN8ykxzzER0oovCwqvGn
	 IVOuwuUACXOoe4b0avguz5Zd7GyH3B3WANeUvowY3S8OQ+RYzezDm5uncSGKps1mHWiWs
	 6EFH4DTot91APa5jyjB0aRrgts/6mC7ZWBbzkKr8j9Zi7oLm+XNi7/AurV6lIUhkdLYU/
	 o/owi77NjhyJ84u9Uc3EUFPSGwlTbOCkmafIO4VXZzTZTwLqYWUDnqR/xsJR0GqI0mgCE
	 GxEQzK1NvNfEkXXyfhzdZhqJ6+ZjOu+3ZJw2KRitNaG7VEQxjb3N2GNkKsWDUIwAK2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=RSDgdj7Vz4IPdVh1UBsmlq/RT6bqWHNsExXv0Pz4ibxtRtCNuaChhUxoDyY1QtzAsxyS
	 epDTjwVz/ecoi+/AQ7IEO7dlEvNqJXYuF3Jk6rFcZATyVoldr8s5GB03aUyAomdJxbxWo
	 TOZ9PfTeqc06UzYZ+83MSyTN5KJZ7o8KWZA0olYBvItinllDksnMoaW71vtX1RwGCKcDr
	 55i5CsUAqkVxAS3cu0sbTk+DT8Et8bTfyvd4Qw2vuhCeQD6aSwzJjENV4BwM/q5Jx41is
	 vvuejBCY1wRBfdfOfjrsZb5FcRwohiznXJFQggxCYjhqWK5kGQuJ0/kcLK5S0VpoMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2tczLaE;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ABC606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 23:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74ABC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2tczLaE
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso281405b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144673; x=1793749473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=a2tczLaEo1ofMm2TRXAdC9yo4Lxv9l9cPFNL6enuXRvXbHFPMSwLqWl4QDgiryBnzI
         llI6EbM3zeu98Oogy+oNk+/Q58Y5D6nxePkoLn6dCBR+5Vlh1ahouY0bGpSPFslbkl1k
         unK9P8r4honbssa0mm8xpyysPOKhhbdwaXkujUsFT6pk5OGKq+UExqgAQ8qtgSSzwesy
         CFFZLSRJRJhg5RTOaEAD9WQ9Y+PCi+8hkHXzwap7mX68insVAEixYCKtN43U247r7Bgj
         MdSXnIjZxx/0Dcv/52whrEd83xuLqETm7hY0xH/Ck/aluxTnBAe6YTEXineuc4hNCF3F
         HA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144673; x=1793749473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=xncARjdjKbCTVGVb3kCFrYdLnois/Fa76bkflPTbEpqDUgMk6kca6By3oNEBfs9M3B
         HKRjCuk3qvw4Q9etEwmVQMQ5k2Ji74whucor7+5cwbPTcT5LwP3dMEbxendqCoJYdzo6
         lxjz6tuMkryImbmrrLzpXCiCj0LoniYpVqAAPDvz01jcgcEZGkEBIOOmrBPxxpG83wPk
         Huk1QjoaaWhZbgZ1qXmVd33U3aiQPu6H7HwYvrdTCuqSg+RMVgPjmHAUj6aqIHm6jQb8
         cTt+gh1Y5E7n7UgmxiHqjhZSCiLbsOxeP51I+sXkjh2QZ/4ArMQkuAPCckgrCK6QtYar
         qPJw==
X-Gm-Message-State: AFq9FYJL3pB9HuFVCAECI13Zd9kLt9fesQUrEpezK8YCB3QXn1iaVISO
	4sZFxzHlXw0FiF9YPZ0U6jFEyUrpJBqGeWedv6fPLuCtPLLQA3CIvY9PE1nkTQ==
X-Gm-Gg: AYBFou0ii2NLjFuUVO4Kq/EFx41KGDlWAItaQcS8WA+pGZ927GI4JMs2jB0xZAriVOX
	/xV208hyCUJpAKQFFms3teMtIEj8vpnxskro28kPsH7shvxU+EZxQqkDDfmU0MKxX1fH00vpVlS
	fLSVUgWSBEYrLstvZGJeNfkIItlSmwuWj/ocXUgxTZcO/FPpey8wH/1fhZOPQjtoSGeBh4xGtKt
	K7XCKYL3j5Hv3L5VCYJg6xhEpYh1bLGB3VPbY6U5wG0lZ/TxAOYXKfYrPdlOaD5KXmGsTb+Z9oO
	DAHC+f/pGFHlFNjPpN9u0dgQLR7GBR6ijEbJ+FBNyC4IIDWobvKeyShIfbAtLgVslSFMA+/IJgS
	aEurEw6hksPRIyOsAxjJJ4qYdPLyjqlZaXxKvtoXyzARMlWL+KlvtDi4qwmwrnH9D+tN5/qHf2U
	j4k1BKY0nSptjp9kmp3RYx5dJlrLDHJc1wdmwdnxUvWCBahy6PtJSk4mum5FaRgQ46lWvQlS4kn
	dlYi5Uvg5MXHQFpYya4ocysWULRNOw8BGgn+YxdM/1BjOU+TlJS+2lYKpJGU+nUEaFWyt1pcnlN
	lkShF4ZwfwCndZpWdwiH2aFjO8BVuK9fV7EqxJ7Fd8MHL0Ie30Yp8RdVZq7mfT+WxAeU5rDRgw=
	=
X-Received: by 2002:a05:6a21:8217:b0:3e2:1656:b7c9 with SMTP id adf61e73a8af0-3e9023f48c4mr784167637.66.1793144672902;
        Tue, 27 Oct 2026 16:44:32 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.44.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:44:31 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 10/11] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 08:43:33 +0900
Message-ID: <20261027234334.32551-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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
