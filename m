Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B71369326
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=XeA9A8tutZBpr8WJ24IYqirUs8fXZuoNa02cUi7y0Nt5r6LcLT2uhrjAEsdQtccBuIh48KPTV4Yy9PT8qbHzKN/cIyH03XT/JSQsaEvI0vZioTNOI5xp+USDCSk0Vhowl5Mme3wK37AdTxkKWC1WVtNrSVqU4dWlknar/3OWfek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=6/Hoo8Fa90DQWi1vxRa2tKsW/xeyqdYbOc+V2YlCrFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=en6c86m33GJWUo0/+Tan9Zq/uhoX7rH148Lz9Odr+gnf9bQpzgSbviYKfpv8usz2MdNCQ2iFHHARhY7ftlHlwNbOlPVc6q0urhhXdpHDx0V7ZzEvfuMETieuCfRIJ4mpgwlSl3x6o2sT6aFeM6tkpFagywKeVRnA2bjzpe/INcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=or0fgkAT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NMwtdTqm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="or0fgkAT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NMwtdTqm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5859AA1R3552663;
	Fri, 5 Sep 2025 09:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dgrAibzTUUPZe78cR6ryUotQfS4UqOs6a4OKZfmXMXs=; b=
	or0fgkATAOFH7anXcVV/uinRd8P06uTcKWNESCS0WWK1WkxW++d+Q05VBsFKVPAB
	OXJN+aiHSSt+t2VLWORYmDPQF8wH7YfSJygw4v1bGxikP5GiPsD1F+7yhmtiduXZ
	iY9z4nmxCeNzVrrcIe9R+vyTv9o4z83CIB0QIGI60G0WLDZFs/GF4kkaMgbU6tSy
	7wLCuoZbliCFVMjTZ5Arp3sRUYgmFEATO4/GoLri6L+RvugIP91qjALQkQTeF3v5
	ZqQ5qPkl67VlceFzoaXPvksVrgcYfzW2E4SVyH2wdzOj5ibVLMSqVzIw4y30LNul
	oOn8Qg5yvKBWuotie00ZmQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12hn2217.outbound.protection.outlook.com [52.100.167.217])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48yw0b0bk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWFsCpiQTpHQ5vTEn1WUqE2mOdy0naJOGifkaaGkDf3+QXSYyTGsfihrpJqH29fA/tm32WWBouJl//FYGSIqv7KmQV1m9bm0nV6iZRFKJ99cBRUZdbRU6bET4kfDRywOEf3BqPo9jIdgQtNLCtig74OYaXy3EdawIh8HJ6ejEy798jTxZNrA2hIEVyNOvfo1c0C6gUot/Y+DtCeKL3QQKJjoDNdbc3uaCE5qd1uyKrPWJVCxj+xQOdbKsT0a3Xg92aW/tWYd4Pucb4Shb4R3GlCSaR9ctQ4Ez6GVrd6kTbaYs3FiTLBSn94UfywJYBVwFl1xyOx45jTJfZb5C4y2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgrAibzTUUPZe78cR6ryUotQfS4UqOs6a4OKZfmXMXs=;
 b=OE8XPJf6DJgbbflYJF56/UZrImmDTml7oV0z1TcYleR2nXA49HhQ0NJlseZPdFDe+iab+LsWTlZXFxOi/TmLMMFZPejHcezMil6ftgk2YXzPANnjrW7H4n/0Q2fXT0+LW6LGSM9o7HLQy9XDfq07IiiuSYRGUfkF0ATDMknWCMPyA1JP9hhdp0SnJjtuVnGb3ZEPRjVpToFqUtcpv5+IIttULn0CYiimAEo04L+Qh7Umey8HcOQLpwvo3nRJCePYZsr7pvqUAgXakjPw8gRNWa3rZDjNIMELBv/TWCo+kIZkBg8TZmHoyDrp0Fsg8/YFG0qf9nQK5gMvkZPiqfoh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgrAibzTUUPZe78cR6ryUotQfS4UqOs6a4OKZfmXMXs=;
 b=NMwtdTqmoxZyYyjlEii96vXVB4qOj62tb/VuSdkFPtOlGBMeeQVNRkxuzNNMfnOo9CTlCfD8hvlVmty9qgEc9B94IA10aYccPPS5kuipyC8FItXwT96m0/G8FFeJe58vVjj9QM654IhQ5/0lXExk418CghDo62CYJ1ArYmLH3hw=
