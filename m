Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384236492A
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789190211; cv=fail; b=GeHIwVqmY6CAz7yUmVXDaQMYQ7u1qnim/+3MZ6nmSjGvZVwznG32M7xgXKnYrQcwnSek4MOYQhdlGfER17g2gmT4Bh4cacYxTlXABC2vJu5mHdm/Fur6O5kqflrOR7yNMw+nAxFV2+Mcklnpw5HT5EjcPcpK3EQRcb+SSLBiiWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789190211; c=relaxed/simple;
	bh=7vSb4+QtEqr95Fn0Q7imsJakIxB9mdhFnyOn9NZK+38=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uz3OHY2PTouFGwyXC9w7ommOL3FUDrIgJ7WHw/jfQAe7I5P+BBJivgpj3KLGoNJYvd9uuzSXs+MjWxNYzJoUJfISjeST+YRfciGfUEa5ms1VO0ia+cRaTgY5yHW+MOcwMKAhcYL/BG/rNfJlbPOG8pgtfv20wIh+S7G265N+fjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=huPM7U/y; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wCFp2h5+; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="huPM7U/y";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wCFp2h5+"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68C4UgKr1452231;
	Sat, 12 Sep 2026 00:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=RPvrUGWgp6rtA
	DCHCyJrIyqpFMcC4p4CbNvTV0UHXkE=; b=huPM7U/yPIvwkNqt9fb/MJmSkudtZ
	MDxVfpsmJPK9OTLn41WsLw86kz27lpN9D3XGelg66OLq8joeycqT8MvJedSLVQ4u
	ODTP6nJ60+m2Nn0npyubHoXUAEb13/ZKS757gvAL2ITZsfnfk0FrfSiQ26qe1F5I
	Iwfc1J08rq+BF3szmLXIz0tOIXIJK9jJHYMYAKIpgocVNLZ4Z9Cc9e8+GHaN2xNg
	V4YidTwnUYIc60tt7AEoaK/0yU6aa1u+ZBSaGX/1fX9leSaXj1uGsaN78P96686s
	z4ADNZcXWXZBjpS1tyCncF6E/7V2GMrGVQJiVdrzc4n7rrNFwA09j7P0A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gmy5d08aa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 00:16:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbN6Y7dD6A9GThqWP5+3JPktrjQja2DzQBbikd0CnAvSjyt1K9NS8BbyCppw5K10tceLI498Os+qlMly0Y36ccL4BMeXVlYzHHfSiUpaDyAGHBvAoftd1DOw9G0PsvYRSn8Fu0SaB2lQt/fYxATAUdQQ2Us5j/TwPHxaR7dpnpLfZZ64Z7flBXSZHnrK/hiPEs4vlWbnKSgqtGVCRUy7FAYBhCB1LSLwUipmtpSqLQ6yLjFGO1G5T2JcfRoopXZpIcEpi1NfMwRoZ5K6vD+eqmka34TFbxEv6LX7Sa58ldFwTpyWg/HMvGtpWkAoXbg9IoEs6mSQR8iPqz1jCY580g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPvrUGWgp6rtADCHCyJrIyqpFMcC4p4CbNvTV0UHXkE=;
 b=fEULe3tHnRoSHxIH8uL/fHt0tMFm1C7+8luSyfENZgiGmpTJMIxqC9ucTWVJC0bUpjtBBF8sLceiXIW+Mp0Kho/3ZRDDbMn8nNDwJKw5lWE2z0UIcyCvYftN5U84xpTH+3whoUBm00wrzxuzpLakX0z6FhYTcB34rB35aDqqqZXpGilzgkLbdlblUoNSzXH9hI4CbaIwga0gIxz+h2CPZCdr6N44ohn36vdlD3hyWb8TZJgxTPZotBTtvwnNt/Pyxx+HC36TrI+CSvLI82GtfXjsLE5y4RL6HA00CepbMdAMawnBmaYXj/wm2kgCkhM9Tkp3QiwjZr6BTH2gQcEb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPvrUGWgp6rtADCHCyJrIyqpFMcC4p4CbNvTV0UHXkE=;
 b=wCFp2h5+uLazDury21NSftgh0Wdfn50+hNLqs1CSYuMU8GXHgr3ho8ziHeh88qyBF6pJXvcts935OSouL6wnMmvv/ee9JWNaWsMF0uSEyuhbnFLSUU4M9OyOp/PKzc0+wh6KPtP0mkTly4e7+FqUHqpfGtSPB06gmqQB4vUq0e0=
