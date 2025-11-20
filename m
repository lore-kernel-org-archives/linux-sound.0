Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C5D36CE06
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652653; cv=fail; b=i4PDn2Js0XtaAauwZ3heg+zwHqKOVORrZM/uIOhV2n3zNUpcvkI6PcTcRKu1KQlqpZZvoNlfL1rGN1ee784DxlrSwJuuu5KrXli5hQ9I1dBK7rB15Y8RwL/1zADPYCVxr2SSnfd+e7IUMm5L4C26VL+WTy129ODMR8V+u0pypX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652653; c=relaxed/simple;
	bh=nN5v3wc7fkSGhu8DiUgjVqc47HGDyJI50P7spyDnsTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZMuwe950/1zmXlfQQrfMk03M0h4OQnqRfiKs+3ATWjSnutLfJwPAMXqOJRS+z6yDYrzHmc/5w5p6k9eqsE5bRgsgs3oXQTUB4DdNJUFhQhy2KKoHMM+tiCVt531Nm7HuZ80TlubrMRrBVJIwllvxQF8mi75opkT2YZ6u26v9x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O3t1fRv7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K3l7HImQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O3t1fRv7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K3l7HImQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5Kmhr311678;
	Thu, 20 Nov 2025 09:30:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OvgZMoYckkcvs7/JEyjhtIKlz0T3HdyKlKRhbACt+6I=; b=
	O3t1fRv7Fa1zF2ipQfBNIImp3U53BeXwopOAmhBh6Lf3GcyKDlpT84JlaI9viQf+
	r6IHNN9W5iQIOsEeCFX71v8ujt3Taj2HxKiDnMpPuDd9kDJT2WmnH3MGEZczGaq+
	5BZTAUVpJR1YUXFNgSFaNt3vQOz744exefvz4+XWwxCowUEp59VAuSV5J2sS6GoS
	3ksZ4NKWBpED67FzOj61aSZ4yBf19NAsDd2f58ON/P2cyE/L8fU+LOQXGdKVCb+g
	EEfmSAqXet4gcXsUZjg8GRTiPbvhBmVljs2KpyGPmZyYWF1XO2mxEglOZvcMXhdG
	IelJazcBYEPC6pZH9RhpJw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020109.outbound.protection.outlook.com [40.93.198.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamgj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJ68GYNx4EjTU+czcqRYBipzi/gUGGG416C9uEbHC+KSEEilNkZJvZNk1xlEKUmkktBEC9h5pW7VHlGbnAVCiKgkcX4nAazoie8EmdCm9Y0Va3TvJnJ/4O8upO7uuwjkc6Dw2j/WlgIa2ODmrOYtO8zgfIRs711Ii8RFerfHNSo00M7Sjd0zkhROI78U4K4VlBef823Qri5URBmso3iZC89rFe3C4/c1cikMgto2zs57AhTeYjwkATtFCtBOn+LYqw/FwcA8xMUxpddGIfQyY45O2q7940DuHH0+bfW3m618r6hUMR5+RzVSLwkG18VdW+fjXSKy2+fTCiHqzha4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvgZMoYckkcvs7/JEyjhtIKlz0T3HdyKlKRhbACt+6I=;
 b=vEeFsFv8BtmaAXAeZKk4dgux9AVY9txPXBUDtns5d4RKUecM4wUy+eEBzqAjWBwx1yO2GPzrX8vxUtIZiqcFk+oae+NNV3GNxfzsN41z/Jyf+27x+yN3wTo2Q0GBr/L/OMLzR/7uR9W5M38XyJ7GRpEFX6Y7xTQITh5NxTDwqWk/RRhDmCujj2vRJKmVtwzDmtdjltg8i+8uipp16Uw2T73i1lWB9mU5e49F3n/2SBP9MUT9PTfoM0tDVlWWOgg0xwP+BKYBH0a2kvQcFny3zwB4sdRqVbdxWsshvKFgS3wxAgWxRcIapj8r6ut1mP0PPJLyhcjRWZBPDefdIVTNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvgZMoYckkcvs7/JEyjhtIKlz0T3HdyKlKRhbACt+6I=;
 b=K3l7HImQz8E96cBMD4E878dYNc/IAVHJfdSzY5N/sylTuWeWHCr8CSNZdAxuD7It29U7HaMvMWctvvsr4/EdUndsHNkQQi5t6YPr6BlWx+EmSQZ/SRIKLjotMAcXy4gW3ybebB5A8VaHSyVZndwZErlt9vGjiLAPiMzdGnrN9us=
Received: from SJ0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:a03:2c0::27)
 by SA1PR19MB5181.namprd19.prod.outlook.com (2603:10b6:806:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:30:31 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::79) by SJ0PR13CA0022.outlook.office365.com
 (2603:10b6:a03:2c0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 15:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BE935406552;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 986F2820247;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 02/13] ASoC: SDCA: Fix missing dash in HIDE DisCo property
