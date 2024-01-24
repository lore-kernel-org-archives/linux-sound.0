Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735DE7E772
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115375; cv=none; b=lf0FsK8i4s7hnUSLmcD3R1ZRU+k2Ke9FGv2smh83/RiOdOa8mxMmUSMyVhMdfBZS6h+OGmQ/nrybzhtQIIcQ6/f4tpKRtzpXFDOqKJGAF/wvvDzRRza6CDuKreckri3KN4IPnEJpaFgFljgDFUd08iN+C0vVvC9wPUVwPvvyzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115375; c=relaxed/simple;
	bh=Q598g3ES9DwULDvPn3Tu0gZTULbU0YAUntODedh3iwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qe+uRv4MXDlIOFoVolKFSt7xsz4SV1dxW69Q5EsbnS63vAPLUV3ALfzive+0dL9XkBwSxAoCOHx53p0Xc5G+3JMeYeksWdmXgN/n3uDTjLjsX4XMvH67bBas8gbxLmN6u8gAKoiFV50PHa0M8RI1tJtacJa39Gdt3BrbkXLsmgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LAb8MMgJ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LAb8MMgJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O7L4kw000450;
	Wed, 24 Jan 2024 10:56:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=przA4QwCommAhJfz+ziW6gvkL1al7pQyEzCeV5NJhkc=; b=
	LAb8MMgJ3s/tPLDHUmCmCEB2Ls9H3/Mm9L4bfGp/fn+Zt5vDzgmwT/XrgKZLIRYJ
	gI2VQy+wUmAxFiJthAoT9/WzZOkmHdru+j0MemFpwsCGfD2XRHmBbeB5U9XvsauR
	jxcSGpuotFaReh6CJvFyfaz2UqmGkquH13ITygF6mTi9YCQbK+8ZDienMRUP2DKN
	Ia1+ZufRjF8J5JvpcO+MVrfK20ks4qLqisgbYoLAq4zP5poBPXknQmBdWM0PArN/
	26fQYz3Kae7wGxpGaagNKAK8BJ243C28fm4wLcsAto38KUjml5c1+xz8cE5V9/5i
	hqVV5XtTn66HZidxWAkI+Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0911782024A;
	Wed, 24 Jan 2024 16:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
Date: Wed, 24 Jan 2024 16:55:56 +0000
Message-ID: <20240124165558.1876407-5-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: Sc98E8Olr60-OpbYMNmPfSJRpSv6PJAM
X-Proofpoint-GUID: Sc98E8Olr60-OpbYMNmPfSJRpSv6PJAM
X-Proofpoint-Spam-Reason: safe

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 147c7017fd8b6..4bcf66cff566a 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/time.h>
 #include <linux/workqueue.h>
 #include <sound/control.h>
 #include <sound/jack.h>
@@ -647,7 +648,7 @@ static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
 static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
-	int timeout_ms = ((2 * priv->detect_us) / 1000) + 200;
+	int timeout_ms = ((2 * priv->detect_us) / USEC_PER_MSEC) + 200;
 	unsigned int type = 0xff;
 	unsigned long time_left;
 
-- 
2.30.2

