Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD8B640
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082725; cv=fail; b=YL4BScIbka30TmjZxgi8a6LRg8arTJHyLVP5ibXvsFclSRVASIuJakCzKY3Vuk7DpuZf9qouRBC2Sd/QaO2jouTsTRLVgcMhZkC9IXsyHV9uP5i+0VrETjoJx6ZprczYcugr1wGG5iIYep4Ap/Gl3c2JJ65ESs4HgY3qSmzrkVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082725; c=relaxed/simple;
	bh=p9iSTMQaWgbuRq63t84m69slsCfeLtUHNsjT09MAxnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FhDIG+wFONcfa82xmANK9HRAYMXYSvUZZCQzVtsammnu9RaY2m3AdZQs3AZsH7TiKNvU+ZfTYXWYTZhRWtrAngU/Ld2GUfUIlVo35nmP43gY0uKkrHeJO0lY95zC8C0lZ7TzzcwAQfJV9lYVwXsfJQPhqs9RdArwaoX6lP4Ewyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=N3pRhE86; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=seGF9YPL; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="N3pRhE86";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="seGF9YPL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5859A66m3552591;
	Fri, 5 Sep 2025 09:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=T0dlQsbYTu6r047jaA2hc4MXcT5QdSayDr+YKMywJtY=; b=
	N3pRhE86v2/dwi0IcXpCjmAzngo2libevt1bHcFWIHqPG9XWtGQGpr1ElztmVD8V
	x3heFbpjYGCTL6KG7oUpb8Pbbay6ydfFTdg6mCqNKzN1yyevnZBYXAZZqi/jZmeU
	M7mTVk0nHDcGKGtcCagELgBMpMLXVrDaua+Y8JoZO4frMvSvA0BNwmCovnxf7+F2
	uKnaq9UX098o4YH+PmeuAJkaIrUEBjZ55Cumq7eDTre12eVi6DcL5VFbMTM6nMrL
	BuMjbyuPWCyzkE3+g6EmAYv7e3xgEKH6oSUuQRAegx4FY4lY2dv6b/XOezP+q1BP
	pNl3Twy4Hal29lJMJ+MdwQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12hn2208.outbound.protection.outlook.com [52.100.167.208])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48yw0b0bk9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q31Hl1pzhMC+KYwtn+ek8K5Tedybrdhzi0t55y3JO7tjuDyblrTkdxsT+nTB99xCDBEJmfTj6agh25P5QKuM6F6D+nhBJIl0WubQl5w9VWT0KYpyZvPNtakoOyVswPnmgGZhYFR97vjH3802sPZv4Lsz6qJAVmyraS07h6yp2oaPd17HaEUH0H8e0pgW78Z0YHzdhomecPCc+tyY1+8Sl+w55H/3LCkBzNd7tm6x3H0Umc+/KYRB98Ha0XyQpisZe+DDuh7KReAGQbO1o011T1M+HHfgthBOjUuQBDoOvUm8gyAhPfkqsHXtvBXAl0lD0OVkYgKb02siPxWMfDvflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0dlQsbYTu6r047jaA2hc4MXcT5QdSayDr+YKMywJtY=;
 b=lrTTJmjYVfmIF61d5PnG3eeEgG18t2ML6mKljSDPKNZFOSC/G+wIzjH1dCH0qGurQpZ/zANmtg4DKrvqN9B/sUqGXBjc1A9B3xzwY7qEWOeyqLOWVyVFwNLy5Gg2gaZo2qCCJDdgleDXhCrrto4liqF2FHKxJYDe3YGxI/tHaj+4mjdEOm5XFZEWfdRW3fiP9u62YvXbI65JOQyT5rOxN9OFC3I/XjYTUm2ISjzFARvglWN0pYU/4rvO8o/12kZTCt8Kgc6ACu0iNAPghUvlF9qPaMjeYoEG4C2LBlAwhDPb8vuISY7cmf5jVg8eL7CJNweGbDDLvZI2CvcgSooQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0dlQsbYTu6r047jaA2hc4MXcT5QdSayDr+YKMywJtY=;
 b=seGF9YPL7VSq77KZPZrgRDtpgND81vweJuzq8p142KGfxYmMsbSw29v41fyoTcy0OrfWYNApUXyNci/houNbWBvsQ9AFCWgvN6GIcnmd73CgmGqJQb9mCpqyBV1AhZPb7e766j33m+FpmM+11VnoIWP+sfgCIkWAlAVFRxOoYkE=
