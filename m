Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4951B7E574
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115373; cv=none; b=dpb7Z4l8PYR/RJWd49QFfT7MQV1VFK+2nNNgiak3QUno0jG7W94ns54cD+n1v59kbb3/vx5KuRTXvRIbVzUkoaprnRlHbNZidS+CFz3FhsE77n0DHjOga/WjN+ZoLCoEAAuR0YOzKDTOc8IYWD/4ji6Qbj2ueY0KOkmIgVJPsFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115373; c=relaxed/simple;
	bh=Wy9pIpf6eX4Ri0vITNMjiPt6WEp/izVERkHt6NmTVHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCi3/jyoH1PmF4dHUT5beH+E2V4dKkjFVlZSYQl6ZjG8miOPMzTxSxWK74MgJ3i2D+syUvXWM2WFRjuU+HxM3RyUAW8/z3KcKBxjeUqbQSlDtCN4ZM6C7tWDsJ+cgs5qnXt3iwCGa/hGPRrkFks8fMMCZYm2IQn0jPjlKo0IUW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DxhPMY4X; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DxhPMY4X"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O6Pu37003749;
	Wed, 24 Jan 2024 10:56:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=0SF6Z1h2+pLbvBnKKBy2eO4gwbSn/AxvgqqTGIftTz0=; b=
	DxhPMY4XWTw9m5flg4w9qFfviAZqvbo9X8vEiVD/PVzv2p4gHjFOsD86EAOjipad
	u03xWhWikRLP6yJoFBHW3m1Rs2XhfmW01Kj/ugI/Co/pdsJytnKhjQiKh25NxL2a
	9nsGVxAgynPiLik8ytU8RjxiROXvT0Aw6Dlmp0AMgiJYg1X6E2r8jBOBseHkoKEQ
	M/uRojNZnq8FgbMpcwRJyJ3wbbaHNedYqrdR0CjzL1gLGl7d5CuQxZG8W7I0hKLe
	sdW18JCDIO59YB3vPFG3brqlqjuLNeWXP7FsFgFsvPri8+77yNZ2xRHQ3CpoEuoM
	UFsjigjpuiFUL0bwxAWN4A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:01 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:58 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E2F3B820247;
	Wed, 24 Jan 2024 16:55:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 2/7] ASoC: cs42l43: Minor code tidy ups
Date: Wed, 24 Jan 2024 16:55:53 +0000
Message-ID: <20240124165558.1876407-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zZMzEbccrEhRRewhYAsYCuEx_dr1M6ea
X-Proofpoint-GUID: zZMzEbccrEhRRewhYAsYCuEx_dr1M6ea
X-Proofpoint-Spam-Reason: safe

Add some missing commas, refactor a couple small bits of code.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c |  8 ++++----
 sound/soc/codecs/cs42l43.c      | 12 ++++--------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 1d8d7bf0a6b0d..d0569577a8699 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -29,11 +29,11 @@
 #include "cs42l43.h"
 
 static const unsigned int cs42l43_accdet_us[] = {
-	20, 100, 1000, 10000, 50000, 75000, 100000, 200000
+	20, 100, 1000, 10000, 50000, 75000, 100000, 200000,
 };
 
 static const unsigned int cs42l43_accdet_db_ms[] = {
-	0, 125, 250, 500, 750, 1000, 1250, 1500
+	0, 125, 250, 500, 750, 1000, 1250, 1500,
 };
 
 static const unsigned int cs42l43_accdet_ramp_ms[] = { 10, 40, 90, 170 };
@@ -873,8 +873,8 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int override = ucontrol->value.integer.value[0];
 
-	BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=
-		     ARRAY_SIZE(cs42l43_jack_text) - 1);
+	static_assert(ARRAY_SIZE(cs42l43_jack_override_modes) ==
+		      ARRAY_SIZE(cs42l43_jack_text) - 1);
 
 	if (override >= e->items)
 		return -EINVAL;
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f2332f90f8337..d418c0b0ce9aa 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1059,12 +1059,10 @@ static int cs42l43_decim_get(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	ret = cs42l43_shutter_get(priv, CS42L43_STATUS_MIC_SHUTTER_MUTE_SHIFT);
-	if (ret < 0)
-		return ret;
+	if (ret > 0)
+		ret = cs42l43_dapm_get_volsw(kcontrol, ucontrol);
 	else if (!ret)
 		ucontrol->value.integer.value[0] = ret;
-	else
-		ret = cs42l43_dapm_get_volsw(kcontrol, ucontrol);
 
 	return ret;
 }
@@ -1077,12 +1075,10 @@ static int cs42l43_spk_get(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	ret = cs42l43_shutter_get(priv, CS42L43_STATUS_SPK_SHUTTER_MUTE_SHIFT);
-	if (ret < 0)
-		return ret;
+	if (ret > 0)
+		ret = snd_soc_get_volsw(kcontrol, ucontrol);
 	else if (!ret)
 		ucontrol->value.integer.value[0] = ret;
-	else
-		ret = snd_soc_get_volsw(kcontrol, ucontrol);
 
 	return ret;
 }
-- 
2.30.2

