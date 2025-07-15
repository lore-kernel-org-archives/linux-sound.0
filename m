Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC271F0E56
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592689; cv=fail; b=XVlCTwIfsgtTO538wYxs2pXSoh4qeRNJps5Nhk/zSCF/UxSe48rhipFRTo9T2wtgN5ogTtkHNPYkS6zE5vV/a9QypkEN0Bqki98BNBplypc8hy128Od0owK5SXcItM+BHeq05q9VLBf7Hup61MlkXF1mPmj+0sTjhJKWvPznfvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592689; c=relaxed/simple;
	bh=fcMb4hvOKcbB5kI5EfEiv/e4IT1UWJ0TqOASt3qzt2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j19HbfoiU4B0JryyyJVF0Iz8hpIQIiRYv37jl9H3/Yo95pDNRolR+89B1DjXuuFHlECFoleOsrUVwxnX48raNvoMNe691wT/DMcy9od0rW5w23g15nql2sZxGFCN904jHYqL5kabF8aTq1UZaRznYFxyUs8YU8gLDD8WJGGY9VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jpm7FOHW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oMvnmtcV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jpm7FOHW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oMvnmtcV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEm7PX029140;
	Tue, 15 Jul 2025 10:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UkoUt73vL+2c6JKXpZOYIHtlUtztojsO7eg2S0DKBBo=; b=
	Jpm7FOHW9GIRw9wbfp+zKIfKj1aqsh/+VwW7ULiwWE4n2UuVTu+pGvMATTqahdnq
	O4VuVT7DBPtJYSkpWVxmRRMxW7err4/E/OTz0GaCd5sw2p6apY8fxnbQEj5wOWpv
	MHYsSAkt4LBR/txYvyJwD/yx5URBcbGOkkEFPvNBi1xOwD4yRK5KxI+KDEFL2+5y
	SvoS9v2A6NAl5D20xqj9t1wX/X2xwTP3JhnJJD9lhzlX9PZgmrKUEDdUwr4XPV8q
	vrwZPDiYy01gfgITOnp2ZC7KrKzUjdMADm7t8rSLIPi25LA6Aor+8W2Xz2u8U9Hu
	XRhjJz1BTC0pEOMNQAcYLQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2119.outbound.protection.outlook.com [40.107.100.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47um4gvc6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:17:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuK0+M7SnvexVBNZ2SMafz16PVhOGV1w7DdZNxSQTJA9o+F98VH2EXkuxIico86vqbWaOXc4K10h4pnAUShGrjoUDW3IqZSVpVUNOdO2bSTve0L/XD0R0AFtQFUXLu6cH2pNwY00xWakYzVmjsKdA+d8vXfIamY5OsbcCoMGE7i6z7Kf0Ew98EQbBC3smRcuN7/IBn7M53W6eL5Zy0AjLutOAcYOicwkzeNFavJgR47bj3HdRHyLUivxtVIk5rXNj/vR2irwgHTJ+kyda+r2jo+4+QrPU4y/qofrEtgQatsKEiHcomgFY8jt9Gmj0GCs6ByfWd0qpYm1lwVdvsz7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkoUt73vL+2c6JKXpZOYIHtlUtztojsO7eg2S0DKBBo=;
 b=wCCzeo5uY88pM3F1h/6vnb+HYdl41uSr/qo+b7QGFJ0jO7MSiVGdvMJ8poVyqBYyDtwcmTF9LwgNeC0NSdYwBFyvbzV9PN0orKXopJSYFpn/s4GoATP5vo6Txvj3Uu2G2GV6ehiqQcs0WGoqZ45g4WOlpcg1nRjiSXxqIBK69osVhxYbNG+l5uCBkWLZQLjzSrp9laYJdEIIS9n5SjLyFAsnN00MTieMnzrllZqgz69Jod7VupJXylo7soE/yMwz/k5Q9Cu58d1tMJ63D1mwRugFoEZFrM4tbIdYkclKDmP4YO9mzktYGpb4MLlCU8MS86DPecN8edrb2eunYdXOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkoUt73vL+2c6JKXpZOYIHtlUtztojsO7eg2S0DKBBo=;
 b=oMvnmtcVftkBbTyRypNkU9X3mRKt1OQlIwT5fWsFs/dgg6r+r8IcfAPtaRklY3u2bQOwLe5001eO+wk8U0RIPCCVToYdsuIeWSzh5pRqKzYWo+X6sbAj7USScGRdTGJJpeDlDTEoRRVYCfZtNGwFK/NNeZ97gE1liwTR9gMX0M8=
Received: from MW2PR2101CA0007.namprd21.prod.outlook.com (2603:10b6:302:1::20)
 by PH7PR19MB7171.namprd19.prod.outlook.com (2603:10b6:510:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Tue, 15 Jul
 2025 15:17:31 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::3e) by MW2PR2101CA0007.outlook.office365.com
 (2603:10b6:302:1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.8 via Frontend Transport; Tue,
 15 Jul 2025 15:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 15:17:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1F838406540;
	Tue, 15 Jul 2025 15:17:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED86E82255A;
	Tue, 15 Jul 2025 15:17:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        dan.carpenter@linaro.org, shumingf@realtek.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: SDCA: Fix off by one error in IRQ bound check
Date: Tue, 15 Jul 2025 16:17:21 +0100
Message-Id: <20250715151723.2964336-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
References: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|PH7PR19MB7171:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b38f6d71-fc07-428a-d348-08ddc3b2b6c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c1XZVkR6NVLlUQyG4l4Nbgr/WulTI79dvnlVUSSY9PqrzZDdYRBJFlwLvFCN?=
 =?us-ascii?Q?9gRX4BJ3+6U2YJSBeWIQfxE1GAesjtx0NVfyUswzscTKzzqLFk09qz855zUc?=
 =?us-ascii?Q?EJpfSj3r8TPqTbEkt3qZpt/LbLXEsqijdSBkQ+CcqggQr9VfRG9LaI0irQgs?=
 =?us-ascii?Q?ztIOzB07oHyLu2Hrwom6wYc8lFH14DKNEPRMqmA7gp6/QGBtAKdZVNjdJ8Eq?=
 =?us-ascii?Q?IYA01UaKVdLChRBSLpzXSSXcmom2Y9+xTf2VDVOlZFZarW2EWvQ8kl7tJYDz?=
 =?us-ascii?Q?epFAnNn+OdQcoCLqhyYrlSObAs3KVod1ZDkfQ2U6oBtS3exdRebsfS3TPHyu?=
 =?us-ascii?Q?pYsnFxtB/zGgYASEa7XsD5KwB3wsynZ2XdylMgFea0zhKxcLBYUg3DAc1dr3?=
 =?us-ascii?Q?SF2168/nnTBfbRBoyrQI1bDntSRLzKFb8Bjp4ZrHtRIB4jjGCtULH9M2q3Lc?=
 =?us-ascii?Q?qxVpejC26R4/Yl8MOff2f8Ih0tCa2QKeEE2nnWGpMBAERY3kolffwbz/hGwq?=
 =?us-ascii?Q?lrzJssMAWS1r12K9WQuzcSQ0403LSRM7nNPUvsM50jZeBfTQ53+JE+RsDWIR?=
 =?us-ascii?Q?oYLNHCCDOYso9u5KRTat4VVw30wuck34TAp7uLs7u921aDvmb6MBgSnc1Rxl?=
 =?us-ascii?Q?Pl20DFCQ3IE3tlZKsytsKDSBowmHdq/m4Qaqx+iwc5tlQ4qgb0oM5F9LIiIO?=
 =?us-ascii?Q?w8cTcm+ruTIP9UVAWOtm84Bq/i9Sh+Zn0YskoDmGJhsD2AwiFwkb4YLIQdx4?=
 =?us-ascii?Q?aeR3btFQgmXeHGuW7wXHh9EIIfXX04xMZZQfqO0MiUpq4+GnIz/+5YMIL4qz?=
 =?us-ascii?Q?Soc0fIlZIlzblVXNE/d7dFBOsMxOf6vCLhFcNPBnocJWjDl4vRyEYDtxzqR7?=
 =?us-ascii?Q?68Xwnn9GLezz2eWzGHa3oa8TtLHmm0VHxdd1ygAwJbJ9gzRCrWHkMD5fErBB?=
 =?us-ascii?Q?Xa5E7lUgCBui8B3lplpiPKhbdNCeZ5rAgVh7tkQ77usIMLXAVElJ9OSH8SSY?=
 =?us-ascii?Q?Qx/ezc8X0t7rfJ+MhZcZrUpmtiZwHFoGlHWMFf3HGsyQTKID57lOF+Su+gKN?=
 =?us-ascii?Q?oagakV4qwHPis+dSrQ3BCsgq1uKFw9zQpQpuMuj54G5ku9Rc7oJLxscak7ei?=
 =?us-ascii?Q?5asCydYa/xnIKZRVOsOt3gLVxIG+pLBWtrmxxTmmgGzsEwzB7xMKP7esE/78?=
 =?us-ascii?Q?gBk7kEqY1a5e/0AtNY/RNKuQeGWCNPe/RkPZB2RhO3hqA0ObIOsY7FLJyE5N?=
 =?us-ascii?Q?92yq5VTFOZroSlBGvRfyx8t/Xb5VztGzJ1MB6x+NMy2T1F6eODdzS6Ol6sR/?=
 =?us-ascii?Q?+7P0IyQJ/+suFqokzsOC3WwiWjwDpYPoJTYsOerzJ0LsQN1fYxKx1qetkZue?=
 =?us-ascii?Q?0twmCUBCIFnPFf2JfTxdMozVC5BGFsUgL2vqjocv+fR7T9tJcA2SUGeqY/BU?=
 =?us-ascii?Q?7yUQgXzZcS/FJ/+uEYf3OiW6fJXeZPovOLy6Atg1XYtQL2g8vl35F3NAfrai?=
 =?us-ascii?Q?pNkM+CM41iMNwIgudyN2znUyqFyDN+CYW8HX?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:17:29.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38f6d71-fc07-428a-d348-08ddc3b2b6c4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7171
X-Proofpoint-ORIG-GUID: wbPjhP8VA6ZYCjlW98VviCIZruuvp3md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0MCBTYWx0ZWRfX9wMkU1fDDqdQ ysSO9sNpOdnN2CfA/kl5BTdIiKmIfzPc8hhHFeew9L8lNCn0aNJXSkixbxoSWAHCS5h81bxinyT fPeyQoQb0B8KsSR9a2bvREkOQdk0viToKz7fHS7xPvvVBtOv12nDWoS/38qzvRYE7cqu6Qex6R1
 wi6lmsVi90hLlJpDCFgKuu908n9lSF1JFZYztgTgrGj9symiip5eQ59RzR/99ttNZpTvI91c5lW jvh/q1OJAJY56bB/qvEqjleTbaGZv0Z4mZhUvyfLM62Usmjiu0paqTv0IpayjScNMkTTzi8WkaD WPFvZtLs1bha4xtHiVthRtlcJWruLTaa9gZdoKd7t2+h2MzFRt5KPfte/QtpQum7YaEch5qWmUv
 cJCU1guJPSpHpmmJDyTGULAfUInLGC0zkQQVOkLcYDlvFqr1gRwJk1slNsS8xGde0elUIMte
X-Authority-Analysis: v=2.4 cv=Kp9N2XWN c=1 sm=1 tr=0 ts=68767112 cx=c_pps a=pWXqNrLdDbpeoONtPtRvpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=sbx7OXscTSZCTemWvksA:9 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wbPjhP8VA6ZYCjlW98VviCIZruuvp3md
X-Proofpoint-Spam-Reason: safe

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202507150415.M1tCgi3p-lkp@intel.com/
Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 2f85fcc6e5446..eb9e7eff4b4ba 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -262,7 +262,7 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 {
 	int ret;
 
-	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {
+	if (sdca_irq < 0 || sdca_irq >= SDCA_MAX_INTERRUPTS) {
 		dev_err(dev, "bad irq request: %d\n", sdca_irq);
 		return -EINVAL;
 	}
-- 
2.39.5

