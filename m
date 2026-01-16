Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5D33A9DE;
	Fri, 16 Jan 2026 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576905; cv=fail; b=u8ttYNIWVnxHUvnHCtK4/ND/G0fAYLFDTg4y3OQATu08E4DZrWP/IZ5e/ZSenraHEB5znHuTRuxb3KeTovub3ZrU6QFx3iN8+7sSQuhjzMNGzOJF861YB/Tnshc5t7dic6QQtTbVRGaT3MzwU/SP3rZ486P2ewuTw1MzVlB29iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576905; c=relaxed/simple;
	bh=RL9esGlOTXcZCbtwZH2vUKU5Ktqz9aCQ35Isfjo+8t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+S1biYpwxhMRqHxlpoaGz60AVPpmEvcwuVYZ4sV05j/COF3gMd/KNGtJF8zXAP7ocxh2l8BL7sFv4dhg6/nNtAiNlRff5udp9gxBKjmhEogqndHUz0d17HwdVtBPwkYVphQsNTE1Xylu0VTTOnkTj5CO66xOj9GMMuR6VRz2FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=huPJvWb7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vSJ7uFuI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="huPJvWb7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vSJ7uFuI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GE2Hb2753767;
	Fri, 16 Jan 2026 09:21:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dtNfsHqR/IsS0ek/ByRcev7um1s7+aULygDKcNNzt3s=; b=
	huPJvWb7Zh5/7MUn55xtFDKwSVw+mfXwVSnAH6aRp2F/IT325edUbIZn57rDtn4D
	mPLAa87xzzbRHx9Wj+2XwIZYOeibUxBZBROI0qIf+foXJtB9dGjlig78k8BCJg4e
	az/5NZN00ni/o96BoWG9CjsYktTWDS/Inbgm1WkoxBTiO2h+DwgqZXe8EZ5U8Yt3
	YnSPLVLl+YU37L21P6eBpY9GA1JyvzXwh61kCsEtLFWTu5ho7JPd0g3KhZ6+K2Y0
	ZVNGtdCZkByVSLPAP5x6hQ956vRzZWanwqv/7xCObNXMBmnqKveIx97L53DYIc4H
	PxWOe7Q9R+L5Hx01V4r/2g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021082.outbound.protection.outlook.com [40.107.208.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bqpr3g3ty-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:21:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYjERIeCl5N61SGgO2CtnZyGsjvteJohE7dhjZn3102BCjGc9Gi9BGnaMvzqV8eWmbTr4wmVol8QoSxI1jnr30VCpBnNFoHmnA78MQqURgiywhay8QiQXelCMq0iYTZ6x1bs1zrcVcst9mlVXFoacZG1bdMAbYMuQb4Z6nkb1JzIj/eP5v6zS9WD4LZM1pVtd2Jm9cGtt+YnMjxM88MNXB+so+CVWjaM2ueANx1hhTacIVUOnQJ6SKBg1XWkaqiCo/YpjsTHYxSmUE2PowyT/6jkf4tsrT3WvImqSiVF8pvGqszhabUnNUnsME9N9xZlw1f2bWsxDQ+E7AuiLvI1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtNfsHqR/IsS0ek/ByRcev7um1s7+aULygDKcNNzt3s=;
 b=SJv4enDUSRQ+BHjJdceth/T/3TF245krfHe9+OcHbn08LQ6uyBUYWxoCYS6LYEbVqCSBuoEIfilSnhu+RWNiWiVOcxTB2L/85Er44dNfnmkUwkzbXTYYSSX8m2vyJ1zUysR8d83oIdIbaaXYagviSd6U0c3Q2gKK/ghGcQgFNu2a/Gfp8aUVemihFcsx5SyGRcSTdjz/cYin6foBXZL3WOdwKyBx2CM4QHJ1BogXzLkAGzsDuGkflYVo/L3xCFiZqpolUPpeyHrNHJOrnTnQ/sYaOcOpAvimsw+rb9FdjS9S362himcydhM19qzpLTnBbPok/AHPLs7V7svS7X/IIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtNfsHqR/IsS0ek/ByRcev7um1s7+aULygDKcNNzt3s=;
 b=vSJ7uFuIol0PqeLp8LkIs/Ljk55s5JmU8HaTEx94c+5d8s1oybkj0/w5hLyZ98rIYCc0C4pZUIK733aQTuZXKoUBoRy6nQ0ONJnNTohV+wf2H2WFOoRpE/wm0NhPuLJQrtkzsb+6GzgC+2w+vZDgzrXLjg8Ub7H9SQoo2aXSRoQ=
Received: from SA9PR13CA0012.namprd13.prod.outlook.com (2603:10b6:806:21::17)
 by LV5PR19MB9059.namprd19.prod.outlook.com (2603:10b6:408:302::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 15:21:06 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:21:cafe::82) by SA9PR13CA0012.outlook.office365.com
 (2603:10b6:806:21::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 15:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Fri, 16 Jan 2026 15:21:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 56AB240655D;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 39E5082255D;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2 3/4] mfd: cs42l43: Add support for the B variant
Date: Fri, 16 Jan 2026 15:20:42 +0000
Message-ID: <20260116152054.85990-4-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
References: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|LV5PR19MB9059:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f8ebca55-b528-4560-1b32-08de5512ddba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IdQpM9too2p9i5b2KT9mKf86KeviZ5snnvmf9zbMRrv/YN/m2IeqlK8ld4ZF?=
 =?us-ascii?Q?91BvBNpW0Q4K9BP3udGVmut6XiUUh4LzUpg1OqJRrbW/CyzhjjRNcVZNY5mE?=
 =?us-ascii?Q?BudZkXopZv8HaB0mTncKP1rz6ZhXeSTm6x3Va4AF/rJOrm45vT7GOHIj49+k?=
 =?us-ascii?Q?D6SuI5FtYrPBv/3dR8u1K18bOFKrz3OE24raZyDivDP0pZaEnCQu98UIzHVS?=
 =?us-ascii?Q?qh6dcb7QarA3njbUGP9g6ArFuHhrisCItFPIJ/UtpMTmozjURDFisTObuVKO?=
 =?us-ascii?Q?Xtx+fDieKQSIuCgicV4Bg+AuX/OTLOrAf/J7KxIr+UcKwz4PosE/MCoibmxc?=
 =?us-ascii?Q?Tvt5wNWLlq7qfn/fWCaCAs4ib53IBUcrczPoHCY2HyKKjOBB/jUxzJA0Z3LK?=
 =?us-ascii?Q?59uKY4NP9x4V7bDEHqTo2+Jiilt+XfrOVPQImLy+k57N9k0x7bJsuoKULcKv?=
 =?us-ascii?Q?G6dDB0xAeKU+NSmDMSCR2EyVq0U9NRnbiB7xK13yLUwTGb8exhWpMgkPYyW0?=
 =?us-ascii?Q?/UUt9cSH6500HvKrhk7YYaDEDvN+XWa31ipIjaOuMDNdVSdOlist6+fvqOkK?=
 =?us-ascii?Q?zDHEZrJyIQAOlrbZ6ax6wDnE5B7Hb0qRVIlM2ZqyojPozzZvu1gtLmkgxZSo?=
 =?us-ascii?Q?l1bhDshQIYONP8iOI43dgOCkHh2RTGRb+sAtR/ikivhA4fUQcDPrVkH7iFLu?=
 =?us-ascii?Q?etFHEzDXHa9P0FE+6w2d/VE/hhkfj6ppNQLLzPEvYeR29Eg7Ac12h/4Nyiem?=
 =?us-ascii?Q?FpljdFEw9egDGObAygZl7LzINOPmBbVlxriDdulwz2ngeteEuptnEEe3Py/k?=
 =?us-ascii?Q?7Zekc3Q7OVtSSqQEJ6Gv9MPcOXcMH/i/pOiTVaBoebrd/LsPz7ZYIor1xbkz?=
 =?us-ascii?Q?gyoA82t0F1wQdBCpWxUMU15VVaDM1VnOTBA2wlY+oSVP3ghCnTwxS5LAwSbn?=
 =?us-ascii?Q?L9srNW8ahvPaEW+CZ9SEcU94xY3gQ2E9es1cumcw7qSxytYAbqd1vC76eHQB?=
 =?us-ascii?Q?y3l/9Z9uBRUAkxuVXFM3dYNyLLX6sL4BKxufBUZCuNKTnvSe2PEiPK0ljrQm?=
 =?us-ascii?Q?LyfxHrlgCGFPSxW4QHsaZlGO0r7hWxjWydiKKdTj2368B+sbpKQahXJmRIS6?=
 =?us-ascii?Q?glx4gNEgPD6x9AnKEjjTfEzWdImSTpD4N607dcc4w/Xaysy3yttgUbyhrwpI?=
 =?us-ascii?Q?rrWPAG1SehsMWX9c291nUbI1V93EWkxqbCrcfSTtHgHwaxp3p2MHYXCKaxZg?=
 =?us-ascii?Q?GgRSkcTypbweEUHpFwFQnfIhwDZa1Qh4CKEg12JrjTMBgRjLhoU65XwPd7qG?=
 =?us-ascii?Q?YaJfgAAuy6iTRhX8+lL3kjk6HzIwDcXWA2p+0Sg8xjg6YX8hxAN5RAPECv9N?=
 =?us-ascii?Q?M5N14ZZef8C3zguGv+TyoQqfXvNzW5COZrWlUA5Mpl33+mMfR2fcppJurhgV?=
 =?us-ascii?Q?NyEdRhvpGfAVJroNUk5LZ+Qo96fdvGjhCVYwU4W4gFKEoowXhvuByr20phUH?=
 =?us-ascii?Q?jFafUTWdHS+8kZeUxjrPIH+6piQdLCF4Cx13wpVu0Zxnh4PaOpN7OkjEsIC/?=
 =?us-ascii?Q?McyDE3iAz7bsXTztH7jJBJNeh1CBtLtC7uu4cLfBr9VBnJo8LU7F75Mj95ih?=
 =?us-ascii?Q?VtQimWTx+NS3jo7ytmHVCVUTJLPSv88+iYCduhMoPSfXsnfjs6soJf8yT8Bp?=
 =?us-ascii?Q?Dzpn3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:21:04.8069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ebca55-b528-4560-1b32-08de5512ddba
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9059
X-Authority-Analysis: v=2.4 cv=PZ7yRyhd c=1 sm=1 tr=0 ts=696a5768 cx=c_pps
 a=Wfyg2MIdxp6jvjeZNnPfXA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=XPwATKmoEvXA9jVZorMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOSBTYWx0ZWRfX/Guoq9Y5dlBu
 6TEypJS50MiM9blHCdpQlIVF5OrF6920xUDNs77ggcSY+WDjqMMXlRRRYud3iiV+ExcLA/Un3lu
 4WZC+TP2RAfuzrhZF+Nu7aLE69Gwj4kBL3qOGZN0NXiwXAIU2D8TUcsORq2W2o4cGjh8r5jQ/3u
 bT1QkZD3XeK3T7ci8s0xnB/NjxI9EmyJ4iUb2LTmhKcjiAbzMMo0ZFrCYcHvHwWiKsG3NT6XHGJ
 FrIstdlqs6PgxIinFsBRAg2LUZvxhR248GF/5EwncBzCAsQ0u+2UYZKkkOIN0k/nzIGfQa32LLu
 M2WIlLYRK+iR4jds23UyW+5LbWyWwZZL4uAtl9oCrxAls5O1i2YEN2Aat7Mf9n8FK9O2qJ9JJt/
 szBa3AisyqvRV2XF+6IjPmc3jNTQKwR4At3L9V91B2Fwq214XWJb5Q3HscBrAVHo7E70sdvpPgL
 Ry2KFOHAF7XB5gw5qGQ==
X-Proofpoint-ORIG-GUID: J2O2rDWmdNRhg05FmPy6Qh7fXYYJ0i11
X-Proofpoint-GUID: J2O2rDWmdNRhg05FmPy6Qh7fXYYJ0i11
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
---
 drivers/mfd/cs42l43-i2c.c        |  7 ++-
 drivers/mfd/cs42l43-sdw.c        |  4 +-
 drivers/mfd/cs42l43.c            | 93 +++++++++++++++++++++++++++-----
 drivers/mfd/cs42l43.h            |  2 +-
 include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++
 include/linux/mfd/cs42l43.h      |  1 +
 6 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index a2ab001a600a..0a0ab5e549a5 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -47,6 +47,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	cs42l43->irq = i2c->irq;
 	/* A device on an I2C is always attached by definition. */
 	cs42l43->attached = true;
+	cs42l43->variant_id = (long)device_get_match_data(cs42l43->dev);

 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -58,7 +59,8 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)

 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id cs42l43_of_match[] = {
-	{ .compatible = "cirrus,cs42l43", },
+	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
+	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
@@ -66,7 +68,8 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);

 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", 0 },
