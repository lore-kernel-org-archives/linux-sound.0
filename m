Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F812F83DA
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797667; cv=fail; b=TbbiVWKQRSrKc2IwCUHlTSpRcsEhSiLYCCeDHroI+qIiVmAEAOU2WTcwRs7SS3vHRV3pUvcTVC8GHA6kNgwnhR9x0QgbT5SS8UOHx8IYt3LdFQ3vXQ/mCgkCRxwqAYL2zQUav+BTp252/sNA3+M4P2wFbAA9bYUb5KFD6t35jxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797667; c=relaxed/simple;
	bh=/6ukS7uDJNbAe3TDMWm/CryUqzACMB1RTwAiJo1wF9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1raPGe6MVHeZZGWM2UnNFqX7TBWNH8P3L1N97JASbJfPPRbdIEgLakG49yVUp+BfNRcFu+6Ct9pzs6FBuwTdbgp3UeTSLto1aaVbWtIzyxGp+6yMQQvCv7GKMZnSv5PB90FRsDvzqKMY3QIwjHVBpn1kzdm57ZMIwyS64EgWPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U3ozvz93; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dHmRgaLM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U3ozvz93";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dHmRgaLM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vI8x1785206;
	Thu, 25 Sep 2025 05:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZAcIBrm2cAMZF4hpVg4h+PG9iG48zhaUnrKl6MXMSe0=; b=
	U3ozvz93yARz29Uz1d+DIrdQS65Dd1+oS77n3b1SLzwaxcYBfHWM1SlRMZZ4dALc
	JgBIVc2S6unZzU1l8cWPWUVCCHwtUEsu83YtV/bdwFVJB0xd9zhPpXqOvZbaU5o2
	JflWbP9fg7Dxlj+hDLORYfzordNmTel+NPjT1RxV5gesRGzR2DPBu5NOaosItiYM
	srPtRkZFG1pGbCpPoSxEnOq1+uJv3C4aDlnRmgZJ1IIJvWTzxbNiE94wIw8AY70h
	oWG8x+uLTOQdFb69+d+tCVNfAHqDeTUzhh1T2Zq08HqLAXA5OD8RbEP/hFdM2L+Y
	JCvYtBFoblXFDwNPN0InnA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020130.outbound.protection.outlook.com [52.101.193.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqmDSlJsXPt8M12D1dC6/AidrK5VKsSOePmBO1A9zRUKrhHqP3/gXx3JO8lPgvtv/dMJvI/OCsceCP+fDVREAJe9DsjJI2LlWUjA1DHfNut3wuFPz9enVIRQdKSDRu+UG+T6cEcRHGkrNJBkkRtCXphrhVz1AL4OAeo5lD/rclht+sLcsbxySnOdQbqc7tTOntfGPEXneaS+GBWohRlNqVrpoIBf1+SPlBovUA17Gwb/MQeqxJpFlUlFhf0mG6DJKZUoJ1vgY43uPq3rr1/D3d23mL3gzkaicvxNtMsZeP8Zy39PG3DlL25hCwobM5B49+g/iy+A7LYKqeUYmjIRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAcIBrm2cAMZF4hpVg4h+PG9iG48zhaUnrKl6MXMSe0=;
 b=aLLwTN7UG7QKKfUUfLX6zDrwvnAfYGk9WnLg/IQ+zw3WvC1JrKhIufmf32LaPrJZtHJN+nue8hjmK991yAgQglCWjcAk4JYe+AVs/xcud/STrmFvIn1ZTnhaPvtaI8hQfCg5/gej4ENi4uPSWrF3Mxu1fNLXoykiy2EskEZv/YD+kaIbm6b1r+W3gyqRkOEvLsn9L0NTPdghK8gvxmjHS3CJ2nUc/YVMCaLMX1y1Dbp/PmpF3Jn5xZ2dhyVxcPNVsFoGMzRPrEtHjTooqnXcyqQ5swKvn86P2eYkUXI94uoaOr2qibGmZ+9nV9HKdhJSb2j7tPwjpQN0oSusJJ32jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAcIBrm2cAMZF4hpVg4h+PG9iG48zhaUnrKl6MXMSe0=;
 b=dHmRgaLMHd+Xf5Cxg8RQpkuM/Hx7gF+Z6OCUSq8mj7K4QiLx5eshqT/jf0uJZVRumK+33y6JIAAkcCJkyJOUDe7uUw3wU1e6oIE+QXSphIAQ45X/UwWOHHHIEhyEx7nc1QJ0TVYWKFm6aocMoTiib84zE9Q2Yr1hkRGO5EZGfp4=
Received: from CH2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:610:4f::24)
 by DS4PPF72DEE5B0B.namprd19.prod.outlook.com (2603:10b6:f:fc00::a27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 25 Sep
 2025 10:53:48 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::f7) by CH2PR18CA0014.outlook.office365.com
 (2603:10b6:610:4f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 14784406555;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 01C2B820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 03/19] ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
