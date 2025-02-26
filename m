Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1299198E6F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533844; cv=fail; b=fhgmpKusuXm+f0PafrCkjsdnn2km1hcP2EpFnJq0c0DLhI0bS7hVSf/mSLPjyJTw/xUoKEZCh6g5/e3Q8sIikEroJFNwg/x3LktldY3kQP4Z8oTE2G4ZDfBC20VKbRpiGem0BS8uybshu7ShGVOcJafpV5vxrnz1pcdT1uVQzBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533844; c=relaxed/simple;
	bh=YL5ojEc5o7N+utD/duhaxVwfvEfcJligu3MMlMENdPk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D2q9YfhkCuS/RJnAS8PznS3KtSBgT+Ers/E+h4f1fqStl5qq3banrYZ9LyTSVv732whceixMukQzEddXCGdEmVPTo0LJPdaxOrGSoBzMwNJPdZZbJYxxOaIFplG6DuFPBY6MEvysOZkkfLpkTVT8hsB7H5J18aryKx53JaH+wag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bCGTJtCm; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bCGTJtCm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjMSggNmoYZp1GAstt33XOK1R+beoolhYjFR9g7NkY6EZQZEfETNdup4uwARQuIDnR19MqS5uzsSQvgBIq8wl1lZB9cmR0pTfz0csXS3N9bKFCa+sTwKUUSnmz+e3tEqc62s0Ud8Q9lWvpSYTzoTA8th4j1VSskP1VVfo4gHR6jS+aeqSYa5bUIMLGDuqHYOs89+tyob0K0NtrhpjrQ82iBzmUnKAybWYtHHc6zdeLMu3DC0DAWWHzpV1ErIInAeR8soDTCnFc/UEEhrSNuNBP3S3OHjPpor4YKNoT6nJO5R+wijwetTDpGvF6AyvCR9LaICrDgjgegJ+6wSaue5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcI5xAbDLya4SLL+VxkCd8jtyfk8FYbeHhj9u6DWcF0=;
 b=JtoWHHJK/W6ctvG65mfYFzo1QjQthoA/ieiU10pLYdUaZcD+nrWuDbdG0wIXZutiAj8pLoJn+IvvempXPNq4lO3TpvkbAqlT5dRK0H76ODFO/2ffErCWWI4UYnR4zZyF9DRPOP3uwcWvWSSD0ndVQFzvzzjVWE19fMdpVnGf17E6KAf2nWDH+yHMVXmNT9dr0GBoUHw+DOdDMkPoAM0+EIrcmi/q+q1juDXzxPdcZ8yaXtsTvKORMHxmQi5pUX8ie+0QwcAszIgv1VeX9Soe0YcEm+3elN1fNuYiHgxikCRsKFO27hdMA2LAnehHjEUdUMetKNBJmFPIcx75DU2gGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcI5xAbDLya4SLL+VxkCd8jtyfk8FYbeHhj9u6DWcF0=;
 b=bCGTJtCm+1AUkc9/cUbvVzHnsW6fG14ImEXmh8cT7qNXqGsEl0P9/gXrTWPHvHeuhbR4tDy+DNGZKsrndA5F5+pVLZfIwbuIip+QS15yoJLebI9eHGE+7Z+JhhIPd/yFq+RwsYAe3PRUxs10MCHPu1ggjvpgfyrJpRqKR6QXgM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:20 +0000
