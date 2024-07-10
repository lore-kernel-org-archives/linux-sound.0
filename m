Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6157194157
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720627478; cv=none; b=er7LluvxizRCSSbDC4OTAsoYRwtU21O2PIcn5g+azo73LfjnjM66w9FaVBW4RsTdkO5zno+11BxdQroDzSZUfspO0dmidUZVpXzb6C+Ucih5pzA0sbnZTWj82A0/dVkC+cYEEkyCSd9MsI4z/C1I+90thC9Q+/qDYD47h093BFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720627478; c=relaxed/simple;
	bh=Dr4qWcgxS5UGZeU6OEsLrDSgXgNDIl2UYde/vvMZiBs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D64X4c/lgjt5iHvEuF60SNRgHVmGGt6YvkK9RRX2yZ4RpnXRlppkQBTBE78peGFPInx1ZL2y/HXK+u9Kb3GKu/C+Y7Hs4hk65CF+Xy0GGCCScPoKHNiWXUxX6Zav6rTDtlL1sMUakVwy1TAyepUKC8q6wlwIiuOhuS3OjLpPzuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a3qHdpk3; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a3qHdpk3"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A4s4aG006601;
	Wed, 10 Jul 2024 11:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6b0A42aRW+THic22
	yFT+hRNtlGiOXQ3HOeCFduWXqYU=; b=a3qHdpk3eVwqwDHXqKMJ7nttzH18QwkF
	dcnYs3xDjuBXBI+w2HTYjDnYpIKq5DDV7bLKuwPXQsq9X9PJyu+p3fDqvyhyhWUl
	FjOLcDo4V7fHI++O1hgDy7PsP1CtfJDCVSsQ3TNiymcDs8W0pFlQf3uxVNfQ4DhQ
	8F42Kj6O3oA/IVbg2FxL7yQDLNMIhnhbN+ov+oLwj+Sd3AGqztCv3MwB8lKohoX0
	F3brstvj1leZM6HFwPuwbPB9NBZVzOGhnQXors0iHAw0M9bnHYXKwc9rYJzcZU5M
	KR9gcUOPY/TNp4T2DNHKBsFPhOXFHWObKdnWumPoZQpgzvuku9KKtw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 409c9a8vqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 11:04:21 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 17:04:19 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 17:04:19 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DDD0B820244;
	Wed, 10 Jul 2024 16:04:18 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: cs530x: Calculate proper bclk rate using TDM
Date: Wed, 10 Jul 2024 11:04:15 -0500
Message-ID: <20240710160416.2617173-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SxDjhZAnfd4lBwUbORFZTJBv15XH8OXV
X-Proofpoint-GUID: SxDjhZAnfd4lBwUbORFZTJBv15XH8OXV
X-Proofpoint-Spam-Reason: safe

Calculate the proper bclk rate using the number of tdm slots
and the width of the tdm data.

Fixes: 2884c29152c0 ("ASoC: cs530x: Support for cs530x ADCs")
Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 sound/soc/codecs/cs530x.c | 15 ++++++++++-----
 sound/soc/codecs/cs530x.h |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 036d0f45e3ba..195739657f4e 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -526,13 +526,15 @@ static int cs530x_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(regmap, CS530X_CLK_CFG_1,
 			   CS530X_SAMPLE_RATE_MASK, fs_val);
 
-	if (cs530x->tdm_slots) {
+
+	if (regmap_test_bits(regmap, CS530X_SIGNAL_PATH_CFG,
+			     CS530X_TDM_EN_MASK)) {
 		dev_dbg(component->dev, "Configuring for %d %d bit TDM slots\n",
 			cs530x->tdm_slots, cs530x->tdm_width);
-		cs530x->bclk = snd_soc_calc_bclk(cs530x->fs,
-						 cs530x->tdm_width,
-						 params_channels(params),
-						 cs530x->tdm_slots);
+		cs530x->bclk = snd_soc_tdm_params_to_bclk(params,
+							  cs530x->tdm_width,
+							  cs530x->tdm_slots,
+							  1);
 	} else {
 		cs530x->bclk = snd_soc_params_to_bclk(params);
 	}
@@ -655,6 +657,9 @@ static int cs530x_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		return -EINVAL;
 	}
 
+	cs530x->tdm_width = slot_width;
+	cs530x->tdm_slots = slots;
+
 	return regmap_update_bits(regmap, CS530X_SIGNAL_PATH_CFG,
 				  CS530X_ASP_TDM_SLOT_MASK,
 				  val << CS530X_ASP_TDM_SLOT_SHIFT);
diff --git a/sound/soc/codecs/cs530x.h b/sound/soc/codecs/cs530x.h
index 1c85310a5d03..1915a0efe829 100644
--- a/sound/soc/codecs/cs530x.h
+++ b/sound/soc/codecs/cs530x.h
@@ -96,6 +96,7 @@
 #define CS530X_ASP_TDM_SLOT_MASK	GENMASK(5, 3)
 #define CS530X_ASP_TDM_SLOT_SHIFT	3
 #define CS530X_ASP_CH_REVERSE		BIT(9)
+#define CS530X_TDM_EN_MASK		BIT(2)
 #define CS530X_ASP_FMT_I2S		0
 #define CS530X_ASP_FMT_LJ		1
 #define CS530X_ASP_FMT_DSP_A		0x6
-- 
2.34.1

