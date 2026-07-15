Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F228725B;
	Wed, 15 Jul 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132977; cv=fail; b=I9xwbXHa45e9sxcKGmvODaA8t0tW0SaMehkHDr4Lc8Tf50vYrKxgTLW+qgaQ/G2uSNUEfUzDagEh+6IGHWq4dro8n31mJllEGz8XZS60ORKNkdRDMwLLXZzgZRe70qG5QcpwLxugVQiaabDjecD85dKWeqYFPcZzUDD4HpK5rzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132977; c=relaxed/simple;
	bh=VfL7okg+eLEDg7Nvt2s3vXR3U1dU7JVVTJVWWvAhs08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbTYgsMSCZKEbcxEeR6horWjob4AuP7q7w6XPS60TG2rk0EOmacDsiyqNpC/wkQHeiIs38xWZ11s+zSyxpEhWrNtOxJRnSTmk/TKalj0RgbESPG7LyM0WlYw5tO/IvgrcuCHvnzm5chSv1V7JhLZLkkinz+/Du6NNQNGgjA0CJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Vt8Xnqeb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hiCAftX3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Vt8Xnqeb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hiCAftX3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F1tMlN031725;
	Wed, 15 Jul 2026 11:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Lixo7Ycxl8XDoBu8/ET35uMFplL09oaSZPXt3Nwugjg=; b=
	Vt8XnqebhMPNEy0lOBhTtsgivVzcWSIJRqiljkro1/SG7hwtcpaUvKuFHDpn0QQS
	2C0LyhV9qbBJ23xe+tbTLshE9+KSNXFuZpEqqWbnNgo7WI2hV2xciMzv76PPvezX
	JKWMg7xgv4D2KPEy7jPZP310axQXBLicLU1d8K2YO8fZAexF2342Y3AAmyon5LGb
	sn+bWQfjy562UzuUL3h2DRlvOrvkcd3syXFoRopxBFYK3pUauoaKWu15u1+BLRd2
	DdlxPLvObvk8HCwnD24PT++eAV0l7+ONaAHCBiXZUFO9L2kbLL2AgnJjUbucvPRG
	Dv9yOLcsoeFhkWklVY3VQw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020085.outbound.protection.outlook.com [40.93.198.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vwu1s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:29:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsnXSDLCHm4pSmkHjBV09ES0SK0iAG+d4gDCvA46gc50yABVnE35yc73NKXcLERwI5QGfpkGf/R1NKh8weOVouDMfMguuRzS5u25FkBO5dLIoH96EUc0MbicGs+ZaohsruN+5/Jo+KH3mI2p2p02J9JkRauoVCI+KRZC/QBYsAVpmcku7klBgh+C02L30MrJMnZBfV6vw8ATT/szCobUOoF3R93wWzA1EON14yPuaKQCHOiZko2Vz1UGPB8VK8lqevIKw3gjflQLDr9sqsIRhV4A+TrW2iIscBKhsWmWpc161OJ4pbgJEEUffonZfSwMBoM7cU22zZr/5Tpc3zAuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lixo7Ycxl8XDoBu8/ET35uMFplL09oaSZPXt3Nwugjg=;
 b=TELMTgI8RoUkWy6bZeWRvQ1jjxl/uHtOS+qT7KxMaWNNa6V1SU4D0aaZ2lONgLDvdIBEgHtSyTcrTuWe6g4PYsCUIWxqMgjuKQvQvAnGcEyvp6WUCZZ+YFv9lrDTg4hsLhzJBJywg/L7JlOgvmKS/xNz0hKmh4pB/eeqcGgJpx6Fp9Zwiyq473YIs01IKLv1bZzXvMSayt7yQOS6dFfb/RfugHBWS6fOjs3c3oX82JIdGIK3t1mf9q9aGbMOPU87rwHYULIKGyjbvw8rkr02jAI7EKBqzIMMsCRQAD4TDRJ1rE58S8vJ79Sg3LFr8ECZvOZpJmh2tQO4XpEV08LXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lixo7Ycxl8XDoBu8/ET35uMFplL09oaSZPXt3Nwugjg=;
 b=hiCAftX3KePZiA2Jw6ga18n0B83w8y4fN74gjxpFHWnQAg0XDTBHRPN+XenltxYpvgzgI1wBgeXaG7R6doQ1u2NP1Q2hc9QC1deUGvMrjdYEisEg/7phZ5HgpwqYiR1jbI80+79Am+JvUXfDoaFRsXSA64Jqz9OsDQHQAB6OKis=
Received: from SJ0PR03CA0296.namprd03.prod.outlook.com (2603:10b6:a03:39e::31)
 by DM6PR19MB4295.namprd19.prod.outlook.com (2603:10b6:5:2bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 16:29:24 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::16) by SJ0PR03CA0296.outlook.office365.com
 (2603:10b6:a03:39e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 16:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 16:29:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26EE0406543;
	Wed, 15 Jul 2026 16:29:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F3BA9822542;
	Wed, 15 Jul 2026 16:29:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 2/3] ASoC: SDCA: Populate IRQ data earlier
Date: Wed, 15 Jul 2026 17:29:17 +0100
Message-ID: <20260715162918.1898396-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
References: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|DM6PR19MB4295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b2125dd4-45c2-4c1c-3b6a-08dee28e3b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|36860700016|376014|18002099003|22082099003|56012099006|11063799006|10067099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	MFrwYxp+LQcd0pzNHEodKuqKN2aiJkI9DZmpZ22bl1GDkI1tvJbTRqRrVlxVAiiY4Twz25gl9H4QQeEWQ8sj8oJF+TOZUMjwBYNKmT3FqDpUNrtZ4Mq2UaWLBLhEBl4TD4MT2AweyOCjmM3csY70cF3pMO7ZAuYuAXO5ri++rIdJDcZLtwG5h5B9EEwRVKy5wROhrO3tXvf47PVmK6CY1w/wWiJ0Mic79F//lvusAPlOPkK62GGfprKgRmqSxOUVIhYEUzN+sjyYoKMor6RfF4qodrxwKaWjFUoplMZ+XXbKs3sTZj6ak1KAYAbggEVMs+fzgNAGfuY45qfhMuevuhTxrFpCqsVYvkTE6Z/Kcq8hKOmD2Fqnt7AW1xMoRU6ZCOAGvj8UGIkl1pUpx7cbBLswiv/MRdTEHjddhkIEZlBIZCZXIOPs0RL8aNbbsoC//d+F1HoEtMzctVK3FNVojFvHWNZUCjRXGoWdoShicP1n46cd31oQm1ESVATPuSyGzvym5wnP2d1HSk9UNoVyhZDKJW68ZCNaAreIeOVKglodWqfiLWBoj/p2jD8e7CdZprJQhDCUEYi4HTcfFStZ5p5FWNlLEiI5tT4XDZEeK3Q2e3/LZIxHJGaHq20xYhJ6VYJRafNrSmk8UV5RCxPhAj0QIYQXsgtFSTU8MB5iudr2oI4PdHTVCyQBL4Yl6Vo+JeZZ6wFG6AqtYBF1k+TIEg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qs4rAVqcs7iABDNxkPoI2KXih/wioR0VPdyqHuAgfJWNCYb+NPFrctFCTULGX8WrOPd5KQ0Iqi0j3qKIv0+nOQFkWYHIetBrRr9zhHj7YCt8/CskQMKVoBDzIfb1mLNj1R2Kb/Gyjgkcv/kg1TC1cGZsc9CKb20oIemEcxlWYPNmNjANxnAmLN69nvyb6QbyFr6/7NAN0rWqVzYFqCuGMK+NG9L9VxG6PXdyw/rqpQLFhy+CS7t0RsDWjGWD6/Hbb5CA+iQsIlF70GHyR6nZaXNhQmkCzMMhDbM1KxeoyZLDkrseX5n5uPqszRSgbUQ+E4tLM/EhH/lKoaD9lbTeiptbJD1EQsa17BwSTHZ44JtpOFVk1FHwTj7qd3kCsLFTvYUwlLt7FcTr19jjOkCljyE5SlV8yjuOOiRa2tY0EUMjrxxuHvuBdy6bX9p9CoLj
X-Exchange-RoutingPolicyChecked:
	HeYsv5mcyp3/A1/7rlLFHZYmuuOAO9A9Wi456G5ZPQ4v+3A37bHmcFnSJowYonjCNdbZJ0aY3j/XB+YBZTc6inKIeI0jXIXTpw5bv5GpVFO3iW11vXB2kQ1VQN11F2bOENf2xk7YwkjAr6wnTqO/2USnqgzHDG8OWSJgOkejRBwgEnQpzV/n9GViYKb84ZD3eDv6IuCsHyaS9ccf8OBV1i9+3jvoYjyGO+8jvy3cYgiWilxffwMvzxle4E7K5WtwbHDN8W7zqRAXpWw1OFnYckhGo7rhkCYW+jsWMZ/EqnfsCGNAeQQXtrQH0SaicFaefgI0r+C6JqkM+PV4qxsiCg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:29:24.0257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2125dd4-45c2-4c1c-3b6a-08dee28e3b6f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4295
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a57b569 cx=c_pps
 a=A0XUNoO2kYPMKlNirmUWng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=5JuS2gtCSTrAXiciZ00A:9
X-Proofpoint-ORIG-GUID: LaXC2nIsX-d-IvTQfaxuZTZ0xULFjiRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfXw2A/3hxPu1ov
 1WEAZkzT/D2Bh+QWhdvN4HSop15RlRqglLJbp7ewCb5G75CQHittKEJYkyGzWl7JQp4XmTN1PY6
 dKLnfYQJlyUxf1KMBIn31MjBVvKE9oM=
X-Proofpoint-GUID: LaXC2nIsX-d-IvTQfaxuZTZ0xULFjiRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfX3vRRmllftFm5
 sxlxGk3jm7C/uJzKXTfQm3P5C/XMB1ncZwdS2OMN2+TzbdjbapIVlGcqjMBZByzdTAlqnK60zfl
 WgAUHUnJRt3MHDNm7ZB5cYbhXEL3kIUv3DyfCL5lmz/q7pbNvvQ9UW0ivox9wVJWyD2wSJvND/I
 BkfELumJ1OZd7xfuCDQOXeKcDTMyCRZ4v4rsN1nNPHM7g3NuzbZIiFjsxYXsA+Q74pUZ8525/oo
 756sJEHHe2FJWLbuba9jFgon6VyxSRdJl2A759ScPXUFSq+ZmhywJDi5kNuDPqM3MkhFruHwsrg
 8HI8BWMIjFzQpG+Yi5TOcccg9vkbShgyPFWtOzF8WiB9hvBBKvUaDwD3SW2hyIxguiVkJpU0gHQ
 H7USjVR4nQ+Wx5rtmreJk3e+qmoiA/HtCDHFwrSSxKIZbovZ9fkNIybZFIGIqtlJRrMk96sn0qW
 CyAt4vsQgLOteAY886w==
X-Proofpoint-Spam-Reason: safe

Currently, the IRQ data (attached Entity/Control/etc) is populated
as the IRQ is requested. However, this can cause issues as
occasionally the setup process wants to access specifics of
an IRQ before the IRQ is actually enabled. To facilitate this
cache all the IRQ data during sdca_irq_populate_early() and make
sdca_irq_populate() simply request the outstanding IRQs. This
also has the advantage that sdca_irq_populate() can now just
iterate through the IRQ array which is much smaller/faster than
going through every Entity in the Function for Controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - devm_ allocate the interrupt name now that it will always be
   called from irq_populate_early which happens at probe time. This
   also avoids a memory leak Sashiko spotted.

 include/sound/sdca_interrupts.h  |  2 +
 sound/soc/sdca/sdca_interrupts.c | 98 ++++++++++++--------------------
 2 files changed, 38 insertions(+), 62 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index a515cc3df0971..20ff5eac34eaa 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -30,6 +30,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @handler: Handler function to be called for the IRQ.
  * @priv: Pointer to private data for use by the handler.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
  * the IRQ being assigned.
@@ -44,6 +45,7 @@ struct sdca_interrupt {
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
 	struct sdca_control *control;
+	irq_handler_t handler;
 
 	void *priv;
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 4539a52a8e32b..6bbe65ac3d2f0 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -375,7 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
 	if (!dev)
 		return -ENODEV;
 
-	name = kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s", entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
@@ -448,21 +448,34 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
+			ret = sdca_irq_data_populate(dev, regmap, NULL, function,
+						     entity, control, interrupt);
+			if (ret)
+				return ret;
+
+			interrupt->handler = base_handler;
+
 			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				ret = sdca_irq_data_populate(dev, regmap, NULL,
-							     function, entity,
-							     control, interrupt);
+			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
+				interrupt->handler = function_status_handler;
+				break;
+			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				ret = sdca_jack_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->handler = detected_mode_handler;
+				break;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->handler = fdl_owner_handler;
+
 				ret = sdca_irq_request_locked(dev, info, irq,
 							      interrupt->name,
-							      fdl_owner_handler,
+							      interrupt->handler,
 							      interrupt);
 				if (ret) {
 					dev_err(dev, "failed to request irq %s: %d\n",
@@ -470,6 +483,9 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 					return ret;
 				}
 				break;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				interrupt->handler = hid_handler;
+				break;
 			default:
 				break;
 			}
@@ -495,66 +511,26 @@ int sdca_irq_populate(struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info)
 {
 	struct device *dev = component->dev;
-	int i, j;
+	int i, ret;
 
 	guard(mutex)(&info->irq_lock);
 
-	for (i = 0; i < function->num_entities; i++) {
-		struct sdca_entity *entity = &function->entities[i];
-
-		for (j = 0; j < entity->num_controls; j++) {
-			struct sdca_control *control = &entity->controls[j];
-			int irq = control->interrupt_position;
-			struct sdca_interrupt *interrupt;
-			irq_handler_t handler;
-			int ret;
-
-			interrupt = get_interrupt_data(dev, irq, info);
-			if (IS_ERR(interrupt))
-				return PTR_ERR(interrupt);
-			else if (!interrupt)
-				continue;
-
-			ret = sdca_irq_data_populate(dev, NULL, component,
-						     function, entity, control,
-						     interrupt);
-			if (ret)
-				return ret;
-
-			handler = base_handler;
-
-			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
-				handler = function_status_handler;
-				break;
-			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
-				ret = sdca_jack_alloc_state(interrupt);
-				if (ret)
-					return ret;
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+		int irq;
 
-				handler = detected_mode_handler;
-				break;
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				ret = sdca_fdl_alloc_state(interrupt);
-				if (ret)
-					return ret;
+		if (interrupt->function != function || interrupt->irq)
+			continue;
 
-				handler = fdl_owner_handler;
-				break;
-			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
-				handler = hid_handler;
-				break;
-			default:
-				break;
-			}
+		interrupt->component = component;
 
-			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
-						      handler, interrupt);
-			if (ret) {
-				dev_err(dev, "failed to request irq %s: %d\n",
-					interrupt->name, ret);
-				return ret;
-			}
+		irq = interrupt->control->interrupt_position;
+		ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
+					      interrupt->handler, interrupt);
+		if (ret) {
+			dev_err(dev, "failed to request irq %s: %d\n",
+				interrupt->name, ret);
+			return ret;
 		}
 	}
 
@@ -585,8 +561,6 @@ void sdca_irq_cleanup(struct device *dev,
 			continue;
 
 		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
-
-		kfree(interrupt->name);
 	}
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
-- 
2.47.3

