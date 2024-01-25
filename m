Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7F1CA94
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178688; cv=none; b=ZRYMXFISGFpYs4lWmPmP/NiP/f0em1QWrgcTikxpZfWcEnV011NQ3pkK7g8x2L1gUoIrDyWchWXgXrBVIJl/H5x1kQZ1YaI25aIlgo7UbmbxbK+p8+vM0H/uK2azEpBNIV7kHAa7jwUc7rAxrQdM3JaSy6I4wfH1geVC2gZ7U8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178688; c=relaxed/simple;
	bh=mcO1kO6Eusffstk0a+UN48hUNihoWe2RVTyOdQQQLSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6l11uuNVCYfyUYjHpUrB4tSK65Diw/tIeP7SaClTkQ2Yo9mXx4NDorDBo94Qq15C9iOVh/6EGd4XtiwuEQdzmz/XAkrHRdOCbfxMsvKSsmdqKdOXxAeCwD83mq/q2v6QTsHwZuiDwIbN3Uzf+0phoZ3MkOsMAMYz+uTiekB6eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Qu4YdkA0; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Qu4YdkA0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6oFQ3010841;
	Thu, 25 Jan 2024 04:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=6rjHj7YqFV202SVDxF4wuFl4W48j8/J0dMPI7OQKbSM=; b=
	Qu4YdkA0IJS3AdWIFjIkddN49LUy7HOCJknUW3P9F6ZjExqtrFvIh1sJwgEbiDko
	qTzNVpfvfKfI46aJWFg1UxsQF9JoAK+THNuHFG7Pu1Auekqg8h31g3z0z6sD+Oe/
	uJ19jE9R/PNNe8n7K4LUB/CNsabGNsoRTxDrnqNdNQybBpaViQWogLx4vLGr9UdQ
	mHm0jcWw+itUPPYO/CQ9IKKke2xmAK14pZNXKaSyEBYujqaKrRAXwWtadECn3540
	HbItKRPq7pAK4rbHOJNvHDY5aefZrXvNToKecg1BrJlZcXGXESkpZNGYG1AnjP9f
	Tw8kpmNJ0Xsf3eAjbY8N1g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 75972820247;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 2/7] ASoC: cs42l43: Minor code tidy ups
Date: Thu, 25 Jan 2024 10:31:12 +0000
Message-ID: <20240125103117.2622095-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Y8ct22JkvgvxYLPfMkDowfVIWHa1qeeh
X-Proofpoint-GUID: Y8ct22JkvgvxYLPfMkDowfVIWHa1qeeh
X-Proofpoint-Spam-Reason: safe

Add some missing commas, refactor a couple small bits of code.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Move static assert

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c | 10 +++++-----
 sound/soc/codecs/cs42l43.c      | 12 ++++--------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 1d8d7bf0a6b0d..4f7a405b7e06a 100644
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
@@ -851,6 +851,9 @@ static const char * const cs42l43_jack_text[] = {
 	"Line-In", "Microphone", "Optical",
 };
 
+static_assert(ARRAY_SIZE(cs42l43_jack_override_modes) ==
+	      ARRAY_SIZE(cs42l43_jack_text) - 1);
+
 SOC_ENUM_SINGLE_VIRT_DECL(cs42l43_jack_enum, cs42l43_jack_text);
 
 int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
@@ -873,9 +876,6 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int override = ucontrol->value.integer.value[0];
 
-	BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=
-		     ARRAY_SIZE(cs42l43_jack_text) - 1);
-
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