Received: from DM6PR02CA0160.namprd02.prod.outlook.com (2603:10b6:5:332::27)
 by SA1PR19MB7157.namprd19.prod.outlook.com (2603:10b6:806:2ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 14:31:30 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::d7) by DM6PR02CA0160.outlook.office365.com
 (2603:10b6:5:332::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Fri,
 5 Sep 2025 14:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B3141406541;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 96BE782025A;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 01/15] regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
Date: Fri,  5 Sep 2025 15:31:09 +0100
Message-ID: <20250905143123.3038716-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SA1PR19MB7157:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b4d70481-a31e-4025-de66-08ddec88e6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Y7MzaXCHwuoFpIbNuilh2fNPmpSOAWrlWH+yiplri+qzKg9H3/b/aQKNPVw?=
 =?us-ascii?Q?rbHLEE6gSc24tQna/2NiMvXYKZB35e+kOmzJrN/stf9tbW/uUq2grpvu4Bkg?=
 =?us-ascii?Q?rkUDy/t6WGxpuqX0BUImF/vLMbzAgDVWAEvu2h/Wh5YBHIHitWQR7T7R1rgz?=
 =?us-ascii?Q?2JNS7aar5cCmlQO4yJg4gpmk0qgQJ9vw/pI39vPCcYvZT+50hC6qm9EiISNC?=
 =?us-ascii?Q?HlojYy0Wx18LPAHlL8GmrR7EUdYalOLjoRGno1TuPnv3CcPHaFA5dc12CYtd?=
 =?us-ascii?Q?dwBUER6sdvwxWb6H1rtc8/IxzrVSFq9bh9QMqfl56gd8pGmAVFQrSylFec2V?=
 =?us-ascii?Q?U0hs+PitcUoe7PDy8WmfrFjlPK7Ole34gEyaZ1OkjeQgD0HWonZfkSZHOD3V?=
 =?us-ascii?Q?4VJaWfItfOaxgFvhyYbc0RdYMWTEgxSXJKYzl3i7Gkor6Gd7PY5632+tTkOP?=
 =?us-ascii?Q?iHGsUymNinVzY7aCvAdi8bEHu4OexXXGZz2MVIDncaKujSCk9ETlpB6ZezLz?=
 =?us-ascii?Q?74C+bWjmMw2mTUCebmL5yFa0BuBI2Yzm+YQ3ZGcNEfpfoqIdX0kiejsFuszT?=
 =?us-ascii?Q?ycDDzDDep8T5rQTt5V8937x6uwHgvU94+g1gj3DZZfymYD1K9FSyY6R/0Rhw?=
 =?us-ascii?Q?PNoQdEw9+q7jghyonuZOaMo9g/rhI9OuwFZEY8Q6SMdQWeT1r+OScn8Po/Wq?=
 =?us-ascii?Q?VJRX52wYyOre7A/7MkWDx8XcfVyshVFLg0Yv91l/KtCSCGM9TNNcskczbezq?=
 =?us-ascii?Q?Dl0yQWxG5U1CF5AnA6BEuoYpRXTRRChUWLOeb176q0AdlrTikrZRINHUZaLL?=
 =?us-ascii?Q?zWvgXaKMn8tz+au4qD3sQwcnk1BfB7UVILCTCx66lVfVRgYbCQ2IQLPv4kdv?=
 =?us-ascii?Q?oSXOIiWX0dJhinf0I95ESjpB+fr4MA2dMBYmp1VFqlqkXRbbmfg+yYv7QCI5?=
 =?us-ascii?Q?NJTkKfuf03CICRq4OQsCefGCtNTkuESmM9pMPAg2aGskvHQloBLA9w/lW1xi?=
 =?us-ascii?Q?G1DGBFEoW0cXnhQJnTlGiBwtnt7REAVhxb25lun7LUlIr8peht3cCiqHsuL9?=
 =?us-ascii?Q?REHMUgG/PQ8dDygPZuATaqorJ5uIQ/vCUO7mG49QqnftilkIlRNgEdDUKGq2?=
 =?us-ascii?Q?45u7O8dJ6Rjd67rw1kgn1l6u5+N9hQ3KRwVuPs9LI+Ga16HfjfcsKc6RlTHW?=
 =?us-ascii?Q?X3PAH8n7H8qA32pvLEbcuupM5mVGVAJ9SWQNzpiYWsvkNZmuOlc4QJxE2ykJ?=
 =?us-ascii?Q?nFAetNgVpUroQZFBTdJvD3OmUHU9cD0FloKliWiEhIKLzh1UVKvgrZvIrab4?=
 =?us-ascii?Q?tmYx/idoYyn4FFpPlgntOGW7wS03OCh4EKdul2S4cPqHyczVeDvODk6JUpyU?=
 =?us-ascii?Q?w1jLToE6EodLFw8KPtUhGyMqYDCo6V7bYIYk252Bp4iQ6PjwxRTUJqnw3T8Q?=
 =?us-ascii?Q?V8bh0+STnM+64pbz2qxvpul7g68BD/8L67staiGMDwgPbphsHQtr1gKTfTpE?=
 =?us-ascii?Q?6cZZoPvsiPWrku5/J8Aj7oFO56nSrtJuWGfH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:28.8493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d70481-a31e-4025-de66-08ddec88e6f7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB7157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX1p3cmAJeWqVr
 Wy3gj2CGx/3EOeYJnI02qdhBQ1pQ0/0m60ui9uhmAEwiAnbwTUuiPT/DffKcAwO4szPBguMLJ45
 KqDIscend6J6LuLNOOULAvv6j+H534ba5/HzS9S8xo9iOZxD/DRoavCoUFIpck68Zh+3VtObOKm
 uAtPedQTTuOrX/fVk1ddAom6j3C23/GsLP+PzByDS8RGRY4Sp7VvBHEOxZfjv5WTRnVsjP8eJZ0
 ZGJXHTKGKHRLnpJl+gBD6h2YI1kOHq/yXdNi5QDYLkxAUVgZvSa/sG0sqPRCPtxAVvBSz61tmPy
 6FuowX1Ab6iSHREg1EIxdBXjki5uL4ohjA1VIeNW9B/ie57YOZ5pOvhq8N4pT4=
