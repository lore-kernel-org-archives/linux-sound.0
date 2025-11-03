Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB8D3164A9
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182548; cv=fail; b=gnl8CuicfYLeBlusr97T8WdHNa/j0+7PUIBseobT0x6PyMHPPeikFogHs8DNF/kfnx3Rr/pw9ujyK1vdIAQOOVeJtjFmsysviakr/F7uBHvmmGkZ9QT5nmt23AZKjeckTMVVQ9BooSVyEChHoC6eyZzSrjYgrWdHTv7quFdlcnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182548; c=relaxed/simple;
	bh=UMB+/csbdbF0HHwpUcGSrF2PHBIZ8NNSmLHCoSSSb0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3BLBA36WAiPPfjBXePKL10b164Nbz09CVXHdFnwTjq5RR5E6OVpDalDCeZKVm/gdknH7fTLXKdaG9HIRaGENIyiKTfEmULDZTHXj8WBeDng0P2fbximfODROrFycHBOMgJ47lvqcH5DEKtN0/N1HHfwCPrlEcE4YXbSFKYQurY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Cspm/d1w; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UIlFGFvB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Cspm/d1w";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UIlFGFvB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36KO7I974068;
	Mon, 3 Nov 2025 09:08:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lwFUXycJushx7PLLgFJJVfvGvotRjwvHDFqdLsFbS5k=; b=
	Cspm/d1wIuv0KZjdcdE4AxvqQpoL5Th2e5rYdO1T5yfKpcTQtMDe4DzAFnGYxdNq
	MkNd5FwW61kpxGUfn7WPmU9bvFJVmtxTeU0wue5pvb2XMhp4pn6aN0L9CrnQ/4gI
	dtIkSZNRvCTWrUsAtxaf17K1jUlE2JMFMxfhybFD28kPJ2uWENwTdKf4K7xR1xY4
	ZgS5Jen1/hBp58SkukaGA2Cl5w6o9ypqvtItKMIMcKFl7a6YAfaEKnrv7jzeT1Le
	jo+XU5041TDdckshNsJ5YScoQYqkrN8APRxYgdiQMIK1udF3Exbjaekl3TW/nePo
	3epDCtrPAwUH9puH3MbahQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020087.outbound.protection.outlook.com [52.101.61.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a5emg26qm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk1sm5x1KU8I8i0YHa8nENcAgUL3ZIKAMDJ4tKF2ioz6yCV2UzmmbWb3VJVoqpzuvgXnVwim/Yyu/g69S9P3MDviB4M0Ts31Ve0nLi6ILF0TSbOAKwqugAmADLyGIdmT0/z9xDj6Lw6O7AhCOIWru0jyFBfGy5XdGuEENkQyepG56PD8sfnNEXzmyeR/upkREMVIacDLx3aBYwdosEqPDE3Wr1XMzQPxU0mPPHPetr17gDuP+SjvpQvtJtKCNVehbYnrGIZT6IMUYWaTolYfFNqVP3mi95eLtEhr4F5P8x9YEcd9hdxLIyt4HVbmREgIRPMU7HXMzZTFtsMad/ouoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwFUXycJushx7PLLgFJJVfvGvotRjwvHDFqdLsFbS5k=;
 b=KBDAQv9AEUBhCQYN/d2RUl2YDuiTGBfJO059SoarKyzma2Lz285DC3NXrJIS8arImU7dMDYCJlme3R+BPzUdfUNIw+DjuZXTJc062YVVYGSFwwxrUh/emOoze+0FIR6q+htgBRfvI77g5W1Geou3agha1sydsvB6152isrR1GuGpq3Fs/rYh5THst1WnhghPEFrpmbvP9kjba360osnzPg3vZUXso6oBRMfGB3NjDCYXiBCPLPNjT/DQ/2oh4GHH4XEmnRJjLhCvD0QOCkvWGInux8phWdzxA3kdFErjRlpWgVpjhG0HBQdB/kwlxjoYcGgn7vDmL5XjCpY1PChB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwFUXycJushx7PLLgFJJVfvGvotRjwvHDFqdLsFbS5k=;
 b=UIlFGFvBFlj5zfe+EblimrTD9X7enuOXhyZVYYHEFL64+sWEK/zTY52ppas7Ox7zqQFalVx8HfTqY2zeIVkxIsZw+WfVLlX9wmjZL6/YMfk0Yc1wq57L3zS8nUE39X5vFpDTHU3GSIrm/lfU7lWWpWHcfup1McVAdPKdCRF5BBY=
Received: from BY3PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:39a::24)
 by PH0PR19MB5052.namprd19.prod.outlook.com (2603:10b6:510:90::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:20 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:39a:cafe::27) by BY3PR03CA0019.outlook.office365.com
 (2603:10b6:a03:39a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Mon, 3 Nov 2025 15:08:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3006E406561;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 94700820259;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 05/13] ASoC: SDCA: Add comment for function reset polling
