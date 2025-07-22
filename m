Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167D23C4F6
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184851; cv=fail; b=bai0VzcaBJ6cOrcKiJsEcoZ4Aq9/W3Ter0DhqqIdtbiGSXOoQCzxVGa5FU7+XBlwJh/dKlyH3Oq7Y1CQ7vNzYBcveu7/AHKDukkIpkDHKeRiSQ0ssqxppgB2RlyaDuXnSXP3z5Ei6c6gYiCcPH3lcEg7ckRoZOJ2qK1sc3VIhCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184851; c=relaxed/simple;
	bh=eMeJF1zF16zuAB9SFE43CU8eyNQt4YHg22XufjIfrBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WfEufBN6/latu/wrrdQSRULPS/hcEmOyvH6Wi0n2cQTQGnj5tKHkAh6WaOBndBU9TyqlN0ydsYVBpzvsXKGIP864WVO7IQnQztuzz2Vwdwz22NblqezKPVtpKLkGxpl8Ao+V3YkRYtAZn4a8h/rEu15D8E8Eo2d3gr3b0A6IYz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FtQfLx2C; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TVYjo9aA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FtQfLx2C";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TVYjo9aA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M6hqsm012369;
	Tue, 22 Jul 2025 06:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5ySY+KHG0NurghKl
	VJpHksGXJM+RJAaPDViLU29MPpU=; b=FtQfLx2CXtvzqjmGZTm/b9DJ2V6fUUaK
	ZHsu9LWDElWHE68ZRrVAg0Faea8CFCKfMAiybbXh5U1fvhA/7NNIavLCEPnNKhDB
	BVS+tZY+Pqom3MFSW3ek/jg0CzEIZ+dEOQQWNFd6SznwhwMJb87j7HCr0nAe0uJj
	swjlycQIxhF3TBZqrc4OGqYaaEjw67yDRljpKNctRAHGVYSdYSUUk9tE2ZAKhdEs
	PniE5jIR9LzsWb4wKp45j87/r9yel127S0DBozBjQZz0SYWEUhe+F8imnrOIM5Ed
	8e7ZeocTRExjogXaCnMGs3dX4f+IxCDvabB4WEHm1T2S6oRHgrS9Rg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2122.outbound.protection.outlook.com [40.107.100.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4807sg35dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 06:47:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loLut/BWO6PfKveSFSL4JwGnHEQjuSKF6tBTWzAlb/4sk1uDiGbLwbiChRRZMSABjtVcHHmM4Be20x11flhzSMTkBtK1htOhk7esO+epqJVK702hSM4AwDzccEPTtCMW6cczuRI0HONq5q//zatMccDgJvOK2+YmZkbcpC644Qu6/shoi+uEEPXx88Bi7ZViFxkfu2+zb1bofRiIJheoaXFc6ReR8RTucEUmZQDNUSUGwv7yuziLKVReOjIe8a5SbbIT71FmZ+apJCUaBL3zLU/HFeQ+juuoP1IoQex9V5hmNn5DQVWfFmknp3aufEhYWAvO2a5ACE9lslUp7Q/brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ySY+KHG0NurghKlVJpHksGXJM+RJAaPDViLU29MPpU=;
 b=RKl/1fJnBGKUZ2uncepWL0OaCRvHClmeN/VyrZD91qkdVAkUzEfnADum11/s1TXjhpNQi0n/jJTBeoj1iD+krCeiYSlwRaZKZzvguzR6cx1OlnNu1tCrn6GGy4zbq1myEF3rTRPJ5Q/64SG3iZWJcODCevVOBSFxwUAYTBf158IHwajt9Uh6pcqH8REbczHRp0HXWay4YOP+/XYUGG3tIrs1GO88f9X5IRXo3Rdu9mFzqi7T+w5XNu/s6UGv+G3j1UlMIugK+rF5ZxhdxRYcOtKK/66Kn240tGggQywlMjpWJd0HbPZ/pi3H13uVFf7fCoyizuevE279Ioznl+oCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ySY+KHG0NurghKlVJpHksGXJM+RJAaPDViLU29MPpU=;
 b=TVYjo9aAxzZ0rwAgT/CI6NYoGzYEjWsxFS4iin6W0Nrp7heYwJHnnySPx1LDsefaMLaln3yd5HSoWLf82F4h64saiW6Mlob1ArmV/wtSqw5LE5HvnfMPg40KYd3LAfMh5+QhKCRVTnkhVjYGykMs9F+Lf5j5qVcaJx6S3qZqUTA=
Received: from CH0PR03CA0267.namprd03.prod.outlook.com (2603:10b6:610:e5::32)
 by MW3PR19MB4217.namprd19.prod.outlook.com (2603:10b6:303:40::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 11:47:12 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:e5:cafe::db) by CH0PR03CA0267.outlook.office365.com
 (2603:10b6:610:e5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.30 via Frontend Transport; Tue,
 22 Jul 2025 11:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.1
 via Frontend Transport; Tue, 22 Jul 2025 11:47:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CCEE6406540;
	Tue, 22 Jul 2025 11:47:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BD9CB820249;
	Tue, 22 Jul 2025 11:47:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Fix implicit cast from le16
Date: Tue, 22 Jul 2025 12:47:05 +0100
Message-Id: <20250722114705.2816910-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|MW3PR19MB4217:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2dd3a02c-60b4-4f6b-d639-08ddc9157e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BlSMaauiR8UFqNxUbLRKqjWWkuMfawDHAFhJ1cVTud8RAA/BEui2X/KbEMw3?=
 =?us-ascii?Q?CRQucaHlBEWa4uUbg/HYKivXfqyonAmcKmL5+VRErITy+AG6y8w2RhcHtE05?=
 =?us-ascii?Q?eKAvKlMZc3O01coAs5mmSndpwtQxAvSCwXP7qacmwbu7TYWkFQ+da/Wo8liT?=
 =?us-ascii?Q?4rT4JL9bchQhefWlCJymY5AcxRZT1N0CiLCzvMR5uRn3NBr5paQVV5ymAdaV?=
 =?us-ascii?Q?4Q0s8SpSOO9JKJDw4bY6RJfYzm6+WSJyd04+0XbTCKAwc2adEpgMxg+8mmj8?=
 =?us-ascii?Q?Qi1ZXD+J0C8TQemo9w7xUfjk6Crjl5uK+nvAuUUia8WoX/k/+GrCFxZ/EtTF?=
 =?us-ascii?Q?1pSprpM8kvmtbSlWH9Eoqc+mPkPkyxriGpNIT7UjnbL1c8aBYjX+LDJu5hPe?=
 =?us-ascii?Q?iDBWcLt2L/6zc5vPYWPG0U6Ga39iAYeEYlguSyLTnJzBpBKf6NFNl8pVRIQM?=
 =?us-ascii?Q?t71jyrzZgQK+hAEasuGE11ek0mxoaHAoRsqXxm5KYVuT9ziW5oNockBS8D36?=
 =?us-ascii?Q?JHtIQ+LnFFzrWkq9/x7d0/RliCXbZcDQLd1ohtChezO/KhK5lgvIYjUeBOvM?=
 =?us-ascii?Q?YF31WF8YDXI+ThkNaarc2h8URJuCfXXjNr1gXdnO+09EprK+5L9d8eKiJRPZ?=
 =?us-ascii?Q?eW9k/HUkX/H43aWF/WQaTwEtxQ4OgdZ7m9A9tmtN+KdjALwt4U87sO9Q1owj?=
 =?us-ascii?Q?gY1zbqinESCF98KWI/qiurZJ/JvfDmqe2PR9bomw1RRuBGQzGZc0SKiF52z9?=
 =?us-ascii?Q?PYmIm9CKWO6H2T1IoUpZRz8BNyJp2IEUm8fVaedJhc+p2pMih6sxpohdJQXl?=
 =?us-ascii?Q?RC/Mp+NwcV4HpGW7PK8v81KYf4etRzWZcZ3X4ybBiYPHOmVM8jEOzdbIQuM4?=
 =?us-ascii?Q?3Ft6ztWqPaP7GGxi6mJJNi9mV3hIXqm3ylDKbd+KiI0Nlbb2SdCTk9fTsnb4?=
 =?us-ascii?Q?ONf3eG9kDMNKDD/fKNbxtkr8gkc5oZxBHjxrDLc81dGfrigo28dezJ53nwIO?=
 =?us-ascii?Q?+mkl1h47tiAjF4zPXECwOSZrJ7+dKsO7mtv1GNOjd6j+SO+OTMsJqtivC5Fc?=
 =?us-ascii?Q?9Sy0hl+3qKd6ROlz09nnxSsFn/H5WfU1mm50pDZnfwoA2zBB4gD/swgHyenO?=
 =?us-ascii?Q?EYlGNT515BamUydRqN3o2PkHytEKf7a3MvLLDQS052B3ZfjkAlwW2cbXkLuU?=
 =?us-ascii?Q?hZu9SkSFFzrLk91bDgtWN6APb1QASiDFJNIdmJNcOOrHTyIja2Wrbs2PNMoV?=
 =?us-ascii?Q?TzOqgwC0pARZlKLK17nCC8X7il0j2Pl158KDpzZZkkGHsLD2w/2usETdJkKE?=
 =?us-ascii?Q?cBJtF31b+gcTZNJfvYpBiiOwJAl8sCy1DtRTOtFI9SZb4zOSbDhvcSElKNIl?=
 =?us-ascii?Q?NBS/i+WdQ44fofcs9HXzcKHqxHgTvr7vbPVwBQpXdDEaB9wZvqMMCDKaC6Qu?=
 =?us-ascii?Q?Fho/n5kd0GDgGX94W07GVOBlsS6Efgo0uru6UKRqZ7CRx4fR4w55ZbaYnmHO?=
 =?us-ascii?Q?qsSF8ub0K4C2rSrWYqrEyZfuKK+kXjq2gFIz?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 11:47:10.1954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd3a02c-60b4-4f6b-d639-08ddc9157e24
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4217
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4MSBTYWx0ZWRfX/rCfKo0KWOrG qGzFFGjY5Bk57LM2kY/ulCCCdpekC5Tq1S0Tjg4WZqEECkI8TSnxVuLeuoKPO9eZ53gcVGBicNF fLmwLO7wibZXedg7zp4ZJ2vYxsld1q/oCKbxhDVWLFSeUdjE5wzIatjNODAvxZAWlhGE4Jnhr+S
 MtJpfM2pnCRO+n3kYAJjSY22jHl5XXuX3FAgu50ZRu0aFJLI+80lU0XSbcNQp364UdE3XHQoo5y XVYsOG8jMD62XMTOe3IxsICoXqBO6BaoKHUBCqsnCipYz8KJmZvkbcf/wuOHtbosxiSV4lz8g3c hFiL3n8VBsFH4QL1Qo/VeMLj8Z0jwGuYb7gIqvIOuwe9z68JlV8c+RZPM+Qi+744J0tvbn2pw1R g+kQouUd
X-Proofpoint-GUID: lyMXEc5y3KDQBBj3zFW6rI2IuMYUfH51
X-Authority-Analysis: v=2.4 cv=O/85vA9W c=1 sm=1 tr=0 ts=687f7a45 cx=c_pps a=Jj+W1aIpjiaze2h10yINYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=NIMBU5Jw2qunLYlcQB0A:9
X-Proofpoint-ORIG-GUID: lyMXEc5y3KDQBBj3zFW6rI2IuMYUfH51
X-Proofpoint-Spam-Reason: safe

As the HID wDescriptorLength is explicitly marked as little endian it
should be converted to host endian before being used.

Fixes: ac558015dfd8 ("ASoC: SDCA: add a HID device for HIDE entity")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507221024.M18hWD6q-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 2224ade59aff..967f7ec6fb79 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -24,7 +24,7 @@ static int sdwhid_parse(struct hid_device *hid)
 	unsigned int rsize;
 	int ret;
 
-	rsize = entity->hide.hid_desc.rpt_desc.wDescriptorLength;
+	rsize = le16_to_cpu(entity->hide.hid_desc.rpt_desc.wDescriptorLength);
 
 	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
 		dev_err(&hid->dev, "invalid size of report descriptor (%u)\n", rsize);
-- 
2.39.5

