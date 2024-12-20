Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE521A453;
	Fri, 20 Dec 2024 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716199; cv=none; b=LzlLS1+hjpZWU9DW1LzPhKGjiKiiwV6l2XJmfg3R2F/d0w12G9Flszhw+gQ0IysvqjXdw0xg8aCKHUnq7bgITZVPZb4sxHc0UKbDv0Kk8mab9XKuaLSg5Ju9+UhG/RLF0PpMVSfG9du5V3dpedIV/IQWzm3Jr0bpfXl0CIsmipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716199; c=relaxed/simple;
	bh=xtF+36SMfxfhe9JRceUbBeqEiyy8uqvUjADdoamyHYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrjUKXP3O+ul35OrQjdu2KTnsaeMZVhEbxtzGE3GQLs9psmEIvI7/A3RzhekR7kTbZXayEh2KWKoUmBEbGzDo593JuVcPqTCdb9ow+QCFdyzoBYVC3uyEpJ/UbdCowub3KfQQLpBnmmpybh06uwIyV7JCXem+9Z65Hj3xBQXSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OFm7f3Oa; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OFm7f3Oa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5g3sn016642;
	Fri, 20 Dec 2024 11:35:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9syz/MhKemx45uOst2LQPmQseehXbKQ2TdZ4lAM/OTU=; b=
	OFm7f3Oa5djA0tLgSUsLgvxwZdwZSJkmPWNk8D6lfuTk9fadVJKlIyHmddvvuwi/
	RTUhZji86j23zayVqn8BdwGJw5+PyfUamwOMdIL604MXMEhnz9C2FphtIcw0iH8S
	NvT946OtV6tszrRBm4oT46+1b2Yjjd2n8+sxkRpVGln1urBuFztw4NUOjqsPWwl2
	38WS5ETKJikcM9kJCPQ7dY9hArxqKXJktvFOStNLJn0DAH0FOmSZ05ZhOTZE6d6f
	xq6ghgvfAQ+iCgqCP+19pUC4Jz6EK/bSTjEDNSf9epc1NF9Q3MDxHk1GPUrbkD3z
	+69C8dQ3Ht5pPiGWRwYTGQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akg161-3
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
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2E50D82024D;
	Fri, 20 Dec 2024 17:35:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 4/5] ASoC: SDCA: Add missing function type names
Date: Fri, 20 Dec 2024 17:35:15 +0000
Message-ID: <20241220173516.907406-4-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: qnHhMtV70jSfyfR1s5dV58qag6DNhVZo
X-Proofpoint-ORIG-GUID: qnHhMtV70jSfyfR1s5dV58qag6DNhVZo
X-Proofpoint-Spam-Reason: safe

It is not helpful to error out on some SDCA function types, we
might as well report the correct name and let the driver core
simply not bind a driver to those functions for which the code
lacks support. Also given no functions currently have support,
it seems odd to select some as unsupported.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   |  1 +
 sound/soc/sdca/sdca_functions.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 6943df0851a9..89e42db6d591 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -42,6 +42,7 @@ enum sdca_function_type {
 #define	SDCA_FUNCTION_TYPE_RJ_NAME		"RJ"
 #define	SDCA_FUNCTION_TYPE_SIMPLE_NAME		"SimpleJack"
 #define	SDCA_FUNCTION_TYPE_HID_NAME		"HID"
+#define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME		"ImplementationDefined"
 
 enum sdca_entity0_controls {
 	SDCA_CONTROL_ENTITY_0_COMMIT_GROUP_MASK		= 0x01,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index a69fdb9c8b15..400763e056fa 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -75,12 +75,20 @@ static int patch_sdca_function_type(struct device *dev,
 		*function_name = SDCA_FUNCTION_TYPE_HID_NAME;
 		break;
 	case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
+		*function_name = SDCA_FUNCTION_TYPE_SIMPLE_AMP_NAME;
+		break;
 	case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
+		*function_name = SDCA_FUNCTION_TYPE_SIMPLE_MIC_NAME;
+		break;
 	case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
+		*function_name = SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
+		break;
 	case SDCA_FUNCTION_TYPE_RJ:
+		*function_name = SDCA_FUNCTION_TYPE_RJ_NAME;
+		break;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-		dev_warn(dev, "unsupported SDCA function type %d\n", *function_type);
-		return -EINVAL;
+		*function_name = SDCA_FUNCTION_TYPE_IMP_DEF_NAME;
+		break;
 	default:
 		dev_err(dev, "invalid SDCA function type %d\n", *function_type);
 		return -EINVAL;
-- 
2.39.5

