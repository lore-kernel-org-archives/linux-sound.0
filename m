Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C042F3C11
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797661; cv=fail; b=L5g37ogsl4nLnTcERzrd7rt+P3kj///JzT3AmaLfdnm6YM9XgUnB7Mm1p0SRPDZ6rctQe7+NAbruI28m2cYPIyqN432teGiSVUA6x3ZtL47hAyBlgofZJ3ACpKrXgOvLIIF39e4ZR/Y15x3IueSdV30T6sTM/uo2DDEmMe3QcsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797661; c=relaxed/simple;
	bh=/7Nw/OpaSWOxWXyHechpdMDyeDK3NZ/Qdxm3uGTQV3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFeNX63tRIaoHDIQfe1kAFq2TBbPXFCgRF9cx4LIRv1qS4pQq2vsl9hgzi008YRG+K6c8dqu7Jkx3XSSFWuSeCeZuMjb7hEzDfKB8iaWRAXZuFnwxPFieomxWtNhBI9/S6+qKfLHHjYS41yk14hxM18CqKHnCyXbahNcZ2YpY3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=F6H/gQIQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ub2SfhrG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="F6H/gQIQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ub2SfhrG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAN0u71391147;
	Thu, 25 Sep 2025 05:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qUBYbaD9i0pabAAvpzyzrRT9NZXeI/V3YQ73xriXtvw=; b=
	F6H/gQIQo1uHGYn8KPDrgljIuN7PKPlwnX/OP8Z7UohuJwacV6fC4pywcUoUPzB+
	tBtRplBpzkZa/21zZTVVM+1XEJVyYO88MJUoK/NsuUX6krdYjCwo9Ue8Sug+WNOz
	XGkyq16ZgCW5KBpzGo6PFVxW7VMY6NoB/tvp+AkXjKulZe4+rdAGPKFFKh3cXOJR
	jKCue1UdtuTi1+0+uON3z4wXlMcxtNHb1m8Gt/KHXzalttbRTr0pPTXvRDB4XF+A
	ciIc/of9geHtYQCCf8zs8lxmbWFG7p+fIEm2LvFgeVCK5D0W5AExf/b0FMDHyOHy
	I2sMd3Q63H5kh+0FlzhyrA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022097.outbound.protection.outlook.com [40.93.195.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8x3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxorXrFrrVD914BRDkLTuuOOuyzEK9IzGbMgQwcWoH+1fdUYTNMYBAlCPePDktNu4tc6g5+3JDCB5BaqbWBqKng5rNLFvaRc0av4gJW4ZRE5DryBKkZuCThqhBEjPW8fDCEXrawla1y15gN29CpbzsTHKC9Nl61nNanXFPmG6CsaOw/TWijeKFXr39CtAIvoitwlzFTyU59XkPrLZI8f209zbClGIPKjDF+P4gn+EuAvd6XQkeENfssHO58aCQzgIdKaNbwkSZ/Bvt80VnCYWDESUNXf5IW0F9YFv07vPSYPGGtLqvT4r2HpOlG/FOk47sDF0sjkrzZxDsoE4W4YNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUBYbaD9i0pabAAvpzyzrRT9NZXeI/V3YQ73xriXtvw=;
 b=iM5+7Goy9GqhSptnGyYRV1R6uwQtxbXoiP0TYAjO4F0TEZA28lmeTYz1V/67CBRHC/8UC3uBLA8yI4kuNza6fnFH0uRRVxtUkxyCHfQk77GVreYG1pKRlD2P8cBkQj5Sx+hbTSiMuB3mTEnQvOkRmudJg0mNQdh95oNL/8bsUDBwepGom4yD8APc+OdqjVkQzcWK4PAD472v+OoKBNWYdHy3LzBZnlRfqYsIoZFpE6nafMy+c2LOttc8uz/mgNAO/6JqYV/BQJfU2wvc48elbIjgMIVRuM0MplYOuqYa4q5vfZNB27oaDnVsfHckqbNBgcgDglFyUCX4ayYIhUxfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUBYbaD9i0pabAAvpzyzrRT9NZXeI/V3YQ73xriXtvw=;
 b=Ub2SfhrGdHdgrPSUhxv1VSv2obtmXh5TyJ0+VQ8IjLGZOvKs6f7pRYq3HpDfd19Sb2p+4cyDDFGEr1ebUD4DRhbsKqF49uwIeSTR24scq8vBAmxEdTHop/sRNTDBof+hGQBdDy9MgpBT3mUUgH4GIEemhv0sdgcOefuapgGAMLE=
Received: from SA1PR02CA0005.namprd02.prod.outlook.com (2603:10b6:806:2cf::10)
 by MW4PR19MB6796.namprd19.prod.outlook.com (2603:10b6:303:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:53:54 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::ef) by SA1PR02CA0005.outlook.office365.com
 (2603:10b6:806:2cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D9F9240664F;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D0D91820257;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 19/19] ASoC: SDCA: Add HID button IRQ
Date: Thu, 25 Sep 2025 11:53:41 +0100
Message-ID: <20250925105341.194178-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|MW4PR19MB6796:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 47e9b824-076e-4672-5954-08ddfc21d117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+yq0kN8mjsVo8ExaOm/0BC74yx4N/fVQy1wG0bjb0+OoSWIRKyDpDu+JZict?=
 =?us-ascii?Q?OXJocFYmIHGmuU2/oh+FFJwVqL3+qJmtGHKGPlcUXF10IetJikiEu41k43yH?=
 =?us-ascii?Q?/YPNChYbrdhXXXzJBUmW8kusyq6vS3p/5eggQ5s7dfHEOlXAMPfpmcxH96+5?=
 =?us-ascii?Q?7CUiorfTxLV6AS68y30IIfxFU2fpq5yJcYC8hrXkrLoF9iDS8JundNTA57gQ?=
 =?us-ascii?Q?Mk4FJ9P/jC6UZYpLANpozW29oVbJ5Y7/BT/IyCDQnFKqZ6FjmV6ZohBjq97h?=
 =?us-ascii?Q?CVHCqDxAY2V1LKcgTk5oVZ98yolkjzNCfcmWNVIeYszRAfsenC6gvAikUHMz?=
 =?us-ascii?Q?d82ihAwq0n1MoRe+BOv9Cv6ywIal/C8oVLprfXIeQt7M8pelTXrW5ra6eGx/?=
 =?us-ascii?Q?SLiJjL3MCE+vX/Udf+og4Pi9+jZ8iVJBnPqzjLXvw7J3oa1Odmm/mZLonQwH?=
 =?us-ascii?Q?PG/C7qD5Vsmz5CUGUCRfVEGyTeD/ksWD5OGAUxihZzAmMz7SSa+wVyLEmSNh?=
 =?us-ascii?Q?LhsDWqPbWhtQAiXTJ1gJWiG1yYgOkBnnXa8CPNuUnlTs27umTQyucsdsqU5B?=
 =?us-ascii?Q?YGAydYVZGbxwnwU5HdJ9nWi4V3QBsDLQ39Pxkmo6bubDUX5XuMIdBbc8JQyF?=
 =?us-ascii?Q?5QqKfD1VruxJE/6GuwFzpd5Z3cxtz/yCP6RBQZjqR6A+MAe9R1+ihLsIGzSK?=
 =?us-ascii?Q?TpJA8YevLDGX1x/v4vfWutytni1D0s7k7TFGrTF5MzO1OesR7dCBAsU4h6kF?=
 =?us-ascii?Q?A40sQ5HVb8MgFXn+Z3tHFblenvuk84Qr2A4BiRwM59HnNhJzYp/YFRVVYn9K?=
 =?us-ascii?Q?EMD8cz0dTNQsoE7bYQAqN4mk9FFWX1SnKfGcImqbbTigELFVWItKFzIXm2wW?=
 =?us-ascii?Q?TCRLrJi50ihPEWFDc196CHazR0N9iMjkHDNXWSmAn7sWAeAiHF/4BBZoJfm+?=
 =?us-ascii?Q?CjE1Tm43I/5XecnEgpiGzokM1WiUnTKNxDyFHe4Hs71/3nIpKdXlIs5Ex9j5?=
 =?us-ascii?Q?PIlPsZjZQkXJyE0JgpkeylSTMR9Jr7a1Z15PeMPlMPH30a7IT5eJjYx166UH?=
 =?us-ascii?Q?wqrCEP2Dlj/UhDIO7W6jM3Ed8QXqTysEZx/82/LefEZXB1O9bWFXy495IyDn?=
 =?us-ascii?Q?ON9zDHB/vgNoQtnnDvAreSXV8ecAJkoI7S91MX79uXSIiiIb225Dvb2OzYMU?=
 =?us-ascii?Q?5VgOy/HI7IGZ1B5BAEekpA1ctN0ByL+2XmJTHVGThfBQKVutP4ZTMbi2FKIN?=
 =?us-ascii?Q?Cl1fdoZ32FvJk7urbFx4iOZcqJ2OLG+dEOTDd6vSEcJnt4AswoY1ERuJjd+i?=
 =?us-ascii?Q?b2CHvMypvfoD8hU8MFQwLZh92HSZOh6MfB/QuCH6crTXo9Tz1PejsnLdkjR1?=
 =?us-ascii?Q?DnvQmiMAWnm1yMzLIzMWxyplkK9sS01ZbkYOhEd/LSVGw/DZE5BTrmyM+juS?=
 =?us-ascii?Q?KsltK0D9knrCjPM1H0dwovpotwcAkh3dKpRKd6iBjmbJNW0GdWCQGg12HpAU?=
 =?us-ascii?Q?V0T1gnb8GEVLX6C7VCSaahc23GIcTcnHw+GM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:52.5811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e9b824-076e-4672-5954-08ddfc21d117
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXyD7GIuGlj8tM
 +IgeYp2e5HJdb/UrPrXYT7HF5YVPsz2D1NunFBnEmGYiRmD+Efu5uxOeiI2y4Rm5uq0sfDGD+l8
 6AXnFv/jEAStzgcbcI3wP5i7u7qUA0sZLUKN7IK9LlTgkJ5Ynl/hJrYYrE2R6Z6mspODQ1dfgT3
 HSVTFjQSH5oeKS5UP17/vmZWUsDNSxxg+BzzSmIwK3buWHNIV0eLoRiUGP7TpkyVKWvnTy121ZW
 DnY9wgriTj+tDyihcCfx6sVjO9s8bPAyf97yfJ63o5DfCPl5mh19zFVVla5R6MWXGZsXW5it/we
 moCK5TGAFecMiEtBwn1KvriuYTkHVSWCb4XF2N+PuB2sXa4wjgMjD0aganFsso=
X-Proofpoint-GUID: Vft-8x_xBiouMzdOQL941MelYuSGT-zS
X-Proofpoint-ORIG-GUID: Vft-8x_xBiouMzdOQL941MelYuSGT-zS
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f46 cx=c_pps
 a=YnstAiVElcvMFu1aLrgWsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=6BSnrPCAuFArKd-Y-XcA:9
X-Proofpoint-Spam-Reason: safe

Now full support for the UMP buffers is available, it is possible to
read the SDCA HID descriptors from the device and pass them to
user-space. Add a helper function to process HID events from an SDCA
device.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_hid.h         | 13 +++++++--
 sound/soc/sdca/sdca_hid.c        | 46 ++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_interrupts.c | 28 +++++++++++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 3a155835e035e..18bebbe428c9f 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -8,13 +8,17 @@
 #ifndef __SDCA_HID_H__
 #define __SDCA_HID_H__
 
-#include <linux/types.h>
-#include <linux/hid.h>
+struct device;
+struct sdw_slave;
+
+struct sdca_entity;
+struct sdca_interrupt;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
 
 int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_entity *entity);
