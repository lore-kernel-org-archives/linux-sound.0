Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F018DF6B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533582; cv=fail; b=gdm33nyAjRFb64sh8//eH4XQ5ZM9QDOS0qizk/mp/3nOjqEMr5j5ZBgveIoIhW4PZ1Ti+Uh5C3IP5VmPRpf5x/KG/ZVvuabS8jVAzqW5S9547OR8rFV4qHgriUkGoXtOMpAIBMpvVuw8t9g4w+77PeQnqIaolzQEXIbfKCaZq9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533582; c=relaxed/simple;
	bh=0OodlRPEill0Hmuj7Hr+DSvt8LTy4lZ8l+6O3eY5dM4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pj/v6w7AjUE6Yh8N+PGqYlxcuyRPXUhAy+a5yDvlP1TcMUXJPRrSVFZqiPcOSMzDtsofGPOdPhXSt96U+pWUqtpdDMBgoUl/oa7Q6zhzDuAoiy9SlEqD64L8OSeYGOilWyPhIObb/MuTX2r/m86P61zgW5+wjydceFo1j95DubQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O8eKWlO4; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O8eKWlO4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLOetgvigiWEyccdOf+eLwwFVU0LiHGSzbxQWlVEYjiuxGC1q9P0RDx9z/ADLuxgVd37fhF0VwmAOm9NS5irtFUSlVejUSVIi+K+0T6tiFZMGs2Qj2/78IJuQramgkWYekoEHDkIt6XwHHzfNWqXkOIuHGCVl52VevUn+MObWds6YoX8gqnqB3Wjc67U8N8hwE+ZDWf4+sXLxeaS5Gw4IWPzeujXo5rYz9fvIlbp2kP4bKZSpkHga0KRyiXVWvag+6Fv2LGqVJu6/DDVTCx2zuj5oCSbAqrjVVlV/aPByOXaPvWd0HKc6Q/e95VwRjmfONqrztc4XLTGIfNgP1aRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jRkfB2daBJpTLEmHOL0Hqt8uKvazOrcDSe93LkRQjo=;
 b=fB3i45CyMBNv+FCu3Ic6Fcbsq4ZXH6CJfS8te7Sa2GPpoMS6Azf0AqeszQBHEvIA2L0L1nNxfC3gIlnoPupOIusGw6e0QxQ5iUslyu4vgR9LMVYm6siy/QAfpL4U7JVl7xbxp503WHTD8BW6oA+ycEBcvQhaTdDjqqPe4LQENpmqrMyQL/ct+1tNsop4mCSm7g7/tYawI3AJJDAO3CBeLDegRO5qmJYRQJ5A/J/8/+hz7warHlJiVV7UqeZjDeqp25pPehbNWXKHWDtRz2oXU5SI/ymKMBl7l0RV+dunt22FcgqibRcXkzYxkTNGu6XcvH41n86tsrzqzt65BStuIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jRkfB2daBJpTLEmHOL0Hqt8uKvazOrcDSe93LkRQjo=;
 b=O8eKWlO4JvXXChSyE1Sp3+PSFlg+Tb+YY4+U8zCwhQRrCXyKAgff+PB/vPn2O/JE6eyqVo45iJPeMmD1gWUoYXGX9VQO3/CYNp/t0XMSepNuXkb+o6bee9Rm7Fpq2dmxNbylJuyxLCKwFAGzDCxin08V/3Y5en41XYrHjG0BwG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:59 +0000
