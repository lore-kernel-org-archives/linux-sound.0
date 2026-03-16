Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27383B2BA
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670521; cv=fail; b=dKKcQkuxMIxng0TtfUTrHH2Sm8w4HbgiP9o5sEGe0ANnb0eto+Np+TtlueKVc7d9oa8xXvVMoxtEMUS4WjpLbn3sDJHVX56/G0994RWh/oua6F/noZ7dVR+vfBRJyoDSjZhJ8DCivSTmsS0FeiW0TpOhrG7nhlOsVIjLzC3iRs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670521; c=relaxed/simple;
	bh=CgIRmbG0DorzH9z0AYaS0iz1HMxGuzBtKCQFE5qqe2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MjBi2LQBFbAlwMk78ljLRG4g8meUtddyzhDODYqDIMxCXSJPjlPo8+YIr/BcKpVuqAXfYdLhyGz0hGhrlgj+FhP1jnUIKJQ4mMr1eSEvu5QKua1jWZc6yNBoG7G22PpER9TasX0hks41Bpo0gt3/WGPmc7Qzx7bjmlQQU5k++Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DJHa5l8H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wJ4UGmuA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DJHa5l8H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wJ4UGmuA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDes5p1396383;
	Mon, 16 Mar 2026 09:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DDblwFce4CLDbXme
	FCWq17kUZ9XHYJr+Ai38go0l42E=; b=DJHa5l8H3JKDKcgn1p9r1aiD78JNWOiX
	n9j5SWru/Q2EQi4kNJeAQ0+4VIVXRGCeriLMhZc6O6xXVuixbOOkO7MWoe27bCrp
	s2RncTEPRKM/H/buRE04DTmtUMyeMcT8WwTHk5xB5HVSL2JH8TRJpPAdGEQR3pdk
	2MRvsGqvWL6BKl8o8Bmltkf+qspRh1u937XEbEbZnDJ0Kqskf6myl4gBL20FjPdg
	BCcqeoHQH+T/RQyKU7mfzdVx4zWKah+iD2M7WAMGsrmBjHJpbRaZAzsu6HP/8g7D
	UMK0Vro3vLn7H9R039oQ+AuT5YoWJ9FJuxpY1ScNEoNrq6bi5J2iog==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023083.outbound.protection.outlook.com [40.93.201.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v24br-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 09:15:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL/VMcdF+O1tCXF5Vtl3VvXF/siM8yFKlxXg5Hi+48JAZzUUWPIr6Cy8m+BiepEQlhycaFQp2XXrAktxDaEwnvfrmpcsCKIe5zOVUXKuxuXvWiiSnXYHDimmRuk4SeOkSt/5nH+RaFWhu0kKRGQEhu3ZLHK+6KVyd+aZzExVz/AyCEA2kqgCSW3G6TceP01YD/rhpm8ZPJlIe0k3DtHtaOGy34o/ag8obAWa1vTznEQv9/HvlJyftjdfrsL7wY4zIGacRJdujj2QXPqEBJVw8ePZokW3FtxLMD83ddqZlkVxj9c2nf+m/XyrMfidb+FaGDhOQ9Vk8AzA2aO0JSpkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDblwFce4CLDbXmeFCWq17kUZ9XHYJr+Ai38go0l42E=;
 b=UYKCkV3ZCTZ4T/Yoo1JMuFBOEY18jtNI2qBvkRO+h15CiP4hRO162t9i2jhJsi7CyS4TITRMMqOBgppXiJe1Y46hWKXcKCNXBPCSTh73gP4OJBWidqUEy/hzsrzWSL5gK8GubJilnNMDz4Uu0mKK8I75nZX7Ips7f00LJI6Fu9M6+BPbN1AM81jUNrrOOTSJyLUn0MO647r4/oks41Jr+5xFbf7xAFBz80C9l97Xnff13z7sl3zwrkThMFmDAEF9HsR9kQefjw2DSrhFHlg8HTKQdCgBTkpzIrEKJsC3Gurg9AULG2oYinsJ8BvCdqddXDT0i6oXtDloGm4EfKXxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDblwFce4CLDbXmeFCWq17kUZ9XHYJr+Ai38go0l42E=;
 b=wJ4UGmuAk+0oEigVSAfEx71BHkv5zcvn81lIu6pTK40pOATvsQ0pPej8AH6UftXrqiKrKz5sy0UICXoI2fy5+rNzACUQg+lWaeRtnmn7keocKsVAX2yRRbo6hriniHcJhUJ68xRHIgUrlIlpAZw7NQLiGB50ScpQUhRvKmp/eh0=
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by BL1PR19MB5986.namprd19.prod.outlook.com (2603:10b6:208:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 14:14:55 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a0) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 14:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Mon, 16 Mar 2026 14:14:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7056B406540;
	Mon, 16 Mar 2026 14:14:52 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 565F9820247;
	Mon, 16 Mar 2026 14:14:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: gaggery.tsai@intel.com, broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Fix errors in IRQ cleanup
Date: Mon, 16 Mar 2026 14:14:49 +0000
Message-ID: <20260316141449.2950215-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|BL1PR19MB5986:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06f2e326-56d4-49c8-63ba-08de8366658c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|13003099007|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0SL5gDMPAOMGk95EyaPXQzRXo9WVohtDpADQ/RBxUZ+qMqebxzkbBmIvWUXVV6G35UqTCYsN3SvHt+4PDLS+W+8jyeiGV5D8KqfjpaAj0ppwW5BjRdS4xePbZwZ2QzwPXoU7dVH7aDg7bRHhqE5WKE0tLY6kwjZ9Aq2gd4YEyQfzGR741q5NxTnFEpZX6mkV8Fafij9z4ZVkxEpT2kH9zFA2SjHc3V4h2zaPXhl4J3s1xzw2h7Vf3WHWJ3fNdcF85+rQBiLOKUWQlJ/tOzGASl81MFmzDxdKvWnRQtNsqiVao6ik1oCdkE6DAWQ6yCf82bLJJnanOOrnkkxnvpMsnfCGPfpAeqCbezOIXgPpu5oOam6u3/80yLH1QXclP3HasgTD+A9/RJS4fX2/p0qeU4qI+AmkcMBxqIQic3pVTHTWwuvnLepd3uCyxiQxZllJmRDvS7+FBQTJ6vhw42krnIDgXcnrbzrhmdKwcnI9jeHTY8s89V+j5ku/XfNLVmpK+fHjI8VDx8tVcBQUJjep+ynIyp+ByPhcGjbAVxMSiSYRdoUObORucM+3vyBEu3cMKU3iHmRac/KNEmpQvRW+TxVplE/FIS62Gn+QNMhw3ZmC1zZLfs3vrKKfI4AEiz0QHq5CwuNZ1CHCpJdDYQVLruVhniyGxUgwid7ssBTyVM0LlTAi6AODZ9AfGYb5gVJmLOEA/kJmd2GJoTpxrZHehwKPoKv4jNKKCPJOY0d5dyw4QEZB4BgxFFlU6LY4np+uHtSz700vs76c44Ve3NjrIg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(13003099007)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+q7qSU3DSGUOFOYHwEJATG0MjtWEEBIx2u4QVHroO54XZq3ZvPpGdgbrG8cc8Y/mBNcHTL2LmcqaFir99u7WnZVgzpf0+gbliXQENYmjkE0bofplvkU0Dzih/K/d8dZvWFQ5xXqLXNwEcjjq2CP4wLOJ/siY8HXHcdIQnfnUTIuSDns2/7jB2R5TWtUrR7aIYDAFrcAdycaWwMaRR89rXWNNld2oedRNXwR+aIVhjmZD+WVRdq/74NsTjh0XWV2xZgD714fmWBDB6wlquUo4xbJ2x4nZpqn9snHlcRDONWHpHzf9wIJ3nULXd/aLaUfDfENyie8upEOXQJ+7b6uDyvuZ3dFjJ1eWpCWLCM/xHOLS/eMaAqPG6OqN/y3aAd67pB9PVhWOOiKoWT6fzW6gzXVRdWAZWxiA0/9uJ4WbDrig//+hydYKl2AQfQ45ofVJ
X-Exchange-RoutingPolicyChecked:
	v3N291/BmF8bCfQJiSCyD5t8dhGwlJO1ze42fw4EPsnM8Sjuq8+o6M8Xt4FiNuyiZcl+MlciZJaw49Z1QOga3nb9eugqsgfUZZH7ZVB/zlSEsKxLhYO5JpPB4FjxuFJtAdxHjkijJ4F2YxbRNXM7K9wl9nZfYJQDdDg1fydR9USDkNb0Aei6+FaGi7BlRtm2Z3/Psiwg65iQY2oS+EPAM2r4uj3ffQcFigEPi8IwrI9WX0eFvi48IUDpuwMCPjoQoO/RAFEKzFlMkSgllXe9L3Jmf14UArVmYgK6jlf06O9YQJg/7BiIMtlHjmX3Xqp2m3JKJbOm8FPOjxpN2RV8bw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:14:54.3487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f2e326-56d4-49c8-63ba-08de8366658c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5986
X-Proofpoint-GUID: 8vhXmBbFJW4Ocd_he6wHZCdiU9QM0jGo
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69b81066 cx=c_pps
 a=Kl5DSHqeMBbv3ZYbUOuQHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=09Lxc2znnBOCjE97__AA:9
X-Proofpoint-ORIG-GUID: 8vhXmBbFJW4Ocd_he6wHZCdiU9QM0jGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNyBTYWx0ZWRfX6QHzyd1HXddT
 gsm8UMjaBY5KZ+4jrkAHS5aHU6CbxpUbV+l+fQDFxPm/1CJCvFLy2hKWEE30rh4hpltMte0x3oe
 1zCBiLyMdqetYDd1+g9KongEb0qln6xya16tQHTBfuLAq9bGpcLZspmhWSyF8sPPaBbVduAkSlZ
 egvofSIJUy52sxOsrkMQZ0kEHuVIdRcp6Ewc2zJ+OxyH5swfvIdGSwykSFh+TzQQEHPYsBVLdEm
 CL3ff6NMStQkXXCB8aXCLowcEzG6PcdPTGHTzA4Zkw7hRz8aqGGQ74/pUo1JBBnvnHk4/t0Ass/
 XdyY5/0G10NBjNmFSu2u7EJWBRsL3pUMlzEj49pti2tbiNS6N/5wr9ngb4Rk/dITuFtZj1CuQoa
 g++N9J1g6XOgzaZw1r9dNnRFU9wBC9IY2BpGEjAidcUIqWvYui/4s/VbfGW9rrpLun0ty+DC/Dj
 Zgc4Xbc04fAsBRAm/Hw==
X-Proofpoint-Spam-Reason: safe

IRQs are enabled through sdca_irq_populate() from component probe
using devm_request_threaded_irq(), this however means the IRQs can
persist if the sound card is torn down. Some of the IRQ handlers
store references to the card and the kcontrols which can then
fail. Some detail of the crash was explained in [1].

Generally it is not advised to use devm outside of bus probe, so
the code is updated to not use devm. The IRQ requests are not moved
to bus probe time as it makes passing the snd_soc_component into
the IRQs very awkward and would the require a second step once the
component is available, so it is simpler to just register the IRQs
at this point, even though that necessitates some manual cleanup.

Link: https://lore.kernel.org/linux-sound/20260310183829.2907805-1-gaggery.tsai@intel.com/ [1]
Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
Reported-by: Gaggery Tsai <gaggery.tsai@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Hi Gaggery,

Could you try out this fix see if it resolves the issues you are seeing?

Thanks,
Charles

 include/sound/sdca_interrupts.h      |  5 ++
 sound/soc/sdca/sdca_class_function.c |  9 ++++
 sound/soc/sdca/sdca_interrupts.c     | 77 ++++++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 9bcb5d8fd592b..b47003c3d26ef 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -69,6 +69,8 @@ struct sdca_interrupt_info {
 int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *interrupt_info,
 		     int sdca_irq, const char *name, irq_handler_t handler,
 		     void *data);
+void sdca_irq_free(struct device *dev, struct sdca_interrupt_info *interrupt_info,
+		   int sdca_irq, const char *name, void *data);
 int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
 			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
@@ -81,6 +83,9 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *function_regmap,
 int sdca_irq_populate(struct sdca_function_data *function,
 		      struct snd_soc_component *component,
 		      struct sdca_interrupt_info *info);
+void sdca_irq_cleanup(struct sdca_function_data *function,
+		      struct snd_soc_component *component,
+		      struct sdca_interrupt_info *info);
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq);
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 98fd3fd1052b4..fe404d769c78c 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -198,6 +198,14 @@ static int class_function_component_probe(struct snd_soc_component *component)
 	return sdca_irq_populate(drv->function, component, core->irq_info);
 }
 
