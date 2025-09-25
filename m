Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA40A2F6190
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797664; cv=fail; b=tO/YCplGiq0iqIFa1RZTyHu3VP7I/us6Do6X24bWs7EUh1rx7wOPHvZ2CNPW0E0KT3HcGJJZ8Jq6tZZKVU6KHRhPls25Gd2mz5aWSaXRNPULhODY/oaT2kb/LYepST+lEVFA10CayJe5nPL8kood3FW3TgDMIBkEUVLZDbBAOmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797664; c=relaxed/simple;
	bh=Drt8p1cxGtYzIGi7J9PZybw36IwDd7NQvcpDSrho7b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGvbx1yC3T9eUq5tDFfpjvMPvg2dmgfX40JMEGgdGb9mZlGNcsstYoyIrISFIbXxG90BZS38Yf7NR6HwTWhmp26MsqIc7QyUIaXD1RfIli7KRR7XCbbUNETtAteWWCFF1tHEWrwn28iBUbd2pKm+TMvHXqmFUHYH97mtlAiW8Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HNs0OjsJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OEG4NaOG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HNs0OjsJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OEG4NaOG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vI911785206;
	Thu, 25 Sep 2025 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rL3c0wIHe2q/ypYxz/Yc2xgvv7l2TjaY/dQKN3Xl66M=; b=
	HNs0OjsJZi+NATTAd/yjy1YDizGGtWkvtni2Czd4lMbt+dTH91rVUbHKQWOydBQu
	BqPqjvmaYRDBqQEfoVCbMdRb0SAqiveLIflFdDzuTkovXlxrtcL9tDLd6qG/fhVF
	ylgpslkgngBX6f3Erp65CxS3VhK70+feklT0NLxtKWPmxQZKfY3EumxOiJRNrIg5
	u4+w9LYQ6zI3fyr4GAlBRVIFNL7GqOReTvqTeGFXWy7wSE9+DV9YCbH/jpcGohC0
	94VhJLtUf2C+alM5iBeDq9b65xxL3ia2LHxKTSczfFOn2Fbb/nBcbFbS9UdbZBD/
	w+VLwHd5A4XxxOUT8l0rvg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022072.outbound.protection.outlook.com [52.101.43.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPUNx/Hadt8f5M18MjdVPYf8riJ1844GzJjGjK4XCbyvrmWS9Ki0VBt6LOj2ed3FIEVTJMZn8fex4IZE8uU5l0IvtOj/XfEWwTYht2IbIlhsLiCJoXzI8MAfeubgX/RXG34FlGUumiXRMTaKDGzdyLDtj7zA4XGTxGycYCkug+puACM1S2Dyq2GlFLZQOSqbPb5AzVyK/64+3sn5x2ccXvy7DwWvO5uh1x1RKTh6wJ1nCcheq9rdeMZc/vgumgqmXnyzjr80dmbmng4P5CIe7lBrY3/cJSWbhlWXw+bV24wIsUWSQX0RUAUkeSL/f8uhQXAspFyHjKVMvq4KmwqH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rL3c0wIHe2q/ypYxz/Yc2xgvv7l2TjaY/dQKN3Xl66M=;
 b=dTCDylM36g7v1xgJbEN+Yy790N3w/RJtGUD4B5WamSpp+S+yLFjTHq+aS6SD8sBajyoVY+6HTp1pvX1N1p5MPZnrRe0BBbEbq4wtFYrsVnd/5iXj8U6zpyc4IIhOvOr3QZPQRhZZWWZ+rK3acdhoXdlrACkBeGRduTk+t5rRF2fKp+qCd60dmiZiB5QNBJdd/D5QZEXoTiOAQCKRfPRu9CpBivQUs1EiAdU1LrdKNwYhhb8yj4H7PLrKJydc+HC1WjZMAgnjK0dv/MDAd75g6owp9XibHmCYg9yAMQba7QB/Os55rGzAx/ycDc2zV9HmYvOW2+7VtT+anmr+bCU3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL3c0wIHe2q/ypYxz/Yc2xgvv7l2TjaY/dQKN3Xl66M=;
 b=OEG4NaOGv73V/AWZUQQiiEBv/FSQ6tzvR5DNzvjTIRRHIChaAxnFZy+Vrw9ZyHWJ+XBJ09J+WZbr1FilMWKKWy0In2LQiU1RFocwIoUKlkVftO7Ci/TwCn16j6M63UH1z29x1fJtu9CDY5abCCEmBnXW3zflVE4Z71N3hI7TCSM=
Received: from CH5P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::24)
 by MW4PR19MB6748.namprd19.prod.outlook.com (2603:10b6:303:208::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:53:51 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::6d) by CH5P222CA0003.outlook.office365.com
 (2603:10b6:610:1ee::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44DF2406561;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 32A8B820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 07/19] ASoC: SDCA: Factor out a helper to find SDCA IRQ data
