Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4242523A99E;
	Mon, 23 Feb 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862805; cv=fail; b=cB9A0yMlaj4F1E/0UDhguNKj9C6EROBw9ao8uw5hAbCLGFjaz5Gslq91dCCOxozTtxi9nz82X7REEXBeXVptMIgqKAxPognMecPSd54G9EQWBOgkKEvAOy4Vx7bcF541ItxnHsHNRJt1BFbGfw6fgRRN6UT/NY2iKYCS8iEdAFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862805; c=relaxed/simple;
	bh=Gia1CDKsWRIKD6FzfWD5JGafKKlgoeoIsDgaH1ZjPXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B2wPfu19S6e8JKsAivXdHkt8KvsYFM3OVhWivS5ToCgdeNshDPQ80G0oFXcv0EYIhWHokNfUr7nJn1V9Uyu6HYXEdOOOe49epuHzRzkjvxWF41Y6ish+oS1WgYPq8ayy/oD/XBhUcFKbt9RKjFvo0VfFy5rLVY89DFxMY9dlYzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=d+e8wF8W; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=w5hWACLM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="d+e8wF8W";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="w5hWACLM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFCkWd2143558;
	Mon, 23 Feb 2026 10:06:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lqeA/wJu1VJc6zSGuLSkCm63qp30hybfY4gQjsoAMZY=; b=
	d+e8wF8Wx5sR+1/PiUDchSWeatKEgoCPS+7UTjWJ/wS34nmAXuODuoRMJdCNH2xX
	yF8YHeQkkvQA0J19ppmx3PscakZYePwLw1f07H7LSynVSJJfvuT9/1nTQisKwDui
	0gbfQnUm/FbyXSuRgzfnQ4bo0MVwGpESWrH9OH4qUmj03zGbx6Ts2EHa9J17nzeh
	yoz+G6otgfAP8gFQOcZa6/c+wWto4Qd924QqTQWdknHduMR/Qag2W1rEDx+SCnCZ
	FvjkHdUBckm2PHDMyUh8x35lyDn/ON2h9T9TUgLGZ8upXzx3crQqYvk1wqD2ZSpj
	A1BMlUv7ygLfyRKWN8wRdA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021125.outbound.protection.outlook.com [52.101.62.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1rrs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXBH0jvtIiLies03ANux4SqN7hztJ9zV7bIssMvwGF5T5lUzKRbwjLp1c5O9kAOLgEaaT3aACB0qQeP5SR2vxHiauc+xzLAxZUsZ4ZhBEh/Py6RmekwiZ7T/2xkwO/RHhHsxoG2n+qujT5wcl3c7MG0svVzax2stOb1t+14ICLy4pZRYA8YnhvrHZWzEKM+pUL7ZE+67aAAXylsAC7IB033k6FCZWj5A91kDF31LMLKyaCmym8M140klEjmWlBvdaxUhYrHuaIF88vtcTBgECotkuW1+lhgWItj9XHjzhPz4fn3m7d1LwdcGfiYq7rzD3t3EuQ0AJBpwn85l6sUY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqeA/wJu1VJc6zSGuLSkCm63qp30hybfY4gQjsoAMZY=;
 b=AdvGd+xR+4z3cLkzEm+4eoRe/xn61yF5fvJiGguW5S6GmF9uE3LCj1cfkvWVD70OhWsoAxIS8XEgVkIXVheoYpMJPP8X+CyBb9/mS8l+JrCEZc24jSZi+RTQoqUG/y9XKA7eE9iMSt4xMWuPGRExX3KWT5Kt1vklvnW18hDAiXjqVtqlgaeWkgeBLIBnbagDveDicSz/bbanNttWpW2PnOwU/gyehT5/E2TpkwsG1rJYCgh+JwhIj3b7gH+QZe3jPP2hwYTmRkcS8YpKE8hVhqgbhJHMykbjx4w6+ghTgqCee3lKm+5K8fyUWlcfh0h5yzHXxbTAyVjDmlhGuspM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqeA/wJu1VJc6zSGuLSkCm63qp30hybfY4gQjsoAMZY=;
 b=w5hWACLMGUtPXLsoPvuLdafV+VyhIkBEqsWZ46TNm3VAKAQV9L0YuwIOISXYywknrwL31EnHB+L8zffr5E0PQTVIU/FpvwqM8Rav7cd/rlsegZcwvktclFJN9dOnobqJDZJDet8D2XfTUnTT5+CO7ulfiKZea/gZmHhK7kaklKY=
Received: from SA1P222CA0085.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::28)
 by PH7PR19MB5990.namprd19.prod.outlook.com (2603:10b6:510:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:36 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::84) by SA1P222CA0085.outlook.office365.com
 (2603:10b6:806:35e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 16:06:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 126EC406543;
	Mon, 23 Feb 2026 16:06:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E026882024B;
	Mon, 23 Feb 2026 16:06:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/3] ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate without stopping DSP
