Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928C53168F8
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182555; cv=fail; b=tjUEh4d03xT9Nnj3ZTnzwxe/pYGeAYBZhs4xPE/0R1g6/hg6LhDCGcaCGhB+1EgVGh/a80CvrGGWk1q1Mcn1NC6YgUE5vcA2CG+AoWwjV0iOgvMktuyvXF9UJwDVrVPe91/rmIRBQwnkof+n5pWTZP47brhG7ait7toUVKr4794=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182555; c=relaxed/simple;
	bh=MCCfU4q55gB9kNQtKkw9VMuUKi6FoSphNUu2UYmIoEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BhPiBhtb762+UQcL4wEeaS+tMFEFP5RXkC4aJg9qvvdyR0/6LbuZC/QJghdWy+zAW/4I0y7Ey2bVI5M09kYryJucjHoEnb5I8v5yzvU8TKwQrZdCCyzQHb4e5u9OYGK/qU6yjmRw/4y4Vsr7SKHcG05fQSK/dPwa/Wm7FJy8EJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lMIb/eiN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vZi73F2b; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lMIb/eiN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vZi73F2b"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34tUYm835950;
	Mon, 3 Nov 2025 09:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=E2w/UQjOWhFJynkfFtv9DQNP3EH70Z7sLebDArZDIbk=; b=
	lMIb/eiN/BOoqTVo8QgegBgSg4l3o17bgg4vUcGmhPl4QuFXs6BSu4IhFhh48UQ0
	11G3T6k9SbHN7yLhfinjGRzE9Uir/AjMRCbAn7Ih/nModBpVvlOcWo9vLpKGPwgA
	ucBkGdEbh2ROO+YXq/TOHY3xdpqPZMLbdRgnD+h2/tLEdNnIbvVOMMsOH+57/ktN
	Oi40OOmfO1N6dt/1DDy6yT0InMWBjWT6WUqRFfij/esfWUKaXbNNl76UBN15R0th
	4ZyhBPdAJo4UqFiYz/vTST+qMmZA7IUqetYQPCkNff8Xz5BVh/X80qOz3vPlkZFy
	XLRsfwp36vtyY7zgz5xkkg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020133.outbound.protection.outlook.com [40.93.198.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a5emg26qy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPQliE9ZfVGCfgpJCP3o47pWDwOiI0K7J2OPR+c3BsB6QqwGhJgPAj9Z1FbFLQ8Bd2467t4ltk+cKbZexgk0h14FN8Eg0ydAya049ToOFPPZwtQiIzVdNN71/vbgw6UWGmEXzcx38H29fRLzlL8B4VgBLC5qr90l0dQ9wOQBvISkqjFf+4mGKSREV1kd7wmnlTXle8vBjHGwEHBe9STCVuBvH23aq5ezNk6xcsZWfuJg4ME/R4GXFWAccJFHDLDiNmNzWCGboC6xu+wGEJKO95zVhYrPglUwmzgk5viRDvwR1TKPtfWilDIjj9vKP+zptsh5j9PjmLfbn/kgNaXJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2w/UQjOWhFJynkfFtv9DQNP3EH70Z7sLebDArZDIbk=;
 b=CWfyi1Q2MjvWj/DRNahNlEDQzgDr+GVU4SpmQR0mp6pCbaB0XPHyEsO62nuGMts2lOniyN4pb1jWQ9ppO7HmqH2yWbYbE7aS5RejfkLS1W9pH+yy/tfmbGxO4anqN5AAvBM5sMDcs3OxV3DqJiw0xaOmZCuCwjl9TaDjtDne0sj3znFDuicaiYrExR+N+/jsZjhdMRY0wV/APRtGZC675COjG3mT2fUjcyudVlw3SV3h5UPVGNcjbcipSaGoJkqXnDoRX/Ci6J1KUlRcxqM556g+HzpBOOu8jukiS5cb7k4qbVxvrPjMHwTDA+H1/KnTmYzl7RF0ORbG4ARfKWhfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2w/UQjOWhFJynkfFtv9DQNP3EH70Z7sLebDArZDIbk=;
 b=vZi73F2bIKxD6XhPNfyz4B1WMwdRKYGZE3vwh1xXeG/UoBWhroCXpLSiG29eCJRxRkjgZ7Gl6Cr9AvdHqtTaWtZpv+FLhhQ0IKAYl/TjLXj339IIXcVnROpxCpjF9KjXgRbb6ebl7xRVlgGJHZzuLw3Qzc4HyKhGgUiiwb2xsVE=
Received: from BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35)
 by SJ0PR19MB6582.namprd19.prod.outlook.com (2603:10b6:a03:47d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:20 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::3a) by BY3PR05CA0030.outlook.office365.com
 (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 15:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Mon, 3 Nov 2025 15:08:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2FC8940655D;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 98DE2820257;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 06/13] ASoC: SDCA: Move most of the messages from info to debug
