Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765F8238C0C
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672133; cv=fail; b=L2CpiAHKJLTcYgFY290tEHqlauy50rFimDWuQZiFj8djYn2nvjZaiFKpeBBJIlWCM0N/IT3Vo/kqzkoEoYSWK6SNwsjmlMKR9rEfPRE0BVi0q2EEypP6ybPpFF7gqQhPUrJO5diaV+3YCA3lJWvOgg1hhi1ga4cAdDH6T9Pxurk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672133; c=relaxed/simple;
	bh=AkzCXIZcSKn6Y5Su3R/aFIIL64mKwcUV4LvNS0SJw4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wn65WGIu/GyTrOEV5AwOJyceJqn6HsPR/nxO+vT5J0phH47Ct2wAtTLIrslIJXmbqU7eIqqKM/Rvw5HH/2tfhSl7gI5mkX/l3ZHf0kfQ2RuN5kGWkGLf37fIjUiWPdn1os+ScBmA8SkyDWccmVsgzpbTqtLu0eds9y+Qo8G7j3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jV2HQjnc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nAVExiUo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jV2HQjnc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nAVExiUo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5UOx0009748;
	Mon, 23 Jun 2025 04:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Mprkycc35S0SMejsr7OMWgWhzRvB8iNv6PnkjRIOips=; b=
	jV2HQjnc7om1a/x+cAkckcD7Jg58vbCdWNXpXGPP5/fSJn3wMFnkuDw/w55JHOyc
	BYxjOPpwJLgii5AWxWoqGovt06cJaL2IYtbm8RWu6P8evsHlO2ob/IK/DtutxetZ
	y1MgUKXCNtYJpvPLJCG0PPPVXdd2iB+0bIs54JB9IgGrVtNBhBGgNelTEVA23dvd
	xZJURkd3biiGAyXGKugPgRzQ/1ycbSIu+Dr9HaxInmBqg97CSmN2S2ChUATbupWM
	byZD6vvhIFv/q0kyHjMxxHVKFTnFGhgam7nuqfZA4uP3pydmfOgpIzgPBD16D2XS
	12EeY+RFu7r4ck7YeyY6Gg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2135.outbound.protection.outlook.com [40.107.95.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9gt8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc7aJhKgRi7AD4CDXkdIACUkVG6HoRm1amyeFO+xH2LSUkI52StGjr1vKG9w7Ce7UkeCtoxcYIi5Mdk1+KrbYU4/QqZoko4SDhk8F/8aGtEGqJivWsl6CAqABRB6Z8VEtgj8do97FIb30F9x9dfXFK3yFgWVElV2f4L5zrieCDVRnvTgDnX9FPZkjl8U4E//AlPb4pSFHLbt4OH8LwwwThRLyWgubkD54Wxnsj9XdZm5iJQhlORdmv5tMAPwEpiWQJ0Q/LgYkISllKmHWSSLa23KqGEqLyESIOcVfGfe+vR5vE4sX44ec0xWwRuLNkdB5tQK2R1AgZC4PQxTWj5FGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mprkycc35S0SMejsr7OMWgWhzRvB8iNv6PnkjRIOips=;
 b=fdBqs6auxZr2R+iaM89v/d5HhnGayexALLVVePmGywUtqrCdhY6WiKEB6zasAm8uYmSsOcHRtT2aoWqo/2V0HkdNxKlPPZeG19EQp2RIh+wBFYvpJvLmv+5MVPrOyILDO5WSvmfGyjJSNWUh94I37hnnkcGA7Sn3ucGmpy6GAzLE6Gb1AZBSf/pPqCkV69+I/TvZ9ZGBlbEUetR8hrkVf7V7/UruA26qzkX+jY4wRsMJ41kNeQ220VptZSquWPDh3k2GDv1MdduRJ3cTFofqxrGZ7GCdcIi3HSbuXTskoNIqG8ZNZQg08alw3elhWAIBkrH2UlSsY+FnaZ/gMh2FOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mprkycc35S0SMejsr7OMWgWhzRvB8iNv6PnkjRIOips=;
 b=nAVExiUoqXgwVf9eXSdGykfAraqioDZj1aUaCve8VL2APOB0hrPvG5mGpTS+WD3owDTjpYcymCfhh1dVoxqd+8VP/uHGTQTLdN6FxJLtHn62ohNU4m2+44awm/EcNKnGJ/beOh+obZOPOjyZxclsZjmNdSvfUXyjECopBjissmk=
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by CH4PR19MB8634.namprd19.prod.outlook.com (2603:10b6:610:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 23 Jun
 2025 09:47:22 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::7b) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 09:47:22 +0000
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
 via Frontend Transport; Mon, 23 Jun 2025 09:47:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C863140654E;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F66282255C;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 2/7] ASoC: SDCA: Add missing default in switch in entity_pde_event()
