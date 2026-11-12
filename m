Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458167;
	b=YMVKUKDmTkdtlwPbw4Ne/O/2zwtLTUHbh8g1hDcTiDqiJPC7n9xTon/HuOlyUgNmbDDL
	 cF3mxpnyoYpwx8Yqerq/+hNI3FnB0TmckKyVTykXMdX2l5554q6Iupwmd69/Jbggwa5yh
	 j7O8+djCVDy/RpXgNTbUFYt46Dy8MrrmsOLxguvsdM+hNvTtsXkx45xg/o+3Y6yMoHMFD
	 MZrkIn98j70+asBQgJyHKgoaEnWvWHUqaTUDtBWqTC0/ltCwihDtIIzSHXk7rw3fg8zmz
	 FSzQt6e9FXTVNdpxITovu95ZKAI5OyLEBFdEwETaYV40UR62xkZviY+q3rJoqVupVjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=P6r5IMcfDaiHKjVMyszv9I8M2C8+wXs2V31ea3II9/E3nFXz1S+R8FctonZ/y2rFh3zD
	 Kz0IaoIwdjghaG9iKPVbrmKz/q50/QobpP6MzET1dUv5gzQDecd1VsV+PLV5XkRUo5wYn
	 JngosHJDcs2SjQeYp8GgqtxOIjMctzJeU8pXAkXiSY0fmbrkmY1scyPltUNGmNcxiumdq
	 gcU2FiGmXWrACoeu1bgZTypxlfhW+4ughSAuP5YMuCwxtk9B6klg1KHUdnjZlpTbo73eQ
	 ewdQ9Q7pSZjeRC2TGexT6FxcFK6ed2nKy/1JzCrxPU4Ih4Sf5/6B7HbKF2CIcg5dIpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj1OkUdt;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B8606A8BF
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9B8606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj1OkUdt
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2107301a12.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458167; x=1795062967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=Rj1OkUdtmbxGEVuEwq3gv1vxTpCakSmGThRFYjHRytKFYrE87uT05b5Ts+d5PMxEEE
         0NHFjqH681W2ACMe50OI6nvf0QDDgwVDeqFplhLZIFL1EldDU+TP9Sr9tdWPfu6G3Xj4
         a5pFxBIqg8jD+TRXi/Kil0qBj0BOQ1kU9JxjbYOuuDzoAY121UtZ7AsOKRMf/EzCzlo1
         UlEbZxJagD/5fxQ87QB1yFhk+GBi+JipQZ7QleLsf+WQcg2D0QGVnrdHKigu2ekxrOe6
         GDYcnlXJcyFw/9aB9/F4ZYNFkMApFNCJR2Loqb1grYZY+ids78ShmfH3CSdDhx9bn9e5
         A6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458167; x=1795062967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=A/mrx6hAbW9bw1GLDqcKjgWcRGi6+yFEkDRbNEAX7A5jowdlz4D91ojmMUerzSgVhA
         6E2E2YpsdKkj9xul5ot5DdrRbP38wa/WJG9tf7RPrk8vi9BxSfHcbQeH6PdiimS3c7ro
         ZbHqxDop7LaIeEEucUMQtiO2/u/f1GE6fDe/9b9GbbAF/+jOhtPTi2LUx2atKJ5weATx
         x7YamaQaKrHcarXcFZpxSHuDac6USmWB7r6LCYRWjIrxezqAw1a1/0ypLJ7S+nFvDw1q
         I+wg5fN7hF7Wpbnx8yUEashf7QcNC1ttspwT2+mPCml6lmZj1c6O5aZORqOknnrkCrKV
         QrQg==
X-Gm-Message-State: APuU4Z+SQ4ll3NGnpxrTXZjd23v+3P29mp+Va7YKEi5KL46Kc0I3V0Sv
	lRrQvn/jXaJ9XAdMFTeWwrYx3c6SwuRitWsXzgpsqCJHqhww0/JzCohuqWoYIA==
X-Gm-Gg: AYBFou1EFsDDyF9SATEiXOH0w8+L+63P5pOyzbdng8AQdAIeSX/I+mkzUhKvzntEzAM
	FdW+nxOED8SzKC48Mzo2OYXPliX+Wj50ARxphtuY7O2ucv1Y4BNynNoHiCIcH79j6i0DyB1m34W
	fUUVNRw0O8TxrvDZXzh/cFnv3Mtq0+3yUCg48Cc9IcqzuDhID78rUFfcGbBFxUkne9QSyvOlHc5
	0a7Cdk1M7ftPI4Pfjc8j3+rZWmzY3bE9i7AitFj5xX0fjyoFl8MExhRAGUEIfNiB7d9u3a5ZvLy
	W1w29s1IyWieLNRbLhuzEjkiS7gCAiLbaByPbAr4XzznUcm22YKKjEajGXAJuF6YfYYCtpe7S7r
	LOQzaTNMDOv8nkVps4+toU2dKais94MJmTK8NyC9mLwcZvNu3v6EbHviyGVF/kfYHnimY4mkQ6X
	ZvOLpy0Ig2fhXNT6a20Ft1fOlL7b6+BFX3np2kVyQsxN2/NEpRGNfLlZx4QEicphqq3/Yb+fp8U
	E/LqFX9O9ej7l3kEXBVoTMEriGzzSy66Gm8gGYcWEaZbG/t/VDrrf2rhxWaZ/6iXNwbFUROR8O+
	Oj0Jt+gArBXfHy0kd5v2d9c6p47XyxVDlnmTYliEuuL3jVQ1W+ka5PRGpiwTxY3OTfOW0/cVs4A
	+hKku4ml+xYYvwOzucG4qyK7Aaxy8CeX1WbLX703JfA79rck=
X-Received: by 2002:a17:90b:3b8c:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b182ee6991mr4517896a91.45.1794458167001;
        Wed, 11 Nov 2026 20:36:07 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:06 -0800 (PST)
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
Subject: [PATCH v28 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 13:35:12 +0900
Message-ID: <20261112043516.37010-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
 