Date: Mon,  3 Nov 2025 15:08:01 +0000
Message-ID: <20251103150808.4015208-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|SJ0PR19MB6582:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 95dee38c-4a5a-4412-5145-08de1aead35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYaPGwO6S6aivY0oSPeQcp7h1ghl10ypZQvkwfMjln+3I/KkWWUd3OUtiNRp?=
 =?us-ascii?Q?Q56ebmTiASpFAHBeYLSvKq5502c4GVqZh/GhEGsrBc+XCVtJeFv3Tl+9TYpA?=
 =?us-ascii?Q?H49k3W9icofQaeJOhY7ZlEMsbW80y3DObc2GL3tBM5hyHM8gvCialA1c9u3j?=
 =?us-ascii?Q?RdX8rvaZwYKRmWIIUgofI6SdPCyn+XQyYezEc0Oaelgg9HnoJFnvN11HZR23?=
 =?us-ascii?Q?WrGtOqdpCdjDuDFJlDSJhIQcoea2ydfmnTkiE91BgNNUDTyaDCTMIYKcN2Q7?=
 =?us-ascii?Q?NNhbWZo1KthKqAnOqYReg4lOyVh1/e+iOz/BxrkVXK2YthLiui4frH8MMDxr?=
 =?us-ascii?Q?nl1/+hqhNfKirlUmgDQCm3VrPLlWewoyf0Fn84Ct9tik6MCqdSVdPDGZtKve?=
 =?us-ascii?Q?1gyMokttHVOKpeY67wfMR/UxJj0bOb6MeXdtiqqLXV8Iu+8bHf0wfkIdZz8S?=
 =?us-ascii?Q?eru4FfPF7dBp1P1Hq4V6OLDxa02e2Wc4pUuJChO0aouykznl+mkiSrfSPXfh?=
 =?us-ascii?Q?ps1Ymclx+mMeYCWH7LSo0LQ/+rGnVZoxG8YvU4gG1AFbhAPpSwa2xIIe5iI+?=
 =?us-ascii?Q?jOio52DV4BGJAdZUTzAqeOaMA9wzobEKOAnTXkCCL4F04FOFbfDoWmTxeinu?=
 =?us-ascii?Q?br4ftOXc7sQv9PlpgoYTLu8yax+2iiBw7G+2eDFlNxx67rYCPJbalnux5D0r?=
 =?us-ascii?Q?Lu9ZSFoxZbUY8PgRl5avaLx78EoDG6omERAH3gjLfJVT36oSjyOi5o9ivxnY?=
 =?us-ascii?Q?DZCzQna1pNAF5SWLxezS2+9UTDBM168/1LT8z5prPQsqsUP0XRuBhTz7fM0T?=
 =?us-ascii?Q?maNWlnxGngfzp7eKchjI4mp0B6NM0jR4pMILHcv89U1yWt5SHcMFkAWBrv9D?=
 =?us-ascii?Q?CxO8RBno1v5vHgWhNLkqHOyCODmSOf+HU2maS+hMQmMy33MK0VOq57HcEwyX?=
 =?us-ascii?Q?z2ec6Wd7lfX536CylD9IXKlnUMJxZklT4WKGlNZCSPmD6U2ISrnT3t/aOjE/?=
 =?us-ascii?Q?JFf75kb9sylZba7SAQ7HmXu97d+uRv2XwEMpFgxXnX10MR/A/WdFPg9blFDZ?=
 =?us-ascii?Q?a42+Ql9UfCeSOgbXXooaqeUX9gOOQIX9w858drulADDorg3wcEvK4PaSHSqL?=
 =?us-ascii?Q?cnF95bK8etXunqXZnKAzN1XN68Vn6y3BMrcVYJutEIhvAF72oWqusmHJScd+?=
 =?us-ascii?Q?lqNRt+Ts6oi4CRRd4cVwZuKI38yQJHc8w9COCaL3YpTFagIbttq0pb0idGh+?=
 =?us-ascii?Q?qh7F4HxNNNSISIS3ee9ZY6dl0endExCLSb7fxSGPEUja2PSkkFcQOfoVmY5O?=
 =?us-ascii?Q?OS22cCxh59t+PgVL4QkyIMJ3hdT98TYJu1ExnpCbXyjhet5ghwm3pKNVhAu0?=
 =?us-ascii?Q?yIQgBa+Wvf6k/Xx5VdzJdrvVT+Rqp4Fd0JaKJ25KDudjX8eg2yhZM0/+x/VO?=
 =?us-ascii?Q?yNqKc9OvG2wsbIDfRHAwrP3TGNF3o1dls3TgX6AYZ0NASGr5q6wErRXV53Tg?=
 =?us-ascii?Q?/I96WfOowikvH1Hg1hnqmhILLB97b+6ed0UVtF+lVEw9NvepjpGrohto2qc7?=
 =?us-ascii?Q?thXNz+y9XuDNIEShYfg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:20.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dee38c-4a5a-4412-5145-08de1aead35e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6582
X-Proofpoint-GUID: MEWrdImWNEY17NZ4CP6Vf3ICUawnWPAc
X-Authority-Analysis: v=2.4 cv=Mu5fKmae c=1 sm=1 tr=0 ts=6908c56b cx=c_pps
 a=QtilNflqjlihrLF22repcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=Hn7rbmIsdNXIFSUQGigA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: MEWrdImWNEY17NZ4CP6Vf3ICUawnWPAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX11z58TxoMufC
 0OR+MACoMa/hQMGrT5owN49i0mhecq+EbddeDPu4LN04ktcD8bRtdMPFUbbzgzvNVDDk9USCO8L
 5syT6v6fDEeqEcjbX1aeQGhRdkKPGFno9PHAQbiGdvAisblBLjTTkF5uTA44z71qQPBI7ulO4dS
 ixgUGWucYfmkqLqdWv1dpBT6PJHd4t3ObeNWfUWp0++lc0IDPRX4P/PpMiTmNG44zZ+FllK15ZL
 GvYT/Zn6xufabm+Tr92izSlX+dZZX54HNs2j3qzJbTpLJzD1qcoABLtVNBY+OhMdmXzLi1AcDgV
 9muRHJV3MK9auX5gQurHl033Ewop8aqIcVqJLiVA1Jyg1quvvNa8wf4azJ5x3qOqMukQN24GBG7
 456uRnJUJWgvkHtl9qNaZzgF6zuUTg==
X-Proofpoint-Spam-Reason: safe

The SDCA code is very spammy on boot as it prints a lot of parsing
details using info prints. Now primary development is complete move
these to debug prints to reduce the spam.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

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

