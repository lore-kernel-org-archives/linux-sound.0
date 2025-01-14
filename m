Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DF20CCD3;
	Tue, 14 Jan 2025 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891791; cv=none; b=Uy++mweAZEumNYbZ831pJhSIvpFIDdmTloz7AHXNP+EHXIbG5JK0JLUfY4jG8+ygnH+76Rln6XiOvvkOPyRzOh0xztANUcXcJg6xNwmx8VQPagwgXsK4xDXlkWVyn+jU3v81PT9HysVVRrzApKmc1B3SZkA5Xx4Ci5vPoFKUlIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891791; c=relaxed/simple;
	bh=YiGSrw+sZIOzZCFWSYN6ThVxcZRSHn7nbt2AkxdcUao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUBZfPzl/6kinqmiAFWba1GLHaJIsf4hOc174idUJR47HAxgxRDwSoEkNQOZigqEqcgfL327ce8lDpwphL+zp+WHXAoXSURsXCexYyAss+Qq39tv2r9COSFCWIOMxxb0d6y19FIpLHR6mPDVG9rXpfiVIVSrWG8DceexXmoNjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=RBWIj8XG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RBWIj8XG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so3117333f8f.2;
        Tue, 14 Jan 2025 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736891786; x=1737496586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXKWjW33EVmkp8rrg/80R5P4ho/zMRHeOuQ1bTbedC4=;
        b=RBWIj8XGJeThjGpNe0/ncB7OqB8UCjDEoMYeKDQLCH+Qn7Ep11gEAcFdNNgbNOdWES
         xD7/vITTh6qxIFi+9nzVCWHu9hQCeDz0nEU0gQQGt+JpCB2raXGbic8Y0KLzfsMN/RYg
         8jcBwqWZwcjusR0UfVYGjERfY2SvrAy4Y0zq91n8GSb5cmsurQuZzLmn27b4R+7m3r1/
         woZ63MqnPSd6i4U23kMRzVHKoCgck7u9VAIkJY7FvRN+aqnxOjN+mrq2wCacoN2eFiIP
         8K6/r9LyqD3ka5FugjsQUc2zbsHwFKOjJTZWTL3pBxVHKIot5rlhxCxuYn0jj+8jtwpp
         Vmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891786; x=1737496586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXKWjW33EVmkp8rrg/80R5P4ho/zMRHeOuQ1bTbedC4=;
        b=M1qH1eWzYzTFIdX2Wodx8J3wmJvhKs1Z2ONN/hJDbs4pPvFOhGhDPtr45BN5+SooHL
         l0/jMhZ+OiXrJYpCSTaaJmYMpQh2goyZljg1uD05K3KSpOgHTVUmBKL0qQ4tYfmIvxQS
         fh2vE5zTGOKLciUD1Aw/lsXv1y1zwdd7DjECSHklDXekpV0mXNiZ2gaDZxdmCvirBfFi
         PyGoi4RV7C6hdFTUjkQ/6CoqA3kDHpjIBpFt1watHylJz1epmLSt+Rhnqj9faYNt2ANk
         W6rLe+rc7JWB84FCqhpAU3aTCNB7+3RQevhQpWX23577jKFoqcr8nY6x9ObtOYNl1NMG
         Ulyw==
X-Forwarded-Encrypted: i=1; AJvYcCXFKfM56RqsHzePmc1ZQWZ3sPydgxLPWBPHXwXOi3PZUagyQIkOaWhPpTNaJ7hCbQh4BGxjYMS2e7pU6h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqOy8szzkrcQ3O+VRyA6xko7geHFTbNG5b/Nu/TShPJ2Ou0zjM
	Xm1Kcubyd8TNRKHuB9fmOxLd5pZ0+8vKuaUlEWx2ZUWH7fjpLlRUBTGlxunC
X-Gm-Gg: ASbGncvVsxX2XB9IljegK2CMsUl97ImPqIUtnPIb9WGOEC3sBeFViWPK49pgdw1r5Sk
	KqZawoJT1AbUK9xf53aeHbyj4vyyrfz2SLodvow3crvZh9v+h39ySnhynFFlyzHwWAX8XsrmZZJ
	Qfc6F3kyPxQ8a/v2q4TlW7NkvgpGdGKdKRKefJVF2sREGvWEpFomFK771LDE6pvKwBba1Hy/cCt
	QUe1XQsU6rZ6sEff25b8CD10sE4juV7qVBAGBC7VUABD4GhrcIzu0HJTLxwrVwTfpfEkSUq0WL+
	+pST/8U2QZ/njq2H/vudIGXkuvm5rvxqEyxcd/snZzshXKxnbRJBLOCxgW5g/SPIQekM5xd41Pn
	jAX/jCjYzZe/aUBkfNZabFKLn
X-Google-Smtp-Source: AGHT+IGRwXXqrdvBiLiLxR+oUBgKbuNz4YkFZTZqdUbK7noPdUI8t/YHrwrbn03GL1lOJjflJRcg6g==
X-Received: by 2002:a5d:648a:0:b0:38a:4b8a:e47d with SMTP id ffacd0b85a97d-38a8730ac0emr22974107f8f.26.1736891786124;
        Tue, 14 Jan 2025 13:56:26 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aca8-de00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:aca8:de00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5483918f8f.43.2025.01.14.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:56:25 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
Date: Tue, 14 Jan 2025 22:56:16 +0100
Message-ID: <20250114215617.336105-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
by soc-dapm.c. Use this new function internally in
snd_soc_pcm_dai_prepare() to avoid duplicating code.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes in v1 -> v2:
- none

Changes in v2 -> v3:
- add Reviewed-by from Charles and Jerome (thank you!)


 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index aab57c19f62b..a11501752637 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -193,6 +193,9 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream);
+
 /* Digital Audio Interface mute */
 int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 34ba1a93a4c9..ca0308f6d41c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -360,6 +360,22 @@ int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return 0;
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->prepare)
+		ret = dai->driver->ops->prepare(substream, dai);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_prepare);
+
 /**
  * snd_soc_dai_digital_mute - configure DAI system or master clock.
  * @dai: DAI
@@ -577,14 +593,9 @@ int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 	int i, ret;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (!snd_soc_dai_stream_valid(dai, substream->stream))
-			continue;
-		if (dai->driver->ops &&
-		    dai->driver->ops->prepare) {
-			ret = dai->driver->ops->prepare(substream, dai);
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
+		ret = snd_soc_dai_prepare(dai, substream);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
2.48.0

