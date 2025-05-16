Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B523C505
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401033; cv=fail; b=eFf7V2CSzvyaun90qHp3BVk4+WnBQeWlb68HltZyc19FCfPTEUE/AUuIhIhtoIL4J0AMrIKhUYMpwVkbAvnT1ib/iuj55gdAXaGHKTYZfDn5eFIkBz4+O6rxZMjbLuNYmM+C55TldnxOCr+e8cC/WonyAOcUNcKm5GNFRoyrXWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401033; c=relaxed/simple;
	bh=iwcd1Exm62cSUxX6O7DB61IXip6HLR5jEQqZWfyogoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FgLaempJ8tr+OhGb2fx7MLSvzC2I8SkdM74769TGziA+xWFHgXtO6GjDOM8ftR/riEBlhlChZ/sWmdESvLlvSlWk+O0MbXzcjcSuBnpnD63mZHqnxXb3znCl/yskQjyyCp2DYmW+hECSvOjp+vF+SqYhqqmK/jCoicrc79DT46E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=M2zvKbCw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NwrjpRqL; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="M2zvKbCw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NwrjpRqL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G2t9Wc024873;
	Fri, 16 May 2025 08:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XDdZoEeEE87LsIh5pUs/F8FACeGSvb4i5h/Enij7muY=; b=
	M2zvKbCwEU4L6HaQRhmL7OhqiA6aqwfIwddjWLfubMEWDD6bNubHKDMN4ERXHfyW
	h0AymT+vwCIraKzv1SstmgZxfNuZXerdM/Ll7JsQ89+z18ImXe5m1jOeHZSnLzqz
	98hbkhj/BbujQvj0A0882uMvCZFBsTy7gw0cEt0Bt56+XUXqxBG/zs1nWxHCWujl
	8qLomaiJEoMPJ0VVOo1Jjpy7hxZkgbQ3qg1+MOU82Z6JbcM9uijGL4XyJWrEw7SP
	slwX53Iy1zuhuECZaG5YjycfbAi2CXAXU7L42UctB2I9q3P8siBjx2BKAI/sJTAP
	/2qzNNlT2MB0nrIeokeq7Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcptc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzHka8J57vIrym8+qEvzOfJ+Ah6p6TihGfllEFgZ7gh22JCXXoYAZw8PenTt4WECEL90YMMrHnieX1TudRv5K/PI5OEut4k2gG5Q4hRcbxJ5GiyFIpyLa324o5jzhzeup61NW5pEAZl4Su/osDRKCpFbKx+BT8d/bW787JhHVpovc32IvsKUeOL9wdu1eTWor/XTPEd1E7vTrIgs4N3LNICcivkzhdu3983cPS8lUCJBYHbV8x+fwgL648G7U+iC5z71SXXe4vLfKlNERioQkQ3JGOOOeNlKBKuBoY5j6l+tYQZUtJaMpVidfEIv2qJTRVi1EJRB0iXpkHs0BxsVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDdZoEeEE87LsIh5pUs/F8FACeGSvb4i5h/Enij7muY=;
 b=IFsAQ0ijrPNb5PT5rgdjCSfF9KeCCNb8ww55Z63BwrteuGOrNZYLMXfo346zK0a6hsjw8cL8Ta1E6sFpeZ3xn66B03TCdHu1zLuNJMUO5ntQ5rvbxcW81sYCf/75eOroYdtu2xpiZ0qR9qq+OEd3tePBrRv+BxdcFa3c5FKHvS4k6DpT09lzGEP9Wlll//hG4KpkwpuqHCCMfh5Mz/UihK3Kx2cX3BoFryf5VokHKtvNFGJm3ch4zeZL1J8Xtn+/vXdwyIF4WMdcjOPD2wtxMlPaU3g8npiBpzM4FC32MwYhI0BPapDHt1HkK5NqJ3w+I0IPlNvJT2VLCzSEVmfMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDdZoEeEE87LsIh5pUs/F8FACeGSvb4i5h/Enij7muY=;
 b=NwrjpRqL0bZ3yhuUIMZY2kaHAtWwPVyuEgdoJkFJrkPMDGEhc50wW01PUb3NfN5xqCT1IrNdPiZU7SrW6VIENjX2T9C7RL86hHIm3CgKMavpr01NHv5YR7iul65U7j2IdaNR/eN044eTg4ysFXxF594h7t2C7vzKa2/fw7xG+qk=
