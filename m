Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629B2EA467
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673334; cv=fail; b=DoW9U3X6JJg3/1iMtkxJd/k+U8QdTehsdVCQC4bGIxZwxbL78beJimd36cEpksweSP00hteBl9wPY2lyzAhH9YVzvmRrNgAOSeUff6bPB/jD3ZTKQTAXaGzo6L2Rqs0cjHFy5A+J66FbmNlimcYhbelVyIl26hj+i7Xb29XrTQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673334; c=relaxed/simple;
	bh=HgypGBG44m1e055nvAup+iNb4a2/sBSVQXD9ZZQjJa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e47Op30wELPYH58irwPntIAJsWbODZRuMKGJMN19tQC5MiUF48yf/dYUKepPvLzvQ95jaeLW+Iv/fQZKqKm/zIHYm17Bb3l3dAdWg28b0oWh7kCOVyutVSo6p+1hjKy6tz8o+5Fg3DichUlJvDD4YIpAoASL+bYpuIgHlCVSVkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mF33YyH5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XS6qwA7q; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mF33YyH5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XS6qwA7q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7NqXf1382687;
	Fri, 12 Sep 2025 05:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=X0I+a8a6t1649SbbsgiRzwUeWwGwGOfNvAOhWgqrmoo=; b=
	mF33YyH5Q30bqQJCOFCPvfpWPiKVOr40v3Z6kx435D5/tjvWzrZJ9106n2Xeisji
	D5piUH/60paHM1I8YpsH9BuORridzfAptXmkpNaK1BqJwuKNrvfU2n3ZOrKez+XW
	IbFlmLjxWHkoMhYjI1cZpDkOHDymgW381xULT3uoPUr8e/rHxTeSC0HnO2zbTok6
	DQb/It5AnCKwXzHgJzurId2mWni2c7rLEUwjdWmdKcQZmmfm4r+BNEkTVujTYyFu
	SGGI1WzXldP/Ol+BaJ2bBfZLd+8R8BglU6fl8bp477Ooz1n25V/Zjhc/1KIVQckD
	d7ZfOpPkwLFZGE31+9HQ5g==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2107.outbound.protection.outlook.com [40.107.92.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcphd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UshQ+9HuiFKoYJyD8a9OYUWXVF27aSLl5iD/whNfwwrIInsd39KQe5qr0150vUJ+j2cWlXwi/ZSHGqMrhvk8yViUOsigzlrhdag2nAWz79AofuWfSlXjPh6z9cqRuyXC8GUDyOdz5NlqbApeO4MqAgQXo+7tD7sqKP+raMLjBBCRfBsiIsuhlwS0Yjgs18YQbq8sM+GOFq3kkiIE/4mh+wpfTcpgA2wzqMHY+qgQ4JlkUxP6jTH0zU69Vq1eNnhdI50JBr4JeFVz2NGWFXMfRdEMO2q9nVC3vGWEH7XaWFjKGdvLn1qZwrWGOhjsbebYTaTceEz3bZzaiHMXr17raA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0I+a8a6t1649SbbsgiRzwUeWwGwGOfNvAOhWgqrmoo=;
 b=Pfw9FO/9bQm2rxfC8wk7E8vLahwLXs+4v9FUNzOK1NikccqnhSq42Q055DZMMDm2lr55NrVZ8wWiDq1EwKWMd8dQL5G6M6k8Aic2UORxtmwqEypftI9YCOyvbwK0D1WiYOUOxYTFLZmhczJRjx5XcLOsCuzWB+NX3MBd1rLtzJ0+WqzAyTS8WQ81wJ2sWguMBLgOd+amrKss2boq8ME596TUyBY3DeCvgmMhdQGImEiJ/aFHN0gSgCf04bkiIxc3yTsN7VYhLTkqn/n5YpeYmCvMx8Plhc+ABb57EzYC8UHimpBln3BcL6ZIB7kO372gGtUuvgOPy79acGMJtp3nJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0I+a8a6t1649SbbsgiRzwUeWwGwGOfNvAOhWgqrmoo=;
 b=XS6qwA7q20icmszRtCLCMgB/HRm/ZOtlnoST060rftwF5BUeqqlqTS5OSFW/tPb6Up4Ch7uCkEexrXb8sxQeWOOv9i/ZIF3AZGo7f/+8eC1htC2GtEghYoRNBwFgD44pB0XDG/qsq9WXNd1zYjEY6WtVaBTrRMqLi0LqStaKV98=
Received: from SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31)
 by SA0PR19MB4350.namprd19.prod.outlook.com (2603:10b6:806:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 10:35:14 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::88) by SJ0PR05CA0116.outlook.office365.com
 (2603:10b6:a03:334::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Fri,
 12 Sep 2025 10:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 76AA1406577;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6F00C82024A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 19/19] ASoC: SDCA: Add HID button IRQ
