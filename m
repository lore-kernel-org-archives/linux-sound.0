Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22D202C34
	for <linux-sound@vger.kernel.org>; Mon,  5 May 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454479; cv=fail; b=VP+bdIUKFK1a78+brbARSRa/cedu4lIejjoIhMAxSmYV0DIdLP4EYrxptt/3uWKkzg3CRGleYKz9Nm0wD/KrmIA18odJLIm3z24EgvJIQVnk5Rr0f5mQRSqXiIGloTwBLCTEdUl8rwzCqkT/Bp/5VXkEMwVDMDLqLP+toHXiUzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454479; c=relaxed/simple;
	bh=IaQj1P/27xyQVEHa5Y1hPfSW1Zr7blWErL8hLJ/FqCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mtunq68xSzj9mqYdoTg0TUqLrQuwMezC7WDpZunkVVd5Zkgcii44FM1psz1jlx1Yk421ZWgO8IzVUDab1kRJP1uqBS/5aiZ3Ea1/aK9pML7rsvcrOfkc90A88A2Jk70DWd4PEPdHBd8qLsdt7aZMhFXX7tP5DT68a+o8sBvW+IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Zx6Mbd3M; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KZjyb42C; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Zx6Mbd3M";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KZjyb42C"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5455kRAK017405;
	Mon, 5 May 2025 09:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wzqFKQgodMYlHSk0kyPR/DYH6g6aOheLW5+5xBe9YqQ=; b=
	Zx6Mbd3ML99lrBAJ/LGBzAfhGyXJTpes9B60oFDXAdfmGDZ2TnNS0IF7b9GhqZ0R
	sB8K/NgTy9BCxHqK6IOqqUMlLlhrEFdruARL7s/SoksvwideUsIB1/btqMpKEPCE
	Pweaew61r6w0NLK6TID71NvIehlVLf9KIk8XNqYaR+AYmpnuIFMNkypgElWAIO5/
	zXYw41yKCoRZ4g4l2TdyuvZuxtyEP8lZHUv3ZQsWFf8neFrSNlDk4OCiK7tI4EER
	MFQNTzJavpd7cUVKip14i2bMkB9FQ3WIu8Gmz6QixSpB8zQl3Y73ooSk5WqAI2uI
	+Hwx4prf+iP9NefiHtdbdw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46dfjg29me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:14:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdwTdmaMmOJ6dzUgDwD+jE5Yu9KrOaAuWr8sEAhPzmEgwd3/tVFQOkLPQ6HNQ0dXX6ledD2ytnvwrTgp5Rg2bhCO8wCCmmg6s9VUzt7f5WycyUEnKa0OFExbAkTjiq88ZY6kHMtorg6Pm+rHnVOj4mL7+K2p9WSPkRJvbdFebQzRfTlsdteYW6lC9zkstbR5GSGTxCIGh7supmgoQjI3BgKiBqJ2w5RrYdMyPFM1P88uZboxpvbs/SEdcX+83BMt+UIQpanDGMJSWrFvZSJmMFHtiSPhnf+ZrLLUbahh7Hf5lnDXqMr4j2A+c7gLCdBeEX5OHdBcNMVit9OG5Khczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzqFKQgodMYlHSk0kyPR/DYH6g6aOheLW5+5xBe9YqQ=;
 b=lP/2Y6fQ9xNbcTlfBTuOpyZ1Op2pD0SnH8fihFyjvWkRPOJKWu4G11qz4A4jnXESb/HGvfeWqK1V+g/vB8AMwwCL7rueWRS5Wqk1nMUmM82S159Zy7lZ1tI3LQK8haLzpK9oGFebJ5PaM+F0SzcivumCEgsw8ulRO/vTFn4yU9TIS7RiYz36t6kH7cPQBV6IfjcFUFhxS46wADo+gDy1QkuzGqaJVuW0mJTwqdgwLCaccA/zidBAOwTCt4S4z14STjWCA8L+IG+0+nBFeI9fF8/MmJyFy71jVnKS6WrUa/DUVsFDQU5FPzIkOueIWawxHtpLN4gnwxB2jg3FLlIm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzqFKQgodMYlHSk0kyPR/DYH6g6aOheLW5+5xBe9YqQ=;
 b=KZjyb42CZ3SoHLLO02XHsk7z52iAM2kACsIVIquDOmTY1FZriNCVKZzzP+NzCxBWpf7wZgMza9hZnhS6+pa1J9IdoG0YTexC0RS6QMHB+5POOYFUTROy1r4w8PLUYK+Nw5Xaq7nV8Yf4cswL9t4sBoJ+J2nZ38P/BHUJNQTFNF0=
