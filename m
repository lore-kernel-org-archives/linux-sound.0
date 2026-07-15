Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959044CF4F;
	Wed, 15 Jul 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116916; cv=fail; b=rBkMiqwigOF5cKJX6qyT6mul9uKuGFF8Bwi9InLS+l7KgoUmrUNZnjeubv3Ul6oVf6OEdVHHF/Aw4I5JyL7l4Lqwt8DWa+uZ9hb5yeeJMi176YupWQKazmchYNTYpmRxjZex3Bp5Zz/aMfqZf7OnZCjI6NvMJEZvGDZ+7ogQPMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116916; c=relaxed/simple;
	bh=xB8TqoCczZe8orJQpEF54RTKe+2rbBTxcAcL++B3QSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JM9r3AB9/ywUcxI8/VW5uvmxDtfiNN7pVsFUWTOgHtNU1np6qlsf3QHCjWqyYmaLp8X66XhG2HeDpmZX6lYLTTc8Ap5t+CjEcCggxGtHFyKIz/LzvtvOB/6aoU4rt31+Yd2wDctjP/dC6Wrxpf71l72hcJgBaauCpy0LOFvoqoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fJAGFby0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o3c7QOdx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fJAGFby0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o3c7QOdx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F1tMRe031725;
	Wed, 15 Jul 2026 07:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=29T+K97bwTvkSQw5CJzKEvVRIlsIq+xlHCMf7l6Cvkg=; b=
	fJAGFby069MBkdyTMY1QeqDE1GaUgYHVfCHMIpxa2hab5llVkXZtn9WC7tfH28Wc
	kCT7HszBg5UhX9RXa9GCcK+kmZHrgFbOxermR5+2ygGq9vIjsGNA60POGWGlJ3wP
	jOnCWe5CsOf3RsWqB0ahT+dCZvyHm+/+5IGaCrQQWZVVpu6TgTykleW9Qu4dXKcr
	M5OuUblfgiSbFyc+4Ux5ODeufnPZm+QsmZULrlR8RUMentw40TVaMkrbBgHL7DoA
	NwfmBtpTcc5iLQT5CLH0//BbvKnR1yEjkQUZ4awUy98yE6g7bGrKXj7G3gDGcjIz
	MlpYZqW5YJOJvRPX6ZancQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020097.outbound.protection.outlook.com [52.101.201.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vw9sp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 07:01:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8n8GqZEZsUv4wvI7ihNbKtYjOyhZ+uR8N/auahDvA5nqumyTV2HL3qYMJOu1K2GC7uKfsapRNC0fBFh9qhu8GxXiatoUv3dcjVnG1fcimNMjVXuMoE2NPVw71CuE66z1Ujj8/ciHZyUe5NNNAJfpUTWRGJURSbKRnUFcXEbCbRdXkdx/kFj/gtV98dAqBKW0Vvi2ErxUmtGFVKv2GXytIJgwZXa95M6qRRzr3XbitdT1qxrXViDXnNlgnFSkEAF2IzI9tzYJ7bW1AWrJia/c9FHsrTCa4Mfg+OypCZHDcU2wa2o92K+h016B4wEUnHql249ZojoHbBDABLJLaLIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29T+K97bwTvkSQw5CJzKEvVRIlsIq+xlHCMf7l6Cvkg=;
 b=tL3/2V2u7LK3QfixDCcFP0oY77glqVN3A/lWsr1A1nVaWvi/DUDyj9lUWN/arVxiY9ure+DQYp0BJivB0PenMpWl5vW/21gycf7SGdob+0qd+ryBLWj3dg+4PAtGJN6eI45t1b/NJECjCpwB2y8hp6W7JkX/YNsRZDKZf5Ufrk9aBNTG/5CWrrV27wWsJcMxE+eEEvYU1ljMJlvDESx5YpCMuf1t8XRVXGZlMHrt6P0163ZvDBCZVaFF67Do0QWmeMNnRKl5YTv94rulE+6Efhks7MWwdUpwMpcLs2EYHQLfw7U/v3dQ1ZEocC2JSZo0GooNHXgD0vCdkxzm4KhREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29T+K97bwTvkSQw5CJzKEvVRIlsIq+xlHCMf7l6Cvkg=;
 b=o3c7QOdxjCiEBqlVDmptOQM60BFpmdIZZ9zsthxW0LaPboPl1HokhDOMBR98v/cEPhLkrmt/0WiCDDf5aeG85+BgXy2O3GYdxNjWHjrL0yyhAUmUykteepPsUt2v1qNmgw/puATODg4Z6Z7q5utGaP+c2E4Z9jNmSJ6kdfkYl68=
Received: from BLAP220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::18)
 by MN7PR19MB076263.namprd19.prod.outlook.com (2603:10b6:208:5f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:01:38 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:32c:cafe::36) by BLAP220CA0013.outlook.office365.com
 (2603:10b6:208:32c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Wed, 15
 Jul 2026 12:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.3
 via Frontend Transport; Wed, 15 Jul 2026 12:01:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 590BF406542;
	Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4311382025A;
	Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Add support for CS35L62 for SoundWire
Date: Wed, 15 Jul 2026 13:01:33 +0100
Message-ID: <20260715120135.939280-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715120135.939280-1-rf@opensource.cirrus.com>
References: <20260715120135.939280-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MN7PR19MB076263:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 179389dd-7365-4f2c-0728-08dee268d22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|23010399003|10067099003|16102099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l7QiAunPAjyLwCWejJQiDddgUVPgtfdkUvqBe39Ir9jobOLs2CUy/+X8hIVnwgrzxvvRheIxGtztHG+IfHmgD9wBCCQnLjTm8jRDisGE7P9yy2Onwoimx0TDfFvT/IvuyTpLVaZ8d+F7IpA3fuI/4OugVDxpi5mpwLPd3vmT/5RABwqR0oCJ0RgDmLgzwupf5R4FHgOJ3EpcZ12oLZvNENf8uTwryWjgpWsqLEhE11t11S2FEqtkmNg1UNBN2a5ZW00OZvnquF0M3BgFZPWKXlq3VLCMgPrUDAudvAntaBntdnwUO7YIT1QmzbiDjJoawJaLAWOGGU+EWgzv4BKjv89UxNtnFrIXVe9xKzi4KxNSd1a+gcwlOHdvE5ccwmEAZBTi1tY5X1XaXA8bQR9UTVwB55hGyiaIo4Ohz7a50EYnokFER9l11Rcv76IGRQnNdNmUKROz8VlZLFIz53esoaO8KznnLCtsLKu9eHzYnhmBqNRwIhKbnaHkEhCrl/iQEKE/WxS4YiEDmBlEPG7k2kpMjFk18c4hwuoxzZel/h71RqM+kv2m9wOFpxIdluXoElqCqFAjoN7sR0AoEJi2ONFWLYBVBAjj90rjiX7znscNpjPJSHGTGiOpUXZZko46eOdhL/zLO0WAlR/a/wf39D9ADPid/cXh8stkFV3CCBvY/+G/QkQg1jm7kotXgL/1zh8XFY+NrJaUjYWB+NPaZA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(23010399003)(10067099003)(16102099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6l11vwPJoi5L7UYhs7PhTMu0WXtolj77l4z1I774ko5ANBfVja4bIaCOHc96r+rLcxGD4kkABTfzu1GHoxhCpQm15RRaVuV75qOa0hjksBcMPlRaoUeocKZ7WlGnIFETXGNZuJWKaZs3qX0QKpN/VsJ+VH+Feowxw6vwbYyg9kFGIUAremkwt2nKNsiQyB1Akminx8X+XAl5/2bQH5gPp3eJDe0kxnmfcUHYYZVmF+S53yQcyUj1nIcBteUyu9UZy0hCe24SsvEESUh71j1CsVIu1OJQ9CG/OhTAyLcAxk5S57rLXElG189i1JY9DGS0k84hFCdBkDNnyaq0C2s7tYv77fHzehFtX0zISH3cShijXFULDKVa9aVqevbEPBSQcjwlnorgoRFpTpyyR9NIoV0+Idw8tMyj99IPX+Oe5jH/MeVm6SfPmFjssJoHK6ZS
X-Exchange-RoutingPolicyChecked:
	ktKXFA1/ER/qvl1sKQXI2mO0lhj+RxGIIaQXsKNmLs921uu+Xoo3lPUQ2xBwK2NGqEPL2VAW9oF8rTEgRkCIhctRaEdbUY018SKZCXN0hnFqjAcrsP4JTHb/Fy4srFWP+Pp1TQquICkR3+o2718n0GVavsrwNSCpwhMeQkVdA6dd5n+sfHlWaUMmNsFI1qiKv226LJeKWVX37c4oklDovR8tkTUI+l7MO/MHuKtkba4HPIiFw6Txlt7jiAkI3ygJhWUQujbVW2R4Idir9BrBQAV/RNcLLoyX2jMPmzx2dJdy/nY49VLfuNOmL2j3PxqMvVhS/jIZJRsMxKuIFctuKA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:01:36.1777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179389dd-7365-4f2c-0728-08dee268d22e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR19MB076263
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a5776a4 cx=c_pps
 a=dY44fPPHiqsl/jBMM45sDQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=WLGXV6hUJ3wRsAzhE10A:9
X-Proofpoint-ORIG-GUID: ShEKJGZHBcYJxQSuWy3UgWuGzUrjV24n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX+3ENEuluXtQW
 DCHAvCn1T4VjYMdlSdb0j0E34tnFCNrWv0Ju0SCbOO0nKUcwNaoMS3MVQ0m8fidlxkAqVxSNTzB
 yC9oGD4ArBanLiasNv29Rk7taP8j8Rs=
X-Proofpoint-GUID: ShEKJGZHBcYJxQSuWy3UgWuGzUrjV24n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX26HrTvdGsOsW
 99r3etGJIkjtbbJEFe2WR5DrSEAB8Mh0LGikDTI5ifYXPWWNjGw2CNZJeOOeNXr8e3x43sKuYT2
 Y4kYeWyXH8RCi+nBgcQluZyUBxiMhTnUJERmeXW//HB4BNdC9SRSoztN5VGqbahnqFxuNmaJrYR
 boKP2EQmvzU2wkVpkw7pIhrL0U4ezKLeZvOGgL/hS9XqCW+VzJ9tcJR402tDvcIywh6TFtFDMXr
 JiGadChKeqHrMgJsLIyxrMLHdq5T3RBCHQA5Ldzp6zGPe3fFqPLrDYvTaC0g2N3zo5tyOq+HaOG
 7Dkp6jgrpmNq49PSGXO1o1LHM011SSRP2vLE3YzV3Kag3ccem1gmMTJl4j4PtnBCxwby3eE8+MP
 /nYuYTn9RjWwRcFJpQLvh0Flfc7RpA7O3EyN/d15iXm9IP6bvVFfJOwIlCS/g7Vp7q5j5zpTWbn
 66qae/DtKc3Gd+galwQ==
X-Proofpoint-Spam-Reason: safe

From: Stefan Binding <sbinding@opensource.cirrus.com>

CS35L62 uses the same control and regmap interface as CS35L63 so
support for it can be added into the CS35L56 driver.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c    | 2 ++
 sound/soc/codecs/cs35l56-shared.c | 4 ++++
 sound/soc/codecs/cs35l56.c        | 1 +
 3 files changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 0a55b93b96f96..1e442f43b306b 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -457,6 +457,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 		regmap_config = &cs35l56_regmap_sdw;
 		break;
 	case 0x3563:
+	case 0x3562:
 		regmap_config = &cs35l63_regmap_sdw;
 		break;
 	default:
@@ -510,6 +511,7 @@ static const struct sdw_device_id cs35l56_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
 	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
 	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3562, 0x3562),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index d5817e4208479..f20bcdfd35af0 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -96,6 +96,7 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 					    ARRAY_SIZE(cs35l56_patch_fw));
 		break;
 	case 0x63:
