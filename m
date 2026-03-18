Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D5389DF3
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830307; cv=fail; b=ttQBFtBTSDxuZLoeewwsD82mieUr+rnGUlj5pmAkkuPLxiEoY2fKtjSh8VuBDIEXPy9Yc+ZPDzHp8FG16vF2cquKKw4M+LPurMo6iFKtgohgeZqZhZQZxjJJsQVUuWw6yCG2XeMWMWTzydRoG0kl72vk4Bj/CfKdKYo+flq/SsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830307; c=relaxed/simple;
	bh=H81Eb46fZ1k+tgaoSKViklSpgI9AYER/cToMAdk7gAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/vCMV51jTbvDJZA4zVGNdcmASJ+ed2eKmXjWvfvlNvfyszfGbosKx3GWO5O69VGyfDaVTFXLYYbOyBfJ8rU2gPj5lLAWEsh7Yqd0piGac1ykW29SEntKQVOmXSWDbBKoeDaAGYXCi9YsyFrzHN9lNuqUqYkWqVkVsirPVD2t24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=X8zPky5V; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Rrtdhd6g; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="X8zPky5V";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Rrtdhd6g"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I5hmKv3808385;
	Wed, 18 Mar 2026 05:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=jgdAdSrZ+yhiH0e3
	31lQsdS74/GwFG4x5J9OaYqgNs0=; b=X8zPky5VOk2dnJ6ATlb7uVJvP+W+rVrw
	sodLDN4kHFkwNsOqBIyuASIHzJV9jxrcA4PvUPXtXglk3NiSMnQhqakVhcBKN4H9
	87yOL5dNROSeRTt2OtII+/CxriGEBmIlZxEt88VLqL7/oIK4OlyR1nyhOv2JByJZ
	OrHMQsoSeuutL3wpHIW5Xi1mA4+muz2zq0NpH0YvXqrJFCzxgwOG2mZjjyeysowp
	mK/DsgO3z8cLN+QhG3pLvWj/yw7BU6MUa+WkLONsx3XYGh0sEMCApZMV6VxlRu33
	yIti8zL352D0EHD9956a/SuVlrU1S72f/4tXg9cIQE4mGM5raDGVXg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020078.outbound.protection.outlook.com [52.101.46.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cw43f5245-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 05:38:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eds3ITB8TjRmxUheKxE4AmsdsBxrIPb/rgVQsrJfGGJu+sKsZ9LluE9UEkvvLNbyjla59bPfpHlo+Up1U4NalC/ZEDNbDnTBj8kGZ8Zt5Oximp717yNYnYNHW+n3KHMKWkK588cHuGngGnl4+XFmm6hFfQgDxw6sEGUhyppGclwvn1NlfhDZR2Xrnij0qDFKGdifBQ24Q1JYlf/x9YHUlg+aCzkNLDpJCqFWjCu9pkkFRC+VMqYBghOjyg7eKG1KY78uky9rvOp+q5fp5dYc2cyRuIglUB7vYzQqW8b+9SsYXCpXhpXWcpUiOi7WLzfjvGoY+N1R9qiaZl0UmY0FiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgdAdSrZ+yhiH0e331lQsdS74/GwFG4x5J9OaYqgNs0=;
 b=NyY3hipehs9eabsuiHNr1E39k01adsEmduCfS09QTz+6A1a9TUCnRNykyqy+vIFqmGmug2ErFangpXultcxn91b3gBZj8j7Cjha9mrstgwsBDXu2Z+a//FrH9ulJ1OfO/nMRF25FUcg6d9fA6/9a27MIGCzNMN5EFeg0Cst1CLTyxssryHhK/p06sgiyhdfM+G3Yg4rtEu476CrMkEvIiEV0qyhGNZgNOUIdEfQS9rjpMfIXkvgOeaIHcBmKmGBr4c2s/ImQnlyOe6fvvxAKbhJ6xDn0r1E8VnOtc5HkfmVQA6yiRbVlh6TDHxpvbYkJv9aBj/uzrWToSh7X9dBpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgdAdSrZ+yhiH0e331lQsdS74/GwFG4x5J9OaYqgNs0=;
 b=Rrtdhd6gSioyHilb1UqnNlGS8lj3kcU68zIeIwFeqqi7P77R9Pw7aZMmV3nO/aLNSXq8abZqCvCwd+5hdaCkSszV0YXqSK6O9f3kuSzHQ8VqMNHp9aMYEDYIBqmf+4THY05owKaApXhilJlPcEn4caXZKBxwVUoBKJu1fBUClGs=
Received: from MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::23)
 by EA3PR19MB9565.namprd19.prod.outlook.com (2603:10b6:303:2b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 10:38:19 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::3b) by MW4P223CA0018.outlook.office365.com
 (2603:10b6:303:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 10:37:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Wed, 18 Mar 2026 10:38:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7B2A6406550;
	Wed, 18 Mar 2026 10:38:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 641D2820247;
	Wed, 18 Mar 2026 10:38:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Fix crash in kunit tests on arm64
Date: Wed, 18 Mar 2026 10:38:13 +0000
Message-ID: <20260318103813.249190-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|EA3PR19MB9565:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6451d75-b4d8-4a8d-2fb2-08de84da781a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2HtOe3TJO1WwXyvCQzpPhQnXkRs5fjl2jeyU3rnP1qiILDl6oI/Ym5SJhE4fH5AJYiCJ29Dk/jSYvIWyzHMLW49SL21+sGO8XOY6/FQIERc7naiDB0GmsZ68MWh7ZnuHiUk+B+HY/2dvg1HRS9oLjunsPdjgVeZvfLx7C/R+2eBAHvO4mOnbU1ClSOIW8ZnhsqsM55YVxiZn/L/yZIGybDKcT8e/x4ygli6lkf4VcIG11ODEkkDafi7FW1UPTAxLkQ5fDouoGp1jdgQagntH/+srwOIH2k4eQ4hxU67ZldAryclHHIBL8ZHbmfT2lyoz4j5BDvQHLy/08zOKI9tmxTOxpvG2KTUc0YXjNm44vG6YOmouicBPAIlBWsLKGWZOdr50FY4TqNeHkW9n71mjhBrC31s5Ju/FVJ54bHbvh8rzIfSORWPmm95pVUjd1n+lYOpaV4qP31/o/qSU9StuXePet92p6yytuj5JZoWbUkOZGfLtm9UfptjDuAPVvK3mrhci06cdVFzT6RP+DPRKL1V80YMiOMhLuMdqTCnbUfcn6/ebcXbzOTmeSIwqA7tTIIyks7Q2PBH4aPSxj7RUTkaD+HgR5Qw2cIr9LRfrVLUjDkhVRvWUxQVW9G6aD1FC5aYnT8uB1ZVMfT9f2ygK1tAG2WTok7UriP6S3p/nybbD94dTbUe8V4wgmo4Y+4dZmGziw2IDS1Wq6vmV0V07I5T1wxrwkdbGLcEbThW//WIoK0iMnVifdjp6trG0Lf0YM85rJWwcQBjpHsTKMEYXhg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x2w51d4mf2p6VKjjdxjugA3UtPfBcm0YV/gekjuSaQT6B3Kw57W5wS1O54HUfiALqlzEHGIDM099AH7RHDRR0hkx7bRx9u5e2LBli7s/2YyGkhUZPzQDSAbnZbRgndRkuYE9m2yi2FBrozn4ArXGXXII4kcJMzCypNZbS1CyOfRR0Uj/yXla0+Wp72a5+AP6eSFkpH2Bkb3UI+Fe8e0Jw0V2Mph1/c5HHUjhbaT9KJ23xCDnQPGLZJnxh2BKjV6GQSDPDhl4WxJHUS3Hyn32zfxEmgCCCZr4Z1QBmoIYds6jO0N8NOPE+G+tzYCeLAEfOUEsVtvL+UQa6ZQOzbeSXDmCG7q1wRxhjtC5yMBDmribkbundJuZgJcYLjIzsZkeLTZAZ8kCUDIqyeYGjAayb74IDE0jSNJS1aWUV8y1XaQvrouhSzN0QcDrd52ce7IH
X-Exchange-RoutingPolicyChecked:
	jzs3aQLVt+ibMu+pAV/iLFo8MkQ9Sn2oNRLWNr+6hYugMtMPavYNlfpUxQ2R2UhC50BOm8YfRssMiJOmhrgCKQX3dXpN0A3YzgMdYVaZmCRZ5/eC3TJslWqPbvZOCzwBMEKbOlEmtHJPrfj430iMBjV9jEZrJj8tulmJ8RQM/C7ti/EInOPLBU5c50VjsoDF3FXCP4PbZQ6eNFT/+JTTKbl0n+esWNsN65S2DGIcLCVEM9Juy4mtc5IDyKD3FrT/A3anVSTiMBkqgMXcBcyaOCbFLPMcJg9D+JImzeC0KCX43Zc5AedlEeE7RbxGIHwRodSECSINjwjP9zurlGkBRA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:38:18.2694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6451d75-b4d8-4a8d-2fb2-08de84da781a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9565
X-Authority-Analysis: v=2.4 cv=YqQChoYX c=1 sm=1 tr=0 ts=69ba809e cx=c_pps
 a=x8fXg9NzY3hbHNzXWQS9+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=jUSOBr-9Utsbx6S6qr4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MCBTYWx0ZWRfX8ZW9lw6vMuX2
 aMyHVtl3ji1wiZhtq4tbfSAwEI6Fb72i4lg77Z+1UirvE2C6nx8qChvRDy2r/Afyoo13sDyXcN7
 SckPEqexgdbfnYXo0kXpsD0EHZsOvfFnuDpWISik2PKqR5oQ82ieZB6meJp55gptsBLU2Uwo/GU
 4fnZIVVjUp0rFHTplwfHvU4iJuAdF0oaDmXbcx65JDLej1LLBzZ50DeDuHc61J9vuG7uyuJJzej
 p+hA716gMPE05n8Ll5rW2IE61rZ9KufqTbMt8bZbeGdL5AA1pEnAncRI45wD7aeyov2pYhB3CMq
 oZSjcW6u4MchmdzOxNaGABKpsTyi6p6O+80avJo8DIdcGDk8RPFXbNSMCQyjLoo1I+1Kjl9qQuc
 Qsf8C/jxYEYT0iJMP8rHNm5SwAtnDEpY9w+6uLov10sOZrYQW5Y74XLTbaJVI0g2DW9FgmYTGVa
 vqKdm8S7Q+14N0UDv0Q==
X-Proofpoint-ORIG-GUID: qJ1urwKfs2fn49TDxlURtCR3kaGKX5Li
X-Proofpoint-GUID: qJ1urwKfs2fn49TDxlURtCR3kaGKX5Li
X-Proofpoint-Spam-Reason: safe

Several of the wm_adsp kunit tests failed by only on arm64. This
turns out to be passing things to release_firmware which were not
allocated with request_firmware. This does actually drop some
errors on other platforms but somehow doesn't cause the tests to
fail, and kunit hides a lot of the output for passing tests.

There is a comment in the code regarding this exact thing in
wm_adsp_fw_find_test_case_exit(), but then it goes on and
does it anyway. I suspect maybe there was a plan to override
wm_adsp_release_firmware_files() that got forgotten, as the
function appears to have hooks for kunit that aren't used. Anyway
for now implement a simple fix of freeing the filenames
locally. It is likely a more detailed fix will be implemented in
the near future but this should get things moving again.

Fixes: bf2d44d07de7 ("ASoC: wm_adsp: Add kunit test for firmware file search")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp_fw_find_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index 44c26e991b359..fb886dc61c27a 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -262,7 +262,8 @@ static void wm_adsp_fw_find_test_case_exit(struct kunit *test)
 	 * dummies not allocated by the real request_firmware() call they
 	 * must not be passed to release_firmware().
 	 */
-	wm_adsp_release_firmware_files(&priv->found_fw);
+	kfree(priv->found_fw.wmfw.filename);
+	kfree(priv->found_fw.coeff.filename);
 }
 
 static void wm_adsp_fw_find_test_param_desc(const struct wm_adsp_fw_find_test_params *param,
-- 
2.47.3

