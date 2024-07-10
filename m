Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0477189F54
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720627479; cv=none; b=QSiFdvVrKgEigWsHtal1nUI6NohqeRN8Lg7okl2C+cHBXgjwU9vHjHjfMF/RUDW5KXIycJXgX1YbDK3G9MpzaOAn597QpGMyRFtLnhcG01Sstt7N5Q6WxixWxOa8IF1/nSQCt6bw4U/y2DjiDIU5tKnvrCWi95Q1ZmcVRdYRdFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720627479; c=relaxed/simple;
	bh=cUyP2tyMqUMckkhH7Osz5kbTD7djaxkuJUxSv5Aj3xw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGcwIWZkd06JqLlkWhhguoGwWBzph8xGodNqR2N1DR78lI9bR+cFn7tLpBXPE/6LfMLT66g3Qi4kt8JGZZxaNgChRssM5bo19WmJ+k6csW29+tb3WF0zYaKaY2z1kjib4w20SS5o8zPLd2/AfYYoGxiO83lEpFNpdMvN8+mY+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DTaYaVoD; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DTaYaVoD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A4s4aH006601;
	Wed, 10 Jul 2024 11:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AZFe4vyOQNZSLgTUhWu4DO2tdekGbHxeclUS50no9Ac=; b=
	DTaYaVoDbGXswIgRPsn1oNxrDaFp5ICHhyPj33z17+vlejcm7r1ehPsqocJ6y5o4
	WiGYhofG0dwERQjEs3XmV84VCNwrSHrLkp9SEwUpo/ejUBLNNxgWP5i/YKrcYxch
	lZwdraHY/Xw6Nj3/b/4C3ErUBpPu6EOrpmgnn8eIo5UBVA7/IUVqggZFc2hSoePF
	yf5Sp4xiaHDGJpKZzIM+LUISjlXA9F4R+vo02kPdS+XGgYZpPcIlQj1LzVO5uyvf
	DTXIeW2dkqoDkZu7KrZTvdcLMMf15fjmcRTwPz3bGVcbLg4QJEp9RfZ1ZHJdqmGa
	uQX45gUmLpS0OIHvbFQrGg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 409c9a8vqb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 11:04:22 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 17:04:20 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 17:04:20 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F225982024D;
	Wed, 10 Jul 2024 16:04:19 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs530x: Remove bclk from private structure
Date: Wed, 10 Jul 2024 11:04:16 -0500
Message-ID: <20240710160416.2617173-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710160416.2617173-1-paulha@opensource.cirrus.com>
References: <20240710160416.2617173-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cQirYyR4uMMX45Y3ZXYO6ldvsFfJby20
X-Proofpoint-GUID: cQirYyR4uMMX45Y3ZXYO6ldvsFfJby20
X-Proofpoint-Spam-Reason: safe

Remove the bclk int from the private structure and pass it into
the set_bclk function.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 sound/soc/codecs/cs530x.c | 24 ++++++++++++------------
 sound/soc/codecs/cs530x.h |  1 -
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 195739657f4e..25a86a32e936 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -415,13 +415,13 @@ static void cs530x_add_34_adc_widgets(struct snd_soc_component *component)
 				ARRAY_SIZE(adc_ch3_4_routes));
 }
 
-static int cs530x_set_bclk(struct snd_soc_component *component)
+static int cs530x_set_bclk(struct snd_soc_component *component, const int freq)
 {
 	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
 	struct regmap *regmap = cs530x->regmap;
 	unsigned int bclk_val;
 
-	switch (cs530x->bclk) {
+	switch (freq) {
 	case 2822400:
 	case 3072000:
 		bclk_val = CS530X_BCLK_2P822_3P072;
@@ -439,11 +439,11 @@ static int cs530x_set_bclk(struct snd_soc_component *component)
 		bclk_val = CS530X_BCLK_24P5792_24P576;
 		break;
 	default:
-		dev_err(component->dev, "Invalid BCLK %d\n", cs530x->bclk);
+		dev_err(component->dev, "Invalid BCLK frequency %d\n", freq);
 		return -EINVAL;
 	}
 
-	dev_dbg(component->dev, "BCLK is %d\n", cs530x->bclk);
+	dev_dbg(component->dev, "BCLK frequency is %d\n", freq);
 
 	return regmap_update_bits(regmap, CS530X_ASP_CFG,
 				  CS530X_ASP_BCLK_FREQ_MASK, bclk_val);
@@ -489,7 +489,7 @@ static int cs530x_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
 	struct regmap *regmap = cs530x->regmap;
-	int ret = 0, fs = params_rate(params);
+	int ret = 0, fs = params_rate(params), bclk;
 	unsigned int fs_val;
 
 
@@ -531,22 +531,22 @@ static int cs530x_hw_params(struct snd_pcm_substream *substream,
 			     CS530X_TDM_EN_MASK)) {
 		dev_dbg(component->dev, "Configuring for %d %d bit TDM slots\n",
 			cs530x->tdm_slots, cs530x->tdm_width);
-		cs530x->bclk = snd_soc_tdm_params_to_bclk(params,
-							  cs530x->tdm_width,
-							  cs530x->tdm_slots,
-							  1);
+		bclk = snd_soc_tdm_params_to_bclk(params,
+						  cs530x->tdm_width,
+						  cs530x->tdm_slots,
+						  1);
 	} else {
-		cs530x->bclk = snd_soc_params_to_bclk(params);
+		bclk = snd_soc_params_to_bclk(params);
 	}
 
 	if (!regmap_test_bits(regmap, CS530X_CLK_CFG_0,
 			     CS530X_PLL_REFCLK_SRC_MASK)) {
-		ret = cs530x_set_pll_refclk(component, cs530x->bclk);
+		ret = cs530x_set_pll_refclk(component, bclk);
 		if (ret)
 			return ret;
 	}
 
-	return cs530x_set_bclk(component);
+	return cs530x_set_bclk(component, bclk);
 }
 
 static int cs530x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
diff --git a/sound/soc/codecs/cs530x.h b/sound/soc/codecs/cs530x.h
index 1915a0efe829..f473e33eb835 100644
--- a/sound/soc/codecs/cs530x.h
+++ b/sound/soc/codecs/cs530x.h
@@ -211,7 +211,6 @@ struct cs530x_priv {
 
 	int tdm_width;
 	int tdm_slots;
-	int bclk;
 	int fs;
 	int adc_pairs_count;
 
-- 
2.34.1

