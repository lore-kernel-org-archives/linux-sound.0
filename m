Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE6155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777445; cv=fail; b=aiZYM0TA+sC3zQIN1uyo8/1pE4tXCurkMy+8+By+KlopdZ59RnU0XdqqmSegOC9m1CS5IGvZ2SH+sY000GercR9EMO8MuzHeDYa+GsJV4l4v/VgBnWyBQhtfpsLwLhNZanXRIiPZMsrrhfYr7EeVPMlXBYgF7FPmWVwAlOZWRDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777445; c=relaxed/simple;
	bh=pCIxpBEfsdlwB8yzVCMIZyEVSUrVIL+hOhH6ZXOj+Is=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l+Gj4/zKwpTFAZDuSxDjgZs+ocf3HdAg/GbMcBsKbOJfmjglf2dNyVHCEJUZg+rVopCsFn/Tkj3k01XyTSqRY5bHBvSVloLR2J03COCWyLZ0APyNochuAtqZlWkZBNNSu2vVU6qjzyVNOsdnVv04miUmMZPMj06mF0i6awR+DpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PbtmWllK; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PbtmWllK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMEObEnIuGe8sAwZc24kOXy7Vfb30L+oEB0cfQdcgxr3eb4NvCwjmGetr9j1umxPhia7EszQp382qfx3zNZ7nrX0uSssxkqVSH8I4fm7Dlk1iT3Ccs2tCSvLxGts3tz1YwCogAtjMijc1sIag18XfaVoQjzFUWQ6Mvj0L9P+Hiy9nThzgAb0fSZ+CpfZdmac/1okszC/ij0E0HEim0guPyBuCTjkG+fH4tPFFPduPzizNU/wZKVlAhsuTAyH77GW7DM3X/tEX/EBIrEeMkLTHAagJXzKQhMhb2/ol42azXEzaFKqPG9695tGZXLHdSowd/qbjicPtBD9qcADuAQUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al2BTK6MCanCB7BJI8SdbdRxZgGFXfnrDOZkHu1vcdE=;
 b=Ws5YCSZc4mBLcopyNwDfLVUEotIFDhRBI3xQKJSm/2Rlkal27qMGP50FB7dVLH4bgmCgQYIv8yCcybWIQngka3Ha0va5oG2wtrxYtx4enf+EIw1MKDOMjjxWgqfd8JTwdAdjDRAJK3wd/4nGyyW8sp5bualrfYzdu3rZUOBQPG+qV6QV9EuC2Kj4G1mFv+IxsUmVOwKoKREQ+mZHDtvZdesaVpME5IKZtgs8+/tqxLuUMTUp/QbEKA15+UXW/uj2PHY8UFeXJqom9uOVd3V/dch+8WikMzNY3WyaWWbU401QtW2iokOpGo1cGYL5fyOas5X+qXdCj6wWtrLQ/R49hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al2BTK6MCanCB7BJI8SdbdRxZgGFXfnrDOZkHu1vcdE=;
 b=PbtmWllKGwbTfhsS9Yw4frc4lxAchnYJDrnlT1Og63fmzgU3sLfV6eqwXrYNLRwTPvi7IjDRbiRNa5VoaKCkZsmADCeWemZ3qWGm/E+qhY1aCKV8mvtFbhUJIdU/rwB7YIfeZvLnkBP4tCN10DdckC92hLOA3rjzgs/PxKzOOE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:21 +0000
