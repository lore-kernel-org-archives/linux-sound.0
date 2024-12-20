Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1839621E0BB;
	Fri, 20 Dec 2024 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716154; cv=none; b=EfxYKK6fgNohOIu+IF4X2WVn9m3GJ0Mz9QDlcVXCieoeGDz9Sa4X2+9YgjggIx1A34lrulgisTKge0/AgVyZ9E3lWO8WZ9LyGQdTjOYc4lUDaK7RlC29MlHCW+/T272lz2PowQHV6cdmfBXa7jeXXXVRtaUMmsFXfmAWYml6qX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716154; c=relaxed/simple;
	bh=8B2On/spqRTBsgBnrR+xF32xPjSUbrrPetqba3MM4EA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrMlQUWrFToZ6ZFkBVvagXVP7JYaJdsdb8e3sIqH/jGDDGhDi7yvsSHQ5M8WDeZieFfbv8ZQN9CdXHjIRKdTv/0bedq0MAtosMh+LZVzmFSz/1edUBJB7jqDmlh7CPMfEk8p+bMqcv9bv8GUR4wRN8TV7YSs6Vd7/lu+y3BpMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qVNdcZlY; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qVNdcZlY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5g3sm016642;
	Fri, 20 Dec 2024 11:35:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=CwwYTZj8rOTUzy0cIfvNx/NVEkCVr7rfFAwrv2tL7HE=; b=
	qVNdcZlYYqvs5JqrlpLJ55Xu/N1CiKFe+gRJ3lQe4oCZdRdOPJ7gtH3kIc4Ym+il
	ep61Kp4x2y0U5EXsjO4XMDZAs6OgMl4NQsUqxMCXZffKrHEfZdJasyVA+uI7faL4
	1WpgkGNyKIEMPchoD6KLrbH/F7Xo7o/RZ9/qCFfYAtl+SdfKm05Y74qkKfMFVmzz
	4ZJVRja0mnii8RpsZI08wHEbowbFzOXPYUWXHSU8rOO2INVCeIo2VMAXCELOC+wc
	rNZ9p1Hxi5Kcn4/zhRGKY0ysN7vR6U1/xIlBmGtQiZpZz5Fw11xyu89jmsjUvHYy
	cRIlCnkYnaLx0YKSdLFZZA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akg161-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:35:18 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 17:35:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 17:35:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 31E61820257;
	Fri, 20 Dec 2024 17:35:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 5/5] ASoC: SDCA: Split function type patching and function naming
Date: Fri, 20 Dec 2024 17:35:16 +0000
Message-ID: <20241220173516.907406-5-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: od2GcPTflMkxY1cTGzvBV_XD96PxkB94
X-Proofpoint-ORIG-GUID: od2GcPTflMkxY1cTGzvBV_XD96PxkB94
X-Proofpoint-Spam-Reason: safe

Currently, patch_sdca_function_type() both patches the function type
for older SDCA revisions, and reports the name of the function. In
general it is cleaner to have a single function only do a single
task, so split these operations into two separate functions.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 117 +++++++++++++++-----------------
 1 file changed, 53 insertions(+), 64 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 400763e056fa..38071bc838b9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -17,86 +17,64 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
-static int patch_sdca_function_type(struct device *dev,
-				    u32 interface_revision,
-				    u32 *function_type,
-				    const char **function_name)
+static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
-	unsigned long function_type_patch = 0;
-
 	/*
 	 * Unfortunately early SDCA specifications used different indices for Functions,
 	 * for backwards compatibility we have to reorder the values found
 	 */
