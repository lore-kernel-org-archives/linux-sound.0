Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140F1C07F5
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755708; cv=none; b=gSkUTog8LILBZVFpXx3aV1wydMtyLi30xFoRvwTDhGT+k4iUv1mwaf7VeA4RRpYgPAMv6TDkl19PkHVKaxRp+7EZUv6j31lt5R/cOZA4cXDYM3ONkZUvXPwT2VNUsOBQ7d03BT1DQCywg2AZ++7ym1yP6BpHZusZ6NRcrdyFwSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755708; c=relaxed/simple;
	bh=7gkzsMvPsYunmt8HD1Mywaen5jwtCYZyLbopCCXJpE8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=az9AOrVRxkXHb1YxCnhMZlHPMpNMfdnM2A2bRuLRNC7CZaoyp8++ve19VJS6fosHPeR+wJaUi7KYYNPAOqmFPnDXJey3/bC54ZhJdLxJIFy0Fm8BnzFv0AlMAOP5vMZY1hE0AhQR7zZi1ewhWzBEyGKXPhcwmKlPF2IhLLHwTAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kzwlEyQQ; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kzwlEyQQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S90tM5000323;
	Fri, 28 Feb 2025 09:14:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dms7S9KwFOPXxwJx
	LA90kIeIUysK6IeuABhO3blQT9M=; b=kzwlEyQQWFOIU5y4Pl6oN9sesoGPWlxG
	7G1FeXIzcXAxTfF/cQlPJIHBisUCxl+oPpse0QtMObd7sgI0i4YMBMVFSE5fa1O3
	qx42uM/JGdUjwuU47vCDIsAb/RGuV0rZIt/zhTnfLr6KKMh0qgI7wdG6sAR6adEZ
	fCQ+mmfBg8vrAH2tenuPnyl4hJaJtZiVwKeJW7jzGwE35FOT8lqe5wc0hBNG4wWO
	lKyXZCAo4zg5lUQ/Pd0SR7YSbAZ4qU5DkheLkS+gztA0THUlNbqX+sPe2FDmystM
	ZIuuJDhlYRNrgnKf6HmCSLXvsWL926y7iR1ZM4ECQrSMTRUbP92pKA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 451pspy5au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 09:14:58 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 28 Feb
 2025 15:14:57 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 15:14:57 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EED3A82025A;
	Fri, 28 Feb 2025 15:14:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <johan+linaro@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <marex@denx.de>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: ops: Consistently treat platform_max as control value
Date: Fri, 28 Feb 2025 15:14:56 +0000
Message-ID: <20250228151456.3703342-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tUoby5KhWa-xIEXaS4WMoCNlkVvKvOVV
X-Proofpoint-ORIG-GUID: tUoby5KhWa-xIEXaS4WMoCNlkVvKvOVV
X-Authority-Analysis: v=2.4 cv=U8ZoDfru c=1 sm=1 tr=0 ts=67c1d2f2 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=Gxd7u8OaNTtAyedCQjQA:9 a=NmmzKBL2sG_d-YaMeJu7:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

This reverts commit 9bdd10d57a88 ("ASoC: ops: Shift tested values in
snd_soc_put_volsw() by +min"), and makes some additional related
updates.

There are two ways the platform_max could be interpreted; the maximum
register value, or the maximum value the control can be set to. The
patch moved from treating the value as a control value to a register
one. When the patch was applied it was technically correct as
snd_soc_limit_volume() also used the register interpretation. However,
even then most of the other usages treated platform_max as a
control value, and snd_soc_limit_volume() has since been updated to
also do so in commit fb9ad24485087 ("ASoC: ops: add correct range
check for limiting volume"). That patch however, missed updating
snd_soc_put_volsw() back to the control interpretation, and fixing
snd_soc_info_volsw_range(). The control interpretation makes more
sense as limiting is typically done from the machine driver, so it is
appropriate to use the customer facing representation rather than the
internal codec representation. Update all the code to consistently use
this interpretation of platform_max.

Finally, also add some comments to the soc_mixer_control struct to
hopefully avoid further patches switching between the two approaches.

Fixes: fb9ad24485087 ("ASoC: ops: add correct range check for limiting volume")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Note v1 was under the slightly different title of:
 ASoC: ops: Revert addition of min whilst checking platform max

Changes since v1:
 - Also updated the code in snd_soc_info_volsw_range.
 - Minor tweaks to the commit message to reflect there were actually
   2 places still using the incorrect interpretation of platform_max.

Thanks,
Charles

 include/sound/soc.h |  5 ++++-
 sound/soc/soc-ops.c | 15 +++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6bb2fca044c5e..bd7a0514ad7fa 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1251,7 +1251,10 @@ void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
 /* mixer control */
 struct soc_mixer_control {
-	int min, max, platform_max;
+	/* Minimum and maximum specified as written to the hardware */
+	int min, max;
+	/* Limited maximum value specified as presented through the control */
+	int platform_max;
 	int reg, rreg;
 	unsigned int shift, rshift;
 	u32 num_channels;
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 60b33e22ac08c..cd5f927bcd4eb 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -325,7 +325,7 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] < 0)
 		return -EINVAL;
 	val = ucontrol->value.integer.value[0];
-	if (mc->platform_max && ((int)val + min) > mc->platform_max)
+	if (mc->platform_max && val > mc->platform_max)
 		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
@@ -338,7 +338,7 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 		if (ucontrol->value.integer.value[1] < 0)
 			return -EINVAL;
 		val2 = ucontrol->value.integer.value[1];
-		if (mc->platform_max && ((int)val2 + min) > mc->platform_max)
+		if (mc->platform_max && val2 > mc->platform_max)
 			return -EINVAL;
 		if (val2 > max - min)
 			return -EINVAL;
@@ -491,17 +491,16 @@ int snd_soc_info_volsw_range(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	int platform_max;
-	int min = mc->min;
+	int max;
 
-	if (!mc->platform_max)
-		mc->platform_max = mc->max;
-	platform_max = mc->platform_max;
+	max = mc->max - mc->min;
+	if (mc->platform_max && mc->platform_max < max)
+		max = mc->platform_max;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = platform_max - min;
+	uinfo->value.integer.max = max;
 
 	return 0;
 }
-- 
2.39.5

