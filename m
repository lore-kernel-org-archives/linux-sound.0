Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF539262FFF
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807208; cv=fail; b=vAmrPQOOZIhiocqH3W74LPX4CNA4gFF97+dKgoIEThWa5fxtuDE4CBk2+pxKKaNYJontlZ6ZlQUh+2T2ZLH6w4PnlZsc5o/ZvEHqPrLooACE3bh85Ee93ZEa+2l1tIBHNwPmZY0/qfeAHAbvF/PvVK3nmN30yW+jBHdU4stuqVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807208; c=relaxed/simple;
	bh=3LWBkeDLyHRSTYWEWGyLh3IVxv0Xxucu1c+mU+G2TJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uz/2psNbVegxkCwo4bYHgdkC9lpwbS7i2xE4/5C3G49VDl1gEQR+V3fGQ8npcqhBdsOQ4QI9CBDZmoq+lFp9eMZQTrXePs38t6IqYQQKFILmCD7vo9fKAoUuYhEi2ifblzD1xMndvvy3rx+NemnnoBjXD1XTuUlX2x2Ffl3102Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZqT1AKor; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=j3PdwLcg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZqT1AKor";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="j3PdwLcg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4cfPg2734368;
	Thu, 25 Sep 2025 08:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BULm18GM8cdqnTda
	remh0keYSjxz7XBpwnKFaVBJtr0=; b=ZqT1AKorVta5MqmY9mresY4FM2kd2WKR
	x2gpq0qKAm3ZSNafjgSArTzEdq+1YgIFrgJ+drR2trXXxuubBsOY8CDbwM5nJuXd
	i/cjuuSOgMD94XN8dM0HVWVr8UnXuF1oIlBADcCaZ8tlXXXLAOPNc1+xQsOB23Kw
	bGnhW8IsfCceElxmSDT1ljyKGyqyrhThKOKGFX5/6F1uYVaHQGDnI1ED9Sb3BUyL
	I2jqLMhZr9Wf2lKQdbJ0MpUOmHjcWsJwpai1TlWC62FBhysC292FZDixj/ZYvQBv
	r2Sphs8nvhYtJJwpAS3A6A/bF6AmEOVowTo0n+A709uhXPYtHk21ow==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020115.outbound.protection.outlook.com [52.101.201.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmdses0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:33:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F95sw3Rg3/VTo5E5NnIlM5xfoZBAO6f40oY1DKwMrZAXaIEEf+6EYm0MYNvuU0Y5/mBiJ+IzpRjonic13n+x3XqvwjY6/xFLP1jPR7gmJt0i6IoIGAwRUA2H8xact7E4yP1DmupH5ChgpQykOpTKnsgtWlGm40BdsC68iJHK2PHto+MGhHdqjUVHnDFibUw1EbM0Hpzweaw/1XyihAo1TjnH4iEbyZbPazvV6c1aBkap1+CBwVvmRFWxHipWYC4azQm8MyCgFBv71zYGfX1IhNDaFVSuxYOwUTUWB6fDXeJ5g0xD3TKK/0ul15cH+23q0AcR4kL6a0F/LH1mPi749Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BULm18GM8cdqnTdaremh0keYSjxz7XBpwnKFaVBJtr0=;
 b=axPxO8exI6WFI9v2ujLjU6hfKmEIMlc6f6Ykz7lELbpCmy4Iz+G5yitPqywgGO49yJOFLz+aTkg+KdFaLNSvyyOIE//9NW0aNhVXXMN7qNgdSY5D4MG3hp6wPJLNfhGHjoXVOGhpGhPO6SC+QBcfB6EtetGZHOsVR+zN5UUC+0tfbX6OS40zZFuH+9MMQGWhENu6lon/DcbcFVZWAXMd5KAguTAb82VP/7VCAL+KzZ0uNp9UFBQrJiZH9fRRnx8XB8aA5r2jbw20diwGMzP0G6mYKrZnX/c4Kt+3c03GTYvQ68s6WBoNIeFZ69TsQrnFRcieiWp6Dim/yinmNZql1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BULm18GM8cdqnTdaremh0keYSjxz7XBpwnKFaVBJtr0=;
 b=j3PdwLcg96m0Pxt53tHqTw0LKcPBmC3tFDnRdficA8ISNIAaNCOmnRes9iDO9okuwXYb8/OQhmlGipSsJ5yXtzcR7Y9vHIWzUy1FlkAU+QGQ4LwvkhAeOs1a4RcC6Q+jhXGjEkn8kOysLJ4/L1HYg83as9Puuvi7Mly89mz6E0g=
Received: from SA1P222CA0117.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::23)
 by LV8PR19MB8252.namprd19.prod.outlook.com (2603:10b6:408:182::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 13:33:13 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:3c5:cafe::68) by SA1P222CA0117.outlook.office365.com
 (2603:10b6:806:3c5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 13:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 13:33:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C60C840654B;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9661F820249;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] Add SDCA class driver
