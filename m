Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751223A9AD;
	Fri,  2 Jan 2026 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367329; cv=fail; b=Zq7j+CO5CPWk+725KyDsofHXuKwnx+9+GqQ7wWfzr4wusIbB04RVRL4oMiaM9X9/aiEHyBfEub1n05P93GpI0GJ9HL8izqwqEaIhW2YmSfFWiHAgsJVAuf1eGrh5nKTzJQtLxlyrTwGYlVxJ91kr7mNbFqclEe1JYoQOCokqP4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367329; c=relaxed/simple;
	bh=YxqQDECD/UsR2vsO39r7gSOF9TH0wbR/G9Ex5Hg3QPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MlrwGSTUKjzhE/yGUJun4j5nQ0Ukubl8DCsNAyuSuwZbpythdL+2sxioEe3yD7l35CSkuuxKXhb0Fu5tGxJH58vRNOkgFDlM+2mp3VYePN2NvD/XYgUMgDL2f7m9dyEsi5tdyTmYNMu7zoc8bqRHCsfvSAERGySfAv0IR/94w2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CCpFTpKM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=M4uPhBIB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CCpFTpKM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="M4uPhBIB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6028eP7O3952525;
	Fri, 2 Jan 2026 09:21:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ssj1gay4k4l41lnA
	ZBEZA+aMcsF9MdWWAUzt0O0/nyo=; b=CCpFTpKMVMvEJBdcBIULBMzAiuW7jwjq
	6rAFHGsU/hcAKWO8Uo8qtP04FUcRNTuLb5xxwm9kb6scT20PyW7Dg8iYFnOlrI1l
	dYG1viZkkFwz8CHGKljYw302TeRLrLaORJBNF49LkaTuTU+KSacqBT8ayZx2CaI0
	qGBTLObLdiQvTyFIfj/DmNmNKLAoc1E+Cjoxg3VIvuk2YRn30vRA6ncXMzjbPQY1
	Ditec6lxGvd9FvueKpdYZraXt+il8/tq0bPEmcRKBBhpsdtKTcg2LPW+oDuXOUfo
	y2BjnhxS1A6K1kUkrQ3EGU0QHoOCfehWnZVjqDD+KsiFFTSUKUPeAA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021128.outbound.protection.outlook.com [40.93.194.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmxbuy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 09:21:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAw+8jronpScCzaWrsZMNMRjzMHqfmFiAK8/BUfyHQGM7zQIpSSGSIuwiQ+baxy2s8Fvt+bEAXASjch7FJx/yNhx6DiUNXpEq9J3KNRq6Hp8pRYfGiXOIIVZJZh/jei6vWCcRlYtPON1boOFEx0sBH0Q8Zh+AE7rCAseGKISbh1JhsNt4Fa4PyMSFaqsz3e5kp09627QrTzYzn9p0FnLEbTGvqNtMXsSObwCrDZJPa+JeUfBYRLXsVvBcNd4OVxeW0OpKCG2ocyqnr55rA17bC8KhJopTzi+2MSUSF7le4KNWmIHUog7zROWM/tVU03CNTGP9pzPSFMHmkubsASVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssj1gay4k4l41lnAZBEZA+aMcsF9MdWWAUzt0O0/nyo=;
 b=FuYFyX45B10ayi/f9LoGxS8t4Ee/buB7jIswGYjeURAPApaoRSoBfb9IjQATJo1IaHVRSgUPHIZeLRZ4LDe9sqSuuj/BUWipf4HYQbgrC0IS4X61bG8zMas5M2wvBZmas61CFWgQQistuTSdvPnOFux9Kg4hdBfoZSoGPGmO+vTeue9hicDq0pKnNHdGDzWhmTLaban2/guvcflLLL7Uu7cuHPECvBIIQ7jPPgInbRXO/NLJjBFKKCAaiHOrGEdsGyAoTiXuJRuGcnRFoeNljIysyAKIPGNlfY/Zfqfjt5TMSvGDNKegoj7HL0r7t4EPDdyFafGiK6XGGfTT6pmANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssj1gay4k4l41lnAZBEZA+aMcsF9MdWWAUzt0O0/nyo=;
 b=M4uPhBIB0eU6dUwWW8cnnRFLvoZZB7BjMhvsOHaAeW7PWQ8p51fOONA12mAgP+3kviVILEAYMEETSSC006RaA+LhJzpKcsz2BlBArDrY1cnHUoz1HbLpIOW1IH5Zbzr0Ucyuceu26Wd3/ehVdD01knbaLErr/3UDa25SEoDniDg=
Received: from SJ0PR03CA0163.namprd03.prod.outlook.com (2603:10b6:a03:338::18)
 by SA3PR19MB9526.namprd19.prod.outlook.com (2603:10b6:806:496::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 15:21:46 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::5f) by SJ0PR03CA0163.outlook.office365.com
 (2603:10b6:a03:338::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Fri,
 2 Jan 2026 15:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Fri, 2 Jan 2026 15:21:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 77398406541;
	Fri,  2 Jan 2026 15:21:43 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 646EC820249;
	Fri,  2 Jan 2026 15:21:43 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Deep Harsora <Deep_Harsora@dell.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell with CS42L43
Date: Fri,  2 Jan 2026 15:21:24 +0000
Message-ID: <20260102152132.3053106-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SA3PR19MB9526:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b672b939-d15c-4816-17be-08de4a12a419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jPfWJzdaqhTGsijAncVQJF6etBHI6ZZ3KNrTKpH1LyzLec0OJc166MemMPsm?=
 =?us-ascii?Q?bk+kYpH3lIh73TXUUPUc/LMoU+QmJQkbHz7hhuG/kFzIG8h85dgEZePe2OHa?=
 =?us-ascii?Q?WUfBqLnhskkeJQtUOZGCsqA1CKulWttJazU7vTREfngdtP2G/IfCy8SzSpHX?=
 =?us-ascii?Q?QUqf9yt+dV/XnMLQ+t+MSN/i3aDDa/q/WOkIgT9qMWkG2fjyKC6++kLa8DHF?=
 =?us-ascii?Q?gh3CxLwfquHuxQCxzrH/Da85UJ8pQyLbrUaHqeVg9YqjWUD/12sgrs7LLFkT?=
 =?us-ascii?Q?lxc/nZ3uAkjEiKDcZLWEQP3xawyABcHutE6kt9YWX7N0uGmuxgUBXLYkHKuh?=
 =?us-ascii?Q?PUmBVugiCERN/d++WxP7jKen8g47BwZUTj0qDG1GYnBQpNsYnMxsVJhmKHGT?=
 =?us-ascii?Q?wztNUqgTRXWO45MCdzQ2QDqe2Ly8fXFyRKQ67J7NZKd76xP9oevgUUQV4P3M?=
 =?us-ascii?Q?DhEhqQjqvaGV3k8K+DSJ2VJNrSUiUtB4oRUSSVXpDPontwVeSoioAF6cEzxQ?=
 =?us-ascii?Q?b4Ng6t2DEXsjgQlNkDMSSiLy1PRhE2IaGxoNVgiK3jfxt9HGWPOIa/fCQHlP?=
 =?us-ascii?Q?wCSgSqKXRR/D+g3605qc8qRW8TUe1746j+eCoJjss1cLEgvkEe6VDxZ4D5Nv?=
 =?us-ascii?Q?xPO3eIaG/WqRcVg6BdRE2irH1OSE1GkcZSG6VZFXxLH5+/BzK+wMAX9q8vgZ?=
 =?us-ascii?Q?OtPCEZcXg/3dV+iEMjI2uui23CqNTY6+4Z6lQaeghFPipmp4m3D3VaeyuAZR?=
 =?us-ascii?Q?hPVXkHU3ZDkH4Hgm60ZfuGApXii4FDv6rU8/bzFEuJnJLAvWwSnpf4/OI5Xh?=
 =?us-ascii?Q?xFdfR0p96rcsshwkHQcv85uxDz5gSKGkrZaKENturpou4y4Z15i8iYCjHmBD?=
 =?us-ascii?Q?vRbXapq+3rPSpXm5YZ9WTyheEcVpRUHLcvzsfwkEHTrjJaPHC63GGXX53BgP?=
 =?us-ascii?Q?J6QW8o4gTesNdB14a7xlD8D921txQdaGBOrtIgyMZOi5ecdcqmx//FdLzh6k?=
 =?us-ascii?Q?ech/71Rtoc6P80qNbzJZqYjEZpAxNNVOR6isi9Rbt5V81J0sF761O0AOIFft?=
 =?us-ascii?Q?dm6pi/ZK6cnk2nHgZyIEqopgM3fizeRwyzlUkheHfgT/A2NnmvOeDYjFSGlM?=
 =?us-ascii?Q?mAkx6ucSWDP2SZ3rYfaJnFD6/E6GPOdgRyAPvE4gcKerO0oiDZHADF27MK3q?=
 =?us-ascii?Q?09UPoWO0k/Ec+f5ioW26vBAUgzkiXzRTA4J6L8RwBeDdG5mgDxq+R24oJigE?=
 =?us-ascii?Q?IZ88/ahgqPWrs1CZ/AeNsvc7FdHeCgcis6D/TuBGZJUyQmNP7DR8iQOnw7P+?=
 =?us-ascii?Q?dUrd3Z/d++/W5oetG9zk1DYce8IpBvtrPJ+4VxP7qpC8GxhRZ+T+bHlNFyxk?=
 =?us-ascii?Q?ThaBtDk7SfgKKv3ZxHpLUdpr0rHIfe/BxehPsP4M/4e/fYCryemirgUwrxN5?=
 =?us-ascii?Q?kkGAQjJtLGqeQjdlm55Sk8UXLXOnoWN8WWTHVSsrV13QZIRM3oD9c76wefU8?=
 =?us-ascii?Q?WIyc07tQie0t8HzmIWXg9P6Sx+zX8tWfNdN6BlMB7nYiux6cAl9dF2bAjlpJ?=
 =?us-ascii?Q?qO9ndFg4iuD6w1HFeeg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 15:21:45.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b672b939-d15c-4816-17be-08de4a12a419
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9526
X-Proofpoint-GUID: 9lop54rHa8ymKzUgGIiPVJh8twDmEMWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEzNyBTYWx0ZWRfX2H00udzShDi9
 ibWl5an+lNOTbZNS7z4jVYxCsnkzd/Sd/ihmLOM1QzpKq0DUIAdIdREkCD2PTkE41eKwW0F/RrC
 LQI0TI2SLCxrLDJOjk5PwMKCMuhhWeWGlNVg/k3ic+qAleZQ/wLRCxs0Xb0H21xea0+Dh+vM4CS
 BI9mTJsJJJhgPFyAXc6fekN64vG8xL0uCe1Cwm7A3tQkt1jx17yxuGUI5tqOpWzjn82joIp5u2B
 uk3g9FmkbK8DJlCQ6AqQN8OP5TYWoyGzAMt4y8iOIptmTNLbls7UhTdnYwpM//NdACk1ZoCpy8u
 KrPNrMHIl7agm4c6dQagwEIu8VyVfypyChEfl/PL9+eEsRPc0nPciGTCa+xvfADKODZ/IrrPZvf
 wJRGsNMipVJAi4Hltt+8qRiQ6T9K0IDp6RrwZF6NHzcNq3b3OytlrTq4Af3jM5kTvAVgiOr2a5S
 q24lFm0rE91sfr8z4Yg==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=6957e28c cx=c_pps
 a=iGETFsOoOHXRiUW2e12q2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iLNU1ar6AAAA:8 a=w1d2syhTAAAA:8
 a=PFqFaogqJC9CueySnhsA:9
X-Proofpoint-ORIG-GUID: 9lop54rHa8ymKzUgGIiPVJh8twDmEMWR
X-Proofpoint-Spam-Reason: safe

From: Deep Harsora <Deep_Harsora@dell.com>

From: Deep Harsora <Deep_Harsora@dell.com>

Add missing quirks for some new Dell laptops using cs42l43's speaker
outputs.

Signed-off-by: Deep Harsora <Deep_Harsora@dell.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2c1001148d540..8721a098d53f1 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -764,6 +764,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
 	/* Pantherlake devices*/
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0DD6")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
--
2.47.3

