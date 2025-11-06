Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3943115A5
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429491; cv=fail; b=f2jRAj0U/CXiEWKvTjfhyOnE6pn3atGxQwq68yTN/E6VhyjNxGf3Q9JUZ9cCKR+vOO7ic2VrlB49sDfuUSFDEb23+Uwm3qgtcWWe7mKiugZNwI+UBX4u5vumz2OxIwzlq2MZZR6GZc0cCUbS1i+e2DjE9MwMYklbOt1JSqJmJhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429491; c=relaxed/simple;
	bh=TxqnaNeH1WHn/QmnAYtG1+I/kd/7suqmKDy6X9vRgPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxRStuYrgVWooYXBA7c9AADHI2zEouMG4c8XH1atVbHaHdiZmhcOWDkD9FE/mLikCTWtR0WpuE86wMMZrYODdfH22coEFIkRhXTSN3scZ5YiCfpk2H4G8Vj3SQNEXArFoix+Xk5s9n4nQzvXaL+FSoA+1zsOKfieAieIaqQIW/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZByF4x89; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=t0edVtma; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZByF4x89";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="t0edVtma"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A64LnNv061968;
	Thu, 6 Nov 2025 05:44:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=D2XKspQj8ObTHV76UK7fKQNTq4ljuqFQWXKhL9nLAjI=; b=
	ZByF4x89N9KjnXcn9K1AojTWYJUgv+jXPN4xCgo0+cWHJddV9ZX2V9/5NO64J0jc
	fH4AWwzlZLOy5BFxH1xk1vFaBHDPmDf7P4GJAUfUednaknfsOzEcQDLzXeffcrb2
	gRTLMMJxCsx9keGIUBhqwXmsgp6Ws32QfuTeuJ1aBusOX0tOINA38ikxt2fe57VD
	LU+hdHvu/cVBWMYCeeVGwbSi7DUrkzQcLAj/m0riujXIyRoQJChJY8FXzh3bWAio
	feR5v9K4/47Ziw2gW90MgpyGb381+NrqMJiAFNXxVMCYlXF2hj3AHvjd2Mauqh93
	j+fDOZnYmHHFSFkrn5NyCA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022091.outbound.protection.outlook.com [52.101.43.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx3b5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR4kOxGoNX2bPMzvZTz0E7gDuI0hcMEkCDabl+N0hJ2x2siScoBHultR081MRCUKHiD0+xUww6D/f9RXURrXRtY81/1E26UzN/eS62ZPDgrN5TrpmWO23/0n2N7jCQvgbXkPBzj88RP4uHsOq5fxK93fs51UiQpeiMSN/2EF7fds0fGtNR61W6gmLxbvJT8XYFTAYd12kbWw5FVU8MUC2reQQQ8OneU/BZw1aag6y4faEFc1a9troN8hAEf4QK1eoQR4TEa14pgYXCX3FR2+5Rr6/ZhCf+jvCygaGspoMnzZ6f28iyNVGWuKC4pemkjEKD6OQibuOH0jNbgSwyWwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2XKspQj8ObTHV76UK7fKQNTq4ljuqFQWXKhL9nLAjI=;
 b=oo7TUPDFT9DGZ5zOaHEufQx7RxFToPQqeN59zkW4EG4HgQ9HpK9JTJ6YU7A1lrAXh1G+s0ZYOBUe88xWUvOzKIx9GZMx4TAv9ZV9qs43t18eV9PPwMpWv542/hzs8/fjdrvS3OrOCxcjVjddhtLdK1l7iHmuMm21UDAND9NIDeahp8tUksdESEHeWaEn1RmbJ8jFKTZESGa3z6GtJKp+j3F6D0PhFSlQfKSB85hubwKf4tRwHMLa01XgWZtGpG+y37nHyFeSXyzLrovo+kdRhIiI3W3aGWPi/Ahp3sqn0pEX/bEkYDeH+2RemOluo4K/9O7HXJW7gyi1HatH30j63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2XKspQj8ObTHV76UK7fKQNTq4ljuqFQWXKhL9nLAjI=;
 b=t0edVtmaF3XGx1eiD2RiQotkcA7qu8oZHtWR6epi1MhPrragnquIbVl4JpgLbk39T38ITqpTVvABdH75ug/ZCnoizAmi+rO7tHgADCUWsZyhFdF2h/TF59rpA+LqeKITmVt/WxmdPJufnGxSHJtFjE+wtdavV8ColiAZ8MItwnY=
Received: from MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7)
 by IA3PR19MB8762.namprd19.prod.outlook.com (2603:10b6:208:512::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 11:44:30 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::e2) by MN2PR16CA0038.outlook.office365.com
 (2603:10b6:208:234::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Thu, 6
 Nov 2025 11:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0475E406540;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC368820257;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 06/13] ASoC: SDCA: Move most of the messages from info to debug