Date: Thu, 25 Sep 2025 14:33:02 +0100
Message-ID: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|LV8PR19MB8252:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 41a51836-3b84-414a-d824-08ddfc38134b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MygzW3wxNScMJfSAF0rPDfHuoWqJs23dr4pge9F+dJfMplGVc88w/8Jt3kGf?=
 =?us-ascii?Q?H6jWguwM2Juj82WwpJd77KpCoUoC1JbT/LmhpjlQe9QXLzzTlvzNrju3QZp/?=
 =?us-ascii?Q?Pade24OTOwYXfAeJ5v7BB9950K0eDL3zZABSIFAe5dVXK0ebGx+qkNvmwK4l?=
 =?us-ascii?Q?evJm0bJ44CgcdZIwWM4ijuqBPkRQl3Pb6K5pwxUrZbvmb0GqobLmrBKYGfr7?=
 =?us-ascii?Q?1g3ax/Jd4YNSu7FrkN19cVmd7uAzePt1YWuEmSZ2Yf+iq4waJXtJAYM6f2+1?=
 =?us-ascii?Q?T6kpcytdACmlwnlM8i5HAJDhyJlqFQSOikDnNKOv8+bcGRBJaEJs5W7qQ7FM?=
 =?us-ascii?Q?ZEPH/sFEhXpY6nkfFcKkqvag1oqj00Snl+29hlXWCt6oEGXT+gmY9zsPgfdq?=
 =?us-ascii?Q?h0mSOWogdRqVEBvUx5LtuymrDfo2MfKh4agk0A187iBGpYJLIgCmRe07dQi2?=
 =?us-ascii?Q?FNSrQci3G5eEC+EZvpPvOj0JIRDKw1sK30zexHyUUvN3cGbdjIGfW7i8i6DK?=
 =?us-ascii?Q?zxJZYSvO8SaUpeajuyFrmrBYB5ngJaWgRaplje453Tg2rU03nfvXSyKc5JBS?=
 =?us-ascii?Q?55tRN9iwe3uql9HAHRMTMXpNy5PXEdZ8XPWysPIhP3eqijIhHmy9vxTVOqq8?=
 =?us-ascii?Q?aKIpJ1j/ZedYFnSsK0Jl+Dc91ke9k1XyixOS7sijgsUZ8aKjVPYuDlng9PqA?=
 =?us-ascii?Q?OVjXy1EYF7gR4ZFlGXi0ky+cP6LsWQiw1CT3wCxoSY+hvTmw4KRuG10FTM53?=
 =?us-ascii?Q?Ph6yqh7jK0mlKPBxgptKutCcvwOWvOGmwxRZgP7C/Ga0121WNUKZyRP8EqAu?=
 =?us-ascii?Q?lNf11ihPT/1//Lh+L4sxhKgdAKgzBfjQI+mB+1ZUaahK8B198wB1fFBLFPTt?=
 =?us-ascii?Q?cgRMshHnGF2MgLqVDpU/RNSpKALxB8awnW84cZSKbmCxQA/vd3ZBCd6v21wL?=
 =?us-ascii?Q?r4ULZsQMyIRHV9C71zU7OFNyhvOoPzjnIVECkJk6qtzRM5NMjZVfXly0zvWg?=
 =?us-ascii?Q?ODwTXoxA40Y4O+dJ+HUnenaTuoR158rO0wSMqT1tnNH4GRF3Cn0mL37S+DqH?=
 =?us-ascii?Q?QxZ6yS48JyQymsFZtpJkHsox0QXk8Hnd+pPdcrHg3EfNSxflYfiVQDZk6rFC?=
 =?us-ascii?Q?eR6yaM19VWFxwljwapWiX9b0qOOEka78TfxPxOml708mSFRDS7f2d6xSZYDq?=
 =?us-ascii?Q?dPFLx5M4HC4HGop419fZ9h0gd+aHIcFvnwml2PGZJGDY/h6K7wQDt0kCdN1D?=
 =?us-ascii?Q?1Fb2IMpDwrgRwVanBmxe9I9ZQwGw/wXMVsNP3Mt85A7naIIfsy8h2gCcfLGn?=
 =?us-ascii?Q?//5UsJOZ+TaMZ8quJjnmNJEsAXb7SSLJwVNn6+4QlRcpNGEEQqjqQSK2fo3H?=
 =?us-ascii?Q?KyQm/wpoy74JpM2wOrztvqZ07lx6fReGIyZAxlmRvflXCOAOiaMYnvSnFFFo?=
 =?us-ascii?Q?dk7HbjvLsX03lkq9ZK7B6GWmpqykBKsqT+Ga/tFo7FmmhjGNqLp6rw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:33:12.4248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a51836-3b84-414a-d824-08ddfc38134b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEyNiBTYWx0ZWRfX38Lo3tTu232p
 03Rui7UZM4UOygQnQVjQJAfNAi8UQ3n9KwVEJLQZ1L0MBJg4E42LcYcseqtcI6qF79jAh/hQB8E
 GKy6m9YlkKml0NmJS2SrZzArtniW1a/rlJ2eilUkM7nLQ6ATk48WmzfxfcigY3dLD8rYwrAAs/S
 2PIvUE5ubipUcdphkTe5M4/g+Dr9mK4h3jR5bj/T4k1ol3lCHCeVcizpcJYt6s+1AgspnjMSA0Q
 FrxamJKDlQdQYyaKJBWAtJ2kT9EgQ1hpphMyGHkqeUa3aZqGSN9yWKRqrCtIcXjdy03bCoqf0Qy
 sb0EWVhrdptBiEMCpNlSwAQdw+x101PXT8M73h6jxaxtb403JbuVvIqnOCeeuQ=
