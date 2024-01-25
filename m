Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560E1CA82
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178694; cv=none; b=NsBAW2OQdNiHU6gJ2yi9DskcKQT52hFe7Wa5VlJxo5zICt+F3T5+bw4ImU1pVa1pzGWTn/TyQyFtZPxwTqpLFWJIYczobFpqkZolYAe0Wrmbg9+UYtRgrdGJ+sY4ht9h+9uTp1cmlrFL4B1l5VkH8hh/LLGp2/AEJGXFHP9GhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178694; c=relaxed/simple;
	bh=74xy6bXGMuQCFhfauhIX2FmqVaxkq835O7ubysl9X9E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVvTnSglSn1VWF8si2ObBayVWl0GgrW0crrSyHaZtpAyImpZabgYd7+H6mSyu61l6O303iVE8vb+wc+p0XahEO4CkQ+kcnEYOCU4SCZEfY8BCy9lCYh2XA1cI++LFGNEAuRY7Uv3CX+EBZfioxPAKqEFopc1jYZKIlL2XNrXoCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JQdrJRU4; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JQdrJRU4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6oFQ8010841;
	Thu, 25 Jan 2024 04:31:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=b00fmaNr6KFnOua3z2NJYeD2LfAVRCQxrGXVQrSrW00=; b=
	JQdrJRU4kja38XML6pj9OvE9rwJaCDeDGq6eVaiPHhjUQNiHxhEt2WGDu7zisE8k
	z/Meeoc1g5+PDiZ5w4ZRwOcjT+D22vuaYDaHc794ojAvnP4fEf0iWLOyXhEBH8Oi
	z2mvjigUiAQFvy/sxLqly5dq+NeCEYOEk7Z6MYdNAESTdUWYp9SEIFNgOeL7alai
	jbcQ0o2254aunOp6r8fpfPYKgRcomstEeOhR36Pf72lPibR4XjPLoyyukGiMbze8
	h7AlTlUsGObGE5EhyhTxstBBu4cTtsNITroWByLMi6UbcyuS5MrD0VsI0/29sTpW
	qX1ST5ip7xFKMl6CvFe/rA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:23 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AA5D5820270;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 7/7] ASoC: cs42l43: Use fls to calculate the pre-divider for the PLL
Date: Thu, 25 Jan 2024 10:31:17 +0000
Message-ID: <20240125103117.2622095-7-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: wTqMl6uxuAiMH9BltiOe4Yhf_F3B6Eqw
X-Proofpoint-GUID: wTqMl6uxuAiMH9BltiOe4Yhf_F3B6Eqw
X-Proofpoint-Spam-Reason: safe

Use fls to calculate the pre-divider and input frequency for the PLL,
this is marginally faster than the previous loop.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Change / into >>

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 23e9557494afa..2c402086924d3 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1338,10 +1338,9 @@ static int cs42l43_enable_pll(struct cs42l43_codec *priv)
 
 	dev_dbg(priv->dev, "Enabling PLL at %uHz\n", freq);
 
-	while (freq > cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq) {
-		div++;
-		freq /= 2;
-	}
+	div = fls(freq) -
+	      fls(cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq);
+	freq >>= div;
 
 	if (div <= CS42L43_PLL_REFCLK_DIV_MASK) {
 		int i;
-- 
2.30.2

