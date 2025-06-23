Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03C922DA0C
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672075; cv=fail; b=Bnt2oG4lkm9B+Mi4bAVYp7in1amoBRYfLbHGdQ25QTExQNtmSK7QGfS3Z4NhlbygAqySNOgf/MfgdhZA4ZPaUgLqIsex0AdaPd4ex1fGns43jO5a2egw3+DGhiMdg0ei2kp8CW8RsqxrNZ2VM+zEjf4bAivpACKaxGsraOVIHW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672075; c=relaxed/simple;
	bh=xpte00Rb7fcr0VLgNzH+Zeeg7qG9j8gO/321faVsSew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmO9ldcmNwMtT2v+dexgL4ZLpLWBMLjBtBJjc9ghQq7oPcDtjj5AgI6uKjheGZdpj5JQ41hfLU4FrmZkSndNYIzeXvpi4vZwrfgYYiQ221lPXeJoIfmyQLp4q9StwHmLdu6yAdHVbO9Ow3Kx9udRGCwFC3RzzRIRYum3JNKciDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iKSm+UjL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=F9dNMPyE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iKSm+UjL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="F9dNMPyE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N50tsG032630;
	Mon, 23 Jun 2025 04:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=O2eokSfSPHghzMF8Sw4D5Pk/V4ndF05hkj2VhygEw6c=; b=
	iKSm+UjLmNV2SXyb7VRXlKXM+ImrxrxJDQUkOhxcAI/XmTOtPtMnLEVGWBEJE9lt
	fTOsMTS2JlDv1QfxV/mJOb7nENSoNFcuR/aYwAwnQJi9JpBEsaulZDmBCRuArjBE
	ExdtjEdaRlLjwQ/4gBHgTvClz6Iu8ODrMZ1A9iTLRjlEt/KqXuOba+LAeDwwtD/q
	6I6v2m0eoTYePOHJLc36cA7RluNvoEhJ77dG9kVI6t33hWfbzqgOlYXDcpwA35aN
	yD2i4z4wsEeBCV7U2s9P7pmJpAjZEUMNCLqhrUdlLEKktwstdMFjUrZOh6oPH3JV
	5MY9MSc8nogSeK4xMVSGgA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2122.outbound.protection.outlook.com [40.107.102.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9gt8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yukvnMRoRZZ84/H1da/LTfCOrovJdNdt3fvUkOJznv2lKdBqkFIYINPFqZv7CnQoEvi1FsKiQmcTpJVO28ElpP7UZmau+jCwjFshvL2h5UQJ9qhrOvkyyMTscpEB8zvFVKVtHgpF3z3hqlUs5F8OG38PVuwXaM8Uujc48VgkBFzwXJaX6ZpcOzYUoGhTcpPS7YKm4eRnmFhUIC+aVHiQqMjp9PxVX1Rdq20t4cqLEyu3WSCQmS8pYDuJJxhg/0nOUeAvWZ0oLw1F3iCmp0TzxCEw+cbqHh6nhnaDmgQw0o24B94uOuTiAbuKyqpO21r5V/VhcAqBSdjXTCMPLJSrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2eokSfSPHghzMF8Sw4D5Pk/V4ndF05hkj2VhygEw6c=;
 b=dqNOlCvWbiKp8+pM9T/MIuwQM8u4qyTPrnUSGTSyTbyuccNWIDWJ4dzdUn/+JcxzofNH8/NGrSRAaAREicupmkwY0pm+riredZ/x0FIRs/DTKcRgXxwqt8+0vbZFlREnJI+5X06xC73kLBhDDHcX0deM9cU+cH21TPxN0jnyd+sGLXzCiCa6JxSVKNO8bCEkjWkgAfabDfc32VrgKoEOLrEoA3sK0BxSH6yTUy/erhQJ2WKnJtKJxPZmu+NW87JSaxwFTbOte4q1qQ89lHdX/LCdyHwAcyDXkuVrvDBOTb6K4OBe2b0Lx1MUoIoqxkdfyg9RbMiB26PJ0uqAglh7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2eokSfSPHghzMF8Sw4D5Pk/V4ndF05hkj2VhygEw6c=;
 b=F9dNMPyE+RfykO2zFagHbV7ETfccNkFYPE6gbMnO/FSSQTMqH8DNMBgMLCUGepYlBOgd/hyIY9XMSL30bgilQoTf7GRln3m53I+EgtfVTfxmT5IZ+phbIyuiSZT/THYkPwvbSZbUNulbG4XmR7Hmd+Dcv4JRlUpunTlYWXrh7W4=
Received: from BN8PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:60::35)
 by DS7PR19MB7699.namprd19.prod.outlook.com (2603:10b6:8:e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 09:47:24 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::4d) by BN8PR12CA0022.outlook.office365.com
 (2603:10b6:408:60::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 09:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D328D40655D;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B0BB3822563;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 7/7] ASoC: SDCA: Add some initial IRQ handlers