Date: Thu, 25 Sep 2025 11:53:29 +0100
Message-ID: <20250925105341.194178-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|MW4PR19MB6748:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 61671167-b884-40a9-dfdb-08ddfc21cf83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gg5YozUSC56YuKfKhb7+iT/HnCl3jExe0f+VnH4Wxbny3A/xXGwBzSuP7DoR?=
 =?us-ascii?Q?P5jS30W6BC8ih7FAv4ceh6tjCr1zLZPo8rSNQjgwbgRabEBqTtK/42/WU1h3?=
 =?us-ascii?Q?LBdUVGTmoj8uWLWqTRMJ0fbKzuvQ7eqy6QwX6a/UXdkJAi/cA4lZEed0iI0w?=
 =?us-ascii?Q?80+BoUuFLd63Jdvnm9Fumg8efaG/hS9uwKEB7WA7MVZRgQVqbVv1J7orFFbb?=
 =?us-ascii?Q?bXAwDFbQoJsBQHzLwkbfOO64CVKS/2WHZqsdvTWqKT+QJ2snBG9ir/IFW7BC?=
 =?us-ascii?Q?8pLZz7W649Fn6O9NtqeLrfOEPsu9cbJoNCRbriYzGUOludKJwQdmzbo+irl0?=
 =?us-ascii?Q?me0L0PcAGdrPKofQob3UYJiA1SHX4EsKdGpsZjz+vUFaTmWqGln0TP7EguLx?=
 =?us-ascii?Q?gBSpuRmEWUpEaWDclf4BmqgUImuDgSf6ISK6gy0ivFZMYhQDvm/xCqvuFbnq?=
 =?us-ascii?Q?+PtTIpqkHywJH3xk6HLpSiaENMo7o7LCeX6lfhQ7mzkdys1d6tHFEc5zRgQ7?=
 =?us-ascii?Q?XSXXcxco6NiUPPs2u7BZ2p9i9YfCehPx8RhD4h4kZYcvve9yPiA1jPqbHruT?=
 =?us-ascii?Q?LIRtqxx/C0Jw9SkBjKHPLpSnMmTyWJIG/H2lA8Qo8a1UTMWrRPeaEbtlj7vU?=
 =?us-ascii?Q?sThtoPJRYmmMsX3nB5J5B10WcOv22rrsvjswxbis4KqLkreTkLRXs2xyuiYD?=
 =?us-ascii?Q?ydX7a/5k819kryI64IvJmaeitnnbY6LMQIQarXE50BVTdH2eImLrXoGhmsQH?=
 =?us-ascii?Q?X6NhamiXDx0fkgGAjUk9F3hrU5ul5r2uD362308jHQ0jHCCJq0sqTRpy1fe1?=
 =?us-ascii?Q?hTjzcJsU/JJtfKpEfBJNTuiZPXTIumBC6Xv148w8x/6JH/hZPrcKSCvvYM+A?=
 =?us-ascii?Q?POwfXPUB1+paas45NUdFDOdKRwQMF5+JWzDDmLC1IJaPhM3O9kHbvn+A9mId?=
 =?us-ascii?Q?6j75LM4W85zrAK6YKKJbIWQkJk8MIxwDZvCT/n2TdD35dYNtFjGDaK9oSjiO?=
 =?us-ascii?Q?q+2G525nxUC7bo0TLhBLFBpR8xDC8XhiCbk0BaOLrATl9j/QJwodC1CUl/yr?=
 =?us-ascii?Q?UePl6/IwEk8vA3kj/oOw5QH7zrgkAJQL6AjLsqP8MKDOn++pd1O46LhoyQIm?=
 =?us-ascii?Q?K5d0JRudqTxWLPXJ63wmxhuDNKDUBs4VOqHDo15eL01TA9dzxgD9ugMpsPD4?=
 =?us-ascii?Q?uch6fMQtNLzdw5dVVn89P7ZbtIkIIl/r1RJEhqAamghFcVGRRmAiW9PCYu2X?=
 =?us-ascii?Q?4+NtNs3GqW4iYYMXEk0cTdwLVcNBqo5AgQz/eVPNQRVfo80j+JNi3UajGbjm?=
 =?us-ascii?Q?sKIiX0QpbSGTudXqJzyUV+D8TGw4d3KvFDLH7I/jwmINYYljNsqpOOaOB0xE?=
 =?us-ascii?Q?Xx1XAES5gk7AMXSh4Ux7mvLp8Z/0Th+ayHROU3IBsnarvpmjJTHprxfHkBST?=
 =?us-ascii?Q?HpEtz9EHi5czRZBTd305EA5xWAR92PZNzn4XWrVAPNVWZ67jSt+I/WdKq0AZ?=
 =?us-ascii?Q?gpaMblmm/TlvYHiEkrLTn04LJlMLg+oTemdh?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:49.9796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61671167-b884-40a9-dfdb-08ddfc21cf83
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6748
X-Proofpoint-GUID: d_Am_ONeAB8HzRVlcHta6LMSPzCVBCLC
X-Proofpoint-ORIG-GUID: d_Am_ONeAB8HzRVlcHta6LMSPzCVBCLC
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f43 cx=c_pps
 a=DOLUWlwAjR/f8r/QjnAHxA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=PGrNOaqWq3pGZ8No2E4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXz6W49gXOAxNY
 EDVZ7oxdd9qtptRErFm+hMj83bAb1Pi7/4WROzlow+VI/6hsEj5fopXxnSEqlpiyv0GF1x/9dZd
 y11zkkkRPI6fXS5QKtUjSBt0OrrKVGFIO14fC32tUk1e8VQTTSMYDMAWohT3FlI4K0Iaxojfhx3
 mLzgKwP4+0HYvT61RfQi2hDj6MVNdzUFJX0OZ+VVDBFWsH12BW0EuWCs850mV56n0S6WGG4beJZ
 fUPVyeKvzinM9Sre60g4p5orby4R+AgvqkKfHBJrbtFddoTXN/JfypxhKXPp/vuTcxyU0tmVK8g
 i0fj02+arrlnwWmAuyBihAIVImPZF0T5K0eOpalQNfrhuKzpB88iV2xiDvXeE8=
