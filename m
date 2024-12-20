Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E11A21E0BF;
	Fri, 20 Dec 2024 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716202; cv=none; b=o939LMKjUb+CYBH5/TPOLWLpfcPhoqOT6ugD7gC5TC8uZmi/84R1+MBN1afTOANqxClZ6Kq3JxeOFnIA5EnLuKPdyMGKSY1osTQ26RelQhJrQBJw+JMriL6ZhGUdQKxTMqNCJC0/Mczenur42lOKDA0Z+xspGSERicpjc5ykUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716202; c=relaxed/simple;
	bh=VJC5/gi/01O6HjbiX7CO4zfrxroD0JoLVZCH0v7SBcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uar5Iz1wewzzOr0RCxv2LCAAaHd1ZgYG7riTq5NrFwfWRzISXAjb0j3EArW3dE8U6BmM64HktzfKkl49U4BRilTbtrygdcVefXBxVudLsn0tPxDG5SJu8ClRvFiU22HhxV52UB+fjVWO8ntTc2s0pBOpTSPewaz2CrC/OKt+H0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pwkO5Inz; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pwkO5Inz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6qF4H002908;
	Fri, 20 Dec 2024 11:35:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tiF6vpndR/TYQxOPfKuHWxiALPaqlrZfM7Ed/jIvYAI=; b=
	pwkO5InzRTH9EpGqTnJm2Z48fRfq//LqkNSAnAP2X07hjRW4L2JxO6ERI6EnA4at
	o7qn5hWhA5jWFx6CgS1JzotHAGbep21Pj7rpT6gpxO7l+X5ENGg0eIpEUI3atDzr
	air4vFu9l7cK9AcNLri59M5uJO8rSX4mAtUuTU0Jp5BEg0INYHkcJgP02LJJTwy4
	dwbf1REiWtWwW9CAbpM2k4D7mrDHJwcuMbxElKqEv5IC/y3+HN94K/5K9x6dqoIL
	8snxMKaZQRHEK9Dx9vMbSoKZWO8dX9Exo1wOkvn3AT+9GWmWgH+xwV6nXprf8V5K
	Nph2LVIekKF7wY5WQBNduw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a286sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:35:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 17:35:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 17:35:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1C55282024A;
	Fri, 20 Dec 2024 17:35:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 2/5] ASoC: SDCA: Clean up error messages
Date: Fri, 20 Dec 2024 17:35:13 +0000
Message-ID: <20241220173516.907406-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
References: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sSdzd9c4gDqB1UWQlaxYYqkGVvfiVduI
X-Proofpoint-GUID: sSdzd9c4gDqB1UWQlaxYYqkGVvfiVduI
X-Proofpoint-Spam-Reason: safe

All the error messages in the SDCA code manually print the function
in the output, update these to use dev_fmt instead. Whilst making
the changes tweak a couple of the error messages to make them a
little shorter.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 1808e5e7dee2..46aa874bb0aa 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -6,6 +6,8 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
+#define dev_fmt(fmt) "%s: " fmt, __func__
+
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -49,8 +51,8 @@ static int patch_sdca_function_type(struct device *dev,
 		function_type_patch = SDCA_FUNCTION_TYPE_HID;
 		break;
 	default:
-		dev_warn(dev, "%s: SDCA version %#x unsupported function type %d, skipped\n",
-			 __func__, interface_revision, *function_type);
+		dev_warn(dev, "SDCA version %#x invalid function type %d\n",
+			 interface_revision, *function_type);
 		return -EINVAL;
 	}
 
@@ -77,17 +79,14 @@ static int patch_sdca_function_type(struct device *dev,
 	case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
 	case SDCA_FUNCTION_TYPE_RJ:
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-		dev_warn(dev, "%s: found unsupported SDCA function type %d, skipped\n",
-			 __func__, *function_type);
+		dev_warn(dev, "unsupported SDCA function type %d\n", *function_type);
 		return -EINVAL;
 	default:
-		dev_err(dev, "%s: found invalid SDCA function type %d, skipped\n",
-			__func__, *function_type);
+		dev_err(dev, "invalid SDCA function type %d\n", *function_type);
 		return -EINVAL;
 	}
 
-	dev_info(dev, "%s: found SDCA function %s (type %d)\n",
-		 __func__, *function_name, *function_type);
+	dev_info(dev, "SDCA function %s (type %d)\n", *function_name, *function_type);
 
 	return 0;
 }
@@ -105,7 +104,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 	int ret;
 
 	if (sdca_data->num_functions >= SDCA_MAX_FUNCTION_COUNT) {
-		dev_err(dev, "%s: maximum number of functions exceeded\n", __func__);
+		dev_err(dev, "maximum number of functions exceeded\n");
 		return -EINVAL;
 	}
 
@@ -119,7 +118,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 		return ret;
 
 	if (!addr) {
-		dev_err(dev, "%s: no addr\n", __func__);
+		dev_err(dev, "no addr\n");
 		return -ENODEV;
 	}
 
@@ -144,8 +143,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 	fwnode_handle_put(control5);
 
 	if (ret < 0) {
-		dev_err(dev, "%s: the function type can only be determined from ACPI information\n",
-			__func__);
+		dev_err(dev, "function type only supported as DisCo constant\n");
 		return ret;
 	}
 
-- 
2.39.5

