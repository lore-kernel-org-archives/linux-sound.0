Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1777734EF11
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840490; cv=fail; b=UoPcRfI8OsNy1YaRNZAIUW5jFBvrhGkdbzSmSnejhtssz08veHa65/lSZjaOmBPCr7WMRl+JvR2C+u+nnSReiFLeEFaeLDge8fQC4Nf+PbibQtovo5yEOSaUzgJeQPgZO58taLkkTKNmaWfCOOhDAKHx7NGeK4e2u2ujdRZ5qJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840490; c=relaxed/simple;
	bh=+lYO0YgIn0FV+/U8Q/rP+kcCtsSd/ovVx9VOJ4mY304=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6Xs3+ljZn+S25dy98m+QAUQmDljR20AIiFlItqm2pFHkZFM4bUIcfNCsAsxIk0uAoonyvC4a8BodTBK1989hAS+2ej011HYtJem1LNknPWCABy0HbteNTKtbEDdwnuJmPGOITKfrayQFRNGP55QKgRLeML++E8h8y2cH2xD9yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NmVAZcSR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K2g52ie7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NmVAZcSR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K2g52ie7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8HZmQ1324652;
	Mon, 23 Feb 2026 03:54:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4NGZVxdOID1CJS0xTtb78f+zsJX9T21Hhp89KSJri7I=; b=
	NmVAZcSRfYTkrivtjfGg9oomonluTUMhtJ9fLEsXb/4CmXtXhD2TMllMoykK5Qkf
	bcJ/b5RVzboKg2OOYI1JcnJLRxPtF4W5wgc/Vu/y2kICmHKg1pzJ1qXutDUtvt44
	jXgag3CaHwXkSssBtevQdVL25rZv5lI9+UxnIpL2KBlOjKHR4ptDQmM8E2geYuev
	cTbvNFwqehn1cY5W1Bx13U4r2Hs4Kaa+FvF0R65hy3ovUIcz0AH2FDLr65qiOVYf
	BrfyuvgPprdnQ8UcUCZ6G2m3O2WxkpgWTJ9rIn5BODNMJanZccOan6W5TslPd16Y
	V31IcB+jFTA2qwdR6UsLpg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022142.outbound.protection.outlook.com [40.107.200.142])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019bhq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:54:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE8LIwAJNn0DD4nD6YYHP+mT0vCvEN9w3Zon+UsT34OpnmnEl8zKjSh5yvFoygcO8KEPNrGkcP3ZvgrWZVxKhailMuIUp4Mlu+76ZLjYyivsfFq1Cq+aFIXwKO93pvSfQqgjW9VUUBRxJwkRzL/ONRubFfWO8x47FEtH2mPd/D29mM+C8CpWzPTflLatEs+coeB+2RS68enX8lrzHdGXVrudwg4nGfRjsG4x1F08jmya3Tjfxeei6bs69dDQ6f8T1Scnbfab6Ogr6Odu3RtMnnwQYHaOQ9iGT5oQHgf3I0/qMbSf1xzMaeuc27BTpVoSbMvBtl+nEeEgjwwz06WaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NGZVxdOID1CJS0xTtb78f+zsJX9T21Hhp89KSJri7I=;
 b=ioJLW1kCSE93M0dpQwZjwsHrZ8OLCrmZwi3VzkNCP/CO0OWM3OdsiQkldv1/VlmBZB6Wf2KGa+iqGaFI/ReDcqBHTq8dWDKLTYCqe82MmMs6eKvKnCMiKx1fArvcxvczGqkHC1jk+8ru1g7dBJfiJjHhvSy6SX8XycCXwC0a68pLlUqVwnBOeRWSkqYxxdSzb0jXzkdDEftWSsSkVTHKgNJFC9AHFPICfpxSDUOq10Y8NB75AMt7CaoSLlSBegvT8debdBERIqh65+0xPUWrY/PzjLBUQU2PSli2euyK52NXmsO/SXCgR4ixgK91VSoKEp9/O/BiAgVuImbYz6OaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NGZVxdOID1CJS0xTtb78f+zsJX9T21Hhp89KSJri7I=;
 b=K2g52ie7LrsQm2rh7F3dcpSMnkPJgtjYxuuLrukUxHpUKsDsj+RK5H+2OcbNECCdNt0RUWnHPu+c1kfMnSITYczE4PFyGUNT6LBeroVi2rLI+0LSCo3wrUp4Jm7msHsQZ1Hy7dRzVOq4sXi6aKLME+LF6Y7ZydWxhhohPl/bHG4=
