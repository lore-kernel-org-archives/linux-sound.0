Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3841531F9
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533629; cv=fail; b=H9mgDxDHoOcFZci7ZGaG1FyPlUMx/fekz5QyXSZfsxZXspfMm6RgpPADUTl/UwjArxAru0KVCdbFEPK5ELWzxS1tmrI7nFJSXx8eWkL044Nmvm6/FJGHYzQj7oU3hDUfBsO+O1i89cFjzmKhM3ry6wM2At9xEn3skvzupXyAJ0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533629; c=relaxed/simple;
	bh=xz53cbOILt8e8DOa8bVa5R0+BCTC+CgqwA2AlaTVz/k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iBaYV+xvZl/cdiLlJZLYwW5FlJpLCMDuEtO3lAGyChU0cYhWjllNrUhXFDn1vGHh21lpQheVVMXPzxSp9OS5fDJWvPexCYEaIE87wmdrpchyHBImO+qcBJbqP+BqItsjC/tjMpvzvP/zUOMWZuwtuJ2kEcuGo9rM11jOI8IA5Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TlacTfY4; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TlacTfY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGTZhQat/Yn+m5DW0WoqcWf62CBF1N/m77uiWGQePgFJ6/czidiWTbjhvQbzEPfeEqdQmFGT83nhOM4vZW5phllsWha5pvPRu0yWpkWm7uE+jC7apBgEFQWdOzQGdorgc52xpDehL3Yb7B3/v6irTC2P7v6RgWWEEMXB9cLtDniHQZx+ecpBAz/sDLamO6L9oIfjLg0TzbiJcUbQtTVtb2TV+c+WGyCZYPdO1hIBoNp6OnHxJEqilAF37fZo5uwbHXQd53enK6NKCIz+Co/EkcS19VEDiETZsYK5HUt1QHCKG9H535gphT1R93IJduo7PmYLYAHbHi8I7G2ScYoxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYB+nJql7X3Vd73y4Nt5Mb8BcA1RYlWYsKgUYzwOleM=;
 b=E9rNIh4B368Y7ZVq6EiVMfpn+UM+xC6Fk/bgSr/ZcBQLEThSftBj8NjzvmZj191BCTPqhmlVuo4hZ2eoa4MXTMjcl9eribFhMTJUmj7Nz2HrCTZAtprqDc4PcDFtNKZB3EhPumGOUitxxql01RYprQpGcU/Snx4gGg3Jhe3UzSnUGXbLyU3l0WX6QFWsY4KuSUMzHm/nDz0CU+piH/9XrbVTH8AcY5GVBwFzvE90sorEk0cvAjekypH6KiTXf5Z/OTctPgW+SpHEGqqYjO2ezpmyNPlNUigIF5dL2Jl/VwR6HCmY2QuuUNz8MbcBSpNXknGQfGi4+PNccIFZ5UIm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYB+nJql7X3Vd73y4Nt5Mb8BcA1RYlWYsKgUYzwOleM=;
 b=TlacTfY4YQ/2LC5A/TBHmwnOb5HxPvygIBT0G8AfiTP99wJt9rjiCZeeKOEIwrUDizLH4Df/AfJsy9Mn9I7O0idXd8Ch1nj92ijdCLa9J71W60wzfZSqvtUcbwihMLczFrf8IOR/DkTj/Lals4nY/wRo8iTyDPRws8rgUbqW+S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:33:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:45 +0000
