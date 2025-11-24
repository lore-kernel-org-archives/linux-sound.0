Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479D3A1D2;
	Mon, 24 Nov 2025 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004623; cv=fail; b=cLwi3s482pNAwHdMGjdi8y7L8IepSQmqR4H249wtjWmAAp7vn27c/cBFXpzG14LnelJ9K9pQBq/UsxP7iZF89gl/RXzAbVAAnkWNXrUMQg/KJVwxAHLIfwy4hAelvlDiniP4kzNEho4Ov/9/p1VLTltHWkR1yq3KIKj+Dts5oy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004623; c=relaxed/simple;
	bh=qR02VTTGLogD8wHYoSxKik9qsrtSt7FvWV/cY3yslX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MJgm7f0eUYBwxgxv13tQWbudw0hPclaVQDYfaPm77Px0goFgOh3tcfcosZOj0dqBuzLpjVo1DljbH+LjGKS1SwBWAyMh1kAMi+NiS4rOcU1XUXbRFiCufR6oM6mQIDImfiG4du4vObha8vzmZqiIpL7VdMpHi9tfg+FD952TltU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nKYuqxJQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IBiigi2t; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nKYuqxJQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IBiigi2t"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOCTS6M1795437;
	Mon, 24 Nov 2025 11:16:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=xWgJ1V5tjxcRNUQ5
	sY/x3/k4LWNYlQUpFD+Z3jV5azQ=; b=nKYuqxJQUIDILqh0N0LzzAKZzzZ9Navp
	5suUnq1UoBi7DSQeorsR9R37K2BMhjrzxTs7PWKNWXID4M1lSB9MmAMv7XoB93dl
	Eyfh9on2nP2rC5lO+szbvi2tycZm+kGTDXb9c0iCQWBAz5Y/biiRBQZFCQYvswUx
	7JDHPP97n7zJRhzDknj5pjk9W/P3kzyc3jGvtjhJF0cGQ+MMmbI8Myy7o7CRGyy7
	S98UuEipY4Bzk/YRK7EkSpe1eTYsCEbSLbDv6YYlj9akHZ2CE+ngP82pQl87u6QP
	SsMGQourXdOPufnJ71n1O5pMSnWSJdR5ZXzs1S7AEmvjpfQK9m4H+A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020081.outbound.protection.outlook.com [52.101.85.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf1a0gb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 11:16:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge5XiTQyYu7Dxcp08ONxPUhiVK9xQxHPy2xT6fZiGd88ABudvW/TL3Z/JmsjF/TGaxIqRbZVwZ2i2DdggfDGu3FgnXT4DilItY0Ok7mj88zyYQrVxsB3DRbOmDRydk9oz7xRcFPVD+bVa9Twm3ElBX445sIob0XacxHjXC7n1ExYKvPEpmQW6QUPj+FCNiBMb07wd+NN42WNG7fHGN4ZSSnF3Us42hI0keVnx8QzZ/69oUqwV+JagB5AhhgGh7hM0DI2hq5LNY3wXoQ8w0KUy81CFCfPI0VowSQUMtn1XM81rLY025ijNqDtIhXHO1deqds2eCZ5LMlc9kyQr9YnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWgJ1V5tjxcRNUQ5sY/x3/k4LWNYlQUpFD+Z3jV5azQ=;
 b=pN0wKJHLRGPkgyBh+8qBtvk8WTj4ArPxc40oAhNZ1EPabt7FJvctlFBjJ933yE/48lYcHdcyS83dmRpvhZ1mKTn5sh1DWIuka6avKOWT+o4TgN5sJfel57UGDuRDEun6YX6y4H4z2ZniDURn0jztc868BQfLI0dn7glOTShgKxbHLi7/y8rOSarOnHto6CjBYyq+lWwoX34KwGtOOL7XLx991pWTRBuWGicYvJJXENyVRWs/9LzGx4rXgLsmwO6YZBy/+esLxvNGW03QD8qWY8D7VO1e+UsfDXs+mNU+Bzxa0Oqw9WyJhBamoatXt4AU4wWlrA0oJIGikteiIewsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWgJ1V5tjxcRNUQ5sY/x3/k4LWNYlQUpFD+Z3jV5azQ=;
 b=IBiigi2tF/h2awC6f0Fx9GM2C2Ze9OEzDK02QFbzT7UKFBqC5CKP3jIp/BvxSpAKk9Nn5wFn1xGWOLcjrrO5fGo75j6K+82sFb4FvdDSVATZzw+NjqTRU4Zudi3J64yUaiBStOL8YINuPNSIZWihSk6fMhFPWK7qjvyDJDNGUt8=
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by MW5PR19MB5555.namprd19.prod.outlook.com (2603:10b6:303:194::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:15:38 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::2b) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.8 via Frontend Transport; Mon,
 24 Nov 2025 17:15:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 24 Nov 2025 17:15:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4EB4C406540;
	Mon, 24 Nov 2025 17:15:36 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 37EE5820247;
	Mon, 24 Nov 2025 17:15:36 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Store control length as 32-bit
Date: Mon, 24 Nov 2025 17:15:35 +0000
Message-ID: <20251124171536.78962-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|MW5PR19MB5555:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: deb4fd8f-90bd-4629-d274-08de2b7d1679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hSCecnwiF1MH9LiBC2CKk0eOwcSno+Ism1fA6zaumu0gy1wphqmY3n1L86Vq?=
 =?us-ascii?Q?+zloX6H/C14vHJ/JOiooThhSoKZt3DzHhJBB0uKST0xy1GxMpGf1KvQ/VTKY?=
 =?us-ascii?Q?FRJpFJJRxqk2JCxOgTaL+WyKy/L21kWTVh4OFQtwuTA31On//apf9oEYaHTl?=
 =?us-ascii?Q?m3CnSK8uUdfiqGz/yyeZryahylbRdAPKpUYaN4/9JGdernMGDr+xet1lIynD?=
 =?us-ascii?Q?KLbEt4PTQ0wniBvEbOUg1ZIiGb7yy2bkiPGLJ5v+U8DbehFaDOR1edVFfPPu?=
 =?us-ascii?Q?o5e8DITxx91qwrCzEAUc/h9MZ4VP/F0yVN8KMBHb+rfrWZyyusmFCS/PopvB?=
 =?us-ascii?Q?Bk4tVbKlsZsssePZ4bd2Gt78J2Q4HIwsu6pQZtFph9xtVZse9lORgENWMTuK?=
 =?us-ascii?Q?AwwAoslNfKA5lCAfC94PVQcaar2fp/gCIy7DsD1TYe5oorjNxu6ocNslSQho?=
 =?us-ascii?Q?ig400AvYM+n7NNfwVfwALbKwt5RozIJDVX6tBHG+ICY3fD+rjKVADnqTEw70?=
 =?us-ascii?Q?Cz05GoyaYwRsq9gQZSBDXVdgMwOMZRrjMpI92meMD7EiJiUzPX6sXlhRDSML?=
 =?us-ascii?Q?RvTyAsNjAMHHHkIZve1SYi2XzI1M7s+p8vHlJ8NhAvUh6J5Vr9B+cKz6/zEU?=
 =?us-ascii?Q?JuOFhPcmla4bQ5jd4f8NlKAm+Gx1kWjOYlJMBC7NFkhQzbELScIrSw/7SXV7?=
 =?us-ascii?Q?S7yt347OWB3dsoaTeIFfqTed0u+eXt/bUAIj/OHo9mrQaToqIMmwsg/jtbK7?=
 =?us-ascii?Q?uJGMjO28l9J+Bpu4clytanb4ba64eXgFjzx2k/FWmnkd0XO+AteWPi0Zyz7z?=
 =?us-ascii?Q?ZzMVS7LNPnO9QE3lWlLE9m6v8ammX8HJMDT4DFmD3WIwUmqxbmyzjfi7eRPR?=
 =?us-ascii?Q?gc55MW6OJFJ9elGRhQWkHBFJDV88J//zcDHMgDb1guVh4mnX92sC/XaAl+zA?=
 =?us-ascii?Q?1XNmVInO/qAOGvfAm0MaLZr5coHx68dgwTkVs+1hRQzTxFVr+LrlsQyo9jtl?=
 =?us-ascii?Q?KOY+y4zEElcK812zwY86uanpZQ7nmowQaNhPP2zfBmn5xFuwbcYtJskcJhaf?=
 =?us-ascii?Q?zIYycGi+KYbt8a2Xa2CLZCKWVM3OEOgZSXnRh0526g7al+7szB+nqeBcVry3?=
 =?us-ascii?Q?lKT4/xdD1S6bjpzKNRiXdUdh6tW2s5a8F+m6I/lz2bNIlqeUGEsSkBDQ29IV?=
 =?us-ascii?Q?Q1ifZP/6fwhMzIbBrlzZ/fO9fjZcXeMLA/mzFfkkqdYDGYtrKyRdPNcgfBSm?=
 =?us-ascii?Q?wk32SvJOwyJ6ItRNc5FW2AlyGJ+IIudqyqONzoIiHvtl6P0aYGn3yYHhmAsT?=
 =?us-ascii?Q?pIijFUzq3Y9Uad4yHfLuCpRtM5d54mplXsAKhyoVy9fn3oRz5PxWSoyZ0RRI?=
 =?us-ascii?Q?EwQSxaZ+cXQ52M1nS7RF8gbc40ke6vIAtjhi/BvUklvR7gTOqhBeamhrFbYu?=
 =?us-ascii?Q?ocFwZxYAApqRVYMSJhy2QaZW5bJECkoTk+QbLE93JsOQm2UInfdj4R8qJn8m?=
 =?us-ascii?Q?+nrwM81kNf8un2Weq7EBzCeCy2zImQPzrrVYoNYuOO8Nf35Ymzw73RynwTSV?=
 =?us-ascii?Q?oV0eTOXRMGPKam/EYos=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:15:37.7875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb4fd8f-90bd-4629-d274-08de2b7d1679
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5555
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=69249309 cx=c_pps
 a=PrKk0R3FxLq9+u45pGB2Yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=uZMEdCP3f91ieMERBTwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE1MSBTYWx0ZWRfX6qDxA8bN2NyU
 CIpU3ONhxqF1FzcDzRZv/P5DmTrRTF0wT7Z3Wcn1WPLdjLm8aMYwDHnRoBJVsy+pYcBOFKdhUYV
 pSrodmYOAeYZOfticgyuJ28LyDo3vh1RLC3ShFUH6UfaYktJu+Nee7gHI5CNmlUerKvnlmdWq3M
 Die7YQFWSdnX68+PSqrfoNHZt4Inf3hgk0f33tRZoF0NhyJUIm8tvWOwHaIIFUSouHKC4HqUqgQ
 PEoQeKke8aV0xis92O193c675OCjyviONTdbHpYYbgBCIxKTCyMmH+60k4F5tkXuo+VD/qarZF/
 ayB3yHaWRQe0cR8pPaWuB6d1uH1fo+x56SpcnKpzaK6G63iFtskM1McaJLNwcYJhugY3Gi05PHr
 NpSnk9T8kqydJkmxezAl9NLpZX8E8A==
X-Proofpoint-GUID: FUZoWd44qxaDHJQUAPisa5aXfdJsTV3o
X-Proofpoint-ORIG-GUID: FUZoWd44qxaDHJQUAPisa5aXfdJsTV3o
X-Proofpoint-Spam-Reason: safe

The architectures supported by this driver have a maximum of 32-bits
of address, so we don't need more than 32-bits to store the length of
control data. Change the length in struct cs_dsp_coeff_ctl to an
unsigned int instead of a size_t. Also make a corresponding trivial
change to wm_adsp.c to prevent a compiler warning.

Tested on x86_64 builds this saves at least 4 bytes per control
(another 4 bytes might be saved if the compiler was inserting padding
to align the size_t).

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 2 +-
 include/linux/firmware/cirrus/cs_dsp.h | 2 +-
 sound/soc/codecs/wm_adsp.c             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 9acdcd75928a..36a5aefa16e7 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -477,7 +477,7 @@ static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
 
 	list_for_each_entry(ctl, &dsp->ctl_list, list) {
 		cs_dsp_coeff_base_reg(ctl, &reg, 0);
-		seq_printf(s, "%22.*s: %#8zx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
+		seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
 			   ctl->subname_len, ctl->subname, ctl->len,
 			   cs_dsp_mem_region_name(ctl->alg_region.type),
 			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 69959032f8f5..0ec1cdc5585d 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -102,7 +102,7 @@ struct cs_dsp_coeff_ctl {
 	const char *subname;
 	unsigned int subname_len;
 	unsigned int offset;
-	size_t len;
+	unsigned int len;
 	unsigned int type;
 	unsigned int flags;
 	unsigned int set:1;
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 172dcdd7dbca..17cec79245d4 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1561,7 +1561,7 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 
 	for (i = 0; i < 5; ++i) {
 		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1,
-					     min(cs_ctl->len, sizeof(coeff_v1)));
+					     min((size_t)cs_ctl->len, sizeof(coeff_v1)));
 		if (ret < 0)
 			return ret;
 
-- 
2.47.3

