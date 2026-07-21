Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DAE3EFD22
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595614; cv=fail; b=FfUj9IKpzS9lVMEYC1FCEsuLB3MPaCjD1Eup6gFeHnS2wro679ZI2fmfZK53fm2xomUvVuNxlkXtBPm2MONixmQgXKgZrbjBCvmBx6JOye2f3NnsjGOCochgwvD1Em7xlfyOA9CBLBnI1IF8hraXd0Ej9C4dMwtMjFc0bh/nwgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595614; c=relaxed/simple;
	bh=3jwYQ3Q/yXOCMbtwIIZgWbeJqVolnuCJ4IioJfcopO4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VRVn5BeARA5sBxeHbTJe+CA2hf/kueynunkj+m8jfi1fqnT/WgZ90rNa1sah1Xv9GaLvjMO0y6nniEycGIy6u+hxPiYjrV5vyQ+zILwFzf1y5B3LDIC6/Sn/jj4F1cnIIRH2guBTB6howcj8Nr3yRVA3PzTNLzycokXW/kS+5Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=N3YiPdwM; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="N3YiPdwM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ5N9UUXiv9qnQKWtTsh02aHPcawkBVTQmky83VMgBa4KxxxHieAAHi+YQJ0VB5jvSylplwvryjR3/1E4pRIfMXkmRO//h9cSlQbvuHssXz027vN2UGMnQNx5BhnwiIMZdWXChQzRDyvIlJWnbSKGBEDMuU4oZLsNRgEJib7d44UX8gTDiRNj9+dqy8Df9j52v0ORIFZogpnP9DHa3MxvzCjIC1Pnb+a1yztGP8VXk7p8UYwrJKA73qzxC3FLQ+HL7o8cGMOBgti/Z2RDUGEujRCpBjfWHIg4pOAZeV+cWiegFDTBLPpKb6vHzJ4eBvgsUZUnHhXKhy65ntzo3pY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsUry4kJYL424dyBpANyXoGKWcKV0Z9nSq88W0TByeQ=;
 b=haHoXi4LL4wTdfW17/fOVqWgBFDzOnUkZSdzsO+p3s48wSCytZDhVQUppINrCLMP0lFOdSUB0YshYYWEh+jGJjxRx9nmnngZPankNDvc6g/oBMfq4sJ3Is19Hp8QEKhiIUf8cMYwWT+NO7EWQbDtSmPO/6R1f8TOetVnor7tbUNIvpcevdcEtNbb4ugE6S9fGAPMeFAbGfwLozG+CN0hOpOTQFqu7ylNJIpRiqIB+cAiQYELy0lIaiEjPo0BgWjBjd3q55pBINt7u8+WDksT1ttnqgys0usTTVUK70ZYiJJE66ujq8E/EF41TeVssRYfyPs1dbfRf/6m68JMd3ClBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsUry4kJYL424dyBpANyXoGKWcKV0Z9nSq88W0TByeQ=;
 b=N3YiPdwMZa9IRPTWd5idnXEW/swNcuqGdSLIBHUG7k61ZpS/2D8QGgHpq/ZnxJJhOzwz6pEhF012lsv/hZ198xciX1nO2CVQiOJL4kN2yXrGEP1DGNDtt+VkBPMd2CjoVUH3XUQNmHigvR/obTeQe0o1Ys0tlLLNHXVV8qbkw8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15382.jpnprd01.prod.outlook.com (2603:1096:604:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:00:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:00:09 +0000
Message-ID: <87y0f5jgx2.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?=
 <povik+lin@cutebit.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/5] ASoC: apple: use .auto_selectable_formats
