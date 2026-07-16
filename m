Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EA42F700;
	Thu, 16 Jul 2026 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212022; cv=fail; b=SLI/b1poyc3U09TesqvMQ66dNmp9Fia8hM5LjuyVSv02P2TCerNknwpRxqUe4vZhuOeGGb4EGB1eBYsDgwGd8FePG+hXILwipeJ5LAIAXqvLEO2QMxypcPtrvvSCNdc3cjTu5QtdzryjrjoTxOP7AHKF92H8WyMw2D7XzVBo7eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212022; c=relaxed/simple;
	bh=kZ4UVDgbla7otr9NoCcqQAIQt254X278kmn65dbWvcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4IMRKA+1OM1gdaafxAaMjo0QNaQQ8srFbokoONxAJHuGnNMWIXDHl1smMzZZjrCzjAzsFDC2h+/zqfb28Fsp1r/s77d0URYkOpiyAlzbz2E9VmSJl08Csh8rjM68x6EHoxXWtgBKtIUXbYpjV87dg2T6GF+TjzPS0LSSzmiSYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QQX9h+jc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uCYTox+D; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QQX9h+jc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uCYTox+D"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G5hiPi2757981;
	Thu, 16 Jul 2026 09:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=eS6wLM91HkwakcFXjKkN/1xO/wsjh3RkRV08G4sOLA0=; b=
	QQX9h+jcRNwdW2SsGJDdC+cHJ0PUi60cKyZY2pcw/dz0nsCIfwhA+CI8mqIh/E4O
	jJMzOi3IpgEhHoAO3F6ScIEJ111OyHrdt3BWRmhpjwg4AJ+yF/xJwI1NqEuDs4ZW
	9e66g5ypxoUa6pnjcLhC/kLe+P+qMtvUN7ZhfptvH7q28NSpsneqeSMVlPnmiHhx
	fN5za8+00HKPHaaGgfGcjrz9u1YniCjLglvhYYVehz7m+Z2DLxOBpJnGg+F6nRJn
	DeCCVwbU6jzYsXkVcRTOE6ZTXQA5WKd4JzlSajmpn/ZStYOtS+4hlfcoium/707L
	P02iAuFEATHXsGz8gHEy/Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022073.outbound.protection.outlook.com [52.101.43.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vy9r1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:26:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVBNUZSOzhibSB9q4ucFMmCzzJVxDFSYUkrkAhTV60gSOcd0dNK0PNlAqCaOmm/EcesxbR+Ki4Dnl/ASLqCKGzTlv3hYdWYMWsKBZJ1dA98n+c38y1chs+B67YE/qygYWOQEELdq6okQoXoUjx0Kjkh9OCXvrX1IDxPl5glv3uA+buTgjtNWFQ0vAjcd1FppBuQoC58GdlDOXH5ydQAFiLlqG6rsK5SnB9YO++VVCFW641F7w2sF9Oy6qtv0p0QjONvIVwlTVMSIh1Hqu2OAAvcmpmurDg1KVLOlQ4rSp/izVmTr6fMHhQibi6ZqMRfvu4l9P7PM4Dj4itJ6mzoB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS6wLM91HkwakcFXjKkN/1xO/wsjh3RkRV08G4sOLA0=;
 b=D6xYHORfmGxm5Xv0bSi1U8iT7KimDwPbJaUSejRl+HytKiT6cMOviT+mooo99vjVhiD/XZT8SeY1423JKWOykXYi77OjELCAMas1d48o6B1/lGZ938tqsl0rdQFkUcd0FSPzalitBwj3FEJHL9dC8G3J9GznD/xy4um6GPDmgOSrCJFtv2RfbjgvjhuwP2mldaRYrMdW4IUY+4VQJ7Mp9ziEjfRfI8uFPzmOy3TUsNkDJlemBxTOP185cnlZaV325wsOM3TFyzIKFFFw3cxunG40hA5rfIIZZANPwck7ZM7Z8j4XKVQNOjSdcF9H/ITkxkSR21BU0nvDmzeiGYOYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS6wLM91HkwakcFXjKkN/1xO/wsjh3RkRV08G4sOLA0=;
 b=uCYTox+DmNDMN1/x1P+6Z+dbRzpWkfNcE33/47S7qjcbdtQgPDZToJDdMRT3kNI+tVMP1Mlt33o3mOWirRfE4DjQin9E8AVnTbkEnNDU5LRO98IdK+L6WsgOSkSM3s1kQR0rJBovJ/2k791T5HrWcrugkBKQDpFOb589oPK1H+8=
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by LV3PR19MB8668.namprd19.prod.outlook.com (2603:10b6:408:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:26:45 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::76) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 14:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 14:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0A32D406547;
	Thu, 16 Jul 2026 14:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E312B822544;
	Thu, 16 Jul 2026 14:26:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 3/4] ASoC: SDCA: Add sdca_irq_cleanup_late()