Date: Thu,  6 Nov 2025 11:44:15 +0000
Message-ID: <20251106114422.906370-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|IA3PR19MB8762:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1669c277-882d-43dd-75df-08de1d29d89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sWXWfUL06Qs7dmxhuujS87YSWEw+BXjUbZAK3PdXofkv0uKsANpclNyzggPz?=
 =?us-ascii?Q?rg5vhh0lF23C3jjrz76Mb2BgwB56G1tTD6r3S6wB2KffO38fXfBx52aRRqOU?=
 =?us-ascii?Q?72G1kI3s+TpKibpkvH8R/OTs5BdJvpbQWxAJgyjRN81oPfL5AEwiDjS0CsZs?=
 =?us-ascii?Q?rMNjShj1xOFu2gwWIXA3aINaIBVUg/mMv6y8sL0GQ5jWNIpmz7BnOloQm5xt?=
 =?us-ascii?Q?vFWOTPn6rraTn9GUi5AkO3M4lw1wItvtXJImi6wlQQkRHGsfwvrWT7XJ19q4?=
 =?us-ascii?Q?UjuIFzwvrOhqAlMehnBFfpBVZP7kbb8nc4tYTtSJtGH9cK3f2BQXzpMRQEK/?=
 =?us-ascii?Q?lr/jtI/RTskcoC+J82bfA2pMblcqfgftQ0+fFucc7e7/s1U8SLCiTVgCC2Id?=
 =?us-ascii?Q?plHjXkSYIU4ttUHRDCjonAYY/zLW6Sqyd4uZmj1/2IpDj903lH8sO1vqvYMp?=
 =?us-ascii?Q?fSY4deVdihsON4gvHvwhT+yesbCM0tug3F+pGH4HYMI3YBC1OejS5RM3kGfh?=
 =?us-ascii?Q?70gAneFxk+bWeonOXT1JyJSPsHXmwBGYw1vhBsjivs7iyRfAO8NcYonK7cWs?=
 =?us-ascii?Q?tQHPTh05SV/rMX6gDZMFgdg/Mty6eqN/QdYCvwaMXJPwFMFPHNEyyYeNWkOr?=
 =?us-ascii?Q?wAmGeVe7z4nSU7ifsCRkmPu+TlsvUdWM6lO6p9UMReU9r8DHy8e5wq0tBTnX?=
 =?us-ascii?Q?YFeOj2CXQGQiJez5Yzpw+MX2KoSz/tBquW/kHv68pLYY8h/eLRDHB4l9zRk8?=
 =?us-ascii?Q?COUTSHeC6kkLVPv0eLaSTUjhfRMNJMrazE8YLLmv/+nSZdZD3zG5ozNc/acd?=
 =?us-ascii?Q?pyCaWeTVl9vLUG0LSTK6F8cT0ugdh2vcrXHbrSepdM5mZoZ6r/LEbpwSy+6P?=
 =?us-ascii?Q?A7FAeMs+37HVliLsSKK3FQFljw3C21+DG83wZc7CstFCr/QL8Mvwl3+oI3Y0?=
 =?us-ascii?Q?9h3VT+nK01v5MybNN/3NZauVcQTUoGB7uKwdLsTkxqx3upf9/eFm4tNK3kaj?=
 =?us-ascii?Q?/MmPaMnNdCMSRSOld/B9i22nT45JKVx1tiFMPVH4YRnmvJDGsIgTxtpH+hzU?=
 =?us-ascii?Q?9f+ezoAl9ZZ32EOy/Hqqf2gKc5a+WqxMkHdPWvZ68Vt6sTvqwdv5Rjvw7CL1?=
 =?us-ascii?Q?AVUeR6bd8CN/7wMT9o8dGGZMEydo86wI/W9DTcNIzWrNm69tt4STZrPY2TeW?=
 =?us-ascii?Q?c76+iOrQOl9FEcSCgG7nNTRLwnncNGhfzEPBtMh5EzSdPkMeZ1gGegq5VfRP?=
 =?us-ascii?Q?3sBJl/z9PTgCipjxsTuZ/S1W2rFvhFgfoTwvFEgmSwp5Nl1JA8vdtoJes59r?=
 =?us-ascii?Q?rKrIhyPixANSwPgK1IHmKeclHIkweR6VFjHDLxw9uF81TtXRLWb5oLG5LIVS?=
 =?us-ascii?Q?b0Lb34xpnMx+VuypUCM/g9Kn9b/MyUdZosWl0me027IizoH5oWjnlRxGFNL2?=
 =?us-ascii?Q?V4A7BNTW7jPJ5kk2SW4TVVLUA5wdnuA6Nxf5TE63iLI3xj6pZs7tmwiNCizW?=
 =?us-ascii?Q?6lVpf57WDFkHEpEnGphw4bQezVx6F8pLwZgOcynyH9VquHPOHSXwSEay3pX1?=
 =?us-ascii?Q?9fuaxjGGNyZfp0zCKdM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.5996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1669c277-882d-43dd-75df-08de1d29d89b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8762
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX91HMfchNtLc0
 RjlYVNhcMCG41kHmMLECHffuRq9JVwYaZBhA9NuASfIGbPNaVdjuFF6mjWJ1CE7x2xnXoRAT8Dq
 55fdoe9bvR41/Skgvboe/lO1R2+uSq6hNnSIR0eyvoiKQ6naLwrlwaeXwlefSlCpKvf7GvvfzhI
 G5jvbybDmJ8DnAwA17o4En/i3JLE6RCF3PmrmGriwXcVWTyUkyBR7eT96VH4Ug6tj4vRIc9KOoN
 5+1b8I5wKtwMwRuY/ha5Ju+v2YSqHStYtV/B0R6mkzG192cv9gYec1dpNSMzVnsbQqa8qg6cOdp
 24mkTLDUaH5E1OhdGKwLWzut55LaTgafF4CaZcCsVJgr918pOPbkV2i2PYz8mr9gLvAXQzGD439
 iUpE2kTcIjbUBfEo3aBDYmtF9Ztq/w==
