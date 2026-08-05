Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAEA352FA5;
	Wed,  5 Aug 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933749; cv=fail; b=cOtrce96jL8xiUzv8omM786Hpsmi3qgRNuYRFwG/0FdFCB3aNaEr9n80Doi98oi88VvFYf2m76urC7wbcotFN1xS93fXO4tTESHKdAwUlTVb33Vt1gdo4891lxgRV2rgPCSH36E5YhFWKosZ47DOZzdhdpL2ou1FvNoWdXVLwb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933749; c=relaxed/simple;
	bh=zkd8j4hZyt5Z9A+uxPd9S2rYdvBD6aqyBeJ7uNN91mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWWl12/8RNTjod69w1i80XP8GAMkGQqr3S2GCv3RS59oB+DdJJmZ2kMOJIirYa9HpArLsQ77UznBz95H3aNqnHN64VUfwwbdE4j7rlkxKOfpzSgl4YCc5IZMGX460X1UTRibhFrdMOfzqEN5zs0qYShHks4XYOpvx3IhGBKDXXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UMuVjo/s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yRj2dhvz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UMuVjo/s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yRj2dhvz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6754V8ip3379452;
	Wed, 5 Aug 2026 07:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OgWi3PCz00DeTH3tbIiLbYXmAg+Mq+ze1MIYSvDLDjs=; b=
	UMuVjo/svsfTP61GuJZd6b7WWjsd+fIZ92fQNbkGn76HZsVdke27BtDkgJL4V4/v
	wIksyEiGqUwuEobsVwMPASemXveaMF+paccWf0Tjuilbtq+UVD5h4fU7II5OyLzr
	r9+aZxZLXQC5RqiqO/ohQh8yFvGNdyeVlqO07CxCc1GHwzVMReiKTxf7Y8zsnOfg
	7mvSaW4ouRoao/pYGQdwyNN8lgQW2UwnvlP+bjyCVV7K3c1WMYArrs2eg0pHBLhX
	DLCudvHr5Urh26O1BZrO8bCnrOD5hGL/aH3svYeBbik7om591xu47ofuVxsfyCJP
	ZXeWVj2zjEHIuM8RDO2xPg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020099.outbound.protection.outlook.com [52.101.46.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vnmdf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMiWH9h+06kgTJapYlGYcst4k18K5Z7MXNG9KUaKaUVvqagmrngEvTHhYr0LbZ8asqfZ6XgwZD9vWz0avihgACF9dRZrlMKeFKOo9MdOeTD+f+/T1bCqo1nkIFJ+1F+IuynQyeANlDcTjcIP3Vu1smv34DdWsCjqCDJ1ejxXP4ZDgO6zHHqMQhHgUk+Q80b409bmWhq4k8oKbkU9EhGIfj+pXbFO033Hr0n+LwwEjxokp9nklko2etMyF/rbLVNY3LzS/vVbev471zAolOb73BNkJdZLCgVX03UrAYYuETpaPHRHBNFDH84zCqOEc96AlGygWHtJS8OpWP7DQthenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgWi3PCz00DeTH3tbIiLbYXmAg+Mq+ze1MIYSvDLDjs=;
 b=gkzcRYPVL9pa1Zuxhnc8Gytl1R9X5Y3CHUwjCwBPsRfNTABvRGsg5DPG70YUt4LfQqGZnDnRUDjbH6ofEf0favIpWMhV5hqGeA2Q9pLMMbeuYXuhWhIo0FaKLpZ02iQqBkZ7Mldlv4h6ag1zVH7NrV9Jdmkbw17j/L60EVLY/UXwgYcEAia6u8Xy4t+x/wxjtGNSuG+BmdrvJSouimng8Q8F4AR9py366FlSIsVPtoYeXFUGyy5p57dhXMYkRZnjMFjDTnOE6oOBT3P2tcx6PLOzM8me8V4A6Bnjd2NAOvEiAjGttb42UQnhcSLmyZjCanA0uaV0cakLDC23WHH30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgWi3PCz00DeTH3tbIiLbYXmAg+Mq+ze1MIYSvDLDjs=;
 b=yRj2dhvzz5Ndf0ZXsBUyamMyENN8kJ4GbhBGKX7cU/VxiGmb7LDGI0c6MCfbuamew5pMPFN8+9EhKZUDjukHI7EYfAB0t8zgH2UpFn1tiiFhSgODTLp1fc5CPatAdCJ+kF7Uv5tNusgX0hfiNtHJGQIfybqKvzrVlGFc3M028/I=
Received: from CH0P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::21)
 by PH0PR19MB4970.namprd19.prod.outlook.com (2603:10b6:510:92::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 12:42:12 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::a4) by CH0P221CA0039.outlook.office365.com
 (2603:10b6:610:11d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Wed, 5
 Aug 2026 12:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via
 Frontend Transport; Wed, 5 Aug 2026 12:42:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 95C89406554;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8C03C82025A;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 6/8] ASoC: SDCA: Add missing destroy for HID device
