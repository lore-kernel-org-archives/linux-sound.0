Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE3194AD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533833; cv=fail; b=TU33FDqeSKwi5XicM3hJETr4kHqnl/kDenckZ7BQMrGnjBWdPE+4Y/5HS3xRU9f93ZqRuatBQBKqcb8iqN0pxR/Gi3JeYXGmYsydAbqt50L7BSuRcaXpfPPEMjC3xlRz3nkGh2CRXHGhfzI+WKNfkzH1IP3gi9/JTICYR84aABQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533833; c=relaxed/simple;
	bh=iD7aFyQ44XhNB2mtsCKshh6gAFctYCDfe6irCQjjiPg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mu2u+3D7fXcs+udu+TS16FIGdVUgjjsC7WsR0NHBqpNgykEGjgzCnLejx3RnfZL3TLJPSwvRCNIQ6JqwkdX7N9MdAU9zFSVdZdS2wEz+3P9LdRGzBxUzLCMj1Z9DfIhH0g1TDFdL4pK/i/CFX+z5BLn/ejnn19LeJVgX50cr5BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dqC1uONu; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dqC1uONu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ei1s+eOixo2JLRZZ+pO7U7z7ZqsYkDQhAvxRKyNxJ/LizCEZSs+qt8mBN9VBDWAnvL/K00dTaPGj0HiiitvIRISSzv5uGNFi0Ku1i8LniKcEsrsQ1eKnRgg5fJjvcqYNkNid6mceekYme3XPYJLj3vVCEMC40OgPwI16UF06aXWixp+wmPfpNrL10aG5pUanQ+amPSJ/HOs/bYAnBGQp55w+3Z+RDFzWJ8G6nnRv9GTwBKizZZIy26kHWSAm2QjxhYCNr3K0ueUrGQD2P3SnzD+Jkv1cpWUSvHxoNvHZLOtLaO49XnwZ57NEI2OvlgRXMuh6hSKIzQcciB7UkpTxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=887zd6aebB0lAq4WHcKQewyhQ9OxJSUyw6tbHTsLPco=;
 b=Y6fVAQYtS9I4zHtUju1F7mo1b1hNJPPlVsG4Yny7GnFJ/2wDFiObsCYSDnlx6ef03UPraPBQqQH/teQ4uxqooBQ9W8urnOUrTUIHr7OaPdGnBm/el3OcUUch86/DUJq5IiFgBCCFLhFVCMtxyZNazTE9CHmsxrG7e9tfamU7IBo5OMJjOFEHJ1Qin9r7EgvCI8H1AWqRVuui3OOwUT2dm+0H/NvNDAgA7E7+TprErP3UaR/XZDrb0mm6zsQrjtkODcIjnjmgZM26h0WVmf1g6QZp6gDPXbSMcJLsF+pQyH7vvx195bpiSED1L/UaMAk5M0x9PEERG4OfeisuufIK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=887zd6aebB0lAq4WHcKQewyhQ9OxJSUyw6tbHTsLPco=;
 b=dqC1uONuY6dYRmbxWNNeQw8r3oSTpSzzWnYE8W/OogI2BybBUlJiqxc1evlPGjSU2w0X5TgNwR6Zf6MfLotCyjbv6q5PLFy4uh0omZUhzEgVuG72DRcomA7wHxUsg7RdWTvCq3fNm+y1SwQuuI1zR94kiSAWfnmj24zDA5tnATA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:37:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:09 +0000