Date: Thu, 16 Jul 2026 15:26:38 +0100
Message-ID: <20260716142639.2306757-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|LV3PR19MB8668:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f180132f-1f50-4564-99c4-08dee346430d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|376014|82310400026|6133799003|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	sDYARbLH3OL7kQXHBQHfF8JvMl8x1YpI/UyBBA1p03fHqZrwPxzDg9G+XUp/IdkCwmwZo1zIWT0ct2T7qUBKMgqwHWRrXXMKZp4v9M93hDQKEkik3yZP32AcVIohHr8viVDprjFsH4gLr3XhzYVUXrV2P7lNJRkm2o/IZlOC0jIFKjTdJ5ZQP+LuOq3a3r0pjqFnYhUuYFqDsr76X09ZW1SqAZPyov+8YR6lxkwY2vAqdHoSpvI0pTdaEQ3F0fdfQHngO5irA6VORpANWw6BHqkd9q/n7hW6EE9VibL1ZdXYs3gTvYwedESZq/3FazkAWwobqfjxuBoxJmE7f3Gw+ed7iXBriXFzZ4gYCCmoiVqisfUmhnOafSr1II/ISlnXS4XQaKCuG98x2zOYw9AEcj3QOJ9uYpoMBs0qxXrXO9de2UApzbWPCYTx0VS7r+cwMmh9agamJXRLWz42M+Lz8nKO6tsLXzOgR8FL2kDGw8BdHyIvsKlPLox/Spl3YUSyAZb8/tw6fhvF1k/BUg9btj14C6tfbcHLdVVqIOvMgAyC9zv+gcWR/YmUgREiWbVxqoCEWBVUDy+4aMyNtOIgmjx/QAmPwwgybqEAVEHyN8CCyPp3zUEnDeeWBWL0DWxdQur/7ygt2hY/HutXDPh+UVVzOPHH+VYO/opv/BH9SSpTm6QJIJ4bb/JDBUCaLjkxTaSFdTu6RCxE2XXwQPhf6A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(376014)(82310400026)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GXHXGvcmhg/inuazfF1HINcpUxYizpHDrLF32H5yfN9mfxexow3kFAwzEpBx+Daqpn2NpaHjbhqnoREKzOlKoVGbvVUK2V/uNP3RpfD0YflTHi6fXNu04HDPNW55u0hLf/KixVXCsTKxW8wJB6Gumi6zm6RZcDKgnuBneQTdm026jVT9UTTIgLN7e4IbnCn5gZD3Yb+FSoiBu1Z0EerWbivR/LASv/dsrLTDBrpLEhuQKXQ6DwxUKi3DGBWnYx+qe3c8A0fp6rvTC97IkcU2hLw/rkG2Pv7HqW1zyF6+jEQSgrtXhhBilfQIbXWkqan3N9CPZtIWpUtgjDy0+hUEtTlO+4qUO4feqS2HmDwskZbKnofUXkIOxWuc67tCw7zRbv6dtPCTfQhObPwt689WKAcPrLWmsJSOmlb5y5ORG1HQ6zl0jj7a1coJyvd9p4Oj
X-Exchange-RoutingPolicyChecked:
	FkW3lX8m1bK91sdMuFednsHb3eG8RZ2Z9DKbWq8uZtwEFnHUQkAlug42nWywramRKU3KboSP8ZX6DdtTHdtc/JQhHymHcqCq2puTy0SqmbTs45+DdH9LANTkg7YC+zbRx8zzAsVDJl8keO8u8Z6LW+s4uVu9ZNjqIL6CkHWcW5KNnbmEG8JUszl4ISK6XBRfKl3S6DT5BMGB16SOuw52GNBYNsvthBwR5z02vXIUjYXKXwaZWUxIixhowAAwHl8Jx8h7fXXlEXW+ppaRDpH5FjhMk7MFXpZfYezRiWXMO8oh9eT+BqCPTl46flQdiccorTT50NDVgYP2iXl69Qz5qQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:26:44.3011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f180132f-1f50-4564-99c4-08dee346430d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8668
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58ea29 cx=c_pps
 a=rss2Ezl/rPWt8HBHL2MHqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=XKGCx_0LT0-6ilDT8okA:9