+	{ "CSC4243", CS42L43_DEVID_VAL },
+	{ "CSC2A3B", CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 023f7e1a30f8..4b11cf5de614 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -178,6 +178,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *

 	cs42l43->dev = dev;
 	cs42l43->sdw = sdw;
+	cs42l43->variant_id = (int)id->driver_data;

 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -188,7 +189,8 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 }

 static const struct sdw_device_id cs42l43_sdw_id[] = {
-	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *) CS42L43_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *) CS42L43B_DEVID_VAL),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec..6b6b2bbe7e8f 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -115,9 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
 	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
 	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
 	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
 	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
@@ -155,8 +160,12 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
 	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
@@ -169,10 +178,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -269,6 +282,8 @@ EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");

 bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 {
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CS42L43_DEVID:
 	case CS42L43_REVID:
@@ -292,7 +307,6 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
 	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
 	case CS42L43_DMIC_PDM_CTRL:
-	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
 	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
 	case CS42L43_AMP1_2_VOL_RAMP:
 	case CS42L43_ASP_CTRL:
@@ -387,8 +401,16 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_BOOT_CONTROL:
 	case CS42L43_BLOCK_EN:
 	case CS42L43_SHUTTER_CONTROL:
-	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
-		return true;
+	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
+		return true; // registers present on all variants
+	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
+	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
+	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
+		return cs42l43->variant_id == CS42L43_DEVID_VAL; // regs only in CS42L43 variant
+	case CS42L43B_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43B_DECIM_HPF_WNF_CTRL6:
+	case CS42L43B_SWIRE_DP3_CH3_INPUT ... CS42L43B_SWIRE_DP4_CH4_INPUT:
+	case CS42L43B_ISRC1DEC3_INPUT1 ... CS42L43B_ISRC2DEC4_INPUT1:
+		return cs42l43->variant_id == CS42L43B_DEVID_VAL; // regs only in CS42L43B variant
 	default:
 		return false;
 	}
