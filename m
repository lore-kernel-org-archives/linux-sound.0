Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F63A759C
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226338; cv=fail; b=dbM5GY4PHConBkNR/bojPanB2iYTW/ckNfIqEho/y+PxHQN1oTdFt0MsAe5txbjqSkbl/akwOGoYiwlcMGUV5cy3zIV12njSJhVWqx2lEJq8iKwc6WMZadgNwfDQaR244qNuc6dG7xs6kiswMA9O7jblDU851iHJ+6gzK6gTY18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226338; c=relaxed/simple;
	bh=chEoTfSqk+9LAMhC71GPaCC9EaOEft0/lEK4djTKnuE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WF1IFa9ylweo6MlPPqxS72S0iHrEkit2HEp25eL20KbxKtZkGtMxDi2qJxWRt3nW6Ysvty1Ydl+neJeb6pdg0SbFl6gHPmMHj7pu9P0JZFPDZv594kYwkAz9zxkdIehA4j3tlLeViWQ1yhMgfB1WAGmayKR9wcbTrzFHgKBvZrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MhZfGpT1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dJECNuRF; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MhZfGpT1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dJECNuRF"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6810nvPq2359500;
	Mon, 31 Aug 2026 20:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Uc+eDoYeQ474m
	81Yby7mWgAe+dmtX5Kskp9ae4aRYVs=; b=MhZfGpT1BKDhzGWksBcKpI8Uzj/mc
	Q4afrscY+8yPOWpc/hVyTFRU+lPWIIKm3K1tG00FMuQeUx1EffwH0Axw7NQycGVZ
	KS4TQlTYgnoWHacTJSF8hqKu9ffwU/uo6qSkleC9YEXITiKfaUCERdpRmGCVHwSN
	brBO6t3uze07LJV0UqW8TvE68RUlFa/bOAgMxUKlz44Y3xlLjo4vVnXcycBhurVy
	MVoKM2v2m4x/OlA3foyKYmG6brYKt5MU1I5vYDW0N9YKvMP6E0rYONUZDqyD6/QL
	lloxadnmeYE1mFi5uSiCHxzL4MY195aF3BqNazw8pTJ0yEKUn0uSAGf7A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gd44nee76-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 20:31:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfRaVcUO7Z5s+ozdUnLE64GRc2BMx0TO7v+5urRMmHRrlxFYzwk4Z+3Zlivbprs1Z6rDm/W8wOsLuRa9LUyTuy60zUgaNzMwvm30JXrolIu8TMGmYT1Zsg6nCyDLdC7KUelg/WkVbKEjAF4nz0MkipQsYR1NIDDk9tBTRCHZNKqCNF3+wxVHUPwWrrDI1hruH5aJUsiNdkPz0gPrH+Gq7c5g6G3SqfkvaHp6XxlfHNxKJNLvDPfGv0dIWPUHqfrXfyU2MajjCs6cQ4Hxi/ypEgcBlmYC1A2LKvizGn4r4+cTIAKm/1wSeOk4u/BAGHV75aY8RrgPl905eeZZ/AT48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc+eDoYeQ474m81Yby7mWgAe+dmtX5Kskp9ae4aRYVs=;
 b=FlVKtTMHQpd3T8OOFXlitT20xz3q04flf2h75FybWQyG6iluy2l811YQ8OUZdBbWB4DkKiy09RxiTIJabFoHgvZKXoTqbMWxMqdiyPkR7JpEM2ETgi1t+ixbl/jNRjInWNt+RJA+vqrXB3VRFpNfouisCW5sO0Yy+HIDf/cqXFjBv3BJ1yqOkDYxAmGYnE7mTLukbYSCMshX2a+3dDilvO1hAEzy8UbIhkKxTkM6gHWaVpGNAR6yNiugjD0253s+sBFwpT+N3Y/fxYjhLCOZjKCXupgEy2bGwRVFiOv9Gn2CJrA+qR93peoL37aa2/QED8h/vmoZI2NgKmI4PP1rdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc+eDoYeQ474m81Yby7mWgAe+dmtX5Kskp9ae4aRYVs=;
 b=dJECNuRFeK9uUnmehGXHDJ4Dl4bDA/vO9zbw6adiyKEpGtzmd/Jo+7cSf4S4b9UEi9ebt1L5YOJ+umunNiThH3OjxEM/Z3x5bIimxkj4B1iQkV2EW7GSPE1rmvt9uCs5r9G5ghefWqfdGK/i24lyk4bkGQB7bIEQSaB22mRao5Y=
