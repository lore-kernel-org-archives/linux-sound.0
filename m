Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174FF2FDC53;
	Tue, 21 Jul 2026 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598005; cv=fail; b=KyGsHvPLTNgBa/p9FCVDpX0uUMI4yhX/DDXwTAsmusHLZTXhQO741o7E0YDjnGHRMIhUoBPd02SzWe0Xf31t0mmXsGMST8Uuf2VrQ9ylmUdwTOJwO33/RaSGXp0ayqDowLyhXJrfuHe7REaDJ5SndYuadYP648s4rKPlZGTMjHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598005; c=relaxed/simple;
	bh=jqVJ9j9DEo9yTo71ZTST1i7VIiwd9buWDOkqyHGgHOI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TKxuFpNZbV/IcD8/P/uvyZOvPZJvWphIGLrEt4Tn83qwkZtbjk3sPl6iw7x7OYGe+Cv5aPIPIJmdDI1Ky7YNsuTOw4hJeQmMVktREa1Rcfhex47/Tri1DrkJEMPEJJ97f1uT2Q17PtXRbtXvORvzjmgdIverNbyBxwpOhAtVrdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cy0oaJw2; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cy0oaJw2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMHy10ZjBB3eiaC9Ri9qz7a0dS4uunJDiYChQKs6hgJDsN+wK2YbHarjx2XTYm/ZvdxDMaNKwtrEk63jyrnQoJh8MmSfrcP13cXQCuTpFMvK61m1rOkngdsWnZWrda02p4EmoPUVGg78m2FOKfhvWXkG9mf9/PH6tVyXXomPITLXm4G6SN0KoN8wpz72SH8fYuQyl07cZtMUTHrdo/lWQz21gA2cL3wG59e7FBUV3of3F8SqijtAe3Mqe9Qim1fgo3Pljur7T1n0//FAKBvDrwWvszReTv8pqw/FAPURCrh/ciF8H9qkv3V/wXEmAfjTX2DbMBPybsVQULZDYeMYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgcZEqxZZQ8tRJXcIQKh/fIt/k3CV2QFnsEqAdvturo=;
 b=Y5M2AiWbPFqOtBAI3Bey8k4UyUOThwXaXPmDGkYdnKlpbIxIg4kf99tN4xXDtFEtM5M4w+3Z4of6JhMQsKPokLfmm3wRz64FhMRdDrSpebix1j1kUo1QNq3da24GDMuLVnfqFWDTnpqFvxOyJXSM6GSTejADxe7yWntMUtB1SWUay9A+5Ahnopc9K4Bmy5DqqCHoGRgam4M4b6Qh4bp3Is8wEainjIyNDaC9mSHASUqUtoJ6Qp5LXDgyfPegZ+acNmOiuv/etZSVo8FEd4P03XB06Io1yo4d7z72/6EUYbxJdN+GJsV0bc21RRjRSjAys09K6ZfdqkOjQ+fB44jEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgcZEqxZZQ8tRJXcIQKh/fIt/k3CV2QFnsEqAdvturo=;
 b=cy0oaJw25VgVA3oyF+SGTEti0yDJHCnyXjiXLGaqw/DaTYAfzrTITCZQ8V5wq6Rs0mrKF7S7jFQlSUyEx/7chQkyCwBYjKk4nZqENRrhUVvsbJR0xIv9nJWNIFcFQ3FB734OJs5g37hhsiWoSKR0M/Ah3xKF+ZCiuzWuGg8emeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:40:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:40:01 +0000