Received: from DS7PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:3b7::12)
 by PH7PR19MB8170.namprd19.prod.outlook.com (2603:10b6:510:2f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 14:31:33 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::12) by DS7PR03CA0097.outlook.office365.com
 (2603:10b6:5:3b7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 14:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E551F406560;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DCFAF820247;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 12/15] ASoC: SDCA: Add XU-specific IRQ processing
Date: Fri,  5 Sep 2025 15:31:20 +0100
Message-ID: <20250905143123.3038716-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|PH7PR19MB8170:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c5e697de-f5f3-4597-ea90-08ddec88e993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|34020700016|82310400026|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YlBKF9HvsqK01yyQIAa6n43iv9bqhTiXq9vvUHUF8w3WL8aq99VRb9+TVJRv?=
 =?us-ascii?Q?7xlTPWosc8J7NKIhVdYJDkZ9tHkjwtE5Y99qz9mj3go92oD8jP8Fn/6QMNCy?=
 =?us-ascii?Q?g8Gbw/S8tmx348xKkKfZcw4TPa0whJj7BIWX1Yu+FWyhv0O0o+YCYxJwUsWx?=
 =?us-ascii?Q?1vet0SBpjkzweQ2Zsbgqx+F4UGqCFdjlEcP7OJKbzYtXQuBKDtLFgv/eJjMQ?=
 =?us-ascii?Q?LzdaDMY5C7g+1uO3PZQJ9E0Ra4327tpKek7pIhR4L/HeeHX4Vl89MFUGuOfZ?=
 =?us-ascii?Q?Fd6sTgcPDVjTbYe4/gMthxN1WigSyxL7BrRCWgw2v/PwrYxeZ9qNLaacbWB6?=
 =?us-ascii?Q?bQcLbTC7MH7Trf+ZvYn9aBXkUqWfEtL0iOg0E+K/SqHGrXJb1SBPR0k+cpqM?=
 =?us-ascii?Q?vUgm2K7hOPD8qnN2nQ1Zg+R/o2GHsoKj8ioyoHAH3rHP1B/IfFqBZ/h05xiz?=
 =?us-ascii?Q?57FZZOZZU+jxvzVhpgnlMy3lbJGdDs4PTQPzZle4teypcGLKBVtA3TcmSU5p?=
 =?us-ascii?Q?RjdToIK8vnoNHlTmaTg9q/k/JxrLOs4Qj5zKTf613DeF5QAZH7uCsjK/F1FS?=
 =?us-ascii?Q?0XaA6lFUqaVonbksIiL/lCKymwMvVTcT1rWecMtqa0s27nVobJIAwvNu0PcC?=
 =?us-ascii?Q?7SXMcriALPyP5VSligjIJQXrpG0ThCnl2g57/S98CKRrkXJ8y+0nG6rpQjm7?=
 =?us-ascii?Q?cvDstDXwYuCX1Sgz0mPTtMhw+VKWkTV/LQQXSVUerZv9sNJ4yPWtGhlvyYrD?=
 =?us-ascii?Q?8/TMDzPVDNyf0Vtrc/pNWXJxBBDUh5bAuFadJ7azjXgrJ1grgHr6Yc3aq5m/?=
 =?us-ascii?Q?ywTHsvQOl5Ury5ctarIC4to/X4UO7LE699Po9cV3gfGtPhfl0P4R5nhauqdu?=
 =?us-ascii?Q?TfciwfO8nOPTQVbnC55KSF/Z1bH/eBUygtjHcYVY4jZQsiejeJLst+K7V0M1?=
 =?us-ascii?Q?TAF/FVLjOZfoUWtT0KDhIFmp7jXz5luVT01it7hwATWCUFATLkJwRGkt0qEU?=
 =?us-ascii?Q?aTZCJZCQ7DTJ/BdDj+wjSs84mXkSwLq784Xo1SF++JutrfY20ICcT8sxwHBV?=
 =?us-ascii?Q?Ihy/XPDGqD4FFEPa/1H8kzHYdzbXDFb9h0LmAre1ea/cqORyNkZUPh/rotxc?=
 =?us-ascii?Q?NJnpRFWg4xvZM2J4j/SD4GOeMnPgITVL5byhCtqj5jCctGBX17HExbrk5kmx?=
 =?us-ascii?Q?q8Vg9Ln5igk3ysrHbZ6UwbaIhICNA6oxhIk8C6iz8vZMn5V4v/2xHAfF+8lB?=
 =?us-ascii?Q?SbzbQ2Fy+9bcmVXIAG9aI3EKMIHalZXxtOs+jTs8Xh7q+4Q7vbX4mrwvy+4+?=
 =?us-ascii?Q?EG/sHm08Udhd1AqaWb043O6zQYZvvIibn4izvlIUZYzjs78wKnwAWB1CZEZp?=
 =?us-ascii?Q?RIAEaG3sVLW39KouZFcpf2MS4oJyg0MzR6GtoRUNwYh//2Dlv+QOQ6hrWzhA?=
 =?us-ascii?Q?HePMEF09N9h4qrSMTjNLWc+FlNgJELi0Iubbm1qg3fOJrBuQS+y/OgRYqxSY?=
 =?us-ascii?Q?7mgJfHogNmFZV360UjyT5ZIJMxLSMkBd5UU/?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(34020700016)(82310400026)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:33.2512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e697de-f5f3-4597-ea90-08ddec88e993
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8170
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX9p6TKub+Amnn
 EdsZmGg4pwANmUyB+EELMX5864fu27Vq708uU0SMrgkqP/P0kMozGLcq+ZEdU7vmYnkfpQV5arn
 kcSGL52zj59v9/TjwEFa9uQVL6QyA1gLIwn9Imb5lS6IH6gOSPm6eRPJO/NAFc7nvI94haG/TIk
 /6kjzmYuXfGgnkn+Bzwn6kpO64t9gwAuPBbqbpACgXGi5mWtQsOju0U56ToSxVuJ4G9FJfbasxm
 62dxEzVnfq+ze66ea/d+AmIL82cLKaOYpMq8BdKkA/qBOfxW5msrPkiYC/hRUGA6ByCGm42y9Fg
 ootp7lZTTyJHGiAyEaGOyWH8wFXMOKXa2cPM5BZ31Om8d2xoiEv+wXZUIr9nM0=
