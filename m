Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD025A655
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028130; cv=fail; b=uHav+y0TElygrLY06Y24NDt9KMukqbt6KQiN/aGnTwEOrll0Y/N63sJvI8RcQ6GS774bJFHhJ+fhFpnHV5gAGbprRGCYg0GEIU4ysyNIQiGnumoQybFo3DwCmXqkDH3q+2T7nZj7rsu0eXdrfC1LQ6u3LwdRYz0CfdWQxSlh3Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028130; c=relaxed/simple;
	bh=pANQaK8EohszXzyHzL6m+GNmOuc+wj3Hs48hWc3bJvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYXcPywsznSdL3Vvp3VCPIE0ZL/cDUmMXStXjyrPc+Z+saSGVutds8ygANdICeJc6nalLARsXJOibiDXmrVzm7ZDZLDnkmeCfpi8sV3feiYIhgBHYBtBpdqStxePbnsdoBsYGjPO5iX6fJmZ1edTs/+/kI5qI0XHM4pSWpNqGMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LjSZ0yXA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iaEEKYgP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LjSZ0yXA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iaEEKYgP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P5TWI32324916;
	Wed, 25 Feb 2026 08:01:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Yvr9zhnlqnUmHJZBjIPNbZrbsU6HRx55YOZl3iOg7VM=; b=
	LjSZ0yXAuMmeK7SaPAF30cfv6HU2xTb+OhK/lvloDVLmMNuLuHzjBFWm0xOBdkr6
	rueiuXHiwn9ZgFyCzNIDNzXmAeMoJLg8Nh1c5WOCjtF3qHbctQN1+HGrybrq5GX1
	0VEa7AkqwXEQFdLXAb0S6AuHBloWD5iZeoxSKRScmGrflSWhP7qyivzGvdOIKovy
	1sfOJszbxYeMov0GXde351+r8ht/sPrM3tCs2nn6sUS46ZGr9j+ql0yMZVr1HTIe
	6h4v+4ebmpLwPqXEJQ+zKXvmmhAasQjRmQxIiRjMYEV7lTyRUurTKCDy2Zdia+kW
	WCZZkQBnNAaSIoLQnAvBeQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022099.outbound.protection.outlook.com [52.101.53.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j4e6x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 08:01:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFLOgQt5xW9gEb51MaZymIXARbRAlXyu6+F0bpxpkjQRfuAVzBfXPijngW10qwGmctFJZh4qcVVfhwNpY43Nzf7IgvEM1FI66vdhj54g8Zy8rn0B5XmDVryxZ+5UNTK26FZ+xM8A2G9TWLHY0+eBI+kA1ErCb9yTHxJ2LKFGK3ZbzkNWFrasNeJfJdZ+4pibSa0i88YDfVyOjobXAbo/VAdjB7I42+HsnSpmfmiUrCRUV7fCreUBR3N9HgzGOMGpCYiQ4FgTEfo83ahfwFQuPmQjLSPp7klWMGxylW20k/PP5O7oCKfvoUPeK7Ehz7AcSeMhN4pAe8m1OiEhEDkSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yvr9zhnlqnUmHJZBjIPNbZrbsU6HRx55YOZl3iOg7VM=;
 b=sDcyjlJTFkQXFM/mf65iR76y+hBBbf04EK0fUVQPSbZMHCMeaLcvzmA3DU+XFzkx64206JUc8x/0FvxGhTTmUn118RUSjNW3sdCOtvuoOpNqDjG5+oC7OuQrfNiaLPppOgma83CfBvRuNvDdegRTxjvwyD6ovPKxJKJrFY9KGKpZRWEcXuXlu1k269+AX3dHRAWHsQ5qrpvlE4984insuH+lqA/qMuLQogydIc/1wO/nq3snPLeXn/pWYmvseAonOWzQejzbF6zdlaoEYFC+q+MT1z2R5B0nAyScl3D7CfYDVfQt2fHxkyTLavVJaGDjJRda1er8GigEPwvv6llxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yvr9zhnlqnUmHJZBjIPNbZrbsU6HRx55YOZl3iOg7VM=;
 b=iaEEKYgPTTOui/N0YwCis7/laMk1ef8pRgqU+pwdC1gVidluWjdMw/OoY5CfTHnVA4WhapnC1I+iRlA1jZRiEOzyFezM6qxA16KRg4e80OymNfjSFYD23NwgP9DavHetr8IauV34dOwWHvvWcCFDErwFIPv6Je+qcPaWEOHhyuI=
Received: from SJ0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:33a::20)
 by DS7PR19MB4453.namprd19.prod.outlook.com (2603:10b6:5:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 25 Feb
 2026 14:01:25 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7c) by SJ0PR03CA0015.outlook.office365.com
 (2603:10b6:a03:33a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 14:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 14:01:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52AA6406543;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2C97F822542;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/4] ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