X-Proofpoint-ORIG-GUID: LP8CZ9mH-nPk8upL4A4r-2mWH78LF48I
X-Proofpoint-GUID: LP8CZ9mH-nPk8upL4A4r-2mWH78LF48I
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c8a21 cx=c_pps
 a=Dm0nEerhk2+Yr7xs+kkSBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=Hn7rbmIsdNXIFSUQGigA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The SDCA code is very spammy on boot as it prints a lot of parsing
details using info prints. Now primary development is complete move
these to debug prints to reduce the spam.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_functions.c | 50 ++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 8ebc5161c9f85..417194909abd5 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -6,8 +6,6 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
-#define dev_fmt(fmt) "%s: " fmt, __func__
-
 #include <linux/acpi.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cleanup.h>
@@ -1010,10 +1008,10 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 	control->type = find_sdca_control_datatype(entity, control);
 	control->nbits = find_sdca_control_bits(entity, control);
 
-	dev_info(dev, "%s: %s: control %#x mode %#x layers %#x cn %#llx int %d %s\n",
-		 entity->label, control->label, control->sel,
-		 control->mode, control->layers, control->cn_list,
-		 control->interrupt_position, control->deferrable ? "deferrable" : "");
+	dev_dbg(dev, "%s: %s: control %#x mode %#x layers %#x cn %#llx int %d %s\n",
+		entity->label, control->label, control->sel,
+		control->mode, control->layers, control->cn_list,
+		control->interrupt_position, control->deferrable ? "deferrable" : "");
 
 	return 0;
 }
@@ -1134,9 +1132,9 @@ static int find_sdca_entity_iot(struct device *dev,
 	if (!ret)
 		terminal->num_transducer = tmp;
 
-	dev_info(dev, "%s: terminal type %#x ref %#x conn %#x count %d\n",
-		 entity->label, terminal->type, terminal->reference,
-		 terminal->connector, terminal->num_transducer);
+	dev_dbg(dev, "%s: terminal type %#x ref %#x conn %#x count %d\n",
+		entity->label, terminal->type, terminal->reference,
+		terminal->connector, terminal->num_transducer);
 
 	return 0;
 }
