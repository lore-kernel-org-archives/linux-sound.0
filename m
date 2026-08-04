Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93AE37EFE2
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804040; cv=fail; b=FHA5URogEjNhIJtfLTG1vNOlfyG6liwyyCAPxMhn4qTzz25z0zjdd0M7dvWs5UtNKWUx6wMXZdQHr1mv33qBWb6VnkZD58+KSsZtI/8Z48yHvQvAFHGIZh20jVQ+2CcgUR8c/puD03DoYviiUrFLj1Yrome9wFzM4lHIH44Dsr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804040; c=relaxed/simple;
	bh=O+DO9m94ss3/h/rzGJpqbERH1Y8naUdBL/n4nY73uYc=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KwJlmjbihMekDx3a73flCI2435n7KoqUHcYDEua5PaLVxNmrXL5QSefCGZLjtm4qp6ndz4xg8Q8uxSb/GjgQRV2xrKu6eBzeAANfwpqLWqm2kAX3jIKZ7c8Oj1KKBs0ftXc3V+2pdlUdMBGn4wSogjT/KXquXCriaRAq/373OSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HD8dAs6d; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HD8dAs6d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSWuMfxQ10eguhjzyUji6ZSSaoIeKTzzZvE3/Oq7yFKSjbUiBeT8C7fffmtcRGfc3X7uUh2bIjop2eaZCTVOEnAajPbai18WRPegDWJ66ikGRAuBPFwmMl611e6mdfqRgKD6DZgUe5sdh/V2JE5MAmORTLQbwoC5ABxE10EqOERdVfNaF1BC/52Qs3DKFyidqpY+a8wyoH4mXRUy7PSIAcqUuRxsrD8kGO0sU+hJpFWe1NEgFtuov5eBfxpql7C+mR/zePjNaO6yxVEHHEcJpabwpVvguMqpjh9eRfNsXYeZDubXyIfzFqLlzytI9NjD661T+21jZXJOcaBQhhbngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVSYv7aTJvMg34DfSSvSa4YWtfV4GKtuOiOdGIH5m4o=;
 b=mNzxBX7YU6s6gY9GaPFPLMc6QL1ZUd0IxcpOeOo6JR1hb93vARb77VNEF0SvFy57KpAVnVXnamLj6EwFA6Zu+7SreiZfoBI8uLxM1NOCc+vD06OJNIkttcxuB+ac166AX3fh1lCpSt39p2U6/Xj07Bv5KLJoSREMQ4A+sT2uKjnStFX3ur/+xqpAsnktT36ymBV79q3RQBQ0my5EiIU2cEmxQ7HrbwZxOYfzDO+BvhpbZVA2Yvccm1hBfllmLrNC6n/Y+rRYgAPskmcPyC0r0LX1aEfeHdNtMoif7II9mrXuuzVsdTNGatiJlvooIvMASD6gzpph4ij2dmiwyaLsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVSYv7aTJvMg34DfSSvSa4YWtfV4GKtuOiOdGIH5m4o=;
 b=HD8dAs6dDFOiOUq+3BEGwkDIhJVFgaoYT8kkZohpfQFupr2AI9H65ZczYw941KQ8ZXeUmy04DFD49f2SYstH7B9fusuA4JtrPZ9rRKq7+fOPHwhxvpzF8ZFsgFBvzYjVJ5+f2JiCgFSce5/0AW5n8ZsKdXcySn5vgmNWcXtwv4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:40:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:40:36 +0000