Date: Mon, 23 Jun 2025 10:47:16 +0100
Message-Id: <20250623094716.1874443-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
References: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|DS7PR19MB7699:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 71941fee-3ce5-43a1-5166-08ddb23af4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?691tzDIkHHZbefSCsGZnsHZaaoY5ihMjmm+n4TvpBEXZFpuspmOHXf7CvsI3?=
 =?us-ascii?Q?In1+/s/s/rSUPsSLCptoOXAFc0TqBs18tvnJ814NCtQrKl3KL3rp4LCWse9T?=
 =?us-ascii?Q?wxYnzLQ8I9B3EXRAYE7vt8r2D428tz0BtL5XW8aumaXqrejCqt/fx56LFXDH?=
 =?us-ascii?Q?fdkrV6HO1FtVu6o37n3lRB/BRy8Ulp5UAGzO01BYG9K4y5WdKM81IfgXN3Cl?=
 =?us-ascii?Q?EIEaFO8yGgAkOZbiOTbfm+F/S+OLVMXeHIJGHGJHMpH2sDS5evx96vSXUs6L?=
 =?us-ascii?Q?zBp7DVPuBDazX2+g8q+eKopvjtFkf34ONJt6tJhFzXVbJqV2Pq3vy4ByZb16?=
 =?us-ascii?Q?BR4xuc7BKZ511vPejfBy+diLPbo/6d0u/scbXFn9fTXAPwq/a/3HOu07YUT7?=
 =?us-ascii?Q?dc/8/QSeKukALeIiu0LESOLqA0G5EWt2Y8C32LH1cNebHyLsBjse6CJHc4QR?=
 =?us-ascii?Q?4VQX/3Vx9lrD381YuCV6E6KF4VR2g63Dv6g3uoKrkfhSv84wXu7mDccHT1a6?=
 =?us-ascii?Q?E5Cbar6G6BXGhvJILS74kH/92ZbbEJw1IM70q7pOUISP7p5vfgUJzDk/zBgT?=
 =?us-ascii?Q?5a/cKxJ8DEvhGkx6ubwL2t6tHb/08mX+j3Wqe6ikjKpaxXGZ0ikgeCtSGvsL?=
 =?us-ascii?Q?ukjDIGUFWKCxAQ2oGa6ohgaGlz/6Q4UC/xSiRyfSsioDWWCFLOoyQzUupFDQ?=
 =?us-ascii?Q?5HcT1Pv9mpZCG6I1GphG2k9cknoYVLBQSiHKW846w0IUhpEzwTVbOUcMeAkh?=
 =?us-ascii?Q?XqTjJ9sKhlMkGjMRms8qx8cfEcLaWfvgXA7QJAeAl1EDsHI4u88tX8NFob5g?=
 =?us-ascii?Q?CMuY5XLr7jc+fh8AYrDpk4twSqiusImTWUiK3F2swZAYxdsE4zJGsCpD8zhd?=
 =?us-ascii?Q?FG2/yHK1xraPzbgRuuq026MMjJmLy03KgOWynWFdAmzfgIfK6b65zihwTfRI?=
 =?us-ascii?Q?DGYu9RaWanckxO80Wnkqh//7ZN77ls0s30Jd9AbXfXCpiNE+RCO6ar3K9hPo?=
 =?us-ascii?Q?3fV5fypL6tY2O7odGzW4xzam5i6GMDDExvtAnPKVAhqWlunv67BZS4GXcgyu?=
 =?us-ascii?Q?+ZQvzdSFynH4rytcmPPgQYsFaH8xG1BNjVCiXz/avrKpqhGEt85fuqVrEVpa?=
 =?us-ascii?Q?y6edvPrbGE/SLogzPSycceGSQhBm0eMzX9t7DCQY+ZiY/iId6jSJzeoH7Hs+?=
 =?us-ascii?Q?EFGY5ZXGmAqDp7DgCmzMqjq29/I65WsuqsOUhkH00LSC673f6RwUTlMDbxj4?=
 =?us-ascii?Q?MqDqo8uzxyU/iS22ySNgCddixu26L49eCsJEjIVe9vp507dX6UJNnE52HSFX?=
 =?us-ascii?Q?ZnKXLmnvB1IcMK0dWa4ydSKyQ5oKr/1XTxwF3zMbaXAYDAC6rOM994a9Klzj?=
 =?us-ascii?Q?H+6PfiYZW/sGYXdS1/tiDocSqh4NKs8MuWDXJnOGIUR4y6kC0LisYBFEvzEE?=
 =?us-ascii?Q?e9pUnJXkpby25l5wU+5SzonlaqvuE7LAiTHesg0xMaocKZme0sN44Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:23.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71941fee-3ce5-43a1-5166-08ddb23af4b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7699
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX4AuzBM2i6+f1 Wt/zTGKzL/ZEfg1+W8w6Wdzs4RTBAfgx2h07DbEAGJxV3AwCfW2+7fLMLRSH3XKyIWz54EJvF6I DuhRjkHit5di+vXuCc5L+vOKfxLkczCLgG1lh1+PAP6TdM0iZ49/nVYwo7S5T/OVkENcEMSgcnc
 QYWv3T1HGu0mJGN33wb7oxQgkegUb6hGI4YmeIi6ExIfi/pRe53u1imSTP4qzMLmCEgIi3BFZN1 e/tGJjFjnhMRqTnXDy1xRADwEXsYC962Z5/q6FXyo1pfMha69cKSg6fFkNqrvsFC/iV2rJNQ553 JAj1YEHl9pzdYrteB+WupXlBoZqagFRm2gPaDF7M6eD8sFEz7jrDyupUI1Ix/YHg9nwy/rtvk5Q
 UasUD7m4EKN1S8/I3keWKOL2eOXS+Mo4ltM167K6P0V8gC5objDPFq0+BrROdMULHf54a81N
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685922b1 cx=c_pps a=Apma1+nZR08asJJWUEmYEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=ciq9ReWSysrckT9F9jIA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-ORIG-GUID: yzwp-US2nHHg0gAPvNq4FHWRRE4nrF0a
X-Proofpoint-GUID: yzwp-US2nHHg0gAPvNq4FHWRRE4nrF0a
X-Proofpoint-Spam-Reason: safe

