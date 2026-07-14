Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FB82F7F1E;
	Tue, 14 Jul 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038694; cv=fail; b=WnGtdvNMhi8dY0XQkztNGOgBQVSDKVL43F87PV8bddGPk9RjOWZxeEN+LdnfQ0h1XYA8wVT1lS6JajFTJfyqaxTd2F8sw9ssGw+qA3j1Zk/Bfse1w0r/jWzMghmzEBKPL+iAlcHoqiPK3grCS27rfX3rxEqSMrVSjATtCs6cWE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038694; c=relaxed/simple;
	bh=ukTyJAqgOTNYVb4utvnBylo3v+3UoF/sNt106qL3dzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okzezxcCMXM+3fg8fEr8SLYrJ22oR4SULMUxthpGX0bhFJdOFFloMTWbdqkmhER7hD+Oh0nSEGCor0177s5+yepriGsz+65FOa7j/zvKU3kZ69DQvTmcjXPDyj/ktpBEKmyI5FAne7bB/jEWVWSSxW9N6QVRDNm4bo+M/59o688=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jhyXSJcS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dPiI8owV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jhyXSJcS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dPiI8owV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DMmp0n3032519;
	Tue, 14 Jul 2026 09:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YTFOYIPNkyhFIRS0XhMDw65ZFSUSymNPHAi1yjsjZRw=; b=
	jhyXSJcSqesSpN4S6BWqYxRRdv078WelMR5kdJU4u6GDLrV9divojCF+isWRDJ4N
	AA3rUNL/ir9z9xLhA8I95kKX9IJ0Plw4a0b4jZ2n83hB6J1HBF9NaNcOecUU3P0b
	rYAbEYZjBU3pSmRrKR+cdOxXofodcaO52WIDnz2U1NXA4HMki0OgVnu5MkNSP0Ga
	kF8kcwMH2ZZlDAjvFsYhRD0WiKLSzrPmlbg3JnU345kwPLhUn0nVn3iZmCWC5J0t
	qWErb9XrScud2ajsIiqllormB+YQDv37/+QrkUkCl32FzY2eGtbdyKLFCQ85aNYQ
	1NUC5mBize0X7C0EIQ5P6A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023074.outbound.protection.outlook.com [40.93.201.74])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fm0dm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 09:18:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORViCbnnKOX+9Pe3Ahr86KtOJ51wikOvIbLdVbinAjFC/PYdNQMsD287IXo54+StjaK93uZwJcxK5xC3nVB0TGfIRYCuXT57+NEEc4g/xIgG50wkBps5tAzxUPuYlra64lEEvYSbfqbrij3WUGNKGpLptnLl2S5V5poeC4RfAl6vnTc1Yjj60TGbIXdp/Ef9farMLEcXykrUugFsVH3yRPZGyMYiB5wSet+2gVWRRQBzIm8vxQyS/sxJQ1+ikaA7adpo1t4LDb6gSYCsXctSmmWDjed1adH2RoeFLNVJda8dT2nOkRGUf0U19n3GKBCuEhyXvJXFfxzlFKenH3Wrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTFOYIPNkyhFIRS0XhMDw65ZFSUSymNPHAi1yjsjZRw=;
 b=c0IscoISOVegarvq5BKzqDnXIA8qtkkECanqqLpobgeBu7gQlX2sJyyDvYHV+a93EMGqTwol75MYYk04SjhLu/WLG/gRjUWKUp21BE5zswuUy/3GlR3YhTBCOigJIuvpSgX4w3dOzbp3wLhKehT10DZwSPKep9IkxmHnHGfD07Ld3cuQXdQmPMcBAe48/tqk8VqboJP71LySUfNWbavUtXddeHI5VAmhEddQEwwIt+wOQi2O8Shwy7KLALoM+/4uhkFM3TQ4f+L+b4CUTPrDRCKsaLkhvfMqc9Juk4JAcT8wX1ITlAZ0foM5Z4HZrjddd49VZIUIkeAZAKeEuPgqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTFOYIPNkyhFIRS0XhMDw65ZFSUSymNPHAi1yjsjZRw=;
 b=dPiI8owVXY8x2LxsrD68UBfd/6aVq+TezUAmT35ylzQj/YDHkrQKpINu1Faa3umBWLy5929iBX/fWMa3+6e0NEf9zgw7DDETpb3xsZNswrzW0lX6TH/ZxP83EYBMOih++iTDtTDH2Yqx5/CxEOWZ47w1ro1wWuz8LyM47DKKzS4=