Message-ID: <87v7sxa3lm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 114/157] ASoC: tegra: tegra_wm8903: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:09 +0000
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa01d0b-5505-4ded-b11e-08dd56061624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/e79wxAqV6Wf6t0cjabZHGeKfX+iw5fFzY46SoU1ipoCg/mh1+Er6NeqXFEH?=
 =?us-ascii?Q?zU58Y5q1WrQNgoE2Vc07XA6m3XStOMO04JuYRYobf2gVULSS+ZsahTJa0UBg?=
 =?us-ascii?Q?ZXkYkuNPMNTNIVBzKfuePqkiqwEck78UK6oenYJYuwc3WrOua8e1ss/T77fR?=
 =?us-ascii?Q?8QAXTaz6dXMCxWAsk1yTcTOPbNUKveTmcTmuX7kUHlmYLVN6934m+vA5ZiCU?=
 =?us-ascii?Q?sqctQk0r8W/NK2r1l0jjgG/UEp/frwcC5tJvQYiX+SxTWdGIDgBgqSUu9JqC?=
 =?us-ascii?Q?MOV9nQ7o8c0qyp3BVI4agRJwKNSLKxqRcKXqulOCUzcd4YbrRuV2oO0EsPNt?=
 =?us-ascii?Q?6T63DkGKxRU+6ENXYmgDXUDrITBRYJonFV2lP2pRPrR2Tw2WZcShpUIKIEWf?=
 =?us-ascii?Q?h8GD479v3T/uImeGOSyDx1RNnv1edxd2+vtIfRlEyfzgYfRjsJqZ79xDHPHW?=
 =?us-ascii?Q?XIoIhxgB/lV0yWX0rZ/M9Rhy+CtyO8k2SAq+YIBfJtqP6C9m67CXdY16WLWd?=
 =?us-ascii?Q?kzs0Sru5jl89GBSC70nl81NXNwvoIYt6JVZ3Vg+mVJu7NWMS0N1OX6vmVnfn?=
 =?us-ascii?Q?Iax2zGsGqsD3plAV7qweHfDtvce3c3kirlgAowwrlVHsDs1WNqYTWFd4x3un?=
 =?us-ascii?Q?JUJh6KoFT7cfwKQpigbOw0XXT6bD1LLC1optmQJ7f+eRPzUaHCk/Ejc9p8Iz?=
 =?us-ascii?Q?lzAnWtXY97Crei4zAcf3mZYnKRVe0Nos6IWdf4DHxMvAEyKLPPIVaYL8DqTg?=
 =?us-ascii?Q?xBVKcxirf+fVYFIRHIZ+RnalQ0MomKVpPjWJD7MuTh5HjeS5UQS+50Y6klN6?=
 =?us-ascii?Q?El0fLsJkGJF12M3Lu/z5kISEqNJ1cI4b9kC7uQPOhBfeK9c3l4tuTsnrXiUo?=
 =?us-ascii?Q?kklND4qb9GhHVgK1MJbFfL7Od+acCq8W02LOj/Akao2UlmxDiVOthmvCG9ET?=
 =?us-ascii?Q?kVo/zV401Qbz1amyKRkyd+u/jiXhnTCdlo7wLJldSPaf6HdZzVZgrY8veYoe?=
 =?us-ascii?Q?cdWSp5jmyZFymu002odmweHVB19uy1T9fjSZZT+YiEKVlRGd8R+aOXXjqPzQ?=
 =?us-ascii?Q?XMve1NnjukWDdJiOJoWPqorh+YZDTijgdWATG0ow7aLtznZ/V1Zgh6eTAdoi?=
 =?us-ascii?Q?MaDGWzFDUW0MX9c+EN1y98Ne1G5QOgXgC1hNKATVyvBMVL/DcRGnVEUW7V5j?=
 =?us-ascii?Q?AtOffbNqIeMQD8wPbGkJ0YhzwiLV2wQC4XldfAsQfBqkL0OQd6wukkBMTnNp?=
 =?us-ascii?Q?z+K2A1PPhJeN0y3HA+uAvItb/3sEgPrCfl8eO2C7HiHFNbBvneVPlcos4YTu?=
 =?us-ascii?Q?jOpVx7UNq2LXD66XvLoje1/uA6oTr4qhgfnGnB6zIDO8mKPfDhp5FBuPtABV?=
 =?us-ascii?Q?lOavAeiFPzEAbjFnjdB2p/20SB8tHYZlOma85LlqdORBoD4QXvYMLteTL9UM?=
 =?us-ascii?Q?Hada3+y68BD8cizJid6cNES0R21kJYqr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TF/FaSKdrsIIJz8tmBLv8QuxrnERpGfJdK7fzAmTxi/WZII2cKNh4D5AYSeg?=
 =?us-ascii?Q?pEKE5+Lp8eq66wpgvT8yl9WHutn3cuD52RpNn8Z+5rOo81Ppl/LyqJsCej51?=
 =?us-ascii?Q?tI7HICMndRshDJ2EtzmKRONXEiuZIxKWJ4x2ZCJntRrU+eJqRWE+SplYuG8p?=
 =?us-ascii?Q?z2kNHYhX9a49JgGv/5Gjb/ADK9nofruf2XzCTjAOSONUgzv2+umGpY9WmYNv?=
 =?us-ascii?Q?KIAHWal39M159Wys/vA68phsi5MmmbKBs/kS0Kj35V5nJbDA17O1qwQRq3jq?=
 =?us-ascii?Q?zivq9RDIjeQd21S6Xx3LFDHNm/oLFJoxgHTNEaUwSWuQYK+SPbppfEwXfE28?=
 =?us-ascii?Q?PSjboEyhu1W+aNw1P3OXlnOPK+8xyD1rnBtI/fflItYGtgICNp/i9V/vH+Q1?=
 =?us-ascii?Q?TOcERHX7oUQYSErWkf4jSNk3d/VsbTstWh4SeTBhZV4bRQLOUyn2QVe+Cn3Y?=
 =?us-ascii?Q?zawNAFyvy1EON8osb5dVLbKs26hicNKSai9Ww1exk1gHJ6xfSIm67gYGqrl+?=
 =?us-ascii?Q?bShx/z/b9ql2sA3cxQ3ba7jevV87KwLOW/hozES1eWAt5sgp7xzNk+dJWpTV?=
 =?us-ascii?Q?3V2nZivA8FSNb/UGVgkPeHoDwtRUOLit0lNBzV0JjRKaedc3w7tViwYtX6Kk?=
 =?us-ascii?Q?6auzd/cPEtXmxGou30HYXi+lnoKYOECGME8gXzIFHqpTCMnsOt5bVUpMy9e1?=
 =?us-ascii?Q?OWKiT7ITrdMBMRYa/WrKNc9W+JK2NaiRARYzJBxrhw4lWWGjFh9HooQEAYJz?=
 =?us-ascii?Q?QyOLQ7k6yT8/khAogAwZss5FJCdjbeM0speSpdOdOp4G+YspSbldlMvPJrwW?=
 =?us-ascii?Q?CodQwQARmBOYG/CmV1dO/NB9iYyOdEo2Yz40sCWQi3+Z+QE+CVf+NAfsOrgN?=
 =?us-ascii?Q?tgIkOJH3zXtfmarV39x6QrqEgOZ5yllwQPnJ/yIy4+u20WDfsNNtTCmoxMpd?=
 =?us-ascii?Q?IKggXcjX4caVKgy7DImiFPkZibY0awtwuIZWL3ebpNDPNoyJgfBNhLpO83Mi?=
 =?us-ascii?Q?Qb3JRd/RXZr4tFoccTo2JS2eR8aJ10PsUiR9L61osj4859ocuQNqjoXDPL52?=
 =?us-ascii?Q?9phBqgqkX2WsiQNEZ4tK/MApC94ILK3M4BWvP8JRTY7vFSMKJTMQZb+I0AKX?=
 =?us-ascii?Q?P6fNClO6NNjw9T+W3vcS7LuVFRYIw0ajJxlYmK+EVsuU4WAeSxurGokT7Oog?=
 =?us-ascii?Q?8U8KCyO62OiYpnD3ZtDqgXVHbwqumoT6GaBUh9kM+wPR9fZZyLsc02PsJRRj?=
 =?us-ascii?Q?f+qJckYlBsGebCpcP34zF9/DzkUatj8mCsO1XwBAARDhIPPFXXrs72TXeI4w?=
 =?us-ascii?Q?B5FgKqIU6Yv9jtysHXp4PsXg2STUIF06iN3Lob7yG334HQ2N31c8DfsHL1aN?=
 =?us-ascii?Q?K5cKmn78efbM/FymM0IJjOvdbBHogxBkLrZtaCqUacwzQcnPvSausuRsxpKG?=
 =?us-ascii?Q?/y2yvzm/P0Q7TkiKFYQxbDH4+7YFbyw4olsOg2VPOkKEq7GbO8DoXfPP0CM3?=
 =?us-ascii?Q?r3YLfcaPheDaJiXB0CAu3OIxi1oNxZVk44pmFOyRCbF3Fr50bv7rxcd52lbv?=
 =?us-ascii?Q?2qlBdtgv/5OMCrmFydnayRa6MCTUxjx7sQDM5hUWLYUYhi5OwMNgJhCpgP5Z?=
 =?us-ascii?Q?GPCYsyW2WtHJ/rFLP0gK5dc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa01d0b-5505-4ded-b11e-08dd56061624
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:09.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLSjlouujN2Eiu8Cw3AdxbZefnR2KMItXGPqt6sM6hvJp9bh0xV8JXYTyN9Lp7D54gYgUdaENZwNCHVeQxw62FLTuZPyTAfLoW7OEDlwaPmw1AMHP/tivrvt0aXN0LFH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra_wm8903.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 6116d2e30fca..78b02c64d95c 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -124,7 +124,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.init = tegra_wm8903_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(hifi),
 };
 
-- 
2.43.0

