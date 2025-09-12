Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE9433A0
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673325; cv=fail; b=TdWomfrgInW+EUqqx+NAES/Rj61N9w45dfQ7f47l18ZGZkpcgh4pP5gu59YSurgO0vI5DsguCjEuZJDbWaOAwzbAWhPNlOiOhdewNb8AfzXbbLtQd8IGQzFYUeJYyGjUbzpnk+3ttDZrpywGw/UAehwy6J0OtL/zVJRKbhHFQ/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673325; c=relaxed/simple;
	bh=iUrFfdajO9WdVzCIyYFx4y083HCq6BuMACC+MzG6QWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmgf11KCWrAyAw3YkkwaUbAro5hw7hr3V4xZstjoIkIwITS8A/Ci8Js9VvLwDxeoyOcxrjghNu0hq3UCQL4/kL8uYU/S5di9UECq0MhEi5/XLKy7XCURY+DUIG8+wRJhIJFrUfmtOQKXGdrvQnqMwzpquRK+kgk94DdN6yWiCAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lGkrlry8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oEYQaWcH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lGkrlry8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oEYQaWcH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C4oDt91137784;
	Fri, 12 Sep 2025 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Mn70Puz0hLPHjkadJy8gwZ8NWWD1ai+2PWTqu7n+1ag=; b=
	lGkrlry88hYbzI0repfMh/JjO7ymhgePHbu4gk+YDlkZm4vMyMJNj1bD+tnOvynd
	6WYHeq0fxuBtlU+RIW75zkLKAvtFYVdM6cYXjP5uZxds8Owr+WO9q9UmHY+OwJCZ
	3MSXO2ENjHo7whVXtlgK9GsQ8JNHPilVC120PkTCw/N2fo14E+o2xU5zGiuZWEmz
	G2wW3u2Ln3TlchmcPOKx/hYDDzrjrreraFHjms32vzlcLkyk4Rr34K676qBSmRc3
	9rREhpGqOSKZ97JnUacB94rG6TRSKLzdBsgyW7CikLy4thqozT+cZgnlPFOm0rtb
	ieFsQkR73ZxMMo+v0V7zhg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2106.outbound.protection.outlook.com [40.107.223.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcph3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/cjXdSJdUEnwSge7pWLSD5T+EsVWcBRn+RGkAVo3QiGnIaILEnhdG0jEN8K1eX0evmhcBCoH5TxV9Oor+c8yj8tVBgNg1ykYNrp+F+x3TBCISMROQtTCmG+dVFjC2Kqgt9zYUhHpT8n3dA93fBF+gDJxPD1lreAFR18e3o6MshbuF6dE+Xmwk5HLcOkKdvFHd30q/jEmW89kDr1SF0bB1lU07NGATyLcmU+yS7D5sCrE/yEZCBMMACzf6+4UIccU3rFbF7+FYU6J5xMxRf0H6ol/xJc+vYW1BbOTa/3XBbiBUCn8Rg7qaVolrfuN1f/I3aegOIwTyU8DABwrhBiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn70Puz0hLPHjkadJy8gwZ8NWWD1ai+2PWTqu7n+1ag=;
 b=ExaM3RdQZWknqMxi2/GWCrfVF98KDShGgbDpBmXX7+h/RJdi6DIh8qcXewMmlgiPH+wKte3LfhvhuluZ/FC4J718VNXb6+6aGO8f2da1e/UuQsR9rMsmdKLFf4qz9uozai3P6Aic5+mu5n142LsE/BgT0ikO8F29rGSqdrHkjd38vEvZxNmK0YTbnaH/0EZG2uj30h7l0Jkf3suvxUVGYBVADf3kl9oKHIOVACY16PMuTw17lNvrj+DY8huT+sHXTlNoBYjQ49wJzCESS3iHGJnPDml7fUG9cMQa97e7uQBmDphfDCkJozM3IIasZMyFQGdHpB+AzDJuk/PgADp8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn70Puz0hLPHjkadJy8gwZ8NWWD1ai+2PWTqu7n+1ag=;
 b=oEYQaWcHWCpM5zGHBLMqd/tXUJo0LVjSD382W14kouc1kJTbnoeMvY+UwMW3ooWcPV/hqVcTj0IGMmhJpyxOw27T14xfTkBUq2S0GtB9X4UeZofrbazL/r/Hfest9+QAg6yTSjCjmb2IMI97uE649WvbnOUGZWQv3uoMEP3Idyg=
Received: from MW4PR02CA0007.namprd02.prod.outlook.com (2603:10b6:303:16d::33)
 by DS3PR19MB9680.namprd19.prod.outlook.com (2603:10b6:8:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:10 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::12) by MW4PR02CA0007.outlook.office365.com
 (2603:10b6:303:16d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 10:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1555D40654F;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F1760822549;
	Fri, 12 Sep 2025 10:35:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 03/19] ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
Date: Fri, 12 Sep 2025 11:34:48 +0100
Message-ID: <20250912103504.2679226-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DS3PR19MB9680:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 88b71d48-7f93-402b-5073-08ddf1e80c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BcJkjcq9bXu1duBfX7n+D30Q7r7XHvGlcnFqdKqioXzwZ4OSyRkBcyz0La65?=
 =?us-ascii?Q?2MPwMIxW9PRL6d4JvmwdX5tadXzYQfhFY3dw05SDh0MqAYgcoa+AUkFbELB5?=
 =?us-ascii?Q?qoTmnhFNBLfq+QGaIwDYgzu/dg54vllC5VO8XOcodQLO7sDaKsGLWQdKo04Z?=
 =?us-ascii?Q?+6iN9Yq9uUmlmYAjJPTl4a48U7a2vcSbCh6AGOvHlrGlzwpX2IHTGVo29bs4?=
 =?us-ascii?Q?50ZSazwlcp3NpHCibBtyKkejIAO8lnjEIwBaJkfaP43Y6TfxbQEbyElZM4ND?=
 =?us-ascii?Q?ODv7kroJh2eAl6XQ1WIfyM3u8mgXP//Kuu4kg5HWLI6pNQz47A+VAD4cV2ww?=
 =?us-ascii?Q?QDnunaHoTGCNo4ZNnmyTdl+ykys618IsLmEcf2poqUumyzOfad2BrvfzfQs7?=
 =?us-ascii?Q?pufPWPkHgqGm7Y34E254XBa8JKwH1hDYYUn7YOD6FOkHpZQroNsTYbnH9A8R?=
 =?us-ascii?Q?Mic03Uqp8vuwk+JxU02QbPnJDpy8+YKl3h3JvsLlQRnNQGmB5LZpvxgD/C3a?=
 =?us-ascii?Q?K7gdP5Hh3gRDc213BVvcYJRckX6NojwACdf9jSudzfPVyaSub4eL7pID1GYi?=
 =?us-ascii?Q?1fSRHgkTiv1E6q6TX7kyoeBe6tyIzU80sa1jSDN2+ONlYmMrm9IWeeIujeYc?=
 =?us-ascii?Q?01no3ZpLAkFfhxdcGQRdZVOR7RjWp97ztd3ua5UUd+9iVm059l8K0uy3Qx7H?=
 =?us-ascii?Q?QVuixu+AAzpUazqH+5ZZ1xRjgX9NtmxbKXZUlBfmrPpb25iX5JwxhyriRttG?=
 =?us-ascii?Q?807cWOsDYGdpBNRg5ey+yBfi8M7W1XAjIegSwSgYB0wYYAEUKMzkqlGu/Ewl?=
 =?us-ascii?Q?urlZ7CjGbgSZ4uUjoyYalEoNxuXw8FAQatIlj7V07vBL8iK78pxwAzgSH5Rp?=
 =?us-ascii?Q?TpxU7n31v2EfpkK+kiZyMD77xmfzTVg07abKQM/JgHXleAT7k43bSFcziuEz?=
 =?us-ascii?Q?wcQrHifFZ3jhp4mEuTYgvLyxeqSJZh4rZxtNzpv9vpuKu3JERZ0Edh7boaM1?=
 =?us-ascii?Q?DE077fmD8WnpjjJBbxP48918Vwsw/S6vNOOs6u/zXl9Sk7SzhjLFqfykSSPw?=
 =?us-ascii?Q?kSL52sK7EMRwBOUlHnitQ7nzBrNHi2gDllPPfYlDMdBTMSMt0lehrN7ix5g1?=
 =?us-ascii?Q?gbsmJD0D8Pchz0/saBYLCIIV9xMezD0j8pxg9UCjbO4/q5coi5xIUt/7VFWI?=
 =?us-ascii?Q?/lk9Z/y+8wAxojAkKabWeQuJ6p1jb0kQ8mqLxLdUr++KRSr3DKd9HOxloXNR?=
 =?us-ascii?Q?Hjda/Ypo+dzRwkzybtifwXyDwODgTmBDZPOGySU05tedg783eF75VJycA0Kl?=
 =?us-ascii?Q?3N1zcg3nb7HPYuDDQ9M5CG/Ogap+cTmZpAPMpQR1hx+ROHi5GMR8TRJwimHa?=
 =?us-ascii?Q?gqgbfz9dEIj6uDaGybwb8vvd1mmouAwlqUwbXXkGpdQjSEWNU+vo96y77cSQ?=
 =?us-ascii?Q?zcNwKhYu2VfuNVAk7XucbctqvAuMD/7fL/uuqwajvNPftbaubgaZTwDg1yqA?=
 =?us-ascii?Q?MHMGMkc0qzy1gMhMRawWL0fIv1W0553tze3a?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:09.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b71d48-7f93-402b-5073-08ddf1e80c30
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9680
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX6dSTjafMbwwD
 uEjojgV/xzyzhRvmNIXTadxC4RKgJ6FjUTRHSKZqExzxkw8TMIwYPX4v7V1oryI8j+Szc1rWJLv
 +1IeMlCdrdQnUnNA9VBdLY88rIfvNboy8YMElD5YeL6RDMx/yPexVQIUDyiAqTYsjQqdEmvUuhQ
 Ly/nypbi2T1t4zVvvwgT0FJlUHk4uYKb0EF56KoKE/wzRDbTMeMSijAWLwsLxiLhSze8zMzb0Bg
 ZaVgETQHt75sM1eXW96aA/g0Ur6YZ91wGM5fndM+aidSpw4XnQysDK1M9RlOOwfSpUDasB9sAdK
 IGztw7h0iHmg9s+CkZm59sj1ohHoD2Lz7BxW9WScj5nb/2RRupamcCnUhZu0ec=
X-Proofpoint-GUID: gUqA77lxqgOC0jybY3PQJ6JMb5y25zb-
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f761 cx=c_pps
 a=EebWuFOjNSpnsyZumeNqcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=2W7Bv4yKaM6PJBoyyCIA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-ORIG-GUID: gUqA77lxqgOC0jybY3PQJ6JMb5y25zb-
X-Proofpoint-Spam-Reason: safe

SDCA interrupt handling is a bit odd, the SDCA IRQ registers are
defined on a device level but the handling of the IRQ is at the
Function level. As such the regmap IRQ's PM runtime operations need to
be on the device itself to ensure those registers are available but an
additional runtime get is required for the Function child when the IRQ
is actually handled. Add the required manual PM runtime gets.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_interrupts.c | 42 ++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1926c0846846..9295d283be91 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -11,7 +11,9 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -86,18 +88,25 @@ static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
 	struct device *dev = interrupt->component->dev;
+	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
 	unsigned int mask;
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for function status: %d\n", ret);
+		goto error;
+	}
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
 	ret = regmap_read(interrupt->component->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	dev_dbg(dev, "function status: %#x\n", val);
@@ -130,10 +139,13 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	ret = regmap_write(interrupt->component->regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
-	return IRQ_HANDLED;
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
 }
 
 static irqreturn_t detected_mode_handler(int irq, void *data)
@@ -146,21 +158,28 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	struct snd_kcontrol *kctl = interrupt->priv;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
 	struct soc_enum *soc_enum;
+	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for detected mode: %d\n", ret);
+		goto error;
+	}
+
 	if (!kctl) {
 		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
 							   interrupt->entity->label,
 							   SDCA_CTL_SELECTED_MODE_NAME);
 
 		if (!name)
-			return IRQ_NONE;
+			goto error;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
 		if (!kctl) {
 			dev_dbg(dev, "control not found: %s\n", name);
-			return IRQ_NONE;
+			goto error;
 		}
 
 		interrupt->priv = kctl;
@@ -174,7 +193,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	ret = regmap_read(component->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	switch (val) {
@@ -195,7 +214,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		ret = regmap_read(component->regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
-			return IRQ_NONE;
+			goto error;
 		}
 		break;
 	default:
@@ -206,7 +225,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 
 	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
 	if (!ucontrol)
-		return IRQ_NONE;
+		goto error;
 
 	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
@@ -215,12 +234,15 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	up_write(rwsem);
 	if (ret < 0) {
 		dev_err(dev, "failed to update selected mode: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 
-	return IRQ_HANDLED;
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
 }
 
 static int sdca_irq_request_locked(struct device *dev,
-- 
2.47.3

