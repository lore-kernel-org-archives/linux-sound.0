Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C78D2F0C6F
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797659; cv=fail; b=j6ExqQhQ/3FXxiwwesn6PRZiMseaCJ+g0x4oqZUk1ZzPg5P1QZIySF1RclE6Ou3RyP9gnnaLy7yQwDRfxMdGz982W+adBybwIl2BpBwbUHO+GLeaLugwsCiFPq/6s9d6QMQnrgNKIufUIDXymgl1dTPbQLGYZujowLqLqKR4u8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797659; c=relaxed/simple;
	bh=e4gBXvbP3wQfgwRnrbdHCIdi0fuFdKAsX+sfSar9hkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQDRR1br5G/fbUO/wAwQpC+kZk4wSZdCIJsDbiXokPSQQwwDPYG+S8hmZaU4skBzc37lVSdSKm1433sQ/2Q5P0qR9rsLT1zkh1z+Chq8EdO77aPS24J2T7rIFot/S0GObjLZT/t8UX3Tj5VzzDvHPP8mbcnw/nzvWD0mZmmSjos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AiT695wL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jrEAimTZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AiT695wL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jrEAimTZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4cfHf2734368;
	Thu, 25 Sep 2025 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ySMUubb1VzzYj5zm2VE+7dCGQMgHiadEIrJuGO/6Xj4=; b=
	AiT695wL+ipibaoguzd/jCsBG0WW/nOtraeeDXb1hrfD4iVNdhy6Ct3gKzHt0z06
	NRBcsQzRPnFgYlv/NmxmZaYDy3/lbe6BAIDlVgsNjBmw/lTyINxFJG583fEY/NmZ
	+g2TA+MqtfsurUmu2LYOAukI9Gp9suM9lk+vNuW83vTHUjd6X0O7lK3rqKay3Z81
	YdNdt+/9ho9hy2q+/A9Q3fABBto98AJV14y2yPbjvjb7KRrXeExW57YOhmD2v1aM
	89UGzW2UZUNEQqOi52wsGVeiEkPusE5TFmTc68DfBDyWhUZhMAqshm64EGwCxy7a
	s50lViIAmSvPVm605oAG5A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022100.outbound.protection.outlook.com [40.107.200.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8x0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRLPDeyazwn88+Abl1wJC6NgApUL0yt0deLAG2drIzu+zWC5pcEQNm4aT/XLNa39+LYzWfdFds1ok15dKya/6fXoANGHnqPH9hPB1XQVxYW3MoVyYhhs7/aUzBSlxTbSJd0sd4pilGCsYTP/sIEFJUlLK/mJy/9dWAOvzr+MF9D23wd2OFAgZj1rJ1R4+4S/FXITWuY3kRx1yAK9f3MN+tZvlPFmEaYPcqB6gPcw7XRMGtvn8KO9/xNaPOXopBpiTay5LpddbZbdC8OBjjseFKo5vlaaUbTJe/frMn9qYuzRQqdLdafDjRr52moVJDHW7aj0Cazqqv62Ds+S9oFA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySMUubb1VzzYj5zm2VE+7dCGQMgHiadEIrJuGO/6Xj4=;
 b=QpLSndKExi+oSuvzI/6mnGcxgQ+lt9HwTrMQOEuwUcA3KfLCu2Zl5gYu5B0qG/KJ6I2Yt9fOTP5AnZKOAGjkj4IOdyzW7ssC9F+fFqM5B5/MMP6RHmaOgJQowl5Z9lSsla3InYr0P3a+y89QeUFg4AjdSpCl5p+efV2MIVci0mksBoXbugUlnDdjs5h4DQ36uGJ06zzsrVUqbaQXRzJtcZRP9gbc28mbA/hcWi9FSuSQuVnZUitLl2I670Ci5ONIDl9tt9Bb4spQ0QtPqQXPYoSk3tv5BKxvCneb6NNYS5Sid8C1XhA4s+RQiQam5E+dELRA7FyZPzsNMJsMpGjb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySMUubb1VzzYj5zm2VE+7dCGQMgHiadEIrJuGO/6Xj4=;
 b=jrEAimTZiYrxMn3Rr/ia1YrD6dcEaxWtg6XE6IDtOYQLskvkNDRiMfX90oYvJyCm+10ypgJB5jZB05zDcMLHmm/PfLJiCrVxg6bU68KDpLXugUiInvCOSh55e/pzUdZEC+JtQHSG/pfGmtgowpJrMXMdp3QBHG2QPA0X7prMHR0=
Received: from CH2PR19CA0018.namprd19.prod.outlook.com (2603:10b6:610:4d::28)
 by MN2PR19MB3965.namprd19.prod.outlook.com (2603:10b6:208:1e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:53:52 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::2e) by CH2PR19CA0018.outlook.office365.com
 (2603:10b6:610:4d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CA9B340664C;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B781A82024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 17/19] ASoC: SDCA: Add UMP timeout handling for FDL
Date: Thu, 25 Sep 2025 11:53:39 +0100
Message-ID: <20250925105341.194178-18-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|MN2PR19MB3965:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b78eba2-361f-447a-6a04-08ddfc21d0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wAuhHEAe6LcFRyzX2RiMC6OzFYMiXqRJeH9oo4ia6Sc7Wb1GWd5xED1bRSPs?=
 =?us-ascii?Q?5zy26zL+7AsdzRjQ6SGk0s/2nlFgb9po8gPrWOl1OnxCBjJWHD2XeXQppiB4?=
 =?us-ascii?Q?Xa8/ej+nNV90xh0rLjEXjWe/p6QLoDO6mx2JlO/0JwU/H0NyWjIWsISSdF29?=
 =?us-ascii?Q?ifZyx9LKV8CPOBKAnpET3t+xaq8B3Y2a4prnzebsqW9+DjWQB4drmrt3/OJh?=
 =?us-ascii?Q?/GbaP21qBSzLLRx43azBApsTk8qmhzwMIxaRGKXZtmZyLKLrXSoF/ja+lM/3?=
 =?us-ascii?Q?lTZlqEAYmG0n2Gj/tolki/XluZ691f5RPp2Zo5nkewCltzWKyNeLH1uHnQFi?=
 =?us-ascii?Q?Oqfswas98h+oUG+n6UdJHr0pMO/miEWKoRPoT0TaZntbodHnR95b34h+Quwe?=
 =?us-ascii?Q?YeEHB//75xPRvcbTUI1KM0nt6OgPDoggZljxmHGNo2CIdoVYWpY3K/y4wPqF?=
 =?us-ascii?Q?vvQw4W9hP6K58GgQtFrmuHeP7Q45SHbbBsjEblFcEhT0fRgOosJf4Fy3xLHc?=
 =?us-ascii?Q?MK/MyZknkIPUogQz65F6dg+IiRVONdUth2DcLP79xLFGjMAfxtT3jYfmp7h2?=
 =?us-ascii?Q?VUDn27+b5mqRuTp0iJU7M1kIf1jzcTeUlBC2IgGJTrDhYI9oD7B4VknYQ/r0?=
 =?us-ascii?Q?1j3CbtF1vt8crlztXnCfu/j6YPMmyTKBZPhsHvbv4m2TMdvweLXkvg0d/iZP?=
 =?us-ascii?Q?+jxlQdHXpebmgh7ACnADq4aekE0qGJNKMzMJEBTtGblw+1C5lqXy0C7ud0M4?=
 =?us-ascii?Q?HCqmagGMm6PS5Jhwo1RsWwmdhYbcjVHGdTwqdBr3J9FQ2EPzXFGEAWXiIgmX?=
 =?us-ascii?Q?iJ0hlEeNmQjmMEtVxYdAOyeGNHDwnqdhYc42CbbR8KoTOo3lblZ6Gee2vAo6?=
 =?us-ascii?Q?6C8AnMq6o9q+12QKVfm1q2qRw+KS4EEe6v9B1Z37hvrqjNjaX7C0PK8M+Ox4?=
 =?us-ascii?Q?Dl83ZFmXM13Fpx/5CfUshukXC0b3n11jnnCUmLxCgNRskLTHiP1as3McYSbG?=
 =?us-ascii?Q?WrEBfeIaV4bkGk8wbmCHHSiXn89oV5qzz+laE0LFbF5qa5skNhnvr8zit+ti?=
 =?us-ascii?Q?m31/lwucoSsHOfq89XObsZfLHIXnZvudd2bwUkd4TFpX82a3ArNwJJVhtIVX?=
 =?us-ascii?Q?dKiSyUuqLbkMawsRBY936p2TvX9IOcfWUJD6EKBhwf2FCCg6sbEjEkYY4cZI?=
 =?us-ascii?Q?K4neb3YgIKoD65dKnz7qVbvhqMu7RGm4ASBn+v/paN4NIst80Q+lXFNugnlt?=
 =?us-ascii?Q?J6YFVH3YVQ7jbAbxpBuPEvz3zvSr/p36DB7mdT1N0RwmQ4Sa0/BYoVZcnNvp?=
 =?us-ascii?Q?miogBehtlzcApWRhYjCqyhckfO5ggc9JVURFJ73U9XM4KMD35KmLgUo3kNm6?=
 =?us-ascii?Q?JrXdJiaJRYHTI+cWXJhlJBBnfr8gabUcXFy55nNSd1Wp60cOkH3gLer9ejNO?=
 =?us-ascii?Q?o2MiFPE6H2GymnE5iMsakqGQqeCumiQomO/JqKcdMSme5xrZxjUisFhLpHto?=
 =?us-ascii?Q?tYFj8TffphhLvOm23OaVWWAa4FDGjkiDmGlX?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:51.8978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b78eba2-361f-447a-6a04-08ddfc21d0a8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3965
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXwoQUwAKrkz91
 OJ/5+QEShlLl2yZiIft0/UAdgow7+7USWWwj+19euhpeW/fyA3Llr/wTOIGjovbpORZmrTHRC15
 zBEFV/LCeXeRmnuIWmyxi9Sl8WVtpotixc4GnFS3mQZl3dPQKGbG9tAi2IhVXfYUYUCbRKTwCi/
 A8xTXKjTcMwnSEGhsFwyYJcRRrIPBhHBzBRKGPpH4j59Xx0gwG3jwSrcDK2KzmtIfufqcmGRRHD
 e2DqPwCGnesKd/YUvKqpv7LUTmAalTg8dQQbiaC3NhqxJFfj0dbqZwmpnEAnhSbQRjcbAY9qU0A
 jTA+UIQDv6upfY4Mj7pNpKLUqKbYG58aZ2AjOtoToXMDPwszJp1SKFRldXNFEc=
X-Proofpoint-GUID: zsJ8XIRqlV35PWM1_HxyhMM7gwYqKn93
X-Proofpoint-ORIG-GUID: zsJ8XIRqlV35PWM1_HxyhMM7gwYqKn93
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f44 cx=c_pps
 a=eFEjX9j3IP+CJDDqlGDD1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=7YH4QgMdnEmkNJGjKpcA:9
X-Proofpoint-Spam-Reason: safe

Several of the UMP transactions in the FDL process should timeout if the
device does not respond within a certain time, add handling into the UMP
helpers and the FDL code to handle this.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add mutex to lock between UMP timeout work and IRQ handlers
 - Clean up UMP timeout work after FDL fails

 include/sound/sdca_fdl.h  |  7 ++++++
 include/sound/sdca_ump.h  |  5 ++++
 sound/soc/sdca/sdca_fdl.c | 50 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/sdca/sdca_ump.c | 15 ++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index 4ea000d6acef4..f4ba809cb203a 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -11,6 +11,7 @@
 #define __SDCA_FDL_H__
 
 #include <linux/completion.h>
+#include <linux/workqueue.h>
 
 struct device;
 struct regmap;
@@ -23,13 +24,19 @@ struct sdca_interrupt_info;
  * struct fdl_state - FDL state structure to keep data between interrupts
  * @begin: Completion indicating the start of an FDL download cycle.
  * @done: Completion indicating the end of an FDL download cycle.
+ * @timeout: Delayed work used for timing out UMP transactions.
+ * @lock: Mutex to protect between the timeout work and IRQ handlers.
+ * @interrupt: Pointer to the interrupt struct to which this FDL is attached.
  * @set: Pointer to the FDL set currently being downloaded.
  * @file_index: Index of the current file being processed.
  */
 struct fdl_state {
 	struct completion begin;
 	struct completion done;
+	struct delayed_work timeout;
+	struct mutex lock;
 
+	struct sdca_interrupt *interrupt;
 	struct sdca_fdl_set *set;
 	int file_index;
 };
diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
index b2363199d19aa..f54f9d48c64cb 100644
--- a/include/sound/sdca_ump.h
+++ b/include/sound/sdca_ump.h
@@ -15,6 +15,7 @@ struct sdca_control;
 struct sdca_entity;
 struct sdca_function_data;
 struct snd_soc_component;
+struct delayed_work;
 
 int sdca_ump_get_owner_host(struct device *dev,
 			    struct regmap *function_regmap,
@@ -42,4 +43,8 @@ int sdca_ump_write_message(struct device *dev,
 			   unsigned int length_sel,
 			   void *msg, int msg_len);
 
+void sdca_ump_cancel_timeout(struct delayed_work *work);
+void sdca_ump_schedule_timeout(struct delayed_work *work,
+			       unsigned int timeout_us);
+
 #endif // __SDCA_UMP_H__
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 39298314f69c9..cb79dc3131b82 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -116,7 +116,7 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 							   done_timeout);
 			if (!time) {
 				dev_err(dev, "timed out waiting for FDL to complete\n");
-				return -ETIMEDOUT;
+				goto error;
 			}
 		}
 
