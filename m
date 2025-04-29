Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B929DB95
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919599; cv=fail; b=hpDYURwiQhf+Tx3Ao0Nw/6YTiqA5pgTFbuvSq9C5ZOb2iAEsf4bEMPw77QzV1CKYveLDjv/zoXqoox3PJaCDFSjMkNolysoJITRcyvltRCuOC/SwqgoFRLRh0VhK6amryMcf8qwKdNBSDYIgPinyR8MAJq/FJ8+rrTtdHtpUD9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919599; c=relaxed/simple;
	bh=wxNcrxD6AGWyQ7x94SaLw2Zl9xQQIOGTh3r765DA1Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jdzr+hWoIp12gOrPZr/EoLTUXdeGdPBHA3UJM1mJuUiefwHukySCCPj+tlBagh5AhrI66r7nm6WRuQ1CRe9wWsegIEaVIpxM70xhEGVOuXXh2HwKcvmbEpqin9MWq8lMFtgb8qIi9s4cM8421syTe3/es+G/I+cDNC+DUgelzbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QD3RzonS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LIsnSaMb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QD3RzonS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LIsnSaMb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T60TcR012706;
	Tue, 29 Apr 2025 04:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DBVrgY2fpV1uoUrWT0U2fia1tGAePYdGBayBsRsW6qk=; b=
	QD3RzonSzyBZr6zfVZAstAW82TibwdcrVheuVpGikTmX6JiTWZpnVdgexxkO1x3n
	oHyNt65yOKS+kYgxpKZqZNE614ihREgRYdnaD7Hy+yfiUIztgIh3FkTbIAJeYYeT
	JMPZgA/kzKSwpNnm8B2dvq9vZKafd0zzUbWzfVyi5jUYVdoGxMDBLxfQVJkh1UCI
	oFn4yiIBVYdn4y0Yau3t9h2whbXUdVfvXCP8XZgMiv1EMMO3qXaaMGep6HQomt8G
	hWHX2ZYI+vfYiWaciMCjXA+9SimTyAQPCeg6MSZuAka6nSvjkQKBLMWKmYsHV6c5
	RpuoHvWxoVHrCAly+XGDNA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46ae7cgv61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:39:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCfFXXURscWf4THu/cb66RUuTfPD+Jsg9Hir6FTTU7YMeb7jxPRRoEYKyL6r0seGR7P4zMyW1Zixjzj371cO+1hogJN+MEJwkeGHWsxjlxwCw8RAah1ILlfVkfTzzo7/HOCO+qfqGdespLPDRDfQ7pfO5piOYNnKa2q5DEjG41ck9kIYGsh+4ABL5gqdb0JQPq355euiZib6fHq9gx0vCPEQyPec6vv7GfHtThItMRzMRAhYn7nzG1mfDxoJkP1ZBQrRq3IHUirtmjWVJlLISaTKjz+WanOW2tyMEVjj3pGt6ti4FT7zK4hU9gpB7wKZ/dIXPluTcaYsdjhMge7emQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBVrgY2fpV1uoUrWT0U2fia1tGAePYdGBayBsRsW6qk=;
 b=YQPvF+qoQg8Ms4QGe7NIo1jqn7qd8mEYaM8bn9KDkC/jfabWSrln403UwQU0klEqHnlBq9LeeJIRuaYR/xldUVO1JQeWnA5HSlHxrpz+/K9iVQbtbSXpYgj1ZSeyOXh0WIzQ7O6o+hn9W0fh8etsDbKITQzRKeA6XiijX/nVgK7/w8qUmLfriCl7LB0prehK9AvamhPnnu5/u8A+aFixsOegkITZ31g6uuEKtsLa9l4gaM1V8rA/QQktKZD+jpKWi+2REbGbI1ABWkQHxO+gQmC2AAcTRs3RSpfjfn4MpBvfwv/azRJiI/+JKuD0Z/zENf1nHajwirdM2xLOkuAskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBVrgY2fpV1uoUrWT0U2fia1tGAePYdGBayBsRsW6qk=;
 b=LIsnSaMbUSvHb08FzTYUCGhWNUaLYFdJHnhjLuIRQ/G2R03u9+VblFSySswXQOICQ0+WRzWB3nueWiZ15hF5YCYaWpWiPFT+z/F4KrRWserpOpKLDs67AfWzGtrw1vk2r+kO256WIyN4++QsZp8Y5t4uoadIadsuz6zWVmYs8t4=
