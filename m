Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022139.outbound.protection.outlook.com [52.101.126.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE901A5BAF
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298965; cv=fail; b=W+hxx8spYde2woRCEgt2LL5d0mCzNSuLV2GhoRY96C1R6ghPOwfTQaK5mPmPm4m/Q1eEQkoQVdqvTIF7fT18xlND69DT2Qh5qtrwJhv2kAnQfu5Oc/3Tv4T3ga9+RAuIdPxrsmLX5llF48JH7FzXyRqNRsSuGBqZq935iVZaLMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298965; c=relaxed/simple;
	bh=p+knG1uo5w0Z/yeyGI6WTu3lV3FPsnpgY1+bzil/jzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QvuDgyQkt9APz581O647BoeC4rI36LXVClG2fM8aemK5gS8cNVeC2Ix9bgncPJaGbiyTqcjZKwVHJhDe59eN56Lz8vPnBAhAC2k+JN3STgirpZDrhTb20Pd4Ev6VBEpw8RKbUXpvErFWrcuExHb0WXPhX3HEzKaMKyj9VNBIgag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HW8XT2uSvtsfYWzlSjPLE3YtfLYhVtNhhfhYVgP9+0w6U7SEt6Gbsa7KuOkO0S/uWdtEow59R1+i//y6ba0vOY5XjnZOk8n8cyUS2TKDGKWl4wAl+v7IhVS8BgEQXQou31AAse2OIzQS15eb8YMvmU7BFUvlIt3qgHpdCP9W9SUaj6diJQoBZEYl9tzDPqGu0m2RItdDGtsW3GAfI5ZRP+hd+Y9N4wnUcQj5dvoh5WCDfddlG0RrFIJPOQoix82JbKRnZsHgrwUn7cxnW1moNY/jaY6FkP4uqLeO13p73P7lQcVf5h4L4jCqI4+ecvICHtLt8spuxVY9pQMirjlNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa3WxmEU3DbBLhdb5AvDLwTBE9Zo/nPBAAgRdhidxio=;
 b=XkOFPxgUq0CQs8IRgmTPSSpsVcTq3XB6xdccAwgc9YBocJv6uL7Vt0IaGoRpEHhuDEzgEJbvtHI/GzefuRaWVPtJkZ2tCE1y8aXPxXvCxBlS8Sj4xwXoaWlody6b3VGaQneTFYZhNr9kzIFiGQ9Z814BkiOGx13ThDf/SIIucBtnnWmI+BiAHQEe+fBPVw0XjLJME/SP+r+8ZJru55xYHd7uIMUrdBLDvYo0NQ1cGIwf6tu9s97lM7/mlIdRhk1v3wkdchea5oBQ0B5xtQjakiXcafJZssWqbhxpPPPvij13MltL5PBWZqJYBBwYyfznDEGeyZcQBJWNcdqUH/jW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=canonical.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0129.jpnprd01.prod.outlook.com (2603:1096:404:2d::21)
 by SEYPR06MB5399.apcprd06.prod.outlook.com (2603:1096:101:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 02:09:18 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:404:2d:cafe::a9) by TYAPR01CA0129.outlook.office365.com
 (2603:1096:404:2d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.33 via Frontend Transport; Thu,
 19 Jun 2025 02:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 02:09:17 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 355E940A5A1E;
	Thu, 19 Jun 2025 10:09:13 +0800 (CST)
From: joakim.zhang@cixtech.com
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on alc256
Date: Thu, 19 Jun 2025 10:08:44 +0800
Message-ID: <20250619020844.2974160-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEYPR06MB5399:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f51ce20-12c2-4987-4682-08ddaed64bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aJZ2CsgFx7Tft2kfX/6q27plhNFQx9zYbq1kkZOtXpODY/SBwSw3peQI+Ydr?=
 =?us-ascii?Q?DVKHMt+avrSTXREpx0358b4AItJ897nV6ItHXgEWAp78m5lpbJM9tzA6QqrT?=
 =?us-ascii?Q?xyB1t+5rG75WeF+vWSOsCMjNDKQSxCS4JTEqUb2O+4J7rST2JPkejlZOAGEy?=
 =?us-ascii?Q?E1KTM05TplQ4mLMBpQtzsf653Qs2naLINdtVOOSQGG3peovcNsCAQxE+afds?=
 =?us-ascii?Q?8weMsWKZVd+bFGF98g4KkwewUfMDtjdJp7QPqXeP1yCNYBqvHu6r/ANLIYLr?=
 =?us-ascii?Q?WWzqeBeBA0Rux86OAEvEeDp5gvRFrsmafBm1MJc00LeIpD278dApH68RxL6F?=
 =?us-ascii?Q?+TGZX49DozBFOnwpRzLYbffcz6xR29I7Jn7HIfH4m29OrZq2EoXBhNdwMOkK?=
 =?us-ascii?Q?pgxcVzyei3CXNp3CnafS0pB2YhjKiIa7dvIwSJhWjNaXEEBbRLrLWmyUp+yW?=
 =?us-ascii?Q?lwgCz+8FkH4qIU2YB/g1M4l7WjV19gCTiT2ahrzGGD2F1eUlT8JWk3D+UwXY?=
 =?us-ascii?Q?agRM1yIuRfcAtMwSm8wVZj970hSWHBPqvnDLJ4PtquZQraGY1HZaNdkMhN/x?=
 =?us-ascii?Q?kYJHmm1z/vGMfEX0q+Tkl+IgSg7vSJaKNjvJvN/1fI+R/RQ5x03b6TwLgCoJ?=
 =?us-ascii?Q?s31yyaTM2QEpEV9AgZ0mxSEcvZudBQ7pb7eUtbRutziXq3U2D421To9ZGmTK?=
 =?us-ascii?Q?2t2nw/XnXqtgpEjORnNcxcPo+koj9b089g/XnyhwfCXO8ykg0FoR2TuXPIYy?=
 =?us-ascii?Q?ykhKmm2S05zATgNRGzW9ELjLLMgPs19UojktDKl2HRbE3aY6q/OANbamCGV1?=
 =?us-ascii?Q?c7WibDXgVHr/OPJYSKUUuw9DFjqcu8LpoKaxBSaC++5ya1EHW+wXuubyHG6u?=
 =?us-ascii?Q?OPJmPSI8KTVgUFifN9jqdAA3ZJcN9pAaAEGsS+WBnwR4JmdVgKvJaJsXLg7H?=
 =?us-ascii?Q?IJbl5r4QHdQmA/1N4NsRsjxnaX/67dv4qHqJubZIROxQ3aTfz70bzKHokMnS?=
 =?us-ascii?Q?g278hz1vfJdeYeLaSw8ResAmdB/OzcTdSLYmGVqWNaW52MXBbphN6XumTqVC?=
 =?us-ascii?Q?AsIz7+Bf4NLxCDvrvRwguqxBMHhDcjHid9xmkxCMiZDCXXfqHTUsUZKlIZFB?=
 =?us-ascii?Q?qX8aI6JCMnSRBawGpkBiBvt3xMDGvrj8S4K3WEReCVNNPfkBQSqw5RlsjAFK?=
 =?us-ascii?Q?8fM9P7heUNjwnlXhQUYSP/+MIdzBRVbP4oCiKJmRp2DOcAEXcfCKKmnL5nae?=
 =?us-ascii?Q?QWbIItjMV4FnYLyBBCy8MUCZebyWETpyWUTScFlp+KRb3xw4CJXMM6+BjnCR?=
 =?us-ascii?Q?Ji365iOSQwCgSMLGiNmHDLK3wlcrYpjWwNzyqnkmKQdHKYE/VKUj2SFncWgs?=
 =?us-ascii?Q?nZdIxhx0FIXdvp5aA++pBvmp/FizOfAI0MHOJEXN9cqL/eZIaaZ4xWJvD39S?=
 =?us-ascii?Q?XRVVS1rjn6I8qMzkohdoBKqtx6+mgc+lKDHmOtN9wLsR+ilBmY02dXl/RYlE?=
 =?us-ascii?Q?M8pem9wQkKaSkeMvfLKDPlx9VNUZmGLGHCaX?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:09:17.2730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f51ce20-12c2-4987-4682-08ddaed64bdf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5399

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - fix mic jack detect failed on alc256, similar issue as below commit
   commit 3f7424905782 ("ALSA: hda/realtek - Couldn't detect Mic if booting with headset plugged")
 - confirm with realtek engineer, alc256 also has such issue

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bca725bb8281..a79b542e2a01 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -12193,6 +12193,8 @@ static int patch_alc269(struct hda_codec *codec)
 		if (codec->core.vendor_id == 0x10ec0236 &&
 		    codec->bus->pci->vendor != PCI_VENDOR_ID_AMD)
 			spec->en_3kpull_low = false;
+		if (codec->core.vendor_id == 0x10ec0256)
+			spec->en_3kpull_low = false;
 		break;
 	case 0x10ec0257:
 		spec->codec_variant = ALC269_TYPE_ALC257;
-- 
2.49.0