Received: from BN9PR03CA0365.namprd03.prod.outlook.com (2603:10b6:408:f7::10)
 by DM3PPFA3FC49FBA.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 05:16:11 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::7d) by BN9PR03CA0365.outlook.office365.com
 (2603:10b6:408:f7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Sat,
 12 Sep 2026 05:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sat, 12 Sep 2026 05:16:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 00:15:46 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 00:15:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 00:15:46 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.162.116])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68C5Fgeu1385344;
	Sat, 12 Sep 2026 00:15:43 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Add TAS2573 calibration support
Date: Sat, 12 Sep 2026 13:15:38 +0800
Message-ID: <20260912051538.1052-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|DM3PPFA3FC49FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e6ce08-6ab1-4d81-fba2-08df108cf5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|56012099006|10067099003|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sjEbypCj5mLLk7dB2AuDOKi5neWrGGELlwFxKy44i20Eun7emz+jQmiBe5t63/zbKUb0WC6G+zoOOVvYILKpPf6gQgvxzhrXHEm/puCIuXvmG1McP/YmEAS6DznTA31F0tMIPwA3XbaeNkBuZMAgqqSAMtq+TbU+GO/VNEsR2SbS19MCKM6R1sEko+xPaTE9pMOLbmYvd4WOL26gVYoyQ7fXBYvzKCu4LwSRnheakC/Ch7Z/etx7pPFgcuCoTiHmeaHa+G/u83An/tgEVSTSBg+dz8+gQjTmbEmRT3kzXwskChBanh21w2exUfpuZGamIx/3LCYUx23iyHm+HZhMPJZarU+B2ZP21HEPSmp7OCDWnf2wrqP6roe4iRgcBx3VdX3xo9UlanOdPfFp4vnKlg+QUFl53q8AUKBiaWiW5DnE9gN6qDVWhSDVnKE+BhofXSoWltREZUdPiiQTxfupQPX3hWKgYzGx+O1fqlYTwaqsNqpECHPOaI1qiUJEdgem3yOLpk/e1YxwVqEm9zZch3liFo9ns5JkHZv4FqIS5VGRRTK1vYRQ9icehgM/1D7qEaNKy1oRQMOqef0RgzA+SvPifQUmXJTUoGut4rnlmM9G+MY0BdUopTcA7QaZokOi2u1htZbaB1/a6bjOacqkJIqUG6f8PZ/gjY9IeChKyggjLlyC9jFps2oKkXShDeA18YFKarwgEEs/M5sQ5sijFQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(56012099006)(10067099003)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dtA6nkvWA/4WZ81yvoHDb11e6bSmvyjEhgoo65echzLdp6VXtUvNobRWnmLSE7Ch0ZCKxqrdXUkd7D+6kThpj39D0+edUBHUWElG6RupPbbRUi2bvUlCSk9H0GfMBdkHTex9CvZZzyRA40wnUhqEDerfKmR5yLMBotYIa1dlP73LD0tB4vUSUfA8D6dnaw8SOcMfUZ/Bri9B6jPRxBSOiUlextCNSkwuZes2xdN7falZ0T1chUSzvkwyFhYRNKeMmCMBR5sNdThfjD6ojPTgkhsPu/3ULbAOdtJrZws7hT9sXGMjx/Jr60tEjk6QZxlAH/Eif9lSl9rch+HKzVfe+L8ovWyXHaazcvjQFFO5eQjXVqd1s9eh4JlKaL8wPiqR//eluBNiuSJlYF8nfoKxjeOJ/8OzLAbiJ5K3/H43hPln1QUtqRfZQIjrNTIJhHyp
X-Exchange-RoutingPolicyChecked:
	5CVV6Djpen7OXml9/1PBbzpIkDbk8XJcFdDflbsF9hKQf1iWydejDhHkjmiFPudgxHmddribOv1uUKfRoCM/qiLhPqcJBgzv0fcaLEMzmyKpPaWRlogawlfMX34F1pIzUexa7wsrp8QNsDrxAb8IqipNKMpqQynu/apfmctHog8pewBugnwa9w+Lki1VSeIiTmZU4xA+on+mAHOMTjTSWWHaMh3P2dPsCbVeqfXzbCbpF/6CiXVq8R0o618o7jf7J/mkuVoAwICFMsXhmaGM15avj/McqDh2NAiKCP4I3DxrZNecJCt+jD+PjLYrRDU9zsHh+TQdUH2YbHM3sw3MUg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 05:16:11.5451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e6ce08-6ab1-4d81-fba2-08df108cf5e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA3FC49FBA