-	if (interface_revision >= 0x0801)
-		goto skip_early_draft_order;
-
-	switch (*function_type) {
-	case 1:
-		function_type_patch = SDCA_FUNCTION_TYPE_SMART_AMP;
-		break;
-	case 2:
-		function_type_patch = SDCA_FUNCTION_TYPE_SMART_MIC;
-		break;
-	case 3:
-		function_type_patch = SDCA_FUNCTION_TYPE_SPEAKER_MIC;
-		break;
-	case 4:
-		function_type_patch = SDCA_FUNCTION_TYPE_UAJ;
-		break;
-	case 5:
-		function_type_patch = SDCA_FUNCTION_TYPE_RJ;
-		break;
-	case 6:
-		function_type_patch = SDCA_FUNCTION_TYPE_HID;
-		break;
-	default:
-		dev_warn(dev, "SDCA version %#x invalid function type %d\n",
-			 interface_revision, *function_type);
-		return -EINVAL;
+	if (interface_revision < 0x0801) {
+		switch (*function_type) {
+		case 1:
+			*function_type = SDCA_FUNCTION_TYPE_SMART_AMP;
+			break;
+		case 2:
+			*function_type = SDCA_FUNCTION_TYPE_SMART_MIC;
+			break;
+		case 3:
+			*function_type = SDCA_FUNCTION_TYPE_SPEAKER_MIC;
+			break;
+		case 4:
+			*function_type = SDCA_FUNCTION_TYPE_UAJ;
+			break;
+		case 5:
+			*function_type = SDCA_FUNCTION_TYPE_RJ;
+			break;
+		case 6:
+			*function_type = SDCA_FUNCTION_TYPE_HID;
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
 
-skip_early_draft_order:
-	if (function_type_patch)
-		*function_type = function_type_patch;
+	return 0;
+}
 
-	/* now double-check the values */
-	switch (*function_type) {
+static const char *get_sdca_function_name(u32 function_type)
+{
+	switch (function_type) {
 	case SDCA_FUNCTION_TYPE_SMART_AMP:
-		*function_name = SDCA_FUNCTION_TYPE_SMART_AMP_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_SMART_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_SMART_MIC:
-		*function_name = SDCA_FUNCTION_TYPE_SMART_MIC_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_SMART_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_UAJ:
-		*function_name = SDCA_FUNCTION_TYPE_UAJ_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_UAJ_NAME;
 	case SDCA_FUNCTION_TYPE_HID:
-		*function_name = SDCA_FUNCTION_TYPE_HID_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_HID_NAME;
 	case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
-		*function_name = SDCA_FUNCTION_TYPE_SIMPLE_AMP_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_SIMPLE_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
-		*function_name = SDCA_FUNCTION_TYPE_SIMPLE_MIC_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_SIMPLE_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
-		*function_name = SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_RJ:
-		*function_name = SDCA_FUNCTION_TYPE_RJ_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_RJ_NAME;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-		*function_name = SDCA_FUNCTION_TYPE_IMP_DEF_NAME;
-		break;
+		return SDCA_FUNCTION_TYPE_IMP_DEF_NAME;
 	default:
-		dev_err(dev, "invalid SDCA function type %d\n", *function_type);
-		return -EINVAL;
+		return NULL;
 	}
-
-	dev_info(dev, "SDCA function %s (type %d)\n", *function_name, *function_type);
-
-	return 0;
 }
 
 static int find_sdca_function(struct acpi_device *adev, void *data)
@@ -150,10 +128,21 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 		return ret;
 	}
 
-	ret = patch_sdca_function_type(dev, sdca_data->interface_revision,
-				       &function_type, &function_name);
-	if (ret < 0)
+	ret = patch_sdca_function_type(sdca_data->interface_revision, &function_type);
+	if (ret < 0) {
+		dev_err(dev, "SDCA version %#x invalid function type %d\n",
+			sdca_data->interface_revision, function_type);
 		return ret;
+	}
+
+	function_name = get_sdca_function_name(function_type);
+	if (!function_name) {
+		dev_err(dev, "invalid SDCA function type %d\n", function_type);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "SDCA function %s (type %d) at 0x%llx\n",
+		 function_name, function_type, addr);
 
 	/* store results */
 	func_index = sdca_data->num_functions;
-- 
2.39.5

