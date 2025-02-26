Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B17194A53
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533802; cv=fail; b=aS1h/vBxmWWJKz9ulx06tzQc3yZMLoEMTZyOcEqQZxGXJ9WgnqbDnQjdR0SLpE4P46lNPwNjcP0a1lnXWv5ZNk65yhR2mcCJOxGJOJQ64oEB5o8+ldhkXoKgHdhV7CyZg0h4n42mRe9ojH4i7HUgXJJqmICZwXZy5LuqADqubng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533802; c=relaxed/simple;
	bh=ZIg40UIQ8iIohowqHI/xCqnr5ZIEfFOaNYlG7j76Xb0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EuuX8gA+A/DBewkvTqE3NvleZZoItj9AFVExmlFHe+zSfvA8GWqIT/D7DDAumPT0Hb1zCECrVC3X8Y05svhJp4lsvDdRVctbkUr1MJbO+jkWIxfqQs4SA/1r+erD/ZPz8BrZGuqT62x4wDGTnS+en7WlGK7lW2xXP3dkAfR3GHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BQ31MpqW; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BQ31MpqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnx/tij9B9Y1H0AL5Nsv/vADH9Vtedj7RF2hOJm6bRimWbg6jbIQAkypPth//cAhEX/W5oPMRX2FwXG6l8nO38Bc4HLN+bHuehZpzDxZYY2iJ22ssIsQ2zkWLp/tFjCdU7H5bVLhIk/kPidxvsuAkrrX6ejYp7TkAbEIvPcmaiIOuTqKOUNbDQOsLrkWMw36wAMXQRFPVmQHdjeY6a5e2KVdsATBdRUzT9OeyZarauJufie+NkqHgccNGQrus4mG3qLfQaKHNJK/SM1Rrvq/lcPHIbQadndsl5mmwNPE3uXeET+WwROWKji2yrzhu0JqrlCUpBunhlVVDs297E2ycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWaBnb4va5Owu+5FC/w/LUIYp2iYjBIACfXmoxyLGmg=;
 b=GPKtW++vZFzKQjKAHeE2rLb5NTd3G4GSd/cQUN2TULcPsaywpSpEt98YlifbfcEHkhSkz32f60ZbfyF0Nuomv2yJxWvZTf8ksz9JUYv6244OF0Dbf3okY2qg9OzJ/vphvt6z6dntr4dGP1EjW1CVfWpC9/w7Z6A2Jf2e2fWzO37tozkqGDuf/UYTQLopB/IOAD9UQ1QCHOp83ewGVqg+SK0Y6Z/do32biz37sTrobI0xxzYf0lSqzJKpQk4OLLq0UHKmCH4Z5dec189YEvmGYJKPHbO+6tfjObYPG2taF2xAHTS2g5vX1CV5gQcd0zVcQ6oUGYI6dcQv5hC+ge0z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWaBnb4va5Owu+5FC/w/LUIYp2iYjBIACfXmoxyLGmg=;
 b=BQ31MpqWRrvz4GxWNQ6t9z6+Iy7LIA9CfJa1vNiHyrZzKK2+mbFOFrzr3f+zr3nOBW/t5JCzn6hOIp5SmXl8h0PojC5QszjCIbG5a1N6DLHqljGn0kbrGT5Yb6sIt/uOQe/4C1fGJ+D0ZxCgDoe4lbF7rKH+b1fQuLoGeSL1NIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:40 +0000
