Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84371DF258
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592691; cv=fail; b=OLhHtnitqs2+mvAJ6xt9WWYk6oiQ+w7ug7LLqb4HDuLTbXGkD4xJ0aPsq00zsaMrQyMqIsEgUpr2pwW9WcYXRiz7QelEnwBzCYf/CXV4kJSCN79WBzdjXvyvPSy+C6VL833Klm0GRN86LJAnntAb6LMzNBtwR6BvR+NT+pUtJzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592691; c=relaxed/simple;
	bh=I2RO6oSyLOq+tfZvNJeTdpxPEyaLBB4wb5jZLHp0CWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NNjZIpqe+oEixP9mRVr1PJ/toxE0Ix0sL2xanGH0wCbWf2gNnw5YeXwcXh8sCakWw8aRxe3/bvAeZx2xUSde32VZVc0MlcDl4ChjWHOwLgjv7gGqo1sC8OjLbp9zw9n+RuB3oMEq//o3OhvKGE2wQawKQp2Kdsti5LU1IdQsGU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XEj5I1XR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jiG81EJ1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XEj5I1XR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jiG81EJ1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEm4LQ029055;
	Tue, 15 Jul 2025 10:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=r6FaWEiP4tBl+XVH
	SU/4k4vCxTIvgVeaa56U8V25Z2A=; b=XEj5I1XRKuydHdXKqz65zB1jGgFGA78q
	28TI3pTSqKotv9dI69IDANGKglFI6Vhol+mqAwgo0zDz9tP1gaEekTbUnT8WoZPQ
	6M+fUynAREhX3yeXmSJQgKzYCD7FmKKLVwT/70wXLRk9kKs8V7Aj1EyEf0Pf4AGq
	/oFV18pP0WKITugz6/p2utfom0A5qs2CvzgRX6gn++3FBq4P4Xh4csrkMTOEt2eX
	aoUU7q+9MuxUFpFhQc5/M+NyBE81Mc/DWO5/ibfs4Lof1Id1/1J22TFEurC6Hb6Q
	VWXDKZyV99Go4xk2sTLoZoXnLQmmNWNYmovYWU/FU2q7EQxGN+d0+A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2090.outbound.protection.outlook.com [40.107.236.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47um4gvc6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:17:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXOv40f2b5u8Ed1KlkJzZWgqNlqfMHhucRCrlVjWfy+hXDvfMTTacEVyhSrGze43pHMfB5egQGPjob5Sm5Iws4LYChj5vAIiROrfaFgWDXWaj8jWfJ/lm2CSdCFl5aHF65RZtOMqFdtl+Zg32KLBZ7G3vNSq3nUyC2HRpDcI2OB5RBy14sJwb19+m8fkDR9vcptjxo+p4DQdqNiFhmDppsyYAfBjUlrrAtJ/+3OWstCSJ6G7xzslSZRF+2VAhWJMcLkFrWJvqCqaC3IisnGCXYqksJGpg8jSJjjDQ05XX2GSLVDc8kcWKwMZARloa4q0NlFQ2ht6dUcIRX4SjhhvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6FaWEiP4tBl+XVHSU/4k4vCxTIvgVeaa56U8V25Z2A=;
 b=fVP9AJb8pemFIwQE9Yc0hTOP6R4FYEg2GhF2cc0T0WjnFx+KxxuV3XFUSzbPLSmQlYsrC6lYfYd6Wwax7sCemvmzWIZp2T7Wqb621QSv5SJIx0kEIrfJBLA9eLWcu4oXzLVn/NDQDFlj+hX/P+ZApIPPvs/19h2LdYw0kINXUXW43B6UuEDY6MkVKp96W8oB6o/PynJptG65m5rnJQTCDlofxgmp+7657V0Os6JteMDAEmgp/5777AUp/IftXMv7J7QzQmiNHkhUxXh6v1VxlCaahfc9tCjUNKcbkUsFKNanCnoOVC9XaL+D/DxUVpeZcR/q9e22gzvJvQZzfcniJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6FaWEiP4tBl+XVHSU/4k4vCxTIvgVeaa56U8V25Z2A=;
 b=jiG81EJ17LrFnTB2HLUEvHjzPW3I89wYjIQHiNdrDyabbS4rbN8Imn7BhpFp7aKQf7T3E99XVVkfsLk4tUXWuUyd212SKVV+WbvTP9EO70hF7UD5ny+nX3tUlG6ODZAMy05PTeiZqlYr2/bnYhUqqppHAFzfwL2fI73v19pekuM=
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by PH0PR19MB5145.namprd19.prod.outlook.com (2603:10b6:510:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.16; Tue, 15 Jul
 2025 15:17:29 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::64) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 15:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 15:17:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1536B406541;
	Tue, 15 Jul 2025 15:17:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DD78E822542;
	Tue, 15 Jul 2025 15:17:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        dan.carpenter@linaro.org, shumingf@realtek.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/3] SDCA Bug Fixes
