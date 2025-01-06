Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D71DE2B9;
	Mon,  6 Jan 2025 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172829; cv=none; b=q6Wj43loPfhBb4gvPxuj3ikR7T1rSSH9LGJmuFsWajf2wSWIr/IcY4jrhYkDRjdM9KNk3A/oqNkqa4Hh8cncE+Yw0uvO6ILNXMST29z/Ra2J6bYkZxoBUHQezJ2J630DuWlq7cw4m1oylcMy/OHp8/ed7mvCQgD8PHWW/EORDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172829; c=relaxed/simple;
	bh=j19jIlCmU/moC0Z5KKXf1j5dd26jPNQQKP1vd2hAggg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVIz9dB2LYqpC2YXXZbF7Tp0NyXiD7Mou+ev59XqTk0fe0602KzJOZB2U0ZMbkbrS1m9t9pRiQASlBwYnkTiCJbGifDnZ6pmSJ3MBsFg3fo0g0Ns1z84Nr++pstYGLUI9MBFmezUhqUWHe6WEvcdDAdFnc/a6oJmBbD12Jq9Ql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=gBEjizPD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gBEjizPD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso56348766b.2;
        Mon, 06 Jan 2025 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172825; x=1736777625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue4Bu5Xm3aSnr3aDQKCmaVaK/VUPDoH9ftWxJfeazzw=;
        b=gBEjizPDeuLYba/H7yzE70MlqDkcJVxKSaa4FTJpWwSv/iRqVqbMNsqoH2fst0KD4P
         xaKyQ++naBk6JKzCJCLDek1IJ1I7qiZz3nY7GHpmspvue4FPTortKFr7JANEtNt14GT6
         3jUdt4GRcZGQWFWg4oc/Lz567ROJm1rTci7V48iD7541E7RjLjMSc1X+A3oeqHMCgW/P
         DmFafVMmNy3gg98avonbNFBq74C65lAsS3IsXeWX5KzhN2E066Zj0rBioGXhx5uSQb1l
         ttsxv9D2NFwDkB3zEN49AK2ZBTiw+v03euINRJPoVFe76v6q7sVr/1yzkoA/sbFRgerg
         fcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172825; x=1736777625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ue4Bu5Xm3aSnr3aDQKCmaVaK/VUPDoH9ftWxJfeazzw=;
        b=UT/LUbIy0j5OWMQ1R9SAEFT1WjgAzwaWTr0qU+JfocSWS8kEt94LDRH+QG7YaY5d7u
         KHzImSHx+HO04MHGdE1u7e48IkB6gw2Fl+paC/Y/OCOWyy5497kkPNgXdF1l3lh/ktUY
         QoR61f4NV4GbqS9MXUWm6UBp0bCEY55rNf2aOI2ea+Pgi0RK77Wr65YvqPK/DX+4jrrA
         7KWUlIEjPjgR2zABnoqloSrkf2mdXuJ/bpxcL/4uhfrYK6EMznxLzjWiQM304PwDAiEU
         1Q+rUmgrQHeddi8lDm9GETjykaKx4urlOcA4ykdIKUtl2X/bTeDzLkgk8BkgimiC/Zk1
         mxxg==
X-Forwarded-Encrypted: i=1; AJvYcCVXsGf3T/5ZTxLeVSs06d7S8arPyJzIWA0gNL08pw+SuMT44JJTZorzsRI9wi1ZbetKs7Ss0vG2utcNhTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnRPEGJlA5Lh/DuBJglDJcuS0crBBbFgQ6OEKl801Oney7tdb
	bxi9+DQkiaHn9Zhd5bsw7jeeEShiJgwQG3XFkQ55Vt3qQigd7j0VDOgAtQ==
X-Gm-Gg: ASbGncusoP842m16+loif5gi0xRuUha9O9UrtVVLj2wnavbL5Ycco95sDdltGqIVQrS
	Rwpj/F/5D6X6rC8ysVCUzeOth2AOJU5H5/EBdkkMaKvk19IzqEppuX2JE4CAdjsSCrKpw1xF5fb
	qUmjJQiTUiCXmTBGyxzfaVDQV1CzqByICqDkarKMjVGNiFcfBrMeyUfZaKOfI6h2MQFwPLF/t4D
	tUixK2/YLdXPuqqfeP+GKKYi2GRN0+sAFGKQphzSYz49RwGbuhL1cCskUc/CWAULtkdQSFnM1k6
	uRtgCZgEF6ZKJCaOMpuThkq+a96E49/NxHGSalCgZQG9vWgrZZX47jL4tX9LnAAy06+BaMLxTyw
	rq3YmvA==
X-Google-Smtp-Source: AGHT+IEnu2WBqAc4ZLV2zVb1tutjBgjXj2jnmiXy8Gw+WqDg3zTtAv3hDkZ3fUD63mUvDPlmvBph2w==
X-Received: by 2002:a17:907:7da8:b0:aa6:8676:3b3d with SMTP id a640c23a62f3a-aac2ba3c134mr5574351166b.29.1736172825126;
        Mon, 06 Jan 2025 06:13:45 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9f2-7d00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a9f2:7d00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm1811342766b.77.2025.01.06.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:13:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
Date: Mon,  6 Jan 2025 15:13:15 +0100
Message-ID: <20250106141316.375984-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
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
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
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
2.47.1