X-Authority-Analysis: v=2.4 cv=YJufyQGx c=1 sm=1 tr=0 ts=68baf445 cx=c_pps
 a=XP1nLjTJzgQXD1mIvOAGUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=EeMxKaNHpS4G9r6iSpwA:9
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: Ssa-kC2sMZu21GuwBrFpZkjmQ7ZFri0c
X-Proofpoint-GUID: Ssa-kC2sMZu21GuwBrFpZkjmQ7ZFri0c
X-Proofpoint-Spam-Reason: safe

Currently, the code assumes that the device that registered the
MBQ register map is the actual SoundWire slave device. This works
fine for all current users, however future SDCA devices will
likely be implemented with the SoundWire slave as a parent device
and separate child drivers with regmaps for each audio Function.
Update the regmap_init_sdw_mbq_cfg macro to allow these two
to be specified separately.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 23 ++++++++++++-----------
 include/linux/regmap.h               | 21 +++++++++++----------
 sound/soc/codecs/rt722-sdca-sdw.c    |  4 +++-
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 86644bbd07100..8b7d34a6080d2 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -15,6 +15,7 @@
 
 struct regmap_mbq_context {
 	struct device *dev;
+	struct sdw_slave *sdw;
 
 	struct regmap_sdw_mbq_cfg cfg;
 
@@ -46,7 +47,7 @@ static bool regmap_sdw_mbq_deferrable(struct regmap_mbq_context *ctx, unsigned i
 static int regmap_sdw_mbq_poll_busy(struct sdw_slave *slave, unsigned int reg,
 				    struct regmap_mbq_context *ctx)
 {
-	struct device *dev = &slave->dev;
+	struct device *dev = ctx->dev;
 	int val, ret = 0;
 
 	dev_dbg(dev, "Deferring transaction for 0x%x\n", reg);
@@ -96,8 +97,7 @@ static int regmap_sdw_mbq_write_impl(struct sdw_slave *slave,
 static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct regmap_mbq_context *ctx = context;
-	struct device *dev = ctx->dev;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = ctx->sdw;
 	bool deferrable = regmap_sdw_mbq_deferrable(ctx, reg);
 	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
 	int ret;
@@ -156,8 +156,7 @@ static int regmap_sdw_mbq_read_impl(struct sdw_slave *slave,
 static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct regmap_mbq_context *ctx = context;
-	struct device *dev = ctx->dev;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = ctx->sdw;
 	bool deferrable = regmap_sdw_mbq_deferrable(ctx, reg);
 	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
 	int ret;
@@ -208,6 +207,7 @@ static int regmap_sdw_mbq_config_check(const struct regmap_config *config)
 
 static struct regmap_mbq_context *
 regmap_sdw_mbq_gen_context(struct device *dev,
+			   struct sdw_slave *sdw,
 			   const struct regmap_config *config,
 			   const struct regmap_sdw_mbq_cfg *mbq_config)
 {
@@ -218,6 +218,7 @@ regmap_sdw_mbq_gen_context(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	ctx->dev = dev;
+	ctx->sdw = sdw;
 
 	if (mbq_config)
 		ctx->cfg = *mbq_config;
@@ -228,7 +229,7 @@ regmap_sdw_mbq_gen_context(struct device *dev,
 	return ctx;
 }
 
-struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 				     const struct regmap_config *config,
 				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
@@ -241,16 +242,16 @@ struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ctx = regmap_sdw_mbq_gen_context(&sdw->dev, config, mbq_config);
+	ctx = regmap_sdw_mbq_gen_context(dev, sdw, config, mbq_config);
 	if (IS_ERR(ctx))
 		return ERR_CAST(ctx);
 
-	return __regmap_init(&sdw->dev, &regmap_sdw_mbq, ctx,
+	return __regmap_init(dev, &regmap_sdw_mbq, ctx,
 			     config, lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__regmap_init_sdw_mbq);
 
-struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__devm_regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 					  const struct regmap_config *config,
 					  const struct regmap_sdw_mbq_cfg *mbq_config,
 					  struct lock_class_key *lock_key,
@@ -263,11 +264,11 @@ struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ctx = regmap_sdw_mbq_gen_context(&sdw->dev, config, mbq_config);
+	ctx = regmap_sdw_mbq_gen_context(dev, sdw, config, mbq_config);
 	if (IS_ERR(ctx))
 		return ERR_CAST(ctx);
 
-	return __devm_regmap_init(&sdw->dev, &regmap_sdw_mbq, ctx,
+	return __devm_regmap_init(dev, &regmap_sdw_mbq, ctx,
 				  config, lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 4e1ac1fbcec43..70daec535976d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -676,7 +676,7 @@ struct regmap *__regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
-struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 				     const struct regmap_config *config,
 				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
@@ -738,7 +738,7 @@ struct regmap *__devm_regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
-struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__devm_regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 					  const struct regmap_config *config,
 					  const struct regmap_sdw_mbq_cfg *mbq_config,
 					  struct lock_class_key *lock_key,
@@ -970,7 +970,7 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  */
 #define regmap_init_sdw_mbq(sdw, config)					\
 	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,		\
-				sdw, config, NULL)
+				&sdw->dev, sdw, config, NULL)
 
 /**
  * regmap_init_sdw_mbq_cfg() - Initialise MBQ SDW register map with config
@@ -983,9 +983,9 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  * to a struct regmap. The regmap will be automatically freed by the
  * device management code.
  */
-#define regmap_init_sdw_mbq_cfg(sdw, config, mbq_config)		\
+#define regmap_init_sdw_mbq_cfg(dev, sdw, config, mbq_config)		\
 	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,	\
-				sdw, config, mbq_config)
+				dev, sdw, config, mbq_config)
 
 /**
  * regmap_init_spi_avmm() - Initialize register map for Intel SPI Slave
@@ -1198,12 +1198,13 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  */
 #define devm_regmap_init_sdw_mbq(sdw, config)			\
 	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq, #config,   \
-				sdw, config, NULL)
+				&sdw->dev, sdw, config, NULL)
 
 /**
  * devm_regmap_init_sdw_mbq_cfg() - Initialise managed MBQ SDW register map with config
  *
- * @sdw: Device that will be interacted with
+ * @dev: Device that will be interacted with
+ * @sdw: SoundWire Device that will be interacted with
  * @config: Configuration for register map
  * @mbq_config: Properties for the MBQ registers
  *
@@ -1211,9 +1212,9 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  * to a struct regmap. The regmap will be automatically freed by the
  * device management code.
  */
-#define devm_regmap_init_sdw_mbq_cfg(sdw, config, mbq_config)	\
-	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq,	\
-				#config, sdw, config, mbq_config)
+#define devm_regmap_init_sdw_mbq_cfg(dev, sdw, config, mbq_config)	\
+	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq,		\
+				#config, dev, sdw, config, mbq_config)
 
 /**
  * devm_regmap_init_slimbus() - Initialise managed register map
diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 70700bdb80a14..e92988aea3f0e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -419,7 +419,9 @@ static int rt722_sdca_sdw_probe(struct sdw_slave *slave,
 	struct regmap *regmap;
 
 	/* Regmap Initialization */
-	regmap = devm_regmap_init_sdw_mbq_cfg(slave, &rt722_sdca_regmap, &rt722_mbq_config);
+	regmap = devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave,
+					      &rt722_sdca_regmap,
+					      &rt722_mbq_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.47.2

