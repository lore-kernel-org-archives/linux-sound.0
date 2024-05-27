Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB28830
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804541; cv=none; b=iV605QOmwmiop3eE3wqjiKYNb1iu6O47pi7wRMylFbQUxRaUPFSPHunMqrYhk5EXTEXKN5nzvAUr+n/WngrnhRgh82+0O6TipOSTVCsFD37D510GUnBEaGORktrFT/NPxRbMt2iqPV+nuXfCKVQtwIBmmL6XReCC6w3ZamBspMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804541; c=relaxed/simple;
	bh=GN1xGDlaIKf138qaAXKw0qf5bfYLDdi77Bh4r77NL58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OtZi384tZLvHm7oTAys/k39MI/GRoS7rl1+pqY6mc8ticy7uYGnA0LHhncw1sypK5wS5TWD1ttPad3EfZniOsZz47ZusrkptN5vU4nZO2Gh3xzXbz6GL2nwVvJkTAK8FRZbEf5TgF581lnt6IqwfcAQe3p4xMz/plz202zlACUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SiqSTh/t; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SiqSTh/t"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R6Ouvf000670;
	Mon, 27 May 2024 05:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=G/NXgIHGDFX/etXI
	D8vHdB162jVSuswDPQAKduYMJJA=; b=SiqSTh/tA+ZBql0S/asoVeLV88Vg9tNE
	fe8PHPzQ5TE0lQPtAPBf4O9kIcdY40iqxGQa6GMkEvH++M/enEvLFxrXRs5inF13
	apdDxpjrUCrrDJbIFEwvUZh3se1zTCbkXnN2v6I0B5fghyWsnU3leafVxflOMmLQ
	bc/vRZ8NegHuZ2Sbvxq9Yu22ZqLJDJ6KyNMNg1m/mov436JAFifMU4XI9ZlICZFy
	f5Iu1Sqjh+Unv+RUrS6Ni/XWEbXCDZ9D4R9fTU0tlY9JDehfPyYMtwQ9sTxLzmrg
	JzMWeYmvy0KEHi6PLSg/JxAyKNkhujFNhN2sgXKmJKTk/msdupIS0Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ybcdh9a4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 05:08:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 May
 2024 11:08:40 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 27 May 2024 11:08:40 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B4E54820270;
	Mon, 27 May 2024 10:08:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Only restrict 44.1kHz for the ASP
Date: Mon, 27 May 2024 11:08:40 +0100
Message-ID: <20240527100840.439832-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EXRy9CASsGB7cK70_JRHiUKkbFbA9YCw
X-Proofpoint-ORIG-GUID: EXRy9CASsGB7cK70_JRHiUKkbFbA9YCw
X-Proofpoint-Spam-Reason: safe

The SoundWire interface can always support 44.1kHz using flow controlled
mode, and whether the ASP is in master mode should obviously only affect
the ASP. Update cs42l43_startup() to only restrict the rates for the ASP
DAI.

Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 94685449f0f4..92674314227c 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -310,8 +310,9 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	struct snd_soc_component *component = dai->component;
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int provider = !!regmap_test_bits(cs42l43->regmap, CS42L43_ASP_CLK_CONFIG2,
-					  CS42L43_ASP_MASTER_MODE_MASK);
+	int provider = !dai->id || !!regmap_test_bits(cs42l43->regmap,
+						      CS42L43_ASP_CLK_CONFIG2,
+						      CS42L43_ASP_MASTER_MODE_MASK);
 
 	if (provider)
 		priv->constraint.mask = CS42L43_PROVIDER_RATE_MASK;
-- 
2.39.2

