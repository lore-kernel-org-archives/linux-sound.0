Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBA946C
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267982; cv=none; b=RRUwf11Jesn0EdYQwd4zneb74heumJ3mL+T64nEAo06aE9KCuGfywWtNVo4MS+9I7r2CHEa6onnJ3YBppY3zbare5Ycj3R3sPMeTfgrARzmEmb3g7NpURqswPAaVm1qj/tfaF6PZwGTW8kSq5UhoNQ5MBkp7kZbOUeJY0g85mvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267982; c=relaxed/simple;
	bh=W0H7cIwMxYXTdeRehCjhCF79Bas0F86BWUcKA5omqbA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CprXlAopnI8qx7GgfkmVKv+iQTQi/kp9G5iXnySipqe134QnneUlZ8Dqd75+isrYTtJx0yw7ihh9/RZx8gSIr7i6bvLmx6JC8PBYAh/GR3YGvhC4xQuivWigISQSeaS2rGeMokiFMLvMWH1MqlH8x3zeK8hC4e/q4P3UmJh0kFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hZWxUYFJ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hZWxUYFJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52651OEK032364;
	Thu, 6 Mar 2025 07:32:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qjsRZihuuf2e6SWh
	0idrFJ3mR8whBrTz5znh8Ogaj+o=; b=hZWxUYFJpcgYbJ+zNXn8dvKb2kI6tQ6e
	8OIBPLcgkPl0vBPqaU4XtqA1LpKBuiyzvs9pB+cF7J4hzXPhayulMyqSdMHN6Swb
	MBCKM5fNUdyaiZwB+6q0xwq8mkMnMOY5B2A3PiyCJN+Nab0aOInYIc/oJ615TdiB
	wLRHZBdwOxen+HLgvcIZPrEtyije14Fkmt6BCYvC3L3ip+2lmUygc+Qv34NU4ZCR
	1QVWh7Gbp108zgXtp8Ru3SltegA+rpQQqSzj+NX78d6KSe5IkLR6FX9azNkcJO2B
	rPIUEGhV9mBB8q0NQcqnCrJ5qUKJ7T4vXW6ckqC1xiyJd9RFVHUv/w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 455fyypu0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 07:32:56 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Mar
 2025 13:32:54 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 13:32:54 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7BD7F820248;
	Thu,  6 Mar 2025 13:32:54 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Fix maximum ADC Volume
Date: Thu, 6 Mar 2025 13:32:54 +0000
Message-ID: <20250306133254.1861046-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7dlaF5MtZwAsWJRBNikpjE5xTwd1nxTz
X-Proofpoint-ORIG-GUID: 7dlaF5MtZwAsWJRBNikpjE5xTwd1nxTz
X-Authority-Analysis: v=2.4 cv=DaftqutW c=1 sm=1 tr=0 ts=67c9a408 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=Vs1iUdzkB0EA:10 a=w1d2syhTAAAA:8 a=ANXeP0B40um7kTm7VBIA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

The range of ADC volume is -1 -> 3 (-6 to 18dB) so the number of levels
should actually be 4.

Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 4257dbefe9dd..d307b56a7f38 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1146,7 +1146,7 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 
 	SOC_DOUBLE_R_SX_TLV("ADC Volume", CS42L43_ADC_B_CTRL1, CS42L43_ADC_B_CTRL2,
 			    CS42L43_ADC_PGA_GAIN_SHIFT,
-			    0xF, 5, cs42l43_adc_tlv),
+			    0xF, 4, cs42l43_adc_tlv),
 
 	SOC_DOUBLE("PDM1 Invert Switch", CS42L43_DMIC_PDM_CTRL,
 		   CS42L43_PDM1L_INV_SHIFT, CS42L43_PDM1R_INV_SHIFT, 1, 0),
-- 
2.39.5