Message-ID: <87a4r2yayk.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/44] ASoC: codecs: ad1*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:36 +0000
X-ClientProxiedBy: TY4P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8f1045-1c90-4fec-244e-08def1c0ffde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SEQTpaSPO+CwbFsLSKaKVGW7cg8jtbbP1Yj99jwCLJQQYWe/Dy4ETWKh7zYvM/g82qwEHbeC0eRmul7nD8VOfrbwDKx397zTGylYp7RYuOysE3KZFwDKGdmWZD4myJtFXhnp2h+KTlsrTtLuk447FCnHO54aPUFd5NTVLtrEFUrvubaorPaX2byt/my/Q/9xC3Qio+aOSVvvKc21DGrQYdHMFAI4gc/9V3VN9dOxsoFp/FsjMNG2gbt4yfKGnZ7igUvfWRBWK1SHlhzDmryHsq5Dbc91OTAE3H1bVCJoWDrOKhSt1jTrGM0S3005Ut8q21t3Jd+g9RytyZ0JiWXuK4UXXN+UNoCZQDlTlfh8J8/+RTwkABNtXRv24hnxGjIGcS40TGPqk4OVuKfEc/OlNvLd1cylNSPwTRz2s4wqrH2ArU4ER/HqsL0y4FynNcTNqWrhVcwaieS2MhZyDYKKiK4i2BMFZc9Sxw3cInM2G+WVc7DqCyHKfJRkz8JQuOYivFkPtQEckAhOY4OS5eBW5+vJk6oBY1QuShNOjYc6W+c529AYJAGXIkXiXsgZXrNgwMCSZVM4tV+idPVsYIuw5KL3XBAFVmuj1q8Tf94SRv+qNUb2Apa5aSU+cqp+3fZ3HKlUqxMFG3LO1qjbzM/39lRz4GCCljRr1DXbVj5VeICDpk7DKKDtxtbMeHS9j7YTC0XczV/SDtT4Uxzbww3WOqFCWywCtn72UWlzRg5Ka+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+XKv8QLcGvqf3D5J5rlKyHh4mdl/ySmKvlPb/RmqTU8hySuszsPbtapIrcJk?=
 =?us-ascii?Q?ozxR9GmZ45KYdmPVyGPHbJDLhjK9j4u5EYO5e7vjxUo9Sn8jmoIoIWak49zA?=
 =?us-ascii?Q?S/UbzJgS4y7pZZVw8jmrCSTHgFK4H8KUHx1qyijIyMNy4Lj7qgS+XbK5Q9lz?=
 =?us-ascii?Q?ZrxqzP27EWnyvSTa2OAn6tWLsSB91Z0hG3k6iBcWMdpGw7bZFUvkYDS/FRIt?=
 =?us-ascii?Q?PQUxqydZnFbGi0uqflF/U4zdETGdHcpmMKlgEmyBJf8BrlarjOTGN2AP3F9h?=
 =?us-ascii?Q?C3GbSUDvmmYUMT+Twc6WNWeZAMGtOzgRixHSaB375qFcVL93SwAA3SfwkaX2?=
 =?us-ascii?Q?mDQ9v0slKD97XZECATYooOo5sh3FN8RroLQ5rwzRqv/6hhU3ddJXb7CAHSJR?=
 =?us-ascii?Q?ON3PcHDkYJs5uN7xtPRHsiS2igGJO+h14uTf//ujq0aMtlOf6eOxNaMxKhk9?=
 =?us-ascii?Q?idNXzm4F8RTGa/1rwjlRsSzlgdI7bmMrfzY3b9Ui0yuyWCTpQKWTusJnrDKq?=
 =?us-ascii?Q?4X/UcBW5yLL8KD70TB8IJ4EC5T/W4gmxNF0G4VGya4o+8jD8GLrNziKzTXIO?=
 =?us-ascii?Q?EoqT3xEAaBj83sekWmhkr9MvL9S+h/rBMVNqaVmOIibT44qb1n3AdLYLN0RQ?=
 =?us-ascii?Q?0OV7KUN0MO9X73t87uvWI+jmgthrq8rXAIBWFHQ3z0NZ5rksUOyUYj5b52Qj?=
 =?us-ascii?Q?UKWtSnKSm2asAumDsNm5w+/CouizVhXt5Ng+jgxx4mlXu7jWL+/aKMaC9Woz?=
 =?us-ascii?Q?LyXQZd/ZQRM24G6btstC0sIAyI832Mq9C7HZQCqoMLjA4JsnAVV3++AVe/0Z?=
 =?us-ascii?Q?C3/eIqMzH7R6YFLUCrQ3V/VS9UxKiY85YdBTtdnXH9uZ6XZhm+z3CuQ77tm+?=
 =?us-ascii?Q?Ly6yX6o0jBM0roT49vPDPtxLQFEfDPL7PkagYpVesWbdS5hDZicyDeOZFhb9?=
 =?us-ascii?Q?3VY/wA6Ok1+1E2zaJaEnhY9tIn/CVyV/GHxb4EVI1MGC84xCY8RvSBIZK7Zq?=
 =?us-ascii?Q?BpWS5W9HEHjL12vQdVrvLVvAFvqQYBGibfn+I1EYV7B1J2FizCotYLoBwn6Y?=
 =?us-ascii?Q?IK0XULinVn8bkuoxxKjsLz13NKxCCgFkgYzyCwRUKFsoGfP6NggzQ9R7ULFR?=
 =?us-ascii?Q?kcKFIb2i6LK9fslZbhv+QKuCSL604g5S2PPiUoLnqyykaTR07jU3xtuMKVSl?=
 =?us-ascii?Q?O/8gvIKQq0tMUqWkByq4TWT1zTPZ+LhCBfM7N5BDdBSDajwAbuU/lVHsBEdp?=
 =?us-ascii?Q?ciIH8xjN+w5g/15Wmp+aK1MU7Uozg8wDsTNJGS6SbdCjhAUkb+gbIYQC02S/?=
 =?us-ascii?Q?6m5HiwnU3Phx09v2QepQYXLKAl4Z13ci72RX4zHqnC+jDF1eqW+WqYeQlTY7?=
 =?us-ascii?Q?TRiwZv+ZdHZuOFs8KF/TetgZQIYwrFDxRQ4oyqN79ctAGgI3L0jgz/2o9pCW?=
 =?us-ascii?Q?LRHuoDIazDYbyoVvaZf2Dq2kalh7+w7sDqAbcKdw79qZ1cISBHjXKiIu0/7r?=
 =?us-ascii?Q?YVLDpfGjTXe6ef2TCjWFeggR+5nXYius7lwkqpmGP5qbaIzz6jyvoPtNmGVO?=
 =?us-ascii?Q?C1Y7+Bt54021H3hHBNVfw2GGLAYBclvOsClcuciTARIgeJKLgYSfOJMRABBe?=
 =?us-ascii?Q?5TcGOsq62wPUZUDZ8UloowmEFZhk+J6JJ6H96q9XGWgvy9dY9YIjPOu4xTU0?=
 =?us-ascii?Q?mZo2bbanhOEDbMlrNgpupljExsWZIm6zwJBGHrLBNU1L8MXcs+aKDFL2AxoM?=
 =?us-ascii?Q?VzJBeU5hT7lQcSMoufC2B9XTIFjAnxCbNFNNAz1qM+Ix99Hp6sVH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8f1045-1c90-4fec-244e-08def1c0ffde
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:40:36.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtnUJOc/BMk+pviGdWL1TAGCkJZISfLeFzRrOAqsZAGbMEHTDkZp5EyNNQUVl2HwvOhzpj+ylan3AHeoeAxmPPAvLIIzWB2W2BW7cSMd8tpVvgbaESMprqMgqyL1xH3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ad1836.c |  6 ++++++
 sound/soc/codecs/ad193x.c | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 8afeadcaf8b09..dbea83bd49b69 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -193,9 +193,15 @@ static int ad1836_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ad1836_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ad1836_dai_ops = {
 	.hw_params = ad1836_hw_params,
 	.set_fmt = ad1836_set_dai_fmt,
+	.auto_selectable_formats = &ad1836_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define AD183X_DAI(_name, num_dacs, num_adcs) \
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index b93531c3a9a40..9841c779b1752 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -394,6 +394,14 @@ static int ad193x_startup(struct snd_pcm_substream *substream,
 				   &constr);
 }
 
+static const u64 ad193x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ad193x_dai_ops = {
 	.startup = ad193x_startup,
 	.hw_params = ad193x_hw_params,
@@ -401,6 +409,8 @@ static const struct snd_soc_dai_ops ad193x_dai_ops = {
 	.set_tdm_slot = ad193x_set_tdm_slot,
 	.set_sysclk	= ad193x_set_dai_sysclk,
 	.set_fmt = ad193x_set_dai_fmt,
+	.auto_selectable_formats = &ad193x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