Received: from SA9PR13CA0015.namprd13.prod.outlook.com (2603:10b6:806:21::20)
 by SJ4PPF37A7EC787.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 09:54:32 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::a1) by SA9PR13CA0015.outlook.office365.com
 (2603:10b6:806:21::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 09:54:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B3732406545;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 97437822543;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops
Date: Mon, 23 Feb 2026 09:54:25 +0000
Message-ID: <20260223095425.3905703-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SJ4PPF37A7EC787:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d210cf09-225f-4fe0-4341-08de72c18aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?df1ox/lIDM9NZNSTrI33f3+YIfYNgbg4iUzSyGUH4bmtfCfvUgFLcJk/W8zG?=
 =?us-ascii?Q?lnorQ8jZGwk4rF/qJ1odxVaoKiSh2ggO7PjvYuzBZFV9Lmszfm4xP2oKhgkF?=
 =?us-ascii?Q?Qmi79WwlEieXIRa8aTKXkEbZumwaWIBZeERLdD5WMt/KtvV8VdoJd3NUxMDt?=
 =?us-ascii?Q?8a+ntBMm4b5bIgnXrGflRKbSae7Snh7BBoSNhyF6zWNz7546kEitdFzmlF6l?=
 =?us-ascii?Q?DvawaAREaFhbyxLUkS4gL4sSQtEGbFlTgq4HIM2xoy5Z5ssEQ2HYwxd6ch03?=
 =?us-ascii?Q?76aztP3+2weZj+7Pd9SHqn7kiy10oD82Tlhvx1v9LSzfTJV/gnqA+KyMvZL7?=
 =?us-ascii?Q?UTOAj+BEleiJfWZiJAvtJD2rx/IwrWWphIroUJ7PXTY5Dgpk1YNXG/lTeuir?=
 =?us-ascii?Q?FofzDZ9tWfDGjWees9nY16QHE6WEglrb6QJ3L2LeIwER/zQq266zsWQfFKyz?=
 =?us-ascii?Q?BRmXxirmmFwLpiXcz+IgdUdl5ngIGVm6snhxdGaQ0bwQH2wzYzwfXCfSbbWl?=
 =?us-ascii?Q?0UhVIW3xnnjxtNQde26nTivO26NbbC5t7qP9fX3huz8VekJeLXKI4YSWJ/nV?=
 =?us-ascii?Q?6Fr72p71gs5HnewLx7FJMklS5WLsmHZx3cjpfurYtguC5jsIwo4pdzFWZV7d?=
 =?us-ascii?Q?qa9L0g6AqDDkjIi7bvc9hgEEfrmweDh8qUEIOFctuCUP31zp223i5UdLOl05?=
 =?us-ascii?Q?ANebi4ZSSIFqkQYypQ8qD6p+uvJYlu3yR48Jr6VIqX0S+z/X0PCgTQ1QtwQu?=
 =?us-ascii?Q?szvaQKulLElSvFC89xr3Y7Kk+qb6St/xmqpEN5NtuWab9vOALFhr+loZA5B6?=
 =?us-ascii?Q?xT/jqDVgqBxuHqczsuxYjrHbqbI+pm+R8AP0TaDCMA8IyB2A3tJZ7nX+jYfN?=
 =?us-ascii?Q?T4RKFhPQoOwp8SVJN4p9seafSYurJuiYL+QDsdTr6X98jWwn43/RECV9SG/f?=
 =?us-ascii?Q?CdmnS+7zEmFqPWittG1LdRSRU42N/gtfWs2m5xyY5uXXJSqWze9ZhKXY4WW2?=
 =?us-ascii?Q?JKHVhvcn6m+yUkhZLlgkQBMLC5TYSKq4DYQ+oYLn3p4fP1Mp610oGboAD4kr?=
 =?us-ascii?Q?7j5VyGRk8+k1NLIHseHgwBeNmCbBUErUooTtUXHy+tDHXwMidqu0JPJqZ6oh?=
 =?us-ascii?Q?U3yEFIEWW4+wxtQPYcilgH1/dH/N2TdhazQhaB8xaS9QNbRlmqsEox6qiryD?=
 =?us-ascii?Q?Z1HkzrdrJmy/eGB9kJyKdd0yo7GQMv0h07yo7jsxflTxN6l5s+MHXX+pue7z?=
 =?us-ascii?Q?R8XuZ3LTfMfj3jYN0piHlXed+GaL0fln6Pkn5IZfE6ka4F+YBH6IXQjMuXQO?=
 =?us-ascii?Q?V7pQnBEcPhtrM4M0Vldv99k34IOklJ0z9vYyrrqc3gAmgC+HrLCPhSi4CGr1?=
 =?us-ascii?Q?dR5c74wDP/O2gzS7tHPYbQnCgQ908WLHzM0nuvq0mhnXhGyV7hEJep7RBbUx?=
 =?us-ascii?Q?LqxFbRCXl9fvfvKf/Sak4xuFiNPMOvf1xTWdq5GYzm05+XV6QnqYshVZICo7?=
 =?us-ascii?Q?oxDdwLAd6VOQXJ1lvXP5TFMEBPFap8iXSFBZr9PEe7CLgEcYbl+hVIJ6peB4?=
 =?us-ascii?Q?zFhcWutjJ/V9+cRHE7ijddMiTtXq8D0054fsX+zT3wP7ToGyKV/do1dufIxr?=
 =?us-ascii?Q?V9qxNuW2boDc52vMjCXEWvcfbKIKTHCYE3w4UHC7PSlA+N3gsjcg0v22PRub?=
 =?us-ascii?Q?PTI32g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ykJRKN6tTESW8e/ft5KGS2vLs1hXtHX6y8ImOXhOjcO67IqHo4fFfFyGRQziBmwFfjhSgFpSYhFc08UzOFVKWYhWintbj5OOrbioi//XzzXM6JG1VQrAThMSB2EW3fwco+YM4isFvDjk+s6ZZXCXmgYmy9ExOO0+16Kge1DZtajg6+hcd5IQkfrEa5/Hd14dUjO77g0CGrWc10sF/oPt5ZpxCz8YQJAHk3BOesk49b4f/hbPdSnenOML6We4uLrp6o14VkchHU3QdV1pqDpbdW6WG2R1guMKu7JS8XfHCt/vgLR2qCVHhqBSzD0zyiEpgD/hGUgksZB8u4YdovRvLeP/EfjCvBIjR8SEdNctjcZM9fI4BS1gEgYcRbsOnYTJ7YxMexO3r+84GmUhRQapivRa00sOBoXI//EdvIc26mr9rF0l1aqKm3wDZ/jHT3VU
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:54:31.1408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d210cf09-225f-4fe0-4341-08de72c18aae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF37A7EC787
X-Proofpoint-ORIG-GUID: 76bI8TJmU8eQ6I1ST6nafl3t8ocOScyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NSBTYWx0ZWRfX6+YgDZkIOIWV
 WAWtefFOBIGgalO0msUIu0zpTn2CAxcqRltvub9uAV+hWZk0yC3MCvnf/BWjG496JH+leyIzMXO
 iuzGvA7wWSurWRYimFMhbsUxw8XC8S//voGNPG6mXTdMteVui2O+PVhO5rbn+Vwx+exj4HtYpxy
 YKy85ubOolHBXdiwYWcqbAJqwo3RjYWyINRYP2YL9CpotOjeqPe4KUOtRdS2NiCTb36s2qvF7L0
 rlHc4f6LblE6OpJbsooinD5ZUWpFTOmKyPdNMOVU2uOE8wJ7dOLX3yUrkX++5dBzQUdm27lQ0fJ
 NWtIvkyWWCrhcXB6/nWfhoLPdpCl5XNVB1cUdLXPAnsZbCQ20C4HDQlevP1P6at2NeJBElvbded
 bBoY/urXW44oCIvly+T7wpSne5Ln8fJo6k55tAKGe2mIjjdpXxeDNlKTC7wrlJom/nA12L8g7Gz
 Ry7NQ6nnpR3Q/L9tnBQ==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c23db cx=c_pps
 a=ZYZ/Q8NX4HZ9jJqYi7XSpw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Ti33vBYSVn-O3lftRNsA:9
X-Proofpoint-GUID: 76bI8TJmU8eQ6I1ST6nafl3t8ocOScyC
X-Proofpoint-Spam-Reason: safe

It is cleaner to keep the SDCA code contained and not update the core
code for things that are unlikely to see reuse outside of SDCA. Move the
Q7.8 volume helpers back into the SDCA core code.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h        |  1 -
 sound/soc/sdca/sdca_asoc.c | 67 +++++++++++++++++++++++++++++++++++++-
 sound/soc/soc-ops.c        | 55 ++++++-------------------------
 3 files changed, 76 insertions(+), 47 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7d8376c8e1bed..172bd68e1315f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1239,7 +1239,6 @@ struct soc_mixer_control {
 	unsigned int sign_bit;
 	unsigned int invert:1;
 	unsigned int autodisable:1;
-	unsigned int sdca_q78:1;
 #ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj;
 #endif
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e6f7c2778bec5..a342a4e56717a 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -805,6 +805,70 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_dapm, "SND_SOC_SDCA");
 
+static int q78_write(struct snd_soc_component *component,
+		     struct soc_mixer_control *mc,
+		     unsigned int reg, const int val)
+{
+	unsigned int mask = GENMASK(mc->sign_bit, 0);
+	unsigned int reg_val;
+
+	if (val < 0 || val > mc->max - mc->min)
+		return -EINVAL;
+
+	reg_val = (val + mc->min) * mc->shift;
+
+	return snd_soc_component_update_bits(component, reg, mask, reg_val);
+}
+
+static int q78_put_volsw(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = q78_write(component, mc, mc->reg, ucontrol->value.integer.value[0]);
+	if (ret < 0)
+		return ret;
+
+	if (snd_soc_volsw_is_stereo(mc)) {
+		int err; /* Don't drop change flag */
+
+		err = q78_write(component, mc, mc->rreg, ucontrol->value.integer.value[1]);
+		if (err)
+			return err;
+	}
+
+	return ret;
+}
+
+static int q78_read(struct snd_soc_component *component,
+		    struct soc_mixer_control *mc, unsigned int reg)
+{
+	unsigned int reg_val;
+	int val;
+
+	reg_val = snd_soc_component_read(component, reg);
+
+	val = (sign_extend32(reg_val, mc->sign_bit) / mc->shift) - mc->min;
+
+	return val & GENMASK(mc->sign_bit, 0);
+}
+
+static int q78_get_volsw(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = q78_read(component, mc, mc->reg);
+
+	if (snd_soc_volsw_is_stereo(mc))
+		ucontrol->value.integer.value[1] = q78_read(component, mc, mc->rreg);
+
+	return 0;
+}
+
 static int control_limit_kctl(struct device *dev,
 			      struct sdca_entity *entity,
 			      struct sdca_control *control,
@@ -845,10 +909,11 @@ static int control_limit_kctl(struct device *dev,
 	mc->max = max / step;
 	mc->shift = step;
 	mc->sign_bit = 15;
-	mc->sdca_q78 = 1;
 
 	kctl->tlv.p = tlv;
 	kctl->access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
+	kctl->get = q78_get_volsw;
+	kctl->put = q78_put_volsw;
 
 	return 0;
 }
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 8ae6609ca9618..ed76ea81e6ec4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -110,29 +110,6 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
 
-static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-				   unsigned int mask, unsigned int shift, int max,
-				   bool sx)
-{
-	int val = reg_val;
-
-	if (WARN_ON(!mc->shift))
-		return -EINVAL;
-
-	val = sign_extend32(val, mc->sign_bit);
-
-	return ((val / mc->shift) - mc->min) & mask;
-}
-
-static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int val,
-					 unsigned int mask, unsigned int shift, int max)
-{
-	if (WARN_ON(!mc->shift))
-		return -EINVAL;
-
-	return ((val + mc->min) * mc->shift) & mask;
-}
-
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
 				unsigned int mask, unsigned int shift, int max,
 				bool sx)
