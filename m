Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552B274B46
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261294; cv=fail; b=HzBYKkjRN0PYrstIU21Lcodxm6qx7UdwkM6NWA6OefnDAuycE3h6WAQk9yf75VMWOb0A29hHno/PqiM2HOGTcws5m6eSlnCf/astdtZo5WugVBFGZdTH3pmXALuBQqEkeP4o23c6EMcfH/NOFAwrF/7pYogieQtPKA1ndQ+4idI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261294; c=relaxed/simple;
	bh=C/ei4ZXoGb4jdzIHEGhj57IslL+vki1ZRU1nqMtn4S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdZv5IPAQrcjxRn5jBTMzxfvxEbvqWOQhGWZsVe7afL32Axj3p/hQYyQ9x6RsWaNO5KEuhEkT+IHxDhI6AcAcHJDLKUq4SSRXvu5H15/l1YcQtkUhKJTNmnVgg/R1pBKKX7/RMouDTvU4Kg2pbk3z8hamHQFRdN9oBn6uaOUU/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HesnLnzF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KIPKxEZf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HesnLnzF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KIPKxEZf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5Kub2620267;
	Thu, 27 Nov 2025 10:34:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=S/1lKafX7SUKyIr+NIkLvlMafSqmju6cnxvJR3ANnHc=; b=
	HesnLnzFdCMGvqetJTYiSD/DKFveM61Wyg+x5Wm6tiW6Po752L6ZqgpoQgk3qShQ
	x/JFfyrtPnH0bfLj9rXRmKnqsqyOEZtheatyaKsUUcPZFESClO/t+ZpKnBv2zK1L
	2leE50p76B8TdNdhKt3LeSootBhizomuwdfS47jDxOSgItFQ2i/36nybSy6+1fpx
	/AoGgg3sLdFhWEaua8SPthzl4oW58twwNKwisbYXUpK/rk3+3HNAvN13OnbolcoO
	znbD0AZ6EbnBRRaEs5LJMMGwcOJwrvcNTkz5Bggi+hPYbFuTgO+vp4CGQWqGP0r1
	c4bwUi9A3BN27fVZgg+0YQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020114.outbound.protection.outlook.com [52.101.85.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwtem1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u05zSucE4m00+iLrSSVthQG6XXOe95xLl2AxkYNLskz4KrXVBV0NPYvRmgMXyRbdxz02y0pS/fwGOTrQIestkXcqat5I+TanJ2dJKUUnSFFUSL8pCjagVKdakJlw6XbYFs7K/M7PaBSDcLG4oygKlLN3yFz1kLcq6y379i2CNOiq6AVBbDE5RwN3QBMTyRWczr4ML/sxm3le6DiSqdy5TJDXrJRBWFU4bxmcrOFOM2d1WVvhOFBgUybpJVzDrBdv5Aj/e+XPCWhzlV+Mt9ju9mMHXgdHo9KdEZawqFYB0Tp24Z7+7tiAyPl4XxSySQWUVmaHlzlDIF4PnU6CBGT1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/1lKafX7SUKyIr+NIkLvlMafSqmju6cnxvJR3ANnHc=;
 b=NqSg7VeifGPhZdofIyKco7OoHUGJ0O3JNN5ev/HZswaIRq+SeEIodOwBlvkgn4Lm2w62JnnQG7T5nVAEUYxUnr5L/svaVpCpmIiu/31+djWWXna9cvqtNyfp03FyMsCCIdaUfyB9Qt3gwhs8tXs03Na50VRyRWj1M1LCgwghsH7zgiD2VyRSvxAVEs1MrN0lbUXvf8Sbk4B/kUsBKg3cxSZSc/nTi+G0RJaViSFiVq65s1EfPA5rOwEH4N0oBTFfKS/85875hFAIXQyok3NjHDpPVRbpYY2OYLoL+Si2ItZx6B68+Z7Us/RYGFuuPR8Vyh6uETKqH9uunWmsk832sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/1lKafX7SUKyIr+NIkLvlMafSqmju6cnxvJR3ANnHc=;
 b=KIPKxEZf62l4XwlomHllPwz/yCAEfVwsY3nP42l4Yd4m7jyBGhi+nGIToC2ehC8KtsoBmGWR1kzA8hkp1P+ioQKkeoyqMXxuAK2dRLJb7rakYNC3grXKmTqITPRTrCvoBtmTy1PSDxXrlcvdUaWndp4jGi/pKXW7v1LrhGK5NHg=
Received: from CH0PR03CA0378.namprd03.prod.outlook.com (2603:10b6:610:119::33)
 by PH8PR19MB6882.namprd19.prod.outlook.com (2603:10b6:510:1be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:34:35 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::ec) by CH0PR03CA0378.outlook.office365.com
 (2603:10b6:610:119::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 16:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4141B406556;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E3D9822541;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 6/7] ASoC: sdw_utils: Add cs42l45 support functions
Date: Thu, 27 Nov 2025 16:34:25 +0000
Message-ID: <20251127163426.2500633-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|PH8PR19MB6882:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3679f32c-0efd-4623-ac64-08de2dd2d8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a5x1JzzL2aj1YYPmtczamxT096Mf/dgYb7TPlwOXjcEBDNNoreFCRiIHJdy4?=
 =?us-ascii?Q?U32Mt6ixBZ9R8WriTUhqhDmm2a2xSN1Z5IakARBhuNwwREkFWZ/SN1NSjv8d?=
 =?us-ascii?Q?TbyP8pFFJbTXXFnzsRnSC8OnjmmrmgHgcnuBj6d+fEOdupnYLU0YkD5Brv/x?=
 =?us-ascii?Q?dcItWeMr+YgVHoLlmQcCHBrA5AOVGTyvUaIg/QB+H9IJ3hmBcApg+IDsO5OT?=
 =?us-ascii?Q?y27pohA5PAhyrIO2wbu7omekLSfxTCi7MibGMOpZjyW4s5bSTgIRYfS4eojJ?=
 =?us-ascii?Q?AadP45NRD9cApptswpfnJoS5gsccjLS31KYCgexzH6dPrXZt0ByhU532yK6K?=
 =?us-ascii?Q?6Yr8rSSEEp5G8zHVd1p9GCvRqRX/t8aZN9otPR1Ov/DrWDfdPuEU4brvkNfk?=
 =?us-ascii?Q?t5mhgrMImNUgv90xtvMdzijA3Y3sSy9eQ7nEzb+NgcPy3Mtucxv8vPcjjutK?=
 =?us-ascii?Q?7u/FKtjZS4HZUTdaMqmEK9Mv8K/YfxAO3oNRynIJhS3YGRB+/TXWL0/hRfDU?=
 =?us-ascii?Q?yKUsexa5lrQ0k2KO3wv+vy/vS1NnLmIssQjX6lHz/0Vha8XwvYuWOC2BTXSg?=
 =?us-ascii?Q?xtxFjHPjrA+nYW5E+CqYwoXgtyiIYlvB061oPo9hUC/WtJnf/VWpOLLz7Eg4?=
 =?us-ascii?Q?03NBon9+4cu/FVzuynYf9RFCer5JLwezf05VjcgjOEvSTd22vSCz0+ozClij?=
 =?us-ascii?Q?fVftiilKlRn4ULB+nejDd5d6glODUcnhCkAzaWQvVEd9GSaMnFUrc7NTteFc?=
 =?us-ascii?Q?YbCjqEOOPanQwPrM6FO4XrcHeknijwkKBaCOI+tcyHwdmCvsCh8BlnJ8T1fV?=
 =?us-ascii?Q?CRm1G1o48qsP8EP7JcYIsLFAfKiUZBhcHfx2MxdSqu5lMWpWiF9piZtQKSSb?=
 =?us-ascii?Q?aft06HYcZpG1m9QWmKRquOPD0myE+2RuR+OfQYq1P6YlQEILqG9K7EBZwJW7?=
 =?us-ascii?Q?aubFL7ht7yCMiot1iemH0npta8sQSJodwwdLQ8FciV81bC6EpWLCk013b2jH?=
 =?us-ascii?Q?/8AoyZ5IrUs4Er759A7BahHVYTZwK+YBZ5AHB1vPqTiKAKJ36y623NRWoyOZ?=
 =?us-ascii?Q?xDt2qCV4un6cBWTY5em3fD7R11ezL/vH/qc82XsvLMijeZ7hzom2TUwF8QqK?=
 =?us-ascii?Q?wicbK7nE0ID5uVf5rke2LeM9Y7h4GcyuGHnCyhMLnIf3nMbcBkbfOpCzszmo?=
 =?us-ascii?Q?9PDt2+ddRlJIr3IUVHUULevWvWElU7LrXn8DpCbfg4VH9hITYsWk3/AUN3qK?=
 =?us-ascii?Q?J9K9PaXvV0T//p8CS0GC/99yItXwyN1AL6s8Ob9Rukvq2Z2D8z+lQ5ZibZMf?=
 =?us-ascii?Q?A5uftfIYCIZdNVdDgp7ejlnxqE7NGqlHcLUGQukiAOL7JDVN/VS8teiIxV2p?=
 =?us-ascii?Q?hStuYiy3JmJTJ5DJn/LeqkTjSCXXkj4pIgT3qtpp+TxK0KoYT0KgpoVBrSOr?=
 =?us-ascii?Q?no9dFmyoiOhD+lrZm0bz8PUssmu3/qEbM5GU5fPURJ9MaPk8FQ7+RlGLm4JH?=
 =?us-ascii?Q?vVuRW+UcCnOE3X6/dF36dPHqAk+E2/l2dQ4jj71ZkbPkA9U0Ne5EnROTDfC1?=
 =?us-ascii?Q?s7AsRr8Ko3ifAUCht/4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:33.3830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3679f32c-0efd-4623-ac64-08de2dd2d8c2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6882
X-Proofpoint-ORIG-GUID: Wv_xiossJuA86nc1uThmmtukAu9qvhAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyNCBTYWx0ZWRfXwago2GuuDnru
 hCeAIATp+K9/MrX+7/J3qlNzu7VUca1sfZIoH9rRjQWqucqazjadKha9XOYcJXa+uDHLCn6YSWi
 h86N3Qn6FDD8oJvuRdgtiqJQbdik58/kmVy57muRrljIiW5WhiTd7EvKGA6L548yQmHg5R8nfze
 bP1mQ1+eCoGjMCzLW9w0douuHTciir0orGnAGXVQH2uQYX7bNPl+J266H0MWrFn7KCS45dKvlMe
 QtD/8XqtvYWdHY49UxmytpizW86fgHdgJrtzAU2VQBziAWgHmBnvPQs5GM5B+RlgsJh2lbux54x
 1jI3UaG4+ngQO1qOLUGS7fVrm81pruRA1/DdQtcxWVSRazM9bUCzC1FkKSMhocz6l8au7+4n3j4
 ogS/utDXS93PYM0vKmkohNXmm+OujQ==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69287d9f cx=c_pps
 a=0Uzpqe5Hikn09oORNzbshA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=qYEQetsP-0WAmK5mYqkA:9
X-Proofpoint-GUID: Wv_xiossJuA86nc1uThmmtukAu9qvhAT
X-Proofpoint-Spam-Reason: safe

Add the helper functions into the machine driver for the cs42l45,
this will register a jack for jack detection and add things into
to the components string if they are needed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h         |  2 +
 sound/soc/sdw_utils/Makefile          |  1 +
 sound/soc/sdw_utils/soc_sdw_cs42l45.c | 80 +++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_cs42l45.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 48719fde308c0..227347c8f0b33 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -257,6 +257,8 @@ int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l45_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l45_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 /* TI */
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index a87c53e1a2c18..e8bd5ffb1a6ad 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -5,6 +5,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_rt_amp.o soc_sdw_rt_mf_sdca.o		\
 		       soc_sdw_bridge_cs35l56.o 			\
 		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
+		       soc_sdw_cs42l45.o				\
 		       soc_sdw_cs_amp.o					\
 		       soc_sdw_maxim.o \
 		       soc_sdw_ti_amp.o
diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l45.c b/sound/soc/sdw_utils/soc_sdw_cs42l45.c
new file mode 100644
index 0000000000000..647923d9669fd
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l45.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Based on sof_sdw_rt5682.c
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
+
+/*
+ *  soc_sdw_cs42l45 - Helpers to handle CS42L45 from generic machine driver
+ */
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-card.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include <sound/soc_sdw_utils.h>
+
+static struct snd_soc_jack_pin soc_jack_pins[] = {
+	{
+		.pin    = "cs42l45 OT 43 Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "cs42l45 OT 45 Headset",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "cs42l45 IT 31 Microphone",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+	{
+		.pin    = "cs42l45 IT 33 Headset",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+int asoc_sdw_cs42l45_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_jack *jack = &ctx->sdw_headset;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s hs:cs42l45",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_card_jack_new_pins(card, "Jack", SND_JACK_MECHANICAL |
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT, jack,
+					 soc_jack_pins, ARRAY_SIZE(soc_jack_pins));
+	if (ret) {
+		dev_err(card->dev, "Failed to create jack: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(card->dev, "Failed to register jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l45_hs_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_cs42l45_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s mic:cs42l45-dmic",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l45_dmic_rtd_init, "SND_SOC_SDW_UTILS");
-- 
2.47.3