+static void class_function_component_remove(struct snd_soc_component *component)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_class_drv *core = drv->core;
+
+	sdca_irq_cleanup(drv->function, component, core->irq_info);
+}
+
 static int class_function_set_jack(struct snd_soc_component *component,
 				   struct snd_soc_jack *jack, void *d)
 {
@@ -209,6 +217,7 @@ static int class_function_set_jack(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.probe			= class_function_component_probe,
+	.remove			= class_function_component_remove,
 	.endianness		= 1,
 };
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 95b1ab4ba1b03..1838dabcdf604 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -252,8 +252,7 @@ static int sdca_irq_request_locked(struct device *dev,
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_threaded_irq(dev, irq, NULL, handler,
-					IRQF_ONESHOT, name, data);
+	ret = request_threaded_irq(irq, NULL, handler, IRQF_ONESHOT, name, data);
 	if (ret)
 		return ret;
 
@@ -264,6 +263,22 @@ static int sdca_irq_request_locked(struct device *dev,
 	return 0;
 }
 
+static void sdca_irq_free_locked(struct device *dev, struct sdca_interrupt_info *info,
+				 int sdca_irq, const char *name, void *data)
+{
+	int irq;
+
+	irq = regmap_irq_get_virq(info->irq_data, sdca_irq);
+	if (irq < 0)
+		return;
+
+	free_irq(irq, data);
+
+	info->irqs[sdca_irq].irq = 0;
+
+	dev_dbg(dev, "freed irq %d for %s\n", irq, name);
+}
+
 /**
  * sdca_irq_request - request an individual SDCA interrupt
  * @dev: Pointer to the struct device against which things should be allocated.
@@ -302,6 +317,30 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
+/**
+ * sdca_irq_free - free an individual SDCA interrupt
+ * @dev: Pointer to the struct device.
+ * @info: Pointer to the interrupt information structure.
+ * @sdca_irq: SDCA interrupt position.
+ * @name: Name to be given to the IRQ.
+ * @data: Private data pointer that will be passed to the handler.
+ *
+ * Typically this is handled internally by sdca_irq_cleanup, however if
+ * a device requires custom IRQ handling this can be called manually before
+ * calling sdca_irq_cleanup, which will then skip that IRQ whilst processing.
+ */
+void sdca_irq_free(struct device *dev, struct sdca_interrupt_info *info,
+		   int sdca_irq, const char *name, void *data)
+{
+	if (sdca_irq < 0 || sdca_irq >= SDCA_MAX_INTERRUPTS)
+		return;
+
+	guard(mutex)(&info->irq_lock);
+
+	sdca_irq_free_locked(dev, info, sdca_irq, name, data);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_free, "SND_SOC_SDCA");
+
 /**
  * sdca_irq_data_populate - Populate common interrupt data
  * @dev: Pointer to the Function device.
@@ -328,8 +367,8 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
 	if (!dev)
 		return -ENODEV;
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
-			      entity->label, control->label);
+	name = kasprintf(GFP_KERNEL, "%s %s %s", function->desc->name,
+			 entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
@@ -516,6 +555,36 @@ int sdca_irq_populate(struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
+/**
+ * sdca_irq_cleanup - Free all the individual IRQs for an SDCA Function
+ * @function: Pointer to the SDCA Function.
+ * @component: Pointer to the ASoC component for the Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Typically this would be called from the driver for a single SDCA Function.
+ */
+void sdca_irq_cleanup(struct sdca_function_data *function,
+		      struct snd_soc_component *component,
+		      struct sdca_interrupt_info *info)
+{
+	struct device *dev = component->dev;
+	int i;
+
+	guard(mutex)(&info->irq_lock);
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+
+		if (interrupt->function != function || !interrupt->irq)
+			continue;
+
+		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
+
+		kfree(interrupt->name);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
+
 /**
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
  * @sdev: Device pointer against which things should be allocated.
-- 
2.47.3