Add basic IRQ handlers for the function status and jack detection
interrupts.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added print for function busy.
 - Updated comment on SELECTED_MODE handling in IRQ.

 include/sound/sdca_interrupts.h  |   3 +
 sound/soc/sdca/sdca_interrupts.c | 157 ++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 4cda8b75bae0e..bbbc3ab27ebae 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -27,6 +27,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @priv: Pointer to private data for use by the handler.
  * @externally_requested: Internal flag used to check if a client driver has
  * already requested the interrupt, for custom handling, allowing the core to
  * skip handling this interrupt.
@@ -39,6 +40,8 @@ struct sdca_interrupt {
 	struct sdca_entity *entity;
 	struct sdca_control *control;
 
+	void *priv;
+
 	bool externally_requested;
 };
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 7272d11cb6d49..edb045c7ebb08 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -7,6 +7,7 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -18,6 +19,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/soc-component.h>
+#include <sound/soc.h>
 
 #define IRQ_SDCA(number) REGMAP_IRQ_REG(number, ((number) / BITS_PER_BYTE), \
 					SDW_SCP_SDCA_INTMASK_SDCA_##number)
@@ -80,6 +82,143 @@ static irqreturn_t base_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t function_status_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->component->dev;
+	unsigned int reg, val;
+	unsigned long status;
+	unsigned int mask;
+	int ret;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read function status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	dev_dbg(dev, "function status: %#x\n", val);
+
+	status = val;
+	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
+		mask = 1 << mask;
+
+		switch (mask) {
+		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
+			//FIXME: Add init writes
+			break;
+		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
+			dev_err(dev, "function fault\n");
+			break;
+		case SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT:
+			dev_err(dev, "ump sequence fault\n");
+			break;
+		case SDCA_CTL_ENTITY_0_FUNCTION_BUSY:
+			dev_info(dev, "unexpected function busy\n");
+			break;
+		case SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED:
+		case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
+		case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
+		case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:
+			break;
+		}
+	}
+
+	ret = regmap_write(interrupt->component->regmap, reg, val);
+	if (ret < 0) {
+		dev_err(dev, "failed to clear function status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t detected_mode_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct snd_soc_component *component = interrupt->component;
+	struct device *dev = component->dev;
+	struct snd_soc_card *card = component->card;
+	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
+	struct snd_kcontrol *kctl = interrupt->priv;
+	struct snd_ctl_elem_value ucontrol;
+	struct soc_enum *soc_enum;
+	unsigned int reg, val;
+	int ret;
+
+	if (!kctl) {
+		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
+							   interrupt->entity->label,
+							   SDCA_CTL_SELECTED_MODE_NAME);
+
+		if (!name)
+			return -ENOMEM;
+
+		kctl = snd_soc_component_get_kcontrol(component, name);
+		if (!kctl) {
+			dev_dbg(dev, "control not found: %s\n", name);
+			return IRQ_NONE;
+		}
+
+		interrupt->priv = kctl;
+	}
+
+	soc_enum = (struct soc_enum *)kctl->private_value;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(component->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read detected mode: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	switch (val) {
+	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
+	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
+		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
+				   interrupt->entity->id,
+				   SDCA_CTL_GE_SELECTED_MODE, 0);
+
+		/*
+		 * Selected mode is not normally marked as volatile register
+		 * (RW), but here force a read from the hardware. If the
+		 * detected mode is unknown we need to see what the device
+		 * selected as a "safe" option.
+		 */
+		regcache_drop_region(component->regmap, reg, reg);
+
+		ret = regmap_read(component->regmap, reg, &val);
+		if (ret) {
+			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
+			return IRQ_NONE;
+		}
+		break;
+	default:
+		break;
+	}
+
+	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
+
+	ucontrol.value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+
+	down_write(rwsem);
+	ret = kctl->put(kctl, &ucontrol);
+	up_write(rwsem);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
+	return IRQ_HANDLED;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -202,6 +341,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			struct sdca_control *control = &entity->controls[j];
 			int irq = control->interrupt_position;
 			struct sdca_interrupt *interrupt;
+			irq_handler_t handler;
 			const char *name;
 			int ret;
 
@@ -226,8 +366,23 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			if (ret)
 				return ret;
 
+			handler = base_handler;
+
+			switch (entity->type) {
+			case SDCA_ENTITY_TYPE_ENTITY_0:
+				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
+					handler = function_status_handler;
+				break;
+			case SDCA_ENTITY_TYPE_GE:
+				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
+					handler = detected_mode_handler;
+				break;
+			default:
+				break;
+			}
+
 			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
-						      base_handler, interrupt);
+						      handler, interrupt);
 			if (ret) {
 				dev_err(dev, "failed to request irq %s: %d\n",
 					name, ret);
-- 
2.39.5