@@ -125,6 +125,25 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 	}
 
 	dev_err(dev, "too many FDL requests\n");
+
+error:
+	for (j = 0; j < SDCA_MAX_INTERRUPTS; j++) {
+		struct sdca_interrupt *interrupt = &info->irqs[j];
+		struct fdl_state *fdl_state;
+
+		if (interrupt->function != function ||
+		    !interrupt->entity || !interrupt->control ||
+		    interrupt->entity->type != SDCA_ENTITY_TYPE_XU ||
+		    interrupt->control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+			continue;
+
+		disable_irq(interrupt->irq);
+
+		fdl_state = interrupt->priv;
+
+		sdca_ump_cancel_timeout(&fdl_state->timeout);
+	}
+
 	return -ETIMEDOUT;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
@@ -302,6 +321,21 @@ static void fdl_end(struct sdca_interrupt *interrupt)
 	dev_dbg(interrupt->dev, "completed FDL process\n");
 }
 
+static void sdca_fdl_timeout_work(struct work_struct *work)
+{
+	struct fdl_state *fdl_state = container_of(work, struct fdl_state,
+						   timeout.work);
+	struct sdca_interrupt *interrupt = fdl_state->interrupt;
+	struct device *dev = interrupt->dev;
+
+	dev_err(dev, "FDL transaction timed out\n");
+
+	guard(mutex)(&fdl_state->lock);
+
+	fdl_end(interrupt);
+	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
+}
+
 static int fdl_status_process(struct sdca_interrupt *interrupt, unsigned int status)
 {
 	struct fdl_state *fdl_state = interrupt->priv;
@@ -364,15 +398,20 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 {
 	struct device *dev = interrupt->dev;
 	struct sdca_entity_xu *xu = &interrupt->entity->xu;
+	struct fdl_state *fdl_state = interrupt->priv;
 	unsigned int reg, status;
 	int response, ret;
 
+	guard(mutex)(&fdl_state->lock);
+
 	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
 				      interrupt->function, interrupt->entity,
 				      interrupt->control);
 	if (ret)
 		goto reset_function;
 
+	sdca_ump_cancel_timeout(&fdl_state->timeout);
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   SDCA_CTL_XU_FDL_STATUS, 0);
 	ret = regmap_read(interrupt->function_regmap, reg, &status);