Date: Wed, 25 Feb 2026 14:01:17 +0000
Message-ID: <20260225140118.402695-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
References: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS7PR19MB4453:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cbac6c23-5635-4105-c59a-08de74765ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	RkqRTjZsjtzyjDhOGlJaSewdIHsnxFIdbl1vKPQusAxzMQYOXSle3xPpbIC93NHROrnSXAiv37Bfk2X/G+0JQNqBBSGnIsNsNImElvN3rGuOqAnw1OEwbsZ+dQfGcDYiUBAZSts1cjNwsFZO0HDwDM4qOJUO8PxbxdsKwBHlVvr/i3MGSGE1Q7yZSHJJLk+pFrRMEBGhWfCx+RVB8UWHJ+X15uBhqexkTVsAQgx8Uwuur+UGoirNMuJ6nobRDTkFySV4rn+fyuNDJ2xzhhiVLVGZXAX/ZDsOUy2g71Y2d2yJCqGaEPHyDp5oeUpXx+asijJm0rKer30v+GBwCCkp+9xZR275jLAPXl5DgnAd4ttSU2Pv6ATjys8Situmi8DXG1ITmVZfIUIZtUq2vLeBZ/GIDodOhU70utdas+ikYKIL0FRZL+EPlgjpTcTVNSbIXVLwKYV2tLenCoanFO75T/4M6EMt4LBjnfz+BCty7Xn7FSM2aws0+IBQzwYcTrViH54Og8CILF4kiFZL/x6MY2iZpJmrdZ6JHFE6skwizHN8zG/a9y4Xa72NmGUSuaTTAZhux1Spj2l1/302j6OvedUyh8h2CHO4YKic8xSHbG7q6Bds/wbwEHBJvlfd+S01ciR59yk68f90ZiSXYOpszSyxGssb7jt1OZO/7+gIXVM85wDd4VRQ5ekRQovAtLORk12QTDbarmPnOCQ8CsFMT3pkQulLxTxB6QWM26TbggtdO3Nnb+DkSgu4CNJbT9h0Nwb6ADvTn2iHsU4VVgZ7w/9Dz0Hjf+reLLbVvfpcBzFdJvDHNOEXtuzOEicav+QqxG/TrcV5lw+jUsoghTVMWQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DxJmlMLI7wuDzJQ7oFQcJPEMeRwWg/O4Lk0jvP7sqK/YIw6uguVohJSq8gSWeO5PPwN5PUDBCf4AHrN8EGS4cCpbN0o5m8EJECvvWJ6j3k19nGEI2q80mjTsYlJcVhzRYUQJ3Zvz9cnVKMbiB7NpvfwsPV/7NXkrTw71SoGc8dvkXSeRDleom/nSQ3uCH8fnGqWwoV6Dfd8iSE9LTWvTTG8PkDV9EAYwhnDvWA68vbqri5Q2We3ZjSwoZygcV/DHSlaB5rSeNnnZ4OUFNkBP5DSAzs8YrYJxE8OoxA/X2YFkzIrnQr6JhyVtxvXEJ3OA4F7+N2EgwUnGREZzvEcmRMQi45Eu7odzNybSumisUSRzcjaNE3nG8j1XPb9RR/4KLU48fP4FfTSS18vEs7ycyOCbeAm7jVq81jfgeNQUFrvn5/WVkb7Atd90NtD7LArr
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:01:24.3170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbac6c23-5635-4105-c59a-08de74765ce1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4453
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNCBTYWx0ZWRfX1lgCCpdaCbkJ
 wFKLzmhLt9VPiHEcES5oJko5u8slZ79ydzGE+C6s8IK/x456DyFVKMhg8VfqxWdbjwjnjWYAuz8
 Kqoj1fArT4sfcGKqZw2q/P9wmuFA4CYrmouAXk35qM3whfyH3/Ft6LxwVyeCXg9y+GtRvlJrbFF
 KVjHV3QYc2XbCAVSsHtn+woRunkviraUbwuoLDMg2yRHGk5cbekpqrb9DMR8tcEm++6odk5WkHk
 YV0d5o+iud0+rG70r5pnWmWAMjODARdfqEi8Lges52L7lRW10QZN36ddepF9sOZt/7+RXJrs9ir
 CjaKIhYmldjPV+1W+JPGrCzFzQgOid8UjzUSxsmv0PG1YOScqwg7pL5VrjX8mtVTQbrfhjkuWUo
 JVrNkDWsavkEciDRANye8J7WfcSqEjan4Soka0c4EtL8+MB8xPTkFagDjm0rHaZxFfvK0+6wRo2
 aWgk97X9/xQmAGFHoqQ==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699f00b8 cx=c_pps
 a=qlJ2pVgRLkKXdQ82XtY8Hg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=g530hjAR1Ctr6Iqj50AA:9