Received: from CH5PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:1f4::24)
 by MN0PR19MB6334.namprd19.prod.outlook.com (2603:10b6:208:3c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 14:17:58 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::6e) by CH5PR04CA0016.outlook.office365.com
 (2603:10b6:610:1f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 14:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 14:17:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DC543406545;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C1CBC822544;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
Date: Tue, 14 Jul 2026 15:17:53 +0100
Message-ID: <20260714141753.897254-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
References: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|MN0PR19MB6334:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 811f2ba1-eb33-44ac-62ab-08dee1b2b46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|61400799027|36860700016|3023799007|16102099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QhLAoBvCfildIL75qZr1FepH6iC2s1CyFJX28slai9i/sEFjOj95yVtqBGYJAmVOyWJ+/Vtkx7ueUE3AMUxCoEs+0p4XMt2ZaF3hhcn1clxoh/ughO/1ZVyYjerVXFVJ4lecjYGk2UNPqAkWpPB5f3TGvFVxvSYHp+yqBWuhyutZYaZoFxyEnWTDJkF3PrrsmxNjKlRIYKt13ZkjMjk0tAaoi7Q8YokrIHDPsJeWSamgfYeDCf4ThxSXL0r3YrDBF5JtIp7nnHFUc0sShtLS+yIPzijsZMyLF7qnRhjFSsMPSRrK3bZThxEzGT8vGzmQjB0i1ZBzeHCItTroHKD7ZgkuzW4xGNifJL+oX88JzmH4mAmcMMMz+IO2KU42GwCiDXVTNVHJTXz4QU4wpTJF0SBh/vvCHC1VW15SgjceITsCXMUehBpKvgKxaxSyJ8YmlJMIvn6yRlhVU/L09RoG3pYbi+TUyObi7a7rxnBqx0O0syHbJqtYL8cVfYQVU8VLi5TbbU/Kuiiu7POMiu8fLrkybdHcZ3qEBslBpkb1SQlcs6E+BCVskM4euRGwsBJ8kLKXmdRfuM0d3JQSEaf0hiamvOsAUoAQDN1AnG0rCy4bk2dDIp6MRLVtwusug1WA7cxG15Ix8smhH7jOuOfrSDuAywh2WBnWPzHcqgr+cpmTx0ftAI86NPDHBykXjM2+1PCPSTOBTmOMSvfJ06f/nw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(61400799027)(36860700016)(3023799007)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ckeIS+M8+LJPozBwCJPxlEzKHLjB3BWRJiKtfR26g5rg+1D9hxXMeQa2/HB9GDdi915LO7qtLI2TgjDL5G3vB2NXGny+fHeUTE7EEs2A/JLftmTjP/VvZ3SiA3oYDO0/mJ39caa6WniiB+cdpvX9us8F6eLM+N3MLE8AYBV58U5TZ6qs8dIZtKke4IcTFgDd1A11/lxWz5uXAKRHUfjt9wTNWRu8XV+UrA890EtIjWxb9+kmDzggyXCSEfiGtBX5F3yK60rj/tuxL9ioW3jMP6ESesASj8m0TfZ7sBF5y2LTjdQ2lQBWwSThf0oKLgrki6P5D5zkYPs4lExcNEzxkWf20njukHVcwD08TJHhQ6dAUcBOAKY3DzXb2/5N9Wjm8mszVAHDZp9WJi6VcAU+qO4lwva5nPxMpZ+y+1uKpJPL+QPI8OyprzBp91osQkoH
X-Exchange-RoutingPolicyChecked:
	hfZZMZugyrU6/2tJRrKK1ZWF41ojoAU0AwDlxdg4xM+QOCvwHko9kHFVAAod0n9PiXb+27zvS/ZyPeDPnlRAoPf0c80r8V0AP3b2Gl+9zGpETKOMMqwRSL/7wCY9dQqCCsfTg9qgpBMJKzVbFrGnW4Dmpo+FGsRsNG5Nv0k1OCBi5p5OpaIrqugnepPDRPyq/mkeO+jAwC4CrKm5F2ABi2JMKq78evu3kLDJzps8rRlX3iVCSPpS8//EuzRGeGDqj3ERoe07We4GC4BcGVNmY54QVEIV+6MJmbEpzNpB+lmQIhvce6HSU4dPJjkNvhpNtmm5Ky377+VjmydH2r8EbA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:17:57.8456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811f2ba1-eb33-44ac-62ab-08dee1b2b46f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6334
X-Proofpoint-GUID: lbpyga4cSd7tn9SgxXfLL3eN5StaH4WM
X-Proofpoint-ORIG-GUID: lbpyga4cSd7tn9SgxXfLL3eN5StaH4WM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfX4UPW2WoTWUBs
 XLb3qiA+aKRjN+ymBbihavVg6XD63d7WJBwgFPF0fuhh6oSQfwuBUk1NHwnx8RGMrQYDG6GrNn1
 AmH8QjY5u57zyPSC6uoyCBdspeexj+A=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a56451f cx=c_pps
 a=HjV/FuyemSwh3JS6b2cR2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=cTvsH-JCG-SXLsoZKIAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfXwptnVBQfRt/Q
 /7r8QpdkoV07e3cW5dUO+UeN4CC4IkH3u9g+cfz0ntn4jfgilR/Ym90WrO8BpVKbf5ThGHInVCr
 F+gmJNNQh3W2u2rEc44EQHVgifstdMYuZfSldswCYOpCu/XFumanJLw0LjRMuXW9Gx1XkMUDeQs
 Y0UlzZC20jkfWZM9nEIajBdxbMrTSq6Dr+NLXXksuBzoIPiYKYeKhH5rF+Q5Rl561ZqvXxB1vAN
 7O3N/YfvZnE961UtXGFUnvml0uCrIBXY+vVPmbG13IFzJemA9F51UWxwT4yRQGqaQZhswlBHCvT
 lLP0gLHjV3Ilfo3TNQku+RjXnW3jMfnbScIEP0Qsstn6BEh53P3w6p8eb5QIcED8y/o38/AyWQ7
 B2vHl9aiAgL4ZxpYVnUzK35p+oXfSL0oA7Z3rHVzO+axD7g/BeKdCAuovqa51ow2UNmznhmgd90
 dFFJumB9D3gNt/E4o9Q==
X-Proofpoint-Spam-Reason: safe

Currently there are some race conditions around the boot of SDCA
jack detection. The core creates DAPM widgets/routes quite a
long time before it creates the associated ALSA control, and
the jack detection IRQ is currently registered in component
probe. At the time of component probe, the DAPM widgets exist,
shortly after this the DAPM routes are added. At the time the DAPM
routes are added the register value for the control is checked
and the appropriate path is connected. The existing handling
in the SDCA jack IRQ handles the case the control doesn't exist
and updates the registers directly, which works until the DAPM
routes are added.  After the routes are added the DAPM graph has
already set connected on a particular DAPM path, which will not
be updated until an IRQ is received when the control is present.
Thus those updates are usually not reflected in the resulting
DAPM graph which can lead to the audio path being erroneously
powered on/off.

Switch to the new fixup_controls callback to register the
IRQs, this is guaranteed to run after all the controls have
been created. Which means we can avoid the aforementioned race
condition and as a bonus no longer need to concern ourselves
with a case where the IRQ handler runs and the ALSA control
is unavailable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c |  4 +--
 sound/soc/sdca/sdca_jack.c           | 44 ++++++++++++----------------
 2 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1496a15f7d2ac..3826f16aae608 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -191,7 +191,7 @@ static const struct snd_soc_dai_ops class_function_sdw_ops = {
 	.hw_free	= class_function_sdw_remove_peripheral,
 };
 
-static int class_function_component_probe(struct snd_soc_component *component)
+static int class_function_component_fixup_controls(struct snd_soc_component *component)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
 	struct sdca_class_drv *core = drv->core;
@@ -217,7 +217,7 @@ static int class_function_set_jack(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver class_function_component_drv = {
-	.probe			= class_function_component_probe,
+	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
 	.endianness		= 1,
 };
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index ae9636622a840..2ac74b9826736 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -41,6 +41,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 	struct jack_state *state = interrupt->priv;
 	struct snd_kcontrol *kctl = state->kctl;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+	struct soc_enum *soc_enum;
 	unsigned int reg, val;
 	int ret;
 
@@ -55,10 +56,12 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 			return -ENOMEM;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl)
-			dev_dbg(dev, "control not found: %s\n", name);
-		else
-			state->kctl = kctl;
+		if (!kctl) {
+			dev_err(dev, "control not found: %s\n", name);
+			return -ENODEV;
+		}
+
+		state->kctl = kctl;
 	}
 
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
@@ -96,30 +99,21 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
 
-	if (kctl) {
-		struct soc_enum *soc_enum = (struct soc_enum *)kctl->private_value;
-
-		ucontrol = kzalloc_obj(*ucontrol);
-		if (!ucontrol)
-			return -ENOMEM;
-
-		ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+	ucontrol = kzalloc_obj(*ucontrol);
+	if (!ucontrol)
+		return -ENOMEM;
 
-		ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
-		if (ret < 0) {
-			dev_err(dev, "failed to update selected mode: %d\n", ret);
-			return ret;
-		}
+	soc_enum = (struct soc_enum *)kctl->private_value;
+	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
-		snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-	} else {
-		ret = regmap_write(interrupt->function_regmap, reg, val);
-		if (ret) {
-			dev_err(dev, "failed to write selected mode: %d\n", ret);
-			return ret;
-		}
+	ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return ret;
 	}
 
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
 	return sdca_jack_report(interrupt);
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
@@ -192,7 +186,7 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 		struct sdca_control_range *range;
 		struct jack_state *jack_state;
 
-		if (!interrupt->irq)
+		if (!interrupt->dev)
 			continue;
 
 		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-- 
2.47.3