Date: Mon, 23 Feb 2026 16:05:31 +0000
Message-ID: <20260223160614.754934-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
References: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|PH7PR19MB5990:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 019a24f8-a85a-4bb7-3540-08de72f58567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KTXOEG+TpN6x6uE0mcorkeR4Iof9CDIKJpx+gsGPoJDYL9WZEjK/1nVRnO7V?=
 =?us-ascii?Q?Iu7rVs4SNeMkHIWSHhhjodDLP0EgUIlJ07h0qTiKDRgM7YLxR/fdVAN/1BQd?=
 =?us-ascii?Q?+BUXgRmgRMy+4JBlyaPJgTet/OBcYFlldrylLCEw3qus+jGrx96iKpL+S0dX?=
 =?us-ascii?Q?nXamlayL/hYZsP9XkD7Bmp66qeOPCasXNTwp48b2NcYRslMi5MYLFdKgL7XF?=
 =?us-ascii?Q?8B1ANRn19noPtVuSjPJCTQXvJS2Ah91Z6tW0v6PBTCVRAfe7f7GjG9+lx9pl?=
 =?us-ascii?Q?g899PvKf0jZ7WgBP7cNaxgYwQU7vBWeeJtJgv17dSIhFD7sTFg4dO/qgbaem?=
 =?us-ascii?Q?lLFLmZ5hlG92steGA2QQcqHOWSPvr/TIppoQi5kkyk4nPw23KtRZ6deuABAY?=
 =?us-ascii?Q?1PdDjgo+VEllUx6wsxlVtCn9R/eKCiiwKD4vvBL1dPzs8G0/vU28Bp1rzgNI?=
 =?us-ascii?Q?2180vW+vTDmuI2pSkJCP+um/ToQdgfjPBAP8qAaEfKzOs41hYXXVJx1PhHJF?=
 =?us-ascii?Q?ws0u4uffDIRzDMJsK0XBQzAOQhwQnFhilzaPASDSBDPr7qzYKbbsr8++T1ZZ?=
 =?us-ascii?Q?c8nkhcJxVQAA7bS4c+aRCHzxLN/hH7iL7Ty7Szz5bG8sMujLvnbSsXZEk8Gl?=
 =?us-ascii?Q?m73n54QS1HoivEV+0OAF0bXUn5gQZ4tvRM9oocItIuCCR+mDWulwssOYaNaF?=
 =?us-ascii?Q?KilDVPnSzQNnIDU/4U9gbK+y0eIApgwAxEpSXu6SeT1SNFSnqLRaeu2/TNwM?=
 =?us-ascii?Q?5lSTIjWbjx2GREN08wrnnBOrhmJg3zSH7RGNnShvvkwH/BAhccof+bPzCWGz?=
 =?us-ascii?Q?KLp5cqvYsapp4XpZo6HwkgN2E2OnxSFWtC1wubigqd8Xh6dhh3D6L+Ap3s5w?=
 =?us-ascii?Q?GgNywIuS2ZfQZ4IESz1h0KPVJliQr2ZFrSh2uaOKH0oML+81DDHJP+Vwsp11?=
 =?us-ascii?Q?kjjdmeRU+r9Ri6QFYgXTNKe/JId1QRwS7pBRt6JoOyJPmpIrdq4NGuFpMoEC?=
 =?us-ascii?Q?kNo/lKvPZF1KE3HUD8/AAY9g3Q20GZ+CIWTokBunc1Hen8lVfCFSszsAiUd2?=
 =?us-ascii?Q?p/2yUFLgkrdUO6FiZEttVgGmjnQpcJIGgc5ccJakphan60vrrNtu1NQZN+qK?=
 =?us-ascii?Q?R6oNWkSMyNGnDkzvi0rFS/is6g5R0xakZYDHzhTCFkDJGTa/g6XlloxQ8HDI?=
 =?us-ascii?Q?HcjyrPJrifEke0L+ffIRbhShFydjuAZIxqYk9wDKc4Xh3DEOJa/yP3dyWsFL?=
 =?us-ascii?Q?Fcb6k7HnnHvtWPZuJYnhjMJ3tlaPp5VnJlmG9ldiHgfrKuxXkIN0FNWNAXeL?=
 =?us-ascii?Q?v12mbbZ6RjhatvG6nKSc5m38aIWaNzhgn2AcaQpOheWql59GGhM0v7XE3wKx?=
 =?us-ascii?Q?Rxh1NUHVL8U45oukUxq6B4FbyNdYDY1usV6azii7tut3LcXlLIPyPeCLLptL?=
 =?us-ascii?Q?TEQrienacN2BoF21FxB6ZcvnKn66mKPNdIcVnnsCQNhrBQXyrNSoH8MEIn8+?=
 =?us-ascii?Q?zdPYQ2JGFUCGEOdhWCHu0eWXyq8SPrmsfKhGHO5EPBXA2bBiyEZ+1i40/HGK?=
 =?us-ascii?Q?vKmXwmJpCbLwjGOv2sZJBFHr70jKKmX1qOfir/IcGe72q59ktCN+RF4n7WS2?=
 =?us-ascii?Q?wC7RpTS3RhEDoR2Ti1LaNxez07L2o2drAABVx5seJu+IOYhgv5ViH5tHae8T?=
 =?us-ascii?Q?tskb6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0KtAT2/9sfzMQJVHS8YPvdlRuft1PNT4iguJQs/oKmRKazoIxTm2U2N+Y+pfU1oZIKskUMAU7Xl4ESpW2v6CHWdPxZ/8EgbVIOhwwjflARZ26aXMM9HoHptGaYYdOa5Y5ll0NT6TXhFok9Q5NLNJCCKPGJn2qQsHinCoVYwAG+Tb82wVQ4tP5x1+k4B5k7Kv6/WJDze44Cg9c+tXvB7Md9DuOjDpElalyq1HC2J/DU6flDFhGj+NIomY5UHygBFZ0rXf5fu8OwssWeTvoNutAE4Si1GwRZughgK8Q3Uq9OB345z+QLfL9OB7h7DhqUR7+vaOk1I7FZQTJFfDvvvT7Gv7KF8oM1ZqEu0HgjZdpvQRfJlLyncBRhldQpBAA73DLC0ZIyP4yg3nEFJNxQsHbnmhujjeJaGuepeZqsUBD/Oem+z0nCi7GPSEgy8o7xJ9
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:06:36.1118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019a24f8-a85a-4bb7-3540-08de72f58567
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5990
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzOCBTYWx0ZWRfX1EjGSKwqZnS/
 w725T8nO9x+VgU4o3JGXhULV5AV2gE1IXM+viH1IhD2M6fyugqozBwaGpFTSF2wwj7N06JPYfnk
 lQ39BOBeDnQpgCMshOGUBmD3hqkhOtbjdslQn/fZXVf7TctBNsuGS96skoMz2ICyQRIXBWN7exP
 j7bM7RU0jNA6hM6/7jYfL2HXPjMjRumTJRmuPgohTjo0hp6zLRxUMLQCAkKRsKakTwIFF31f5W1
 LxvU5HdumJ+8O/OkhwZXH/CGBsAcMVR7KqGuf3a33SrwIR/jvUxvvnIUnl1bqJX6UsGAq+dlqUx
 naq5UgoMNs9mJKocw8SK/8I2VPI6ABN49i+y7/UOf8JPq5d3C47PLVNX8KBHTWiLq6etjzMwWU8
 6Sfiklact2h8buLbK+Sn8EqaDIJiY2j26/ZEY3QD+ytAzZ444z89JHvpw6DmH+D1eS3Pe5RoFOg
 NJ4vw40qYTlwSTi7p8A==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c7b10 cx=c_pps
 a=63eZqvGvmDVpXZrU3nJVyw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=sbEEYNrql6nwSTcRNn8A:9