Received: from DS1PR02CA0025.namprd02.prod.outlook.com (2603:10b6:8:44a::18)
 by MN7PR10MB430393.namprd10.prod.outlook.com (2603:10b6:208:639::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 01:31:42 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:44a:cafe::89) by DS1PR02CA0025.outlook.office365.com
 (2603:10b6:8:44a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 01:31:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 01:31:41 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 20:31:12 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 20:31:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 20:31:12 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.163])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6811V8VZ1847072;
	Mon, 31 Aug 2026 20:31:09 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Add register decoded info to I/O error logs
Date: Tue, 1 Sep 2026 09:31:05 +0800
Message-ID: <20260901013105.1589-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|MN7PR10MB430393:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3cd117-b724-4d58-1562-08df07c8c679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hitSjvMxubsQzac8jiiOGy6VTLSatoBC+9za/fvf0Xgc1vnb6z2LzrAIhLuNx4USGaZylNmmymMDhpLmzAwPS6Yj1BnjvkCtCcrzTtUz+EHIIDq3gjyo9n5M5dkEZu9nxyDnpncPCSG4Jmtj3+//wf70ZHh1Tu6O2BzBRlkXmZHRN5RWuMdiCV7NU5hhDR4AZGD5jRsJyYuWOZU2fcvfjdst8uGmbixy0OtQYQS6Egbk425ZPtVKJIMjLXO/m0PZAKVmkeZ7u4cts84N2uyb53vnQpIwN2yxM2iDF9CRjCvBIhzoCRcvUlf1QE0ZztoyU1fcj4MFux45MCusN+x6nCv23O00BDNsdCX+v0LnrhM00fPN50WXIbGhBAdoX7hZUngpfloQUsUoOjdt0/h0/3ZPvyTPxSk8O+Y+SWU1bbad1Opn+wkMQUeWqTnIjgzoGC4QF5VDshRu4Z1TiCrYbM5Zo0i2waaDV9w07Ns0+o0d/7JKbdTWzlCSn1mf2q+XlwYAd4gsc3BJRPJs/I9IG1Dzqnhjw56P3gGjSFwczDDuMnXIdyHm8SNgu46kpmA5uqgIKDrHo8udeqSW3lOhOi1V2S8PFATj/3iO8wn1uuXSOhNzWEJz+hG9GTCa/frW9+gLKzbMqSRc1maMynzmHMGglR25M+N3vVWXDZO1wCWCXj/ToXAKhaOzGJ7AeJSKWFQYCEWrbXHo2VUpXO2JWg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C0vsnoT8+gScGmCgItCtqq3LVzOQbEyfLb+9mj8yXYRZoyzyzWbIwotIsgCCdcrH1MDfCnSSLTGTKnB3SOZx9XXYnLmua+ozdDKU0ibDjgEJje9V4k28jvNXhuzDomWlVuA+4FrUbQ/K44SKrJpYfdBpbbQcQQM0Zk6TVyhf2qgXse+/F/VuOFF0Lx+HP6GIqPemhbLLUXallM0YoG/OX40EL6niXXRW6Tu3sePX2A0jlCMp593r9/TQKxjOJyaqKaUM8DgEpe8yozO273GXMdhI9byb+Hol3z+qK76L/xESmi+D3VLeax6hA47DhcC1OxnPwdKyX3l1l5gRR/J+4DCc2xUP3eAQZhsqUn2n498PSDbsS7tBNE9xquLZFT0Odratsn9W681QND+hvs7PatQUXxVLm1ncanK01Kx2kgJiamSIJvVx/WJXX5m95GJs
X-Exchange-RoutingPolicyChecked:
	F2BqkvehsyD8FBIpZf+/UN+8/k3Vgvd0pakcFpopzMlfRKYQEVjppJ6ovWMk0tQEslnTjbvuigakuFb00ObTC0cNu6zeOBnfyCyZkgqHhNu9TKyk2eSSkOL2VRhxOI0MEhrbEK3vvZMEIJlTc8wnocLN6TFYDpOAhASxOW1EsEP6pybgdVVKKD+luaZTpLdUN5gVGv2GQNYQ8HOa66XwDrNvvel5fT53+E2fgSN3Z62o1Yjt6rcebdho0+4znm8HGc0WNFbIZOBQ5nymMl/cOC/kbbRxVbd/rnSmMXKQ6+7esLbU6s5IPRf8cZzrohXthnftJdhr2dIGeKcKE0jd3g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 01:31:41.3612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3cd117-b724-4d58-1562-08df07c8c679
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB430393
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxMSBTYWx0ZWRfX5sfLUfGNjlkD
 KxcklcNcdCFoGRm1q/0QZ5tY8OAQTx8FD18hcVzsedEvrZKisbsV16r6yb1dbQ+FPkQwv3DR4cv
 Z1Ys6Z7z5luwgoXoVbaFYr+8HAv2sLZFwxtyHW9ybvxEoibRCMhEqRFgRsJRGO5NxZgh8WeIkju
 wGyLKPU4DTO8Oz2gJvGVls9ZFiBVDQPFidu+SBJl0mRqQjcCgN+nCPUZK98aFQ1MkxX7mQyDovD
 QC2gfcByjotLgg/vK3pcgvfID/BqMJ+PubD91IefBOA5fvmzDHPyLX3fR1Q2/uijLNhqEupzNQV
 7tHlqSJ+QoRswk0CcDpyoIsMB5XT8yL2hDeo2cFSpjWfa0DrR9LAoMyfCokBi6BTCbF40IPb3yu
 AoHBWcaJnwZU7q6kBHuqcReQRrfIh61bVtvl+bdoWuAy9K1ZjUueMvhhKczdqAiQSGUKtsPiftu
 E+EQV2glanUzxcTb5Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxMSBTYWx0ZWRfX5RrflPhG6LBE
 z9MchC0TzQYqbwNPSNiIeCyw00guT9COr7t66puJCKPQDhJ7rgEUt2vBtaRFaXVRAYtBJ2C5PIW
 2GEbC15+Ncsoi7gGnWXOpE1STHElex0=