X-Proofpoint-Spam-Reason: safe

Add a helper function to locate the sdca_interrupt structure for a given
SDCA IRQ, this makes the code a little more readable and will facilitate
some additions in the future.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index cb7c7a6f356ed..2b3bb7d0cb443 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -341,6 +341,24 @@ int sdca_irq_data_populate(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA");
 
+static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
+						 struct sdca_interrupt_info *info)
+{
+	if (irq == SDCA_NO_INTERRUPT) {
+		return NULL;
+	} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
+		dev_err(dev, "bad irq position: %d\n", irq);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (info->irqs[irq].irq) {
+		dev_dbg(dev, "skipping irq %d, already requested\n", irq);
+		return NULL;
+	}
+
+	return &info->irqs[irq];
+}
+
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
  * @function: Pointer to the SDCA Function.
@@ -370,21 +388,11 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			irq_handler_t handler;
 			int ret;
 
-			if (irq == SDCA_NO_INTERRUPT) {
-				continue;
-			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
-				dev_err(dev, "bad irq position: %d\n", irq);
-				return -EINVAL;
-			}
-
-			interrupt = &info->irqs[irq];
-
-			if (interrupt->requested) {
-				dev_dbg(dev,
-					"skipping irq %d, already requested\n",
-					irq);
+			interrupt = get_interrupt_data(dev, irq, info);
+			if (IS_ERR(interrupt))
+				return PTR_ERR(interrupt);
+			else if (!interrupt)
 				continue;
-			}
 
 			ret = sdca_irq_data_populate(component, function, entity,
 						     control, interrupt);
-- 
2.47.3

