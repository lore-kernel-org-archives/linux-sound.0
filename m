Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF777E76D
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115374; cv=none; b=HcTICNRAPbSCksUjJTm8gjwjgHFtoohABs1dXQxwNyTJCjhjtyJ7YxK8KtfteAC8PgQlq00T+8d23LK5WhysRm78XpELTTbr4UiRB4AWt0/cHPrKm2oESsGgXjSUHLp6hOVCLwlsvrehl2t1yWD6+d+iuKemQQ5pzhVu/v+etb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115374; c=relaxed/simple;
	bh=/pWbttwiVFqyzU/ga3b2z9b+79klev0KH/busw3OVWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d46E2CYVhjn1JHDBQHDizRykU0B23zNkUjYhrxUP6SwbIJ8Kk5SFlJAXcugsQnvxhUcI22sWYvqR6zaA9wLvudV14S0T5cbNemO5a7gqFNE+9nFQ0v+106a5CRezsa1yGuJ5uh0gBlFnjxhos+enlxFrezAbMRQcuVaU7R9r/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZgjyqDES; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZgjyqDES"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O6Pu39003749;
	Wed, 24 Jan 2024 10:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=nlLlsNCSpaOmPb1UHn6JHOCtAJ0NsxCp2Jj9FnLQWWU=; b=
	ZgjyqDESZK8q5cg5lJzyAFGWpTSIMLgsX2/WaGNbholUx76JADOerFkz04pX5LQz
	y20Mbn3/w9lHNXD4k0b3cU+Tl712MPLKFcJk7Z4qiYni0W416J5b7kXI+8r/SBC8
	kva1WB9VEMcjyvknEevB2wuKNlv0q3kq/D7jFw6acC4Qb8HHWvMcO1pgIUY5Kjiy
	vfv97Mo7VqG3UX1Af+IWz+sLoCXVGBxTZyqeLRwBfLYtj1gF+iwapT5CvakNABnO
	X9WWrYuZgP1vtVb6aQEUOevoJgrBVIQzBZtFFgts1Ete9UwCfsGeKzfYZiNvveOf
	5CU1ztVqlzIL6F6BBE7uCQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44r-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 18122820270;
	Wed, 24 Jan 2024 16:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 7/7] ASoC: cs42l43: Use fls to calculate the pre-divider for the PLL
Date: Wed, 24 Jan 2024 16:55:58 +0000
Message-ID: <20240124165558.1876407-7-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: 934ndI-eOfSMlnBIa0sWJ-vOVgV6wF3O
X-Proofpoint-GUID: 934ndI-eOfSMlnBIa0sWJ-vOVgV6wF3O
X-Proofpoint-Spam-Reason: safe

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 05ca20d4fd622..ef154aa76d576 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1336,10 +1336,9 @@ static int cs42l43_enable_pll(struct cs42l43_codec *priv)
 
 	dev_dbg(priv->dev, "Enabling PLL at %uHz\n", freq);
 
-	while (freq > cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq) {
-		div++;
-		freq /= 2;
-	}
+	div = fls(freq) -
+	      fls(cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq);
+	freq /= 1 << div;
 
 	if (div <= CS42L43_PLL_REFCLK_DIV_MASK) {
 		int i;
-- 
2.30.2

