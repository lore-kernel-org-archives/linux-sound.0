Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E843229D0E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533396; cv=fail; b=pTqrotMgAtbJDx9q3zJWC5NtuMKKIt/+beIN1+zLmW6oT9t+h8iusuGbD70z7cEt/lVx+onYQlpfyO0XoONUdwV4p9OglapOOQ+/qBWqa12tYBDVfAktu9TdC0QM9XPdXYKKgkvLENM82gov3fPHf1Pjr8ocV1OvF8lovamSUjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533396; c=relaxed/simple;
	bh=edG6CM5B/HiXozTbhuyZCrDQFU2A8vaawvMd3RU+Lyc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u0dKhRFN3xz7LF471NH7CQr2tG5sxVLTJVXx6fIynCqkG1VctdTvWNuGgkqdxCPoiqx2UCSNQWUd3W+Zgj7t4KKyX3RvyjTQMVmhDZcThzKukl1322432soWzPIL1WvbuOLlYoxigiUrVRvixMHkOKdLPs6PhJIjDdw/D7RyChM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OVObF2Ok; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OVObF2Ok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apUPlyEYwP+6n1a/smJ0WKUlJWjhWzPzfdoAvNxpzP1wvGXqqNjvrENHkYLYT03TK0uYWgrCTOe2JWAwQH3XZb2tnnYU8rR0YmqF91wTUJ6Ak4eue0u6C1H/liTHvLjw9bcFB8B5f9N2gOAPV/URF/KMdnxT9dQyRZw4EQMUbiwnu+ofYCtt5bpBPuaQd8qLM994oUl2PXG+WmKiOmaSF6kcXnfQ/xhQ/tQ1IH+PXijnD/SbujmCcPVB3F/6lWsYHcgiA2QFj+46rGnb8O+SJ3cCcM67FeqFmrAvIoAHUwlcGFSyMmQDjHKfa1t/bTPvQFSRYxWD9K63o6VkNyD84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnHQZ6am10aD+pcuLa8/gXBskDCdhMlfxHR17xMxrRo=;
 b=GS+i2g+mkKrMKwrWvDH4J5fPHwwiIbN5FcoHSc8VP6QkQ6/arlOixyRo54FH2z5MtnFD3MnXT7uBXUQvOnxClu4gSZ+FFz8X9D7UbMHSImSqvBDFGBDLymWof6z9vm9C7ytJmG7LbyrFQdXyzETWrdqVdY1Egbmen1pzrRHgOoOgqCSrKrnwb+qED8LQdR9Je8Q8fpRCM+k7tBa3KVnugdALQbkMVUkcvJHqgLQZgIBQpI8CnlpwubEmnBa9R8QDEgSfPD/6AjOCpiuNts5/50rM9RgMgZtnpQAuTNDk4BcXzOrVQQLbjsdG7Bo+qMXHVc0U3N6e21ZqJW16YXyJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnHQZ6am10aD+pcuLa8/gXBskDCdhMlfxHR17xMxrRo=;
 b=OVObF2OkUtr7Qc2NDvbb1Lc5xK5JmllfeTRTwcQL2jTnyKguxR7iZFEFuwxooLRwq5aHtNEnRKotFPo4i5Cao936cSDS+ayilhylnkdQB5ZJqUMbFQYQkjgMr78z5h+ryg76jBiIP4vZF5V0lkm0K+aOyvFlYbHicGLyzmS1GjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:29:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:29:51 +0000
