Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8C443AAF
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959602; cv=none; b=crT1FO6x3EwyfT8/JDnlxYIkEgt/CcuWY1AMyBKmsmSoUkCAx69Pfzo89drzmOiTDUhsBy3pNr0eqM/E46xXbbc3CvfhGBsH97Qg9czHP2HsMU9ykvRFi10TzOmjgD0gnEm4LmMftq4EDocZ6k7NLpbICDUkoeBxwW+MjYNPtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959602; c=relaxed/simple;
	bh=s3+QGgTV4plzI/xr8IROgJwAbZe1P/l4ItW/7cwy/wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtEQzPdcg3fjiLP1CYRUwk7Lyp2dyzPoMYnjODCT+j6pTOPF/PvJxA7D/UnduKYDd2qN+Gp7G3L/LjT++Fi9NOqEU8Rb6UzuHzj/q8r3iAn4aaf8EmJPnkcT9JdPhwngNcBfrDn+xcdRiRWJtzN3zPxgKLBtzKccmhYFVTUreyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRLNHaoB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRLNHaoB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3128920a91.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959594; x=1792564394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0dNwa3ufJkZOa7uAR5+Q4Sf0EjzJIjuDXt2hIDnuBc=;
        b=HRLNHaoBamsEwdq5WipuGzXDYkQmR4IDCt6BEfLxQ0RjIeKi53wLd/20yZfOJlpOzp
         mwXk+s0IB4DYkRTdwHKZ3fFCi+1DdjgyEGH8fOvb0+9q4QRjWJJyxbLelICRDY4pL30H
         U3j2rv8+Rt/ZBt5JZJuhn31dzfe/S4MP5MN7PaS1/69OtX/aDNJpolJEwKGQyU4jNIqW
         K8RFudNJ55uDmOAIi+8G2xa88A1Mf/IWmLUe9GhtuYkR/8umiKk3l3cLZHeQsyFOsl2J
         Eqs5IVoH06NqcWUeLpWdq+aPvvfS5loctUz1xDrV0xdHwaZNkNCyZ76XGz3qVzvDdsLZ
         8qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959594; x=1792564394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0dNwa3ufJkZOa7uAR5+Q4Sf0EjzJIjuDXt2hIDnuBc=;
        b=rL/sMAtHIXz5xaGmhdAW5QnH2IUhxpHUvgm3s/Olf0AnccQpYzAk4jTborN7HxNeSs
         HBA831twagHUSq9hzEgnfbV7+GeCuXpFlAJEj1PX3ABZWmAJzzUxmmqTDvTWJhJjCFaW
         18LM+A8qf1rogb8WSS3u+bDrquuQ77DlwHfZT7p0Um9FOFkE6gbAd51uAUzrNKNudflk
         tQzZ6cUgfkcudP6cA7dJgywUaiuf6gxKL9WAfAIL1Yzdb0ACYDxOxIXNLVrPtmtNz+mc
         6wdL+qCu8Mm9IhVxFc6ShJV6fV9bALbJiQwywcZ0a4ExXwtfbQOjCJQOxEFbi4sdzcVa
         CGFg==
X-Forwarded-Encrypted: i=1; AKwUvBzJEMmb33tdCfgf07ukrCeF1nupPK9Z3RrWamfj8uqsoqpReLAGZrV3HI4EXANjt7WBQxQ508NIhFZMcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKtivl9cjZVqRro34FR4A0qMRa4vDXfPp9z3TbQGKB/FwZq74LV
	lXdNZEbtuDACub8fICUTkEZHpBVgrAMBhmzj314nmM/HVy+RQbzfoC2l
X-Gm-Gg: AYBFou1Wz/s4n0kPBwE5bn6no9p3FzAVLaVD9Vf6LYXTyNXCh43xAZfEXHjTxgK81zR
	sPBms2tta5Q/GiPUmipj+h19k2UO/yloAp4ViTn40myBkSqBw2+4SFqoaZ+7biX/U+vHekX+ucJ
	aydSpWS1v2kqhzlGsn1YYv7eSMXHRobmzVvf0GJU381/GuNVxUWdQVitfqyvimHZlxHfsSeCfI5
	BB4Q0aA6ESPIeoJ9o/Ggp53xSVPi64rohDU/qX4D0oyxItfLALHQh1Y1RBzBgrHiu5Ftw57WjNK
	87rJp3opNg7QSnKQpEaXD6Blr/uMidIMVqkDP8qh2n3V6JCXv8owSYVyo4L8WKNIy+OKCycVoOC
	CAgQRyHccQFotwoMN13XnbDFa0vb5eSFCU4JMovZ5y52jRv60STIjZJ7qeaB9oFmGBgeOrrgier
	CU7OwMAvGz07NZZ2EON7MTJtGrD4xq3cYOQ+M3ZxXcID7lhVbhWQdY47ndR5zPxDn9Pd/gt1UKo
	TNSAUytpepJx0KGhwPTvbB+yaTKDjyv/fT0V9O93N/UBUKLVSR4t4gf7+/Nly2t4GsnmLmxct0=
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr11573517a91.67.1791959594121;
        Tue, 13 Oct 2026 23:33:14 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:13 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] ASoC: codecs: wm5100: Fix definition of EQ3 Band 1 Volume control
Date: Wed, 14 Oct 2026 15:32:38 +0900
Message-ID: <d7f690e391feda7a6d8f38d0b238b165bc1f4fe2.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EQ3 band 1 gain is in WM5100_EQ3_1, not in WM5100_EQ1_1, which
holds the EQ1 band 1 gain.

Fixes: 6d4baf084f4d ("ASoC: Add WM5100 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 2fe937a93026..d0f5c4e89556 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -658,7 +658,7 @@ SOC_SINGLE_TLV("EQ2 Band 4 Volume", WM5100_EQ2_2, WM5100_EQ2_B4_GAIN_SHIFT,
 SOC_SINGLE_TLV("EQ2 Band 5 Volume", WM5100_EQ2_2, WM5100_EQ2_B5_GAIN_SHIFT,
 	       24, 0, eq_tlv),
 
-SOC_SINGLE_TLV("EQ3 Band 1 Volume", WM5100_EQ1_1, WM5100_EQ3_B1_GAIN_SHIFT,
+SOC_SINGLE_TLV("EQ3 Band 1 Volume", WM5100_EQ3_1, WM5100_EQ3_B1_GAIN_SHIFT,
 	       24, 0, eq_tlv),
 SOC_SINGLE_TLV("EQ3 Band 2 Volume", WM5100_EQ3_1, WM5100_EQ3_B2_GAIN_SHIFT,
 	       24, 0, eq_tlv),
-- 
2.43.0

