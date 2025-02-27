Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DF235BEE
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666934; cv=none; b=FiyYqjofrN4MyswXoGuuQ5jGbW93H5/M9NQ6lerSRDX1Z8ePS15BftXh98Wt2D99Cw8injFMN4hNtMGTSAJPPZL6jgBIBuyVx74etmXly71RB7EZxJTlPTgXBuwZKZEsPwThgOpl4nL4BAt7zsCLZAjYSM9FOUepkNfzEnMYS48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666934; c=relaxed/simple;
	bh=T0CBqZNsFPO4PN6YlYja9obGoZvdhT6ylz8yLekj0Ic=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mfjDwWMGMIT6hUS+iCC7QbVeZGpTE7+pfN6NkXVmhndIMYqxYEtN8LS4q1IKhKvWbKuPs2pJZXrTi7/8AG3+t6vC6o50e3dO2cxxZLUWuaAkiSpuDlSdCbu3uJWNd/+I2vORKUsgian6c6btKEAqTSKvpTd6FqbRTjmqD2ddhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n+3IJpi1; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n+3IJpi1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R5fA89022533;
	Thu, 27 Feb 2025 08:35:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=j2ylRuhV9SAmdO3a
	AKs70ewOGejuM2fJtYupetdmJy4=; b=n+3IJpi1t2rB4gkhc3pjdCFGHf1ZnvlP
	PW6oFoIyDQA7wyuvr1suEno0Jo9WMX+TwOn9QmtIz/kDZ3iSToifwjK/7ILCM2P6
	/Occ9kZ3X22baLTS6CCVpUr2Zm0C4q2M6crDul0LgTr7oxFS//QvF9ulRARsZhTn
	5L4y9W41IUKZn00fyfy+V8m+dTsRalRjnQG2Wur2PsB+unVsne59sj1F7vIB7iJx
	LI3v/xqzI2HZsxgvd9HceR9gyg90nQfG6sxdLDKVy97vWo4C/vbgMweY65hO9d/U
	QbxAjg7JU4kGDYhNo8tJM2m32d7lQR4c/UgvFQQghW7yuLc9fDP5WA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 451pspvc5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 08:35:15 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 27 Feb
 2025 14:35:13 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 14:35:13 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7BAD382025A;
	Thu, 27 Feb 2025 14:35:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <johan+linaro@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <marex@denx.de>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: ops: Revert addition of min whilst checking platform max
Date: Thu, 27 Feb 2025 14:35:13 +0000
Message-ID: <20250227143513.3283891-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bu9ISjK-ro3YIAANhHBzgoLQlNVlZOdb
X-Proofpoint-ORIG-GUID: bu9ISjK-ro3YIAANhHBzgoLQlNVlZOdb
X-Authority-Analysis: v=2.4 cv=U8ZoDfru c=1 sm=1 tr=0 ts=67c07823 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=mEWjZZa7ugPbhm_17FgA:9 a=xLu2CgyUih59_Zi6EiZG:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

This reverts commit 9bdd10d57a88 ("ASoC: ops: Shift tested values in
snd_soc_put_volsw() by +min").

There are two ways the platform_max could be interpreted; the maximum
register value, or the maximum value the control can be set to. The
patch moved from treating the value as a control value to a register
one. When the patch was applied it was technically correct as
snd_soc_limit_volume() also used the register interpretation. However,
even then all the other usages treated platform_max as a control
value, and snd_soc_limit_volume() has since been updated to also
do so in commit fb9ad24485087 ("ASoC: ops: add correct range
check for limiting volume"). That patch however, missed updating
snd_soc_put_volsw() back to the control interpretation. The control
interpretation makes more sense as limiting is typically done from
the machine driver, so it is appropriate to use the customer facing
representation rather than the internal codec representation.

Finally, also add some comments to the soc_mixer_control struct to
hopefully avoid further patches switching between the two approaches.

Fixes: fb9ad24485087 ("ASoC: ops: add correct range check for limiting volume")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h | 5 ++++-
 sound/soc/soc-ops.c | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

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
index 60b33e22ac08c..28babe42ed40c 100644
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
-- 
2.39.5