X-Proofpoint-GUID: 9CSbUtVAXFYYteouFxNbuSN5NUf49fT9
X-Proofpoint-ORIG-GUID: 9CSbUtVAXFYYteouFxNbuSN5NUf49fT9
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d5449c cx=c_pps
 a=i9AYdY+muJfbJY5DtBkDBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=FxB-H199XxuCVj66QS8A:9
X-Proofpoint-Spam-Reason: safe

This series adds an initial SDCA class driver, this consists of a
primary driver attached to the SoundWire device, and auxiliary drivers
representing each of the functions of the SDCA device. These drivers all
use the APIs added over the past series's to provide the class
functionality, as such these final drivers themselves are quite thin.

Note this series depends on the UMP/FDL series that is still in review,
but it has been sent a little early to get a head start on reviews.

https://lore.kernel.org/linux-sound/20250925105341.194178-1-ckeepax@opensource.cirrus.com/T/#t

Thanks,
Charles

Charles Keepax (3):
  ASoC: SDCA: Add helper to write initialization writes
  ASoC: SDCA: Add basic SDCA class driver
  ASoC: SDCA: Add basic SDCA function driver

Pierre-Louis Bossart (1):
  ASoC: SDCA: add function devices

 include/linux/soundwire/sdw_registers.h |   2 +
 include/sound/sdca.h                    |  13 +
 include/sound/sdca_regmap.h             |   2 +
 sound/soc/sdca/Kconfig                  |  18 +
 sound/soc/sdca/Makefile                 |  10 +-
 sound/soc/sdca/sdca_class.c             | 304 ++++++++++++++++
 sound/soc/sdca/sdca_class.h             |  37 ++
 sound/soc/sdca/sdca_class_function.c    | 459 ++++++++++++++++++++++++
 sound/soc/sdca/sdca_function_device.c   | 117 ++++++
 sound/soc/sdca/sdca_function_device.h   |  15 +
 sound/soc/sdca/sdca_regmap.c            |  16 +
 11 files changed, 991 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_class.c
 create mode 100644 sound/soc/sdca/sdca_class.h
 create mode 100644 sound/soc/sdca/sdca_class_function.c
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

-- 
2.47.3