In-Reply-To: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:00:09 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15382:EE_
X-MS-Office365-Filtering-Correlation-Id: 251fc434-3258-4e58-14d6-08dee6c36980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	yZnLunGddkuN+Va65b1d3ew6aYjox5Ny70imjSn41wvkPfW/2qznsLyKzi8aEc8wqtDwQZ2fNrB4dIqWiFfxFAdXz3e8gQey4T7KEMg8Ro1gT7ZFKUqq3P26sZJtZLkFMlP5rTxmDCdMj7Jn/KyYSYxGCFgRts7ZcKcGSMT99PuwzAIahPXCpbv7tzUGAHI80U803SIhHHR0iUQlUZUWS9y2Txe2kMPqSTWYT3LC7QeCptCtVl+JVbvRPdUQ27TZHzlVe/yRwoBMO7ZQjFD5YnQPOx4KAZs+jr7H+bBq6ZZfVExAeoVzHzaye1uIyzlyMGHGft4Pkt1pgJtUbekOI2NNbUKB7sMQWcwnoIF8WjsbY85KSgcv4UwHYtaSIv+GK5001/PnifBH54xUSvIudNn71pXi6hz3IMav0qTRQYo+2FXX2YSvzXVxIvr3vLQjq0fxB06byhv8iNAJjFz8g+2cWJk2E91MqoC5GIOPob/UZ1NXjsfHjGD/aRKH3e8/aRNShlUZDDrp/fd4F7gxjB/ytREUk/R4L/oN7KEf8AwdIyiZXUXip/6xC34IjhsX/6TCvnjLOgmGeaQtgU4UHqTdUmLyQI1pQ0teH7WDHILxWzdQZINclCuyjXoOC4gsj4U+Y0GBz3N24gqxYyqE0Q9Pj4h8VZZnEKyoalixrJiEHHED0/3TfvsYUsBSn8BkFo84b2EfIvSDWeUyEHdM3DDbZ13iPahFDOcy5thFRTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IzGFUXXF6rqr3A9lKt37hF32rP1fyO8Jr1ek0tpJbAEJxjliJ1sFxeUrcbge?=
 =?us-ascii?Q?dQQfIvDqiXt/nAljY391AikWdCW65+RDOTeIKhiVU1nI0awnezaj1gustsOk?=
 =?us-ascii?Q?2xpf7Brjhghn/dO4q6Wvtid+xKjAF78HqkaUGY3bnhazalUbPyqg6pvZfate?=
 =?us-ascii?Q?5aZkFh2jHvKINnowW1wJrceTAYO3NjdlW13ttc6/mbc1Usr1mWpEk9jjobHC?=
 =?us-ascii?Q?g3clonwDXyntzgYlGjdBdlcTfGau7E07gMDq5CzU8Xil15sR3byRdxKUO1Pc?=
 =?us-ascii?Q?znPi+FxQJ5C+9Q1ESbcQ/AuZhPUCTgogqwILBO/Qv3O9fB1GJJurC04HuhRx?=
 =?us-ascii?Q?5rZaVaOvplKCAjPFomNjzPSceMqO9XlbpAVdxM0X56iewywkLUHr8D/9eP1D?=
 =?us-ascii?Q?Bmp8+imJBOtQlZq4gw8fsTI7693ye+8yPep8v/W4+3FjGEjQ2aPLe/KbTdT8?=
 =?us-ascii?Q?HdiRdNo6AMfJz2WCZ5e+zcYSEwmLmENaE9yr62r34Eh1LPjbO+a4GudsSS+e?=
 =?us-ascii?Q?z5HaE0QqdsOt9Z1wAHFgVtPBCr71EBNXmc5V0IGv/PjhzGHuChdC0QvUC6l2?=
 =?us-ascii?Q?+vevRp9V3GP6UpRDwM4556tU7BkM9LUrfsxePVPHj98USxpmUbriaPlKyZat?=
 =?us-ascii?Q?Lyn+4tJInI8AGva7TsajLP3U96hVwGcDXa9DkusuQMA7Hxga5FE/dKQmXg5Q?=
 =?us-ascii?Q?V0T9hpmCrvJXQQHtqP6QliI9EhHrM6Vtk6pZ3WsGkYtZiIhplO0/kuy/JcMa?=
 =?us-ascii?Q?SktpIHfuifVdtaiyOar7rRl+IEovg0gX+F/Mrws+uh7nvLFmN/g4RsIfX3l4?=
 =?us-ascii?Q?m61qYZz1yGlNEU08G/j9rQLFP0ySfyGuotLzqVNBhpADj1ifIBhATd+0JSFA?=
 =?us-ascii?Q?Fb98oL1jv5ml+588UapmIthC2naICRvXtZYmH7bS2duaDp21IwEzDsaC5B3f?=
 =?us-ascii?Q?/HamgRMgfDzcD8q8ilwC97rVocbCah3Hr78a6xeI8E124jv6IdBLFz821foU?=
 =?us-ascii?Q?G7OkJ8QtuwTbxanSI6J8+/5reymHoWFB8I0e9M4b433Pp/L4J7MRjy7Xz7Aw?=
 =?us-ascii?Q?NkY/Un/fCXCPkN12UVi6nlcv7I0doULpb7u0ZC/m1SrlGO2lTJo4P12WQ5RM?=
 =?us-ascii?Q?xdoNFgUAjqKzjdqyHZsYwGrJpw+wV9FFYGaXQ++vhS4mss6vSbt4eN0YKwei?=
 =?us-ascii?Q?MzC0+XtPWlDSh1rM/l7IC0v8+98gsy9gvhSkikSceUmuXTbPPbxESlQG1dSO?=
 =?us-ascii?Q?u5mZ1LR6Q1T72AbdpffLZ3yFX5ZgI/LIfuJ2NY2qXzvan7YfEo3ZQXBA39H4?=
 =?us-ascii?Q?UtO5bVZTyjzUbPWjgtgPDs/cvoRStfXZKGAGy+MlNCxagDxNGkQN9YgzcZso?=
 =?us-ascii?Q?04crphngYjC2ZOQ9GwG3hfpQbGsvyrr5DUDHtXphVHoLBWOS/yZSCd4BcPKG?=
 =?us-ascii?Q?strSR/gSFpF/p4dnxbVF84JgHxoIKIpAWi9IV2Gzg+CcPt25JoaNb5Ib/8p5?=
 =?us-ascii?Q?LdR1M91/oFoEKvxScu+ElhdfSLlHAOZqrEepXo/7e1t5bDDO1IcI7TqfiPCn?=
 =?us-ascii?Q?x/Ciyj2FlOpXzEeKRwdrcKhgWTnQh15WGcESmxMY9cSX2jcWqbK2zmmZkW3R?=
 =?us-ascii?Q?s2N/9gnRD2p5cnJxIxahNsdw7YlKob2cFymUoaL+IqZ4FKayPnUBBRXafAoz?=
 =?us-ascii?Q?aaKcysaRJkLBCXINdU4F73+Css/D4Y/RPd7K+6fb54Nmr5qB5l43jOb4EZl8?=
 =?us-ascii?Q?aF2TiXMWP/Sw285JC37RrEQuPs+lGTrPy/WzmFxE9ibsZFk4D9gU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251fc434-3258-4e58-14d6-08dee6c36980
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:00:09.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjevph7s1uUkqjkjgR77qjEGxwAb6Ilx0sujj9H+jiGMbxDW2wxe0Xdr1E4mSjujmTeH5XwyllVmXHrfptxEyqOC0ppdgF2L0QZw8VZhcMAnQrUdXpJDZd2dFBUw2wCC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/apple/mca.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index afb3754a88835..be702b2942a53 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -739,6 +739,19 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 mca_fe_selectable_formats[] =
+{
+	/* pattern 1 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+
+	/* pattern 2 */
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF
+};
+
 static const struct snd_soc_dai_ops mca_fe_ops = {
 	.startup = mca_fe_startup,
 	.set_fmt = mca_fe_set_fmt,
@@ -748,6 +761,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.trigger = mca_fe_trigger,
 	.prepare = mca_fe_prepare,
 	.hw_free = mca_fe_hw_free,
+	.auto_selectable_formats = mca_fe_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(mca_fe_selectable_formats),
 };
 
 /*
-- 
2.53.0