Message-ID: <87mse9ebhx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 045/157] ASoC: codec: rt298: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:59 +0000
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 94018132-0b19-4ee6-028a-08dd560580c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6PwXZr4HGZfiPSHxAv6pZNOV90NKIVyWGeE68R6I780R+/jDbZWlfjvPUN4m?=
 =?us-ascii?Q?7BVHvQHAu7dt6YORrP71W6J1l1FcMdllhl0pfhanm9APpHzrEkjHVgGrile4?=
 =?us-ascii?Q?ptud83bTu4qtbbHCUKFeZn/H2VkPbT1WIWPFGoII76g+WtnW6uDOzY9iTXoK?=
 =?us-ascii?Q?io3nZKJxRrdLBE7A8GzYlCUwzCwhT/8DvCMA1g/rHVPXSfRhaG2J/XzCBtZK?=
 =?us-ascii?Q?2bunySlVHGlTb+ejMAIFTMXIueY0o5mcSvnJUJJcFKKXqZ3qIDZ+BarDI3O9?=
 =?us-ascii?Q?SM3xSp1tusRZ59udDUMNXFwB85S/syzhay51dWh54cV2/kzupY4vPYvc1ZLs?=
 =?us-ascii?Q?DljKsNzwXNiGYdaShlRgg6ZIB4uujxU7UORKlzY3GRmZP2n1JBIOUT0dCmGv?=
 =?us-ascii?Q?YDNepW/TViViUnG7pfU5j0wDM8UnwSjLHhnd/dccf4ZBYdXMw8O0RoN18puo?=
 =?us-ascii?Q?xYHpaDGasBeRAx+w+CEhfqfE01bX1G9gcclT8Qm8+X6uWJDG7qbmmXYmbGta?=
 =?us-ascii?Q?MN+b+YramM0NUc103zw9d+11/f5JMlmHfSDLqk5MvrdCRB2GosdGGp7h9WFj?=
 =?us-ascii?Q?tgfGvENGSmh8ad8xTKgiDsHISNzz8lEK7gkveK1uZ/l+gjqp7Mr1AQPls4L/?=
 =?us-ascii?Q?dI4GT3a0USDZDLOtphbPT9wWgONiHrKarxgugWVY8eXpdgEgqiBOmH98IGz+?=
 =?us-ascii?Q?INTwcQD0oNea6tA6xsuzLEC/hpuiKIHrMfKDZ4AWWeZ227AswE9KbbYPYg1Y?=
 =?us-ascii?Q?sHLkSFT4e7UmUMs58f8hHuo6UwL3+HNZW7HJ9aLSmOfBss5VO5RsS5k0Ibn3?=
 =?us-ascii?Q?ObRb2XuMuY5NWQIdY7Bv+BHJ1zhvENlOAQHY6pyKhPYJdKebN35w4faPTpGM?=
 =?us-ascii?Q?G2rn8vpl4hlPZmcV7I8EQjBv96LC/WdF//RQ97gguZMXZasRxKAyBJPaJDv3?=
 =?us-ascii?Q?clfNnhgX4UFyZ5KORW9g9JsBuGiYlG18ZhM2VnUk6bzOcLcKcrPLwuvSKFuD?=
 =?us-ascii?Q?Taqh/kCVQrpzsUCGUraeK7o/alFP8fL0dPPoQgxVifSugXmOVZUxoEU0thQ/?=
 =?us-ascii?Q?7I2uNpChzJMaqYqeLT6yN+milm4FXdHojgzFnkN9SSsL/mHwwoU4paDa4aWE?=
 =?us-ascii?Q?EMY9pGr9bThHLT/X9hrxx2M0X8zsRB+akmIkTVX8vw4c3P+4SQFjSQ0t94Od?=
 =?us-ascii?Q?9xV91ZvM5+Y+xyqGQZczhQ174tIOWNoVKcHixTrlQsQD4yxaOZ18DgSyqK7m?=
 =?us-ascii?Q?Ke2uDXQi9AsbQfT2TkmHtivw2eEK/x9qRucKtJ2C7WYn5vWvXF10xNayomRv?=
 =?us-ascii?Q?nvOSqpRdsfypsXVxFFnrbzNxzANNqGc6HAsNyKxWdD2co6vYInFoWNQ8ba1d?=
 =?us-ascii?Q?HktnniH9EntBHU8bWiY955gjDI0lzqeLngyWEzr9AXaXGH+x4OLfjbNTL266?=
 =?us-ascii?Q?SlW6GgfSqdZPIoIPdLwurXFD1kEAIrWZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?45jvH/TpmVZJisqvI9J8nqBllGpNeokp46eRHyDHpO5DooyIAOSbHLLNZZnL?=
 =?us-ascii?Q?p9HTDYIqbKYKGNSgZsm9oEhEh+nsDW3MIY/Y2jzmSf95rXq+Sm8YU8PN4XTV?=
 =?us-ascii?Q?MolTFcTU1HNL8zwH4HLeSaEQlAZAtd0iBcBrgP/PbRXNwMIjmBYiTJFY1XtN?=
 =?us-ascii?Q?i+8RGkDg6BCZjr7C6gcoxa5n7NT4zopVdGkEuE9YqS0jRir+N10MsdCkBuZu?=
 =?us-ascii?Q?ecZcCDdk4vQZCpji/MCVeFVhMGDJJJ9PwDH97+wE4r7qPYXAkdIbse+MVh4e?=
 =?us-ascii?Q?U7jsq1aVEF/KbCUUqBT28rkHdLdlnoSwMeM6m4lcsvwuPxkD3M2JpJ2Tvefz?=
 =?us-ascii?Q?fyv9r9QM/mMOPe2Z9uj05kjkbGCJJZgNpomggWeQ/c5tAZaoEHuLx8jalmJU?=
 =?us-ascii?Q?W7ZKX/IH2acyMY0ODvEii+VfrQlqofNTo7ZdObuUzkX/5M86NeSfCn2/fkHp?=
 =?us-ascii?Q?XXELYGe51FIcJhb3VqcqsWvfWwvpzCrWsILdBshR0GWEhLpo0gH8jiE2tiGw?=
 =?us-ascii?Q?5SkT1c2fJuq2KYCyAyOdFCG+zPO+K6eekeaI2uuMEL+Zh0NLNN1zBnybpZ11?=
 =?us-ascii?Q?oIaXM2ljhTV5BtDZxdIZfJFw+WOKGUrvyRNGkIjXXTTbpuG3g7f+MTi0nVyq?=
 =?us-ascii?Q?10q5x25s3WGO0+hN4SSmyks8W3N5e2URKesOH7iutEIFm6QAFIA+hgPOUUcM?=
 =?us-ascii?Q?CFihiykuDnd0uD+prf3mz8q5yuo5aTW3IiKH6xzJ3Ne33zRsz+8n2fXO/9hh?=
 =?us-ascii?Q?xkx5fapFehr11cIMasONV35rA1Nx+dRBlUxJx43F26XfUOs6DEcwg4Trvz3N?=
 =?us-ascii?Q?tHmeGjp/Nuna/xSGnlNzLjkYv6IqtTUQpeLZcByoQr53/ByLNLc89q8d4XzZ?=
 =?us-ascii?Q?P33Y9eiH0oqHUtqE8nNam9hgGfdIpJuvVxwkr57TwphDOZLqL0L+hSFD77pP?=
 =?us-ascii?Q?lpg+fo3JL99rnscHwIAfij+k8GCtzWKmjGImx/VE6ukWqJl4FYn8pa0omk74?=
 =?us-ascii?Q?oRd9+EaKL0G4ZEvQ6aEX+NZL3kH8s7R9oizH2i7iVAQh6LHLpGkcKmPb0mtB?=
 =?us-ascii?Q?6NqyZDwDhjK589fqTRh1QVB172klfGqogMgW9JCJc2HSp+a1q2GDnrv4UFAr?=
 =?us-ascii?Q?LmDht7ao+rg8Mbe//OHpCnrn+bAozaNngKQTBil3wfKqDiiCNRTEfsu6ihOY?=
 =?us-ascii?Q?FhUPLLojdc23DebboyfF0jJxx+O5A56VXdhTdW7fd0bLsDpDFlc4it2CUmlo?=
 =?us-ascii?Q?xnzsptT8vQ+fURk5QTRmCRZ6G/zscTETgaGe1o5seBVLsk4HdOWfw+557Xy1?=
 =?us-ascii?Q?RDTJs0dFqs+zAdYlgi0aD/3MTQv9Vum/NhDnLVPkGtTSXNOkMLPYNX0tiiCN?=
 =?us-ascii?Q?QWOIoGPACXlNZKOmiiUQGNbO6I099kIZ3IZ2AXRRQ3W3e0/UeURiBm1+/x9B?=
 =?us-ascii?Q?27G6y1tTSipXiHLFfHLkJV0nzfdk4ftrBWQ6uGkZJGPQWOHRfnobV95EcnTX?=
 =?us-ascii?Q?x1r4Qyyx123UESBC7JPrC+DRd1hkBMjdSeJeJn0AEtLPJ+adQxwtDvA6xApQ?=
 =?us-ascii?Q?d/B8Dd2Td9F9qI4HGLh9PpcsjHAzOs27I8qe7kzq2TbNa7H4vrspXHgv7bzy?=
 =?us-ascii?Q?hCeDSOy0y19gygtHOqTqt+0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94018132-0b19-4ee6-028a-08dd560580c3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:59.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cePP3xLiRC9JjcOyYm8v6NyHObRQZspLhqvoRcb0b9tRp63c5tFt6eNN87hKE6vC2un2aJnp1rReDQw9tFBltqy/9PtsiyOvHbUlpmaK4br/xk78Os66rZ7BLT8Vo95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt298.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 13aef6c5e91c..b1fb8f365fc2 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -829,11 +829,11 @@ static int rt298_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		snd_soc_component_update_bits(component,
 			RT298_I2S_CTRL1, 0x800, 0x800);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		snd_soc_component_update_bits(component,
 			RT298_I2S_CTRL1, 0x800, 0x0);
 		break;
-- 
2.43.0