X-Proofpoint-ORIG-GUID: CAx0yULNqaahtjGukGwFqSJTtkjFBOn0
X-Proofpoint-GUID: CAx0yULNqaahtjGukGwFqSJTtkjFBOn0
X-Authority-Analysis: v=2.4 cv=T7W8ifKQ c=1 sm=1 tr=0 ts=6a962b00 cx=c_pps
 a=iil3+hz40n0Eqb4YezF7BQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=G9KI1ZM3Fgzx9aniT40A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010011

TAS2563/TAS2781 use a paged register space, but I/O failures only log
the error code. Decode and print book/page/register in error messages
to speed up I2C debugging across all read/write/update paths.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
v1:
 - Add register decoded info to I/O error logs.
 - Update the copyright year range to include 2026 in both files.
---
 sound/soc/codecs/tas2781-comlib-i2c.c |  7 +++++--
 sound/soc/codecs/tas2781-comlib.c     | 22 +++++++++++++++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index 79b5f5b04c74..dd86fc90a7d0 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -2,7 +2,7 @@
 //
 // TAS2563/TAS2781 Common functions for HDA and ASoC Audio drivers based on I2C
 //
-// Copyright 2025 Texas Instruments, Inc.
+// Copyright 2025 - 2026 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
@@ -131,7 +131,10 @@ int tasdevice_dev_update_bits(
 		ret = regmap_update_bits(map, TASDEVICE_PGRG(reg),
 			mask, value);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
+				__func__, TASDEVICE_BOOK_ID(reg),
+				TASDEVICE_PAGE_ID(reg),
+				TASDEVICE_PAGE_REG(reg), ret);
 	} else {
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
 			chn);
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 4cec9f8a00af..e4c8a04a9187 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -2,7 +2,7 @@
 //
 // TAS2563/TAS2781 Common functions for HDA and ASoC Audio drivers
 //
-// Copyright 2023 - 2025 Texas Instruments, Inc.
+// Copyright 2023 - 2026 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
@@ -34,7 +34,10 @@ int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 
 		ret = regmap_read(map, TASDEVICE_PGRG(reg), val);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
+				__func__, TASDEVICE_BOOK_ID(reg),
+				TASDEVICE_PAGE_ID(reg),
+				TASDEVICE_PAGE_REG(reg), ret);
 	} else {
 		ret = -EINVAL;
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
@@ -62,7 +65,10 @@ int tasdevice_dev_bulk_read(struct tasdevice_priv *tas_priv,
 
 		ret = regmap_bulk_read(map, TASDEVICE_PGRG(reg), data, len);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
+				__func__, TASDEVICE_BOOK_ID(reg),
+				TASDEVICE_PAGE_ID(reg),
+				TASDEVICE_PAGE_REG(reg), ret);
 	} else
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
 			chn);
@@ -88,7 +94,10 @@ int tasdevice_dev_write(struct tasdevice_priv *tas_priv,
 		ret = regmap_write(map, TASDEVICE_PGRG(reg),
 			value);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
+				__func__, TASDEVICE_BOOK_ID(reg),
+				TASDEVICE_PAGE_ID(reg),
+				TASDEVICE_PAGE_REG(reg), ret);
 	} else {
 		ret = -EINVAL;
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
@@ -118,7 +127,10 @@ int tasdevice_dev_bulk_write(
 		ret = regmap_bulk_write(map, TASDEVICE_PGRG(reg),
 			data, len);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
+				__func__, TASDEVICE_BOOK_ID(reg),
+				TASDEVICE_PAGE_ID(reg),
+				TASDEVICE_PAGE_REG(reg), ret);
 	} else {
 		ret = -EINVAL;
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
-- 
2.43.0

