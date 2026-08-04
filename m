Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048537F31B
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804081; cv=fail; b=nqkYAEpT/+reetzYu5oj0+6xkKh5BsHilTW7zw+VN+B0ZEboEgG0I/M2gxaewjGLjRWQKf7RV6s8HUN9b2wi6S25DFbh9B89Aa/dci783sq7TLkndJ2bs/DCNHiQqyIodrzJisxmmbkYOG3ELH4m+/K1PG4VK5dM2zGfDR9oDlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804081; c=relaxed/simple;
	bh=u9bZNm8AVFLEl1CDM4CSrt4hGItUsm4SS2EDLWtb0dw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p54Uv7RI3YNYZE1MTVVIknUB3oxRT+XGOuNnW9XHLLePbkoNogvyJTc0ZkRdkLPyJ13Za8R+zrkyFoIDcwIp/fZWEO1ItQ61ZEAbpNT+Qjzj/4NHVc3px6r5YHD0OmnRdaS5i/YqBY4U6Ye3iM9pRZpFEAcH0TpTdfOrz6ifuz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JoEnafeN; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JoEnafeN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBqU7/EgJIf5MGx/jJFXXaMkQvmoY5I+EivvRtefezLe43HFk7d8b3rzkc695mVHJSYHkIvcVfwrSm6dtBHapeBga/o0l51MNw2NenQA9++55Rkvkw7V8T5zKPGFp5brn9H86OYfQ5/1dC79vH1SeeX/DhO4FbPwe2vwlRMeqAKU/7gPGHW5fzvBRK4bNItHjTh6rkjLzR1eNJDAzBa8u/unwrc58NWjWhyHVfQ4BBbpJMSOGTlYIgc3zbQ8X37winhcOuorfY+/3dTa0z4FmS7lK394WHoNspq9gq/vETiJEhMmcpIf4xae5xEuGpCX/2pt36SJuj+wmn3fSEm53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t23oHaU+M9zJPEbB7AJV2Bq1okBRim5lPFeW9ijzahw=;
 b=wDCR0kW16sUrHbwpJATB8Iot1u/zv1FbU/R6MkornbToBFHY/ZVw+xGS8ej2TMCk9i7DXKJU8F+Zt1yCQs77JoeQhDwc1Qx12IL5Tg1KnsaZgyllXfAj5GoQFAfrQm/0LXPacVRXfYNsChP8sx2r7W+coFxxXKc3FlVmqHpwax1BTmPbETnVScMsRjirDGvH941E80AYYsEQywKSJqYkaTmV8AElnXQM5aGIN5il4PJA95hZMX0BuXJfF/zSXgJXe4Iv3Q+6GFf3qsiCa3RWPbf5dktTp7zCTXhdu9Aj5BPU+DoSHuzW3PSqJEoYHiU4zmax0EFfV5PRbeHTt5KQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t23oHaU+M9zJPEbB7AJV2Bq1okBRim5lPFeW9ijzahw=;
 b=JoEnafeN46wDlbZEmvG3+EH0gA2vnUe2BF079oco9HHm8ZronYGLZWzOWOSLf1xdkh3dH/PwbDPuPX/ErrOaLq+lqKezF6OBBccq0hxp+UEi2F7FC3duw4EkFY+WveRaL9wVE8ZRUHlHaW3c13/zzkYVhNkH9blMWTVh9ewkphM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:14 +0000