Received: from MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36) by
 SJ0PR19MB4510.namprd19.prod.outlook.com (2603:10b6:a03:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 13:10:14 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:907:0:cafe::fe) by MW2PR16CA0023.outlook.office365.com
 (2603:10b6:907::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Fri,
 16 May 2025 13:10:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 13:10:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 05A64406547;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E1363822564;
	Fri, 16 May 2025 13:10:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 1/7] ASoC: SDCA: Fix minor typo
Date: Fri, 16 May 2025 14:10:05 +0100
Message-Id: <20250516131011.221310-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SJ0PR19MB4510:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1d34a70a-fc32-46b3-0c97-08dd947afefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u0A8HF1C8iuSmp7RFKVA9LTZy6XXcqammxkEkdfTiFEhphfrmccr5ZC6cK7+?=
 =?us-ascii?Q?YhqTamICYuHiGmX+KVqtC1ySgDKvzU5vnLM+Ark/S00jUYYMvZ4eNUN3Uky6?=
 =?us-ascii?Q?ZzjkErPens93o7n0Q8NWEhLbvfaeqYB7YVHeZdouulhvrrSrWe7gv8JjIdca?=
 =?us-ascii?Q?sXUTf5GmQ35OCliF6mjDX2sEMUsg+nNbYfxIRqSWImWpLxEvr/CV8r2SuE5y?=
 =?us-ascii?Q?buMEvyDKasdKUTh0lQ4A762Ce+MZGghwvDeE+6MdaGff/4BzkYZLuDdB6fiZ?=
 =?us-ascii?Q?33E+xIl58pz5q5awMzeSc1ShZnukDKbisb7bMlZUnZmwB/DAChkPmLfUqyCk?=
 =?us-ascii?Q?tu1Xnbcd5TcBEjGR+LENT/7Kgf9gvbJWeJUNvWVHaI8PyQzdsVC6tAMSpDB+?=
 =?us-ascii?Q?9TjIXJPzaFI34w6xbsHKfP1xw52G5tznfSM4lGfARwWgeN8tR3Cyah0e9Bt0?=
 =?us-ascii?Q?xdGp6DMUJapcDaSyJBbTOibtPRwXUiDcMAMGFSE/9zHu6QJwHnyxBTl3J+3b?=
 =?us-ascii?Q?2IRBlP9jhkOIPltyg9uKOaY2/mUAZVJJ3nXQnkJCNu03Bb+28KZA/ni8SlW+?=
 =?us-ascii?Q?uBnjHBLpYwlruYRPPp6kN1N4pwChJDt2yRYTC5w48w2T4hNItFyC7XxYcpdL?=
 =?us-ascii?Q?s6d785twCJaUk+kDdiz7u737EVEEModMoDgoKvhP2qZNhniCIpuB8IFTaduy?=
 =?us-ascii?Q?hc6uqs4u1O5WYjziA6YjE5Vq2V8mwSh/o3l2KR/0/YytyG9yEBA1HaQyomAD?=
 =?us-ascii?Q?AVoNL+ayTLF0YVTs/IwqVNFHlwSY4Ri3jsEjCWPLsvh2vZHmYWY5vpY4sTAp?=
 =?us-ascii?Q?bCQ3bOkKb6cFOQFv7gZiqxoiusg6z769bD/VqbEK0KDR1eIYyWA65D28bCC0?=
 =?us-ascii?Q?Nr+VosqBTD2V6gGR43fHGMXNIxttpNVaXWoOrIf8Jvs171DuWnTqg3UTGYoU?=
 =?us-ascii?Q?sP5jLbvg9JLOxUp9ez6l+o+ryxn4pIApRtkpZ/gT/o1oXJm+SyaDlm52P963?=
 =?us-ascii?Q?YxskbDnFM3lsTiUZieu93LRz+wr6G8IsW5Li3S7bSn/QyhJbGl0ZR2CoBqKE?=
 =?us-ascii?Q?+F7+U1qliLCYCZeNOXsb/XPYpYyBrs/q5swCDORp2p2G3s7gPbhv2xe8RILm?=
 =?us-ascii?Q?3/AiCFHSV6UMxYg8TLbkpxuYwjU+GawyWNCwfhiW7EPVR2JWyL6bnE4iQ4kL?=
 =?us-ascii?Q?lh8Joe2cWc/zlr9aifcWyOaGZPOHCBTl68v17nmCe3iuCjnJb3/xmR9iJs/b?=
 =?us-ascii?Q?ek/S2Mq+Nk87a4MGe4jM3KNYr9HLsGvioq9KocLmNWFykhGLY+iQ5xInsMbO?=
 =?us-ascii?Q?kT5CZUJ8yyrspqY+iePLitB7OKK0dBbpPHYaWD6jQIMg4AKsyk6Jh2PYaozH?=
 =?us-ascii?Q?omgy5lUPgxI1djhgwGnhxxwH6cXmvYfCOFzDHIqsxGIYG0T7EPp7e/8DL2dp?=
 =?us-ascii?Q?1n0bdeorYKsvEQA5QTMdv3RPWy1YYDbazcF20X9ZajZ8/m9OdRwqmSBv+qZw?=
 =?us-ascii?Q?xmGR/lyRV5lDZX8hfFRHKWeWeONtN2inbgRy?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:13.8002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d34a70a-fc32-46b3-0c97-08dd947afefc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4510
