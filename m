Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664287;
	b=YE4Xu+Iv0X9EVVtGpmRXLRSg52yd2eAzrXX5XeD8AYxrzmuhYUbdoazXTftFANEl8hh5
	 SlaM2C5XiRnAhtixCKbNCSRhozOfayeABlM4ko+HLEAvEToD/FWSLDaEkGo8mWoP9BmdU
	 u+Y2jSsdnl981HjCQR0X+KHzxJ/+kFQ6iRiaw8xOMrM9GEN/nQ4EpAn6ov6cU2BZvfvM2
	 auPxlbRBXENipM4e0+nQVeLT5HxQ5yPsBcPi7pLXBQ5RCZhvkuSiKJ5GhvG0sGDA+bw1e
	 51cAXH0DOcm0HTOkmZmodMPKId+UHShOaqtGQALQBePxkhSbZ6nr0GhQyb4MLhEhlzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
	b=Qcgij0CGfL9sF4CGyTmqlAKtFfmoLe7Of3Z/RGLX4Tacj0LWg01rAY6YgI0FQ8/AiBka
	 v+Dc5s0GMNmwSqZJ8Z5OVt9aiudT1lLRgzYCaNVF6s1BLuwoJweA8fXp5BoGuDZ48QkV7
	 mWA3xllSn3XhXuPXn9id9P2HtNOZGLfvDcwPwMskj5Fm6HGSaUZmVZh6X6PmFgYJgv7uS
	 D5J3GK8r+w7G0Ak6MmfiJcgevv0CZ+l//+VMs22fG5avnv0CFIWdY/CRJhAPiZyYxTOga
	 A9J7PJAzlaAVNEG/5BYRqTZgUmiif2G4KfQp4GZE0Fnc4SVHakUuZHgtA3pq7rX1ATg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAp2WmZq;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3231E606D814
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3231E606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAp2WmZq
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so86190a12.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664287; x=1794269087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
        b=AAp2WmZqH4lFkiQxMuPQDFOnleVHB5UP8Z0ExbOAQOUg2Ktwk9r0z5zhWiZ+vH1L8c
         O9gRQOAfoIPyyhtZ73n8FaRR5rwo+x1PzEf7SdnCorC9rr8/FKNaKI7kzH62MEqKLPIz
         HQMmt7+vq+yvJ4Per09QL5/T+YzTFOtT+iIByB6GEkMQPJJPYQQU8B3XP8jZuh/IDTlk
         pNcagp7Kb3nAHm10gAyDB/4VUsRUIOziIOqHVi/pO2VKRGOVkmMcHgNowQ3lNRi4MzM3
         VKv42ry2krMBnGPEOyPyCbCdnBnuI7XvOTutKa8pZk331GEjWJXnk6WSWkn255kWcoXq
         9s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664287; x=1794269087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
        b=SHwWkAapRRp1apdnOiMcJdpUt9duanWL046IsQT78whezX22v6OxRoYgMrk4zMqmO9
         40YWnuept8AmMgJoHISGRbnGifud0KjQ9S44jlbxHNR5eCujdJHoyYMg8ScQip/K6QYk
         iMO/9RyS34pisJT6HftnIotaYxUzEYx5FZRxShTXMMzh1fL88tjPFy0ZSMamHG+ckt3F
         LTzXxmTja1cuSFLZimBkI3UBfUXeleSnegYrUPEkqp8EDR0CO5uZsYrTbypzBpYG6HT6
         YFS2N92b+pbUNck6nRvhXpBtSA9w8IDNsVEMYHx/R8KHrAvSnoL6MkXzVxJ2El2SF6tX
         MBVw==
X-Gm-Message-State: APuU4Z+A7SAtqSmWYHiAjSVJzjG5zfQ/+M+WJiqQODi7SUMkgRH65mSe
	FGN8yX6OndtvKwW0XemfKVX46LYzmRslUmfW3DZWlogl18AT0i+JjpzRPlQmyw==
X-Gm-Gg: AYBFou3SAiXHyszrY5+r26XkFGBgu8RJAwx4OdL+RLOOGU070REVnx7h55BdQ9lUVBm
	7hZ+BTb08HoQiNt5ijxn++x9zNuRiOkQlMj+f8Z/jNMMV0esQL3KgdoL6BhgANXCZ7JVi5Dxltr
	PHpy+8aUu90KRJYpvQOhuzJ67hJS1yPue+wmonm7u9aczGF7nWkDwcWsMSF2VAemQw8YiZmEN7K
	WE6teMuHPiOHc6fU24ZQLdfMbYZJ4H9eMEPZjg2VuvYMXcMErKsM5x3eeSVZRmgJq2YDYQCOqWb
	V6q0B6SzPhmPgTrryq54VoFuiH+ci91XdVW5+1s9dNxOXTdh+rhHjeAA9SAmoXq8aY35Ky3oW8w
	ioMYu0UEeCxv/WtV+sKuAlj8qnL2kxBQtR8npluoKXL9kYOXfcuejEUG0HwA1BmYYYikvWcNtZ6
	ZPz4gCUEESNeFLJOSNDHbAUya4LmEIePpZRbyVhDkJPY+vWjUU0avwcSW11xRFSEAmERoFfj4h4
	s8wCo5HwXMI+S6mipG7HFvhqU2i/xxUp91tet+qEGUMCsIvwli58v9RjRiClNCfgG0mZ26V1h12
	GwEV74lH2mKQCitVnEmu2xcWw8Wt4AMfiEAd/qmTQ5HQFeXxFoPlYLuFnHbzuQFhL2cPPOXjpR+
	QEVN8lH9Xfaxoo4Q33+etcJ8oTPcN11waVBTtWmiHqbthCT3sZ4JdZEg02omMOz7CAzmu
X-Received: by 2002:a17:90b:4a4d:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ae89542f3dmr6388084a91.3.1793664286684;
        Mon, 02 Nov 2026 16:04:46 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:46 -0800 (PST)
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
Subject: [PATCH v12 11/12] ALSA: virtio: prioritize staged capture period work
Date: Tue,  3 Nov 2026 09:04:02 +0900
Message-ID: <20261103000403.67106-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
@@ -167,6 +167,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