X-Authority-Analysis: v=2.4 cv=YJufyQGx c=1 sm=1 tr=0 ts=68baf449 cx=c_pps
 a=Oni4MC7jbuDsPwJnmm9pNA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=B6XqhBlvVsDW6j2K6OcA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: 9fG51-NbiKtVavrW9ElvfheJpTOxmhOJ
X-Proofpoint-GUID: 9fG51-NbiKtVavrW9ElvfheJpTOxmhOJ
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Hookup the XU IRQs required for the FDL process.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index a0677911503fb..c199b5a4f0d2e 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -18,8 +18,10 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <sound/sdca.h>
+#include <sound/sdca_entity_xu.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
 #include <sound/soc.h>
 
@@ -245,6 +247,29 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	return irqret;
 }
 
+static irqreturn_t fdl_owner_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
+	irqreturn_t irqret = IRQ_NONE;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for fdl: %d\n", ret);
+		goto error;
+	}
+
+	ret = sdca_fdl_process(interrupt);
+	if (ret)
+		goto error;
+
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -423,6 +448,15 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
 					handler = detected_mode_handler;
 				break;
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
+					ret = sdca_fdl_alloc_state(interrupt);
+					if (ret)
+						return ret;
+
+					handler = fdl_owner_handler;
+				}
+				break;
 			default:
 				break;
 			}
-- 
2.47.2

