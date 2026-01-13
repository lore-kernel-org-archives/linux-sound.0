Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24232281370;
	Tue, 13 Jan 2026 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309805; cv=fail; b=Pa1FD7c6yPCIE2NOfZzQNlFgb2yq7+ewCc1aZI62PwI9krQL+1u75umykonCfffmdmai+YN/FStfBEM+ARl4hbM2RdPze8rkdD7MkvFvtP35kZhpvycvMYWlan1mwE7OfB/CVnA3F2/aIajsTaEDuDc+MtXiVnLMbFGv922A6mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309805; c=relaxed/simple;
	bh=/WgiLh6N6J9xsG7jUHuSw6z6cVNV8SCv3owDicwe1gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ak3y3iDlVBLdDXRFsV70sd6wHhYtZTolYml4V+WVca7MlJ9Cdqw0GC+sqZ+lpJtF6+Wk2i3gTjxQ04HmodFgGToEkx0Wkyc2G7C46tbJqCECvQ+wF1u2sEa4PXcXbpeKMMBRJ8cviIVXeBlv8/7yX+5NjsMP6vXTZJN8WnPqy7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=URvh1K8F; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p4kQWMSP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="URvh1K8F";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p4kQWMSP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8cjWx2361235;
	Tue, 13 Jan 2026 07:10:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=LWQBpYEFWDoEdbCR
	sviKSB73lJ8SX5LQcXICy75YkdE=; b=URvh1K8FD40AA0SxFQy9I6/gOxURGeI9
	F6rTCMZK3SEsLgglA/uPrfMUS2s/0fTvgv5kBd5NmGxWzfqUVpnnbTJkMw+rB3Y9
	HEMAZMsygNPW3Eem1OBZ9z2ThxvsGuHV2c0DSuS0TYgINsOp4JqLV+NPUq6kn2MX
	Xiz4qD0ebz1P8RT3fHRI43wLxWKBuxEwTKpYTCXDjnbgR6VSzMzV0yTLg6SeaNSh
	cNZmoQhEiIq+sQKs/AL2bH+ZI0puGbLMOeEr/dh97LsrOOox4iOPrwLtgBjDU3es
	8iPMrcRpljqOTC5rSm5CJjQFvxY0oQq+mu8g7JMq9W8+HNIGmXAB/g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020096.outbound.protection.outlook.com [52.101.56.96])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n312y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 07:10:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjotbUqRxY+GXAyKUWYCYZHC3xd6BxhMVzkU5YGDbaVscUM0HzUra7g1MzjwJ/36hFYiaO1aW6ZaW9lTbbpu7E5OtV4YGpdOZjUlbE3Yi5w1o/1x5LKxqpdlrlPgiDbVfrYnXLLsd5DS9j27B6L+ijO1ciy0nEftV57kDFtTAgOi/021lnOIsijOOZWEd+rXHzUfzOx/rk+KuRU4QU0ICP/DcjNy0ok7PaNAYCWuusa2DNeFlOeL/V6RlrZWediM1LCkfim8F5usPz8SmCF8epwFSK3wgwkiSSt+kbmz5nWy/QzGEe9mliTQk6QwMz6f2wJn9R/7asrFGuNZdQFqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWQBpYEFWDoEdbCRsviKSB73lJ8SX5LQcXICy75YkdE=;
 b=m5Z6dKYPvEA0PirYIVhlDJPDbJ7AeBh/kmVe0YuTjv9r7ZT6Ltdld4gi/oeSeQ7JeR1gKUOqMLNEiPyCw9srXDD/Jp2EPdgIOx1wtthqec0bQt9dBfdZBqy5gR3lPF+hUf2YBnJepE2plTMAQJXqiYK3DAkaG/cm7neBukU5/IAFbBt52qjfPqo6aEVxX9yrQ0mVFRyLHVFWy15nvz0YFYnBuQRXKRezW0zFzpThNuKWCeQAlJzrdDQhSEp345kwz3eTAUXQH6eTA6W+qpJryJ14kUGKBPs8pEYzP03FZENlx7lm+Obw7mshlxLbg2kXQxWUBgSs2mEyTyLl5Lvbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWQBpYEFWDoEdbCRsviKSB73lJ8SX5LQcXICy75YkdE=;
 b=p4kQWMSPBHWbvJAX8Jr82o5IIUs6ns6OFmo1XlwG6JFkDkT1VdZVRcmfKXrjtV1+tvo5FyWjcBdl/ie+ySASlacrHznyH3Fdpg/F3AFKSo0mLu27giquRoI7TUbzHBKdjIMDU1dz9dLFGPhbgIQO6J4dV8oobCEKaQQy1J0RG8c=