Message-ID: <875xkxebgm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 057/157] ASoC: codec: rt5660: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:45 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 1092373f-205a-4684-a221-08dd56059c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jr/sgdGrhs0Fl62OXgusWVAS69NuFPkF4wByXFgD44LFO2jegPDjJo7Zyabh?=
 =?us-ascii?Q?fl/5CwuFk5n9cUSVeKgexnHgSzAp8V6S0MAMfd56E6EiqlGbVM/j/+GUP9/5?=
 =?us-ascii?Q?RaR9KUuFMdYx7JSPpcr8GgnGfijzabWk5/FQngkHwgUimHSo+h//3nbii1hL?=
 =?us-ascii?Q?9ZBoF0flqhKtNJEcXeoDUtSAq2eFzncFt2h4MIHZww29M7ymqlI2SPICkL9B?=
 =?us-ascii?Q?eVoV9IzDm8IBvKXg64td0HT7JomHhPBWi0NTjSkYDgI/KUin24572ZcdU4hv?=
 =?us-ascii?Q?74fusv0SQKrbUN6Wubma076L5gn8e8VWkaSBP4hRGA88UBrAaBgCCvwe9Y9g?=
 =?us-ascii?Q?ts8Lus60O2mBa9VAQg950YsRXPpycSoFDyB6haUnEB5LO3vG31+/mGhjI5tt?=
 =?us-ascii?Q?lCiSHz5NxpQMQ5iG0MhwIeWBg4hbzg8FzCz54XhxrB4Uy2CFJKE1ucv7+O5q?=
 =?us-ascii?Q?Oue6Qu9ok9EcjFnoioZc5peuDjpo/221CN1CjZ3Fru7YqtWATyRePc7mA821?=
 =?us-ascii?Q?Cx+VymPE5dvaP3hRJzviGsomGOcGGLrCrsJd0qIwJNVOSHyhTW8/y9/SErvJ?=
 =?us-ascii?Q?B19ictB5ouv5i9HDo8b1UvADiBXlmtWh1/DyavBwD2q5su1ZYuvrsF7TRJPj?=
 =?us-ascii?Q?sxTeXeKfqOFCWdlPc8lOdt2xzFfDYMTzLakILIGp68UidggCnffZoapcpzFg?=
 =?us-ascii?Q?mVJP2t8gOBpfjir0YahTCFkn7+3gNf1gX7aU+cPkFaBk4Ez/cwju8S1xExQx?=
 =?us-ascii?Q?JKIL3H4vS8SOAi1x4Jt72BGfDmifbfx0/r4jdjuhPVqLQ6YpK39IofVi3ygs?=
 =?us-ascii?Q?Eq6AFxKK49whWwBHxldjDwLw7pCjVsfyuPWvCQhwYc4bRsSzpyzBvS8B1vqc?=
 =?us-ascii?Q?7hLePpSvwMV9k2CzNh2nMnSFNN878NOxGmh6MdABjgVoDfA9YUwkCzMhuBgm?=
 =?us-ascii?Q?LA7jKVVq6d9zqUlCxOsuNbgizzM7kUeLtzoDIimidJ4rJQ87kOVfLVkbCUr9?=
 =?us-ascii?Q?r01t+/hxovQQhRcfrFCoeKMaX97vZwijvSowTCjuVngNrtdxrdvth1CEUay9?=
 =?us-ascii?Q?vtoAaVCyw7z6zLmzmjH3XDiI2y3z00NX7K0264JPKCWHlVdHo3K0Mze/LnTP?=
 =?us-ascii?Q?+TfXcnjjt740FwiukcxlWt/a7aLTMyoUnVMlng02Np+A+CEIBWgFUEfdfWUd?=
 =?us-ascii?Q?aI3t2SNvLa0xoTd9MzSmC5+jytoTu/xu8+UhXGP/ohSP/deu5CXmLLaNe0Zd?=
 =?us-ascii?Q?uBMUHd5IDAW6fwU8cb4on6mcFlHzuXJa3bxf6xO/p4exvu4UXLjwDhk8mKkO?=
 =?us-ascii?Q?pGckN+S7ubfv9PjjYZ2NMRPMgmA1n9buYxh+rM01QHDlHOqOh8yNGNdoB2P0?=
 =?us-ascii?Q?aHtOQo5DB2zUYN8Lf2M14NnoOEw0SAoaFyAVIcG4clt2ut8addKi0+JGJSj2?=
 =?us-ascii?Q?YK0smJnVEah/F/t2viwI9DXWjq6RJ2oq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DslroNfLRhbq9J97mg8L5EX/uemRnogmvjknmYO9I7uQIpVyEeohhgkdeBaw?=
 =?us-ascii?Q?EhecGDUCocbzxjJUkqAlAHLfRaw46v0QNjnfsWx6+RqfVF7M1B2qKrQJvJbY?=
 =?us-ascii?Q?vc+UsJlFgNPBGBoBlZcQn2WgISiydhy1ZPxdVdaxOeuoVt4aHnfHFmU+0oX0?=
 =?us-ascii?Q?pxMCa9rGBOJH2tf33L3OYjcpxdtpMmhIa5ZJEci/ooqEb6O7Rcc+mFQrmp0W?=
 =?us-ascii?Q?7CgkHlTJcyzIN9aMAXBzVBqPVkHdE7CVAm1TUxIX+xqAa0gmcNI8OYHFx2nk?=
 =?us-ascii?Q?h2l2FdcnxqU07c4ypJ3ipOAb+JARWSNe4JmvUTFuihIhO8qLDFVdxnRtm6IM?=
 =?us-ascii?Q?7aQfouJKMBzNujAVSxo3Xhpj/Qnix4Rcuvtr40EP9QlGoTv0pQnbcF1Nv6uL?=
 =?us-ascii?Q?fR7fgAtypGO0CpYFRZN9/05UsxeVaiBbTdJoUXwUbNErtC7MhnIPCyl5uf7i?=
 =?us-ascii?Q?w61t7BLrRfHFP82NudWMc/8j6xo1os3ku2gw79kclDLlaXtHT/iFXLfujCar?=
 =?us-ascii?Q?lzDhSUrkwBwjSoiTA2yPVwB7nFtP65R5xtNR2p+g1G9K0v8EMzLv1Fv2M8m+?=
 =?us-ascii?Q?plQ1o7uq4dpq+y2dkGPk7fSuqx/8FUWCnnqD6Y4nLhcQ6fekgZCk6Es7+pLr?=
 =?us-ascii?Q?wsUF3nBCRK7+aBvhqOC9x7kcPHajov82O2cNB+rnHcs5J4zXrKX7/PMzfV+I?=
 =?us-ascii?Q?gnWJ1P/fr9XDv5g3DJmbPNjqOcbzdYUKZG3570zjt9QD1or+W6ISeN53gxcf?=
 =?us-ascii?Q?PbZyDk85oyCcPCLTtcwAahyJ+rT8jJR4Dt6DzISdGXEr4W53lbrA4O67GydT?=
 =?us-ascii?Q?kAl0u5h2kVesbYGay5EoEr+DU8rcpARQB+z1+sgV39LKGNZzraMganeUvwqE?=
 =?us-ascii?Q?OlhxIeLr6K9fUL6FHXy1V5JDvRCfGp6qRpdcKZ1dY5HfnyieyH6bN79Q9O0G?=
 =?us-ascii?Q?L3pzn4mTmeDOTpKr3i39wEdlanZclLU5IX8P0u7bU+aJ8RvvRdYRhIe3QUEe?=
 =?us-ascii?Q?ZPxSY/RtNoo9P64M6XgJntMW5F1VM/fkNzg1CB9j5bYYNdewOXmmjLcehFOT?=
 =?us-ascii?Q?p+xZpaLH46uuIWWGU7+Jm3ert1pO0ylhjZ/ckgwsDCTz6E8BGqiY8x07aVE0?=
 =?us-ascii?Q?j1nvuhlo5cpjsbUxjNISwfkstInVtsfcUSHpM4t9MvE8f1noEzGbH6fdy6kz?=
 =?us-ascii?Q?0SACz+LlnipXGvCfqfp+Gw2hRA+z4tT95NOiesrP5KMs1PQg/5mfrC+MV90I?=
 =?us-ascii?Q?TIcDV5NHnlMapq+S66d/Zuea8DlF+b8oh8AbShVQS+SE+tPcxt0Tn7TYezpR?=
 =?us-ascii?Q?EwURw1TjpbfVvICqWZFPQMZHCAPOs5JmyNWGP4uhExC5tP9l90ZSGqSzagLG?=
 =?us-ascii?Q?ZoLt9c8H9N4OqdNDjbTQoRY0rtOCsa0mhjJJdxBVDOpoKGSGp4gOOgoIo/vD?=
 =?us-ascii?Q?PRLMj7K9IgMAlKdLAIMCSLXgnJCDrAiKgaDj2nhlivZmQNsfFYz87Q1Ji8/1?=
 =?us-ascii?Q?dMF7afH0aisrS2fSKXt3Ml/pScyWvqRDx+9H09afZqMVJQODgLP7XL5QD2TN?=
 =?us-ascii?Q?Spf/ooMkKHA+gV0goCDnw4auw69k1L+rb72jHLqmpuqAU+N4QghAqOPnU2Ny?=
 =?us-ascii?Q?RTLrhNwbw+4YHnJgHljxxx0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1092373f-205a-4684-a221-08dd56059c6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:45.6723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvXU6Fj7Pg8TPxsl3R3HjBaTEqDGGVEkpcyZ/Yb6slk9+SQvBVCtqOk5iJudzIjsRcGW+Nk5XYh23xypUwQGwLEeID7EbGb9/hj8OlHfDFz7YOvcRiFvL6nNHjYVx8lR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5660.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 3ac41d2c279b..e335fec9fc56 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -905,11 +905,11 @@ static int rt5660_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5660->master[dai->id] = 1;
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5660_I2S_MS_S;
 		rt5660->master[dai->id] = 0;
 		break;
-- 
2.43.0