X-Proofpoint-GUID: 3vndVj8jqIhRKOovMtbKpA3deRWIGZhF
X-Proofpoint-ORIG-GUID: 3vndVj8jqIhRKOovMtbKpA3deRWIGZhF
X-Proofpoint-Spam-Reason: safe

Some parts do not stop the DSP core before runtime suspend, however,
this leaves the DSP controls enabled and accessible whilst the part is
suspended and the regmap is cache_only.

Add new APIs to allow for the DSP to hibernate when the part is
suspended, and the DSP is not shut down.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 6 ++++++
 sound/soc/codecs/wm_adsp.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 2e23848e1dce..d95b54275b5e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1100,6 +1100,12 @@ void wm_adsp_stop(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp_stop);
 
+void wm_adsp_hibernate(struct wm_adsp *dsp, bool hibernate)
+{
+	cs_dsp_hibernate(&dsp->cs_dsp, hibernate);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_hibernate);
+
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event)
 {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 8035fda71f8d..a9118be793d7 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -103,6 +103,7 @@ irqreturn_t wm_halo_wdt_expire(int irq, void *data);
 
 int wm_adsp_run(struct wm_adsp *dsp);
 void wm_adsp_stop(struct wm_adsp *dsp);
+void wm_adsp_hibernate(struct wm_adsp *dsp, bool hibernate);
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event);
 
-- 
2.43.0

