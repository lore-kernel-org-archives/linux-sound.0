Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6731F3D36;
	Tue,  7 Jan 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264687; cv=none; b=a3mJEQhQyIcqjddzMHDhEA0ZPGpO/UjUlBvH13OB37+dLrTI+kQxa0Z2wHuDgsxoUJBM55Wu8S1p7aVCL0FYzSG0XGAetT7TtvEJAKKxT/vmty6M1l3Ycg2G0xBJwAdlsrGyCfhxNNdFOlmRkrQ08nzz4czly1BInY0iQleGcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264687; c=relaxed/simple;
	bh=cv4K2iiWCeFuEYcvLw9ZxDtYRbWI2n/ACCz0ZCHzxzM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2pm2VW3S26jLdmqi2RzNaBgYCVqc0rMgZE5gGY4ok9iTlEcPcc1llUxL/952PNvvnhkCFu41x/y8/n+DwUYlcsTr3Rr6TSZSyG8J+jm+uMb4txd95MiywdOxWKew6qM7QSsQ3xqOAKfZOYIpYBxRuHvXj/zwppY/qLws2s3l74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ABx4jRe9; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ABx4jRe9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5076siV1007030;
	Tue, 7 Jan 2025 09:44:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=R8RyQEKNE9b866LjbRiuYIX5+BVMVnUQolsD6vwdpmM=; b=
	ABx4jRe9lMsKKv/TM3q1RvddSeZkcng4JFTkaO5JpwqmXr1eFYFc/MlUIDiJU+8h
	NB2NHWtp3yqDIVxRPfGotH/Y3GxxG/KIina7vQh74auxX9O/pMbeWeyBZimNiO/n
	/W2MSeiBS2kDDUIl7ggnbXIdJ1j7oou8uYSvw/Gv752Vtxc7VdYtxOr5fskoH+5Q
	fG44ZBE1pZtHU0xvsFBlVr0dzHA0d+PBnbJFDsc/P5UhjfRK1Llh9AlsbgRoEA2c
	JOq+nk68BtTMovlf+rCV1MXHZXEQVzyWjnnbL23eSG+R8OkQTQyPaaYJ6lXJ2G9m
	wVsoXHib76vYqn7xWipD9g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kbjaq-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:44:13 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 15:44:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 15:44:09 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1195C820273;
	Tue,  7 Jan 2025 15:44:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <oder_chiou@realtek.com>
CC: <jack.yu@realtek.com>, <shumingf@realtek.com>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 5/6] ASoC: rt722-sdca: Add some missing readable registers
Date: Tue, 7 Jan 2025 15:44:07 +0000
Message-ID: <20250107154408.814455-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kUeJM4X06LEG1plBVnnAH2hhBfcWKcwI
X-Proofpoint-GUID: kUeJM4X06LEG1plBVnnAH2hhBfcWKcwI
X-Proofpoint-Spam-Reason: safe

Add a few missing registers from the readable register callback.

Suggested-by: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/codecs/rt722-sdca-sdw.c | 49 +++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 25fc13687bc83..602547c5fb3f5 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -28,9 +28,50 @@ static bool rt722_sdca_readable_register(struct device *dev, unsigned int reg)
 			0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_GE49, RT722_SDCA_CTL_DETECTED_MODE,
 			0):
-	case SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01, RT722_SDCA_CTL_HIDTX_CURRENT_OWNER,
-			0) ... SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
-			RT722_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_XU03, RT722_SDCA_CTL_SELECTED_MODE,
+			0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU05,
+			  RT722_SDCA_CTL_FU_MUTE, CH_L) ...
+	     SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU05,
+			  RT722_SDCA_CTL_FU_MUTE, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_XU0D,
+			  RT722_SDCA_CTL_SELECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU0F,
+			  RT722_SDCA_CTL_FU_MUTE, CH_L) ...
+	     SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU0F,
+			  RT722_SDCA_CTL_FU_MUTE, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40,
+			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12,
+			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_CS01,
+			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_CS11,
+			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_USER_FU1E,
+			  RT722_SDCA_CTL_FU_MUTE, CH_01) ...
+	     SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_USER_FU1E,
+			  RT722_SDCA_CTL_FU_MUTE, CH_04):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_IT26,
+			  RT722_SDCA_CTL_VENDOR_DEF, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A,
+			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_CS1F,
+			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
+			  RT722_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ...
+	     SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
+			  RT722_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
+			  RT722_SDCA_CTL_FU_MUTE, CH_L) ...
+	     SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
+			  RT722_SDCA_CTL_FU_MUTE, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_OT23,
+			  RT722_SDCA_CTL_VENDOR_DEF, CH_08):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23,
+			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_CS31,
+			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
 	case RT722_BUF_ADDR_HID1 ... RT722_BUF_ADDR_HID2:
 		return true;
 	default:
@@ -74,6 +115,7 @@ static bool rt722_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x5600000 ... 0x5600007:
 	case 0x5700000 ... 0x5700004:
 	case 0x5800000 ... 0x5800004:
+	case 0x5810000:
 	case 0x5b00003:
 	case 0x5c00011:
 	case 0x5d00006:
@@ -81,6 +123,7 @@ static bool rt722_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x5f00030:
 	case 0x6100000 ... 0x6100051:
 	case 0x6100055 ... 0x6100057:
+	case 0x6100060:
 	case 0x6100062:
 	case 0x6100064 ... 0x6100065:
 	case 0x6100067:
-- 
2.39.5

