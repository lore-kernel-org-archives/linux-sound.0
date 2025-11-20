Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637743563D6
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652725; cv=fail; b=dP1lPh/T6lA9NMDlPoyneo/1fJAjyBAmy7jrJwcTnvLRWByPHmNKRZ3FfRUwxmji5VZmrbVv6206pMEpZbW2X5YnA9oDaTAaKXYdmkNy96/QYmfYo7+bIynMSl4qpRD8CpDG4bFsDAGCNubjNgNmE5SnYvIbfSftK+OAT94ih3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652725; c=relaxed/simple;
	bh=0sJgx5P0Nr9RZhIhSOgkasNoWehwXZjr27zQiARwidM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZbXHPSGRjjj8hsz/SlrqL7ppHtrCz5NSYBTAzDRY6HC81dAyK4aRQnYHMybMsNowGSuqwMB/w/tcm4UTxKpZ6McZ9Wx20sV0bCms/KizUSZUa78JdhLwNz3f+FD66nH5sKrVYmd3sNez5u0EdsUvnksKlw3ToHomcJ5j1x221Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oZKWCPRN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FRVbRsxi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oZKWCPRN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FRVbRsxi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4kG0U255784;
	Thu, 20 Nov 2025 09:30:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hi+7LxBe/Nl69zcbxdssYr/xf3YJ4GhhAEtIoVLakhQ=; b=
	oZKWCPRNJfUN9pKhHveWxE+wJUlrlQ5DWtr1G1XO5/kS+1RhNhiPfGSaRPIsVXiS
	oTz2huvIX5Aj660VH0+yX5YRUteff1mQGRH9M9tnjdi92S4YWJtmYmcaKHhMrOuU
	qf+mLtLoZxLdtN5Qm98FcUfBjbfD8vMvv4qX+4vgB5rgmouW3hyo4mngL9UROTE6
	aHSDv086ZG6VpYFW+/m5llRA+7AWZA3RfyjDoB5NxT2NIpMf9LRiPn0EEQzCkQoe
	Hz3zQBu/0Mga512dP6g82ESdvqbUkQlTVmg2UrECtndN6evME77ous9zzXc0EBJ0
	UbvnxBjrxdZuJ23FAYKYPg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020082.outbound.protection.outlook.com [52.101.85.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamgf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAIZBn1yR8QmbtBid0fPgkEwRL13j+DuFe6WX2sewH5nGrkqtbaMRWcNgef27l964+ikNPEGTrgoU1m0hJMniOaJZ+WilFdjFJu3Kh7FTz3K0aD91/ec21sgiJH/hlUEIH35RkBVZalJ4H/h19VQoKs4acQBcrAYs1pV1ooc1Nd30B3bbYtBqMjXNnEgkuFdS89AunkNYvFnQkIgIZY57imyjs7Ub7mZwvFCGwGkAdkhBdgmYa1CdA9JveyROkTXQ+3xHWc4VRI4p/W5u31TE04ahMQJoNbtFNUJTQa2d9Qr8H9uI/MrPW4A9mDVpyDI6HeBuYt0ELTdVQWmxxOvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi+7LxBe/Nl69zcbxdssYr/xf3YJ4GhhAEtIoVLakhQ=;
 b=CFNlABu54qRjC0LilnDlRGxkipe2NppQ6X9BhBiWMp+b3fCoO/s2iG2UMDwzZD963fV3CJBjZTGzCmkU5G3Wb50nuSxkZXtnQZrKO8cmPOOTSuwDm5XuPI4JCyRkcyrqzbx897Oca1j6U7NZQKEek8toBa0sX8nzYwYFPSBKooEKg5chyAUbC64awExcNSSjlF8uUEgpqZAtAdr372r9vJsK2Z/ZThXk/MxrmIqg8ighE1yiv0mmKJYsmlOL9a8T1V6Bwteg+H+pdzFnrN/62GLG3nBNBfUKs150GWFQUoLBmidkcMd5X/daIO8IvmniUSQBQGsMOlhj7hNjzEQxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi+7LxBe/Nl69zcbxdssYr/xf3YJ4GhhAEtIoVLakhQ=;
 b=FRVbRsxiImx0s5NRRUP50vvJjyJNBX1VOSIeK/Xr7tkTATMR5Mt6UCtu3DhJOmzoUa5YKYh37o3sAOQee/q+jDfVFCKr4z38lOv8w3Xw7BOk5SEUzZBfNmMuTDiYrER3svR2JqtJAgI6tSg/nmRn3lyebzR3mq10dSFVq8Gd4Vg=
Received: from DS7PR03CA0164.namprd03.prod.outlook.com (2603:10b6:5:3b2::19)
 by PH7PR19MB6013.namprd19.prod.outlook.com (2603:10b6:510:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:32 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::d) by DS7PR03CA0164.outlook.office365.com
 (2603:10b6:5:3b2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 15:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DDFA140655C;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C1E89820247;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 10/13] ASoC: SDCA: Add helper to write initialization writes
Date: Thu, 20 Nov 2025 15:30:19 +0000
Message-ID: <20251120153023.2105663-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH7PR19MB6013:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 53a95b4d-a0ae-403f-39e5-08de2849be35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HWrzoztcWdg7B1lWyAJOYbhQeUomXOZRTXbQ9Tj3UvWMHwAYZ6d+9xQtq3an?=
 =?us-ascii?Q?u4U+dADyXQgAI3E7iL5sgxd4LuZSy3ecQDuetu7zgFEvzh6uYmm6AIt5R3vK?=
 =?us-ascii?Q?tMWmc9nJPx6GsVX4sC7+QU5yaCjq6kJ9SQj/WE5N/UhaYz6irfW+ZCgNFcuf?=
 =?us-ascii?Q?a4jnc+78iefOSdv0H/009ei1upgF6w4KbiAyL6jBNlZbdpWcMldq6exPnt7s?=
 =?us-ascii?Q?jyw8r5RvKrnnqEafbOGtSISD3hy+VRJDWf/Uhei6EnCXiesxCNWCyuAKc/Jd?=
 =?us-ascii?Q?J1Rs4auNYXTyXUVvdJ/Xs4N7tHmSUvrII4fw0gNLzc3nLNS2ktghvhFha6Zy?=
 =?us-ascii?Q?Sd5uB0BOzbtodBTny8pd2EMoO/GtRb2bO8IXoySFrDHSoP40f0NMV7EbRIJf?=
 =?us-ascii?Q?VpV8yS503v12kT/9ma7NmSrFq13SuXDE9aqNz0wWClWVFKyQT3xRCuCciM3r?=
 =?us-ascii?Q?v18ouzULx86C1tGj76k9W9iVpQjXlYT1X4DxexwPrIbSDusZJrLu2wi6HTLV?=
 =?us-ascii?Q?oCM3P3iD/n99Nnr+TzCgIzgVG780fbiA90sExMugHhL7IEWtt2sbGDaEJtbi?=
 =?us-ascii?Q?Q5rWqvCaDa2XLYFGDKurbnaK3nbyYnI0mJXMT9vURFygBr7Jp1dZP83+K7JN?=
 =?us-ascii?Q?FWQXLKKLvkednlgeSrwxtfM6EoHSRdtB+V20U5QLm2uz2JwMhH/Lc2pDTRSc?=
 =?us-ascii?Q?k7YDAA3BbcQoW7AyUH5KJ+5c9aAcxiys5d+LgkmQPqXqjACnCRwwhNlz/kNI?=
 =?us-ascii?Q?h6MqyMLCL+dXQmfujTTNAtax6yQlqzrgruLaiwk4BMB4JPC0YyJDEcWL/LmG?=
 =?us-ascii?Q?Hg/XanSADa08HsupCqtjavogksm9pzJa4wYAieXHI/jRUD/MveyBSzWTQZn0?=
 =?us-ascii?Q?quV9R790puDtA3TdCXuAFqo/MFNf6zYqvtcjWPrdS1U3BsWJWv7BVlYYxpLc?=
 =?us-ascii?Q?I1mWTy4+pWMsUNdJZzbqXQBUmc4v+RWeL6dQhH3wgAqQSXjDPjHgzbxMtQti?=
 =?us-ascii?Q?uAKCLLHH7Pohc5kBLtNXKUUL5pPCpWL8PKKuNB+RQ/5xismBNyiz1x6b53Ou?=
 =?us-ascii?Q?LVd9qKYo1dxJfF5VspODsR1Po5KkYIjHu+8HfHQl316HzqOPlNYxLZvfZrj5?=
 =?us-ascii?Q?qmqrA67ugpKORzdw5S+QrGwU68yZ9J/x50BFrhR4fHuW0g8F9lyjPP7X+E2X?=
 =?us-ascii?Q?0rCjFuVRR4tqAodBjMIEUtrEJWV2ha7L7frJ1h8g45d1I86ab6HES28j6NR8?=
 =?us-ascii?Q?DwwiRE9zRCcU+2ZV3KjU/FJrGvX75VLqj9Ryt4LpkOpBwTfhhzWa1pcexcWo?=
 =?us-ascii?Q?djhaCq3bQ7QDLTiQ1O9qF6t/ONfG1CsqkF8VnonzuRUGUkMiToa6RYQLKCoL?=
 =?us-ascii?Q?P0LTMB9oDDLFzGmE2m2frgpiFfBou6i0qM8E4on1gAUqsK17l6T5czTNhDua?=
 =?us-ascii?Q?tijClYuxrjLkEMYHA6DxGu8sKsyg3d5vdfsROY9VfPuhc8B7C3ZJnajvAL7r?=
 =?us-ascii?Q?R+7k3Fs1I4yyuDeTzWKZLa+9WAJq+wEeOWXx0UuUGu3zHFnmtmj9nofCxtx/?=
 =?us-ascii?Q?lUcqMKSJjRHo6PR7634=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:31.9169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a95b4d-a0ae-403f-39e5-08de2849be35
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX+8dS7KWcPf4d
 zAHZ9u/PWLCG8ag4S/+CrdClzoSonmi5flxnMBM0KpsTlUyy1ZQM34owyg41Trt+JW6pfkBI0uA
 nHy4h0cW68C6X60XLhbIUSbJd57E1F/QuaVRZMah9J2cNQ0MLHk6kgTtRSJzmirJlT6be2LoubQ
 cBYHsbTmieunJ2VEHNWPsPiFo0Tkv5KiJKp85SYe9dv9IcUiwPi5fCWwwU64uPkZzLjzkX8kmsc
 pF6hr97ruya5xrMIJHDs7vqe6BFMw/TS6FqiZS+koLUKyyIchvL434aJSJbbr3uJaMvX6klKzEA
 KBoUdICg58ZZIa29ihtffvmAJA9sb22qLpTkesqk8KcxJp6qKIh1SithbT8emFOHQi5KK/Yz4W3
 7vhpGKLYoI+0mC8xBT1yNuurdTnsCA==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f341d cx=c_pps
 a=NnP4WoPY/9ItU/dr56klNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=yy6CnFMKdNl6TNg_LJgA:9
X-Proofpoint-GUID: 7erbBPjrL_hMezTu7k4GLcvmtLfchnFJ
X-Proofpoint-ORIG-GUID: 7erbBPjrL_hMezTu7k4GLcvmtLfchnFJ
X-Proofpoint-Spam-Reason: safe

Add a helper function to write out the SDCA blind initialization writes.

Acked-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 include/sound/sdca_regmap.h  |  2 ++
 sound/soc/sdca/sdca_regmap.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/sdca_regmap.h b/include/sound/sdca_regmap.h
index b2e3c2ad2bb88..792540a530fc4 100644
--- a/include/sound/sdca_regmap.h
+++ b/include/sound/sdca_regmap.h
@@ -27,5 +27,7 @@ int sdca_regmap_populate_constants(struct device *dev, struct sdca_function_data
 
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function);
+int sdca_regmap_write_init(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function);
 
 #endif // __SDCA_REGMAP_H__
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 6fbb241d9d357..2cca9a9c71ea9 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -355,3 +355,19 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_write_defaults, "SND_SOC_SDCA");
+
+int sdca_regmap_write_init(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function)
+{
+	struct sdca_init_write *init = function->init_table;
+	int ret, i;
+
+	for (i = 0; i < function->num_init_table; i++) {
+		ret = regmap_write(regmap, init[i].addr, init[i].val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_regmap_write_init, "SND_SOC_SDCA");
-- 
2.47.3