Received: from CH0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:610:cd::26)
 by DS0PR19MB7466.namprd19.prod.outlook.com (2603:10b6:8:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 09:39:33 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::57) by CH0PR03CA0111.outlook.office365.com
 (2603:10b6:610:cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 09:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Tue, 29 Apr 2025 09:39:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46EB8406545;
	Tue, 29 Apr 2025 09:39:31 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 25B5F82026B;
	Tue, 29 Apr 2025 09:39:31 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: Intel: sof_sdw: Don't bother to set platform string
Date: Tue, 29 Apr 2025 10:39:31 +0100
Message-Id: <20250429093931.343725-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
References: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS0PR19MB7466:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7df92dd1-cda3-4176-20a1-08dd8701bf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HWvnYBymuNBipL4HVB8kMpB+9M6MF8Vpwmnog8ZDlJKk8DoGFL43wgR5r/Sd?=
 =?us-ascii?Q?BZeHQCWQQwsAUlIN5B2HufJD0FyC/XypBw4GbtDYRYWV9G9hogwWjfa6ehLJ?=
 =?us-ascii?Q?4px73fEy5DuNkXNwXSBtd6qV9BAb48k9FRrsw00p2ESK+Qu8XDVDPgbkOVTN?=
 =?us-ascii?Q?XmzoC0uR5vTPb8ht7ruDrb7oQ6nckoPEEA4CyBsWuCFjL8YcGgRedQ9sKkS3?=
 =?us-ascii?Q?PlKbJdoKPtd0F7sEan7BZNTgcKpr5ikVxZkaEVAnpsL2J2SX0HJuFOd8/j7z?=
 =?us-ascii?Q?/cQ6JHhP0aSmi3fsYq/DgZkS9XQPEBBzyCjNeeQjMKaxkhzx6Z18t9FnIieg?=
 =?us-ascii?Q?i4xNAXPtH0cHOmlOF/k3oPtfPudWKyclIW9RuBtlIwYTyJpLyGLJOmfNsdk7?=
 =?us-ascii?Q?83GQoWsaxhnXM37L3ZN4XNXvyCzZ/2SoW5R4hQXuPstj2QeADkEdONGp2WF7?=
 =?us-ascii?Q?nYN1Ph9XoAqNVFhQolSlxWheQl6LWC6PlWl/D1vSiV8g6zwJYIBfcx9i3iGo?=
 =?us-ascii?Q?88oLtDyzQjYoosTDQK0E4xdNKhYx5pt/d0guRXauQSmGNDq3dVEHQcwSqdP4?=
 =?us-ascii?Q?KNtvAP4mEBlboKrTXpg8aTL4cMp6JLZnEfnloykzQQydAI/mRiUOO1PKr3on?=
 =?us-ascii?Q?JMZhKFFm5A2cIRyYEeCDr8OhcUYwTleZ9/5XmZTGIeIlafHtZqLEweU+gJPM?=
 =?us-ascii?Q?dVv12rVYPSB2VPr0pyBOI9Cm9GXmEdPrBfJg/aDk6pCg7fAg/uW26IVYG7UD?=
 =?us-ascii?Q?hgXscdX4MPQj8IrueQK0XI1NpjW7tgZd718eTtofwCEh5OF1TYsk+HPHawvg?=
 =?us-ascii?Q?4yGDbP1B/Llfmc0TB6GuMFiHrdcuueY4zf3iLj3XSH/hAUaG32elv4AtvlKl?=
 =?us-ascii?Q?JNIx0bDCUPQmyME25/RQrkRuGXLIcscJdMRXN3gre9SfeWeM41k+sC7aL0Vg?=
 =?us-ascii?Q?TPOazVsFXsVE1nCi3bf8JMZgttHrQODzMMmB7GRfrLVmsPr1NG7DPeGVb42p?=
 =?us-ascii?Q?PB2ChfIELrH/tTc/DwfzDQ+yVLz36DKi2+Ldj9Ql/YRY+epFG05JP6433vv4?=
 =?us-ascii?Q?fR2QaIxeXjRj+U6EZ/4q43+f+7S/AWi/akJ5GHVASabYApfpXP0rieOziJmK?=
 =?us-ascii?Q?9rePdKJ03to9jjGAxTrAvVtbpAS7f+iGk9kvxh4zhyQpriWB0ADSXbCa9FwB?=
 =?us-ascii?Q?SqoRwBHDzlNw8jpv0lqLhTwjTrXdrzZ9mEwKWwbnoPNPnvnENxiU2nnOP0gs?=
 =?us-ascii?Q?PTAOHJO1vhwyXfPNLiwNzOvnOCZOs3xMej2pwHRVYvn+1jkj+c2SN0XrX73j?=
 =?us-ascii?Q?zLhiIAxrJKC7Zu0HXo0CpuhD0uKWSJU8C7gniyHmCvirAjAu88kr7ove5syn?=
 =?us-ascii?Q?/Rxx5dPwoMB+AVwynrUqiIj7RbR4LiQQqxkfpI8930kbrHsr8Y8aAb0o+a4e?=
 =?us-ascii?Q?Yr6Fiy9n05KlyzKiHuv9+D3ZqsSSQFzd4wEmws0o7nDx5WxbGiqWFwLcoc9f?=
 =?us-ascii?Q?cFh2m2rCEnBVk2NxiaGCsiT4ChuqBVYfeAdM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:39:32.4461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df92dd1-cda3-4176-20a1-08dd8701bf13
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7466
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3MSBTYWx0ZWRfXwWjyVz/YZi8n vVvieiFQf0y/HIssrnA6W9jC//WRlBDVRsmI3ezNAdv7CTfF2GdYDb2dicsO0hIhiOMdtuVuK1K q7YSkFGeZZUMxAAk+2WQgeYwBIHSofFhJ2NMN9VyxhG6R3rc0t4paeM7SVBiNGP448aNgBtTHKn
 kY7Z9AectSF0+Ge73Znt30jjjA2vpiCtV78DnFVrVGIu49d8iuye8mJN1XvkSlBoC5aoMfF/2xY r/BaU83lgEcPqF1fYd7XTb+TMGmV2YvTY3+WnaKjzRDt6ZGSarTyaTm1sP8TN+jIMgX9BzDcIAv 1SJ6iEUwaNPo2G9u0sOGFmzl/NsZWif3EuSnLKutq8m+f7Ol8h1vjc/Qae7cDD/UyvvTSrCs1E0
 F3tYme4xs30PKLr8KPI5jBbLFXro867Fcw4lnNzMonG8bFu+dfAaU538q3F7sdVmXQI1Czga
X-Authority-Analysis: v=2.4 cv=DotW+H/+ c=1 sm=1 tr=0 ts=68109e58 cx=c_pps a=BfiT+f4K8gVEfImFRIf1tA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=0wPto330FwRL_duMz_8A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: BRGc3PxEWKtn4gY8d7FnC0U3zq44jeRE
X-Proofpoint-ORIG-GUID: BRGc3PxEWKtn4gY8d7FnC0U3zq44jeRE
X-Proofpoint-Spam-Reason: safe

The static platform_component name string is overwritten on card tear
down which will cause a NULL check on it to fail when the driver is
reprobed. However, it turns out that the ASoC core sets this string for
all topology systems anyway (after the aforementioned NULL check). So
there is no need for the machine driver to set the platform at all,
replace all the platform_component stuff with some simple place holders.

Fixes: 52db12d193d4 ("ASoC: Intel: boards: add sof_sdw machine driver")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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