Date: Tue, 15 Jul 2025 16:17:20 +0100
Message-Id: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|PH0PR19MB5145:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c64daf47-3522-456f-93a5-08ddc3b2b62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bu8n4UXXicPBgAjTEBgKnizWxnKR2YAN07fV/7LAFGyXbrldUJo+vsjDxhUf?=
 =?us-ascii?Q?8HuVSvuvJ/PliVbQwUjOqnn+si4Qx1qtp2ofXKBoWfbfA+iGVxvyetXWyC55?=
 =?us-ascii?Q?KM1nTu2ZaROSD5nbb9vRuWpTDmZloT6l40xqy34GAT67u+LOYbpFA7Ld5ixB?=
 =?us-ascii?Q?2gRyPANW1HbNLv2hVaJkZgvogkYBcw707hDMhAjY52niNkLbqHDPzN72/CeK?=
 =?us-ascii?Q?ntCT0Lds0TsC2vyCttLkVTEla7fyQNUlbofI08Gu9Lzu9JStokRoiGIih/FF?=
 =?us-ascii?Q?UOn0ObLN10S3E2fCNiYOwBCJWchB2beC1/78hAKUa+EO8/MVAfJDGjkfbGQe?=
 =?us-ascii?Q?Txp7waMULt/aVtOAMc5MIQiexF66dB9xD0lQtYyZ00YYI/YyFHhyaVDk4DTn?=
 =?us-ascii?Q?Ldw9BR3SE1k30pJO+A2GpXlCX9zTq6T/bZ81hpJzsxCH2El6sSQGbfiKowSg?=
 =?us-ascii?Q?/Y6A2dBzNwhxmr4VG4HCaXwcGKWLQDcQUEZnCtpZNdVEva+qeaWvbwqOgPvl?=
 =?us-ascii?Q?Tw4b4fB2zVKVcvxIHa5pBB3PeTko0ATV8mrmq0icrSDEoGC4m9zsoyuy62L3?=
 =?us-ascii?Q?x9EVblY6upUAqEUUbaTT2BD2gUgkjwNfDBZuCZzMtaM/QWcOp/Pjcr95Xx2C?=
 =?us-ascii?Q?eu+PIqNSaKDR4LHB7dHTnS6XVnub2s40AecmzL60RQLhxXmazjiceRA4aMUR?=
 =?us-ascii?Q?W2ePeq275Jsl1TVBjmItuTPWRv4Ad0JiJqKb9/NWz1JdW3CQCh6x92RHF6L8?=
 =?us-ascii?Q?A2v0q8rabAqlsbI2YfkDT560e94eI7K28IEwbiGssDxY/HtysIpgICLU1XKP?=
 =?us-ascii?Q?1tdj2CHq6wuO1jXuGD54Hpa1ga0riGtPt1c6icl7lnAyin+BS7U29wO+YJm2?=
 =?us-ascii?Q?9lww9E77NVgt6LjX9GNaqCVcp7r60dh/MLl4NrwFj+4PSuKaSNOPFbsD7zAv?=
 =?us-ascii?Q?fNGOixHLlTNaT8HGCOBEBeGFma3YCgPyZzunFMLYJWq8jFDa2ZCelyiRPJnX?=
 =?us-ascii?Q?7oMCtwP7Ayj2LjVzz7f50X7mV3t+1hB5j5ujAv6ijgJwp5S5n8MZ0QVJC2EZ?=
 =?us-ascii?Q?dARF2slUyDiwIcZivt4b5K5cBsDWF83ZPpIP92g7vpoEoaqm7cjAJzidxCuh?=
 =?us-ascii?Q?GFwhSNLfnxxtBMfRJ9UwuhQLH5IJfGkeJjzC1RQUMk6KP6x7RQUK2KArThPD?=
 =?us-ascii?Q?Nwq43V5oC9mAwfp+doHJEb/5h1us1upAnQ24eNyTdEys/BGT1WKXhf/c/3my?=
 =?us-ascii?Q?RRi/jGBZGr6wSYnlPS8KjnLsPiNSakwnwEKB/DKRIPGMJR4Au8P2VzGEVecZ?=
 =?us-ascii?Q?ZQtuWes0DWxom/ZzMTQcgMq2fh2ZOxg5/xangzslrkGC8bCHOPbE0oAvuI8O?=
 =?us-ascii?Q?NXJN9dByW/r1HEQadIBn2SsK0k7nm/h0CIdPnFW/aZlj63Ah7h+8Pg/27Fkb?=
 =?us-ascii?Q?p5Of/K77zB83qwiScMQE4oJaEwKq3E7xLsG9ZQm9uyFmtruYS8+ku9X3OomU?=
 =?us-ascii?Q?DAZ+W7cctZD6o9gjlKJ2yR0yQuHTw9ZayrF2?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:17:28.1899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64daf47-3522-456f-93a5-08ddc3b2b62f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5145