X-Proofpoint-GUID: k2H-QwvwwQX-ASKUFGwztJbKn3_1MN4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDA3MiBTYWx0ZWRfX6/41Z5q9V2O0
 /gonAJRSulh5aWrJ+uKirX+flaOrzoroMwa33Ndl5U9I+W5tCPE22IEWehz8nBEc/nvHWdMSHOD
 LeSah2EZ0+9N6aeZd9wqU+X1SVtG3nBO5jL7DlxNKZM1eIsNLdeSBiuQZ9o9982gAHPYYMhHy8h
 51MipX/CZR22e0xlCHZT+MdJwsYbYLcNoew6wt0ZE9sKxoeyHkFlF58MNGNJcnLmdpYadOezwBB
 KgmZTLVXhclMB4VuHlJvqKIMg/oYGnlH9fI8ORCaBpnay+ni2Vi7IHwpUBV8KLP5x5WQ27Lxxv0
 LM0Z7sheP2EsawhMJ+27pmf4BNkv17QsDb21/ixXwWwmu6iKiWCMwVOTauTW9FqeYym/B6PQ5no
 Lxja+eTZYrh+7NO9v0sH3Y6zlNK3OwuSyEED3H6DHVnh1XApbdm3hnx2RWQDDqbbktigdLfPFDk
 p6kG06mFgs1fjwrn6cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDA3MiBTYWx0ZWRfX/7k5iCH46Jiv
 ZQO/YkRPkybpfjV/ohCHRyVHNsuZyn8bSOCE2YvCqi1hF5Y3w+utbjG5hNoxzhzeme9fQTrQggQ
 hCizNQmMlVNwWKXqCsZ2PLkbMJF/GrI=
X-Authority-Analysis: v=2.4 cv=F6vC5ahN c=1 sm=1 tr=0 ts=6aa4e022 cx=c_pps
 a=7VyIIgRwdngEQeabsf1mSg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=96HV7QXQc8C_hzjVBNIA:9
X-Proofpoint-ORIG-GUID: k2H-QwvwwQX-ASKUFGwztJbKn3_1MN4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_02,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120072

This patch adds complete calibration workflow support for TAS2573.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add TAS2573 dedicated calibration register definitions
 - Extend firmware parser to auto detect and store "calib" tagged profile and config IDs
 - Implement TAS2573 calibration start/stop control handlers
 - Add dedicated kcontrols for real-time speaker impedance readout and full calibration status dump
 - Refactor calibration control creation logic with per-chip switch-case branches for better scalability
 - Extend firmware ready check to register TAS2573 calibration controls properly.