Date: Thu, 25 Sep 2025 11:53:25 +0100
Message-ID: <20250925105341.194178-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|DS4PPF72DEE5B0B:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 589ac1e1-b20b-460c-528a-08ddfc21cdea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nljXuYS6MBjhKL/qncLbLmrcMdSwyWLICilhAsnuHPEKMN/g9ScftNTN9KMM?=
 =?us-ascii?Q?UQfIfcdTig21C4JqoOfLyDFlz94lT7kEbu2yfo2XtMZHSR9N31LBctC/II+D?=
 =?us-ascii?Q?eQ9/x/+Sl3VPUk3wqHUOetorpQGMI9zGzFYvx6dm/Frmc32tLXDK5P0rbqbT?=
 =?us-ascii?Q?RHIK1sumFd/dU5s0kWm9diyx/sEb580TPzkFysa52GXZAdo1CW9PwsfLqMk2?=
 =?us-ascii?Q?Vvzq079CJw50EQn9zwOD+R1DlKBAmkpho1rF8+iHz8UZDAKk1vJfeF2tFfvb?=
 =?us-ascii?Q?9xehN/Nsy89AGIxWfre9cgMkl5XgNWn7+rWYJauXBEDbc4zVjS96YLq2vAK5?=
 =?us-ascii?Q?bblr0SbY6aKnys3L8rfAXEv63Cnpw3gAQu/HyMp1TY86qz+u3dgnH6TwXg64?=
 =?us-ascii?Q?o9rX8piAZOQN0Pimbc4r3640er0cfhPkKfzfucaWOAxotOOoE9N75+AKXxYk?=
 =?us-ascii?Q?MZHmcy6o9/kjOnUfbDOfQwQ+dMetcQDk7IIEakQpbKJpDkPcGzIb02DXi7VC?=
 =?us-ascii?Q?MKe/r/wLitEY9ePTRjRaRxRCB9Ei/oFiNlhiA/vRQpXIaLZ8HKnMFEsbZ6L9?=
 =?us-ascii?Q?vh89ZjlOyEucatLpxrAD//6tVKe4NU52+qdNvvZ5PK5enDt8u3oVcUT/7ThX?=
 =?us-ascii?Q?4aj7KFWzRGapc2k4HHA5F0zfQYuMcSpYbbypf0eICslyEer9Kg5Ek0OvKiPA?=
 =?us-ascii?Q?wypHt3BHRQ5+GUVDTnx/lOxjXO491n5QPtBbM8+1eK+pqnqeiv/ZMYDc5DQu?=
 =?us-ascii?Q?XLLGJ59IEUnAKPF2VzxR2mNRjFCPiIM2EOnjwPqKIY8Km+BxLRQcXFSx3t/B?=
 =?us-ascii?Q?fbeiavMwN+gH6Dt+0NfcKw0+sYAW1efbY06vGIwKSB6VUYdr2Y170IHXhG2b?=
 =?us-ascii?Q?Ai6/ENz6jvaoV2Wt3/3YcVqfEHA54+mtyBjCCpRPxG9k8FeVAQO0kZbBrafe?=
 =?us-ascii?Q?QrwyB5RUoikoQrhmRZAUuwT21N9bS5UKVhLhpSvjPUzXOIwokMp7Ig9qirEK?=
 =?us-ascii?Q?Hn7AB/a8Gx3WTTsb/cK98e7GIZkceOGwx6yVDyFNjYHE4IwQhQdWry3bO1q4?=
 =?us-ascii?Q?qychS08vDhGsE5+Vf6q5oqJasqIm6pTe0IWT+Py3DFC8xY5ZBgRXsdD7+GWt?=
 =?us-ascii?Q?pvBqmDJUJNrdfaScLK5LYwkgbFBFbrMzasVR+qvCePHwCpukMOCddJu/eiH2?=
 =?us-ascii?Q?C446c19oIRKiCkLWrDaGAc2eVv9a0Tsi/KlYRKv/9VF3Vv2FJjUv/AAoO0x9?=
 =?us-ascii?Q?PqEjvzogGiM1u57MMtg1cK6GVz8ZZ/b2nPFpfdiGf0LHCfuWCoZw/Ah6DXYL?=
 =?us-ascii?Q?O17iAh74Mbpxs2sJtQC/bV5HYfLqkXw27mU9nMTtpGwgCCYW6njY6jQYyTuP?=
 =?us-ascii?Q?Zzq+0SxTsWi+CkZ7Se7aA1hKcRugodK0Ft6b0qjRVyBPMd4e3Lr9X2it8C9z?=
 =?us-ascii?Q?3PBwfC+gDO0rdCbieCGTIPkAh12DUeAEV9u+gheQ6S3MkqcKimfIbjRmpMy8?=
 =?us-ascii?Q?Tl9GiZjo/JnXUnsvwD6utRpW+2LMWJxnEYNj?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:47.2971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 589ac1e1-b20b-460c-528a-08ddfc21cdea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF72DEE5B0B
