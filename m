Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B592F361F
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949202; cv=none; b=XiI4ueDDAlO7Fwxukpd4E4j2ugh/urAFqG54a0XjxBHNu+Q+NRBdHuk2nxCzPxTEspNYyd3lEnf197ZKjIBV+t4JEk4o8LdBoLLUuJJ8lXY5brY2Y9wNsdYJHTm4GzvrllmSKlHzNCwdHDmbzoU+VsgJUIjjfvs1CnRrGeXZ+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949202; c=relaxed/simple;
	bh=TPJDvSVZTbBn2A6SepOj5NvERXxcqlwdeCpBeCb5W00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5XPndriKwTRjKEw6UICzm4RaEhF+YX8XpBSOJvME8jvfP6R9cQf2Tv+WSiRoEXe/sr623BA3usNKYvZSnyXfvYZC8D9RebqoCUlQRF0jumKfBwo26FbhZsxnvwGHrRosQjNwsoG/SxQDZ8udtQjDsfOZm2wcia/7hV/JF3WyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhW9+isC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhW9+isC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b312a089fso552465f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 04:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762949199; x=1763553999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tc2H4/EhQiTg4atKH7sDBTa7g3DlJ+euypu29w5QsY0=;
        b=OhW9+isCrYMNKc7wwk8hHZPmmr08Ra9wYWoumnDNQct4AF+wXb83ATRrjkQ1jrnCnA
         sB+fr0Xk3WRRI8JmkbEW/vdQWddkRUgDgacbkxRVoeHr4HVc+og/YTd8ZUHMePguH+kL
         mnqqTatcgJTVDRbPPTyK9F7FwEoGeT3mkxMas2eDyMKtK4zlhPQTigdwH49dJt/51Sxl
         hKaC2MGypDQUz+ThPi4fhRqa4XRInRh7DWETZhm+9R3LhSiJO/TGz+pFjCj6OVdeBDaS
         pDNZuNYCToUvYkzhS7nDTXEuSBgBFUDBC13MCXgsTr0KAvkPktw9s9caNxdSQ1rwrvcV
         X14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762949199; x=1763553999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc2H4/EhQiTg4atKH7sDBTa7g3DlJ+euypu29w5QsY0=;
        b=WbbrrOzDSU6eSlNvLbAPl5RaGBVwBs8NyEBEwGTMPUytzGAHRkBGSM+P0ztx6tUS7k
         fmiMSYKIc5r3NHwL2zCUKvxt82kLRwsOjD0yqBSynXYrQVU7zHzSx+b6BQv5tdxZl/kH
         8sfDR3ItqmTOpivjL+vcQhSqdrU469fv3O97Yks2fR7R0q8yrXXUhHjKYCbzQcqbNjtw
         3pXrlXqbrwZdkUQnQrk9fqXq4g8lrLx1nsnVHFslEKps0F+FqMaez5MTCcxeLkx4NlNJ
         ADLMQtgnXFq1yXSN0pNt+Bwx2XEJRabjGIJ64dgKhoZBSCWoIXZmT9Znsh9zD7RRMRee
         IyrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhoP05cOH4zj+KkoJzO4egGJi0NNh3x9vnVhv1ND1bcDJNXKzHUZ5x9C3NGiRLUcpq0XG3b03f1EXdYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBFTeZK1P+oS+h3C2bC+7pboUE0BNFUYC3vEOHmE0OXFLNb4x
	dXBWu7nKaUMQJBiP0KckwBZ3g8jt6tSfS9ZOnyCj8nKMm4dOisqZEBEo
X-Gm-Gg: ASbGncvx4ZFs4SXTUIstZ87Kayh+HQnFSHDMhurnA3FleOX0a8sFs+OagMA+DoJeoay
	XoBi4s1xfxro1SL38qAzBUXeS0wejAjy3jfJhpNZn43aTKigePB9pCmEP6BnUSboR399vxAZXgg
	gx2TVsWeRsqFXfYw+ELuxkyZqlrAd8Z9yLpcOdM6USnrhcQ99j15R2L8ehuUN4qIcu17W7OlMAK
	vvCF5NEErOM1KD2LbWzneIei/D1kA0CKnTblpyMb/hgAUW6ZO5SgBYeWxvkhmZ5zVR1V2euJcTl
	UPv1of7QQ5BnOAI+SotVCU6kz0B3JZBG2QURsloQJBHDqZmGjuk6fRhS/agv1l/+p7nWSms5UEi
	NpNoYiYyaOghxrj/h39vwBn4KnbhM8bMCOt+WX/B0PFgSouOHou1F40MECA8ZPAx5+btlxao5MP
	8RdEua2ExLeqEPsA==
X-Google-Smtp-Source: AGHT+IFWYVx/EEeUdCv3zGzHjJiaxTuPQPm6ZEUuUTGNOgLsYKGU4TTfMfOJtqHsLMvu+Rw5uNzZzA==
X-Received: by 2002:a05:6000:2001:b0:42b:3806:2ba6 with SMTP id ffacd0b85a97d-42b4bb94662mr2791770f8f.25.1762949198873;
        Wed, 12 Nov 2025 04:06:38 -0800 (PST)
Received: from gmail.com ([136.226.168.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf40sm32486989f8f.9.2025.11.12.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 04:06:38 -0800 (PST)
From: hariconscious@gmail.com
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	sakari.ailus@linux.intel.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: Intel: avs: Replace snprintf() with scnprintf()
Date: Wed, 12 Nov 2025 17:32:35 +0530
Message-ID: <20251112120235.54328-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

As per the C99 standard snprintf() returns the length of the data
that *would have been* written if there were enough space for it.
It's generally considered safer to use the scnprintf() variant.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch replaces snprintf() varaint with scnprintf() in
scenario to know the actual length of the data rather than *would
have been* written data of snprintf().
No functional changes intended.
Reference Links:
https://lwn.net/Articles/69419/
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.snprintf

Note:
Compile & boot tested with necessary config parameters.
Other areas of AVS uses scnprintf() variant.

 sound/soc/intel/avs/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 3534de46f9e4..100b95bfcd78 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -119,7 +119,7 @@ static ssize_t probe_points_read(struct file *file, char __user *to, size_t coun
 	}
 
 	for (i = 0; i < num_desc; i++) {
-		ret = snprintf(buf + len, PAGE_SIZE - len,
+		ret = scnprintf(buf + len, PAGE_SIZE - len,
 			       "Id: %#010x  Purpose: %d  Node id: %#x\n",
 			       desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
 		if (ret < 0)

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.43.0