X-Proofpoint-GUID: YbFb9wZ23i-57t4EB-nY9HYGs5QHk3yp
X-Proofpoint-ORIG-GUID: YbFb9wZ23i-57t4EB-nY9HYGs5QHk3yp
X-Proofpoint-Spam-Reason: safe

SDCA measures volumes in 256ths of a dB, whereas ALSA measures
volumes in 100ths of a dB. Currently the SDCA volume controls are
mapped to ALSA controls by mapping the step size and working out
the number of steps for this mapped step size. Due to quantization
of the step size this means the number of steps in the ALSA
control will rarely match the number of steps in the SDCA control,
leading to skipped values and multiple values that map to the
same volume. This is not a huge problem, the volume is still
increasing and the differences will be small but it is not really
desirable.

It is simpler and more accurate to count the number of steps based on
the SDCA volume levels. This gives a 1-to-1 mapping between control
values and register volumes. The TLV is based on a minimum and maximum
volume so still accurately specifies the volume range.

Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_asoc.c |  6 ++----
 sound/soc/soc-ops.c        | 12 ++----------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b6536eeecf58f..e6f7c2778bec5 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -841,10 +841,8 @@ static int control_limit_kctl(struct device *dev,
 	tlv[2] = (min * 100) >> 8;
 	tlv[3] = (max * 100) >> 8;
 
-	step = (step * 100) >> 8;
-
-	mc->min = ((int)tlv[2] / step);
-	mc->max = ((int)tlv[3] / step);
+	mc->min = min / step;
+	mc->max = max / step;
 	mc->shift = step;
 	mc->sign_bit = 15;
 	mc->sdca_q78 = 1;
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index f966d4e13c7fc..8ae6609ca9618 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -120,25 +120,17 @@ static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int re
 		return -EINVAL;
 
 	val = sign_extend32(val, mc->sign_bit);
-	val = (((val * 100) >> 8) / (int)mc->shift);
-	val -= mc->min;
 
-	return val & mask;
+	return ((val / mc->shift) - mc->min) & mask;
 }
 
 static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int val,
 					 unsigned int mask, unsigned int shift, int max)
 {
-	unsigned int ret_val;
-	int reg_val;
-
 	if (WARN_ON(!mc->shift))
 		return -EINVAL;
 
-	reg_val = val + mc->min;
-	ret_val = (int)((reg_val * mc->shift) << 8) / 100;
-
-	return ret_val & mask;
+	return ((val + mc->min) * mc->shift) & mask;
 }
 
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-- 
2.47.3

