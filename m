Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2070242D6A
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401039; cv=fail; b=BtjYgIzkmlNlTfivdf90gQ96OCpbZuMGK7+hVRFR6SivKmCNtp+7ZfX7JUJPH1Udi4HNNUNJYHUGnmTBvPVEd/aIVge1sLDSWkT5LD7WKmJKZReEmw1pYUQUaa6DxMg3ucZbyKlwx00yqTZF4pChJ22eMwOZ1I43ziV0mclZlkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401039; c=relaxed/simple;
	bh=j/oz5mQ6KuH+if/eOouM4XNxJm5HR6c4VoLsSgIn11M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZPd7L/SbEcGisoDXb1MoZ9D5UaTUXcD1oNO6wetLCN5pF5FlXcBB+iA4GK08MP/jjAX0tj+9m3L9cFAeScO2+Ebv/WcTLad68It1ZWBgq6oLhi2YkMi0IxPQOFiQL8v3kL3kC7mY6LVaL70yFKni8Ymcp6kdxCOitvijC2zc58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iQYc3Uxq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Lywabkdr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iQYc3Uxq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Lywabkdr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4TKtD003653;
	Fri, 16 May 2025 08:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jd/QZkuvwMd5eLRhpE43BH3q/Y3GjIAxV5A6liAwtDM=; b=
	iQYc3Uxqmx1cs64nQAPA9/qud62yvBwZwF+PADe6Pfo9OrgTlgmaGh2hbEHK+B4T
	n18ZazjB5hFEZWxrLRXR4txFiAK0YsiW7nKjnpv1PMtTYahI1ZAlQ662UzJOJW4A
	dHbYCzfKE5dgq5Eh7xMT9b1wlIF0Opsb/Nd54FjCLoBj2xhThpS8P9pkxfBRm97t
	HE6MezFaztQkQKm8686YAYWpJZ0rmN8pQEpqJ0OKudqow3SHmc1g7+9lsEawvJji
	bCA3on6hrnGQVJ5bFnffI8U9PBve1dcZXS3uqyHv39NkPSvq8v7skIUVDs71NokK
	t0Q4ZAKMnANwwG9dj8hdcg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe5ctte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTWGGYTTBY5cU07+kHmAqNFNQd0mORqi3zQDDH6RjZ/B/3j7CX1e9cIqFAe5zm92C4t7Z71avfO0nZBpeAWJwKphx/MMexkg4zC+mhMX4dJwA6Ou1KhgO54aujNd3GI++RtXFXBhOKN21ELmKp+wt4uMLe4HKSnlL4rq/feNDXGrQkQWmfA4kaoKZNKqbaX1h7/HXBgQ4Bvuq2pbxdXsXaE79CJOIHeQISd/faG7yXaxTdZIiNKTFvvafYcWfdN839ULZuKRN7na58qD4hCXBFrmsX9vjVx1FYpt4YT0edKBE+sOpIcAEDbvPVqE7ahoJSHvgVpQLUPkc/rGV9z6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd/QZkuvwMd5eLRhpE43BH3q/Y3GjIAxV5A6liAwtDM=;
 b=J46ulyvnRfbSQxq7Me6CFgfFs1xJ05stKBN+rqXODluRkUNUrWvDXXqa6lZiga0bDz+6l1u3vw9jFxVtBu1g5g9PJ1kI34YP6JaD69fpJOFhc1HBMCvRmCRXWpj+wDErCpanZPMxByFTMKu+3veFr8cBP5VzamJCszwlnaMT8uB7zQZWR125RN5H14svHf2/GgVnrlLUI6kJ6V50p3swnRjYriOl1/H5NVkW15jVp6J+MFD5lHuYcXgd1RZRNkuxcz5pxXsXmLTratvspSGWjCRpf808cMv7NNntre4gOytBuCrzR10aHBGpcyTT+uYXDmChgzirKKJEvnyacro1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd/QZkuvwMd5eLRhpE43BH3q/Y3GjIAxV5A6liAwtDM=;
 b=Lywabkdrw3jZlbmo2kLtiRzrwdGu1ZYMrbKHx07xCSp23X/xxyh6P3TwZzfc9UidIndVlGSEqEYdL+WOrRt5VGDV9rhdq5MmEyk4su4jN1s+rYkumnZ6yk+AutKXgmSag72zLul9Yz9b3GCddEhUfBSD4I/VgLzCEkjNzHlUDSo=
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by SA1PR19MB5523.namprd19.prod.outlook.com (2603:10b6:806:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Fri, 16 May
 2025 13:10:13 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::ed) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.19 via Frontend Transport; Fri,
 16 May 2025 13:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 13:10:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0E60040654A;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EEF3D822565;
	Fri, 16 May 2025 13:10:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 2/7] ASoC: SDCA: Remove regmap module macros
