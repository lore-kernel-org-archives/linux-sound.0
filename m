Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD9326D69
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057755; cv=fail; b=nLhPC4lEukr3JznOTpsg00j3spzGEP/uFPcC68MwEr6sygkO7NLSPbg3x+pyjt/4VA3PpASgptVBkyPbE1DXxvSLSurowEqFhNf/5jeEWzqQ9jKIBSrnc1ucdeEZCSraECznFOGvGwxJ65v4I77kWhBKuQwAmiu3tV0TYq2oAjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057755; c=relaxed/simple;
	bh=Tp7ujW9LaKT/EPD5b9pKMUj1p2k4B/+66qffoUYTjAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/ScyYx7j6kxBgjUbHxIL4WB5pTZu1yGf0lYKKtR1QTKRAOpnCA+RvPutoDdUPALISgYfiJXAZ+u0kX0pecFhasml1o2AXmgqQIwLEJCnBSQAkzWd7NpUrsshMEeaol0OLsBgKO94yefSYeJbn5/Q51lPN3zSbFQS6CTY+bphGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hXO8Cur8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QmZroAZI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hXO8Cur8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QmZroAZI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI5oTX41379398;
	Thu, 18 Dec 2025 05:35:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vB+j1cw8aArkVPDbsT51ks5a4TCN/iqYsrGNLH0IuD0=; b=
	hXO8Cur83dUkJWCaoCi2wyFTYHll/Yi0lp1V/AUWhLoyH2bmh8d285V0geE98ifT
	qsrK0jkWBWK3wVLIbAXb/XlXBDVaxTyYVgPcThWsK2el2a+dGNXHIE4pC7vOS3hk
	MFx8OQiqNPynXjD92NEN9RgSBJ+gGNud2kl+hdm4WXb47ZhBzTmJF0ri4T4W4L9r
	2hJCoQnQ2Q5CtTdMQt2c7weE7f6mVGuPhSzljRTSNTHkbHq4ZiDS96GoVGgBEY7Z
	zED4/aEuENFN6/oKbJceTpqUlda2cdQZSJ4+LicEJHwog8wjynbMe9BFYge+4fed
	mfgFgRAEbFVmor1O6PnkKA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022076.outbound.protection.outlook.com [40.107.209.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15eje0hh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:35:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BStukZVB7FIexyN1ZadPFdLV8rBA8dlBn8wb0K3U/mSUvf3D6mLleJ3gMOaJdbV+LAp2yXx5nfRqwVBpRkng/uCN4krh6tOuc1inrZBimQYGOonTLUCvyqQerSuWUsp9+AsejxIwvsAltNloViHsl2dZEaEZSbi6zxLzFtc6JvJc2OB0zwlON8qxNWWjl2AdipdOX5KfhLBl0bsOt5OjLxZV1VZGG9R3PN3SxnM7tNwMPuDukJDWcBQcAow9TKOAfhpsMiN6H9s0DyWU9tMCefOeEYHll4mnrBeUo9oeVp6abhE9oor+Gjy6MyA1/BYOw1KyLu+afeJI/POcystdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vB+j1cw8aArkVPDbsT51ks5a4TCN/iqYsrGNLH0IuD0=;
 b=IPexwGLJrFY2X2ZfDZkspBTlzZr12VI+6q/NPR2BFUvBf3BN1qTKo79bAF2eBHWFJCCwnJ+Z7PYznHT6InlwYcaBgQnHCSdeKExCT8ypIwRfRdgToUdPi/hM+e6ywGFaUKT9Hgpw0cbU5napVAJuUUOJqVIOQAIc8xknNIbHdCUHkXJTSLsG+aJYrcDxQ+iMSixZg4oBBj2ZhQPyRPwJUHyhszYqdfJbYRKsNhvGUl3YPNTdNhqkD6DgGiTdxWJAy5wtR52KhHNct1ViyjEPkcYhJU4nSZQr4nHqXeyZ3Zrs3eerYqJnTryczgT1Cw6QVpeKyuSEL7VbrketBLbmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB+j1cw8aArkVPDbsT51ks5a4TCN/iqYsrGNLH0IuD0=;
 b=QmZroAZItnSn/qbrqu0sokJMi3LUhGLdZ3FlxqNwA1+1e33E5jk58c2Z6HlCHzb9mLA53uUDB7sW1CwNS+uZyuGMPWIZt8jR8qwUeeXBmrIj7xOKnM1bQgaz5d4dUO8yD82I46mERVSmYSlOFRr28ErVFcGFap3dh22TqUNlLzc=
Received: from BN9PR03CA0335.namprd03.prod.outlook.com (2603:10b6:408:f6::10)
 by CH0PR19MB7934.namprd19.prod.outlook.com (2603:10b6:610:181::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:35:26 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::d8) by BN9PR03CA0335.outlook.office365.com
 (2603:10b6:408:f6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 11:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Thu, 18 Dec 2025 11:35:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3407440654E;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1A906820259;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/4] ASoC: SDCA: Add basic system suspend support
Date: Thu, 18 Dec 2025 11:35:18 +0000
Message-ID: <20251218113520.1287693-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CH0PR19MB7934:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bfeb84ce-8951-4ee4-a113-08de3e2989b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NF28mLz5a/UmTWFKCUk5fQ91uscDXYODMsMkn9+KRYhbWi+ZIR6bUsusixpE?=
 =?us-ascii?Q?zeFKZp+pQ+lVj0Jsv/kdUkkEe4MoXsE0PZo6Z3GPLHu6rvs7QKBjU+ao4Kq/?=
 =?us-ascii?Q?pOrMOoAiXqKN4HS55lDoEoy0sLqVL8KxhpG7/I9XjDOb3w4O2HiayWmzN63H?=
 =?us-ascii?Q?ePYP767GtaUJMcve9vV0NhXhNdKvQbq7B9DhZIY/szfliL/v2YYfh9LrlfV8?=
 =?us-ascii?Q?bZs4dTCFljcWul9UW8gwbDNdeUoAKuKQcHw7rajhctNgUBKKq45z2xYLpdMx?=
 =?us-ascii?Q?tqjE7vgnH4uSOeO9UKo5pYRCpONuarXDL6/6X7VzBqK0S556Gt8OrAQbg8I0?=
 =?us-ascii?Q?OzkR6z6f3vU45LSQ8deQrIjglaaFf0C1MjP2Jqt/zw7DNvwx5kxMa4CBz9R9?=
 =?us-ascii?Q?pI4oTAQwDHMVAsXlu/ol+OKaEuvUVBWDkHen/p+V9ylUD4T3ac8EcLUPgKyx?=
 =?us-ascii?Q?kkR7NK1x2NgbFVJLD0v9hX2cRT737SCaHu/TCoIEzVfhgY10Vsq0eIyTmzFD?=
 =?us-ascii?Q?WQOVz1fq9v13cYyDUb6tEfQCT4msonGRan1OJLZHCBy1O0bmwqH5Yu2Iq/+k?=
 =?us-ascii?Q?J3rYKwzcQvGmCepm8+K6APyBM4hntc214NszlKuvwZ+4bFLuOhTuov2XWc7R?=
 =?us-ascii?Q?NSUtVnbNIfM63PN1YX2gyol4TSDw9KNgHGK64HLpTn0MRfwFbR34J0Dg4p1c?=
 =?us-ascii?Q?5SeP9N5CLuYWvUE6+cwGTVGorkYf7/OfT+L2TcW/lT3p0Fcr4w++yzfW0wJN?=
 =?us-ascii?Q?axA+jhe7pSK63bzGmRszeLOT2hiNuszJkaDFl6ctlXs8wpWSQ6/1n6xUNZvQ?=
 =?us-ascii?Q?o8hk++GNCTwV71jnRH7en4aOgt/jLwtVV0W3MizZP30bnCSG+8J+ChAKVQHV?=
 =?us-ascii?Q?UflSqngC2E4KlD4jPHvmBvaSR5QjOVaG/lRwAHorZc8vfdS3tC5vA5wQvqjY?=
 =?us-ascii?Q?t7e7eVXIY+u6hSjLn+m3RkEPDAQZfJxD3r/GZ28WcLpVHJKnEi41l+has2Qa?=
 =?us-ascii?Q?RL3cD2VGQzRghJpDrEbg18Y7xs666vh3FnLmVp9+uASfV+V8gN1R0+4j9bYE?=
 =?us-ascii?Q?JTaAizTeZjzGAFBZovSyE7cuw4b+akAV+LUxyOonFngVwKlP6qP/raa/bz8S?=
 =?us-ascii?Q?Nc0W9BUWSVjojZyhWyzg00ev2L6I9g/LZULlKPrAvUmzvou6INsrxrQbpdUJ?=
 =?us-ascii?Q?YEb0JoGzmyiLQvsh/lYES2YJ3wlKO3+K7HaEpQE0tx9WGQsAasU25TrXhKuo?=
 =?us-ascii?Q?/zTIQYHa+2EqDZ5mqxMg2B83NpjrkZLg8hyJA59rc4HOrVoIBkYuOY7s2+nm?=
 =?us-ascii?Q?88fcm8jErpVm4zUIKlZ23qJ2CtEmsTL6B3UR8T79nQWowlSbhQm/jpqT9ROR?=
 =?us-ascii?Q?3rtfADSk7FobOXXfBMMyQicElKoNJn8rF4hBHtOiksPn8Yfc9HGAUhcRBclZ?=
 =?us-ascii?Q?RjYEf5fHj0gcFAOdD5eX0t7SfGFvPfZIh1nJKm13m6z49vswdF7jSsAEoMF0?=
 =?us-ascii?Q?6QjzV9P7WhRczm5dkOD9LBbeshPW5ZJnCSXdgraZIa/k4ltROXG+qrdW9r/T?=
 =?us-ascii?Q?g3IFg/HoqO0vRsXJGwo=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:35:25.5696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeb84ce-8951-4ee4-a113-08de3e2989b1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7934
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=6943e705 cx=c_pps
 a=iqhpHS1GVmy1vcQnvunGbg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2qmRqszdQiGn4CUastMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfXxJqlJEJXkC/I
 /1mqcm/UV5xzRBrVlO5fSqYc1j030imdm8LxBGMWv4093CdO8y/wSe5eQLllO86S5goirp/f13P
 sY2R7VYtl0+t4vGdvl+sI+CgMoO02l03Bdnwmw1vPw2sRkYzY/wKQ/td9TcLwez5Sdbk+gKxqeU
 9nHWCDaJE+zSm6hNLeJ0Uly/CC+EYLMN5BQu7mtUnsUvsG4sRRaiBzmahS3dF5WqRyPG7PgOWC8
 AzdJgGuW6FnvmzF+7H77tJehwRUm+4dv7Wn11Bfm+JMAEvszv5JNYJv98L6yYUAWBMFKZGONbbF
 uCPdvbEOXk70BUKWggVZhoLFww9ZYKawCU2yG/daIa+mgyMrudasYM8G6irBAzl8+F9j4+Qh7hQ
 RO5VSbDB6aCzl9vgvfexVnA8mtF6XQ==
X-Proofpoint-ORIG-GUID: UFegutDJw-GH0nhqQTrQmKWM10HH8TL8
X-Proofpoint-GUID: UFegutDJw-GH0nhqQTrQmKWM10HH8TL8
X-Proofpoint-Spam-Reason: safe

Add basic system suspend support. Disable the IRQs and force runtime
suspend, during system suspend, because the device will likely fully
power down during suspend.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Use new enable/disable API

 sound/soc/sdca/sdca_class.c          | 33 ++++++++++++++++++++++
 sound/soc/sdca/sdca_class_function.c | 41 ++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 349d32933ba85..438695291257e 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -238,6 +238,38 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	return 0;
 }
 