Received: from PH8PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:2cf::6)
 by CY8PR19MB7105.namprd19.prod.outlook.com (2603:10b6:930:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:09:56 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::1f) by PH8PR07CA0032.outlook.office365.com
 (2603:10b6:510:2cf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 13:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Tue, 13 Jan 2026 13:09:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D9DDC40654A;
	Tue, 13 Jan 2026 13:09:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CCEB5820247;
	Tue, 13 Jan 2026 13:09:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cirrus_scodec_test: Fix incorrect setup of gpiochip
Date: Tue, 13 Jan 2026 13:09:54 +0000
Message-ID: <20260113130954.574670-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CY8PR19MB7105:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 25c432e2-2ea7-458b-4e67-08de52a50c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HKeEfjRVbEje6AkeU6y27hR8t6oFB9msDlw8ct1e9mp0QWubJWImFApd64ze?=
 =?us-ascii?Q?ce6me+WMDk8yDi7+1lqkKoNzZ1l6YRO75SYMA1pVDpIkauE3AB4VGYimhkdU?=
 =?us-ascii?Q?WVhkaX5+q+jH95ilLldj6r4DJfLq/c3nVY+wmU82YHnwhU5LsHWs9MUNEya8?=
 =?us-ascii?Q?vFebVl+pF/3KM3XJpHKk/ZuH1bCsyXPiKpfg2uDJknTgH+MZ/7rhm2hU9qGe?=
 =?us-ascii?Q?veyxftj5sBEXXG0FiLVDEHiWvU//Sr1/mr7VjP/J3y0xPX5/MqTFcqeEvUzS?=
 =?us-ascii?Q?ZHfxOCs8ps4ZOz7YqGEKC13Ttb4CFe9XC0+u/h9tm3C5XbYP/tjrDnGVnQXm?=
 =?us-ascii?Q?f7aCYJSh4ZPXgIviZhZBLKT/5ueRqevh4RkpQEByyYgfZLct/nOrTGsfxN8P?=
 =?us-ascii?Q?LJsgr3bFG1koKJGvCmOTUghVrERACgT2W7w+PdX9M6hTFxP3OQnnAJnRhZBJ?=
 =?us-ascii?Q?Jz+Un6yTVDSdeHMQQyBdobTkUFqByuym1Isbs5gSvadOL/oUVNzflFnIYrA2?=
 =?us-ascii?Q?JblHMccnswYurKtHff4oeVygUAPkAf5DKH56H1y1YAKAMg5tmXdziaikN/RB?=
 =?us-ascii?Q?klpgNqdyW2DZy2y9+FmpAKFC/u+TfTuPidm+CAwxNWlEaNs+QgtEff2XZ6xL?=
 =?us-ascii?Q?SmAttGOhFjUz0Pr5pAibGfwUmPrbdkTmx+MW+P07129D6W/P3PjtMHuXn45f?=
 =?us-ascii?Q?mrrO56kU+u0UCH5BP6rTgvg8m9Gu7u9TuKjazQ8QhrbifMAEDrNepeayC3If?=
 =?us-ascii?Q?XPNj8SYFexH/1CqLUqmr24EkL4WIeWlNGHoUV+aNfcAWUPWJKfZ6y54ebmHZ?=
 =?us-ascii?Q?W3jsn+UGmfbVXURgYQTxHe55ylDSer3ihiijpOVuWdQQgXE396obkycv6Hzg?=
 =?us-ascii?Q?8HPwbsR0YbysapEXQkxeZD2hZjPhKIrpLMToOX6iBXhnVzRnX4xgBM+rN/89?=
 =?us-ascii?Q?4Q841+togLn4XUKeUagqly9cvWnNitLgAnzVDF5bZ6j81GEDsXzIZibGSdnX?=
 =?us-ascii?Q?hEL4BHJz6ZdRv9WTzlZBzGkcUETLUWRO+nOIrLf4cUOraGVEmKkcb1nalf/X?=
 =?us-ascii?Q?TFUl3FPUc9fk3AKc4yvjd7Gk7gLY56M6WdbQkNQXYnDC1GtzM9xKyB4oc3Yf?=
 =?us-ascii?Q?KY0rkqG6VrFisZjJu/g1YEmYWfMem8+t2TUHTMCKAqhs9PZbOPMG1xYrP071?=
 =?us-ascii?Q?9eAtr8F01xFrN8T1NyjVcJrrBmL+teeuZ6FMLpjeLWq+EKrlmIyknk9mmJbv?=
 =?us-ascii?Q?sWLqB1KlUCtYioFapjriwATkcIZTzY+WWqiB7KllYW6WMT/5Qi+8ETK7Rp8y?=
 =?us-ascii?Q?LfJz30F9LNece+BEVQ2ZnrwqIQGmFKcHr5O8+4V3Pxx8+MYZnXjUbFjnR+aU?=
 =?us-ascii?Q?CHgKLKzOLeP3Yed3zV742UnaZ1D7wVjuEhPlIwk6o2jxWavywW3bxdAHCAYt?=
 =?us-ascii?Q?BVk3jWAUbgD99BHezXKnOAO5V0gVkSgwG7x+J2CGF4dKb8KRZm6ssOWM6YTm?=
 =?us-ascii?Q?O7lmewOFkOQcoU819NlL/fkX+5KJcOyInOayPmYHsR0hf/2+zHk6Lgmd8XtN?=
 =?us-ascii?Q?PPuDuljAObv11cXRDrk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:09:56.1095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c432e2-2ea7-458b-4e67-08de52a50c60
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7105
X-Proofpoint-GUID: gIM-4wsGZf_dKFPyCpx482oBUeKVP8pX
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6966442a cx=c_pps
 a=NO5CczpcTQW1gtzKHD9VpQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=UTenlZnlj2c-lfNd-AcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDExMCBTYWx0ZWRfXxP/lZpD0+blK
 MfNADSjxEdpp0YkRMpz93ZFqawhOhbNcmOZQkj9yh6mCoFhYgEUuElcw1MzrXULxAbbxtEkQaLj
 kneRWOSjnLi/BOXF+oJ1Z+YLBAh9YjQc0InwP4d2+8CxDA9n4EFmCLTDqBgriSBzxJYDTLw74q+
 FUHZQRE2lnfIVmkMURHsc9cPWhNBX8NdZ3zle2giqgkFQHJXAU+kXv4yXOPRTcrhzumhESivT06
 VQqrQuCjdakQLf5ZXLf+dFVktV/noYDmWprtJZLUlmbNKHEfjAzxLdHMOPzDoO6Hu5OrjhFHtNw
 j9x97NZlG92ZdaKnnDaqQkWMGiSTs2u59tsGJhJmh130KHMjzL6HiO6rwT8wamiknMm0jcY8/fH
 A5NLuqsL4q3UQjbDKemWgIzNAEiJpPd1Py7qU41qqA3dzQQ3CUfRmY0s4OX7eU+/cPmTRqgQCAw
 vA2bHq5jB8FOqC3aswQ==
X-Proofpoint-ORIG-GUID: gIM-4wsGZf_dKFPyCpx482oBUeKVP8pX
X-Proofpoint-Spam-Reason: safe

Set gpiochip parent to the struct device of the dummy GPIO driver
so that the software node will be associated with the GPIO chip.

The recent commit e5d527be7e698 ("gpio: swnode: don't use the
swnode's name as the key for GPIO lookup") broke cirrus_scodec_test,
because the software node no longer gets associated with the GPIO
driver by name.

Instead, setting struct gpio_chip.parent to the owning struct device
will find the node using a normal fwnode lookup.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2144833e7b414 ("ALSA: hda: cirrus_scodec: Add KUnit test")
---
 sound/hda/codecs/side-codecs/cirrus_scodec_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
index 3cca750857b6..159ac80a9314 100644
--- a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
+++ b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
@@ -103,6 +103,7 @@ static int cirrus_scodec_test_gpio_probe(struct platform_device *pdev)
 
 	/* GPIO core modifies our struct gpio_chip so use a copy */
 	gpio_priv->chip = cirrus_scodec_test_gpio_chip;
+	gpio_priv->chip.parent = &pdev->dev;
 	ret = devm_gpiochip_add_data(&pdev->dev, &gpio_priv->chip, gpio_priv);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to add gpiochip\n");
-- 
2.47.3

