Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365876;
	b=JXEXMPYfAEdu5/FxSA8DWy/b18BXgVGZp4ph3VcLs7fwGctGc79bqF9NlSXV3noJhnbT
	 LKbSLdtbLrQ8I24JRRMDIlFCz1UI23mf5yycu8IGRP7Sb7OgKEZ2kXM+I1Zxi0zmsgAy6
	 R+0sE1M0B612jghgG0VCeK+h3HUTPh2jIPuCBNwKe60d8aHVU6o1acoaaa5Wa5Kx06gMf
	 FbwDOKZmdh89AX5T5uRvz1Vo9LfRHpAQDsgMoEcvoDqOemr8QRbTActQJPcNlAaUL8f2e
	 hejBe60eRCFhEmzUOM7YySZpBHYoK3goBKbVCVqhp63KvmsbB1ESD8ZFRrlAuG4N1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=SZroiOTrQyOKeRHZEOabfIZvXuUyKfR75930UXo+iaKuWuF0BuDnC7DSiRHOVTYFe64z
	 ZnbfuXZx2z4vDprfuNPzlA2u8VYuTTD5qqhbhepnjVoM4nzOFpkQhATA43n0tiiJJNVCL
	 5BMZxfeAAWm8LIXJGExFJjjM5Qie6LfREqVxTtU5/HA9eHijgVu2QJGjMu/NaFoun6Bjr
	 E67tWDy9MYJRV9/P6s0Lga5HNFDSeG+vLS1tOqn8gtSCB3DV+s29syFKsKxlsCAYf3Lxf
	 P5/4ogE/hkzwISJZQkPKuvoiFGTIU7djje07qqykaBT47aAYYpRhKf26eIsznWRcmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY5mR8ip;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14160A262B
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F14160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY5mR8ip
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4248081eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365874; x=1794970674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=aY5mR8ip11gGyYZQJiGIXv6qMAE+YdqQbCLxqehubKBHVVjhCC0iPEJyLfFmzj43qu
         YR+L/OwmelHL/MTC8TAE8Q/C5SgbLkwljBcQrcDsC71/hoTjVPjoyOtAzm62cWweK7UC
         /G+HXLCvgfLOZeZfNtoGuUiwNBTP5mtx2bomH2Icmwn6tiI7aj1mDixcYRNsv2LnS/Sk
         zek89M2vSCIMoB4eWVAVzWjWjsIm+IEd5kfbfQNBS1VBidQyjzuHzAzUb71W5pb2oMYK
         Y6dbhHknDUBC6jkg17PlmY1KJ6qNlowvkkpcqq3fKs+cNLBYxaf3ZCMOMkq0V27ILh8x
         2cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365874; x=1794970674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=Xh8otwlGIkqTFgt2ciabXTiWuahjv2iO7jUAd2RAg5lLZmNf8SkRXdT4DuR62TjZZf
         VRI2hb3oGLvNsw6RoT9OcAGgtPFFLTnM976a+LD9Wle4lYJyjgEqk3QgSFUTlP4XkMjA
         dQ+Vu3nSmYQ+QzWnUGu7fqcRTkE3kuApCoGLuBsIuIoBL65qJHGhd4FN7BjzXvaRL1Q5
         Erhy4Js97XcyuUFtBD+2hZTnhHMxu7zZ/+o3YTBHn2/FKtpTAjkXi+cIQIlolWtUeJHi
         IdXV9qBLgLD+bpanieCexEmQ9DWruoU9XzPDBsrzSV4xVqdcSBSQVtUZlk3twlqqeOyd
         g/ow==
X-Gm-Message-State: APuU4Z8aWsE6MtmuU/2Nx6CipQuTSgPBt1zef39wnBWEsNez5h/8AfU/
	RQBSlGz7w+WO1Sq2ZvOtr/9OWr4TV5fcqGGr+XGzXmiKaDn7NIOq+M+0jsie/g==
X-Gm-Gg: AYBFou3m01c6vp0nviDcdb2HzSm1ztXdEnRwiqS0Dh0b8HpOctDFgcvFWeCnSbTISNU
	52Mst5OXWhPkK2WjcOFj5DE8wqISjVcSXaNvnSJxm6sec8XtqHGv09yls1V9kvCJbUS6vVRLAuy
	G8IB6OVjjXmo4OfT1dS92N9ZNsQErR3U2WDa+GtsB4o9VHAnhrqIT7LAt/k8x8aN0y4KII0snlp
	i7QKUXsUDKn10ZzYbsPOjbJOrICXooVcxw8vcd9kGBZB0GjhDDkLdh3bZgdngbe7d02FvUK8LmA
	cks+szLobyGeBa8NySuJaB7CZUcaSM/TRpf1A3vZPWruxoLMBVV5JlDnnFdaPAlttNzj1TBry/8
	ty4NY9dv3pjw3UKFGzcVlGkq9NwGTPxylX2djzcWIxQWKE/L6bxfbrE04+CslHq6Y3XZOfVkEUL
	44jRFwwdH6EaDQ5jcsz8BKXo6a2RXb8oHRsFTvjA2hKN7TuW4cLuinj/DAyEOfXibLKNOyoWGCT
	owj6zSmdlYtCfhv99sbS3kOkoOGpuss79rXHmDoz7/CS7yJtb5WLV/ebcDADNX/yaZkNkc6IEvt
	n/CnGYe3t9NF3oH9f9ERd1WJN91BxVY80CSYA5wb/Gh67QlWgZty0HQYAmYENg+t97BIhPSmLk5
	VPaBz74amDmeSHLhOG90Jd4yafuLhHGNLN71lYwm6gLGLq2o=
X-Received: by 2002:a05:7301:dd98:b0:369:d486:457f with SMTP id 5a478bee46e88-37683861625mr1886638eec.2.1794365874080;
        Tue, 10 Nov 2026 18:57:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:53 -0800 (PST)
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
Subject: [PATCH v25 15/16] ALSA: virtio: reject invalid playback completions
Date: Wed, 11 Nov 2026 11:56:54 +0900
Message-ID: <20261111025655.63951-16-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -980,6 +980,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
