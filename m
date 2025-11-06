Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB53126D3
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429492; cv=fail; b=mBh6Z3INQkO99MCwEtnDlqWiU2D1Mtaou5V1fk8BMinT9AbKcINyy1C1Gzicgalr4gYwYhKPoypmH2TQTrJr5eOd7m8kwZujGCGfdXaNfWdpbf1MqreX6dOf+RuIoAWhOUsiAPshfCksvC+u2wznZ/0BkEFN22NG+/AMuNgScYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429492; c=relaxed/simple;
	bh=Ro2Gwbk9a4FFHjmQqdNkD04uNcb9PT5zPW0U48eH6aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWoGjxVXHFWqjpGfsQc7ZQ7k1jC0zd47Mp9pbPfKxAxCOGFhh+Z2WCdAbQkHLiMg5VpYewbhm5YmvbQToGwWDQFRdI5t2nKw9ewhb+bHJvMBCX7d31dcQUmkPMKidJKZCvo5p/EpQwxfdQzu0TRKQGfpd8kYcJQw7xiE5hKhfdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W07iDWrH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Vj6wnCqh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W07iDWrH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Vj6wnCqh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A64hPps098011;
	Thu, 6 Nov 2025 05:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZhuxuvKG9MWL0LjnAwYtwSRRlOIL20DkF2l+4/Tf35U=; b=
	W07iDWrHdYNKXHbmYemXOj9DstJWia+nlzgsBikh7KZb1OQ6CZ2xUMjUeWz4wVEN
	Wt5qoUnll0yEHFWt20EepSzGN5B6jM4LQJaliWn5IHFhwzaUrTvyMYluYvnAPXa9
	dcBoXbYmmki2YQ0iMHIt88VTi9XKMuYeVyAOqCP32KwSvwAuisgvUoPYlo+PTeNi
	Jy44ACQaeun7NEFSTloVLEbTg3vmDYySTb72JFMMs0CDbqJDImSpJ6Y10CaXgdr7
	ab4y810ehZDEIzzuwKRjRp7EzvQvqSJPigEFz/A2cyEQN0a/b1fnPSKE+xgfedIB
	M1ACYNoTO86Lxb6yCoXkLA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021089.outbound.protection.outlook.com [52.101.52.89])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx3b5m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX7QRtHss4t3lhHBET09PZ4MynQfcoLOIisOZMf/JbWNBFV9R0Dn1UrtSp0aJ0CRC98oAhYSBtqL0Vs0JqR1FMkq8LlaFtUpQY4HhwlTur4YfND8Ax3OkEEfH5n2Rvd8ndVFR1dBXo1h20r+GUQtMwUws514nscWWgjc6k3qowH6Mt1FLkzlLvLeuskOxN8peg24sJdFlRjP4Fdos6p943MpUDqc76POmCX/Rr4EpIc7c8kzk5+GQBkzAid+dyQhYEI6DNQQKqxg+jcupAfpSJuaisPieCH0MoG/+MM37t7RN2ai/sTxj8Hpc2xySdAWv6HsV+4p2cCthlmYx+riSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhuxuvKG9MWL0LjnAwYtwSRRlOIL20DkF2l+4/Tf35U=;
 b=yDV1Pz4vlZeAAZ7zVqGfwxNKXw5RcKlDEgn0D0RSVKPCX8qibb76BAV496aR9hCns2RW51BR/WugRBOZW18WDVOB/Z7IH2nx58M/XZt0U2rsS8+R/dpt63ia7ngcPcWzBAa2wwAm79WJSpCOYf5BedP1PVqjJdwWAehoTHM66B7OJltK1CvKPNegrdh8a0vRIkxBc2xIMf7RERh+bFfzMrllrfyV40j/Fcdz3CINi5ZthKqP8OV3mrjr9kZQ0wTrUnu/hYioyimHPDDHRg6dxDP0cxynBh75GNaCEqx5pBxMcGbxGbumc6e9aRO+K3wzR6BBDGDNXFjWLZ3bWAQeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhuxuvKG9MWL0LjnAwYtwSRRlOIL20DkF2l+4/Tf35U=;
 b=Vj6wnCqhcbSh9FLH+HwFOqeD+04wmS/5amRJqtuJSrNe8h9HO/nnfgvWWhNkcncsLAcmRz0nGHRUw+tGqSuzzh8GTwgekOh5QB91xljI0zEy1eM3c3nsNOkiuF5t42R/k3CFkacgz+lri2j4mrfndlfa80szKJ3XouXuE4FDGMU=
