Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6878B2E040D
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813041; cv=fail; b=KNlHOSr+0/MeOnMrUPFW5loY+ORbo9CY5BAVhtF7A9072hYgw83KzBLEotoXQueMH+0nPmt3yT2H2GHE/meBzWmAp+5e7Jh5JMsrLOZhgm4kEE+yIUj0ABZqs77O5XwNqZRoLnGBixJ3oP6kQ2zzi6ki3s1CDxggsuvWXX9Y0mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813041; c=relaxed/simple;
	bh=sh2qDDsSjClxR4KCdu4B+eW0zK4FqudsWG5zwribGQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIJV52KRVdPLRgAhHjCW7mwIzrr5h7OqP5wAI8DJ2vGwJr5xa0houeXtW0qz1E5ZpU9JJcNZJZiAXJBwtxjD3dIR+UZ9onP5ndMgbyeoFOXY22Ma+l/kJsM9W4BOhB5QEWaRZNMeBMKRd3rmGtqYXqBoYfVixwYraGcpyIikYI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NaqpZQbG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Z0sTFbhN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NaqpZQbG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Z0sTFbhN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFErqRm3055475;
	Mon, 15 Dec 2025 09:36:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nk/CwdIupaLhxpP2/T1hV1Bd42VFn7qR/a2avVOh9tc=; b=
	NaqpZQbGVtAP5MRsbeYbqbNNnmg7VrK7hcrXvVPp3RMaFbZdoolNyiUjhwNIk5Oq
	TSdyCVp64BfQn0MiHwzCMb0La0OpK8ZFPh2oNm8iEHga4JoLNdMUa08uOA3qyBdU
	N2LmgHPbneCBKurWSahrtZnrV0NerZyaRsPlaQW6lIrT9r7NGRPdyHa5i8D8xh/E
	aZnu30URETvlOiWSGbrEcFUBAbzkOuUbFO3JMsB2wA0D0fTDnMltmXPvWYB+Z5Ys
	vBFVbXHphclGkCTbC0KwFfCRk5U8sT3g1IwWvTocwDvelbBHKIPVVvMmYbflaNu0
	SlIdUUpqcl/gmdUH1FWJ+w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021117.outbound.protection.outlook.com [40.107.208.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15eja3q7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 09:36:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOrpfS0UwfbRnFHJzku8jwvjNqQHL6517DRvhdyfvRGRa6vJqfieVjjdC55bBHsUnmUTW0CIHlf0yPX+zKu1NtAZzJsNdcSfYU9mdOA7HGa3XQuH+08AwM6TKmbpJ3/03GepX2skkBmKHpGQww6jxyu4EUGnGDpX+qD+o0LwGAuokppS4SpaURHOKKZ3KQzV8a+ZhcGCXfnsCWcaqzW0z0GaHHa0YVJihqEpdLRmJ7wovloTrXDLQOKNvoCyxKXluFpw5lCDqpgUSiDT8VcZnLzsAlTdWtOkoYUKTgiLlNfiwiQY8BteJajfMzqMCcksuNRGiVvrk+acfcOAadlAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk/CwdIupaLhxpP2/T1hV1Bd42VFn7qR/a2avVOh9tc=;
 b=XRvbk43EFtY1jKWwrlHbl9BP5AmrN42lT23QhGM6rmyU0P67zT3kuj7tFaAUHKGLAeIg+wGQUkzMAwGwPRu5iagsSX5Fpaw6R/n1of1J/rBj0YfIhmbud+0SZtivHi0H7BSUZzyVVD+1ke6FpHPiwx2ovrU9ASED9UI19aM8N0k/SXfx30/Wul0mdq6CDE5fDHAoPD8f9pi319/8o5G3lufiyf8wUu5aNFgshTqzrXDf/IKPBDSuDlqEY3tvEVGx4vDWt6J5CrVR0ujWxfIIuIflQc2MQBqwqaiVp9XHzwB2JAXo8vaOaFx/BPaQ4BamkxyaEkvlJWrZdu01QqDcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk/CwdIupaLhxpP2/T1hV1Bd42VFn7qR/a2avVOh9tc=;
 b=Z0sTFbhN2FT4+un7zJn2i2zjdI31FrJmQOrNDgJ4D3hxk7WESAwpQITSewYiZU7dDa7wlvnZra1DoZILqgKbJriwlSqyzTHCreB7W7TXxycikWxQSaJkXdugaP8AZpWEkHBJcP8rLLVHJ7RO81ygVq7EObgsdPAVYIOwQkqI7co=
Received: from BN9PR03CA0297.namprd03.prod.outlook.com (2603:10b6:408:f5::32)
 by SA3PR19MB9377.namprd19.prod.outlook.com (2603:10b6:806:493::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:36:55 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::a0) by BN9PR03CA0297.outlook.office365.com
 (2603:10b6:408:f5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:36:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 15:36:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 69C0040654E;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5764B820247;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 3/3] ASoC: SDCA: Add ASoC jack hookup in class driver
Date: Mon, 15 Dec 2025 15:36:49 +0000
Message-ID: <20251215153650.3913117-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
References: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|SA3PR19MB9377:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b9cd8ef-f0c2-4b65-0121-08de3befc6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lgDixdhlKu1hOZQh2cjEu87kfReMAmFbw/XiG/BumBz+8lucpigLI7EPhr0u?=
 =?us-ascii?Q?l4tLo6FAj6ZnsbTK6bVK4JOlszRVxHp0tAlJ2xY4C8uVdmQRDEt6BV+U5fz3?=
 =?us-ascii?Q?Q/Uxx2tfqUVSD7niTlnuX66qrc4mqg+Kcw5EUHHZpCC0Odok2qo9U30BUuYu?=
 =?us-ascii?Q?Ee/K2qixxUr5+2sVwpRQZtUJAKAOP/qptHbyF1yxmB1MjgD+4yFM3LZ56ZeU?=
 =?us-ascii?Q?H8XQjs+tjtA0hJxbGxQjbtClzo8EXSfhwA0REjurtYG3aRB5kstAJE5Ypl6i?=
 =?us-ascii?Q?od1xPJR1CqIeE6fIqrbweRxbso3oJBiz7sEljmPQgatasGoSLA2b123TnnOt?=
 =?us-ascii?Q?3bxcBw6DnkPSmtN3bcYT4pEXiAQ8p6HjZUyJs2AoJfHCEn+dOL9qmNkEOa3R?=
 =?us-ascii?Q?r7I7xmHiubCeF2xwyysdd6VLp00Tje5IKczRtzeQaTTTCEFV9veDuSRV/2J/?=
 =?us-ascii?Q?Dxq4HElBsY+YxivHEL+GJ9CCChIIcyQJzW0XweP4CnjKa8/hNz+up1qeE1hc?=
 =?us-ascii?Q?J2PgVlB+x0EOLouTocqoe2AHT3Lg6Ag9m4FPh3f92vqYYvjCgMUkH2/zO1iu?=
 =?us-ascii?Q?mnJXvlaPP9bJ5Q+4Y4o7SQNoahLtvaM/X2g7FFFlG910DScLTZAM4/lzJS05?=
 =?us-ascii?Q?SPB2fOAFPpniUAjrE3XYRFmJoQFT1JiIPazQ0GiJotbgsb1QomOoP9fd8DTj?=
 =?us-ascii?Q?WM3QPNfy3Kj5Q+qKq2/pXKfbNzMkFqtNQjV53sHzk3rKnSENjwLkGQ3qCiMJ?=
 =?us-ascii?Q?2GpCurMb4V/tlbU0z8Cxm++6B5Ow3uGglR35LrC7SCeJu78gx3svfcpuaBAm?=
 =?us-ascii?Q?rn4T+k+jocSM0HHMOyn+g1aDKAsjwx+oLMh3GQFNmjqmz0z/R1TK9f3RjdOj?=
 =?us-ascii?Q?SxFgYUQvpfjHklMsscIxDxGztNH3bpaMP/MndHtBRghEOa+ojiILbV5OzkY0?=
 =?us-ascii?Q?9XyrlO0m4oJolvohtLk0YzVaY+UuMiGZO1GSghMenr1H1RbowqmZkVM5n7lQ?=
 =?us-ascii?Q?fY2VeDNdyFf7uF72dl8k7tZBuyKaOwukaQQpDwIBNkF/Kl/X3vwhsChnd1NK?=
 =?us-ascii?Q?l+E943uRSx87YlSQ/9LtDzW0cTSzlDE1JGufbl2wTdkJOW/ZFXy+5K3S4xf/?=
 =?us-ascii?Q?EvQveDVFdDtjuvRGViE2GPSi+ispByeKBVsJ8iYbdG+wpgwr36n8QsKmqzAA?=
 =?us-ascii?Q?dpAki/JtwM3BiT4ljYEWqbZXvRvJr2d+5IiroJTQpkwfLdkKkO9tBhvAm/IJ?=
 =?us-ascii?Q?N6IixBql5oZrijiIqo88C1bfVrEwW+NnEpQj9jvjY4M3Akaw7vE9msKY8S0y?=
 =?us-ascii?Q?MXjh5MId+5qdETC3AggqY08aqfSq2ZmP/d6RcnCVlwr2OcbOWxCS6RBs9I95?=
 =?us-ascii?Q?kKLQQJ4Gsum0COVipPVLG/iUniv5DzSi492Pv6JcuGMuvip2bgFeRLbrbt9K?=
 =?us-ascii?Q?WIm9hXZWWMFTXJuHIWZqHyCx6/hdSP5tMFVAQqsseHeydplQoH+mb0n8K1kW?=
 =?us-ascii?Q?W/6nxIQXXO2l//ClCKd4zpAFQHnnm7YU4GKRya3hMuEnpSQkV62XTggWXdde?=
 =?us-ascii?Q?iPSmPnd7khUhDvVVqG4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:36:55.0006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9cd8ef-f0c2-4b65-0121-08de3befc6d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9377
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69402b1a cx=c_pps
 a=fJIB0T+C2yAfE4P2TQxPqg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=YzWcvuQMjQxWuX-EqYYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzNSBTYWx0ZWRfX4UObZ+3hqk17
 Hq+/kpkz6M3wuNwHqyzJA/7q8I5DOCTMxsSFIoBI5xl9wRww5niueFu5ppRumkht8Al9kW9UfIB
 X/2Kj4xBPSbf2/qDwM8AjYQ6BahwUkP3i0Y9VgW+Br7NWLcMuwdWhb0pZoeWzc2UqP8vRGQ4xou
 DIMET6hxQqjyljktDooYEnQm/lyZB3Kq1gcpHkfvKV30z3D/of4ptI3xgbbVnrcQ4KRqVlc7Acj
 zYJSV5n4YK5KMkLUmc+pNOJ4a0U+3xBaHeNmY+37GvleqeMMmYPK2iHN3Nmj7lC80e9dzQZ6+H+
 fmCnZP5wNK5GTM8/xkT2Trh/1iyjgy2ZfEB33yqfRmzz3B+ah++VbU8tOR3nRUSi20oqAEuOTsQ
 n4Bss2XzSgGK6ZzoC83i3PACJNia8g==
X-Proofpoint-ORIG-GUID: Mj85LVMZcPer_2ex54IF4Osvj8CtqjMR
X-Proofpoint-GUID: Mj85LVMZcPer_2ex54IF4Osvj8CtqjMR
X-Proofpoint-Spam-Reason: safe

Add the necessary calls to the class driver to connect the ASoC jack
from the machine driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 0028482a1e752..416948cfb5cb9 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -19,6 +19,7 @@
 #include <sound/sdca_fdl.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_jack.h>
 #include <sound/sdca_regmap.h>
 #include <sound/sdw.h>
 #include <sound/soc-component.h>
@@ -195,6 +196,15 @@ static int class_function_component_probe(struct snd_soc_component *component)
 	return sdca_irq_populate(drv->function, component, core->irq_info);
 }
 
+static int class_function_set_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack, void *d)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_class_drv *core = drv->core;
+
+	return sdca_jack_set_jack(core->irq_info, jack);
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.probe			= class_function_component_probe,
 	.endianness		= 1,
@@ -351,6 +361,9 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 		return dev_err_probe(dev, PTR_ERR(drv->regmap),
 				     "failed to create regmap");
 
+	if (desc->type == SDCA_FUNCTION_TYPE_UAJ)
+		cmp_drv->set_jack = class_function_set_jack;
+
 	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
 					   &dais, &num_dais,
 					   &class_function_sdw_ops);
-- 
2.47.3

