Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCC198A36
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533894; cv=fail; b=ATYVgTzMPPJ3AzClgGbpo3yh0B4zqwEj5XVTJmwz6Ud/7Q8d0qnfqZvJSm8N1ro6b2Ek1qBkH7VBJ69p+Uzz+Ysrf0uiY9sqgZj8U1jF0S29lbO2zzPqZ1pkFBekuoHSs8Eq/nJIiBZkdimR3zml/M+kcX3E1smA7NsMFw4Axw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533894; c=relaxed/simple;
	bh=ThmGtWus6bMWv2QVRITVkWT5vumfQ30jgfRB7R/NJXc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UkrpMxVXfDObO/Q4+R1P0SrKBa89tCodNa/bHTkzjiQtjYR5CQa+b6NpLC0lFwEzqlXnOGIdkUhksg5PPztepJ77g+PDlZFbMQOMQS635TEUq7M0GuH5nfMr5rMWpsiXoqbLREg7xl7UEVN81T5JHD7IlwcfdR7NtZ1rHFRDThQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PJjuvvW0; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PJjuvvW0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xr8jRFLOPZoaNhpS8UGPLiJhJ+qGpmQX+QlcGJIedaQOu9lZ4zSLrd8E0vdwBJ7tduwtUQx66R/MCfkfYM1Nx7Y4wBUP/eckws8EPSRSolhMDUOBUO3Qz6fMFnnUeSZ+TP/jxgNODJEIeJAWJ8lwIsdlZb+LpU12yMvWYlPPoea1b2S/bhDj0JrF/pIEEK1IlxOmW2FTJtqn77gPhDHwpueLjelS7rUfRecz0c9RNlq8ttDw85OCJkGilNcelrLJS6i770oovA5CjSbvSQQF9RBKFJHREjAPKq3iiSLIx6MNlgwyI07hDh/w7GSFZJXPn4fGicu7mee3I8qWhtKsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btKEEc9Hv2sRyaHucxZVSdJJbbq5StiOljKLD2LqdbY=;
 b=TyGSIZK4/XcN3N793h/nrTIM7ool0cSgZyh1OXkov/XdXgMZ6nxBtEkTarf1/1HYjNFSUBesnWVcxdwldsKDhUFyzb0MoIH1Dtnv5sbsZuQvSrdUuEey9OjkCZ1NvWZ3JAjCe+MKx4Ec+sEKHosfmRRNCRYOfYF8kkUoPJjLgg/clMDy+jmUhTy2Vm5MCxiHsfhhobehnXLuPurh8oinHrr7H05NQfdjI1jognw3iYcQFIdj/9KwQaE9PREw6gdSFp1GEbMC1m6tcRzPTYWL3+cnPbsJ02g9ijB+x6sgUcw1Rwcck4Y9CLyuFkEFCZ6LbttElNGEQbogPAl8aG7Xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btKEEc9Hv2sRyaHucxZVSdJJbbq5StiOljKLD2LqdbY=;
 b=PJjuvvW0MGu9gBK4upBv50933f0ORo8vuwpRWNVuGBpyRhL7lP8CTpl6OJ4286ln/+d2ITs+/rDQeh5MevKizzmSMqDsiS/JCdD58MgrjJrVTgMdqrLUyAZg1/MP48uqbifXgXr0iK5LLyVeRq2oRl++nFXyjvE1+XG910nsyrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:11 +0000
