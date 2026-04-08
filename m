Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6E3B3888
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641154; cv=fail; b=lQAYw6nw3aBO1EA16fi5hiWQdW7ffFOIKun/AxVYMrjFaNjV3XOvfii3pBBozqYbNUFpxjnGsU6mt6LepTJ4FkOrwcVgoQiebkxjMifoO1rwJIP8h6biPJsD54GuHmMPBaDr5vtvrq6Bw0slyQS/g7F0NK+Gai/1FNq8l7CkO9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641154; c=relaxed/simple;
	bh=m+ltaO9dbIeMHAV7BJi8d3LSA/O1rrLCVJ9W+p+hHo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTLJnLHX3EdVZKzPeJ43mer2dI4seDc1ytYydXd/TnXkJWmZWMAzEakustlGAaLMGDMkoJTD2l6D2MFVwO/zrkHXUkYdRuBzs4axEOMqi2/rMAPw67LsXt4R2irFztdXwJ2ZaY9lWnuADRscSo2wbR+BpUzbdAmyHtWd3dN/KZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O3XfBdCj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=frXgGFcw; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O3XfBdCj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="frXgGFcw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637MRMZ72093556;
	Wed, 8 Apr 2026 04:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JSlJkoJdv1sw3sn/GKnqBmxJYHwnDduJ7LI+bK8Lics=; b=
	O3XfBdCjpbnIzIhsIZfQYT5+aihV/gJch/litNfzn25+gopSDZqHzEOozAAmcXhB
	yL7cQNsm9NrzFEKiEu5o8LTwy2aj82lt4AGEMhUO7hFC2G7eRHvclbXCt250APEt
	LhOcTLabAzs1zYpntGqekugh6StTHOr5j2XjhcumZmFG0Gttnhd8DdLREwZaUHxs
	naRcc/JHPRaJJ5QKZvBEjBn0G331pXvPm2Xv+ZeFU/RuZ2+SWiE0PpktIZgkOSom
	5pNEz64yMmJIU4XJbqbOp0YCVjfh/2oXuIjDWk+iZtVnHWGqe86PRdXA/ou6YCJn
	SG43xEdPqYpLmta6md99Eg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022120.outbound.protection.outlook.com [40.93.195.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr4t31y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:38:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooe4JAVENvaNJSRAX6fXpWrjpJUnVOxEIXhXip2E0smSR3EKzlhqqteUNERIfXdxe5hwuEt8IB9HzBzUiKoDyx09w2LatH42mu4EEgECvEiJM4U0hhKfCqrzahLQO/0VLbMBtJyWjQOAo9UEC/JAzGpLe6OlkslRBf9Y1UXJJUicFTAEEJuAExP2bR7CtjIUblDory5QUHemtLGTZgC8RzjrZmPqkiYGtwCTqJx6ceT70hl0dQq+PDKGbgvCB0hcMjbgbCnxZUCJK+fLwug3u1wgSdE3j5k5iV75KgA4qCiglXFFN29idwjNMH7RBN8gQK5dyqQxdWeLlwVFmhMMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSlJkoJdv1sw3sn/GKnqBmxJYHwnDduJ7LI+bK8Lics=;
 b=HVFY06n4Vg5ArAxKyKSstMUilKUPswEDE638yMSdERwfZjld/26rAZh4EweGxiupI37sz0T4SO9FiVaySLnpDJCwyFKrGpm3AFUBQ1EFQrv+o0BWxLAsRsZb+dkMhRIC0KiiaYCuEIUcesk3sQtC9edMdJ6+6i4USux8y4Oc1Nn68lcj+s3lZsxWjuWP0eMUK5YNsQvZehPw5x7aoGOf2R+RWLoLxXTZFCk4ftgjN0ejBAkG2uB35bNtoHuyLw8oMp7jlIAdloV7aEQlLHhhjKm1n5jUfB/p7yYSpboJFspKD44590sbEA4etDZ3el8TshojF7QTQ6l2HqYV3j+FqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSlJkoJdv1sw3sn/GKnqBmxJYHwnDduJ7LI+bK8Lics=;
 b=frXgGFcw9LWlJerplK9rq3IWIMu+wdzbOsNwHg2D3XDCDpSEzAp+qGhMnpPkhRWPjlx841SzQysMWisPJzlsBG39js5S71HAVDXR3SEpPRtIjMeHHJHWMoIBdjggmiB6aSBm5rmvfh6CVQ0zhPhrQ6yMs71kHex3iGyP+Y0q1NY=
Received: from SA0PR11CA0208.namprd11.prod.outlook.com (2603:10b6:806:1bc::33)
 by SJ2PR19MB8204.namprd19.prod.outlook.com (2603:10b6:a03:55c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 09:38:43 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::41) by SA0PR11CA0208.outlook.office365.com
 (2603:10b6:806:1bc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 09:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:38:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C5C1240654E;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ABCE4822541;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 4/5] ASoC: SDCA: Unregister IRQ handlers on module remove
Date: Wed,  8 Apr 2026 10:38:34 +0100
Message-ID: <20260408093835.2881486-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SJ2PR19MB8204:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1bdf16e-3c8d-432b-6498-08de95529fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Vnk9F9+r1LH9/E0bt9PqW3YY/u1FPfx2VHnpK4QNZ92+J/mHzNJYEN8zjFdLKlvFVZM/0nz8tZ+lA+putZPB5RSi/H67V+sWYkRWSXGHx5/mWfSfpV57pZwrsiZZaPnLM8+voMQ4jnSOGwDwBgDBwVjpXNcwtCFJvAPqz1btX1UVFi8BzPfDOD1sm/715p398vAutzQbeb9oTuRi9UER2hNm/8ueYT1B3dsdYE0BNbMjG4hpV6d5PjWu9Mv9R3c4ZZtlPI8XIgbiGcCd/aR+Fdp0Dc4vnaK6RWMSRile4rVYjTWFwTEyQaTzMm/wO3r2ixcpPLPhqx24SNEBCQvH5Eo5US3DdMC0Xj0mDk+gCZaciJEELJl4H3sYGIBt/BCprvxyFafp+M+ngDpSXAe/o0gcyQ+wK5+jtyJJDWw6WRWICFv/Y1qReSOwDq9vsrUmWaCpUpUWJUfHNwols2wj6k32Xh1KJ6JR+nlNXLLMUGsDvTF9wk5yNh1ivsMPX4peVWjTl8yMtdbX3y4paAZkeY6CWNlcoGtMlpgCLLV5yxHi9ao8yldEDYN2joZbJ1OpV7bHrrBGZXiVqygmtcklrd+twfNoKue95Iy4icH/6UybFd/sc5UXihCS3JfHUp8Oe+QWD0ENyGwsHvn0stD4RDQaBT/12G0R/8BFGkHKyg+Q7JfSvP0RbNgbgvyeJbHMTDunBhE965iHv+mYOcpDPbPGDydGj7jIzCXsP0LqTAtl2MvRT61ObJiPESwp9MyXlcDJsbtT+Edh4f8ahDAlmQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w9VnFxXeOkWDtLJVnuU7y8ANXPS0fCnhnA2dX6AlF+sgyyjfreeu7r4xeoWzSuVZKtWE0+765D8La3Wnna4d8EAm4Mfj8Mrfmj+sdW5GiSMqTT5YyfvKSdW/7orOaMsLBPdXQHfqV2POpbtsgJ+3v8u3xOxR2UeiDBNgoaNt0aaeNABq69PRYra91Arq2Wh9fICbwaYG8ugcnMwmW5WJ+Dzj7GZ8crmbz3HLZ/fF6uTtT5w8F/hNbhVhNwUNzUtUNwkZnFMHpyW2LsgHQxRt/0e4bihkYXc9WCiJfWOpusjqV0L3Ba0eYbMGpmsTtjS+57Gg9FCK2YOP6DljZSYV8K+W3AmoOJVZw+jWnDiBuANuznkz/s+vbDQVXajDJcz2VA1+rt8BMChwx/gnZE3ZvBD9wUbENdodt0tyhB9X9Kht3CjncEIZZu4YROzCcR3h
X-Exchange-RoutingPolicyChecked:
	l6Y8RhW87xg+vEVeiCw53hsPVITQO2HV6sU8foyL5DgUNHDD9uTKurIZILG2NCjq/y9jz7fqEdsNxF8/KIJqM5gqQQ3UB2wyPEoqL/Rj75b8Ds8mSXAgYk+kciKYiejiUg7rOIFo7hQbfpcD9e1aTuuBsFn8RzL4QcdjTptELMISAQh0udPfiJ6qoRuVQgXcGcacgnP4UGLYOpD4cgdHk4DDhsZo0nC/lK8Ok5RO0x5J2ZMlSpelydw8gY3lTVCmQFq27FwsspLMHs4YTpCI6mQDPjBsOwtgM3Ywf5EgWdb/kMfTBs3gz8Z4s970+BhpmeFZJ5FZqFJNNku21PLNEA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:38:43.1517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bdf16e-3c8d-432b-6498-08de95529fd2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8204
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=69d62227 cx=c_pps
 a=mafLo/wATi4HPiUbedi6XQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=0M8a4bpLSyoyAglpYocA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfXwDiuKU3CkoTs
 l6GBGHFevg+fmlok8nttDnRfg2lzsYopWrIwDQATt/Cx4Lt2AXvIajoJkb5owjrd7787Kil9j54
 33kZ5p2D/kipbHyml/LKBli7GS/VrTmQV1UYzf4iJfwpiWTgSS/4axof9d0S8iyv4XiRdJJe2HD
 /lFzGOx/6Fk/WV3mKf0Dj9UO+WK/v2lftyBRTcdZv7kPQn6g8fCWjBGSQlYQlfLrDU4exXJvDmq
 HWoySGtyqshqogkd8Ay+dATLHmiGyk3QtJXhcDMFeMHkYXHiiLERkeM7iJPPgFmUF+bcbeMdfQu
 Sy5Mst8nN4rOpBrfTmqLIkQU857mJg9LETyq+DVWQKobRVCk8YH/cDF4AiZ+GTX3fnVDZxAAgvz
 vDOOGJJQLKp79rpKY82tr2uJt0CqxcHKwdMWMCqnL+GxtAXhCQPtEG6ksRap+i7J2KVWvfG77j3
 0jnBQAfehwsQzmMLTbA==
X-Proofpoint-GUID: GhpIJmwN6PiyL8jaSl40hdLNdVTvj0la
X-Proofpoint-ORIG-GUID: GhpIJmwN6PiyL8jaSl40hdLNdVTvj0la
X-Proofpoint-Spam-Reason: safe

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Ensure that all interrupt handlers are unregistered before the parent
regmap_irq is unregistered.

sdca_irq_cleanup() was only called from the component_remove(). If the
module was loaded and removed without ever being component probed the
FDL interrupts would not be unregistered and this would hit a WARN
when devm called regmap_del_irq_chip() during the removal of the
parent IRQ.

Fixes: 4e53116437e9 ("ASoC: SDCA: Fix errors in IRQ cleanup")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h      |  4 ++--
 sound/soc/sdca/sdca_class_function.c | 10 +++++++++-
 sound/soc/sdca/sdca_interrupts.c     |  7 +++----
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index b47003c3d26ef..a515cc3df0971 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -83,8 +83,8 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *function_regmap,
 int sdca_irq_populate(struct sdca_function_data *function,
 		      struct snd_soc_component *component,
 		      struct sdca_interrupt_info *info);
-void sdca_irq_cleanup(struct sdca_function_data *function,
-		      struct snd_soc_component *component,
+void sdca_irq_cleanup(struct device *dev,
+		      struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info);
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq);
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 61b725cd52056..31fc08d513077 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -203,7 +203,7 @@ static void class_function_component_remove(struct snd_soc_component *component)
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
 	struct sdca_class_drv *core = drv->core;
 
-	sdca_irq_cleanup(drv->function, component, core->irq_info);
+	sdca_irq_cleanup(component->dev, drv->function, core->irq_info);
 }
 
 static int class_function_set_jack(struct snd_soc_component *component,
@@ -417,6 +417,13 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	return 0;
 }
 