@@ -597,15 +619,27 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
 {
 	unsigned int need_reg = CS42L43_NEED_CONFIGS;
+	unsigned int boot_reg;
 	unsigned int val;
 	int ret;

-	if (shadow)
-		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		if (shadow)
+			need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+		boot_reg = CS42L43_BOOT_STATUS;
+		break;
+	case CS42L43B_DEVID_VAL:
+		need_reg = CS42L43B_NEED_CONFIGS;
+		boot_reg = CS42L43B_BOOT_STATUS;
+		break;
+	default:
+		return -EINVAL;
+	}

 	regmap_write(cs42l43->regmap, need_reg, 0);

-	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
+	ret = regmap_read_poll_timeout(cs42l43->regmap, boot_reg,
 				       val, (val == CS42L43_MCU_BOOT_STAGE3),
 				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
@@ -644,13 +678,25 @@ static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
  */
 static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
 {
-	unsigned int val;
+	unsigned int val, cfg_reg, ctrl_reg;
 	int ret;

-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG,
-		     CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION,
-		     CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		cfg_reg = CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	case CS42L43B_DEVID_VAL:
+		cfg_reg = CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(cs42l43->regmap, cfg_reg, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
+	regmap_write(cs42l43->regmap, ctrl_reg, CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);

@@ -740,18 +786,32 @@ static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
 {
 	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
 	bool patched, shadow;
+	int boot_status_reg, mcu_sw_rev_reg;
 	int ret;

+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		boot_status_reg = CS42L43_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43_MCU_SW_REV;
+		break;
+	case CS42L43B_DEVID_VAL:
+		boot_status_reg = CS42L43B_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43B_MCU_SW_REV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	/* Clear any stale software interrupt bits. */
 	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);

-	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
+	ret = regmap_read(cs42l43->regmap, boot_status_reg, &boot_status);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
 		return ret;
 	}

-	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
+	ret = regmap_read(cs42l43->regmap, mcu_sw_rev_reg, &mcu_rev);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
 		return ret;
@@ -918,6 +978,13 @@ static void cs42l43_boot_work(struct work_struct *work)

 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+	case CS42L43B_DEVID_VAL:
+		if (devid != cs42l43->variant_id) {
+			dev_err(cs42l43->dev,
+				"Device ID (0x%06x) does not match variant ID (0x%06x)\n",
+				devid, cs42l43->variant_id);
+			goto err;
+		}
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index f3da783930f5..a0068f6572e2 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -9,7 +9,7 @@
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H

-#define CS42L43_N_DEFAULTS 176
+#define CS42L43_N_DEFAULTS 189

 struct dev_pm_ops;
 struct device;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index c39a49269cb7..68831f113589 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1181,4 +1181,80 @@
 /* CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG */
 #define CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL		0xF05AA50F

+/* CS42L43B VARIANT REGISTERS */
+#define CS42L43B_DEVID_VAL					0x0042A43B
+
+#define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
+#define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
+
+#define CS42L43B_DECIM_VOL_CTRL_CH5_CH6				0x00008290
+#define CS42L43B_DECIM_VOL_CTRL_UPDATE				0x0000829C
+
+#define CS42L43B_DECIM_HPF_WNF_CTRL5				0x000082A0
+#define CS42L43B_DECIM_HPF_WNF_CTRL6				0x000082A4
+
+#define CS42L43B_SWIRE_DP3_CH3_INPUT				0x0000C320
+#define CS42L43B_SWIRE_DP3_CH4_INPUT				0x0000C330
+#define CS42L43B_SWIRE_DP4_CH3_INPUT				0x0000C340
+#define CS42L43B_SWIRE_DP4_CH4_INPUT				0x0000C350
+
+#define CS42L43B_ISRC1DEC3_INPUT1				0x0000C780
+#define CS42L43B_ISRC1DEC4_INPUT1				0x0000C790
+#define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
+#define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_SW_REV					0x00117314
+#define CS42L43B_PATCH_START_ADDR				0x00117318
+#define CS42L43B_CONFIG_SELECTION				0x0011731C
+#define CS42L43B_NEED_CONFIGS					0x00117320
+#define CS42L43B_BOOT_STATUS					0x00117330
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_RAM_MAX					0x00117FFF
+
+/* CS42L43B_DECIM_DECIM_VOL_CTRL_CH5_CH6 */
+#define CS42L43B_DECIM6_MUTE_MASK				0x80000000
+#define CS42L43B_DECIM6_MUTE_SHIFT				31
+#define CS42L43B_DECIM6_VOL_MASK				0x3FC00000
+#define CS42L43B_DECIM6_VOL_SHIFT				22
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK		0x00380000
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT		19
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_MASK		0x00070000
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT		16
+#define CS42L43B_DECIM5_MUTE_MASK				0x00008000
+#define CS42L43B_DECIM5_MUTE_SHIFT				15
+#define CS42L43B_DECIM5_VOL_MASK				0x00003FC0
+#define CS42L43B_DECIM5_VOL_SHIFT				6
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK		0x00000038
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT		3
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_MASK		0x00000007
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT		0
+
+/* CS42L43B_DECIM_VOL_CTRL_UPDATE */
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_MASK			0x00000800
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_SHIFT			11
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_MASK			0x00000100
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_SHIFT			8
+#define CS42L43B_DECIM4_VOL_UPDATE_MASK				0x00000020
+#define CS42L43B_DECIM4_VOL_UPDATE_SHIFT			5
+
+/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
+#define CS42L43B_ISRC_DEC4_EN_MASK				0x00000008
+#define CS42L43B_ISRC_DEC4_EN_SHIFT				3
+#define CS42L43B_ISRC_DEC4_EN_WIDTH				1
+#define CS42L43B_ISRC_DEC3_EN_MASK				0x00000004
+#define CS42L43B_ISRC_DEC3_EN_SHIFT				2
+#define CS42L43B_ISRC_DEC3_EN_WIDTH				1
+
 #endif /* CS42L43_CORE_REGS_H */
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 2239d8585e78..8313f9e8c722 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -98,6 +98,7 @@ struct cs42l43 {
 	bool sdw_pll_active;
 	bool attached;
 	bool hw_lock;
+	int variant_id;
 };

 #endif /* CS42L43_CORE_EXT_H */
--
2.48.1