Message-ID: <877c5dbi6v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 106/157] ASoC: codec: twl4030: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:40 +0000
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f1d109-88a7-4231-e867-08dd56060498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBROXS7oBTzO//2AAQqP8zDh+FwbrIP0muqXA/krocbAta0uo8qaA5oEWEiq?=
 =?us-ascii?Q?3Cw0/v5dxKIQIfBfoo2l6PHsFjr9YSgFDZ+YBALHovWBoFJqlu/7UF9A62f8?=
 =?us-ascii?Q?nH5EqXokBCcDqTPjDo/qzv4ap4XO/1CaHOXn/WNOIdimEj6HongDO5c9ZZ70?=
 =?us-ascii?Q?Y69yuFNY5RT1Xl5326Y2jMBKXRdG1RPAU+9yT63H9clM6lkKzD7wJdOMIRaC?=
 =?us-ascii?Q?OoLg6F8Q2RICCW46eqt0wbX8uRD236uGcEu2BZJJuQcw/Dbkjs/jY1K1Zyg3?=
 =?us-ascii?Q?ulKFhe4twuKDxzQtf2yAxGLRUtDw7I5YBU1gkJXX80TwG/hNoOr/Q/QUssjV?=
 =?us-ascii?Q?KvvLfMUKY6tBv4OZMyN7tOdgqovO6gn82gkIBoBgVetGS0uxw3GZIT+K2rHH?=
 =?us-ascii?Q?Q8tfasUQZFAHlZktiKBGjUCdLvm7r+OjPYd69PeLLt1vPt5CNMNZ/+biKyFh?=
 =?us-ascii?Q?ALAjAGdsGkJfC7Gd6s0NkAoZyk7+c7135lJk699w6J2mkHMK1DIGtnzBvhfA?=
 =?us-ascii?Q?uyA/pKcNYpiyqxYsYlLng8emGo7sY1VMBspxFE7a09h6rxIBOwT8yKJEXSgc?=
 =?us-ascii?Q?cKAH0+zpCW/1iwH1h/7I7tOLkKZm4+hpYDu8T0x1VMo8jdX2RugFUibVqtlb?=
 =?us-ascii?Q?vhcd6lgywJsAlQ6nJO4hHu/69OYX8Y22WGDysPd4gOm1SJhpEp++ee6MsEDl?=
 =?us-ascii?Q?KEBpyaxmqVeqzhuVNryuEF24OD+y/FxBQ4E2co7igAFQpuqAHHHCe7rXKyy3?=
 =?us-ascii?Q?6D61JqVp/f9EpE4lzr1scYrWihhTsFanuX2HoO1KpqFTMmRvGtwtacdmyB9H?=
 =?us-ascii?Q?ar4Mfixc4bSCtXj2J8JhHaCSwnZyrMHKsHOW9oaEo70ZsW6tB9SUNmFpg+Pw?=
 =?us-ascii?Q?5XJP+UmbNN0Z+hgDMsSahiPNovdVQNZ782w1541fRhIHLFxEtVbwYhoGACdw?=
 =?us-ascii?Q?E12Tx28U8sALQGURoDh3JFOjqo4bL91Zc6+cenReLe+dFcvPiPnAzpPIqC45?=
 =?us-ascii?Q?6lH18OtSPBDONVcnknLCygCkPvyO65uf10s1MePh7Ntk0jCvW2OGeW0KIHk2?=
 =?us-ascii?Q?XTW+6mnb55imY2mO6m8kSZyxydWoLDFzWLbJVmJ+nSPKfIwdzD0VcbMppFSF?=
 =?us-ascii?Q?/8djsLQMJJCbZ6ZMjMx7W+jOK/uEovvDoSM9h3HPfM8KQL4M14QBdjgKOEhy?=
 =?us-ascii?Q?a+gt2tFEe7vSwJi8svdNJSCeZncdu1z9SAdcEAKC+SEOepAv0e9PZ4I5rcbm?=
 =?us-ascii?Q?AsNaD6gyxttPLtoYc96ZGP6R5dn2s51eoSO5ctsULmkK4KHCJU92b+FQALmw?=
 =?us-ascii?Q?nt4fW6ndPBkR8j7dR+aPuoDvj2Qp1iFB+6ercTwdgTdEjI/Tj2FNB17l3qpK?=
 =?us-ascii?Q?/NggyxgQnrqPzcmWVrOAT6fVhAkfAvlmEfYnE96AZWj8xX8qm3vC57DDH4Hu?=
 =?us-ascii?Q?usSYw3yVms7V59lQncGIaGfT3mrgxKDn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QYsfAxzcmoYlsOqmy9w70Tlw4eRs/3JD2LfkZBUxUkMbNBGgqrT47fzB3965?=
 =?us-ascii?Q?eakpg9ikOLr6Z8x7414KqzZFqX8XXAm036DDvnf+EEem9nZazB+N9M4ftW5+?=
 =?us-ascii?Q?ogoDWXbSzmMLRh1WC6gn2V3QWWFhhnoCr3ZoHbCZWx2cH4eNIRTw9IyZWv08?=
 =?us-ascii?Q?Kh+Bp1idiYjOw9nkhbr5YqRg6EY0rf9SkJRV7yFvhccX3wNT1Jrzin9CYf+I?=
 =?us-ascii?Q?8LWMuU/yWf1A8lboY/NHaftHevy2KHYMbZhbFkp6cFfHl7uOzstP8IfVHL2g?=
 =?us-ascii?Q?NmRXqmYk+bDQI8uvG1cwIeu395f1atZvsxJDmXACTizbsLBg0iv7Z/OdSRfc?=
 =?us-ascii?Q?73IzKdQ0RKjGcgEdziObF/p5EX6GDzZeOV8SlIVYU0u9+g3EGP6EHNgXB06j?=
 =?us-ascii?Q?T3d14NVNOb7EBrpOYNTA301dAB70nFopd6sf9/AtkyBAnQfoxG40m4YJAvhq?=
 =?us-ascii?Q?L1eqnLdvWxCpLhP6l4MJxNXEy93FTRYxg1StaBUSGrpDkORqwfDR/cjbdyA6?=
 =?us-ascii?Q?K369wkeS0NcUVtPWJUspO3j51p7zoQ03LT5i3zA8F3CiASPIlnCLUhTTCUvX?=
 =?us-ascii?Q?ZIUhLNNHy4TMUfdFVn3xyQnaVEbbUU/ufsolNufhMkoQWyFmaXl47FI4n/Vj?=
 =?us-ascii?Q?aaX1GbDUrzRa6kpvklQPIwp4DPQu7kxLXOad8ZE2GdksUJQioYjTsXo9ktxy?=
 =?us-ascii?Q?5NWSJK3dp51VDJN4CidnM3QZMfDRdyk+7uaJM77CoU5y6xCYJR+HY3a44oXz?=
 =?us-ascii?Q?6qEuokWh6vhvqyKF7TfjkF/TZ574C7MGIaiHEhFxuWVF3CO0jXR5hKBzKmSx?=
 =?us-ascii?Q?MtMFjmqiErK+BZAK3gfd/C28giTimvBQLPxeX08Cm8lvHuhsWaDWcOxf169j?=
 =?us-ascii?Q?pwbiQ09DNMh4m15UYFDZGhTk1+NpKTbq3gHYvku272hHbXeAL9d5VQJqbUML?=
 =?us-ascii?Q?37PfMBQPBai3ddhZhqFb+BHrYcH11mw2Ikuy+zeBai884sZWienJsGqk4qEl?=
 =?us-ascii?Q?ezyv07WzgxuonwHdy5L/QEN7HspuhDtWBX1zK1SURim1Jngxlh8OSb4pqOBe?=
 =?us-ascii?Q?/fSdyqe20EpquiAnshGZClzO2MAb+wkpA88RtK252riRqxl2BLF965yjo8HA?=
 =?us-ascii?Q?EWSLhTNskNjanapzNZIpjUjnuTxeeuOIVQswwQEt5x3gYGZGctGnhinrhnG9?=
 =?us-ascii?Q?n3Ek0LNZDJNS7HhfzxcKD8dDjhNHh0qnVlRVpouoggoKEA+Tw0eRSs+GL0pq?=
 =?us-ascii?Q?yUW2ZhWxbnyLeSvABxbASViEpjRTXdUk39qEgZiaaj6JMQEUvTXQQl6RN3nZ?=
 =?us-ascii?Q?ko1MXWPKsmkCR7sAwsoJEoy5U6vr/YuHf4GFufticjDDSql3SuT7URv4HMvn?=
 =?us-ascii?Q?whPuIunt1Wr+WhIaIjFmUuYd/WtwkJS2514yIUcA/PSlfxEKkm5AHt+rhibS?=
 =?us-ascii?Q?/LhVYpfvg/5mn+BNlSpVCqR4Emwz8c+z+mLjiXEsICsoe4emnHIVaxUjJX6Y?=
 =?us-ascii?Q?EWhwsHHAO/mSvNaOolB8juXjaHyvZLz5Z60L2I1jo5upIP+SdgoWFXEBKgDH?=
 =?us-ascii?Q?YgGx7wCuHgOuMYOBFF0xi9B0Dd8sPpwnUcXjF6l7iegmSjffKVSDidjzt4cx?=
 =?us-ascii?Q?/648CQ9F6DQDsTUKtAtdUnI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f1d109-88a7-4231-e867-08dd56060498
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:40.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkQ/3EkyJVejPpOo5uVDFJn7YDgYLLSAKOYWlnOo89nk47/e6WpAd6Sgt81U+XYdqL4WrEkqxETc+vCICIjdtrlgNROs7VYOUt6gAeBCagRWbIGvoCcSPEoaYXJHsEPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index e3782762139f..609886461805 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -2049,7 +2049,7 @@ static int twl4030_voice_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	case SND_SOC_DAIFMT_CBP_CFP:
 		format &= ~(TWL4030_VIF_SLAVE_EN);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		format |= TWL4030_VIF_SLAVE_EN;
 		break;
 	default:
-- 
2.43.0