X-Proofpoint-ORIG-GUID: Q9aFFgb8laqbf_crJzgm2EsyOrdjHYfN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfX7d/66lhILMFg gQZ32lMeoIjuNQoKpwZRHob/JTzyPeGt0ZQ50JlFc6+UimgWe5mOCLwDnSwJ4/suqOnVqDp9AXJ prQYY9A41s6GmlE/g2P+5taNjnUGvp8APKcQnLJ0TzlrzmkSBSDzYaBgv4o7JHLcPod1gKKrh7Z
 MI1pAXo9EkjWwuvwWuET47Utx5lv2JrF7XkUU0KxXcn+5lNUptYppNG/N5YwcfeSn8SWQrinqMq y0A/oeBstjVproEBzrG+9yBXpRaiBCzZ/C8v4wJeN86BGR9VI41SC7JkD0BIxcnqGTLQsYoS5fd SXr7dPcrEtf2Xf0ZdzXiJcsDx83n9h7i/AV44eUPBi3yGr4r5B1shjqQfHUNHSbRfEXxxE8CxfY
 DSwHachyIcE6Mu9R8J/bFWH8GQhZ0CNLqpGPRxre1jgYi8XzMceoVWIUn5c0t98syI5OISxa
X-Proofpoint-GUID: Q9aFFgb8laqbf_crJzgm2EsyOrdjHYfN
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=6827393b cx=c_pps a=zzjaJ2HwkiRAih7KxKuamQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=uKT3ldZxRuD5XvpuCSUA:9
X-Proofpoint-Spam-Reason: safe

Fix minor typo SDAC -> SDCA.

Fixes: 42b144cb6a2d ("ASoC: SDCA: Add SDCA Control parsing")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v5.

 include/sound/sdca_function.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 253654568a41e..e7165e4f15c42 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -125,7 +125,7 @@ struct sdca_init_write {
  * macros.
  *
  * Short hand to specific a Control type statically for example:
- * SDAC_CTL_TYPE_S(IT, MIC_BIAS).
+ * SDCA_CTL_TYPE_S(IT, MIC_BIAS).
  */
 #define SDCA_CTL_TYPE_S(ent, sel) SDCA_CTL_TYPE(SDCA_ENTITY_TYPE_##ent, \
 						SDCA_CTL_##ent##_##sel)
-- 
2.39.5