Message-ID: <87zez2wwd2.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/44] ASoC: codecs: arizona: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:13 +0000
X-ClientProxiedBy: TY4P301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f3f5ad-6287-4c9a-14d3-08def1c1165d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xxWyQ5Ow3209VAkEJrZPj8l23E/JYzmCFOJtUMeQ8QWXrDHTXxaWaJWY1Cqt9TSfQCutV6u8Me+8lfSqqNBgEERMpKkakVjIDG/+5JumUprNVd7tRqZVSypoxEm+RJjOrahHiAiUtrvZiCq/L23X9+e5bL122XF2v2BtowFUsabCAy4n+gfqpudwcz2/SlpYs1+5YOfjJ2ycyZkYsKx+Qbotbk7PMRjhgZASEhJi5EW13c94ccnZOaS4/4VrhZBrPNv6UiO/4zdlAOtG99aK8hq2soA9Yr6SqGvyNI93B7teCXVb0oTatGPjfDEe5/AchIZylJCE/1VSVpcHCrwei/wLU/mtYVqvCay4ZdfQxDlrnlalSqhntrtmmFDlZ+baTSaT4z157aI86Re+EvFqdQkhHV9nj20SxECGWR5c20c5R7a8qL5h/OTFGU6Lb72zurtJmiJgnYqQ53F1/gIX6pkMLSr/0lSjvu4rG0Bhazmhtpm35g9jpvnPQN4jsMvlIMcLWpDwQXaZlpMVYf4fe9KljwbCHGanQp27LgGF3Pvoi3Op0bMtfwoh7twaGxeWa2NjRIppYxguebXSWPNGDiFX7kg7//5iC5LTTx8/Zna0q1V+2Wr4MGIz8L9UQ5GoHt3PoWG7I3p50QpELJMfcoN2imYdcQgIJ8QSfZjqO5uo9h/kXnjJGZDATajDzZeuOdKqfmXb8pKP31RTETckyYNPbBjgZiSU+U1sgc8LG9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JBW9voZJsUtEio+lymv3OFuqWqPd1aoe9AsVMJJecZMm4kTOBmkoPE8N2ZSa?=
 =?us-ascii?Q?wgMqaL2eI02dr5IJzY1s3PoX+4KYVJn34SrU7p91LL129Go0z1Y/NHK44RF+?=
 =?us-ascii?Q?v3mYV3o4h2MZFm4oAWrKtnBQDCRlFUv5zagmcvvRWPJxz4VHFgJOvhnX8HS6?=
 =?us-ascii?Q?M7m3vU9SSY6CSZtjZBD2M0JnuKUeBz6B3tAcsco5JB0nDE77FLx9CexfKaM4?=
 =?us-ascii?Q?M79/A+mWqlN0NopGyedDcU1nwhRyG1YknbktHgfI9DzVO9G3OW7MGWEjfOzJ?=
 =?us-ascii?Q?H1Cp1UGfsiKx0tdlHABShEqtReGFjlUDW4MTfDiW0Lb02HFcIBNdNlNqdlCS?=
 =?us-ascii?Q?A27tplXSVUsidnU/cK+ruHgeS3rKwD/JswO+WxVzQDpGz9WR4EkCaRhhNoFG?=
 =?us-ascii?Q?3DpZU6BUZQUOOKss0H8oZVluhY016RJUZ+7YHPiDA7S49OuBhAS4St1FgbIO?=
 =?us-ascii?Q?jxYuZe09ozq7Wbu5MaeByUN0xjC8kak1SbwGjdQI6XdMSQdf0pnyEbEYlH5w?=
 =?us-ascii?Q?pK4N2jFgc021bPgv9h8Pn5QKuh8Q9jsx/UgVbpjK5gdiPAZfKnup/VbY20uA?=
 =?us-ascii?Q?+QB9QqoextFirCCW6gsX3+ebmaIKdEQ6DTeDrnfjYooMOp/uwpWOwdC/eOON?=
 =?us-ascii?Q?TDlj/Rb/RVSoVi//FkEK8ADEVVSyjIFjoRzWqrNJiJEEGky8po5/L8hv8mlZ?=
 =?us-ascii?Q?quA0nFk9lQVamz3AnJmbY9d5+pbucXuOQwPtnpSoEEjVy9MuSsoyMufSx3sZ?=
 =?us-ascii?Q?9hayaIaGZ4CHcJeE7rNPZbPvT49CLW519OPuoLjiqiWGK9AXG48bzxqmvDO6?=
 =?us-ascii?Q?fMqjwc91WBSUbIS3ac9TU9Wx4ehl1yGKSyhJXIgPNxq6nrpL+PvhOTTwQXEa?=
 =?us-ascii?Q?XkTlv9sKaUCk6OuygU8Kd3f20wqkxX4o7EbbcxmHUVNWDiiTIz0Sqv2l/oFX?=
 =?us-ascii?Q?XcrdOovmt4kLawLrOVUAbx8KlJBihIXlbgp6LpON9sTbEGzXPyKIhW/OwzsZ?=
 =?us-ascii?Q?dvzDFaVbsKRck6yPIYs511KH08k4s5hu3Swb2orhWEXfQFiFRAuMnj12Q860?=
 =?us-ascii?Q?Y2otDK5NY5SNjc0Nl13NreX0XqZeBYm/X5PteqQWBybMHEsrLOrejmL1H7a9?=
 =?us-ascii?Q?mcKNjW/Sglz88WLrtls84K0UGP7f0H1Fer2cmY+PVub2nmN5u1aoaPcEVP2G?=
 =?us-ascii?Q?PGmbt5H2XA9tB04bnLjqDgegRxn3+kEPdh9YuZWjh7oWgdLYb+HjJFStLtq8?=
 =?us-ascii?Q?3U43fHqMNacNeqHR5/LYehSxyd5mV3rTfOlnYzkbiH36wKcys2oCvtSTD7Qg?=
 =?us-ascii?Q?CbauDSq7iLzzgmdPQrhskdCAMaWrBjdNE4NOVT09wDppUYksxGp64u5jptIg?=
 =?us-ascii?Q?wak7YZ1B0QwAVzC5V7fKnrMt9YoogUTyFMB8GAV5BqYcW2I/61dB4prIKPvG?=
 =?us-ascii?Q?EoFm3Dznh3kQOAFrk22tlZBDmwAr8l3jWP0Ar/jR0MghrffN7aqeM2uL8Zn2?=
 =?us-ascii?Q?SqEnqGqkHgiZ0AiTFLzxwpl0k8uEz0f6guX08TqlYE9b70UgOFV7WAiV4vwp?=
 =?us-ascii?Q?klGiLte8WmScJKVqQNrS4D8YW5Yft2HIMgTdC+UK9k6csVepHlFWX6KQQmTx?=
 =?us-ascii?Q?vy4DynHkQANOceEM3H5V1LQW26AYOnBU3FqZ+BAdTPvh1j5YJPmhA6HButLL?=
 =?us-ascii?Q?xt08GjDa8Z5hclZxFk+oy6Hc5AGsWNKT+dz1qqK+qDV2IW9XGdUrCGnIqPwr?=
 =?us-ascii?Q?o4HVuGR6snVSIVI+Ih0F7m6D0r8TmzwhRvRl1Vg5k39YPPqQL0wU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f3f5ad-6287-4c9a-14d3-08def1c1165d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:14.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j66/9Ywod2YOWrpiytI64CcquA7kc6z/qhlFSdCH3JejSVuLgJJt+gr8/PvjJA/wKhsQjwvsJBLNVY40zpEE8Tyt/bYV45IgXW/6sD5FBco/vaiLhJP2BDXldskmmP+0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/arizona.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 4411165c37345..5cc9ce03c83fd 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2016,6 +2016,16 @@ static int arizona_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 arizona_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops arizona_dai_ops = {
 	.startup = arizona_startup,
 	.set_fmt = arizona_set_fmt,
@@ -2023,6 +2033,8 @@ const struct snd_soc_dai_ops arizona_dai_ops = {
 	.hw_params = arizona_hw_params,
 	.set_sysclk = arizona_dai_set_sysclk,
 	.set_tristate = arizona_set_tristate,
+	.auto_selectable_formats = &arizona_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 EXPORT_SYMBOL_GPL(arizona_dai_ops);
 
-- 
2.53.0