Date: Thu, 20 Nov 2025 15:30:11 +0000
Message-ID: <20251120153023.2105663-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SA1PR19MB5181:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5518103b-f463-4cc4-58ef-08de2849bc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RfTgLT4AtyV0jHrQP/bivzOr9aC4VvVvMUVkDbjLvsOlAosuLEbBXCtwzoz4?=
 =?us-ascii?Q?IGmp0MYmJwJtWunMOKGTp4USaqrFbz4gI9vZqqEJNkNSiYmgiFcewwJL7FgY?=
 =?us-ascii?Q?4Y/9bY+PQggCS4Z/dIGRf84C1ONvt2RJkjgePc5Ve4uAGbSp1Bv3NcrV05FC?=
 =?us-ascii?Q?3U4pd09/WGvxhQP/bPNl+hDt/Oi+P4wKfRMGB4IUiG4EEViMZbk1YcVQNT4P?=
 =?us-ascii?Q?pgYpvdRUszMzU78plHf+K0CT69YEIKG3/2PO+VUV/T2nyAsHEKVnDY+byL2F?=
 =?us-ascii?Q?B01ZbG/56DmHp+sTw0JHJVNhkZbE0eCYVJFT/l/GZEPUS/1g3nXjiqbh+j9I?=
 =?us-ascii?Q?/koDzwfQYL3nVFtop81BBqFUyyMajSvNm0RgvwOunmTmiPu/Zp9vhdrVqZ2U?=
 =?us-ascii?Q?BZ+wVYtG8NnY/IxSg0YrTU48htZiQQk8BYeXMrcNVUVp00jTq0RVpNTLWUT8?=
 =?us-ascii?Q?2eEHbBZpTJ9ytmp4JwWcQqj3mTccmLOFhbK5ruFahFNLS5r0+92yduG9DiUq?=
 =?us-ascii?Q?MGHtXAbbqs2hMBuhvaua5KZbO1g76yinBDxdNbfN/0l8pdopWdWHW34zyb8Q?=
 =?us-ascii?Q?wjvlkWypqCpDnoAekn3JID5Kgm+aR/b5WHrSoPw2Hr53AOoOSgd0BfhDU/EY?=
 =?us-ascii?Q?g4NXDbPN2ymTCjTd5k6+CK6wo1XqaJkQgFuhr06mg8Lut0MGOs5ZT/toI87w?=
 =?us-ascii?Q?33Dl5EKdHf7n7ZbzG2IzXOdcoOvNUpUxWGqU4Lpu0Px6RG+FiK7Z5tt7B5YQ?=
 =?us-ascii?Q?sSUyHuRGNt88SdufOpF1rZm6LoJPzeNUTtBlG1k9PcMQElPXeoxEUbhVz8zy?=
 =?us-ascii?Q?A2usWFBFZ/qZXUqtJj9i6vyTcnMpi1VJBJcBsxhmIRPNHGUribK9itNIsQeM?=
 =?us-ascii?Q?8u9mDkNejKns2RFdROACpSar6neZ4XbCmL3p23QbjfI8dnWiSsBw6FAysiPA?=
 =?us-ascii?Q?Jz9vMKZQ2AdiyHvVWmu+TC5D0FMgugNrcbF3saVFUk3UmSH6eWReAFydf9wq?=
 =?us-ascii?Q?j2S2TnI5IGcs3dhg3wpxDvSeMJ6EwMvXdGmj/0NFkHzLAGf+zeF8iOgpotN8?=
 =?us-ascii?Q?PqNDRnub9emMHUa4lmXqmcn2wzXfU+meSA612/3xqyZeuuxZO1vvx2FWf2nm?=
 =?us-ascii?Q?S1+rcwXAErx7rOXysDMO49qU84bw5487Dc84yo0F407BakEQjSJwwey6SOdu?=
 =?us-ascii?Q?PQ7YnmpQPQX17lUWfuoLWwF9JwkOEUEhsXe7pDTjfEsILZzKzjLmmoESkVNb?=
 =?us-ascii?Q?f9W3bxjMweUKIrm9SpzQyYAlUIq2eZ4QQyV4EiU9nneGaOrgwNtJt34y4/cJ?=
 =?us-ascii?Q?viyF92j20Q5eni6gPi+DyxOLnoMjhcRx4jEIws4TV2ODADYgsCCS6+dwocgc?=
 =?us-ascii?Q?zfhokYYFmJSyt+26RccLp2zJNXNUJTMbNa3kTC4bfMwoG0sBuTSelK2GbdUd?=
 =?us-ascii?Q?+XSjF1BL9e+3BJ3MZZrHrNCUaWWXxgwLmf2BA7EDDE7qDRCyLdQ1+2Dffaj9?=
 =?us-ascii?Q?7nx1yHyBhGga2dehDMkaRa8+Wm8PbVeHeMoF2GzUH5+jGFvTKb63X/kvxFAf?=
 =?us-ascii?Q?ilCLsR/0bDqnh52/mwM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:29.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5518103b-f463-4cc4-58ef-08de2849bc90
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfXxTx4zr7tQ12A
 0Je8VIL48PbISynYCxi1v/KD2aTxVASuEMzqRCZ3zDLlDuFwEYBfgks/OROUb9SP9yXL1ktUjQN
 7ixtQUsUEV2JWyZt82R2sn12UznVrZB83UGyfUO0t6gRko5FIZRKmO2atdEvh7DMvTC0Gt/MXFk
 BAbCyCZ6emxLs0bZ9w6Wx2zfBkW3MlKqpuCwpYo+f5uqNT0KEWkap1alCNEWi+OW1hZPvRdbj/3
 a+11ttfppDZiS/VAAm/Bs5VriYd277d433GLndp38cYLoHkml1YrrN+fhw6BPirvxNt01h5JOgu
 ohtrtN3v+aWKBIGU6BOt4pBZcms9prsl3Kq4qoPSIm23X35HUTlNIlMn3d2JjpEZ5jZC9h67JYE
 JemzVoLXCTfll5u2srQhHdlFMOIG0g==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f341d cx=c_pps
 a=mw7aCRCFlb22yk7hlIuqAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=DoC5RwsOIKO6llIHsRYA:9
X-Proofpoint-GUID: YzNT1a43QwyEYsQvybx6e97okV9OR9I7
X-Proofpoint-ORIG-GUID: YzNT1a43QwyEYsQvybx6e97okV9OR9I7
X-Proofpoint-Spam-Reason: safe

The property name is "mipi-sdca-RxUMP-ownership-transition-max-delay",
with a dash between max and delay. Add the missing dash.

Fixes: 13ef21dffe76 ("ASoC: SDCA: add support for HIDE entity properties and HID descriptor/report")
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_functions.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 0fcc8e82041e2..4cc8420af517a 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1324,7 +1324,7 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
 	unsigned char *report_desc = NULL;
 
 	ret = fwnode_property_read_u32(entity_node,
-				       "mipi-sdca-RxUMP-ownership-transition-maxdelay", &delay);
+				       "mipi-sdca-RxUMP-ownership-transition-max-delay", &delay);
 	if (!ret)
 		hide->max_delay = delay;
 
-- 
2.47.3