Date: Fri, 16 May 2025 14:10:06 +0100
Message-Id: <20250516131011.221310-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SA1PR19MB5523:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4302b5bf-5d1a-40e1-e137-08dd947afe57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qTozv+o0puK2v98pQ6Up5ggsAC14u5jPuOqkMR5mr0H8aBd7VUuB8lEOVKIR?=
 =?us-ascii?Q?nXkvZtVZqEYvyX2z3UmEySjiWO3a8vluIJ7NXr+RpiBRm1CUbk2t4Kkb3WGt?=
 =?us-ascii?Q?+9AYBIgQ56zP1ugcJ3lTyhLylz6YqRdXMo39JTLIBATmB1eQX1fEUmp/hfor?=
 =?us-ascii?Q?4fQLZqht+4ooq4vgYLa0QiIMps3pQrTCTdmleh9nTctipSXmh8WROVg7RFGh?=
 =?us-ascii?Q?c30f9HK6vrOwZf4ZP7AlbALGYrcd92CwxBxSbQJ6vrB41c+lnNZhyg4wXQvw?=
 =?us-ascii?Q?R2oRdqyc+q1Ph/Q0ss5YKRm6H/J/hs4X6E337SepNYEMZDLqm8sB2yQvDx/S?=
 =?us-ascii?Q?3rgcfznK5J7tm4TuwvJJuOLatZOgDWpN3BJycB87ZdkTu2K6QJcFVLt/LeJQ?=
 =?us-ascii?Q?JB+W/NQJxTI9EzCiHS1R0XuDYlE1L7ExG+kLr/uvmVL93dldGjIHhfnvDSh9?=
 =?us-ascii?Q?1Ra8+MRg7tm5YPG/7Rniuct8uWFwrXprlfxrJjQYUFtVpyJ3Hf3pQPQd/XPN?=
 =?us-ascii?Q?9SegHagu/5Ke0YdOvZEwau8WwXVaeIeJCiK569Bf7Txbk5td7kRqEM+irvhN?=
 =?us-ascii?Q?issjDLk5DKXuBQuHrPc3NYQdiqCqqrIKroUJi+SEOWhpHbIMvO2BtOCya2/c?=
 =?us-ascii?Q?SLd6GjGrV5GOalVQaa9HCEoweAICsZ94QOegEgxfNLBaph+bjmFPiIyBYwcq?=
 =?us-ascii?Q?d9MmrqcTaA11/bhX7wuvJCEYjXPe5dnQjR54XpFEyuxqa0z5QovdwaJEWQCV?=
 =?us-ascii?Q?QbNvNIQ3ZSWUDdW/SRIl70dVIy+00i/oAMyrsd8F2VsTYGmUMxLPiYTszHpm?=
 =?us-ascii?Q?9BofFeWJL0Si4fJdHvq4LeL/HLEODLvM6HwXoUZ6EG5201W+YeeGriPyua/f?=
 =?us-ascii?Q?3jO5U3UW/AN/xxtULe0H5AdPQIsLPUxHmdLMLE+SpxxXyRlxcKdI88zgdkCV?=
 =?us-ascii?Q?4gONfTg4dpUVZLvWKIPlip2pSWRZd5hU+iYAoKR5v49i/gTGa4WIsLocWw64?=
 =?us-ascii?Q?+oZDZPTF0EhZElcluB5Yg4SNRi+ByRGjSi1HmA1OB4yEzesw30S/dLnTxOf4?=
 =?us-ascii?Q?K9E50FJ7NkxVb5YLJu9WfObsuB+9IJWXbHzFVZRqJvZXg5vxPMnporjwFdtR?=
 =?us-ascii?Q?CkS3Oi828noxZWsdt26zR9FHcIbo6pameSTZBDLiRrsSzaxseNm58c/Ng/FV?=
 =?us-ascii?Q?bODhJZ1iKj7QMlGq5AwEAaoi1cb9h5Buv6EbiBQtk1EbTqp51PHcv8V47fcR?=
 =?us-ascii?Q?1goqbv7G2B+vsR8WML9RUU5KmB1LGnWg0x8McMnCnbir6eZCR0j5mkTxyvS4?=
 =?us-ascii?Q?cGgmshL6XdnLmRLdcTCtHaBVgf+SEXuvT+CExQuJ7YIrIAi9oSWBelFZXudV?=
 =?us-ascii?Q?EnSyw6A829YJvOSNbIdetSuZovO3koSJiZWShwaTM8M3g5vGpMXJ/DybLRVa?=
 =?us-ascii?Q?XwPGg25czve5gNXt5+hfUgP1FJD4+aSNm0cML1FYSNttTvd4q3lgr6J8TVjL?=
 =?us-ascii?Q?tA/nLmfiweKDlptrlrBuP2XbC+BHMuXVw45l?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:12.8517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4302b5bf-5d1a-40e1-e137-08dd947afe57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5523
