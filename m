Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693346;
	b=s8Yu/KdIO0be2ZprTfIqxef3xr5ncJSwQrXSmCEZnAloWWpgTDkWOrkd9gofDh1IZe1q
	 nHsjvtb9YxtVOuNhuoCLq/jL4FH9D7QYb7xOvDcwcDjKdmpDqttdOBLEkZgw8ZV1kzi9a
	 aRstPTQ3ALAPZVGMIUTCcQjL8vhyNCM+4tog44/R1G6yvOYD2F3Hi/6QGnEIkI42haOIH
	 RcOzqriWCUwyPU0xXarM5fwfUlRQEhhd2BHOBiWyqLY3TQpMyziDGiEZabE8CcS8qmvhX
	 7efb+Y7A6gvymntfMB0VYBq6jU5z4QocUsBnv5nPpacmbu6I1n1bDO4sBzABiOJC+GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
	b=ge75+xPouHXVJesn8Kdh3ekXo3mxA6FpnUZ+me38B2o/lFT8Ct+xQIXY4ehddsVLcr0X
	 lp2q1rVDrHcFiHmrIreh+6j8u2Nt322gstWxnnc5DkEDQyI85ljxvm7p7Ge0BFVJvwA4E
	 2zFGv/DKPFxqRjpQlYUBzf5MU7Y/3nd6o78Cd4sovyeyyNsZhr1PK+zr28K+M4ZHMyjoa
	 O5gxTvww/vpLixJaLVBnXJ3yK6VcQ/9uXT5vl0oUphnOkJU5IGles3zcspGURsyLnXjzQ
	 5HM4f7OhqtlwpRsJ3kZhahw1RcrPDZfhYEEJaHMnggWsz9XqB/sdYbzRwzKnq6/8VRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmwxU6AA;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE340606EE81
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE340606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmwxU6AA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so5327371eec.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693345; x=1794298145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
        b=NmwxU6AAIxAvJBSJQHxHHhgImf4+cVD/0tpmvK0JzfgVImiRCOpBerfqD50s4N+LGl
         kpADIbgxrbZUlJI+YXQKL3LpROpjYUyCsnN0tQigsjw+IHqpR8G7SJYwdA4tAM4GjlCN
         ox07vsYD2QVh37QBVT70Z0FP61h5+k5oaFLxQvs0nvr5u54bZhLdDBcfxyCeIIg2wQ/K
         wMA7V0d2F1MVO57lglsC/CWhmUmphaI/hBzywNWW91D/ZxNDzbArGko6pj2dslc60WRj
         h9BhiXGBtPOLbvUXk6P7/x6BzzSXp6oV1un04jo19KoMCB7jW+m5lzTIPMGM9FAPq9MI
         x3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693345; x=1794298145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
        b=bVR+62DY+bhltUo1L9ZsMwx+gMqaolY+ymYBQAG2q0NAVBzq9nO8GFw+baMqSr9umV
         ah/c+xngp0Ql5hRTcE58OnBXrq9OJfhdAkJRuKELEQbOziAuZGLNBnZ292UjOIODuVlZ
         bDriLFKLqdVLdDCPMaQHfI6EST6SVJAmG5R/E7jdbjsAATtDVEG03S6yODnft6nF5JbW
         s3KiJq6AoODP0tiiT8P9mc0gXzC26GL+1MssUve7GOmZEDRt6lHNEk1s68KsYgPdqmzj
         1Gy5d+Qt9ARMMnFZF99SRzBRHfb2UPFfZnchwV58AVuonyDHW+wEKeDhZQavAnjydo+6
         L/5Q==
X-Gm-Message-State: APuU4Z8qHc/eXXvFjw/PE00AlaJ31Hodm6ijsrffADmOBOD17wDSN80s
	UapFtrr7uI6Gzm32RdScrs+Pm6Gap69NhSKCiyHb07vFsyWBmww7i3kpVg6uDA==
X-Gm-Gg: AYBFou2vfq/5+6AHCJTYMH4CuKUHm3kSJywTirs+gOiAkbHrsr538syrhtNSpWAnh/F
	a8wf/CQ4V9CErJm1DQWtULKcjoZQd6tPZPS4xNoIHYzNEFAdPGLHZjE9ofVwSoc4WYYWCtfwbpt
	A8vwNpWjzk7EeKPCvdN2hJnUJIEiuSV97lA5YdPVCD5xfK1wnIvlmkzpPvk1ywLFKaCDiKn+x8j
	XVGBC4FfYQ+HcDGCZTOLtf7Gw/7Oi4vD55AZg8vN68zSFwKqI2M9XGtIYJdyaWU6ImNdBcC48hP
	/IbJW4/f+CQJqYYmNgpuhxtCC4viUN7YLO/FC3QmvHjIUcumLxnNj5583BR5pHW7bF1g2dRTjhI
	0bojh6vhQqWxVFT0q4Nv8xeJDRVSAGLyxZ2EK6FCFQVT5GEW9DSyDf4jMUzXNTv5r+HuxJGkDC0
	cy9xUzG95xXxIC3zhrcPY1pH2wURXrh3kX/wkfyw/gGU/78RGVBFHv43JNkWH/s8Kc2VbTbzY9m
	FiMTLwT5c7VEcC8Tyj/5AP1W5rakuTcb0wtMHHxPKcXeUm+0rHhBLiNr994zlgQ3rMHe+ugYlrR
	8YGoFNUOqKExLUHKOAFK6Tb3tGIzqFqV64/Jb7X1uOsJ/TrO5TtoVUtbrYzMVKY4xPahG5gaUAR
	HvxFOBn05oSY8PVU/gGYdvTd+1PIU3EbE0EfEctWLXnPU2Fk=
X-Received: by 2002:a05:693c:20c2:10b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a4260db8cmr20091240eec.41.1793693344807;
        Tue, 03 Nov 2026 00:09:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.09.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:09:04 -0800 (PST)
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
Subject: [PATCH v13 11/12] ALSA: virtio: prioritize staged capture period work
Date: Tue,  3 Nov 2026 17:08:20 +0900
Message-ID: <20261103080821.16983-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
 