Date: Fri, 12 Sep 2025 11:35:04 +0100
Message-ID: <20250912103504.2679226-20-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|SA0PR19MB4350:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca986c38-a642-4255-9f4c-08ddf1e80f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P0ThK7L4rih7TgN7Wop6LLKZPBRplCdQAY2YtSKehSbOcIXdjFvbP72/G0QF?=
 =?us-ascii?Q?/tzoMnOyH7hAhqOP30+nrRXnlilgkgdI30h7ANzjrJxnxLsytpowd5LaPcZ7?=
 =?us-ascii?Q?H0YZ6K6iyidWdOfn8YAU4GCgoggRtP7oEpVzOc+rRu5alKVQUv6ZNTe5y5t9?=
 =?us-ascii?Q?gP/ytog6fVQdRvuKpVNEzx28Zlzm2vSB+8cmihwBBsxc3fRmCP6RX74btw4c?=
 =?us-ascii?Q?kpOsVRLAMvBU+3S4Bh3xLg4xqB6JDGmnyFTk9fjaHCl1y3Vfx7/TiAov5gE7?=
 =?us-ascii?Q?b2xY2Aux3vDnYI+Ub9/JEZIsdY6xAYtkhm99LKaRTKk1G4grEy0iRLmkO6gs?=
 =?us-ascii?Q?YUg9r3Gzml2TCt8f6E520kEF1ci2aBOysezvw5TFDh+b6ShoDab8iRAxk6L3?=
 =?us-ascii?Q?KPYFKKhNJaLmzhSBlkLnF04XPJ+yX8A0kbMWE9HxwR2TG0QE164k9AJoA7MV?=
 =?us-ascii?Q?K4lz7KA55/BI9Rzf86fH9fNGQ6dvmDzPJ/AOQfun5DFRpIa15QxyCHVzwrie?=
 =?us-ascii?Q?iboCH3FKeH+7RQNWUJiSJ50dHsvFMny7hqiXjhWakuACBxBbFHTCOJuHf1tR?=
 =?us-ascii?Q?/S27s22bGjvxOS28X4ewto0S3T19aEDxoSDYeZ/7Z2VaknW4UTtNhJRYZVAZ?=
 =?us-ascii?Q?cx6iNPcluP3G2Oa3JJMzPdTaAkPdXjWVXgjb6zxbnmm78FS6UP5ttAYCJ8tR?=
 =?us-ascii?Q?Ua/KP7udZ6UKb0CB05RQ1E9d13a/nAuxyOGLQe9gEN/CKlvDpD8H/k80LjNp?=
 =?us-ascii?Q?mkWJba9T2XS4VSpx3nJrnVpd8EUM9KZtNiiMRr5nNz9dGjYLbmROAP7IC88e?=
 =?us-ascii?Q?jIBTVLM1BXlhh4b9NhGMHXuN8bOvo6vSydTQp3LhfCgPV6SO+C333YAvvHpL?=
 =?us-ascii?Q?kd9LQ4yeDRtpi5DVblthuCVYUJlyGpd04RP75f3P3Tf9jNVsbGWoczKtYeNi?=
 =?us-ascii?Q?qbpmAtZLxgNksgdkZHOBVGnkH+xFsxohMXm4uhdQR+5f8j9BChxYba2yIZlX?=
 =?us-ascii?Q?834e4gXDxv464wL59ysaNBkQSWKG3PKrlAPN7vo+foD8/2y3MtP7EfjZm8Wv?=
 =?us-ascii?Q?PT08skbC+CtkrKWxn5F8zeQytKSyMmtnkTA98OxKZ7MeRHPjHEaVj5nes9SZ?=
 =?us-ascii?Q?vm36q8Z2ROEn4xl6aQ/H5PganU0RkwvvR+aV09uRnVoQ93fUXo503lqR30dU?=
 =?us-ascii?Q?S3YaGnSugKLxIs0M510F/+WUeSlvDic0Jk6+gwlKnmfZwq1A9gsEAv8DyRbz?=
 =?us-ascii?Q?478DxCTVyDKQTiaS+HyBhMDhHJ7nrnTKVnkXQJv4VcbWwkwRVeME7On7nsMG?=
 =?us-ascii?Q?gXNmhzmVlzB2d1sK8O/yUGHulD3lI8NR2tnBRbMhuRLbcYwKOU1dKkC2ZxMV?=
 =?us-ascii?Q?dg1ESBUodnqjVR5XNuc1QKK/xgY8N6QHQxxFYNZ7IEnpgi7tuQ7hfxcla6XV?=
 =?us-ascii?Q?++1kegxsCK6wXdiThmeb+2ZyewfMdALHFMuQTbBSA95xpuSa7IMQ58qX3GKz?=
 =?us-ascii?Q?WPjcQEd/YXYcndHGtoicFPD0pv+21dLwc/cM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:14.3610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca986c38-a642-4255-9f4c-08ddf1e80f37
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4350
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX+TuGQ1Vq0Mli
 VdjCVibXAvo0j2SgJnA+pD4npPdjx2l3VHsg+Gk1gGZJ+fps+J6KwbEXNfbjN/eA3h4ldYgjFzE
 7d9reOwGqFfRBYCB3frkGd6NC6dZmML5Cdn8MjQkcgX0Q9ELbp4IrDBasEZb6AaMnBahBzfWW12
 0k4o1tPzWxXaNvMNCwCAj7LSXX3d2qQbPUsll4RceNsIpdQXkiMhw2UnD67zZys1A29mpv/s6d4
 DtwXAFhtdWIYGtUplOTWM3oBlGvJZ8ALU24jirNjlN6lW2vVYqCvvHVR0MeyAtqm063h3QC2cCl
 aSotmaiZ82cxqLtq3/HueTziy2GVzpMqf5fSAVWNGQnWvqbiraYUyyg6EBbALA=
X-Proofpoint-GUID: 2xg2PRc9aWb9I4dccr8VLgRy1QJS_kU2
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f767 cx=c_pps
 a=HeQV0jVRnJcexsn/wH5rmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=6BSnrPCAuFArKd-Y-XcA:9
X-Proofpoint-ORIG-GUID: 2xg2PRc9aWb9I4dccr8VLgRy1QJS_kU2
X-Proofpoint-Spam-Reason: safe

Now full support for the UMP buffers is available, it is possible to
read the SDCA HID descriptors from the device and pass them to
user-space. Add a helper function to process HID events from an SDCA
device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_hid.h         | 13 +++++++--
 sound/soc/sdca/sdca_hid.c        | 46 ++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_interrupts.c | 28 +++++++++++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 3a155835e035..18bebbe428c9 100644
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
index 53dad1a524d4..ad53207b0d62 100644
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
index 3fb844994712..78d3c1a9623a 100644
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

