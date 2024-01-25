Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D9C1CA82
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178690; cv=none; b=fykrTO+Kic094ZgBS7/CnZrgyGjbbXxeYD9Ng78CD/83TsFUBqfqGsSl/rJbqafxgnfMYra8Hzvq6Orw7vfCwzOHdkjiKIbeWkGdm0oa723cp2bwpe2oECzGC4N/XaUBGwbr93Ni+oWeLDN9dnQhc9ROd5sDj0JwWuGrWP4NXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178690; c=relaxed/simple;
	bh=vSJibILx1FQQKeQdHPnJ863kMO9AQhrPccT6H3AnZP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHqua9KrcRYFpZXISbPgDwAO/q8a1w0ElapBzYHMX4FD9V8BsYyMeyGGSFOiKGBXwRZGp3KNpzQ2HcnSrp62YYwxLxE7nz78xeTdCD3AfcPzyG9PRmtrlkO+khOMobhFcxgKlE28mpTS9pwizXqYqQQSzYn4ml4c6IEUoRkg5ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MT7fEFNw; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MT7fEFNw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6oFQ7010841;
	Thu, 25 Jan 2024 04:31:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=4jDna+FV0NsPQi6M7P1oE7gYF+t382pNOxgF0rN3KAM=; b=
	MT7fEFNwMzyfq4xwAMny8RuNox/MxQ15BkD02tC4bhXFQYoK4TM4B6Jy/MfyKCbZ
	UuJTIZd9AGaVm3CVmHFLG9Vo90yaLjM3QRf5ZKbJMSVrYX5HHDVhK2TjdSiqgly/
	D55YYRYoqUafWdHN5uq+RhUF8a5hHKX9kyXMPtPujURg0u3TEFhWO/Dsv6DouMsU
	NizZTZtu2vVda3ljxOMPtecbtcCObuQMVCQYBy3BTFoRxBIJDlR9ZzjF6TnWFtsS
	AWfO/J01LzO6OLabYxA7W+0RcH0vT9Zyqytnln3Ms0mHnNwAYS+bKCrrL/1RN5c+
	VdFiae4yQj0rv0rGsVEe6Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:22 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 90AF782024A;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
Date: Thu, 25 Jan 2024 10:31:15 +0000
Message-ID: <20240125103117.2622095-5-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: tCXoiafLFG6En8yssmyX7Q14oZ6b4o4a
X-Proofpoint-GUID: tCXoiafLFG6En8yssmyX7Q14oZ6b4o4a
X-Proofpoint-Spam-Reason: safe

Use USEC_PER_MSEC rather than the hard coded value of 1000.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added commit message

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 67ccdc8bab6f6..901b9dbcf5854 100644
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