+int sdca_hid_process_report(struct sdca_interrupt *interrupt);
 
 #else
 
@@ -24,6 +28,11 @@ static inline int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
+static inline int sdca_hid_process_report(struct sdca_interrupt *interrupt)
+{
+	return 0;
+}
+
 #endif
 
 #endif /* __SDCA_HID_H__ */
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 53dad1a524d4b..ad53207b0d62b 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -10,6 +10,7 @@
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
+#include <linux/hid.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/soundwire/sdw.h>
@@ -17,6 +18,8 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_hid.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
 
 static int sdwhid_parse(struct hid_device *hid)
 {
@@ -121,5 +124,48 @@ int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 }
 EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA");
 
+/**
+ * sdca_hid_process_report - read a HID event from the device and report
+ * @interrupt: Pointer to the SDCA interrupt information structure.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_hid_process_report(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct hid_device *hid = interrupt->entity->hide.hid;
+	void *val __free(kfree) = NULL;
+	int len, ret;
+
+	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
+				      interrupt->function, interrupt->entity,
+				      interrupt->control);
+	if (ret)
+		return ret;
+
+	len = sdca_ump_read_message(dev, interrupt->device_regmap,
+				    interrupt->function_regmap,
+				    interrupt->function, interrupt->entity,
+				    SDCA_CTL_HIDE_HIDTX_MESSAGEOFFSET,
+				    SDCA_CTL_HIDE_HIDTX_MESSAGELENGTH, &val);
+	if (len < 0)
+		return len;
+
+	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
+					interrupt->function, interrupt->entity,
+					interrupt->control);
+	if (ret)
+		return ret;
+
+	ret = hid_input_report(hid, HID_INPUT_REPORT, val, len, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to report hid event: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_hid_process_report, "SND_SOC_SDCA");
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA HID library");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 51342b8aacae9..5176460416bbe 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -20,6 +20,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_fdl.h>
 #include <sound/sdca_function.h>
+#include <sound/sdca_hid.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
@@ -247,6 +248,29 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	return irqret;
 }
 
+static irqreturn_t hid_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
+	irqreturn_t irqret = IRQ_NONE;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for hid: %d\n", ret);
+		goto error;
+	}
+
+	ret = sdca_hid_process_report(interrupt);
+	if (ret)
+		goto error;
+
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
+}
+
 static irqreturn_t fdl_owner_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
@@ -528,6 +552,10 @@ int sdca_irq_populate(struct sdca_function_data *function,
 					handler = fdl_owner_handler;
 				}
 				break;
+			case SDCA_ENTITY_TYPE_HIDE:
+				if (control->sel == SDCA_CTL_HIDE_HIDTX_CURRENTOWNER)
+					handler = hid_handler;
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