+static void class_function_remove(struct auxiliary_device *auxdev)
+{
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	sdca_irq_cleanup(drv->dev, drv->function, drv->core->irq_info);
+}
+
 static int class_function_runtime_suspend(struct device *dev)
 {
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
@@ -569,6 +576,7 @@ static struct auxiliary_driver class_function_drv = {
 	},
 
 	.probe		= class_function_probe,
+	.remove		= class_function_remove,
 	.id_table	= class_function_id_table
 };
 module_auxiliary_driver(class_function_drv);
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 0693209ffed1b..5cdabf8ae9da3 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -555,17 +555,16 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_cleanup - Free all the individual IRQs for an SDCA Function
+ * @sdev: Device pointer against which the sdca_interrupt_info was allocated.
  * @function: Pointer to the SDCA Function.
- * @component: Pointer to the ASoC component for the Function.
  * @info: Pointer to the SDCA interrupt info for this device.
  *
  * Typically this would be called from the driver for a single SDCA Function.
  */
-void sdca_irq_cleanup(struct sdca_function_data *function,
-		      struct snd_soc_component *component,
+void sdca_irq_cleanup(struct device *dev,
+		      struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info)
 {
-	struct device *dev = component->dev;
 	int i;
 
 	guard(mutex)(&info->irq_lock);
-- 
2.47.3