X-Proofpoint-ORIG-GUID: E62E8hRxjWdqkSe01Kwkw_yb6YaqdhFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfX/KoNYJHgmF6e Qxis+e0RCFcFlDFmqHEkY2o/8aFfCRDrowuosB1IM9szKprI9tebVGTWKxdRyKizU4g9bRhGFJx G/8FPV9NVjT2ZvV/0UfSRS11EPfwrkoFrw0sKtQLhWB82mzv81QwBQ33WaLK3hH+Zv+Ldla5xup
 Et9lgYla3OgJYXBqQ881KnhUA9tJla/3B9AGjqDrekO9o9BSkEVRY/1emzubjhvg0HIa74Y9+P5 htJNXiNDBMshYBP+BQWhYDbncZaafr33fYKrJb5z0mkJWMiZ/SNdZarSmNeR3/1AszmIVZTVScq at9Gc5tiqoozJRadMmayi9CFXCkRT3RRb0QFSndTGx5jYV7BDpghrij2+wR4l+RHzDTFcrG1A3J
 DM1ArCbOz1Zxv0TwTtFKsuL8nyhxQNZ8129AcT1dTZDL7LvO6OmEVT5A12alQWgKZZWt4Rr9
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=6827393a cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=r-_3kUPhiOb40eG2B_AA:9 a=0lgtpPvCYYIA:10
X-Proofpoint-GUID: E62E8hRxjWdqkSe01Kwkw_yb6YaqdhFh
X-Proofpoint-Spam-Reason: safe

There is no need to include MODULE_LICENSE() and MODULE_DESCRIPTION() in
sdca_regmap.c as this file is part of a larger module that already
defines these.

Fixes: e3f7caf74b79 ("ASoC: SDCA: Add generic regmap SDCA helpers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v5.

 sound/soc/sdca/sdca_regmap.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 4b78188cfcebd..66e7eee7d7f49 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -316,6 +316,3 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_write_defaults, "SND_SOC_SDCA");
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SDCA library");
-- 
2.39.5