@@ -1162,8 +1160,8 @@ static int find_sdca_entity_cs(struct device *dev,
 	if (!ret)
 		clock->max_delay = tmp;
 
-	dev_info(dev, "%s: clock type %#x delay %d\n", entity->label,
-		 clock->type, clock->max_delay);
+	dev_dbg(dev, "%s: clock type %#x delay %d\n", entity->label,
+		clock->type, clock->max_delay);
 
 	return 0;
 }
@@ -1214,8 +1212,8 @@ static int find_sdca_entity_pde(struct device *dev,
 		delays[i].to_ps = delay_list[j++];
 		delays[i].us = delay_list[j++];
 
-		dev_info(dev, "%s: from %#x to %#x delay %dus\n", entity->label,
-			 delays[i].from_ps, delays[i].to_ps, delays[i].us);
+		dev_dbg(dev, "%s: from %#x to %#x delay %dus\n", entity->label,
+			delays[i].from_ps, delays[i].to_ps, delays[i].us);
 	}
 
 	power->num_max_delay = num_delays;
@@ -1444,8 +1442,8 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 
 	entity->type = tmp;
 
-	dev_info(dev, "%s: entity %#x type %#x\n",
-		 entity->label, entity->id, entity->type);
+	dev_dbg(dev, "%s: entity %#x type %#x\n",
+		entity->label, entity->id, entity->type);
 
 	switch (entity->type) {
 	case SDCA_ENTITY_TYPE_IT:
@@ -1620,7 +1618,7 @@ static int find_sdca_entity_connection_iot(struct device *dev,
 
 	terminal->clock = clock_entity;
 
-	dev_info(dev, "%s -> %s\n", clock_entity->label, entity->label);
+	dev_dbg(dev, "%s -> %s\n", clock_entity->label, entity->label);
 
 	fwnode_handle_put(clock_node);
 	return 0;
@@ -1670,7 +1668,7 @@ static int find_sdca_entity_connection_pde(struct device *dev,
 			return -EINVAL;
 		}
 
-		dev_info(dev, "%s -> %s\n", managed[i]->label, entity->label);
+		dev_dbg(dev, "%s -> %s\n", managed[i]->label, entity->label);
 	}
 
 	power->num_managed = num_managed;
@@ -1805,7 +1803,7 @@ static int find_sdca_entity_connection(struct device *dev,
 
 		pins[i] = connected_entity;
 
-		dev_info(dev, "%s -> %s\n", connected_entity->label, entity->label);
+		dev_dbg(dev, "%s -> %s\n", connected_entity->label, entity->label);
 
 		i++;
 		fwnode_handle_put(connected_node);
@@ -1890,8 +1888,8 @@ static int find_sdca_cluster_channel(struct device *dev,
 
 	channel->relationship = tmp;
 
-	dev_info(dev, "cluster %#x: channel id %#x purpose %#x relationship %#x\n",
-		 cluster->id, channel->id, channel->purpose, channel->relationship);
+	dev_dbg(dev, "cluster %#x: channel id %#x purpose %#x relationship %#x\n",
+		cluster->id, channel->id, channel->purpose, channel->relationship);
 
 	return 0;
 }
@@ -2062,7 +2060,7 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 			return -EINVAL;
 		}
 
-		dev_info(dev, "fileset: %#x\n", filesets_list[i]);
+		dev_dbg(dev, "fileset: %#x\n", filesets_list[i]);
 
 		files = devm_kcalloc(dev, num_entries / mult_fileset,
 				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
@@ -2083,8 +2081,8 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 			file->file_id = fileset_entries[j++];
 			file->fdl_offset = fileset_entries[j++];
 
-			dev_info(dev, "file: %#x, vendor: %#x, offset: %#x\n",
-				 file->file_id, file->vendor_id, file->fdl_offset);
+			dev_dbg(dev, "file: %#x, vendor: %#x, offset: %#x\n",
+				file->file_id, file->vendor_id, file->fdl_offset);
 		}
 
 		set->id = filesets_list[i];
@@ -2127,9 +2125,9 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (!ret)
 		function->reset_max_delay = tmp;
 
-	dev_info(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
-		 function->desc->node, function->desc->name,
-		 function->busy_max_delay, function->reset_max_delay);
+	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
+		function->desc->node, function->desc->name,
+		function->busy_max_delay, function->reset_max_delay);
 
 	ret = find_sdca_init_table(dev, function_desc->node, function);
 	if (ret)
-- 
2.47.3