---
 include/sound/tas2781-dsp.h       |   2 +
 include/sound/tas2781.h           |  26 +++
 sound/soc/codecs/tas2781-fmwlib.c |  35 +++-
 sound/soc/codecs/tas2781-i2c.c    | 316 +++++++++++++++++++++++++++---
 4 files changed, 351 insertions(+), 28 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index de087f4ca13f..c887eb2d9a31 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -146,6 +146,7 @@ struct tasdevice_fw {
 	struct tasdevice_calibration *calibrations;
 	struct fct_param_address fct_par_addr;
 	struct device *dev;
+	int calibration_config_id;
 };
 
 enum tasdevice_fw_state {
@@ -210,6 +211,7 @@ struct tasdevice_rca {
 	 * capture.
 	 */
 	int capture_profile_id;
+	int calibration_profile_id;
 	/*
 	 * Since version 0x105, the keyword 'init' was introduced into the
 	 * profile, which is used for chip initialization, particularly to
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index b763da613769..df940a17a4ef 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -17,6 +17,8 @@
 #ifndef __TAS2781_H__
 #define __TAS2781_H__
 
+#define CONFIG_SND_SOC_TAS2781_ACOUST_I2C
+
 #ifdef CONFIG_SND_SOC_TAS2781_ACOUST_I2C
 #include <linux/debugfs.h>
 #endif
@@ -91,6 +93,30 @@
 /* prm_TE_1_Beta1 */
 #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 
+#define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
+/* YM57 */
+#define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
+/* YM58 */
+#define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
+/* YM59 */
+#define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
+/* YM61 */
+#define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
+/* YM64 */
+#define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
+/* YM147 */
+#define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
+/* YM148 */
+#define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
+/* YM664 */
+#define TAS2573_RE_OUT			TASDEVICE_REG(0x00, 0x7A, 0x18)
+/* YM952 */
+#define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
+/* YM954 */
+#define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
+/* YM955 */
+#define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
+
 #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
 #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
 #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index dc1c552206f8..ffbf15065758 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -199,15 +199,22 @@ static struct tasdevice_config_info *tasdevice_add_config(
 			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
 			goto out;
 		}
-		/* If in the RCA bin file are several profiles with the
-		 * keyword "init", init_profile_id only store the last
-		 * init profile id.
+		/*
+		 * If in the RCA bin file are several profiles with the
+		 * keyword "init"/"calib", init_profile_id only store the last
+		 * init profile id, and same as calibration_profile_id.
 		 */
 		if (strnstr(&config_data[config_offset], "init", 64)) {
 			tas_priv->rcabin.init_profile_id =
 				tas_priv->rcabin.ncfgs - 1;
 			dev_dbg(tas_priv->dev, "%s: init profile id = %d\n",
 				__func__, tas_priv->rcabin.init_profile_id);
+		} else if (strnstr(&config_data[config_offset], "calib", 64)) {
+			tas_priv->rcabin.calibration_profile_id =
+				tas_priv->rcabin.ncfgs - 1;
+			dev_dbg(tas_priv->dev, "%s: calib profile id = %d\n",
+				__func__,
+				tas_priv->rcabin.calibration_profile_id);
 		}
 		config_offset += 64;
 	}
@@ -632,6 +639,17 @@ static int fw_parse_configuration_data_kernel(
 			goto out;
 		}
 		memcpy(config->name, &data[offset], 64);