Received: from MN2PR15CA0064.namprd15.prod.outlook.com (2603:10b6:208:237::33)
 by DS0PR19MB7591.namprd19.prod.outlook.com (2603:10b6:8:14e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 14:14:11 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::69) by MN2PR15CA0064.outlook.office365.com
 (2603:10b6:208:237::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.28 via Frontend Transport; Mon,
 5 May 2025 14:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 5 May 2025 14:14:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2B5BC40654A;
	Mon,  5 May 2025 14:14:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F0AA982026C;
	Mon,  5 May 2025 14:14:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: Intel: sof_sdw: Avoid NULL check fail when re-probing
Date: Mon,  5 May 2025 15:14:09 +0100
Message-Id: <20250505141409.2614010-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
References: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|DS0PR19MB7591:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8473b50d-035c-4996-e6eb-08dd8bdf1b83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8C6syiyjTyoImISoxidlXgI0qydn7e2HK4Mm38hBvscRdtR4Q1SARxKyG/dG?=
 =?us-ascii?Q?WGybPlMcGYORCaH2h53WuIny/iId5pxAVkrQ4CH7eIoFwJZdRPyVXYnxlyJA?=
 =?us-ascii?Q?P6uH4aDG1BCRSbU012hlGWZS7rB6QoGpdIUMvXYh44HbR6MOa/0fxgRnnse/?=
 =?us-ascii?Q?CrdZXEPUvefdUudb1ldYhm6j9SIzd79jUs+0HBt5Re6d8SLAEXNqtXdNN4oN?=
 =?us-ascii?Q?VkmHERYmIVsWoXdXz/hisLC+JMLtDvRXf+FWwnzOB5E2JFS7rFNKLZkQ1eSj?=
 =?us-ascii?Q?CgyjBUobPn+ZmrzHIsV4QMlFALgkRaiqJQ+CEB84RFP1WvlY8/7F45JM184a?=
 =?us-ascii?Q?C/GIMoyHviyR9bMwlZkVvboNqGv0LrdhyeIg8VtJqJ7APbSaBUKS00e5R4vw?=
 =?us-ascii?Q?Xrnj3GA92aG46JOVtCrUFtKrXclW8kTKdGJ8CHiF+D5hzzAzOQXPL2tY9VB0?=
 =?us-ascii?Q?/LqyplMf51U3pIeesmzlwq9CAwKldNHkvS1EZHqPP2Z5xPu+IfA1hb2gC6HG?=
 =?us-ascii?Q?y6u3StbVtks1Mwntk66ZhxxVT66jVvxJnu0EKKtQqggVV/E45x7I7loErIjD?=
 =?us-ascii?Q?B7gwVZxsybPmVclm1qsIH9sXzobMiMp2vtJJoxviHAI/JCwZ2oU1LDwCb02T?=
 =?us-ascii?Q?QU7IjCvLexA2lai+i3n21HbkclLqjNamyC8pl/iazOfwWRbLcd3fZhPeQkKi?=
 =?us-ascii?Q?Cx9pdOKszdIprL5FKiXY5XTC6RcCJ68Yr2dacAE60BWfV/Qkq1Y3zMpBYRSK?=
 =?us-ascii?Q?U4UsvYeDXGLFxUNgNCwk00ay807DCdfCnFnRHY7JREGmhuSImxuGkRqYM5cu?=
 =?us-ascii?Q?H9nbHo9jRflTPoUU+tUJiQ7OBad+20FMqfCwgKtymezYV6SJ1FD4xd1bvnBM?=
 =?us-ascii?Q?6E0QtCUqMc+M7OL4EK8K46wPNWGLsEM7/+rUOkjd4yPrvp5iCR56Ff9NAGtt?=
 =?us-ascii?Q?2Ra0kClFdo1pDVdKMcuMUxgeeF0loEmWSEnLNiCMPlq40UFFVt1eyYuLl/3L?=
 =?us-ascii?Q?yokCv1AQaJv88BNGW+2RkftgYtgg5RAESIZdT57QE/whiXyTx02P1UKWlJZ4?=
 =?us-ascii?Q?s6EpDTooi84csxdSBId5U08c19+2vpOGeGOgQKpw2YJp/92o5VBDffcjar37?=
 =?us-ascii?Q?A2y8itdeAHjA9Ot7wDXy7f2VtprbhSIsYV2PanhW6PCSjCTfXlmR2mLV6DZu?=
 =?us-ascii?Q?9PK//9bskClTwj5kA13NRM/G0a+ufa6t//xHRY3cDHDCOwtu2kQ7DV2eEQNz?=
 =?us-ascii?Q?pmqoVbZqqJmFDfSR+RHAjV0M7Y6ja5sinAef5yeLyv2qNB0HlWla5YlePnAe?=
 =?us-ascii?Q?19n4HmxlswQdgfjPbDOKeeUAgVX4EWewjJTw520nwgtEFO+gXKN0r9cBXRkK?=
 =?us-ascii?Q?pFfwzRCVpwZBwMyGWoH21QQ6f6OFuRITPrY5yLntldDmB9cYxpFog07oRed/?=
 =?us-ascii?Q?gQQWGcJ9L+RQAvEtwcAX9CqCFFVq5QbMZHSIP7ri1NJlfjo5hmFhzt+q4QHA?=
 =?us-ascii?Q?4gPfISRpELNrPTY9um0RmwtdgFMURs8h6a26?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:14:10.9932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8473b50d-035c-4996-e6eb-08dd8bdf1b83
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7591
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNiBTYWx0ZWRfX8TXG5NNfhhJF mHV9/P6BuFsk66DxQmq6tj7jgop1Zb/1/UNOulJ6tD0DKoOjFv23snpQ6E83eBjVF6JNO1mJPBA nKATLQFqT85V8x33G0MhYiOoGTo71gUeRr4RNbhGJriwhHSCEn3tlkiEFMgM9g3e3vn2fLpm6gb
 NYYDFieY14mwOhEm73uJ4GriLnaQt+HMPTuDFAG36OWtQUKBp+AO8duhsbDthrF7UWTlA4ZhoB4 rr99dWAeDvKnjuBPvGxr0r5L5JWgJxAgkBVOA/dIEpd8oqBGnepAX7yCtV4JDSNUi0KjDymTFAO onQ8K6EF4mgLh50YSuhW4vslXghayEluOOGeOaCjgHrEdgiw60r3FZLCa4rEbgysmEMt++8wiCw
 YQ28BYiTGAtnpDqYIYPVAh3S9rMCrX7fpMLOSSWpmek4l/isDSatAwEjV/GXH/P4k3A9Mgt/
X-Proofpoint-ORIG-GUID: aU06ANHeaawA3ZHigESQdMLKQQ2z9_wt
X-Authority-Analysis: v=2.4 cv=at2yCTZV c=1 sm=1 tr=0 ts=6818c7bc cx=c_pps a=SmJf4+RRogz8lGj/IwyRsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=yfiEJBITTQKbkqTnPnMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: aU06ANHeaawA3ZHigESQdMLKQQ2z9_wt
X-Proofpoint-Spam-Reason: safe

The static platform_component name string is overwritten on card tear
down by sof_link_unload(). After this has happened the NULL check
on it in asoc_sdw_init_simple_dai_link() will fail when the driver
is reprobed, causing the machine driver to fail probe. However, it
also turns out that the ASoC core sets this string for all topology
systems in soc_check_tplg_fes() anyway, after the aforementioned
NULL check. So there is no need for the machine driver to set
the platform name to anything meaningful at all.

Replace all the platform_component stuff with some simple place
holders and importantly since the core tampers with the
snd_soc_dai_link_component in multiple places allocate a new one
for each usage.

Fixes: 59f8b622d52e ("ASoC: intel/sdw_utils: refactor init_dai_link() and init_simple_dai_link()")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Updated commit message

 sound/soc/intel/boards/sof_sdw.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 29b813943ccc..51b29ebdf405 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -780,13 +780,6 @@ static void sof_sdw_check_ssid_quirk(const struct snd_soc_acpi_mach *mach)
 		sof_sdw_quirk = quirk_entry->value;
 }
 
