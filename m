Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412573;
	b=rstHp8zUXut6MwzHcaEaSuttFghnTIB9Pw4Q5sKEe7z+p/ni871nahlL/mQWLJm53SLp
	 b0oUWSGx/k6ZVIbN8hozRPFdJXV4Gc2AwBcWTY6uEC2M9hThpcBM0u3enXiVpREvgdDxR
	 YET91RUNgybLbQKlls0T/7M2hwimx1KPuv9kPitCOeVHlChyFf0hb1Svmrn8Ydxr0dDhH
	 Bs5v2vThgr1NlqoDmLuc/gt2uY02OSp27TEUkb7FwCN6R2E6cd/C++PLJrvXWn8Nsr6K1
	 gq4dtleK3E1NnAjS2ZRtB3NHmzhi8duJKBw/xB10pczHFgdRuFmHSwNlqJi5Yu8DHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
	b=Q9hihDqUOQeXbjY24YgU5S90bsPfsLI0BCWpCA8JVKA+qTen/2m+PaLIe1Fp4hu5qHsL
	 ttgw8QH2S5fdlyIL6m+uReG2I+aIKzX4iywJiEjXNpTdmjsLuH1umIDctyyqZxMnsbcvz
	 chmpcGazAWZD6XVIkyVH1R3V8HD4fxdRjLx388+ekIlbiatawYvi5Z+qev2lg+US9B/LG
	 PyEGZnS3NvVgfIwDv25SMlhiM0uzGxJrOcAB8jUWH1v4VmHf/7aZiyj5I+L8NgRgq501U
	 o3zHTgn33G1mJhmiNeQab2RQmvmUaXf24wmxEmqkxHjeLu2DK2LrrCO1OdTX5e+OFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/9XsTiN";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C134606A32C
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C134606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/9XsTiN
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1917846eec.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412571; x=1794017371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
        b=W/9XsTiN8vUYZoabNVR0HlHP0UYxL+wsdCGZHZY6+LjYxmD+7QQN/7QH4j4D82iDLs
         BigL4SDx2mXBUNVNg8ZLffFXVDYzwrEudIlCWPEd39VL5GrMz1eX313tPF3hZDrX/y/c
         Mv2SjKP3DPi3VEHtaQmeubx76cvByP6n7WbNxwi3JSVCRlW0JcsqFREKZuBUmVIRFNPC
         ukkNUH4waDjDRUlXhJRD3vE6Z9sdIYzbaID1G+94HOxpfQkvqjQLk7tME7yROdvdxVih
         AJS5et72okgj5kMtTJeh/1l4EmT2XJ+KpB9HPuiisklT0mhthHAdAnpov0KZ1GPFJRCq
         ny+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412571; x=1794017371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
        b=xKZt53mkaK8PP9nRA5Hvq91brLBUHt2enM/zjZwPMlQt/3c+HzB2IwTk6nkQQqESQ6
         Odew5dysB3X03M1trFu9ySX/EcqASVGo6HM5lYYd4DUpQFXot+XY17q5/WIhephSFRwx
         GutaNE3lzEiOhkM/E8XBNgLjklGIrOfbOwIz+LZHCR9HOLSE4CGufXFy6QjUUFZ6nbOA
         V8Dz95rzPGe6HeoMtcwc4zpYAMGJPXuy/2FAhoRR/VR3hD428YysRZWperwKGkxbexbx
         su7yKwveO07cMcvKLF9fAxS1hqaQI96TbnVVP0OHZuU/cqa9rEOq2fgPdQIda5Gq9Ioo
         swwA==
X-Gm-Message-State: AFq9FYLL7NOfLpRrcv3bgJj8hgEVwfDgbuxqkQEij6PvqhrnxG81tE8m
	V60txJ7zY9B+alvprlnKxg7Cu7SbF3T6q2kX9kAl9Hs60bdYLkH00NICmK7ZTLck
X-Gm-Gg: AYBFou2TXD7YpQDt7qZ+cQbpmz5Qz7lrLjDBY1FRkHTCYXwgr4rmKd+dckDQ5MMTLTA
	r9sHTPuZyE+8IgTk91y4b3X6vOpfGMO2RIa8JT4vkx6Gcls56mMXpzBzwFpkEmydRmGPeEhLEnf
	rjiCUJydZdJSbnRN8ZBJ8UeEDzpJkPAZLH1/Krio6byCf93TYbcCxQYJuqWnK+SewFsTOidhWkl
	BIjpTfWsTDjQNYWhVGoROSgiX63lokaBpFV72MULIdoKFJYIpJ2YT1kCscLLPxDYsUOqUahDXh6
	vFiVcUoh4/yLZQ57olqX8o04BgLO2b53xobE/XH3TEVzbww7rVi8izL4zhfzj6Unli7M9LLZSav
	5u5iWyuUMfI04i0jWeJi2ATASKt3DkduADcKuxzEd9N128wqBgIjLiudFcsSnxb6AQGqCCMcKzB
	7pyM5ZvB/zoZGjyxVDBcDIt3NgW1V5OfOExs8SCAkaVNuf+q/M6KcdfZXNCha9dfIOG8CvYiLmv
	FvbuJ/gWOdlVHycevyFzCE001tN0XH++zvmwNfFMqS/FNBcy66hKV5hUC05pMyNCRhQSnNMDBiT
	NO8vXvBJCdIvi4AmIXDtrA8bOY/l3JsvMAvVGRUPI9aLss3j9QM54jo+ISG21GL9564l3QWZ0Xc
	Es8iO4GjQi+FxqWMXyWSC28ZOJk7ClGrCzX7KDh4GEbCnU5HNAtTc6MNdIlnaM5fpXf0=
X-Received: by 2002:a05:7300:f285:b0:367:50ee:f7e0 with SMTP id 5a478bee46e88-36a4244116fmr5219036eec.39.1793412571307;
        Fri, 30 Oct 2026 19:09:31 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:30 -0700 (PDT)
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
Subject: [PATCH v11 10/14] ALSA: virtio: prioritize staged capture period work
Date: Sat, 31 Oct 2026 11:08:51 +0900
Message-ID: <20261031020855.2402-11-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -161,6 +161,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
