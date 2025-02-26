Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72918DF60
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533594; cv=fail; b=rz4DWcgDKjdZ9DUFjLOZXzQtXIlAzXAfY5QIbNZLJY6WLaDdX1hF5C/a9mXn5gXMaEnvrfK3iJoEaazPIlt3kBia6i5NCCNNGIV9mjVmZkPBT4Zkit5VLqjoLqBCN2nIcaFOAVBCaBNQ89CokTu0Npy3CG9R+mPt4e+GS7jUxKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533594; c=relaxed/simple;
	bh=Gn6f42aaMnHLy9iWdU5+AFNDQq0w76SuCHgbPabJG7Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OBlWL7zNEVQ4pSt9Q1h6STKjgJkS6o113CTh6tCKxBhqx+FE9+qIowcdZXcaWHYrtMdNXVUVWmAcN9158k4I8Mutvnznpo4KxrsDvzbvusAsykfYlSBv/djOND2+LoQwA+j970EmqkVaKj9vkHJva6KkGK83AQVaEPh5PhHsvEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IjD4a0Ja; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IjD4a0Ja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGoGUucPGiJTAyoKqmH0d4JMEprThgMW08l5/EHZi9sR9x1uX/kIhtihhfnr+1ZsLTc2Ujbi5k5SQoXU6TBiOI7CIYCWZYt4X0nRQ6Ud1wZg2CxTPpJB+VdZ24M1ZKjHU0Rr0BGrlP3YnqWaILUmoF9zSIY0mtcM5U4rsePqzvSCkhJ4QC73opCS7r5OsgPDqavfmjlzpEBDfBvN9vzEGA432gW0KRzoFzjfSKOfLLfMahoTdV16jTMOh8K1nCvloOjZVjoPrtKVeAMBSZh7X9rQdEbdX78WNX0sQ3rRZYn8xGX/+lwsMWlQ/d4cp7/f7Vz07wr0S7C1TzS0OE3RmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTH8ukOcG6Nwx7Fr4oeN0682nOdM0SxpC7/oe0du+X8=;
 b=NPlcJipsewIEoO5md1j95DeChXwsGdXAttrjTMiUJj3nocDEUWwrrhn0GbVvxkMpTu0XOE9drFmqivikPXSg0FFaRgVajBLbvfz0V4zksXvSPJhyN81pEIv6cA4sKQBafLsolJWKFPNZ40L1eXS991k+6YLUSusVypRz2vN0TTQ8OxIMVUjtia3ETAel0IE28Ynh8VNYzaJ26rv5yn8n+gQ+DSFCEKcVgb7LxTj0nWt6evsY05zBwglmNorN5BLGw9zmQYpIicqLtrqlCkZwX92AFyIOgy0K3v7+WwSCql0a+odhdxfkH4narlx/FWy/lD605b74IWsf3BAImwCW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTH8ukOcG6Nwx7Fr4oeN0682nOdM0SxpC7/oe0du+X8=;
 b=IjD4a0JaPJjg/si/EwojrOrIPNpxneIW1KHnlD/a8MvPQEKVFViyoclvAi1orR89rUFRncuDkWNIHcZHX17Jsda7CtbCppnB+cKoYrQCKLOMUu/HxJcsnnQwVT1lXQEjIkS2AdNvp72mv71bRMcVBH92DO1F8N12GIYyAvYGJVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:33:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:11 +0000