+
+		/*
+		 * If in the coef bin file are several configs with the
+		 * keyword "calib", calibration_config_id only store the last
+		 * calibration profile id.
+		 */
+		if (strnstr(config->name, "calib", 64)) {
+			tas_fmw->calibration_config_id = i;
+			dev_dbg(tas_priv->dev, "%s: calib cofig id = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
 		/*skip extra 16 bytes*/
 		offset += 80;
 
@@ -1412,6 +1430,17 @@ static int fw_parse_configuration_data(
 		memcpy(config->name, &data[offset], 64);
 		offset += 64;
 
+		/*
+		 * If in the coef bin file are several configs with the
+		 * keyword "calib", calibration_config_id only store the last
+		 * calibration profile id.
+		 */
+		if (strnstr(config->name, "calib", 64)) {
+			tas_fmw->calibration_config_id = i;
+			dev_dbg(tas_priv->dev, "%s: calib cofig id = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
+
 		n = tasdevice_fw_strnlen(fmw, offset);
 		if (n < 0) {
 			dev_err(tas_priv->dev, "Description err\n");
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 6f349f88f194..78918a79d8bb 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -613,6 +613,35 @@ static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
 	}
 }
 
+static void tas2573_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+
+	tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+		TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
+}
+
+static int tas2573_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+	int cal_conf_id = tas_priv->fmw->calibration_config_id;
+
+	guard(mutex)(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2573)
+		return -1;
+
+	tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+			TASDEVICE_BIN_BLK_PRE_POWER_UP);
+
+	tasdevice_select_tuningprm_cfg(tas_priv, tas_priv->cur_prog,
+		cal_conf_id, cal_prof_id);
+
+	return 1;
+}
+
 static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -621,10 +650,22 @@ static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	int i;
 
 	guard(mutex)(&priv->codec_lock);
-	if (priv->chip_id == TAS2563)
+
+	switch (priv->chip_id) {
+	case TAS2563:
 		tas2563_calib_stop_put(priv);
-	else
+		break;
+	case TAS2573:
+		tas2573_calib_stop_put(priv);
+		break;
+	case TAS2781:
 		tas2781_calib_stop_put(priv);
+		break;
+	default:
+		dev_err(priv->dev, "%s: Chip(%d) unsupports calibration\n",
+			__func__, priv->chip_id);
+		return -1;
+	}
 
 	/*
 	 * Set reloading-firmware flag after calibration, the flag will work
@@ -983,6 +1024,13 @@ static const struct snd_kcontrol_new tas2563_cali_controls[] = {
 		tasdev_nop_get, tas2563_calib_start_put),
 };
 
+static const struct snd_kcontrol_new tas2573_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2573_calib_start_put),
+	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tasdev_calib_stop_put),
+};
+
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -1493,6 +1541,182 @@ static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
 	return 0;
 }
 
+static int tas2573_re_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned int i = 0;
+	unsigned int j;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	dst[i++] = TASDEVICE_BOOK_ID(TAS2573_RE_OUT);
+	dst[i++] = TASDEVICE_PAGE_ID(TAS2573_RE_OUT);
+	dst[i++] = TASDEVICE_PAGE_REG(TAS2573_RE_OUT);
+
+	dst[i++] = 'D';
+
+	for (j = 0; j < priv->ndev; j++) {
+		dst[i++] = j;
+
+		rc = tasdevice_dev_bulk_read(priv, j, TAS2573_RE_OUT,
+			&dst[i], 4);
+		if (rc < 0)
+			dev_err(priv->dev, "chn %d bulk_rd err = %d\n", j, rc);
+
+		i += 4;
+	}
+
+	return 0;
+}
+
+static int tas2573_calib_status_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned int fct_status_regs[] = {
+		TAS2573_FCT_INT_LATCH,
+		TAS2573_FCT_STATUS_CTRL,
+		TAS2573_FCT_STATUS_BINNING,
+		TAS2573_SILENCE_DETECTED,
+		TAS2573_OPEN_CIRCUIT,
+		TAS2573_SHORTCKT,
+		TAS2573_FCT_OUTPUT_R0,
+		TAS2573_FCT_OUTPUT_R0_LOW,
+		TAS2573_FCT_OUTPUT_INV_R0,
+		TAS2573_FCT_OUTPUT_POWERTOT,
+		TAS2573_FCT_OUTPUT_F0,
+		TAS2573_RE_OUT,
+	};
+	unsigned int j, k, val;
+	unsigned int i = 0;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	for (j = 0; j < ARRAY_SIZE(fct_status_regs); j++) {
+		dst[i++] = TASDEVICE_BOOK_ID(fct_status_regs[j]);
+		dst[i++] = TASDEVICE_PAGE_ID(fct_status_regs[j]);
+		dst[i++] = TASDEVICE_PAGE_REG(fct_status_regs[j]);
+	}
+	dst[i++] = 'D';
+
+	for (j = 0; j < priv->ndev; j++) {
+		dst[i++] = j;
+		dst[i++] = 0;
+		dst[i++] = 0;
+		dst[i++] = 0;
+
+		rc = tasdevice_dev_read(priv, j, fct_status_regs[0], &val);
+		if (rc < 0)
+			dev_err(priv->dev,
+				"chn %d fct_status_regs[0] rd err = %d\n",
+				j, rc);
+		else
+			dst[i++] = val;
+
+		for (k = 1; k < ARRAY_SIZE(fct_status_regs); k++, i += 4) {
+			rc = tasdevice_dev_bulk_read(priv, j,
+				fct_status_regs[k], &dst[i], 4);
+			if (rc < 0) {
+				dev_err(priv->dev,
+					"chn %d regs[%u] bulk_rd err = %d\n",
+					j, k, rc);
+			}
+		}
+
+	}
+
+	return 0;
+}
+
+static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
+	*priv, struct snd_kcontrol_new *cali_ctrl)
+{
+	struct soc_bytes_ext *ext_cali_start;
+	char *cali_start_name;
+
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
+	if (!ext_cali_start)
+		return -ENOMEM;
+
+	cali_start_name = devm_kstrdup(priv->dev,
+		"Calibration Status", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2573 fct status:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for fct status (total 36 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (48 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 39 + priv->ndev * 49;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = NULL;
+	cali_ctrl->get = tas2573_calib_status_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
+static int create_tas2573_cali_re_ktrl(struct tasdevice_priv
+	*priv, struct snd_kcontrol_new *cali_ctrl)
+{
+	struct soc_bytes_ext *ext_cali_start;
+	char *cali_start_name;
+
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
+	if (!ext_cali_start)
+		return -ENOMEM;
+
+	cali_start_name = devm_kstrdup(priv->dev,
+		"Real-time Speaker Impedance", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2573 real-time spk impedance:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for fct status (total 3 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (4 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 6 + priv->ndev * 5;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = NULL;
+	cali_ctrl->get = tas2573_re_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 {
 	struct calidata *cali_data = &priv->cali_data;
@@ -1504,17 +1728,43 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	char *cali_name;
 	int rc, i;
 
-	rc = snd_soc_add_component_controls(priv->codec,
-		tasdevice_cali_controls, ARRAY_SIZE(tasdevice_cali_controls));
-	if (rc < 0) {
-		dev_err(priv->dev, "%s: Add cali controls err rc = %d",
-			__func__, rc);
-		return rc;
+	switch (priv->chip_id) {
+	case TAS2563: {
+		rc = snd_soc_add_component_controls(priv->codec,
+			tasdevice_cali_controls,
+			ARRAY_SIZE(tasdevice_cali_controls));
+		if (rc < 0) {
+			dev_err(priv->dev, "%s: Add cali controls err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		nctrls = ARRAY_SIZE(tas2563_cali_controls);
+		for (i = 0; i < priv->ndev; i++) {
+			tasdev[i].cali_data_backup =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_backup)
+				return -ENOMEM;
+		}
 	}
-
-	if (priv->chip_id == TAS2781) {
+		break;
+	case TAS2573:
+		cali_ctrls = (struct snd_kcontrol_new *)tas2573_cali_controls;
+		nctrls = ARRAY_SIZE(tas2573_cali_controls);
+		break;
+	case TAS2781: {
 		struct fct_param_address *t = &(fmw->fct_par_addr);
 
+		rc = snd_soc_add_component_controls(priv->codec,
+			tasdevice_cali_controls,
+			ARRAY_SIZE(tasdevice_cali_controls));
+		if (rc < 0) {
+			dev_err(priv->dev, "%s: Add cali controls err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+
 		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
 		nctrls = ARRAY_SIZE(tas2781_cali_controls);
 		for (i = 0; i < priv->ndev; i++) {
@@ -1533,16 +1783,12 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 				}
 			}
 		}
-	} else {
-		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
-		nctrls = ARRAY_SIZE(tas2563_cali_controls);
-		for (i = 0; i < priv->ndev; i++) {
-			tasdev[i].cali_data_backup =
-				kmemdup(tas2563_cali_start_reg,
-				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
-			if (!tasdev[i].cali_data_backup)
-				return -ENOMEM;
-		}
+	}
+		break;
+	default:
+		dev_err(priv->dev, "%s: Wrong chip id = %d", __func__,
+			priv->chip_id);
+		return -EINVAL;
 	}
 
 	rc = snd_soc_add_component_controls(priv->codec, cali_ctrls, nctrls);
@@ -1554,10 +1800,17 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 
 	/* index for cali_ctrls */
 	i = 0;
-	if (priv->chip_id == TAS2781)
+	switch (priv->chip_id) {
+	case TAS2573:
+		nctrls = 3;
+		break;
+	case TAS2781:
 		nctrls = 2;
-	else
+		break;
+	default:
 		nctrls = 1;
+		break;
+	}
 
 	/*
 	 * Alloc kcontrol via devm_kzalloc(), which don't manually
@@ -1610,12 +1863,24 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	 * it, for the default value is 0, which means the first device.
 	 */
 	cali_data->data[0] = 0xff;
-	if (priv->chip_id == TAS2781) {
+
+	switch (priv->chip_id) {
+	case TAS2573:
+		rc = create_tas2573_cali_status_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		rc = create_tas2573_cali_re_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		break;
+	case TAS2781:
 		rc = create_tas2781_cali_start_ktrl(priv, &cali_ctrls[i]);
 		if (rc != 0)
 			return rc;
 		i++;
-
+		break;
 	}
 
 	return snd_soc_add_component_controls(priv->codec, cali_ctrls,
@@ -1822,7 +2087,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 	/* There is no calibration required for TAS58XX. */
-	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2781) {
+	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2573 ||
+		tas_priv->chip_id == TAS2781) {
 		ret = tasdevice_create_cali_ctrls(tas_priv);
 		if (ret) {
 			dev_err(tas_priv->dev, "cali controls error\n");
-- 
2.43.0

