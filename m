Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C01327E5
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716805708; cv=none; b=hrACPK2fTppaSGId4m7+LLSz6aCdWfHVHUM/Wxv+Nuvr0+1m67doDdBA2239a118TwEfp08uImXgKY9+MLyU60+aPXSdLpuJDk/neW+iKyojCQZ+wpZ/MCk3i2j+qkjkARcExS29EG11dMnJlL2W8jqVgW2NUSrz3B0/aZKGxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716805708; c=relaxed/simple;
	bh=N31slONW+0nzCgUxGnt94Sj46SF9YlGT9Cq9v2U1ppo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nzoPIQTxAdtNxDRYxvnmfpdBe945xG5nqFBhp+JroELD72ZlHq6WJnwUoezJ+Xw9t+oWdYjgcAsNl7LGzCj0AedbEhn6oeK7y1B2fsE23M+CJ8jMmyArIXViCIk7TDZ4v2q7eAxOMrNPwbbXKQ8qfASFSGU9p4FkVgHdgDlJndE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TJadNnOF; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TJadNnOF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R72Pq2010857;
	Mon, 27 May 2024 05:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=krXMEU36L0fNewXd
	BaCNaOnh0hW4Z6XUp6+Ea1uaaB4=; b=TJadNnOFBGSAgzHCRba1/5Xm3YTf0g1z
	uK27DCrUpYlvGgb50GtEYT8sd+RidEe2WGqBQSXxvGK2KYrzS/fTLMaIJ5uu1nbk
	cOUGLzIQBVY1xFkyTkuyOZNpdNAp4kHy28cB4ewdMo1Z+yhDeQ8cY/nVx7d46ZRj
	WtrTipCL9wWXJ/tDWJSA5IDllPt7SoU5GujJ4oKwwZqgs5y0O6s2N9FRCFRxtYCU
	xdMwol7KDX7Sy8JRHht7y1iriXJuPppANyL7ag2DSxPrH2ntrpUkslXfttQG5cqR
	2RQDV9D0d51OLxtW2IcinkvUl9iGFDvyjnx146PAIi0UHuWujKqaOA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcws9hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 05:02:41 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 May
 2024 11:02:37 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 27 May 2024 11:02:37 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 741E5820270;
	Mon, 27 May 2024 10:02:37 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: Add missing MODULE_DESCRIPTION()
Date: Mon, 27 May 2024 11:02:37 +0100
Message-ID: <20240527100237.430240-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: K8P0Yb3XhFmBdFWDuxdzuQgrQYl1PkDv
X-Proofpoint-ORIG-GUID: K8P0Yb3XhFmBdFWDuxdzuQgrQYl1PkDv
X-Proofpoint-Spam-Reason: safe

wm_adsp is built as a separate module and as such should include a
MODULE_DESCRIPTION() macro.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index c9d9a7b28efb..68d2d6444533 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2085,5 +2085,6 @@ static const struct cs_dsp_client_ops wm_adsp2_client_ops = {
 	.watchdog_expired = wm_adsp_fatal_error,
 };
 
+MODULE_DESCRIPTION("Cirrus Logic ASoC DSP Support");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(FW_CS_DSP);
-- 
2.39.2