Message-ID: <87ikoxebhl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 048/157] ASoC: codec: rt1016: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:11 +0000
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e818756-dba1-473c-111a-08dd560587ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e2gANNMEUZ2tR6IZubKBGNMccah8Yorb6bBo5jDJv9yhyIfLYXCNaDgG5PCx?=
 =?us-ascii?Q?zPAVCeU/sO1LBYwu/WPcTJvOY4VVFBXeufGEEl3wgxryBp5EDkIdxUGny+2J?=
 =?us-ascii?Q?OEbtRYIbYQaDMA1Wb9Tohy6julIRls3JyjQtFcPO1wXbJyjOBbP6Al3hL++/?=
 =?us-ascii?Q?2xZvBB29qeGAxUtWkM0pCIwPUsRw7w7LRjxujZsBuZRRHTbzmiGqmInZUr72?=
 =?us-ascii?Q?wrH7QrorcXEe+ozuy6giL+xurp1Rgq7KRym61KFdcBj7oH7/3Dpr7go/HW3g?=
 =?us-ascii?Q?mLSTT4yRLBgwuw13Dh8oqTGQtTb1g69YQnvfraahLzlJC55uBhPYp//nYpZF?=
 =?us-ascii?Q?x5OUJqmBvW/TNVdEnvvHZbSTqrwnTEg9MgJb8eDoHsLPNETfMo1I9O3t9CzM?=
 =?us-ascii?Q?mbNXZbqx8Po5YTOfRfrVXlDsvKUzQnJUa81Yuy7VJRAMk+DrrlAbTwRyj7PB?=
 =?us-ascii?Q?S9F15mDYuGuz05FmaUTbyqhJiM914WvuW9Bg6TGFLmNxh2S5YPkNQOfGn6M5?=
 =?us-ascii?Q?hoqA66PpvGBuvJsK4y8OdyZLm2oTsljvLOnW0mD56rTd0eNCR6/zd+Wz0lTw?=
 =?us-ascii?Q?d3nRkEZVjhRlcq4MFmM5RkPCkKbhBk0fcS9F1wGgnF7nbjpqdIZ3psnka391?=
 =?us-ascii?Q?3P0OSDxNWtPNUrgrcIQAfCUmRXTlaewRyPqh/5J5eoac9XB0MRigWSDhtJQH?=
 =?us-ascii?Q?E75uuqFyhSCykrTq2p4Yk4Jwg5dm7vCXORrgV862R7BFgzPPYdcnPbsDNQCE?=
 =?us-ascii?Q?9FzqvV9a3zYq/ghiLsXrwjZsy/XGUUyvr+Bo2sHr/akZvgVKuTbiry4MfPkZ?=
 =?us-ascii?Q?R9VUEBFFguUNdnSvpLy5kPK4TchPSWz5Gm+iE/N7tePiIj1TE2HBrK6zIAfo?=
 =?us-ascii?Q?jTzNb0m1qHAspZpUldZ0IKznQjZfX2+fsnot+EwUadb4bO8J0I1Y3HHyVCxl?=
 =?us-ascii?Q?dL8mNhReLiw2K826UxQ2fInmb4Hzs7mHvUVL4UrzpqxqcxHO2rTp+jiD8e2t?=
 =?us-ascii?Q?9xwQ/c7o0jxc92m40sz8SzF7fmYv/mRu1tgqUUZ6CBSvyzlDvREk2OaXQRrj?=
 =?us-ascii?Q?XQLNhT/4W3qfJlXz3zXQL47vr24Gf9mRsbP0TYM8yt9ReFdX0EFZq4dhFBjB?=
 =?us-ascii?Q?fj4ks1FKRcaxb3+pzepCJO7PIvACDsW8e5zWaCFgI9sFXFQTWumtagTNF9us?=
 =?us-ascii?Q?rwjpmppXlOyG7dnO4n2H0nLLASwdOW8nOZwxQ/mJLA+lNtUGhOQAUyBke/zq?=
 =?us-ascii?Q?fZXMNazdKDIfTy84lefa9FnOI/jqQlbdKuhXi/7opL8aN8adENrG9D49RRqN?=
 =?us-ascii?Q?K5CMgvZqrVha05mj7XZgip8wpaokdG+dlo0f6+on8R+1VrOfiBAJnAswwwMz?=
 =?us-ascii?Q?N5QtBCt+sYDDRchF47B6+7/hpO0K+w1M4zfCSxlvUN+WqfJCpB/t0zoEtfa9?=
 =?us-ascii?Q?Om5gPjQuMBQngfLF3S138At1WsRgFKqO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vQPaPnShtGIPRNMf/vpA5H9zPizUxsu1zjlItUmbsQhnJ7dihOfnKRogYWt9?=
 =?us-ascii?Q?23qpY/bvyChW18UG+uYAUBiyEje5Wfk8Stc5ZyXmnQtwWqnJlnBsgo+BFcpd?=
 =?us-ascii?Q?yO5ay5/evCo1D1Wxp1SP7MuEWMF78Gr9a5ICZz4p+Z9BXLa7lmB1K/mhi02s?=
 =?us-ascii?Q?BO2OrV/SgpmTrk8qjxYYgIqQaojn3t5wjXf/7z5f+OD/utcTg21MavzfooGO?=
 =?us-ascii?Q?CQdvftgJJ780EWOjyrgQTLP9AK6oTjRygffx+C8x9j12hb5XVFpyO1tyfvvw?=
 =?us-ascii?Q?Zl58V62RmhmAjzKdI4hdXNi60Vge6095Z4Q40ApaNnCZqRwajGvEcgeucbgx?=
 =?us-ascii?Q?8Y5RGiF4wgsCAt+nUn/AYtREs2Trwk7A5A80GMPIv26/+tS8JAFoGtAbiF6I?=
 =?us-ascii?Q?c+E/2CLxNKymeGQaQAq55At2zBNwYS2NtMuhVxaqIlXUJpMBB77myzUn1IpH?=
 =?us-ascii?Q?D0jkImDNOZPmqHIUtO9in4BC3oIoEg16+l+S5QchLOkhSv0S6HX/73vECo57?=
 =?us-ascii?Q?yOxHK8/z6I2SwWiDho6iAatbHtSL09DTil08R6W8OfG9mcCTTi5wUWtrdjj1?=
 =?us-ascii?Q?250FAKkqeDyopl638jLIIHLOSJjIS7BYGPpoovzHzvW2Fpv/Dxb6eIWWv/aJ?=
 =?us-ascii?Q?lAB+gEjvIgGw5HSCZ36Oe8pwli4P/OQRhnzuVwZ1xqw8wS2Q3eH8Tqh4xA5R?=
 =?us-ascii?Q?HWUYEfs+JeoYGu+Y5c1mn1JoKvarQDUHohr9IeMCYK8mCTDscBgDiNQF42Gt?=
 =?us-ascii?Q?+i3l/CuPqg88nzDgM30x0dfUfQobHSrS6+bckeTKwEArOm9LjhFF8NvKuaSD?=
 =?us-ascii?Q?8hdR9anliPsHctlcklUaWV/YM7ePeLmMKTBcflyKGpvs9MS2x9uEke+WCct1?=
 =?us-ascii?Q?jn8IaCwnDDYEH+L3eTfF48oWUNN4nPsGtsDAEVrfCYpRlBzb+uWCvhGoWiX2?=
 =?us-ascii?Q?3tUtia6jTzEB8UUkKFM02NjwiNZij+IzBqttyT7jNptmIpuK+sysGhoFg+Jh?=
 =?us-ascii?Q?DdYLpGlsxbcE9gM3lJlogSnoIMhcWf+13dCWn1REf4a2XffPivcwvnPem2BW?=
 =?us-ascii?Q?CioVzRQRYM1ek37e70WAmDuKyfcYVtJqgGmvuUPTlceC+99XaVukPOYhM3vP?=
 =?us-ascii?Q?+zjI/9kMupZYQlI9r+5Get6mgOwW4SAtoogZalTacuGsIhFRgcHWb6V1VdEW?=
 =?us-ascii?Q?hiCWn+rXtK6YsOwmtsnEg5lbhgWGzvWA67ThT2LfYxAVymjB+a0XrqPvLrTD?=
 =?us-ascii?Q?1JLR2UWGjltOP4QLNYrVcD4p8OovuiT6tl9Q+WcfZ8Z+5F4LQMDwrUuL7eAd?=
 =?us-ascii?Q?4qMBEN+chO8yE0Fi52z9IfkAvJrPGYXLozoR3PfG0AcilPZR+lTQ6tPl9P31?=
 =?us-ascii?Q?0llQ3jlyYfsH4yeQG9h64JK8/E37E99s+NHLfExmmCdkCkdwArRjdzfiTuHa?=
 =?us-ascii?Q?r+A+lgHiPk3dSHMaZFGtgDLxF0s54eY15icPAjwgPDe4EUAJ8ladfkujpqPK?=
 =?us-ascii?Q?6J+VcAr8WI3qttjcGqiFPt/fnUsL9Bi0X9GzE61Ljhza1wRoucx0dYXoKKGR?=
 =?us-ascii?Q?ehJ5PO2Q9Ze6TTyOKYDNq2jJAobrpzkB5aOdcTPVKs5jBNHaUC+U+tOTAXYU?=
 =?us-ascii?Q?c8K2G/f3t8y2dYDxgOYAV5A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e818756-dba1-473c-111a-08dd560587ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:11.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4oqMUFOxcz+ubK4Cbl8d6X9umGUUBl6l5meEuKJK1v4P77xhsjlBleVAgRXz/d6xmOwt5oRU1r7JxBgQD1N/c7oidPdn0FFMsqftNXIDtRnP+cLvVSEWixtbmYRxqmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1016.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index fed4da23cba2..2f38a35f0768 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -367,11 +367,11 @@ static int rt1016_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		reg_val |= RT1016_I2S_MS_M;
 		rt1016->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT1016_I2S_MS_S;
 		break;
 	default:
-- 
2.43.0