Message-ID: <87o6g1i0i6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: qcom: sdm845: remove unused card
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:40:01 +0000
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb1d3d0-0046-4496-0cfa-08dee6c8fb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5GlcObkCjRxX/VAEMW3YelX/gEp1j2pQV7Z+476eQPfCm4T6aoUFmvKnqeGOIwHuNYOc2nVQmDxIuk8V7q9fsofB2Zt0/QG2Lmux8Zortf6a3UZhUfFn+4JYP+EfkziIuQzK0W8DPIgsYi2oH8w75P/4KgcSibSVxZ3wd2nCNTa3FwJp14XTK+D0ofHVGBrkOrTnfdbjqndf/m8V3KwVr/Q3J+mdJiBPvcZqzz7F64uoSrIW678eHXVTpJE3oKa4TOuCybW3Aftnrhxy6UOc4L6UNbQbx/R216Kg7TQeydk+lQB7V59X589lPKrocUJ9pF+7QAr4v8VlnXKFbBuOkt3IoWzwHK2BMoTCzia3MsfrEL+ta8kNX8reJVj95uJ7fFGRxJoBCAUgkXxiiG9R+g/NgMXdoLxCmwMCh2J+2mmkCnutXhRq+5Zq1DiVKCwirr5yEE4i+eqUPHNkNHtq3/VDP1BNkyalx3tXbaPD/PYs2g43q1ztSYrl1Us27kKUbKIitxePV9Olo07ll7XlTv51PfRCU9DPpluhNvl/FWOiuLFtC5PPNVFO6YNcFMCtJQRSTq9Mcr1uC3iQnAM0d7FtHNvw+OGSN8n1VDot8SPZ1p8Og2d23V61iwmoHr7qmS6uCQX4W6QOLHhB3lsOehIr9+lsFH5a45eqKAVXBZUpAHom6NyNEkNL1H6dRxWGExasg3MGETPeuS0mq7peiTplZ2Fb8og+5MX6qehkXMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sfjs9vQiST+ucpgPJ0x20rUEQ/YkUYaULJ2p2IM4r4hrSrtWT2BAZ2lprdBd?=
 =?us-ascii?Q?/WDHxHX99tn8dbcnowexk4qSZR9EFsWyD0TvV+uuy/rsj58gUI/M+0mtE31M?=
 =?us-ascii?Q?rH+LEJoMal0lYgJKZVrHeGHNs5o/KjU9gNYDYzTJ0tQnBPRlF0JmSOVdTH1F?=
 =?us-ascii?Q?U//0v6k5UjPYgoFLVLhSYGxxIAiUKy+rHRQrhCK8EU2ejHO5OBo5rzOcgW6q?=
 =?us-ascii?Q?98kzBIbXhHDVULmj6GMDAQww8JbRVCKr21wN3RdJO6k7ZK+ibjSoP9z8lIPw?=
 =?us-ascii?Q?NfeFQ5H4m9sNacEw3dK1mTuKJ8sMAsnXhLaesieMvSijx49RD+Bhy7MKuxyr?=
 =?us-ascii?Q?q2TjMBEuCLYSrEzrm42DwC6QXheD2UHfrGsVHB8sA/wztTs20Fyos4eWpu6D?=
 =?us-ascii?Q?/PkbI4HAr5gSPHBKQzEZciiJsie59JWKyu92vuGA7u64haRmScS75EN2jf0+?=
 =?us-ascii?Q?wr8lpxjg/Rkaoz6yOP4l043dgBVWgZOTRL1QgCpPO/Xhc4+Rz99zaxoYmrkd?=
 =?us-ascii?Q?8xo2OnzX+jk5e4qeoqX5+w6mfR5rJSbbeU0iTfOGeZqYvMDtaFLwOhasPEmw?=
 =?us-ascii?Q?bX7iXSOV7vyLojwkYuka6zx/XhnXe7Kzmo925JGFPrdktbdcEMcAcCXS8+Jz?=
 =?us-ascii?Q?jCXTN+93U4OEdzyoG4DvW2now3PZRtCL40JRwU7VOX8FvQzbysDJujFlLT6i?=
 =?us-ascii?Q?65C8pzwDsAPRD+3FOJy0dN8bPYfpYck8CnXDD1ADdXXS/9buiykZ/H2HOmL4?=
 =?us-ascii?Q?mg/DJmKPJjNKBFm4ZgyqUuL6GRmCk+NFv+d77KMkkCNgT75vfH/FXSpfSDm1?=
 =?us-ascii?Q?ZCrzWeOBtU7phCPAboGE1KJtyMUMd8KwdPeGYKrpYf3w2na8GTa1AFlxjOlZ?=
 =?us-ascii?Q?3q6JIr4VIkN06d1lR7oZ5p8FqUXfnPLJZsYJN41hoOUg6o6MV9xEosgt+kuc?=
 =?us-ascii?Q?gPvzTUYO8mf/0lTAxgZXGQkJgRdJrZYTdoOSMCVE869Ct7hrv8rFEQUCPIj9?=
 =?us-ascii?Q?38eH9tuzAGbbYeVlxS3HuJ5QtHJ/Q5oWJ7xdNkB27NSESHZLWjDwEAbXW5zz?=
 =?us-ascii?Q?rbd7NQToPUNIrVJn9exAC8bxrGlyXmF7Pg45rvGvu721t4aRAhiaJl6K2bWK?=
 =?us-ascii?Q?7ELU6wsTJmW/YGmiyGv0TTvHjHmvt7JPSTNGaEu0XZHi/srstB+U38sC/QI3?=
 =?us-ascii?Q?6pDaWKMONrZxpjvkbSH0M6fgZYB8yZdydQuGpK5dZMAh/2j50nA11gr505dJ?=
 =?us-ascii?Q?v8BzDKrOjtJUaA+VD8DFiHRhBNWXfxv4C+D73/cAbWkVwYRbtD+BHxL94d83?=
 =?us-ascii?Q?Ly6EJJlVB690xcNrX6cnn9nk7t/7JJWwtqawLXj9FHHTNYsJ0pvvtFXQLkap?=
 =?us-ascii?Q?o/e1MjWKPxzLRqGZ3HnadLUWoNB/paEgI/t3KeL45JRg5PgI+NSDxZwcpzf3?=
 =?us-ascii?Q?weUaRlbYgviAzAt9W7x5QHLP6ly/m+Oj+hnCMicvZh6nyiFbu0XW4EffciCk?=
 =?us-ascii?Q?bYP80Iaa01h49qX3VLHvVEarC8MHoOYXl+KiaUANjIPOYsEu4OZoTNr9Rhlw?=
 =?us-ascii?Q?oq2C2LJJokSTwaePT4226DDwM0ujcfw3gd4Kk1CIr/jNBvWgFgB2JpkPteBZ?=
 =?us-ascii?Q?lmpbvDwcskr/kL8kIAB57+DwMDT0R82GunD8a299owH0C8YfICi/fA0y7StA?=
 =?us-ascii?Q?DQBF4THsjywKGijGVtcMelHGn2Ui5+ZfFllPWSFJbdDg+D+nAbcuQzfwMXzL?=
 =?us-ascii?Q?jmitfL8DDMpmwJqk3elqL0HzQl3N/wWN+nVGlu7B8A3Yl81bGje+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb1d3d0-0046-4496-0cfa-08dee6c8fb15
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:40:01.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/3xNw9gWgt9mtPN+90PxHRyQkqdsXknT4+BzsrFdfLV7VvLNMpivzBhCtd1VA1FWJ3U7YBlDCQZJKNWyScze+Z4R0t0JJW2PqUPnhKcZBfzS8RO6jErd8x1f/oVsjCc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531

It is not used. Let's remove.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/sdm845.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 0ce9dff4dc525..6843ab8ba017e 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -36,7 +36,6 @@ struct sdm845_snd_data {
 	bool jack_setup;
 	bool slim_port_setup;
 	bool stream_prepared[AFE_PORT_MAX];
-	struct snd_soc_card *card;
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
@@ -564,7 +563,6 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->card = card;
 	snd_soc_card_set_drvdata(card, data);
 
 	sdm845_add_ops(card);
-- 
2.53.0