@@ -415,7 +454,13 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 		case SDCA_XU_RESET_FUNCTION:
 			goto reset_function;
 		}
+	case SDCA_CTL_XU_FDLH_COMPLETE:
+		if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
+		    status == SDCA_CTL_XU_FDLD_COMPLETE)
+			return 0;
+		fallthrough;
 	default:
+		sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
 		return 0;
 	}
 
@@ -441,8 +486,11 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	if (!fdl_state)
 		return -ENOMEM;
 
+	INIT_DELAYED_WORK(&fdl_state->timeout, sdca_fdl_timeout_work);
 	init_completion(&fdl_state->begin);
 	init_completion(&fdl_state->done);
+	mutex_init(&fdl_state->lock);
+	fdl_state->interrupt = interrupt;
 
 	interrupt->priv = fdl_state;
 
diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
index 5dcad2f7ea05b..8aba3ff168728 100644
--- a/sound/soc/sdca/sdca_ump.c
+++ b/sound/soc/sdca/sdca_ump.c
@@ -245,3 +245,18 @@ int sdca_ump_write_message(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");
+
+void sdca_ump_cancel_timeout(struct delayed_work *work)
+{
+	cancel_delayed_work_sync(work);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_cancel_timeout, "SND_SOC_SDCA");
+
+void sdca_ump_schedule_timeout(struct delayed_work *work, unsigned int timeout_us)
+{
+	if (!timeout_us)
+		return;
+
+	queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us));
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_schedule_timeout, "SND_SOC_SDCA");
-- 
2.47.3

