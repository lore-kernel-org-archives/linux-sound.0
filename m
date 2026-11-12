Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466225;
	b=ePSz0NzscdprwBsJgplfbJIrcdn38FQ0bSSD0O1quIKGqRN7ze3uueQ7y/3qIO7ntSti
	 yWY+o36a6qy5ktxfr4KqsVx5HM2/f29S68Cn+mgE1NaSanc0/3ApJkpwjCYTNTJkkn59A
	 /QYJ870D0S5wVSnz+116L/KMRAN9Sz6yIS+fqvH+UDizUBUTKS59LhZcDKTDvjtvzymTz
	 5hV0xy4LXOi6h3CV0KiQOgAWd/aRNcgc0VLg+v4g/HQTmm/lrEedZu37N30qulByWTg4Q
	 bitUvtXoWninyIhsSEeNqoXP0gCshJ82rRriKvMb0BY5oa8fbd9rdW0qM8JIWPMooOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=DmqRkPHAz5w8g0apF3IF7oHFo7awNxwOO8Fx5czC1/7VscaFAA9NmCoyQQ+POb6j7vwV
	 vEv4W0lBQkp+McJV/lTYpLF4xfBDOr0Lky5b9qbTDt06+DA5vtovqdfHJxZfJrie/7Gk/
	 JpRwWomiRrMg12WFNkUuNwWbwPsvSC+4JNg/Q5qaz8TzaCyfMiPzxfKUQax+jOwg3fl+4
	 6nEQFWsIBal9rJqhETr5/JhIlEAjCOuCA10Xb7ex7+RKYQhwR0iS0VLD2bkgWHKS2RzST
	 LtHsA5gF7iR2ejNVCVDaFvTaVI2d/E5CCrECMHzHLjDDnpVu9zsyrvfcQ6Du/Ha4TDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFv78Z+k;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EB60A2608
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1EB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFv78Z+k
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1968614b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466224; x=1795071024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=lFv78Z+kgkepJBxfjk8Ae6P8qUJ+/yJr49VR3IOLefzWRcStJUMFXO2CcYYj7oKM/y
         NJtvkrSiIy76iiAt7g+ZCLRxgeFe6S/N35VAVoulLWIJ4vfAW8v4uNtyze2FLVlrSM+D
         1G0BRa6rICDOnQwhzRizWZri0/A0BklRRMUWddg1fpbE69sPjcC9gJaCamz8Lj0k+5zN
         5NZpV+B0Rhsd72ZS588Cqh4ylsH8EZGeO3bC8HoN12nwq4o9FSBgCP+xEOD2xe8bfzNC
         xHwIOZhchpU1vuQIRu70Q1oVSajxw3H86P/h8HDrF6169i+1kkOPt581WaXSyLpRjTPP
         pd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466224; x=1795071024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=1NuklgSqTHvt1NQ3Pu7wW9lMFB13i0orWXzFfPoprnpx3/dsc0bsDdq6BarTiR3W6B
         CG6kpZUmmtMuS2W5I4WzEehBIbsAfafKX0E6gVrEROwYQ5Ke76tJtb7TEGFcs83XK1Um
         X9xh96koV7qC3lg5ztF9JxapqmvQK9J8tUveJcVbveGQmcf3il8TGTRmVCUssGrKe+Np
         MpY4AurlG8vfLxWbe93OENDNCPuUh27vpCrxRtZHsxWAFBy1owLi2nUL3wru9yc9KZ9n
         TQtTEY0RpC3JC0oeP2dufD4swTgvswWXtJjWdbwH3w3ZhHYY1+ovsSHlr04zUwzrUJhG
         r02g==
X-Gm-Message-State: APuU4Z+3lCU2syw2Czu8qWpTf9oY0zh1cOVSUJtZdzeFMNY1/E6sW0hR
	EO1AB0d/bMt/9KOWbBUqneTcHLw9TF6EcNSnNP8MSo9+HHvULUZAB9xJaD0MTg==
X-Gm-Gg: AYBFou0C47Xl6H7sgv9+wJ4t12Ad9W1B3MdzjnbXNplXZ3uO+IF45bPV8hTr5erMA2J
	avZ6H7sW4HH1gJ1/9stTIJj/2BgX1iGCLZ1/O8AmcPwwIEcdLLISe0quFv5LLDXq1yt2zCK08Op
	wD2IdQ7h9lU3EGBroggurJi4hnX3vjdAVWS+7SpCPwYNDbWDYD4nU7+9qwZt4KK0qilpkw+PV1A
	TgHejj3Nj4ZGXjExffsavJLbRscWSjM3weq8CBtVdIVv5nW4xEyWTX2otkjQQQy+xbMBAQDf2Mf
	VDDASing9vxMVyUcn/HccRLbaQ8t/13oERarvX4UAD7OP/EZqEKhSpX60uZE5mFreEx9Cxo209b
	GjftbPVQ/ECRNaM9PXKiiMbRL4hTh3IgViguV6nnmZvaqYzmPRvN65r/dMNM1AD/yBaa8+9he/S
	/ai5n0LeFVTIEBUlr2jrf+cYOSzPtxoHo3grJ7MkbTFk18KtTMeNad6yu6bgM5mxoqzvtFCvGAw
	u2lJdJaOvaIPQkoHVzUGCDqG5P1YcidkiG0plyUYM3xCM1n1SZ6epmIx5LqjhwKV8Wg5mXN6Hf1
	n4j4cub7WXtgQqxJ/Or+/LtsrJ1ZoiyrUXXQR6FhFwhYeHezREkL3GKBPqBMlmBIvaIag5Ap4Rm
	RXjv2OqUcEeeVRMa+nE92asi+u6GmMMkeseWaFc68nzHbhv4=
X-Received: by 2002:a05:6a00:148f:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8bc1b6ff204mr5007644b3a.10.1794466224163;
        Wed, 11 Nov 2026 22:50:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:23 -0800 (PST)
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
Subject: [PATCH v31 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 15:49:25 +0900
Message-ID: <20261112064929.11211-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
 