Date: Mon, 23 Jun 2025 10:47:11 +0100
Message-Id: <20250623094716.1874443-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|CH4PR19MB8634:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d36cdaa-8ba1-44b9-daf0-08ddb23af36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xd9RnegS0/Sk0DMXB0KV/ZFfIPxenm1K8nffeqNOBH9nckTruG/BzjLH95L3?=
 =?us-ascii?Q?0B/gSOr7uYO5z5q8GtKbi0/tun5a9zAPtVfQhL4l/1VT4EEffWR8dxboVS4a?=
 =?us-ascii?Q?YUN8WXtcgpn/28KDuRivmCyjykDWD72M7dZ7aLXc6zzSfvy7LiiOQo8CMB0T?=
 =?us-ascii?Q?ydL9R6PLXUe6A36k+zeMF9Sw8mEnBxsv8HzOav7QisWPTe0x4srD8fUXMevN?=
 =?us-ascii?Q?6Onfw/xE4cC1IWjUwL5dm3N0Rh4T4wKEiM5g7gWkX6qZYlkx5IAyvOd3ekvM?=
 =?us-ascii?Q?XiMlcflMKp4R5QwRIBhiNIOHhxk58eV4+rM6XtbyZ3RzwnNHmZchHTU81YpK?=
 =?us-ascii?Q?hLRXgieGmb3RfCJ3/dP2Jo5fL2rbOOvFme+m4w59FhAHr+WicIS/iggF5nEh?=
 =?us-ascii?Q?n6tI8buks+O6APZEJl2yt/CxmYMMCiQKjGWnYUSq6DAAf7d/EpxOgh2GtKfy?=
 =?us-ascii?Q?uQKRCjs31gPln8mekMrom0XiCPbkp5UA650f78hlLWJ4uV7+PEISUEAtgXOP?=
 =?us-ascii?Q?eX1FxEYLVVZuTidJV8dS8l/LZHhpFURZJzeTC2oPCg69QmbXw2JnQJ/tjYOb?=
 =?us-ascii?Q?JEdfIo//yMCL+N6xl3aNQYlJvWUCW5DU5NX180auvhgxb/uN4Mjvnf4rmsX0?=
 =?us-ascii?Q?i9iMQSRAINewZm3dNmkOzPkCLN7KpKuTmVtzmj9FLg1ZOCO7YkCvxJQEp3cc?=
 =?us-ascii?Q?mBWd0E+/U56RtFjEhybOtO5qFbFGDVQJjNyIsxvFbsmeFT0V5/5ktDlVrZE9?=
 =?us-ascii?Q?A9amFhklAAUiU8wMMqAONpRQK7e3dkjCGuvpsKiPW2gvMaAsPithJRzeZd7S?=
 =?us-ascii?Q?klS5jtKlZiVZwczNT8qBOw5nnl6AqujblTkSkhwXZT3F7Bkm+l3Jf5DQ/PoB?=
 =?us-ascii?Q?+w+e7m8aKgTkUprsvQxrnziBwx88lOfi5DOXwRAsbJ0QwSM9IDiMakhRbVWd?=
 =?us-ascii?Q?0lztvtEEohDPuhK+MPA2ku+9QbDCHQDWKh1sHyj2Vy3u5hV1UUl/AS/uoiH8?=
 =?us-ascii?Q?VmCzjVQjQEz5oh6k/4KEXTnl8xxQneFJPvJ7rUILRk99SsKrrUIbrPKPEYVC?=
 =?us-ascii?Q?llD7MmfxR8fW+YaM+ito2kj+BSnMo+f3rdFcOmpdL9FKVAE1cgOXvZBT0yUq?=
 =?us-ascii?Q?Zu410ffnw8VV82ivu2QFnn7P0eDeIWHwrrB7UyaWAKoU6Zzld9KXacoqfApi?=
 =?us-ascii?Q?5QgRML68KsboCscHoxAye+oNtudHoT0gLPZZWsrFPLBlV9Ju6hZ81moGKpgT?=
 =?us-ascii?Q?vR+vMepkpwecqydJ1G6RGvdRrq8d3JsHRFzlg9rIkV/LgAaq07OCsPjMnyIt?=
 =?us-ascii?Q?EJREAd4O6hhMmZmLkL79ddAIO5yz1ykAItIFjpLudSiLXmIEF5nbgelP7exH?=
 =?us-ascii?Q?js90Sj8EC2MHYMHsAL7gPvvXIKfWj99nufopxsO/rDo3APLjsItXUNB7w0Bl?=
 =?us-ascii?Q?FVhUi0/hI33awqMQwL3cWx8Ihqqz7EWQQ7HHtCnTxGT1CSgLFRBdZS+bzm+V?=
 =?us-ascii?Q?dddE09MKSvzYV/LcpkhLN5vyJ3os7I01oQjH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:21.6302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d36cdaa-8ba1-44b9-daf0-08ddb23af36e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8634
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX3uGplZj5vpLj goAPgp8fMBGbWdwN+hyT1euj/PIdNRiiWotIiNcEoKQFYcaU9vyyZMWR9IMXBAgjC5UObEbriZA tWH+q5kwRxatkC3sZSCvcTk8ZYR+i9lAU0D/WRKto1aTMwimIxLxJ2m6pmA9NA1eo1sO2RgfnrR
 Ujao5CJXAUphc9aMpl9Ep4DgcRyU9m4Zuk5BxRZPW2R4hskmOXhy1cXsFWjmLejTR0jflLDOUGS 1C5B7YF5MSe9MMYmWymOr9RV5bLh8X4mLY4AvZeEqjU8fNX3PJBxvK79KvT994k8VxLv6RNmTga Mov2GE0X+XJR1UGkrhinOGOlfN7P3Z9Jfzy+X7H0863sU1hSyhDFIQWiD+Abgkz0nhXjWFbbmtT
 sjngPezLbkWGKe0DV7xgivUL59LMR/OAmLLn4ZGhfJQnh2ray1Xy1bFNEY99bcLZ1tckK2aT
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685922af cx=c_pps a=73ZZgQctQage88DP8+znzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=U4EWVuXIc95UegUTx60A:9 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -8mMARQGDbsy3BGfX8CuKJBQ1lDy3AST
X-Proofpoint-GUID: -8mMARQGDbsy3BGfX8CuKJBQ1lDy3AST
X-Proofpoint-Spam-Reason: safe

The current code should be safe as the PDE widget only registers for the
two events handled in the switch statement. However, it is causing a
smatch warning and also is a little fragile to future code changes, add
a default case to avoid the warning and make the code more robust.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_asoc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 7bc8f6069f3d4..e96e696cb1079 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -397,6 +397,8 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		from = widget->off_val;
 		to = widget->on_val;
 		break;
+	default:
+		return 0;
 	}
 
 	for (i = 0; i < entity->pde.num_max_delay; i++) {
-- 
2.39.5