@@ -226,26 +203,17 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
 			 struct soc_mixer_control *mc, int mask, int max)
 {
-	unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int, unsigned int, unsigned int, int);
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int val1, val_mask;
 	unsigned int val2 = 0;
 	bool double_r = false;
 	int ret;
 
-	if (mc->sdca_q78) {
-		ctl_to_reg = sdca_soc_q78_ctl_to_reg;
-		val_mask = mask;
-	} else {
-		ctl_to_reg = soc_mixer_ctl_to_reg;
-		val_mask = mask << mc->shift;
-	}
-
 	ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[0], max);
 	if (ret)
 		return ret;
 
-	val1 = ctl_to_reg(mc, ucontrol->value.integer.value[0],
+	val1 = soc_mixer_ctl_to_reg(mc, ucontrol->value.integer.value[0],
 				    mask, mc->shift, max);
 
 	if (snd_soc_volsw_is_stereo(mc)) {
@@ -254,10 +222,14 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 			return ret;
 
 		if (mc->reg == mc->rreg) {
-			val1 |= ctl_to_reg(mc, ucontrol->value.integer.value[1], mask, mc->rshift, max);
+			val1 |= soc_mixer_ctl_to_reg(mc,
+						     ucontrol->value.integer.value[1],
+						     mask, mc->rshift, max);
 			val_mask |= mask << mc->rshift;
 		} else {
-			val2 = ctl_to_reg(mc, ucontrol->value.integer.value[1], mask, mc->shift, max);
+			val2 = soc_mixer_ctl_to_reg(mc,
+						    ucontrol->value.integer.value[1],
+						    mask, mc->shift, max);
 			double_r = true;
 		}
 	}
@@ -281,28 +253,21 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
 			 struct soc_mixer_control *mc, int mask, int max, bool sx)
 {
-	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int,
-			  unsigned int, int, bool);
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
 	int val;
 
-	if (mc->sdca_q78)
-		reg_to_ctl = sdca_soc_q78_reg_to_ctl;
-	else
-		reg_to_ctl = soc_mixer_reg_to_ctl;
-
 	reg_val = snd_soc_component_read(component, mc->reg);
-	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
+	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
 
 	ucontrol->value.integer.value[0] = val;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (mc->reg == mc->rreg) {
-			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max, sx);
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max, sx);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
-			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
 		}
 
 		ucontrol->value.integer.value[1] = val;
-- 
2.47.3