Received: from CH2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:59::18)
 by SA0PR19MB4320.namprd19.prod.outlook.com (2603:10b6:806:81::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 11:44:30 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::b0) by CH2PR03CA0008.outlook.office365.com
 (2603:10b6:610:59::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.10 via Frontend Transport; Thu,
 6 Nov 2025 11:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 049AE406557;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7FBD822548;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 05/13] ASoC: SDCA: Add comment for function reset polling
Date: Thu,  6 Nov 2025 11:44:14 +0000
Message-ID: <20251106114422.906370-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|SA0PR19MB4320:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0cbe8df4-443d-4447-815e-08de1d29d8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mk5VbWFNOK/tj1XpnUIlUV8wJi/CXRFPIxmdXaTM6rjx9Af0K/C1uz89DBDW?=
 =?us-ascii?Q?PMu19FK4O0uJH9MdihO1svLeGq7FFedmgjvou/8k6BSP1Hq6wvidZfXbrms0?=
 =?us-ascii?Q?G+hbEv5l/8oorp/KhpCMv3XCHiKcKmjsyYqxL5FESGOUZO+8FsDxVcLGLShA?=
 =?us-ascii?Q?uneGnUZfY7+9NFuexjMcrolcD9tUh/saT9XCTLo+cjlyJ/8fOWn+SiS2s6nY?=
 =?us-ascii?Q?34Dl62NzdH/9nC0bWPlPcWwO8ow+CRB4jTEur9qaGs/GA1J4BE7CJ+22ikp5?=
 =?us-ascii?Q?i2TUxOPdsPQrze7hcXEnDw8BW1He5is/laZJNmgORVCZHrDFTR5RX/41r0yx?=
 =?us-ascii?Q?VdRBT2rNBs9p+izIkap8ZpVdCVnbE46IWjWqPqkURnXRSUs/CnMt61umNIeD?=
 =?us-ascii?Q?/r0blTPf8RBTALYcvcw/PeV67Ej6JbviBzNzQnUJysfuJwoWpTYf0TCtYA3M?=
 =?us-ascii?Q?xgx2Hxhwz4Nm+CCSCJ56k4EfdHRoOgNHeAoGO65KQtWm11f5l2euQ7MlOVRq?=
 =?us-ascii?Q?oFFvj3m4ZyTUWDpfi/75Ae2lOrdQeRPBv2WtXtgch1ayIborDG8XMqDrKkM4?=
 =?us-ascii?Q?H6HujtIg1nIPbZEWWKFww/JR3qbgzEEpM0JZHv8+nKEGqIuzUyKzfEi9QKaQ?=
 =?us-ascii?Q?ea98eXtVXvOrKNdi99j1kYLSSJtOvdECW73+genG6s7UR7ss1LlbT641Hqxa?=
 =?us-ascii?Q?hiLWDewoxbqzg9F3pWsTA2VJnnNvM6+buz3EQXyPZNdDRG9bhlZw/X01dZc0?=
 =?us-ascii?Q?w7iTg7+SZUlfGbbIrS6omyrVHJ80BnSY/akX5GwjnCpjWldk7wRS6hxzio8R?=
 =?us-ascii?Q?xSG9IM6yOIdlhCs67vqbTGZKv3FJCskVqZ6pihWKBAm9K5sG/RHxnWwTGes8?=
 =?us-ascii?Q?o/ZuSfPzu1l+8h5CFrR0dUUCzTzmZr/P8bvWoZyqKnQE4OPyaYs0Egbo/ssw?=
 =?us-ascii?Q?WV1M8IJmBi8NAcHuZiauXf5oZ/IwDGGPzrecXKwOXJCmtfe79by7Zs5du600?=
 =?us-ascii?Q?jdocLhLvi/xTjj+v77mdyqY+S8phOeAFwbkIhv7yrxNcGI6eeeW26PKaN930?=
 =?us-ascii?Q?cgMemgS5Pl4OuYI/39EMJELo8A2o2cELqBuOoOnFraLSnMH85WLmHvcG0CBj?=
 =?us-ascii?Q?qYXGz9CrZbD5Fx0LzEZePoult2Xue080+k9Wke5Vgmkzp/g6Y71MfMrOGp2I?=
 =?us-ascii?Q?GMcpPJYudHaHqMIRI7V/eHIl5X+67uXx/KD/L9CCiBbCxMLfGt7At5F5i0sd?=
 =?us-ascii?Q?jrVebzkSxZzfdKr6ekJFDvq4SlvSnf2J/RbvJpIg4dSRVTaeAW+MKpcO3bc2?=
 =?us-ascii?Q?BRWmUJciqKjmVlaDvphNnGbfmQTmLDR5HkYD7DXHBe5VJKKgu8o/eTQ/ZeKY?=
 =?us-ascii?Q?5fPq3f7H4eb5KaSTBdmJfjTbaZ/mnDKcdG6GoXa8hS6ZVjhkXnXl+tvldc/J?=
 =?us-ascii?Q?DtM3uRfoAIO9pBzBX5rpSb5sl9IVWMDYX+GBUZybzDQ/u1bJlIWsCrzY5FpK?=
 =?us-ascii?Q?iRMdlyOzcoiD1c+D+qfkkwALu2VO7nc4ZDcs1Xs06fXijcA1b+Fhk0Y9vmmb?=
 =?us-ascii?Q?O1Pssg84hnOZoEGH/KA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.6921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbe8df4-443d-4447-815e-08de1d29d8ad
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4320
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX/nUpbfmh74f9
 oad1Kq0u7d2k0B23dgCWm5Y7Ao712MhUHdagbQIviOUueqNUW9UfIGgY8wqewIkcA/F9zWyArO9
 Hsc19hUnNNymeB6YlsHMg6O+4/p+9FE7HJ6L7UM7FUlx/l0PUX75mnQfv6yCvh2JkZ6vIqrxmus
 5NBo6VBs0PYfoiP4v8uxmtu9EurPw3s///BV01fORqA74LMRLVDIU5NrCzzEbIr2iWpTHWjb1De
 WF68/GB0J6wJFxziWJjTzzEZYsATDp2o4HYlhPs84zEiShtmXSHiqEQ64kTNFeYiM3LCz9jSst/
 Pt1c4lBe076y9Y3B0V3H8lWYRHBdRX7F7uWPl4TpBxJzoI1aB7mkTu973j5DxklwQzn1Xu9X0Z3
 77ZD61biH4ZIfLPyk1GiJ5OE3eDTvQ==
X-Proofpoint-ORIG-GUID: ecDI-LysYoXZsnSjT6IvLYxwcMcQ_gD0
X-Proofpoint-GUID: ecDI-LysYoXZsnSjT6IvLYxwcMcQ_gD0
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c8a22 cx=c_pps
 a=BGK54fkyo7uEM8ETl7wc1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=iBq02kMB62qtLoM5mgkA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Add a comment to better explain the function reset polling rate.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Correct some spelling

 sound/soc/sdca/sdca_fdl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index bc88d24d63d7f..03789d6985f2d 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -51,6 +51,10 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 		return -EINVAL;
 	}
 
+	/*
+	 * Poll up to 16 times but no more than once per ms, these are just
+	 * arbitrarily selected values, so may be fine tuned in future.
+	 */
 	poll_us = umin(function->reset_max_delay >> 4, 1000);
 
 	ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
-- 
2.47.3