+static int class_suspend(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	disable_irq(drv->sdw->irq);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force suspend: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_resume(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force resume: %d\n", ret);
+		return ret;
+	}
+
+	enable_irq(drv->sdw->irq);
+
+	return 0;
+}
+
 static int class_runtime_suspend(struct device *dev)
 {
 	struct sdca_class_drv *drv = dev_get_drvdata(dev);
@@ -278,6 +310,7 @@ static int class_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
 	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
 };
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 0028482a1e752..8f4772a5ca4e5 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -32,6 +32,7 @@ struct class_function_drv {
 	struct sdca_class_drv *core;
 
 	struct sdca_function_data *function;
+	bool suspended;
 };
 
 static void class_function_regmap_lock(void *data)
@@ -404,6 +405,13 @@ static int class_function_runtime_resume(struct device *dev)
 	regcache_mark_dirty(drv->regmap);
 	regcache_cache_only(drv->regmap, false);
 
+	if (drv->suspended) {
+		sdca_irq_enable_early(drv->function, drv->core->irq_info);
+		sdca_irq_enable(drv->function, drv->core->irq_info);
+
+		drv->suspended = false;
+	}
+
 	ret = regcache_sync(drv->regmap);
 	if (ret) {
 		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
@@ -418,7 +426,40 @@ static int class_function_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int class_function_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	drv->suspended = true;
+
+	sdca_irq_disable(drv->function, drv->core->irq_info);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force suspend: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_function_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force resume: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct dev_pm_ops class_function_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_function_suspend, class_function_resume)
 	RUNTIME_PM_OPS(class_function_runtime_suspend,
 		       class_function_runtime_resume, NULL)
 };
-- 
2.47.3

