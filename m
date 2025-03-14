Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE3204C3B
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974521; cv=none; b=Jb2ragXcYp//hpfK7J63/sIWjT9z3YcPhRa1m3G6wn/jrPGuvdIepaBiNDPg/JQz8l8xAOtNvjTF2CumKOPJ2enh8L8B4+vc8cdO983tF+oK+lIy9fKeOaMEedjdE25BBjf7Clgk+o/LeO3CvTvvmjgzuDcH8ptByS0CPVAOEbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974521; c=relaxed/simple;
	bh=mDhcxCgdC1Fi4Bo8nQTGMpqT/fTEu0Rlo6oOEAE3xhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E0bmXpHO/a+OsWiXlgpKslFVln2KXqns/tszUekByGY8qz0Gp2EZ/hnpNRCF7xaukBK8vmxeu8rX1GWe2SOlC0fgVvkZZbEjrg2b/IUV2FuLdzF2IQ4/3tSmTYcKcaa3FbR+AkB4UkGjQ4eHZ8pPAJEzUdFt40CNqTdpCz/MXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXfqWfDm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXfqWfDm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so22740355e9.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974518; x=1742579318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdTVjAwVNmK2jLxhOXzxyRxn49OEqRRCS+ScTGbOGto=;
        b=gXfqWfDmh+B1szU5Xa0RAATYoSCm5lGgeMqwIDeQB+jdV+yo6hkpOndNHNCax5Y1oa
         rGLvo89PnQfVQyKDvicTfVKhEJiZcX8bXUfinrnm3txJnn1xbQe5r3zTbVM9GetXTvwf
         Gmo1twwUXRJnqTo8z0q1kLoq05jYJCkX0lrqBAuOeMDzV5VVLOsOXZk31yy/bmNjNAfd
         oXDihB0gUzyURfOy7/OaIYxl6u0yEeKT85X0j33Ff8ajytNEgMgnEhlxVvG4W78gmVLV
         BHJPsORyFJhUc9qH6WuQ+afT5KFe0QeoDAVjx1tKqbFCdc1wBsDseisnfrTSQrHh3RD0
         RjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974518; x=1742579318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdTVjAwVNmK2jLxhOXzxyRxn49OEqRRCS+ScTGbOGto=;
        b=SZUOdOvImmDB21+HLxFacmoqAs8KuLyHyPCG6H0RbqUYl9LhsbWi66uFBzFjRICUzJ
         1modBz4pzYf8KuVDe28YPO39wKx+Itro/dZcJFtT5Q8IT1jPleCtfsrEqGKi5knDBUb/
         EYoZCx2r/2+fn1nu31qV1PF1ThY57GsGad+d8FTDTOAEfTcHFkN8TRFtKeUGoD/shEaE
         sv6pXRWvnLgv5wmb1x+LEiCUhk6AHDe3vDobtbZnHlytn45A8rg1luNFBDKfpwJ+gVmS
         u8sSUKPHtBo39jEN171beG655xPKhJGcv+whzQnWWgsUVqMN7oxuei7XRCtRetPw9Mws
         ba2w==
X-Forwarded-Encrypted: i=1; AJvYcCV801bGE0hsTYHScJRw43iK1KzljaekiLlvWtOKXiMUX2ITzTV4FvDLAMyJOQmsOyNeod6L9JFaUvzZCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvzsQ0uNgC2LECfyBojHyQuIiQfES8GKTxSEIgZq1hyUKF+IDl
	G+wrwImQ7OJD/ltvwpFVZaKZWjU6HrjoZYfJU5bKlNZbXW012jkiEhekA0qb49o=
X-Gm-Gg: ASbGncu2xANX635kHitmRaylftD7RnFu/FwVH07ba32b4CEXx+TDbDXtuAA0jCom3gw
	c49AzMXX3OSNmrYNB9e+xhx4exvFumGf+avtm1YGg6X+l2Ouu65Rbd8iNIEOtVATweQxo82jMzP
	cWxw7lvRc+AxkrGSCOzoMqBgmNrwqAVYWQFyCfOUxfsPoGL8VcAZ1wbx5N/RLtubPfQuNIaQCxa
	Pt1anSOE0CItWgENvEIdRuktGbAv9ZtOdTHm5il1bu9AxJVQQQQWG2X7lsUdrKMj4rUmxU+Cnul
	9XOdR3e7So7LugS5gpv6mJ4EPTgBasZaPB5ngUrUh31A4ZppYiCrrd01l/CMIB1LtTW9Cw==
X-Google-Smtp-Source: AGHT+IGcUNko8z5XQMYL2/1B8FhFeQVonlKSYBeZ53undzrD9L8aOYiUUqdt7GUF3RfwMi42lXGfRA==
X-Received: by 2002:a05:600c:1994:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43d1ec80e5cmr44898745e9.12.1741974518070;
        Fri, 14 Mar 2025 10:48:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:37 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
Date: Fri, 14 Mar 2025 17:47:59 +0000
Message-Id: <20250314174800.10142-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 90cb24947f31..180ff24041bf 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -385,13 +385,14 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		}
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	/* setup 10ms latency to accommodate DSP restrictions */
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
 		goto err;
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
 		goto err;
-- 
2.39.5