-static struct snd_soc_dai_link_component platform_component[] = {
-	{
-		/* name might be overridden during probe */
-		.name = "0000:00:1f.3"
-	}
-};
-
 static const struct snd_soc_ops sdw_ops = {
 	.startup = asoc_sdw_startup,
 	.prepare = asoc_sdw_prepare,
@@ -836,6 +829,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		struct snd_soc_dai_link_ch_map *codec_maps;
 		struct snd_soc_dai_link_component *codecs;
 		struct snd_soc_dai_link_component *cpus;
+		struct snd_soc_dai_link_component *platform;
 		int num_cpus = hweight32(sof_dai->link_mask[stream]);
 		int num_codecs = sof_dai->num_devs[stream];
 		int playback, capture;
@@ -876,6 +870,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (!codecs)
 			return -ENOMEM;
 
+		platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+		if (!platform)
+			return -ENOMEM;
+
 		codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
 		if (!codec_maps)
 			return -ENOMEM;
@@ -917,8 +915,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
 
 		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
-				       cpus, num_cpus, platform_component,
-				       ARRAY_SIZE(platform_component), codecs, num_codecs,
+				       cpus, num_cpus, platform, 1, codecs, num_codecs,
 				       1, asoc_sdw_rtd_init, &sdw_ops);
 
 		/*
@@ -994,7 +991,7 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    playback, capture, cpu_dai_name,
-						    platform_component->name, codec_name,
+						    "dummy", codec_name,
 						    ssp_info->dais[0].dai_name, 1, NULL,
 						    ssp_info->ops);
 		if (ret)
@@ -1018,7 +1015,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
 					    0, 1, // DMIC only supports capture
-					    "DMIC01 Pin", platform_component->name,
+					    "DMIC01 Pin", "dummy",
 					    "dmic-codec", "dmic-hifi", 1,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
@@ -1028,7 +1025,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
 					    0, 1, // DMIC only supports capture
-					    "DMIC16k Pin", platform_component->name,
+					    "DMIC16k Pin", "dummy",
 					    "dmic-codec", "dmic-hifi", 1,
 					    /* don't call asoc_sdw_dmic_init() twice */
 					    NULL, NULL);
@@ -1071,7 +1068,7 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    1, 0, // HDMI only supports playback
-						    cpu_dai_name, platform_component->name,
+						    cpu_dai_name, "dummy",
 						    codec_name, codec_dai_name, 1,
 						    i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
@@ -1097,7 +1094,7 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 	int ret;
 
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
-					    1, 1, cpu_dai_name, platform_component->name,
+					    1, 1, cpu_dai_name, "dummy",
 					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
 					    1, NULL, NULL);
 	if (ret)
-- 
2.39.5