Message-ID: <878qpta3jx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 130/157] ASoC: samsung: tobermory: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:11 +0000
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 76bc6ca6-e70b-4df9-52b1-08dd56063ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jFnJsR6k1Xv2xba9J32xXX0FqIhQzy3SiHGzWKvRlnu/gWjgyq+iayBMO2He?=
 =?us-ascii?Q?LxF2IuC0HiUPbOZLd9GuPviZ3WT4IJMuGwHiaYKgSs943mvewrfHh4mInwvj?=
 =?us-ascii?Q?tyxHAeKCY/F8wKwZw5pLfkoO15JskiM65er+XgklNWHqxQ8T2GUhiUWQGdIK?=
 =?us-ascii?Q?nuGs2TCZ3ZJergzAuy7XavYb11gVkgc/SqHSTmSXgqx3yC1gOkEleZ9lFPRC?=
 =?us-ascii?Q?wP5HdE3Sc7kJs9BJ0yzfHiiYtc9w8pD1Fe+gBYbJCb8PWlgQhyIMmOacy5ly?=
 =?us-ascii?Q?9Z5Puu8ItrjVzaShE9UGTik43vUedLhVHBeWcL/+/TaFBsarPsFWt2YMKMU2?=
 =?us-ascii?Q?dsA3hz7U8RbPtXYJ4ErPX/cxWn8EN3i6cvrHGomQREoIwYuOyj3zcE5P8hAj?=
 =?us-ascii?Q?c1gh3PJEKrWYtNBajkBWkSH+TBiA5MnDI4ub0QQM2Qe4tUuW1jLa9MrqnAy0?=
 =?us-ascii?Q?/xvCNV5hEPboUD3UvwGEmaV+/18EFVTzVzkIfB8/ikWyvxhIIdH4CNIlCJdl?=
 =?us-ascii?Q?9ydcE+9c11mw0DfG3SQP/iaW8TJKl4Fb9TW1WTopeiMz6/ZefQCvwzjwxw+A?=
 =?us-ascii?Q?TV/YBm5wJ2fGm/35UmQcO1RF0fU3VJgAxEThaJ9IsViFtiRdFU4SbadCAqsn?=
 =?us-ascii?Q?deJsWFTrc/KYQ6IxTRFbB04a+p6Lwl2ok5TJo+Gh76deg6rN2mPvBK22dvXf?=
 =?us-ascii?Q?GssI1Ypv+1h3+z45W36nSpYZWCG29ZDzn/BJs7dVLpWzlIqAKiviUkAmjwU4?=
 =?us-ascii?Q?3wxR7gOtl6euY4cxf5ETfbq6jCfobDblGtSHaYOuR9k4/0lx2yfICx0f8lGJ?=
 =?us-ascii?Q?TqchRd7gPOgUfCpQ7DEZYInvBa4ggvfN1KqWCfR9L5OlgVzHfdwBGzvbyK2M?=
 =?us-ascii?Q?1Zry65wEvc8yy/DCaRrVTsCtKN4QHDxaMxi0KeOhMxSMnPfJP3WbcftYC6tj?=
 =?us-ascii?Q?wZ31p6tiV8Cr3HVCsZtIlUZrXXuJESfTbN/imdWMu9oOEdVe29kQ5WRRPapb?=
 =?us-ascii?Q?0WtHchYE1HLrEGCP7LbENAjW7M3KsHZbHDSkucCbskF+KygF+FbhbECpU390?=
 =?us-ascii?Q?7+07Bz0KMlX+pX6otOE9CKAQYpbTBztiVs6hlwQy/VRDH6ilAAL4KGiQbSr7?=
 =?us-ascii?Q?BFHV7t2mgNy0g8OuSj5ig4ESzh9EA7FyTW79knvBLEd3/kYU2F7IzRHmlA75?=
 =?us-ascii?Q?KvEiAEMrU0AlDErLIU0OVZSToD1xM2tX+9s4Op3sCYqxHoLzYQiSs0yhdy1+?=
 =?us-ascii?Q?jvEr9cAsPQLwXCPGvwl+UO15+oPewe09I+DigRzWIj2Q7F6a/7LgSf12KqfM?=
 =?us-ascii?Q?sAVFk1okj3hClZ0Xr/gGtTCDTAT2k9TYl2eFvhjpw5BKe6vEPYo9acmBYV3v?=
 =?us-ascii?Q?2ODXBG/dRl26PGMr65io3GpTDgBUJ5I+zxaYku01kDJ5DIVGZ/BPQmj6MYf2?=
 =?us-ascii?Q?NLh3YrMntiEDcQ+xptkK284+gRTXq/Ki?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U/L4BDamEEySkFAXTyxR5JjZgikhiWIcEwP20PfC+g8g8ZzPXVAGKJfENkaG?=
 =?us-ascii?Q?XlwvzUTDkEcu9C1BGbQn4ZKdR6CLdePKknkqba9MG0wCOHoxjKlHHglrR/tU?=
 =?us-ascii?Q?dIHmqSh5DVSUfR+S4NbGbAgfmdQGAz4kgRWUiylj7R+gHoM5nEOtYx6yWFYA?=
 =?us-ascii?Q?Dz9Pcc/8auUcytrj93qyxBvIBTf4rE/SKC+CT6nFzChAt2ACv3Fn6QtTI1cR?=
 =?us-ascii?Q?pKG0iEoXyDEYTwupK74/1SC8Tcep+vDhvnHag9rQdUiMWHgtUxbkWcJoODUl?=
 =?us-ascii?Q?7eD5SV764V4wkA8Ct1L0TlKagv+TcunSlREEn9QZfEXPDgaj+2u6UwZ7C+xb?=
 =?us-ascii?Q?LmFrGhBlRyGA7vB8KmgOIIEq+IUgY+9VeKJQ34neDsbqLLapnWmN0fs9hi0A?=
 =?us-ascii?Q?OZ23E9V2wlCImlaXB8MmovG/GUWeRsJeItK9NCvUWKTgbseSRhogMmiS0n5t?=
 =?us-ascii?Q?zcWip6lgcz4wPJ0C33hmH/PQnr9Q9m2eLLUJZEY7N4qmeFTp9xWuISoLJ2lU?=
 =?us-ascii?Q?UyvbsWQ6HYo6+KIH1uzcETIOogbyUsdbjy2+xiHu9nPujljiSdITq3kXdk3/?=
 =?us-ascii?Q?0wLGVcjZEmPZTl6juZH1ZkqFzXT3Kn2RtOCN74PLyazCQwTJy8bjQrvoP03i?=
 =?us-ascii?Q?QQjzz9r80OwOr/pm7z7W9CsNHBGqFvRHWUf70988gFcEs+ASF642NwdcNT62?=
 =?us-ascii?Q?9tSjOyS4ppGe3oIWywhPmqmGcwehAjgzeUcvMyzJORPQ5G97+p0RpsyVKC7W?=
 =?us-ascii?Q?6G1LX6cTnqoLI4mqQqhozRav7PZysn9nTkqVmQ+gABm0xXwPFT2pNN6l5huE?=
 =?us-ascii?Q?xomjDHFMbk1eykET2qXVC1/oorkZmnh83wgCC6YLasBl5mojMxkce7/J8sUV?=
 =?us-ascii?Q?WTXlmqajAbyUqbNpHpBg/1J+v/ZZsDVvjjSrIV9s/kJfG847DI6qnx1lor5Q?=
 =?us-ascii?Q?nvOUeJVOJH/0FW3pVPZLnFn1UiO/QPpd8pcxCYNXQgpWmJ3WIDvaGqb2/Gcl?=
 =?us-ascii?Q?yzRFwybupdJCMphFxPzezMHYESRvTwjLzR+aa8bx2zTfZ7zj84ZD7mSkZHCD?=
 =?us-ascii?Q?P9E1c1iMIVei/nlK3htD1dcrLVxlqR3GYq73is4Rf56Z5o48J5jLVCRUPavz?=
 =?us-ascii?Q?SVMRWrgeTauTjtFIh8PbEyeZWrW4gQP38zT6FvwTTMl93chF35T7rxwY3XUD?=
 =?us-ascii?Q?1dz/N8FhVlzKRsq5iVte0yXqx5UKew5ic0Ri1U7ASnuHbwQKwaa1LA5HvZw2?=
 =?us-ascii?Q?m6/FrPGebo7crMv9mwHHAbWh8vIN5xEJqYwsZkVpGbpRpo8DdQvRbqhAqd4a?=
 =?us-ascii?Q?tLgUUPBmj//ryhYErQiIiWjiBqFHL/f52HkvVaRayXaryI8kuCqBEcad07XA?=
 =?us-ascii?Q?PIbKYrmSGMpHEokItfZS1Bu2GJaxrK2w/eFgtLqFCBtumuhTYZABh6l+JsPA?=
 =?us-ascii?Q?pUQdxLPME26dgtbJHZRTMPE0+juQPCLRxMgwlVROOd8laCdRG7zICSVRrBl0?=
 =?us-ascii?Q?oP3kSeGRovUIF8WDYJuOGWNP1+Bf6n0rjJTxUzbS/9IBEflpslQmeGHItMcr?=
 =?us-ascii?Q?fi95/tnKG0TC5fdn9sSfT2PpKMR45B4vhn1CK0SN01qogWv1t3zWANVfDsLQ?=
 =?us-ascii?Q?eVi3jH5X2pdFT8zLp0Bkmuk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bc6ca6-e70b-4df9-52b1-08dd56063ac7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:11.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGWJ+7VfxucnPgpbVERuPYBRBFzeTuJYVVDy62+n6Q1GPEyazJOY8ubLuiMWFvWMRwwhSV4UepYTOE/rCyZ+4fsMuXPTNdi9JW4rWmn+8NZGZBI2Jew58m88Aj5dN0fD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/tobermory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 2bdd81bf821a..39a8c129dfdb 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -119,7 +119,7 @@ static struct snd_soc_dai_link tobermory_dai[] = {
 		.name = "CPU",
 		.stream_name = "CPU",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &tobermory_ops,
 		SND_SOC_DAILINK_REG(cpu),
 	},
-- 
2.43.0