Date: Wed,  5 Aug 2026 13:42:03 +0100
Message-ID: <20260805124205.4152543-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|PH0PR19MB4970:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 547007ad-8c3c-4991-ccef-08def2eef874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|61400799027|82310400026|10067099003|56012099006|16102099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	QRJ+jzWBgEAxZgUSMfi/plWwlDMNh68KzU/ghwgJo2qxaRQVDCsJouvi0x6MyC33tx99H0UxWZplxrMPHBNn52AXhTmi45sT+rwbeL31jK7zvH+MznVHDRuuFc0qwe+KAx+8UYYeP6H8W/f3S6P6ja6ocKQeGYIGlk3sUHINpUYWYBDAuhpUKvekpb/0I6mRUIOyCt9oGKjbxbucAAgF+3PDgiNoKxr0nLneHBRPn232P7F0JNhOxUTxMxG8mUfXljAUEbNYiKzVY1ApNTF2Y5XpQoDh4HbMF5GDLGyNZL4ut7sJl1IHTjXId9dsiavjMsDHIcPtpbkWNacxLP+hgBgUZ9tOqhQ0sP5efjH6cFBJnUbkPAovmUydCILx6IrvzoZ5FOg4gdXZtUuNL1Lcv0f0djRw8ljPkhBVM8FRPmWOJ9d7p10dbqMXKwp4+qkVKJ4WrkrplxxvnPlsifWRfnQIBstDSyddxEBWq+B3AHuxlrGyYvl5YRwdLSrBumoC0FHZiRTE8N75br0U2OKfcFbJha4C4+ePsmRsmZNsK0H2tlPaFUNenTDzXyTrV12FFhtL8uc0ASs6JcBvt+A67vOg9CX8kq/JNk/knna2fVvMlJToFhmKRgJINiFACyX6vpPz9s5fJ8ycSk8LxPldyr7hVS/AXP4O5GH5uoeZae4/OUzyPjcv1SAO5vzoLCqog8UROoRQxhuaCZ+WZOfNCQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(61400799027)(82310400026)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HHEnmFai055tjt6HBFdO7M6LlVBYUkSB+YjaHcgxqjdc/J//e4RuswCascYxgYEm5sVDNy9y468IUOXvRoopyz3F0LlB10IYxYfCMl6b8gNg4Wsxz6XVLuolD8jweGviLw5wAo32HetIv45mNX7aqLQJAMQ1TUwJTa/bAciKIy3f6aXUOxhYbszjq6HvVAoiO+6YfNpOteoA1iS8ezzLCGKK0vqYddAUod1J2zMVVRmMYJMpLcLEe78FKrc1SN6W513Q9OQdq3FXncRykOXx8d2H7ZuFRpcUaE4tVPzePcDGQ/rlceObQBKindURWXONinSQpSjotv1K1O2qEEwWs83HvNDXbk24dCSglDnoLduF6mrcgEwFvlJDl8MLJ/L4hxzgM19j6pOvg1wmi3/j0cKbbwVoHClRO4Gz1bm44TZOcc/9xupyA9eYtL2UXanC
X-Exchange-RoutingPolicyChecked:
	k4gh/ZS4hcuFBcNlSG2dysUcVddYXJgAnOOPlJwRISl6f68TOj2B+3spYWmVzNDHCGT18ZVeow0vq2sp1xpAI6e6xf9Rzivcivh88iqsTSk8nT4AP4KGS7qjwrVn3thKzj2wxm2DdsKVdjBrpuvj4hER8r3zW0S4Kqpmh9MD3vbKYTn+N5R/wDQ+LxYB0kgd5tTUZ+9F82ZTCMU147fTBghh6rxknMW+/dMIPy7RoFMQE/0QTm+jiBCwepAhvyr3tR3vJ0MZhP5U5+Lpr4xRGPO7R2b/U+n9zsXBpzxW9/ofbedZunH2I8rlmTNhuClebwcJuDKqtE5F/11zsPCWEg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:11.5185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 547007ad-8c3c-4991-ccef-08def2eef874
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4970
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX7Iz63ANL7AXS
 VPLehO4Q4cVMmL8jK6icOen6+VKjeNK+Pu9BxJu4Pxf3u4O1ojV5hNAkoDpI0kyUGmpMswCXx18
 zoMZ9SWRqgysyf4LrGpVRJxC6OkDOQw=