+	case 0x62:
 		ret = regmap_register_patch(cs35l56_base->regmap, cs35l63_patch_fw,
 					    ARRAY_SIZE(cs35l63_patch_fw));
 		break;
@@ -389,6 +390,7 @@ static void cs35l56_set_fw_reg_table(struct cs35l56_base *cs35l56_base)
 		}
 		break;
 	case 0x63:
+	case 0x62:
 		cs35l56_base->fw_reg = &cs35l63_fw_reg;
 		break;
 	}
@@ -595,6 +597,7 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 		}
 		break;
 	case 0x63:
+	case 0x62:
 		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
 						cs35l63_system_reset_seq,
 						ARRAY_SIZE(cs35l63_system_reset_seq));
@@ -1462,6 +1465,7 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 		cs35l56_base->calibration_controls = &cs35l56_calibration_controls;
 		break;
 	case 0x35A630:
+	case 0x35A620:
 		cs35l56_base->calibration_controls = &cs35l63_calibration_controls;
 		devid = devid >> 4;
 		break;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 570a68829ccd0..f365f76ce56c1 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1402,6 +1402,7 @@ static int _cs35l56_component_probe(struct snd_soc_component *component)
 						     ARRAY_SIZE(cs35l56_controls));
 		break;
 	case 0x63:
+	case 0x62:
 		ret = snd_soc_add_component_controls(component, cs35l63_controls,
 						     ARRAY_SIZE(cs35l63_controls));
 		break;
-- 
2.47.3

