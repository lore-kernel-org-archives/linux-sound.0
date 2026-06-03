Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378ED477E23
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487440; cv=none; b=M7eoyqbLlAemyWKvgPb2EeLlACoFS4Ka/AR90QA01NPogKzPzswzbyDOqo63mYM3Q3FEyFL6s7sL0L8GFuP1a3NG31TGsE2KejW9fH6RiGIRjzY+pXjsn99DiH+Mf26KVaIxUIZx5RXMwt7kMYpjqKVqD0baeB3hx0FT3/jOQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487440; c=relaxed/simple;
	bh=jjHgp/jZpuHSIFDNTXOtEU2uGayag8e8wk5Kamgfz9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1lBbiBOZKHV/4hT7iyiWsdRI/YmrqZWH4lVdBm4thbs5x021YmwTS6ABOqhh5JCBxAp5WhUaVfQqjJamUeKh14q9iiI1/LvLnUVx/z+262y/ggda+k9P31RrX+x3jNenMD04WpXtz6+csKr88fk3FrXQ35sm6NalpelXXsXOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZG2bb6d; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZG2bb6d"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so27299595ad.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487438; x=1781092238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBfuXDyFUzLNioBdr/HkD5u66fuFdgp5SklAx/I+Qf8=;
        b=TZG2bb6dCYNAVa7zqIQFWXwqguNGQMn7N7uNmcQxuBrsEfh6fk5JWY6uy1kVigOxLH
         aeiELEHK1JmDSO9Zc1j23ie1Taguq51F04O89quwnQSLmrQxNbw18xyovnriFmWzm2NB
         VxLWsgc2X7IlZ2lOF4OqalU5Q9QVpQrceeyouhwv4rKtP4dsr/Bmwe4Zo2NYYgIe7jco
         TZONWHGQFGDqhb4P+Nc4v7rBVXbCX7LL7hhCm23Qlm6REQx7+ADrN46kSaWZju2qNAqq
         ieprubN8DyrdLdUKdmswXAcBwejCPD/xlD6MIwMj+0EZhk/laM446YGtIBJy2UC9bNnm
         d/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487438; x=1781092238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBfuXDyFUzLNioBdr/HkD5u66fuFdgp5SklAx/I+Qf8=;
        b=ixEo7r76WdI6y5ns6zyR1DhEtjeDaDkWVbphDVu/Td+RMJ8kqQ+HkNzfJW/6b9/7UI
         h/2dhu9wCiEfrUBjgO17yC2sZx/x3QEEA0613Q+09oc7X05QW+4kynTvGbFh+f0kmrDJ
         XDWtKgTX+uQUMDOBXKCktq8j0UPBnlsh0V0KdxorMRmYKAXcV009hsiZEmAmdUJExXOe
         EaXDScuJTmHUeg/RBVOjXuaATZv7jwf8EYfKh5gPwJtldDw8K41m1EGDy0ImyD6yGQXe
         0+1V1NH0Xn+Q9pw2iLd69CCefch3BVBfNN9/nJ4fi4f9DEdo0jhmbCISfKWYA/CC/3iC
         +JpA==
X-Forwarded-Encrypted: i=1; AFNElJ+tdE0Jr9Y4IhXX1aEsVGaF6Edqovl/PIUvlGheLVm/NZKhdCvH7UgebkL1DHW6psxc3M+Fuco297C1nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAo3X7i+cJfEdbZqGyt62pxyK7eS8qV/WBHqbHje0t6ZKPS8Nn
	geiVKbFNlMUN/oioe6ulXm72SUzcdR2d0toKFwa/a3wT97dF51N2Kwbq
X-Gm-Gg: Acq92OEbG3CRawXIFMUqiYfpRRL9Up3qSNBud5W2WannLvwyyd/c0D9hHwkEHpfcyBK
	5rbzoQTfe31mTfxTlg0PeFYF8gKjDymMHTYeJsrsAw6+89nKAQUT710tAPE4NUTNnDHTIIEDvT3
	ovZw/uRJqvNw6SH93ZPI6mYSKsGFWAYKHOhykhmvqftq5ZACVjMXvT+LFX6zX7ENRnz6uLG8JIo
	PEXq0Ds9hzuPSlBmFPnkoRc8LZ6epEbghf9NT4MCJvLE5iylzjSSt02NYRKoHPqFBLlw6xMdQuL
	eKiosYQ8o7CPcSZM2HVkuHylxgTqqr0nmwhsd4OUH1r9vGe0UNXnHMTe7o2Yd7/Cg8EBYdzkpbt
	vbtm2M8TMK4zaP6pNAsRqZv6Hfy+XVg3x6rhbV11IFI/iZuuKI6eIvA3wYiAkY1V8RXo8ivCI0u
	tW/R0Rjk4kIwr3f7ULkd+TNlfLXDwnaF16hN3ix4+O1m8I4efPaIEVJ4gA9kC9DaZac/L+En1oR
	+gSyx0=
X-Received: by 2002:a17:903:b08:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c1644a63c5mr34036585ad.30.1780487438458;
        Wed, 03 Jun 2026 04:50:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 7/9] ASoC: qdsp6: q6routing: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:47 +0700
Message-ID: <20260603114949.149595-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6routing.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..fff103b9dca1 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -381,7 +381,7 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 
 	pdata = &routing_data->port_data[session->port_id];
 
-	mutex_lock(&routing_data->lock);
+	guard(mutex)(&routing_data->lock);
 	session->fedai_id = fedai_id;
 
 	session->path_type = pdata->path_type;
@@ -396,10 +396,8 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 			      session->channels, topology, perf_mode,
 			      session->bits_per_sample, 0, 0);
 
-	if (IS_ERR_OR_NULL(copp)) {
-		mutex_unlock(&routing_data->lock);
+	if (IS_ERR_OR_NULL(copp))
 		return -EINVAL;
-	}
 
 	copp_idx = q6adm_get_copp_id(copp);
 	set_bit(copp_idx, &session->copp_map);
@@ -417,7 +415,6 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 		q6adm_matrix_map(routing_data->dev, session->path_type,
 				 payload, perf_mode);
 	}
-	mutex_unlock(&routing_data->lock);
 
 	return 0;
 }
@@ -1070,7 +1067,7 @@ static int routing_hw_params(struct snd_soc_component *component,
 
 	session = &data->port_data[be_id];
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	session->path_type = path_type;
 	session->sample_rate = params_rate(params);
@@ -1087,7 +1084,6 @@ static int routing_hw_params(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&data->lock);
 	return 0;
 }
 
-- 
2.43.0

