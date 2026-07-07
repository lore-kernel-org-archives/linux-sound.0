Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B92F746D;
	Tue,  7 Jul 2026 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783390331; cv=none; b=tnpeMltbKVoGcnYTm/tyukviL8qQd7e4DxHcRyUMjAB6yeBeFA4E4RE9z0aD3V8+l6nnI2BFCOCi3C44xy+A0zOB5BeOVWmORb2DvrdEul0Bj5S0q8r2rfjYeD3vXhWv2dbS0nkExfqyH92pAKiCbU1GQLZ8xh5E+g5tWQ+UgBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783390331; c=relaxed/simple;
	bh=AcR8Qsos6urn+g35dW8f/j2HkCskKjpI8USLn5FoB1A=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=MPqgG/pP9ZqxiVRb5Kplxa00zMr/d3wk/VKIVjHzit7hG9wbT83i38twBqskQH1h4AMq7Y7Q/kAKNmwe32lk4uLK+AzSXYsFnguTUX1eigf9uyVtV80trdBAHmMVCJwwH+rzaPwQIO/Zu2AzYB8qTPdl/JkWPMiStUOS0tHNBtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=h3UVgfTe; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="h3UVgfTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783390319;
	bh=IUl9YPG3SwdlwhzxuHpKQeQgP1WAvzMjcDm7xxqCLA4=;
	h=From:To:Cc:Subject:Date;
	b=h3UVgfTenjGxKMJtOEmCL1wWsrvLBznlIig7meK0EcWBC0Rd2OcXX8MDNFCUk/cdS
	 Ofzgz3LDvIWt85nhrmZtlqJZhjuKhecfU+TFxNzQS28dyp8mfwTx9AhS/Rp2NWGJr4
	 GbMi0kuXz7DjnuF28I09DEDsC7XMulpzhcWYna2U=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2F99F280; Tue, 07 Jul 2026 10:11:57 +0800
X-QQ-mid: xmsmtpt1783390317th7rc4u8h
Message-ID: <tencent_8E5BBBD19D53B1EFCDB6E89F3B6246A70B06@qq.com>
X-QQ-XMAILINFO: MMvVzQSdFuTpF+b9/p3x7iOS7P5L2fNvTPmQqekJgH21o9aSG3Zk4Ph4vZqcb8
	 G95/J2e2OCZQq83kPeW0Jw4nlHgNM3MeXIImlV2Y3HSXZNuDlWZtnwhZppcP4HMb7M0R+te7w+RU
	 UTEa2XeQUAfG86rOSqsFmfhlMMwEsaPRYLg/evFeMvEkm/y+ZIAjS+WFkHR37moCBECKJ6as2H78
	 bK31L6IT4HSo4WKNunEXeL12UZ9R3a5vWa27zQKWfA5XN5eg2MlB0mTV5EpOuML+BDeiGPbu3r3+
	 jTzh+Rv7BqMt3r+iZh9Qne6skLUxNktUQGwl6yjSXTsZbvv2E+yAwTpLrF3cdrOzWoKu0HGNlNiQ
	 jpuvwrt9Afy52Y1hP84VUyWAJp8jb8ResJeiCe0LDCbRG+/x0uK6fUbr404VCzSaaJweAcE9WTCv
	 3hLb6ywu5l/cXEWtryhhFC7iYQ77k1WmRxspXqbcEnH9jaHpD5gWTbiu7rqpHQ90S6JTNcURLSEd
	 6tILHK92UtZfLi7jGf6Mz+3NpYCqbIsIljDEwRrUpMNnWUB//nr710wcaQssLjxp6dZjPnguz0vl
	 KR0hSPcyJiG0o7NQBsFC3yc1T7vXPzHFO86TxQUhidUchhOtaEltSSzSNbtmsjDLGWX7L223zJgL
	 XpWh1xBAKpEJXsQsI0/oYamD/AzmSZ3doLwEO9ykJAcVtwnTxbiBWqDjKFHHL36yzDjMwC5mp0eS
	 3N9MDSqfDXfBwIiSKoseDIdOuhHR4UJGit8YWAVKEBVL05QbcRhi4YVocIFYvrH/UGtBDCvGIz9r
	 StpbiymEVoIyboiSDQb3skb2nYoUPC4FeLoadio11pBmtsHhqPD46j9FT4gRswY7yPlC1ohbQJpC
	 tdTONzwTKIMamAz3jxLaZaO+c3/gvtZ6mph8mvtk3ZUr3fpo9hYbIZgpyiPH+rnw4F5+W4Mpdwzd
	 cbKF/H4ux62c/hzzDWyX7TieAckVtGgQchihQUQBv+c+IQkgXaJRjK2Sxxe7AOkUZS82g2W8xexC
	 3i4SDjUDZOscH47wlD/RovWoewyJpzxevmChtnu+4cuFs8DT6NbayVJ9mF5rtDE864hY5u9Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	joakim.zhang@cixtech.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/core: add cleanup in snd_hdac_bus_alloc_stream_pages()
Date: Tue,  7 Jul 2026 10:11:39 +0800
X-OQ-MSGID: <20260707021139.86846-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

The current error handling in snd_hdac_bus_alloc_stream_pages()
returns directly on failure without cleaning up already allocated
resources. While callers are supposed to release those via
snd_hdac_bus_free_stream_pages() at destructor, adding explicit
cleanup makes the function more self-contained and safer against
future misuse.

Add proper error cleanup path using goto labels to free previously
allocated BDL DMA buffers, position buffer, and ring buffer in
reverse allocation order.

Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
v2: Update subject and description.
v1: https://lore.kernel.org/all/87pl108lp1.wl-tiwai@suse.de/
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

