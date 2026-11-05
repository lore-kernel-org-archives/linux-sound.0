Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837403;
	b=iIF1Eoisujsf4qUeYL0jvNmUnjj67Gpof2IL3Q4lwr1CrfuOVomvfx5vWu9O1JsLwN2y
	 RN+QXLujWnazN1ccx+mu4ua20+x4aELPbotxHhz2T0fjv0MMxWhSWWVGsFyIe7ELWMyyv
	 xl7nEpSWccfVBBEGgX2UqVfHDzJE7QCeWMbtgOcYpXXcmNS0GO7v/T1e+67pWu8GlnZ24
	 4mt8gw0l7ZnD+5VdbVPmR9efIGcF2prBKIns6ceGW/y2IAjDIUnNU75aP1xPoxN0TK6l2
	 HvoQiPnbykF/7SUa2tKjDKEURGNAjqwykm7R1d8QUQupJZFH8QUYpU20DH65Og2k1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=1fIxzSkaayri4IDA+cB6bGnpyJxovp4rilXArlR8y+vm5TuwyJSZKGjylSorAd2+KofH
	 qqT9Mlhjz7Nf6im6Pe3KUbx+VhXFEvmuWHYnb/MCnd6puLDCXw9bRJq/CToW9WRKiCJIo
	 UHAGWUXH3TxxLD7BeIm69AcpLQCgo5FEbl24LXwtSKtmXFDVlp21R1E06exS+1NavoQa0
	 DRsQctpJ29rCeqlan3XlJmd4be7eV9MvKRtyx9A5oddndfEg3uWbIsWhlO12l1U768fU6
	 2a5+BKV8smamRmdmXLdPn8Ku9KFPDxw/HSR2EX1ssUlEJIbyGy1AzJ+AN1WMkrSkocQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HxnZ8/7F";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE71B6083611
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE71B6083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxnZ8/7F
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0afe09854so183656a91.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837401; x=1794442201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=HxnZ8/7FBdaSWNp7GT45T8W1pLVEHmGpuH1QAxCdBljbCMJST9iYBS6OXkICqek1fl
         QFLpgpHuBISFlZebkeCS+cS40q0JeS95x88/tZUmvmR+WTaNa2alR07V40ENRkpOH2tz
         BZNRxzAcWaMECNzYIKjLQnawfhQczbDFkIZdtKNRYtFInKia93FqH1QpG3VutIYZurST
         ebTLRYQge/XT+vSR6pQHfusvI/Hnrq1ycMbysLxpT2BMcSL8Ga4gNsPSunlNJQBZ8+vY
         FhvcAS4exNamcD5Or+wRla9UL8GM6UXRJJwImt1bE48YsyBQGow74Es9x5NFmUqtkXUY
         7XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837401; x=1794442201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=vb6puxItRIZgj1HmoSovups4QzDuGRPM/HrG/hKaKRnMNOgaJzVaH3TqDpkhwXeTGQ
         ejp5bLNYZ9aZU4Avjge8KAyuH7AgU1sIQgmjo42BZs2hCbwuXeZ41rPfAwfuBxfwt1Bp
         RUFPngLEvn4zHCBFR4fvAdZTrYhgu/sBcKlKmyXwLgwo2Ue6yLNA3L6mwXagT/7LtYhR
         2GBdYeGfySNvtUj0UBtFNC4loLoOUKI9+j5C6cqYWm9RvgnQaU72Tev/3kca56bmUWxO
         P8LhISv1ePToGuN40z9qh+JFmPt0Uc/twp8tfVxTvM1hARqZfb1TtC6T6NdyjVz4lfJm
         IlQw==
X-Gm-Message-State: APuU4Z8NUk98nOoqq33nboNc2L1npox9a7aCG7eSUrnWzJ/0ydD4WSKw
	WagQOlqS13KC/w5+ZNHpp+SaEYUz41J33Pm0Gnpq0Q4VpfUikvUk5T0jSW5OBw==
X-Gm-Gg: AYBFou03u2m2IEJ5sHyS+LDZFpejryYaLVIHKK8xkTPO9QwQl4sjINMJtXisYIq/uSC
	C6ZDQbr8U0pnfPjv2sVQETg0GAoMhhNBsXI2y1/NuM1qKf8YKRsaXzfwBJ2nsrXQdnniu+Svp3z
	06IOa7ycq38e+LLbNxGBPJlOemx+4KDmARrCglYGWD1eJKpvkyS+cA2muw6kqXO0k8Sa084VLN6
	O1uSPvO603Oh/0efN47+S/i42HrAMEzzJMUNRmbaANeE+Mb4Vo+AiZdVviRPRua0jgNLDBlwEw8
	/3YH4TW2yr+mo1k8Ut0uldPzbciOP8dmh8fVXO8y8XsRkErMMobhZJTNU2w3oNHco3QvK/x/3RX
	L5nQrV31iS4wSjqu7DL6BhwQr0pI2GJaFR2Qq4qJucvrUjSwt2kvTu+0IMjNLW3dvDFGcmQvYzq
	ObMfk+1iLZ21T5279RvQu9saubGrf6WenBFDmF4AEG/jPslg1xSMdge+RVFqr+COQBJgdI0IBzc
	weXzbR0U6wk0u2403jGC3cA70vElPsrdw3kx1DEWTTGSHWVCLq0v/nnaBRmaufe6uhJ8XZvbmWc
	FIZiCTVaJQVMRziYJQ8vsEGv/lOyNhXBcsCs31XZiY49RESHj1NmM3ed3IPhqTnwspa4QE6a01j
	Z6Exbx8Asyse3yEE0CjuUZesQs0OnPDy6F9GlmldGKRcC1eA=
X-Received: by 2002:a17:90a:d887:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ae897c94e8mr15687754a91.10.1793837401292;
        Wed, 04 Nov 2026 16:10:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:10:00 -0800 (PST)
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
Subject: [PATCH v15 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 09:09:14 +0900
Message-ID: <20261105000915.15177-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