X-Proofpoint-GUID: 5ZukaDIc4Sw6QQWGrNe7NHInzKT-Xgpp
X-Proofpoint-ORIG-GUID: 5ZukaDIc4Sw6QQWGrNe7NHInzKT-Xgpp
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a732fa9 cx=c_pps
 a=s8W5O/SPP/itI6RUWNtt8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=GcHkN7b0s9OhhlnPF1MA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfXwEUGrKY/yX14
 Z8/VaxlzVyGAyqWhalrh3URb73bKQZ2Lkc1c0cjgFACxIWysJW0rPi89tnYsWHrlbxpTvcOoH2w
 9NBuE16CztRZWWNPwYk6V2LoNs/JQb5WqmbJ+sAMbtlma3vlznsjnnKYpqgJDvx2YE/Gh2bnwgi
 MnAHXzFbxuOv/wM7jgOp9sxWETElUZ5yoZqT9UULUaHsR5VA1WwMRtjlAc+TjA4WffTQggn2Zyb
 azzi4XCLtpiR4hx+AKPUqOA4n9NBjM4jC7b7n+Ju0sGPBir2hlqNmI+LOhsGLyscPH4PDW+gmlh
 PKU4SE7NBI1sFjhV3m5joeCW16D5uqVC6/aZZLwz1xlzxECI4no58F0d1ZcMmo5YLgP8xUYtbp5
 fdDtD0dCFnf6huPmBGYWM6bk0MwOLxqnvtshwSTSrjmnx4KfMR1yNf3ypwdcY2SqcVBG6+aapqO
 V5Dm3KnV5IcKzwPE7YQ==
X-Proofpoint-Spam-Reason: safe

The SDCA code is currently missing a cleanup for HID devices when the
drivers are unbound. Add the missing HID cleanup as part of the IRQ
cleanup to mirror when the HID device is created.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_hid.h         |  5 +++++
 sound/soc/sdca/sdca_hid.c        | 12 ++++++++++++
 sound/soc/sdca/sdca_interrupts.c |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 83d1c7768133b..848081df3e4ec 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -17,6 +17,7 @@ struct sdca_interrupt;
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
 
 int sdca_add_hid_device(struct sdca_interrupt *interrupt);
+void sdca_destroy_hid_device(struct sdca_interrupt *interrupt);
 int sdca_hid_process_report(struct sdca_interrupt *interrupt);
 
 #else
@@ -26,6 +27,10 @@ static inline int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 	return 0;
 }
 
+static inline void sdca_destroy_hid_device(struct sdca_interrupt *interrupt)
+{
+}
+
 static inline int sdca_hid_process_report(struct sdca_interrupt *interrupt)
 {
 	return 0;
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 5000d73657b41..514f895bd90de 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -122,6 +122,18 @@ int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 }
 EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA");
 
+/**
+ * sdca_destroy_hid_device - destroy the HID device
+ * @interrupt: Pointer to the SDCA interrupt information structure.
+ */
+void sdca_destroy_hid_device(struct sdca_interrupt *interrupt)
+{
+	struct hid_device *hid = interrupt->priv;
+
+	hid_destroy_device(hid);
+}
+EXPORT_SYMBOL_NS(sdca_destroy_hid_device, "SND_SOC_SDCA");
+
 /**
  * sdca_hid_process_report - read a HID event from the device and report
  * @interrupt: Pointer to the SDCA interrupt information structure.
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 71037189a057c..7aebc721a847f 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -487,6 +487,8 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 				}
 				break;
 			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				interrupt->free_priv = sdca_destroy_hid_device;
+
 				ret = sdca_add_hid_device(interrupt);
 				if (ret)
 					return ret;
-- 
2.47.3