Message-ID: <87a52jyuu6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/8] ASoC: renesas: msiof: add .symmetric_xxx on snd_soc_dai_driver
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:21 +0000
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ade5ffe-f997-492e-52b3-08ddfbf2ce30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S6OTQmOYIdXLgGnNOqgmhalvBCNNNGCvL4EoeRmqUW9ryPSx3f+881cnkCkI?=
 =?us-ascii?Q?z3UQbCKXCOkGN7v7o1IbFUjpGouLmZ9Fd13gNhoxCPN5eJBWVVT/VPY3CwO9?=
 =?us-ascii?Q?TZzATyrjIFc9gRneHJs8tTSMPt1d5zUZRlhq13Z/EjFJjwZsgP38tHsE0AVg?=
 =?us-ascii?Q?hr7oJKVyHPrQDSQoHKgJIljYq11k0j1Ydm7g+C/WR5DiLnjmXdKwpTz4Xj3l?=
 =?us-ascii?Q?oLTD+t2pa+SAbxM1YPrgHRxR4zCmc4idoNaEWt6CpWg2nkqO8CaymSYgnCNa?=
 =?us-ascii?Q?6oQL+dpodEhGlDkynu4cvr0LWIMP5rJn1+pPspJYnH+bIA5qcq+wbF3OLO2D?=
 =?us-ascii?Q?DiKFn4Xlpo1JlordeQp9M+zNUOybnmYji44fxZnunjyP5T3rI632ra51UyqU?=
 =?us-ascii?Q?RTtuUSj8K8Ozs0POb9argM8xW4dsFpB+syw9C9JNida2QCQjSDSAn7nNyeva?=
 =?us-ascii?Q?Xap0fHLYeLf5F16kyfxfy4h8IdmXisS0XQ+t7WOCPz5z5JVpT8Lkd+6U9hwR?=
 =?us-ascii?Q?vzvQPiU7IGwztvTVKXmlZuxW6Ubr9+fcH6pzr+ZeazvNx52TsnrmL0YXyMHR?=
 =?us-ascii?Q?EL3JrNKM8lUhhWTgJ/hZEI30yASHfmqaewU0kUnLpWaa7XnN2DIF6ubweMkd?=
 =?us-ascii?Q?jPEeU2sNUR7EMk5SChaEM8nyr7W15ENI8cSfFoVyKUcAacqx3cut6zq/dqUy?=
 =?us-ascii?Q?h96K/3Lg9nto6jXiErlRCfqxQm+R6qLxxY81h0JUo9HXSH9EpqLy2EkAdSJC?=
 =?us-ascii?Q?6EoXny280BSM+Kbc3uYNKMwxmlCtz26POiAFqmett0LnmcJk0m7IFPiRODhF?=
 =?us-ascii?Q?c0SVnXcpvn+dNClI2zzwPiwCWduN0zKRkv5cPsoSb5580raitRDb8rqCsrKO?=
 =?us-ascii?Q?xgmDEbYtrG4cVHwsagmJrD3df4d+3o1+NNOjDy5c8zU/TmHwlFHbsI6aDXyo?=
 =?us-ascii?Q?qAB2CZ6570fvu3de4o/0mg8LcWNsm/yiGgdDVAls1ZgmPqHiu0zn5S7SN1Fc?=
 =?us-ascii?Q?5xwFGieHZA94/RZgFBgMhHGPVA8HQYqYUyHOqDrQ+sMHG3WMemaM4Zx+TDDO?=
 =?us-ascii?Q?EPD7iUOhZEYqNleOKJSNdfxEziOB1Zxm89r6RIcUrYjjjlktvfg9EzhYRz6X?=
 =?us-ascii?Q?Hv1+Pa/sIdwEwjrV5mqaxaQqYfPCQWXOp1R20qMcURkfYvO5Pi4xVKxhlWSs?=
 =?us-ascii?Q?qqzSmAFcORs1tuhliEeEgp/BDhBX3UZr3Ngchc3CPui03WK8yE3XSzLurbgD?=
 =?us-ascii?Q?3RkvbXY15MVxCwgBrtSF7578+qMLuu2dprlW0pHHFhpzgoZcRM0M9adPISuQ?=
 =?us-ascii?Q?FgvK2KfFUFE8JTkcCvwLHXvaw49LApMx+1aYz808HKg0mWDptQMKHaCQTGqw?=
 =?us-ascii?Q?eoiCI5FlFJsKot9jhIAQaWc2rG3dhGb4Kz4GHFzmkTmTuyMey0kF2UnSlGh6?=
 =?us-ascii?Q?jK7BSwW4J1C9XGqL5AQ0xjVrxMuhflLPgxdY72aqCowTeZs39lYKgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wxftroxs8+9ACEf9fgAbcAtyxAPEsFYvohYBoEPfe0BKb97HHujzIHqWYsG1?=
 =?us-ascii?Q?mD9A8fsb2g2aTgSVAxrZIdENdyc+t66oTlj/P0FGcpIcLm7th8WakmOoAdTH?=
 =?us-ascii?Q?gPgrEF9GMsAMLZAlfhCGZfbiS3ko80rvN6luX41HI/GpTxywbg4R48UjL4lE?=
 =?us-ascii?Q?AK/Z+ki8fPh2bqIExgGzaE63s0LjS+v/wDiAkEth/xrtQeHlPx3JsXCHTu8L?=
 =?us-ascii?Q?8MArLQcUdvBOV7gbO6oS1GZCKuoNteEdpcr3nuTEs9z/byvroKeOZQ4CNlaF?=
 =?us-ascii?Q?jtsAjGtBYArWg21GTdlpq05CWRClBsRi8rzRUIvk7Y/UryxPODbLE6lAxeAP?=
 =?us-ascii?Q?d998rY9yEBqZnb6WW8szY0mL12lNi7oCRdkq1VCrpJGWH2ybdCcJo9hWFXQA?=
 =?us-ascii?Q?0c1sEExWtO+4FYczLZy/8QtMiUwXc66A3jfG50GziUBxpNUGmhl5uDTSacVu?=
 =?us-ascii?Q?hbCzZeRz8XxhgNILdGQ0qwJjtEFYlXuQrdV0CWsXU8IDjRECuAZcGC14tEFT?=
 =?us-ascii?Q?lRCr+P2n3UCPNownAw7lrz/TyZI0pz0X1AOS9tLm/1rf39l/AfeGLSXExaRi?=
 =?us-ascii?Q?+hEh0T6bKgn4WFXI1MoSPMPYZTZML1d5XJ+t81P/cCOkw4tS7RCP9F3ASd3u?=
 =?us-ascii?Q?T74HDs3On65g9DCzi2N08L7RfEOjcd8QX/xS6rwUbfUKLtkGonZyzSF9yZKw?=
 =?us-ascii?Q?60Wf+/CTft5QKzpehBXyg+ng54Bxv2vDy7eMasxQHuL/X2Tk9n1nohUY+Je3?=
 =?us-ascii?Q?bkDC1yfKUbxOXY0mZKQHs8Um+fxcnhJ+PoIHd60rDGeCiBhyqk80BATLSmRV?=
 =?us-ascii?Q?wMnHYanYWnE6OF2LMN3GVBCg/aZZwAo79z+w+BZD5x3D9uf4/pfosIA7trxP?=
 =?us-ascii?Q?SRCRE5/hoJQWitRLtQAKpBsuhfQiWAXaPnTGdJIuvbYElj9fUBGfo3mZbAhi?=
 =?us-ascii?Q?5uOELs2ofJ48VZFOiyCwH5Zg7+MPqczI9OpA8tFy3mCBLshHpc2INafRjsZJ?=
 =?us-ascii?Q?bckCcuFdrWpEnzwl33CWCrz5Sbkyz2FZNhvQzbXxQt2ADvHbFOgDEaaEgm6f?=
 =?us-ascii?Q?cTriuJ/tSl6sRvZkehYZ3L9LITvXZygAn4yX2r67o2GSPMnMkUOwa6r2PCCU?=
 =?us-ascii?Q?DA1EzT+ezKI6d9Jkc5t/lWNz7dpTi8zVFg7KTB3SkOTsPTeKSRM5TX4k+IDz?=
 =?us-ascii?Q?eoCPO1SUzc/NpSjZPg9JLagJEWhmrK6wWgPXbBOzfYjGcBzmcTPrZK2hkdR9?=
 =?us-ascii?Q?K0IB18fZpDQCHumGK4oTgq4CquSbTbWot9cNHKDoZVSXJApERSo+RQ2dRLsQ?=
 =?us-ascii?Q?2W/FT+hGCcvsRHzXvk4lYCeD38jYgDdCeVKIyr/8HUohSjy0To5bFN4xN6kQ?=
 =?us-ascii?Q?uf4tVxlhtuBU7834C9WrTehaQLTSwOOL2vYqHyr8BunkDUH1P7x/1pmF2R+J?=
 =?us-ascii?Q?I/imVdTq540AcdMAsz9dYsndGcjORguedA8w5B4C02R8QTgcRXdAnkwa3iQk?=
 =?us-ascii?Q?prLsTRUhjllscQV8UY2V8oATWV50K/KsfjzcvE7lvsdNOCbB4h8BT7QAmiuh?=
 =?us-ascii?Q?KBZNVxyy76Nk5u4n4l8nqzb7ZLjQwnPZVK/Vd0oL9R2FTOL3HEdHVH5nzqvf?=
 =?us-ascii?Q?9vIyQAvbOFTQyPrYdVVVmxc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ade5ffe-f997-492e-52b3-08ddfbf2ce30
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:21.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLktAQDZ4jm3AqStAAisaHqIjhbvidrwRdNWJYVwbIjD5dOuYNtrzkcM1N8xKGcnzz3UBK1iM+MXI6RAm6xnaYBu7OeKAshtxzbmj7/sdKyfs64pWFDrz4ZO6ZlqX6PZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

MSIOF TX/RX are sharing same clock. Adds .symmetric_xxx flags.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index a239a88543ee..d501ad9d7141 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -338,6 +338,9 @@ static struct snd_soc_dai_driver msiof_dai_driver = {
 		.channels_max	= 2,
 	},
 	.ops = &msiof_dai_ops,
+	.symmetric_rate		= 1,
+	.symmetric_channels	= 1,
+	.symmetric_sample_bits	= 1,
 };
 
 static struct snd_pcm_hardware msiof_pcm_hardware = {
-- 
2.43.0