Date: Mon,  3 Nov 2025 15:08:00 +0000
Message-ID: <20251103150808.4015208-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|PH0PR19MB5052:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fe77ddc7-43a0-4bc0-f7e9-08de1aead358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ysS4v4pXlxtq2f47YKGEFmMGBnoz0wG91hZ+tLwRGQCZxtYva4E5DyDOkdo?=
 =?us-ascii?Q?37YrO/1goBmn8vPtfaoGIGtmBO5CCSWxTyJTaJtma8mXn1xftiCYwzlhH8nj?=
 =?us-ascii?Q?WDJng/cmTlXBsyAwk7LVRendjwWNc2D/0F2LdqCou3E/oLYdLYCsRdRqvrT3?=
 =?us-ascii?Q?mtAVSHByepzAWnKbatCJLDiMOAE1fmMLrq3NuFbd4bwRIVu58RFvR74Ql48Q?=
 =?us-ascii?Q?CciQsFD4xesa3WxBBnglGXRwmAowdmOc+jEIAhnaM9PspXzmotECfeAh3dkh?=
 =?us-ascii?Q?UX8/9bq8g5Za8F7BvM3ckYP7JTQaUMrRnl34JnVfoo+BS4o5LwENXDjOs3Yl?=
 =?us-ascii?Q?TXVMpIhsv+VDeUALXJnXW0xcqWiVO5wNNq/BGGHkcrnXkjpbG/iGq8TWo+sX?=
 =?us-ascii?Q?hA8ItHBu+cpOKaR6DBfc6VOV/H6niifBwlyfHRaM/wCeMt5LlKzmoZpb8aCw?=
 =?us-ascii?Q?O7bxNPveuHbmlULdIlkBfV9YjGJY9iz6HQfAxN2hUpWg4QM5Omu+4zz9qKzx?=
 =?us-ascii?Q?xTKotK+S8iXUFlGKZaqNnUcABPsDWa8SQlCHZIKC993SX0Rd9k36gH5fW58J?=
 =?us-ascii?Q?+Fc3T3WVCAheh3H4WVwmW0DOVrPl4eJJzB99YFbokzlm7w2LQgYAB66GdsT8?=
 =?us-ascii?Q?mHen7dTO4rlzO9zP/zk6i9dzazTnVm3r/isX1NvJ6/b9PFy5fUTFzHMGiOZJ?=
 =?us-ascii?Q?YoinUVH78Hb1UxsaHMSR9JonWyezM96+qjsXVZPeRXY1PaMG6R1uA2pb2hrI?=
 =?us-ascii?Q?JQdZ76UKX6DhOEMXO9B7pr5ig71sL/hDufwNyUj4z0GMo6hP+gBWE/c+UxCc?=
 =?us-ascii?Q?sftLzoF7KDKLMu7H0JIg6vw5L5BHI5q93HfoQnMGFhmSgomsb7RxxSZUnGt0?=
 =?us-ascii?Q?qATeOn8BROETUEX6X9ChWIXjk5+2h94Qc9EF1r/FWeGT9Rl0Xh4zpmsjgjKm?=
 =?us-ascii?Q?3phm7qDUX5JPYHo5oCVuIxTgjmA9vGhv2h6yNH3BXnyif3aqO98QotBzW/qA?=
 =?us-ascii?Q?loNX8MgthSARnG25MN2fl/OFJ9GWdWYvB5SAVRCDTu2/Qoq+Ld+MKwstSeMr?=
 =?us-ascii?Q?OUnXszvD3mq02/lx8UZIk2dD/+CgBOvQ+ee9jcukQUN//zqyjrd5IbjZReN0?=
 =?us-ascii?Q?kzCHU7gg4WGJojg1h1MEYcHgYtKAppOSjwnoYPyx2YKiTnOWGOH247aPsPO+?=
 =?us-ascii?Q?6nlM+TS8GAzVVrA69AgsYxXBELP+HX6i4zGEhsTUbQcexJCe7aObXm4mSBHX?=
 =?us-ascii?Q?07cC8WA9c/zv+zED8v634c/ZeKqrAtoLcSKE3hYUNaqbOGvlj1aXQwl2Bm0R?=
 =?us-ascii?Q?tT0mlP255UsMDOcW6Atka9EEg4oqJGos4fZAjwP6IJkzxoUE5OQL7l5Jb1wq?=
 =?us-ascii?Q?QUFHhkYFMIPIcSEHIqxND/Cnmqwi7SkEv/sDdrUGwKx7wrqkFQ6cIUdAU7GH?=
 =?us-ascii?Q?p3rM8RUYvxLiufSebeR0zB3Bk4SRUfHeNOCIyUMLQa72isR90+QX2vgqwodB?=
 =?us-ascii?Q?r1lNNtpUwfWp16MJ2NKI7fbky8A6RAb7vDJz9m0YGt5gpq5OHYV1rfz54WXH?=
 =?us-ascii?Q?kWjPeRiOfvQKKxH2TlM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:20.0341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe77ddc7-43a0-4bc0-f7e9-08de1aead358
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5052
X-Proofpoint-GUID: grYxsiviiVC8dMrUFwf8WYCuSIVuvpYD
X-Authority-Analysis: v=2.4 cv=Mu5fKmae c=1 sm=1 tr=0 ts=6908c567 cx=c_pps
 a=uUOONCeAppmmVOxUvBiRog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=9ykYWD9xt5iL9E_1vaMA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: grYxsiviiVC8dMrUFwf8WYCuSIVuvpYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX/S3SCtQeZ7Te
 goTWmZMrnNA/5lY0k4g9PE6vk/6oCHRXQZTWPELeWRUKeDwJnMbH4YIkAticegN7fxF5kpWmn6x
 95GkLfh6OaWeRFFdqaaWMwbaKdF07VxMWE+Fh391QBnRMrv4pY/2ApInaTvL0u+luEc2FumZEQH
 cgl493b1Uhm2gDTeOniPy19AghexSrH4+1dok+DyqHaPUNK9R7vnhdPqq1hfTnlpkPIreq+kri8
 dRzewUJKId0VyuWx3K+UXhyMldVK7+ftGqU3rIR/HNETeP+fW3lZb/3Zu0TEAqh12VTxgDqOlf+
 msFIZLzC3KRNUGJCNG/G1DVmKJRcMutahtO+HMS53eOF8G8mLwofTm+xs+o4Hy6HEi02qXw+Wq7
 7U6cuhaUVotgEzl+JErmBM+kawKo1A==
X-Proofpoint-Spam-Reason: safe

Add a comment to better explain the function reset polling rate.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_fdl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index fe0ef2df4d9eb..83386b7b9b429 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -51,6 +51,10 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 		return -EINVAL;
 	}
 
+	/*
+	 * Poll up to 16 times but no more than once per mS, these are just
+	 * arbitrarily selected values, so maybe fine tuned in future.
+	 */
 	poll_us = umin(function->reset_max_delay >> 4, 1000);
 
 	ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
-- 
2.47.3

