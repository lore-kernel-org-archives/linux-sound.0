Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BD3E00A7;
	Mon,  6 Jul 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323706; cv=none; b=ny2PXWXPaHYJGMsYiX500tcbcUkXIiutKDAuaj4VPoo0XimSSee7BWD5D6y2VOt8HsSu0ybFl6P8RRNf3Ye5xCiZ0Z4yQNS8UEu34cO+kA0f5yYpqlbaCQVRPTE0kL77kfj9LzD/t9Cp8jFcwFpgXBkGre7YG4OJen2WAp468fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323706; c=relaxed/simple;
	bh=VQDEXPZ8aSUOoFxCwwjYPQvNDTOF+Pr2YnS0HCXrt44=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ocxYpi0C4uD1dlE5GSjCFK0Kqd4eF2uPZxJr08dM5V27CGwDSt/Pv6NdJVZQALesWxlPw7/qwZCmEWBVesgmn6cRVjvchjIsYJzsVcnA5CxMbmBq57fa/+xiJny+0OF3Gqflb0fpjvt+yApLmuYcaoKSCMEbZBTqbgSmg2iMpH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=fGf/vjwl; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="fGf/vjwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783323689;
	bh=c86BqVRvwrle/oC5n5E0N5/zSz4hbqHQhsnYxqeqFrw=;
	h=From:To:Cc:Subject:Date;
	b=fGf/vjwlEKZQtS9eKUvhJqllwaYYoaKq7E0XkXp+yB+sE1kPOaRqpsAEpVo3xRw9i
	 L+R45RbDoiDYiuc/IOtbHYO0/mmYMKBP5HQT/nyl+0WFiKOkW8QFr9R7Pgq0xTHzRc
	 abBCgl/XFegLegdZnpF1QqhgjgLNW1DG4HbG+a4c=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id A5B3F071; Mon, 06 Jul 2026 15:41:27 +0800
X-QQ-mid: xmsmtpt1783323687tqg5n7oai
Message-ID: <tencent_B59DA88C3B51869ACB72BBD81D6171C24D06@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOjG/hvjRxQe/+olP1peIeAEqYS13ChrrHxlgRhU2I8rlasbCyVE
	 XwJ9HOvcgQFeK4DTz2p5jOeUwi/bXz1h+9Tx3crLDCoH8FbdnLoOVti8egVPZWa24b8fCrM6XN7l
	 CJlYAFtgAe0L4hhV2NnnVU6PeN+6P3tCO0iOBVl8qcw2KAbZL2onCqHIMH3gLt+BC5bJZawuGUAn
	 RfNQCEL5htfZRrbYvPsGtk/X+07kEC/OAdWIeaEIj9Zdb/1DcUsuPPXL9F/agg9ONeer90JeeQ/k
	 oQ3ibphUB511Nnib+g1uzsX95p22VOLSLLqGF4FoLiol+JHO1wO/uVXkBLq+W5NnLhv0M7QGEI3G
	 SHUoyU25VtBu6ZFcNJZHKvEDf7LH3m8p9hqMFIQQucFU48oRy7hkhjQQRtniETV2cn/mA6tqBIkL
	 zsOC0tT0tqu709342vTCVmSsTG3PtkLgZXziied9KxAjavMHDjEhfFu2kFOtU7K679nJp4GMgKfD
	 yHxufCrdOX6FWRedGirfeU3JzZcZr45wpKF9IeOwYkI+6be5OzSQHsPoqTzHuNz4xta21xOrmiKv
	 wJLjBkiEdUXgVYl4uXoHgjkZVhhBmHDHXJ15AMSsHpKhjjO3RlVR2ebTejfVm2n2OxQRLfif5/rq
	 wUZNxsjN+mzrvFbFPG1Fm/VOz5oFJtJsdcMdWa/7yKVzdAPG/SGAJYr6IRMElW96ZLEH1I/cSDBn
	 sxsNosfWqIm+CKwTYaiep1xlg4N47IKTPptKXMDgJ2GT4zd0483NHM+eOyLJ3alLg1WbliJg0WIC
	 58kC6Sy0fN4WQr8LZpFdxhcpsAiifSZtDm/K6gSRVo12EQCWK10gRQHruPl6tyel3tBd/j618TZ2
	 WYG5hsU/LOXb4tlviecErB0u0h2+oRex6fGo6Xfw7+QsMcBGdetJfPq7aiBuUpIe0guH+0Xvbceq
	 UkRT6UjzJz7vQz4T+tvmCB1MeBEGD8WcYuxPa9nRIWaPOINzh1ZWzkQGMMuS7Ym4grJcWUC3j728
	 PUNPU1d55BiHqaoHpv+gtY07wIwm3iuAn39T/YBcm+qaC1GB37
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	joakim.zhang@cixtech.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH] ALSA: hda/core: fix memory leak in snd_hdac_bus_alloc_stream_pages()
Date: Mon,  6 Jul 2026 15:41:10 +0800
X-OQ-MSGID: <20260706074110.382226-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

In snd_hdac_bus_alloc_stream_pages(), there are three memory leak paths:

  1. If snd_dma_alloc_pages() for the BDL fails at stream i, the
     previously allocated BDL DMA buffers (0..i-1) are not freed.

  2. If snd_dma_alloc_pages() for the position buffer fails, all
     previously allocated BDL DMA buffers are leaked.

  3. If snd_dma_alloc_pages() for the ring buffer fails, all
     previously allocated BDL DMA buffers and the position buffer
     are leaked.

Add proper error cleanup: free buffers that have been allocated
before each failure point.

Fixes: b2660d1ebde1 ("ALSA: hda: Move HD-audio core stuff into sound/hda/core")
Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
 sound/hda/core/controller.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 69e11d62bbfa..5d8731447ef6 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -713,7 +713,7 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 					  BDL_SIZE, &s->bdl);
 		num_streams++;
 		if (err < 0)
-			return -ENOMEM;
+			goto error_bdl;
 	}
 
 	if (WARN_ON(!num_streams))
@@ -722,12 +722,24 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 	err = snd_dma_alloc_pages(dma_type, bus->dev,
 				  num_streams * 8, &bus->posbuf);
 	if (err < 0)
-		return -ENOMEM;
+		goto error_bdl;
 	list_for_each_entry(s, &bus->stream_list, list)
 		s->posbuf = (__le32 *)(bus->posbuf.area + s->index * 8);
 
 	/* single page (at least 4096 bytes) must suffice for both ringbuffes */
-	return snd_dma_alloc_pages(dma_type, bus->dev, PAGE_SIZE, &bus->rb);
+	err = snd_dma_alloc_pages(dma_type, bus->dev, PAGE_SIZE, &bus->rb);
+	if (err < 0)
+		goto error_posbuf;
+	return 0;
+
+error_posbuf:
+	snd_dma_free_pages(&bus->posbuf);
+error_bdl:
+	list_for_each_entry(s, &bus->stream_list, list) {
+		if (s->bdl.area)
+			snd_dma_free_pages(&s->bdl);
+	}
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_alloc_stream_pages);
 
-- 
2.25.1

