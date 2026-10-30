Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338030;
	b=v3QTb2xsy/dEABnSQhLkewCE7uN+o1dyrduCQ291q1IS7Znq3CJQyBhPFbH+hYVUVQei
	 AbY+HupA8xQU9TOcfLqxcKKlqEGjUGxqZ8czBhls307FQcd3ogZKpMMlO/7yMUfe8tD+j
	 QWETjqRu72P21aDsu0G/tLhFxyD6fqsbsIN9lj6BG1SJ2rul6Jtjx7J/2tUqf2jYv54ty
	 KPVFO6apsq66X08t46AcNoG5UBaWahiC6O5Vua7QXbBfmKNOpKASyJQda/Ok6Hq9sPWqS
	 11JqkA6L3Nf2HQHJVIMfpBap1Wb7+MwQByLCS7sH+vGj4gsYoMokD+dkmve6Rk6MxJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
	b=eslm3HvlkxMtAAWw27LPaJwN7Ts7h136HqIMHK3eQ2II4WnYTnayk6IK7fqAwuP+jhlM
	 3FDqzArXKZLPAyp7O3R61iDvfErEF9bxM3yIq4KKLOXpLwbZmNKodzS+qGMu+mRnMvlof
	 TNDi1BS3yIZ/CKPB1MxQJ2xXFxzEuaOYSTm7d5QOnJ3FC4wNhpJ1OZNdZ1CK1fhPqib2G
	 La8UYykT1IgcdHP/TAKt6Ah8QcYJFwdhVVVDFduamy/8e4ocAZ10LM7QYzTarT1xfEO9R
	 X3a+C6vf4eXjqFeP4ljyo0GFNBtoKCUVHais7aM3yjF0Od1QrO1om38K0Nelj+KpTyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLvzlVs6;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E279D606A33D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E279D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLvzlVs6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so190193a91.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338029; x=1793942829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=QLvzlVs6hP0Up4p+b1uHdE/0OZ75yhCf3T3UuEsBrDPr095qMJQ0bX5rMO2IZt5ODL
         NEcMCJDKSNILAzntGoX7GInybOmFblYr9Vk0bWLxPLw8lwoAq/rmZxy0e5+4LYlTh3t/
         x24l9g4gadtmUiColcLZJErwDx4v21AWfc6KOewjcb4ZhI135rT8II8Ay+bcPv7sn5wI
         CyY0dOyWAlzcZoMJMRNV681+SDH50JfXwDgmUebcLg6gWuXT0sY+dUYt9ietWBw8NyB8
         1IvKL3BNJl8tyZNyNla4iu+lPGDqV/HgtE/8u7jHNAy5Q2FS491lCYRhkvVPVofBOayP
         /m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338029; x=1793942829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=xaxVPeZsF20K+4G9HEb00NoXhDu8ww5uquHBMYg77VLMruTFcZook6hwHPeFrVpY4+
         OqR5fpSv8HFesX/+QM5W1XhfHE3gTawbU2yjL+Q6ay3prba2z15KNQJpAs3B4iUKOgdZ
         5LK2+7BeiludzIPuTaYKo1YT+xslWXAwLjnClydmocXOr1T9oc8IhS9I0tjGHAc+GkHJ
         nQg7eah3ZhPONQJV0yX8Uy0gVB4xOqKedrFTmJ71AenyBAcLaIKUquDUj9tIsXgLo4tG
         zpy6vjWa6ZsNNnImv+a9Ppi/dLRyBQTHfDdfcn9H+2ZtRAoALCMjA2L4sogfPyW+q1lW
         xKHQ==
X-Gm-Message-State: AFq9FYJ0L0sZvA5qAoQUmeEaXOnwBj5GLYLqrac+C0ziNuKZr+Lcxf2S
	suwJEQpXa3JTCHTbuRy8B42xBIrxQaNcxoB0QZvCo+Jb8W0Y5ZkDfUa4O0lTSg==
X-Gm-Gg: AYBFou3ZgHR6MbfIx9pf4tWmcfTpHgzBPekI8Uz4jW97Gu/6nbhorSiPFVVClsfidtF
	9UydDuLWu+SHUNBcKf7mumPbPlixKD4nAvw1dK9myGk1TwYeBPOeETyKOoARBwloshuWMCcQA7Y
	iiVmDAT7v+XExxNpBWafpofBk8Mc6alpSNjaySfnZPOnUYrOBz9a6rodg7yEUDscIB9zgi5Mj4Q
	4kiE0Me/ns7jd9IPuuaaydIGadN/NdSJirtPvBECIuHn3isUq79bxW34vPKHhV+9IRqiAm6MPM4
	0qc3kx13U6zFh1lBYdKqkgYNvRUlqfeTkzMt0o+yOCbfAsWJSMP6fK7J3LSYeq2lrnaoRE5cZ5k
	HcwNLS7HOIdLBQNTj+Ax+2SnC+hZkieo227S7jdjZJxfPqbehy6ddwWx+vFEHwW0iWXdZRSgtZe
	AIyhb5CfOuECYPw9i4g1a0iPRl2ESZ8r9tNGVHQhOJ2CL9ZPt3JDrfwrlhkq8i/jQoUTOsr+A2I
	+ZOtJJEivI8SXfpfdpPzZcHLm2t5ASxRzVxD2gF6xVuVSOxNW32sIZvTHhwBhFf9XnmZVObS7e7
	hgh/QeSPKVk+PX0MnDbVUBLM5Mf/YBX+qHGmt//pZP4u8NXW+ImxTfiS/2ckwsCOJ/tcau72VbK
	9sRixMYIPoCyKORfZBdYXfbnjKGNPTG1wC+IOOgY/KZL/JIU=
X-Received: by 2002:a17:90b:5827:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ae897c212emr943776a91.53.1793338029049;
        Thu, 29 Oct 2026 22:27:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:08 -0700 (PDT)
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
Subject: [PATCH v10 10/14] ALSA: virtio: prioritize staged capture period work
Date: Fri, 30 Oct 2026 14:26:25 +0900
Message-ID: <20261030052629.27742-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
@@ -159,6 +159,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