X-Proofpoint-ORIG-GUID: bvm5pTaIp5atnt2SWfOlEzpXrKL5b-is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0MCBTYWx0ZWRfX1j42s3NHYHa/ 4pLjFsVqKa0u9ZOjVdQm37W8KgZw1uD2ihNk+BJaM1iJygFg57XJchR6vNTFXrnTYiFYhiLuVAk rqDPJfLQGpiCuefLnqXskVOqCSZY8TsxgfVPhBBsRUtKdwlrGE+/m9E9WaSL22cWRpJgG5776in
 hJOWdnDg/hSmf31Tr7XWCHvWupedRsvGUyRs9ajw23TPWA4o6NGgRM1u/r7dSpd0qV9ni4Bc2Jb miJDumztdPk8cFaQgY9nS6Le1v8f4XNf1o+iblyEp68SiQQbdGd1usjQqjaO6Ps3bcYDcEVX5fB 1J/xjTzm6vbIFlwCzl9TeSlrQ6bhJcyJkPrSfmG7durF2WM3//3F6EEaf9zuuTYYGdsf9PfyT3u
 ZHa4KJ0SKFZDfL2tFPqGFuzn7fj/cVcu2ZkSxG9g6HfPsnXpagkxNPORaQAQEOYrJ49RGmdx
X-Authority-Analysis: v=2.4 cv=Kp9N2XWN c=1 sm=1 tr=0 ts=6876710c cx=c_pps a=1ZwO1zJwvDV4dsIWbofaHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=Lm_iZSDfzw2gWvveBSAA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: bvm5pTaIp5atnt2SWfOlEzpXrKL5b-is
X-Proofpoint-Spam-Reason: safe

Some small SDCA bug fixes reported from various sources. An array bounds
check, an uninitialised variable and some memory allocations that should
zero initialise.

Charles Keepax (3):
  ASoC: SDCA: Fix off by one error in IRQ bound check
  ASoC: SDCA: Avoid use of uninitialised local name variable
  ASoC: SDCA: Update memory allocations to zero initialise

 sound/soc/sdca/sdca_asoc.c       | 12 ++++++------
 sound/soc/sdca/sdca_interrupts.c |  5 ++---
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.39.5

