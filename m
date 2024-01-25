Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405801CAA2
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178689; cv=none; b=sDJoa4LuZVlJh1PDVYiweZYXzSo/NTBRY2OesqQ+dM2aLM0WHRmywmGvFF4Q2GKYNHS/RZIbu8E2ryJ/exE8jbvPRFa1Y5MoCVGemWqTsj3Th1CsL9ifVxHleK4SnYDBDh+Sy6TF2MDFBAFK5bj3DIdA3gqTf/agbpOfU+vGFQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178689; c=relaxed/simple;
	bh=tT3rEg+Hnli5xVMR7wEmp2rtZ+JsRr53eHkR4QJp6Cg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbD+1Cm7jsvyXVCqC7PlxqkvINLTKP55h8A53NL31lqWcFVM2py1TFWxdUJDkXLwp1JEgsamTE5MMR859ZPsTOwldCSzPmzev7YiTAthhgutLF/bBtQ6QZIX5lHfoBaPIKvT+CWKT/g0YG3zT1vvDdKNTk5s7pdH1tkl+4bgR8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UPt9sLPs; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UPt9sLPs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6oFQ6010841;
	Thu, 25 Jan 2024 04:31:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=wM66v6KnK8q48bXk35LK6FA8cA2NdL6vYO6G9pylDtE=; b=
	UPt9sLPsCbGDrnbHiAOFVmPwyf6c41OPjV6kXUm+j48ZRMlIqO2fmYpaYpQlacdX
	SQDM5QTN08AiixYaekHXIoHLx8Mte2E4E5vY+31PZGx/KXb3hbVC98AsPKgc6RLJ
	P15e9JSfLojOyS5nONR1G1Ou4zdONnJMKsyIn1UQO14MhO2wnBiQKCqlrT2MSxEv
	ax5Qf6ani87a0GjdVL+3s4+WYTWqBK/Lihgw/jftZyR6kk32JB+RGnKJ4CKhl2t9
	9qtwxnfhCFSgI/4D3AFFt4LW11TmAbKE7KJkoiDf4pbwAPXrxmtCoN3Fb7QLdjNw
	5iQ83SAK9d3ftJd3LLY5lg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 84606820249;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 4/7] ASoC: cs42l43: Add pm_ptr around the power ops
Date: Thu, 25 Jan 2024 10:31:14 +0000
Message-ID: <20240125103117.2622095-4-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: VyPs16uuCx-jB0x4IiOJZHQe2NylKGe_
X-Proofpoint-GUID: VyPs16uuCx-jB0x4IiOJZHQe2NylKGe_
X-Proofpoint-Spam-Reason: safe

Add missing pm_ptr around the power ops.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added commit message

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d418c0b0ce9aa..1852cb072bd0e 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2349,7 +2349,7 @@ MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 static struct platform_driver cs42l43_codec_driver = {
 	.driver = {
 		.name	= "cs42l43-codec",
-		.pm	= &cs42l43_codec_pm_ops,
+		.pm	= pm_ptr(&cs42l43_codec_pm_ops),
 	},
 
 	.probe		= cs42l43_codec_probe,
-- 
2.30.2