X-Proofpoint-GUID: IlbXSfrz7dKoBPaD14pWercFDoHR8Mtu
X-Proofpoint-ORIG-GUID: IlbXSfrz7dKoBPaD14pWercFDoHR8Mtu
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f41 cx=c_pps
 a=dns+zr8aCb1XxuflM6NUAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=2W7Bv4yKaM6PJBoyyCIA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX96tuFR5o6WUU
 IPtUORzzin/yRgnblymPCzxeqzDaAfT0fLTjzuzsiNULtdo+DvWZ1MCcTYWTv2kQc3WInQyPnrr
 bkRlNVn4Ig0lHDEtgapm0sLFsdlYOKN5eY0B+ydAiYKttwBIlXXDtSxYslIqKLlSuJqdCETTqMh
 xibXst/JQdZqhTc2e8KXe8tJnSIEDGBGaXiMnmaaD2jTlEnwodXSae5ZehmyEJkaSlhunMlsQdi
 o7gVj9/FaBEMbd9YqfKm7po0zzEo9MSc+CGN1L5UYPkpCuBkHDTrWrweuulMqSlEWvkO2M29W03
 +aSoUGjoVTHmgOx2CBCtLf3eFTd3aP7CmSj3tMbM4p/SQcajQSkjpSVHPH6wIw=
X-Proofpoint-Spam-Reason: safe

SDCA interrupt handling is a bit odd, the SDCA IRQ registers are
defined on a device level but the handling of the IRQ is at the
Function level. As such the regmap IRQ's PM runtime operations need to
be on the device itself to ensure those registers are available but an
additional runtime get is required for the Function child when the IRQ
is actually handled. Add the required manual PM runtime gets.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 42 ++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1926c0846846f..9295d283be910 100644
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