Message-ID: <87r03la3lb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 117/157] ASoC: intel: rt298: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:20 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d398967-812d-44c3-48c0-08dd56061c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n6lglwtaC1Wh2I9TuytD+VdGbNhTNR3lISueYEHE1baDZawbbM5NgBxsyrue?=
 =?us-ascii?Q?6Iv00cXYSOWsS2FaSmz/A4FVBbCu2aCekVIZ030gyCizerv3bqNqLnEfMZF6?=
 =?us-ascii?Q?8YhoMnGv/BZ7qEdwo+HOmNKSGKsHDam/fMkYtsRx361GdQPvPDiWqVuSEAaO?=
 =?us-ascii?Q?FEFTdr/2imHbedoh2G/GtkzRY+YfoSLE8+VvwY3zQmojlt0fmlwqSNaUEL0l?=
 =?us-ascii?Q?LB7H4WTuVQbzYREzwPgRjZ23FD0RSE9GehVxz0t/ZYSJ4YABqaPsxdWxAbO5?=
 =?us-ascii?Q?k4AX0IAAY7EQOQZ/rZgi0mOc4A9Cfh1uJzAxVe0Z6g4OoI2owdHRDtehQ7/z?=
 =?us-ascii?Q?VBhc+B5XNAEqbovguA1/J57R3o92MNn1xrJYAB2MDlDbx9Ay5kEcMJSpOhua?=
 =?us-ascii?Q?+qQ376FK4WdKGnNexzaM0YGFMz/dpWM5zjfTZZJqmoxzgR9jfpZjYy/Z/CnO?=
 =?us-ascii?Q?YWARHYR62ydQ389QwOYy8jtETzkBpl1WqroFIarqbrOlAGylc8+Cbs2MaEUX?=
 =?us-ascii?Q?CVXAJsOp8NYZyhJmBEDR6pVdgMikoniPNE3WuhGuQKFnfEN6zLIJPJ9fRcIo?=
 =?us-ascii?Q?AglHE5U3HCUqOTD17c0SgYvLICcxrWMRyzAB8p4zqo0yDaCyAUr+f9wZFOiv?=
 =?us-ascii?Q?8BbzcQE08tJ2bJAA5Q3e3pr3EhG1nK0eotXpyUEMYIHG6TNuRzZMcos8iSRS?=
 =?us-ascii?Q?p6ctwmawJAWgUwe2gQ+6LF1LLoDUcsum02qxwuWA/1Wk9goerAcg4LFuDhvq?=
 =?us-ascii?Q?7+abZlacl+WBp1LKS+ryzAbvUXJRgb6/4dGxryA/wHJeSfzOlFmJqhTWWU/Y?=
 =?us-ascii?Q?ksh4x3GVz390z54Fe9sfzOrHht1C1Hi07QkVFWanZzE4NdGnZ91qpWYgiU15?=
 =?us-ascii?Q?Mhiw5mgF+i3qE9Q7F6QGvIi6ABuRw6NO95RjdRRhXVnssiRAUCzEyXscLH7G?=
 =?us-ascii?Q?obTdA5CGri3zR+8hCRSVw9ATqq7dh09OcI/6YY1I37BIGqXUqaq3BhtQUsJm?=
 =?us-ascii?Q?k13/cSjpHdeAlvzzlZvootw9EDHdazgtMf5vWxPJSTrV/iuRm4TSx+lEzSir?=
 =?us-ascii?Q?1r6aAcyS+lpOGavce25LOH4TVvl3fH852EHS6agPrPw59Lz25QUve7Da37oE?=
 =?us-ascii?Q?qp30xPm97e28dY2xzwxAFwtBL97/gShaWgVP9Uork4s8rl/VRyetEH6MbWfD?=
 =?us-ascii?Q?OmZcnggK2V/hR1uH2cxu+4ZB5xKLXew4nZ3zoAUC7F2iK1MDv1+Z5pQ6gU7l?=
 =?us-ascii?Q?naYtV2pD167RMaGx4d8rqBl6UtuOD0oNFhs6r3dkTJYveg1fvW2QkQqNrlOM?=
 =?us-ascii?Q?0xfvQcXL9jxGX34rFekhzofKKAp/IhndiK2t9ylT+mj25JtTsgb2olupxmQQ?=
 =?us-ascii?Q?Wq4KSUVJ7yXLE4sUtWOu1z3ZHzupOlAqfw9AJIfMxZY0FwQD9G6+IoM0SKfs?=
 =?us-ascii?Q?Ssa2RM1PxEXj4BAiaXCYk6UfeFrVh0j3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GigWSy0/j7QNxFvpoUQjw5GQLL0nrcIVQNgZxvjUCfyR51Fu6VWOdD7pGYji?=
 =?us-ascii?Q?8woW9z0pJhvJvuaGRURc8cxslFOi1IlS7/9c5okitSxnzd1GQozFcoBBOgPM?=
 =?us-ascii?Q?OAJ9u6l82AGRZsUjWoHYdpu6Q+F4tgRWwUwStNUUkHYBJLiKlp0BP+p/S4/5?=
 =?us-ascii?Q?KvE1u29/x10nV3Kvw0zTGsSOxWCvs2+4taqNyc3eBNCsr6uh47Vy8ggUYAOi?=
 =?us-ascii?Q?SNIQHe0uXpiWzMGeT7ZbdcYLkouXVC9hoxZuxOxVZKR2EICnVOra/A8HwvnI?=
 =?us-ascii?Q?eeJY21NZDiRlqPQKDvuN8+EP6MI9hVysAvrfV/7ReBdTOaLuHcH7r6DgnDwU?=
 =?us-ascii?Q?te4NT9FP+qAW37/OXrT5dAgfc5n7D5JwWTfI0JHZXZIJBjfruNIgyGfad/uR?=
 =?us-ascii?Q?SDzvVQgFwqq4E1i0n4w5sZ3jdQhUWEXRev7CfCskm4mkH8RGPSIMbp2/CBEC?=
 =?us-ascii?Q?DyPLXIukQshq+7tfppsYzoHiyWE4UpWrCExftIyo/hYhAUuE1zP+n+Mp59be?=
 =?us-ascii?Q?FOn0TCuF6UnOW7brFho9P2CbzU2wMve1Dd0DmMNu5HdM6CndvKJgqcxYdv2D?=
 =?us-ascii?Q?zce0G9572pJ94v/B9CBro3beeVr7BPgW3+dldpKz1JTA+IKJKp36euClGsyt?=
 =?us-ascii?Q?YozuhlkhZUXjpB93ID0rQJGXpdxf3LzhEfIwv6ZuVkd/r5TH7re5n5JIX5iu?=
 =?us-ascii?Q?4aLOvKBZFNyCDXCgR1c/VZ6Safeiak0MjvNYqlQ9syerpLCudGoR1rKEQt8j?=
 =?us-ascii?Q?BsfAKmsDVUtmr6YizOelyPtYiQHrs+LFRsAnMIMSHfIy4B6YEbGZz8reNnZv?=
 =?us-ascii?Q?DYnMyW/n1H0h3RpbflJXMv5qPFlo+ro8VINKY20kq3Rrn/VCXZ310aNq5210?=
 =?us-ascii?Q?/2YcbkOkRe7f5+KrA2f0s5BsSPXzBOo5/gTgYKx/oTc+YaX/fPTvM+PqxCrT?=
 =?us-ascii?Q?Ar98S5EYJW+lgd1+Awkyiabs7Pudm0JJIbksApeeAVY4Ld3sXPOL7rmu7OWI?=
 =?us-ascii?Q?rxmaYHYBYPz5RznFgrX0ZDREUODp1YUK8DN0dL0gwshooPg5s87cUDdnlpZe?=
 =?us-ascii?Q?odgCzfWCPHHmct7Chrdfx1UEAFsO/nLcOesRvgL0CIQt16Tg8SeCu++/mFT/?=
 =?us-ascii?Q?vvxvFolUk+/Vm0/PQExfOWAaxh8RonZHI1j8dZSGYjdby9o8ZtVJZZHLSwAc?=
 =?us-ascii?Q?atuc7HbQllRnM3Jzw0ZezUA4N+NJ7r/hkkNDfIyeqt40nXOoU1MX0tSsHy67?=
 =?us-ascii?Q?llL5EMpLcG94mmf9jBcX4GO65Cv5VSDVm/Ybgar/2uEHdBkm145kI1p1q+58?=
 =?us-ascii?Q?/2kDU58Nxl006o5J5shw1DSi3rk7yS5KTDxFKCx35vdCr/I9eg2cDVxzNyuk?=
 =?us-ascii?Q?MHJ0nkrYWeDNAeW2Uo7EjdM4otBuUtAKFO2cFnTCFWQ0FQQCuVSAHqEe197Y?=
 =?us-ascii?Q?jCX8Fk0JmZS4alXM89s2ZH2DxG10nraxptWBaXaTmwLBLQjm1kT6Mkvtzzi0?=
 =?us-ascii?Q?uaGLUEQ0s+i0CB5hqlESSAN0zLu6InYEfR6LNNbbda2mchtzNzk1sKPgk7G1?=
 =?us-ascii?Q?bInjJ0P5jgy45VTre41qAhCqGCmiFR2XHYkeWjRIzFB1dVeqdBoCn42qt8Lm?=
 =?us-ascii?Q?572Oua5//lw0kz244b61MdA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d398967-812d-44c3-48c0-08dd56061c8a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:20.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRegaxXI1V3WmY6K2Q7A+3LmjdTbKaQkxOd7gNF3jhWavHTSlO4p5cF8EieYFYPSQoqr15i8dHIY3mxwH3smpv3xASrp7dv42uT553avUCifTu/jgqaDgkKlxq6bv9bg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/rt298.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 94fce07c83f9..7d1b9f1d9586 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -164,9 +164,9 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->num_platforms = 1;
 	dl->id = 0;
 	if (dmi_first_match(kblr_dmi_table))
-		dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+		dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	else
-		dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+		dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_rt298_codec_init;
 	dl->exit = avs_rt298_codec_exit;
 	dl->be_hw_params_fixup = avs_rt298_be_fixup;
-- 
2.43.0

