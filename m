Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365869;
	b=rRIgUpd+a3mbFS/8gI21kSWhberRql7/+7MnjtfIpwhHVxH86pUQD5XjkWCqQTA16IBl
	 fk5hItW0UQV5Sp//v8gM+UQ1QGRHXHw+zGSSCgy72kp/ypTUwzdkT1Uom/hLUO0/kWSqu
	 N8sRnxUhJN9A7iV9rZ3IAym0rbscLcw7QLDRiEhHDSpUgSVJeU2YhNLtG30CQ2/0KAa6E
	 HhALSWpzF05IsebP12H0yeqV7ppFN7ZwX7AlU1w4QgXCym1uD+bkCSnENwkBMU7bK8BOk
	 6500fjgIIbgLWjycxSn/IVlNcJDv+EHs8FcuZoAqwwXp/2Pj0RRcJWBT4UrVSAyQ4AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=h+DueUTBCrj3m67HnHo6uXgRyk1tOcjcjOKnPLQ17tIgQCu26M7ePul3ZFBF158VDoUo
	 H5l+kXnHQ9+EsDQM6jisJhNJp1zoRUO7ofIfsDPv70ijQi/9HPsHHj7IrDkwDotYbD+98
	 AK7rW/JeDYltLCM8yCIi5kci+N3Ig6J99/qAMDBwlbQWT+TNWZZ4+5AIi0CbTsZGzgfnW
	 SHpkyfr+Z6Gw2vd68fgCrUB0ntDBv/DGFnD/zXVj38HzGAGzl0M0+ExRwtP/sgTj3Ggg0
	 pLWLG8hGqsMWrrOOwzk4GkOyou1cNarCSq8MlQc3E4T6E0fxzYZq6eiI1rM1hVx1f8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIOXkCyW;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DB60A2600
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399DB60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIOXkCyW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5399196eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365867; x=1794970667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=wIOXkCyW6D4e38mrvp2Nhg93rnQuF2kUYK/nHOLMusrVKtSbi1cOvd80plSMPUALMa
         ns/7ufB0dgUwTAQKxepctqMwUpjoiG32qQ0khjMnpyuu402JP5aeydika+k6XFFBnzNz
         jn8I/jxUUcPTLGPvr5jTDGX2+rBTe4bK9CkLg08ve4rPa4l2ChCaAXvBZ05tkINhOh/M
         jPKrm/6poiNe1jKGRLTuaNeENEDIbx4sD9/YtB7zCAcX74OK/YHarh7lyzoKFTY6ZKb9
         suU+Kn6q56cRxD6DA1M4EpdVdiWBBtbC0xCTZjK4QZnpgkJlxpQzBv3u5IKw+RUqj4Bc
         qkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365867; x=1794970667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=GfKTgGPmnh2Y5xf5PU6ybvcKHrQiJ7esOmallwg522BXYVOIw0wZFh4hW4lOTSYT6y
         LhUJhj90OUJcN9mdfgGBy4GF/YuEvK1AkNxWdD/t9kcH/bZrXRHQy3Vaqx0KF0Y9hX+n
         i4sazO/TYIn9lZnjgzh1WS3QiGcKQ2yFBudUp8PAkYAUHAE9zpJQBDf7/zdEJ609yrUA
         CPK89WNU1DRePxPNj66jIg+5M+QmXyxIYA/p0LwJHSaXL8drEeO4Nmczo1K+vrw0e2tJ
         aa+HRwQuNdYWT+1+p92gU6dQHqFMVCYc4ZEbnThW4U91Deand9ynfcqOHVmZFny03O79
         YIWw==
X-Gm-Message-State: APuU4Z+Sa7AqDoFxqpEJ2DbIMZVtY6oQWO+MNMHBTjDiTlqGhKBNG4WL
	BqRx5K/1M6uj1h0CNhPYGJI1Oz/u/9GQH3wodvRTXyNJUOBYz5FF85rbX4fhQg==
X-Gm-Gg: AYBFou2Mzjb5kX1rwkD7KMAqIUYeeDJZYWzySsnE9gmqgKdG8bCyOYxaIhaXFLJ9JO0
	2MYUOFr94lejy0VOszO/VFsoLfszHCTy5rgHImQvLtINW2qeseptK7PH5bDJrXJMhUYLzdNy1nx
	B0v4iu6YhGuIf1N/z9oY2jryAmZ42DZefUusghrSJr5BXXMLagrsHbiVh6oFGNXHDyBMi588XNc
	MiVIUTHqAk1GewWadQgceQESs6Q13h0gWy7bGOOn0FXkLYJmp2IedGFt98g42EtuH24of4HIpaE
	VhV4ZKyLgNppgl0vD83y2/quSfsGzvwN9Qv0Ye0RMTHA3GuX8974CO1aqqknp3OGy+PEovmUvVE
	dFUvKHUa6xNS0uFWN0siClEX9i9vyGz30GVR0Jo6lB/4mNMgWfrrCcIxk1EyTJgQO4F/KtjHsPl
	VwoglZe4a1os8jj41IyzuToY25yQGCxfeI/D1sR8CfBcAZlvi/B9tZagGgg5ztP5uURrzQjJTgw
	Vn0Sl73D1Ig7uEVT8OCUpGgZKwS+8aY4tSDnTDMuXcYV2qwXuI5EwXSgh6RkNPxKaYCs08F6UT1
	NltP69HS5Wp+SLX/uQjWVEpM3hQv7prqBV3TOWsSlY3m+y1IRJmKsAIcDp0DTvDxbZushcPKb9c
	u55/rBRYPsBbSgp/x2dqY9NiR75I0/40wKAIVTfIFjuso9VI=
X-Received: by 2002:a05:7300:8284:b0:372:390e:1499 with SMTP id 5a478bee46e88-3768675d207mr1771712eec.21.1794365867258;
        Tue, 10 Nov 2026 18:57:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:46 -0800 (PST)
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
Subject: [PATCH v25 13/16] ALSA: virtio: prioritize capture period work
Date: Wed, 11 Nov 2026 11:56:52 +0900
Message-ID: <20261111025655.63951-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
