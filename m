Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354A837F735;
	Wed,  8 Jul 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519259; cv=fail; b=fOqi8gU59iqCLnEMNGyrEycgdx3tVDa7sZIGqd9Z8Gq09/PxQSKnqX1tYdEa+GEMxnePl+wusE2ScaeW/Cy15rhzRKHX3+KOlBP2rdoMfVeV06Krgn8juSFWA9LS/OA8BLHRqLxx9VwVXCPbGaAQuWEVYvC6vMUfBojJbhQur/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519259; c=relaxed/simple;
	bh=fFPZyS94maOoxizHMu2JvrD5DfqHryWn1ph9gHoLtak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InDbpEFKjIS89NcHwdRNaIm9XMg13nNnQE0KwvgVwJFkRnDFflh2HZGyip2fVYcjDkWdVkax66rG6oASAQyvC7jw2m9TAyl9lTBe7zc/whJzdOrc7sLkWDC04CS8HzERrxNBBA1y522skpicFiwxUEWK8mlRIbRgiPO+LSVv52M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R1amlzqw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Wq460cO9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R1amlzqw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Wq460cO9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668CjD0K2436759;
	Wed, 8 Jul 2026 09:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/ER1myzlSnXvrwQNEqpj0+qluqP9H+ZM7JWad1VfCzU=; b=
	R1amlzqwacxKHgVm0ZibrOrWWd+hMVFsSL8J0CnlZlEJsaUs5J1aRuyLrL3Yg0h1
	aQBmd/WwKxEDA9fK+IgWNFGl7mD3kU7WaZuTxm4IZiNlURHzDkkqReazHUy9o6W9
	XL0Lr2PVKzet2y9EP7VVBCSKA8ntvTU8ohw6OBRNi3FkKYSrkmjUDf3jaBDijDXt
	rVbQJ9trH9Rur+z2yyZMdV0j1wB4rg1VCKgR+6wy2zcV8Rx1maI/WdfEspv8d3F5
	mVwgNG0aLpzrBqm8xm7A54h2ghrDAcHPM+YenHCCTAPubo1Z1zZOtxfksl20scV9
	rjxzbhMBjNeHImhA4vl9/g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021126.outbound.protection.outlook.com [40.107.208.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjpbfe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:00:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBW5Zfri1V9qTpATI/Z6UHNd85EJeVOimSljb7ODD010Vb+bZ6paMhcrsPY8fNq7uJMAiA4qye8U6/RZinC9REgi3DgBcMdrSpMbaeLFhr4vRZQJ8eDWmF1n92iijgHg/vVI4tM89vywdtr+h90zp6R+b1Mgow2DCFsQwy+MA/J0SLatLoddg5kq/LCH7rXSfKTagCW1vOEBYjCXy6iR0jA/GEMubjNpRE41cqNDQ/mfTKIKMHe7Tz4lMWYHsia1nwbfPm6nT0D/Gdj+/kKtlhfxo4R6F1E8VEJ7JH7k3mw/QLTfnmuid9U2+5+DMkxi7nObEx+1TfvcSLKBzmvL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ER1myzlSnXvrwQNEqpj0+qluqP9H+ZM7JWad1VfCzU=;
 b=O/3XZmvPCdFMMOK7ObMgp9yYbYRzmY5qbPTPxiDGC6D/4LGtztkMLbF5mXcrQU2ew9GtkcLS5vmQpD1kYtH/2qPKgdpDS/fMKOEhtxAZIZeorOdIfZRetKZTLaeQHwYabY3a+6B63Yqi8Gc6/TKMzcpxDQYuE9pQcvonymXp3ZzWZGLlijjyB8NgwWMPP2ihvqf2/kyKEVnhjvpy4Vlm60CTgjcdlp5ZO4cWexd85lhGWrvcnRAn9mJZb8VzdlOxekBCI6uP+a9m2HOt3naak/f/spPUwbH3H0O8MsV+H2HnCOCi3Y5kL/LDhSdsv8Cux2m88yjlNlewhxI416KpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ER1myzlSnXvrwQNEqpj0+qluqP9H+ZM7JWad1VfCzU=;
 b=Wq460cO910kWd+nLNND8cd+VVpGiATrmIkZiBvZ3PUx0iNPkMiKCYcKKHVaLTUhUYpRU1f79RUFv+Snu/MmTCz0K8enTIil8iU9dL8yoCd/zzcYP+xf9JJI/MLwe0AhHtoMR3g8//Oim71vRg4WiZL0k0cS8ysZZfc2AwWxZl1Q=
Received: from PH7PR10CA0015.namprd10.prod.outlook.com (2603:10b6:510:23d::17)
 by DS0PR19MB7901.namprd19.prod.outlook.com (2603:10b6:8:157::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 14:00:46 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:23d:cafe::45) by PH7PR10CA0015.outlook.office365.com
 (2603:10b6:510:23d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 14:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 14:00:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6A9C4406543;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5E3D482025A;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/3] mfd: cs42l43: Tidy up formatting on sdw_device_id table
Date: Wed,  8 Jul 2026 15:00:38 +0100
Message-ID: <20260708140039.1993489-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|DS0PR19MB7901:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37253679-ed5f-4666-4f48-08dedcf94e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|61400799027|23010399003|16102099003|18002099003|56012099006|5023799004|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	T+7S2JmzjWJTwUo+sG7RfAYdZE1IA+89XBR7M3X94ewXI6hTByxRh2Nb+MLJqQ51YW3EgILDerTgE6PCp37TKWBLk9oLwIqOXBFj5EzaveDGRmsORUUaEqdeX2FDluQW93lr6v8Y9bukM75v/iWP96JYX2PH+tO7+Yfk9PIN4BXKnfKNRaVvfNNecKcQjnaAMix5c0oK+Gsj0Vq7SJxy3BgcbAbgeKkq5W34ySVXfFu2tZMLEQu8OhbJjBSj1MOwBQRFvHeUOAM1/HIXduMqfhXgle80hRcl/5yeFkbxek4gLCvE++KcSX4GffQFB8wbkBKnecw6gvNNSKbYFYklxFabwZPWrIFijl1cm0PMQzDOkxDS0S8n0bKgpkTx/esOFIgbvhLe0ChYUawvsQ6angTQ2UJMwfD+kHZoaybnWfJgcT6OD2nytYeQ/y3GFEZAyPvMrH0YuwOd0vzXxhpSXwQjshDSWDjjqEncTzCeTui3QA4lmBkvc+syQE3xnHaF2GSXS/r20w6ZJXIm1a07ozINOhERDAnP5pHfN9jOUOWsuRxNkgkTwkFhDA3gjz6RdEH3A4R9L0p0nu2oA9YqTxFXzZLWO+rwgsLF/4UzSFNPfZ5Cc4nJdPcBueBUmGRqDrGMNvzARftJNMU5nXefn11dlKXyy2mgNmLzS6lhS+61/uR5HX1Ol9n21nj7gc1z/qI/dxS2UQEwMcqlO5XZ6w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(61400799027)(23010399003)(16102099003)(18002099003)(56012099006)(5023799004)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HqXmB+3N8QNvjTLFwasstTW97RL8cVEgAyQUQhAJ5Y/gy81a1cOH47kwpVhPp80mUmMrFap8zSiTLUVGZlNmsb+JcEauE+coEWkrAjeFoD4MshpcXmHD783jJM/ewnFCxfY3qOMIeOVzk8g0+XsZ9k2Ii+RoN35FJglZfmHmXKd1DcMnylmX5Wf5pjy6BMKYkCBJ5Jl2COiwLiZiFynn44GEiK/njzSUqL8GJRbL1Er3njFOUa2OMFBRAt2+fgSyBBI6lR+JXKuOWEoCpBWyErhCDDkMKsHLtp9ZNjorOlOBiyUzBb6TbHDyv7vJwmqiVLd1QKcfooeTdK0e9ls/79hUrDZgcbBOJqymLhHIIkf6npAQgE2Bbl6FPBDcZ/Fmx/1Tr3XvqggMAKy4kFdyPY4VX7tFewtbSgfA+VSHM5Ct1DQSTmK3hDbI9ec2m0tF
X-Exchange-RoutingPolicyChecked:
	YoO0zRX/hYNACg7Grp0szOgx3kCWXrL4Q3i9hK6egskEIz8q/NZeN5Kv881DM8LYxBjWRMcWTLXFQhRKeeVoFz7ivDHCGJ3wemrrxi/A/IZmq+PSnhGls4adJIFvNwY+SG7HPQWGonxjl9bzpOG0HZ74b8sPUdfjLaSeUE4p2/6n66791uYk8/kHPDEbU7yQ5FUiXN46rDlHXeM7P9zcvZrEmOHryuE0GrdUghuyG9h9jgXS6KPrA8n7vrXA4VCwzi3LKf1R8OUByldXGikkBDXwW+X79UR2WAlxhWUjgJ+2HjHk7MtXsBzmEzZ9kRVO+T2M3PRydTKiW0mZTpbr6Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:00:44.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37253679-ed5f-4666-4f48-08dedcf94e3f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7901
X-Proofpoint-ORIG-GUID: yuqCykQLVmMYzjFljOiFhqoP8APurkeI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfX8Ai9wAr4O2iI
 olDE+871Oe8TE5aKAiu+sEehXs9vQpLROaoKLvjzIWrosNI615h8C4fVdJoSyNdacYRznd9fX3+
 Dw7AePN0392wLO9S1cHfubsGJWW/iIE=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e5816 cx=c_pps
 a=cnhvvNhNoe9VuZBm3HgdeA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=hcxi784mo_6KST77YscA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfXw3pDuO//ftOY
 vLVIkccLYQ85bUbf2U+J3nR1bogh0abQ53Roc5GPK1zkBTMzl6RROnsDXUanM7KhtbjAd87sz6K
 MV7RzsZvAhm6NuZbg7O4c7EO7AIYuRGNTYY9egE6AQtuErDKc1fYHlOWrITdDird55D11SXwQBs
 FuH3qnNpJCEPPDNqjb3zcocaW4iuy+R/Acvte4gyN8ox89j+oO0OV1i/CvpMkqdrUzaYk/TG9pm
 ebtjILQFYIMgkei5lqHUmTOKb3Bn20qTZEWdSEqSQ5WY76hcLnU6kwLX3hNa/mNj3zsynwgAecQ
 A9aljqVAU+deQK3HpbFTe2bqyYAuzzdvhx48pC2VnvGH5DIQgKLTFmtVfCICdNvzdFuBPJWWGQ1
 48wLQpPyCLQcMM5L0+E6gXbIN3Mb82TgJFSUSPZmNG/pwLZBTBBZnomb84W0pytpzdFnoAdgS5e
 T6aZJ/9n0yS8E42eQMw==
X-Proofpoint-GUID: yuqCykQLVmMYzjFljOiFhqoP8APurkeI
X-Proofpoint-Spam-Reason: safe

Remove spaces after cast as they generate check patch warnings, and
update the terminator to better match kernel coding guidelines.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-sdw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 2b87ae2d79c51..6ccfdcd3f6698 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -182,9 +182,9 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 }
 
 static const struct sdw_device_id cs42l43_sdw_id[] = {
-	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *) CS42L43_DEVID_VAL),
-	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *) CS42L43B_DEVID_VAL),
-	{}
+	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *)CS42L43_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *)CS42L43B_DEVID_VAL),
+	{ }
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
 
-- 
2.47.3