Message-ID: <87cyf5h4s0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 002/157] ASoC: ti: n810: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:29:51 +0000
X-ClientProxiedBy: TYCPR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:405:3::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: 15116e6a-9c20-4ed3-c6b3-08dd560510cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2l8KQy2gwD94zoo+pXlpSr3Ez2U0bQ0QUd928NYLzoI7gu8Ry9PvEJH4vSRN?=
 =?us-ascii?Q?WRFfmn4KgYVwN5JXUhab7vv4vNOsB1fKXJrsK4zAY2dFFnpVKEJrq1PRGp+b?=
 =?us-ascii?Q?yx5FQRlUtf+oUJ/IztdEeWQ0Dlts21U+f9p3YGpYEYUSUxfkTi3RvN3cZBE5?=
 =?us-ascii?Q?O2frXpVamovCcoR9KQxTFzSXP+TUk7uILq01k2slp2BoVh/0yMfNr+209qlL?=
 =?us-ascii?Q?pAAGLxr5Uq1Y11Q/YzXBlS1IVgK0Y0SjfA5ndrHabI4he4UDv+xQ2RhFZKX3?=
 =?us-ascii?Q?DUKDwjmi0jC7YR419G+gh25YUmOkHbmvEHI4nlmpuOV/OlxONZTP5fsEehRY?=
 =?us-ascii?Q?SFsFZ8bHtBdDS6Dl1JuKCwRfqDRZtY4rQx3sfA6tjHnBOD95W3zTUZ35Jsp2?=
 =?us-ascii?Q?/fsu9INM4vhKd53t5gjZ+jeCfx3UJ6QWehHqUYFj238LwF9cDsOkDCj93Bgq?=
 =?us-ascii?Q?fGqTppoQx8BHNFGB23trjl6WifZCnrXvlFvcqEtUQ2vR+V8D//m7fv3WzF3/?=
 =?us-ascii?Q?kfFoshGt/zMQC90LrcJASh98Osqpq8UVnFEJ1y5b8VBaN+ZgG1vYZc5PXJFf?=
 =?us-ascii?Q?W6CaHFOStzDsLaLLRWMrmzKa5ThAAGVuBdS1jsvUbCkcA2HDR0+VxvgJ4e4x?=
 =?us-ascii?Q?fIix2Oz92N0BCcRhczTlFh+soB46EAxOGNPksh3VjlnC3J+j/Edheibu+R15?=
 =?us-ascii?Q?ysgSNc1oRDeDVbsP4/PnO0hDn2y0cGCbBMtDv12FbKMCdhPIA5oCFb1yNmlO?=
 =?us-ascii?Q?4c511gPvaO5IC5hrwGlDNKOmNENx3yIz2oIsmVxqGxFsKkWlxkrtHwL7OIRV?=
 =?us-ascii?Q?PxPLzAYOBKCFVrPqxZt8vsQhduujUzxpn3T/vN9vhgVBKaiyQxUyWHWuAzbc?=
 =?us-ascii?Q?M+YKr1TuJjT98GAWvdpVji10JisW22CT+Yjx9Yc9A9wp6V9dwNHuwuSqifaJ?=
 =?us-ascii?Q?LDgflKYbs5QbG3W1xKVEb6VFdev90LoMnI+CGvfrIPOpaKYOuMTN1Ws3vYpz?=
 =?us-ascii?Q?w0CHY+L9ASisfROi6FJshdAyaHfmS/iYvexpB60y5TMpjXHV3G2bSODb8pHq?=
 =?us-ascii?Q?2OQZeC/LPhtj1zCSZ1hmqRCk3n5zIwEEZK8T8hu3RRe9XTvqFvDPdhGjprsM?=
 =?us-ascii?Q?i91AP9Lagx14UkOKkhqlwV6GDm8TTGV4xw3ORa7vcrBf+w04wv5sNWJQi/ZZ?=
 =?us-ascii?Q?YhwvXjoXfR3mJNJX9z3O8681OxjKKM1BvjyIg1N1nd90vGTGO7eZHbGLD7c3?=
 =?us-ascii?Q?zXgORXIKTXVq07bPNOvK9roRzzhr1NleZOzQpdjZY8bdyBq25Kn2ft1k6k8A?=
 =?us-ascii?Q?heYDdkpSDnfISV25k/044anoEAuPCUpHWPJfXL4N64DQ4eAClLO5S39uRhf+?=
 =?us-ascii?Q?RCPNinmakcHnRCxguMhRfZ1QkT3gsdRDtXgbjfNG9CPRQNrOwQR2qE66cZXv?=
 =?us-ascii?Q?4ME27KxX3OxLIJJMExl4OeGNd0B3HrTL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yt3QZX9DqUN0KjQmratMZjLhB1HrXwg7eebAqqRCs+ZjIZUH9zUZY5jaS8W+?=
 =?us-ascii?Q?nYU0H3HP4MhFZ1j+b14rGSTPieZKhQKIkk41RIVriIDEQZzLqPT6dXacfyWD?=
 =?us-ascii?Q?MJkaiIkYCLd1nQoQRe1wBcI3rxMCXPcCYaFKeamLEXiGqa9DhBwlceRPjLDL?=
 =?us-ascii?Q?2sBXOXl4rlveVcn+kp0JxouJxfYLMo6TjyxlNgdeYjd/nebB5qdJYTKoH6Bw?=
 =?us-ascii?Q?pVYMutSXgqPgbVILPp+mC+7t54WiAZiNnXKyjzO3kbZCcylB6Td0ISGNTw6K?=
 =?us-ascii?Q?wzFE9rX+RvNllpKdI+P63l/S18Unc80IqddywMQBBpmn54Zs8y/ed1HU5+Bh?=
 =?us-ascii?Q?Bt3NHsOhThCFdLJOG1GCSDe3kk4gdf2fUHGKy42Jbe9w1zn5p+geyUX4ut6B?=
 =?us-ascii?Q?I2SeuoMhJ4V7fykMVcn5iN+SwtjIMAXRWUL1cV7WlDLN9/oic8BG/K1VP+pm?=
 =?us-ascii?Q?MGr06xCtBmwSC4WjRROIG5Uo0UuQ/QVOFFSBWt0SzPW1X1xGWWuA0jZI/Zjb?=
 =?us-ascii?Q?aZE/E3FVAm8pwrX3WlqmKgNX5IF7gpH0qcKXnAvYl7SyHBBnNv1f7WVe4I5W?=
 =?us-ascii?Q?VS8hieHTYBsZgbU0pT5blX2//n0pV11rorBdPJjPVF/cI64N7LJzfDQtwuFU?=
 =?us-ascii?Q?vlf0oFB7BbmnuVRKDy0isdTILrpmfhTRONSUbMMGa8TjyiBo1Kru/1Nbuiyu?=
 =?us-ascii?Q?Y+qY6j+XTO5PmqHr/G3jT2zBv7M6KrjKv0e1+6QiwLc9thFRWkGdUDiRAdeF?=
 =?us-ascii?Q?f078JueGZ+wLHx3LYFiNGuEHBbWpRCC23jpwArmqCRZtn5GSv8VLdI5yNeKF?=
 =?us-ascii?Q?XjsydEfy7gURqly8Z5TbnV4FlfvBsPQDvtK/dRSrSwsnem3lAMmf1cD3CM6j?=
 =?us-ascii?Q?okHtwIurQ0CVucLaX3b2EoR/kHafmMaqGhhNg1oiLY30TJNJgo606DbKejSW?=
 =?us-ascii?Q?df33lFaBdp5fUkbaaChAzXwnoO8gRlVAOtpl2R6ZKAIxTwij2kHxZxpgCLV2?=
 =?us-ascii?Q?jg9Qr/9vTPqzMhpthgV+mcmM+pesEZxGwUFcYjOpGInJluxO7QQPGf07EQLm?=
 =?us-ascii?Q?e1ICj8AgTXoiQEHXtNet1ai4E/Nh4Im4RgX3MiEaymXsfAHROHxBSUoFH+bB?=
 =?us-ascii?Q?tvGP9dJQAnzpzPJo6M8fxKinrxyvIiF8ypMCi7TUHjJ6z3s7L4ySCEUNosku?=
 =?us-ascii?Q?pQ0wbIuJ7eSJ7F7228fDBp3pqXVprGEacoByQOkZO2OJ+YvGZoJ6cgwA+hyz?=
 =?us-ascii?Q?KafnBPG4bMvwT9hr3vSjjIjtTmQvdmhjhOkNHRP/Zl/ljWmDS/9PijGPjSCa?=
 =?us-ascii?Q?hnw9QfHB1WIyFfmhsdLXMFsIuwGX3UNplMxUNzB2OgPC5/lrPp57wJ+PVpuz?=
 =?us-ascii?Q?/5lgMmE8jKJlWgCU1hqSUpTnzVU3fIzvuJ9d3fRUQumkeeucH6HQoYPTOj1p?=
 =?us-ascii?Q?j22HWkXJZhCGN450Vfd9rSm0EdjL9x1KMdxQPWibFAP9WfGmjvrBL3z95rr4?=
 =?us-ascii?Q?cBBTfcbJLjoLBs+2IuxsrMM66OuFHG7EifrTKL6u81YZmfHq2KNsTZMZtjZv?=
 =?us-ascii?Q?KaXZb3lVRjBi35uykITg8sBMc5s8qSKOFebmrzx+8OJHgMCwgwtK16jEsdEu?=
 =?us-ascii?Q?h8XkxCnpZ32/89eJ91kOaxk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15116e6a-9c20-4ed3-c6b3-08dd560510cc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:29:51.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwUdOzmNLNI5C52Ka+T95dDGODB5aFwWAWZZfxqRBiwKe8AOyr+otp+WYiPNGjuscdveQsUrl9eTp5MWISK60iD+1GiwnfPTaCO9S3AgbPZ+xy14uiT896sEtHnDK6rE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/n810.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index 50a8ec97cf20..345c98765380 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -258,7 +258,7 @@ static struct snd_soc_dai_link n810_dai = {
 	.name = "TLV320AIC33",
 	.stream_name = "AIC33",
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBM_CFM,
+		   SND_SOC_DAIFMT_CBP_CFP,
 	.ops = &n810_ops,
 	SND_SOC_DAILINK_REG(aic33),
 };
-- 
2.43.0

