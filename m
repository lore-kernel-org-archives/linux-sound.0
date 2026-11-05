Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862572;
	b=gzpg21sJJA8K9bMj7G2cMa6VPZ0AM3QeHSVxek8i4nXxd0WR6a2Hfp6vFu6u68u8s9Jo
	 wb5KlvPI9AEzXKffR9YS1nu8PlUXhMpRL8zxFLUzgcFbVQg81iOhC4mFq5Qt2Mg/8VIM9
	 v+SWPMlhndgXTzc1tbv45ynLXiBZIAfmrr1KQdQywhrx8FwnQ0s7Q/MB395CAPzUvZ2sx
	 U3i0GQ8omVueUKH9QQPjxXu8I/bIqgc40BZoLpry+XSvBzLEPfcjkiiwcn1IjUHIZ+LzS
	 MTs4+p8e+hESKksgequqS9Vkyy6F2c3Wx0i+01nsVzjzRNd8BHydy9p2Nzy1lujDZ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=I2tcHsNIXTFwUAwNmxNxl+AQSwc0PpVs2H3EBtyw048YfqlnO4uabjp4ZEIY/jXKeCEj
	 3xx9iGnIIUXAbdx7VTiZyfOMQOKM5X6e4d1Ek6Q0O+WcZGLRhZgdM3ZiEtAZN3DcGsXik
	 pvFFPwcS5oUl46ZpRakbGL45AYVhPOQtyrcDbiQvQ0Wq98f8VFbA9WxPPMng9B94Wsc70
	 ZSsvC+rMOETquY+9tq2Xk90uhLEnbtDqJ+Qn+iXuwDt0xz6kux1LTPDO5LalJYMroSzKl
	 5PFXommeju8RgfoW3o1me7IKq3DzgRrYjXGGMBm4o9IJomJbtNgkIPFsuYi85tDwfdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at88dH5q;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A883606D83F
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A883606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at88dH5q
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2329525eec.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862572; x=1794467372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=at88dH5qI7lHb9egqH+hUXOqX1WqfuRrXRQhay6SFrOiPFxFgiUwzovkfbs4PicPyV
         bLecinhQ5isLl0hAyRu0eiS3k2TEdwbVFUMaiHMP9/y/J0QUE695ZsUxgPVkque0K8lX
         5EH9d6KKjqkf7v9AlvKfE6m4usmHE9ip48S+ImcAx4Tg9pXrVLLxH4EWHksb4cVs3ksB
         QSzIF2XUxWI809ND2saGZHmJvIKyojHtjvtBuhw+2OYJuWi/+LCwpqcQtWDPhTVCT97s
         sUObAbIKRPhLkWSEQltrt3l3wMTROjfgNlhmjxGyZKSKqb1wcdnWHWRmaFLrgkbutGJd
         sSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862572; x=1794467372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=X9gJgEhwNy0DWayHQLUzCb+KtEmQQtTuZdzUPFx9B/einkCQokRQxnFA0Hr36Q9bFm
         Df0tulbXkGF+1CO+mHH7akpqVUVIDdM8aG+9No9t4XkIXLAXCa4KGfu4iMTubQvPTdtv
         vRd96pIzz/Z8Cy1cZUio797Hpc1Lfr0xODIr2wglyLftCq8os5RrrNVI3XAKwORw4PxG
         Gp0yvXoJeC8DLaX7wsMTujHR/ccHIYA3u3wljRZzbfbiuv+Fjjt/PPuBiHLWO9xltrNt
         uwSygy44TzLI/T07n1r/Wp85Yt1sviPl3JwaSgZNo+ML9qnNA+UU16uaNvcCnGsRuB6i
         j4rw==
X-Gm-Message-State: APuU4Z9kkwVz3F6NIEcKQ33fHbE+963FtKnhUWnhaOOoQqdpagBTj916
	izZG4weOPzpDogBeqWBVuRHx0Da3QCT/8kbgav2sBnnqxx53oDNrZCUQsvlPEg==
X-Gm-Gg: AYBFou1sQ1qj1Bt93PgGwMMKnPLsIfPIU4HECY7ytl4rKsMTXddYSebUAGUu7ZRNEzc
	ADvAdo9KOmM0HDNPgnEYeSHrxnrcBe4Od/aCfuV0lF126b9R+yrEtb31zrMtAdUSAc+XuR1/7h+
	2pqyY4m7lccJH7kdeuomcygsHxrmVEqgJpSuBxNCMNw5lnYd5Vonl/0/R3j3DfWiuo7OjelAfBV
	9igckUP+qfzNMyvy2W6zxwvXc8vEQ5e7VCtn96TDY6SGBMsBk7Y08UanVdUoz4lcSgU8dYv/kom
	63TGr6HROwfO/cB9pXFScJ5o6Z9BPCYdYg+lLv50aw5Lhf9bTUmUUouuWze8fJ/0TbmSfwyqA/V
	p+sO0F33Nto5wJjZptBIgQ/qBboX1aDBkui5pFV0O//DoFfo7dH8JE4LWN1rFqrOVVyeQzkzWis
	TNyd0+itE3gsD9VtSHSNYf93oi/2F8hOMa6miG+C2tcFC1+KppD0E4E52K89OGaEYHfwTABsHw7
	UFwFWBfn43c9YUG8j8LdZIYgX+DSDg8+z+unu8ATJBUF0PknALI6IHlKMOBJe/rQkYm3GI6Wft7
	c+a6dI5xIMzKWE8BsseJ03G4h/MavclqeL+Xh5PDM8V5xGITAvXqackQfIri2dZ9rgNJTZz+GNj
	nz2r6MBkbtOu0YbZurkE4LcRpqQqLERhVa4w7dzrOTWTP91M=
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr25031192eec.30.1793862571510;
        Wed, 04 Nov 2026 23:09:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:31 -0800 (PST)
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
Subject: [PATCH v17 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 16:08:44 +0900
Message-ID: <20261105070845.6449-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