X-Proofpoint-ORIG-GUID: r3dUDsmf1-Lh9w4g2yZoURECfNXz5JSE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX1ODwcMekD7jz
 NVaOxZfe9DM/k8UeQoTBoBh9//trx80+DtUbEjV8U1XrYWTew5d8NbvNcC3dg0mNlRNwUomuTHh
 5b0K/AkBPmiGOuPfB2S2+ajUrH09oIw=
X-Proofpoint-GUID: r3dUDsmf1-Lh9w4g2yZoURECfNXz5JSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXyDl1s4mlLHC6
 +RZo+G9eVTUgGLLjNDK6I1WiUzOvJ4COKccw7QaKciYFjjgwEFxtapglhYykbZq3P2h5rkcCc0s
 MunV1qIljgX7LbGs4c0S0Pv9V+24zp2PJz6UGZLdzPCDBwh2EBl6WtgPiW/E7a1El1mmF8lieSS
 ZQVwsFmfHWBX8s4cOoE0Y/rgoJA6x637oE/YHNjorSDT0swvyCd98dH26MczByMI4kLDpVcCVFr
 N9G3rN0IuBoZamFHWlO8OydNWgqwLahZ8OmrUCwnv2AWhDwDQRucpK4A0cHOJX78ygWNm0KJGy6
 bKP2u4iEDkNpvQxnF8/PRi5Pe/w+/fmBm8GN+jTlZk33ef0UkhMOOBMB+pX4gZbKW+0bM1d5MVc
 5zgp8j6RBcFyJXorfTgADQ6IyNACno07v1+Y+NeOS9hYkFfJJXf1x3bK/gedfTCswoswQT7H6xG
 ixhpvnoEdpRsfIdexfA==
X-Proofpoint-Spam-Reason: safe

The SDCA IRQs are split into two groups, those registered at bus probe
time (basically just FDL) and those registered at component time. The
free functions need to also be split, if the FDL IRQ is freed at
component time, then nothing would re-register it if the component is
probed again.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v2.

 include/sound/sdca_interrupts.h  |  3 ++
 sound/soc/sdca/sdca_interrupts.c | 59 ++++++++++++++++++++++++++------
 2 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 20ff5eac34eaa..6c8a9bbb9a196 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -88,6 +88,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 void sdca_irq_cleanup(struct device *dev,
 		      struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info);
+void sdca_irq_cleanup_late(struct device *dev,
+			   struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info);
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq);
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 6bbe65ac3d2f0..75957460fd287 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -538,17 +538,10 @@ int sdca_irq_populate(struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
-/**
- * sdca_irq_cleanup - Free all the individual IRQs for an SDCA Function
- * @dev: Device pointer against which the sdca_interrupt_info was allocated.
- * @function: Pointer to the SDCA Function.
- * @info: Pointer to the SDCA interrupt info for this device.
- *
- * Typically this would be called from the driver for a single SDCA Function.
- */
-void sdca_irq_cleanup(struct device *dev,
-		      struct sdca_function_data *function,
-		      struct sdca_interrupt_info *info)
+static void sdca_irq_cleanup_flags(struct device *dev,
+				   struct sdca_function_data *function,
+				   struct sdca_interrupt_info *info,
+				   bool skip_early)
 {
 	int i;
 
@@ -556,15 +549,59 @@ void sdca_irq_cleanup(struct device *dev,
 
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
 		struct sdca_interrupt *interrupt = &info->irqs[i];
+		struct sdca_control *control = interrupt->control;
+		struct sdca_entity *entity = interrupt->entity;
 
 		if (interrupt->function != function || !interrupt->irq)
 			continue;
 
+		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+		case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+			if (skip_early)
+				continue;
+			break;
+		default:
+			break;
+		}
+
 		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
 	}
 }
+
+/**
+ * sdca_irq_cleanup - Free the regular IRQs for an SDCA Function
+ * @dev: Device pointer against which the sdca_interrupt_info was allocated.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Typically this would be called from the driver for a single SDCA Function
+ * from component remove.
+ */
+void sdca_irq_cleanup(struct device *dev,
+		      struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info)
+{
+	sdca_irq_cleanup_flags(dev, function, info, true);
+}
 EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
 
+/**
+ * sdca_irq_cleanup_late - Free the early IRQs for an SDCA Function
+ * @dev: Device pointer against which the sdca_interrupt_info was allocated.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Typically this would be called from the driver for a single SDCA Function
+ * from bus remove.
+ */
+void sdca_irq_cleanup_late(struct device *dev,
+			   struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info)
+{
+	sdca_irq_cleanup_flags(dev, function, info, false);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup_late, "SND_SOC_SDCA");
+
 /**
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
  * @sdev: Device pointer against which things should be allocated.
-- 
2.47.3

