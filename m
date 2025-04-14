Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1AD23CE
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592509; cv=fail; b=BSWLUGlcA5GJTwqN3QNR0Oi94UD9107JB8OKHiiQHRmfNjQupn7nPhQK1GiU00Z7YKJ5geXds1knNszfTPvEwW+/wdQ26+447T9ENTjzNV8ftLtrdpYF6BgdSF+EtCNvaPtKDpi3AE1cdwro60Llfggsr55O0LhjwsLNz116L1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592509; c=relaxed/simple;
	bh=gt3RJ34JO3087zyXKkcXtdhCmKppqEqiuPBqhYbK1uc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=nyvuHBWvoSH6tZFg6k0XLQtyrOC8cnsmFuex6/X1KoO1pJnnHVzPydtXuEWCPbq3d+4DjAhxGP6zysvD57zRnDAKEK6b3HgOEem81nY2ZJnNlEdLsP9DcJNJy0HT7GWmkKBz3J3iTA3X630TU77K9fYH8qgr6lvVHrpY9jbQG4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ig4TIkCn; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ig4TIkCn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPY5HTwplfgDwtuhkabpmA/aV4TfTob5PB8t9K4c7SuQXKztymdZuP+xAyGK0NkCqgRclHOivWuPBH9ieXRm9Eda0FlrkZsl1Hh+9ra4/juh43UOM4+8OsqLkrrMo44UFJwNnmktGM1YtOdf4sHNoSzNY4OCy0rpupKtJX31vaEuCRCJHSrT+asQVnC5P3Bx9PKWuzgdQx+8sgWf00viQuCb0QdgcetQcSoIHEAEgjGqidSl6BC1tEz4zE9XvKc4piNX2Ch4aR03lDBrjpwrG/5WfKmB5wqwEueSCpeDBVsdMtIBC42OuiLmXzYqTvs77k1PfMkmBwhOV2WdEgFLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+m+ivdzMvDfv/Y0I0NgHrrWUSCuXwL4QnGB7+e3cBc=;
 b=Fiiwmy+hQ/1o+IgIMFon+ORW2qvCHQ3JLS4gmKhJbDGZp5DZ3XBEj9wfSIPoxoUfELqTmuhuPGX6yhaLCb/6QiQ+h1xFOneUCtV7iaDrZziNCMTAWteL8CV1fJyVCdQOByTt7qPF6fp4pZ17LVewYp5pYJK+WcyAlRfns9LPRhl8GksLrfvswTLFUBjlZBDhyQLR500nTeL2K4gx6AEMz9riNUtp+17JK0b70dpK+bLSBvme34lVizCGncz8vnKLkRPgnxJ2K4f+qFOqe4N+4PWD+b99yxHBns/aO1kJqthT3x34h+5vyCi1v0qbhZy32YEqzvogc3/SufQ1i8li1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+m+ivdzMvDfv/Y0I0NgHrrWUSCuXwL4QnGB7+e3cBc=;
 b=ig4TIkCn2lNQtA6FAu/8yRIzsqmbH7ISUccs/PY1NN2DWnhS6LzORKMC6z7HqudagW4046vtp0hrnZd/bqkvHkmGn0Td6oaxzSMFVCY/UGcva19vDowmkVBwg5boA/JaWeCJpcNA7xcoTSQ+13hwtpkx2W+vgWl/RDPZadb8Vv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14587.jpnprd01.prod.outlook.com
 (2603:1096:604:38d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 01:01:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 01:01:39 +0000
Message-ID: <87bjszr1xp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Apr 2025 01:01:38 +0000
X-ClientProxiedBy: TYCP286CA0312.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14587:EE_
X-MS-Office365-Filtering-Correlation-Id: b4639418-1f20-4880-18f7-08dd7aefe969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QaalBFSdElcMFSb/9hgJZEcqJ3C0Tn5ufdKg6yzY0tdXTJSx1DeY6oA/okPp?=
 =?us-ascii?Q?IX1Flw8MFQNVDVPMD9HUsR8ydomOQs6jqZ3ffiR9kWfABmHEciY/fgNpvaXn?=
 =?us-ascii?Q?/Fm+RaklrqutK5uPpA+jZlb40ZfZ4fIGVcIYFdrtNdYiR4N+Us1AJbMbwCP+?=
 =?us-ascii?Q?YS8bBLTvlpN3z1Y+5SDA/z1wb0i+/rtPjiIWMXsQiaHeMjIEcr8VXuxIJd27?=
 =?us-ascii?Q?v/i6A4FwtMqAHxI+cSgpUPkaGSI+xcv2qN1HRb5l+CBiepMX2gu7/S/RjqSs?=
 =?us-ascii?Q?DwjiqkytICMcW5UilchNIRR/qk+47kJ4wm7NhINOg+3etbf24/YUxn5p0itB?=
 =?us-ascii?Q?lmL0Fr22lByhr/nAmTiggN8U5YSK9A932ZtelRKwAEFiE43Adr67EWv0mjhf?=
 =?us-ascii?Q?PkzSCA5ZzDNCGhZj3azbj+ty/dUUrkVgAJehqNYt1dQIiuj+OPhcAHkin/Zy?=
 =?us-ascii?Q?hOzq/3TdkHCBsxTiksL0bWUxOsrlZ4IFkKE0elSot5FXLQ57hW8dTtJePFfX?=
 =?us-ascii?Q?yCzkWv+4XitR4unXtKM4Zo7bcg7YTtSYf2y1QJOqs0H0coA/L4XOZcjamakZ?=
 =?us-ascii?Q?QoDQbGNCcSC4AtfIwHXMBgfVkDvl1jEEla/R+dTWceZF8srvN7k3qBsBwHN2?=
 =?us-ascii?Q?h3qp2XRIY9hcEGu5xNmrmgtUh2SFZC7+nbOjR4740dwNe3CqI4Qai2JYzLU8?=
 =?us-ascii?Q?krWfwcaian+Edz4ov7bMLW+EqE6HuzQQPQdg1ZPum8XQ0Ebjsz5XI42YCwMG?=
 =?us-ascii?Q?QsxYln/STMKuqy2tKUz0i5EXcckfrOIKT2uYvzPMIOSA0wu/Bi436YNDwP4m?=
 =?us-ascii?Q?ujLrFCxUYWlWMVefMnHaqCHhGNwxXpGTd8u9nets2Cy7aWGCCBE66ccMNqeA?=
 =?us-ascii?Q?Sc35FmT0PsPRDJkmV+JaTyiVSFlvEXx+dkQx1xTOW3u3cUAEe3W0wMMOrDRe?=
 =?us-ascii?Q?0X42cxNx+UWlqjJXbbJw2ez8ZyBB6ysqJTFzrKWe0qrASDMkBr5wYtiefNtk?=
 =?us-ascii?Q?4JXwFV7VSy6G4y4/oGgu7buMnC+JPhMuqmkiWOwag9dTt5Jh73tpMJhC23q2?=
 =?us-ascii?Q?lq/DmFWHv3te3R4TMbzTE8GOeEwf4Vg6BfJsky3WavIdETlJOl+LGIpuw2ne?=
 =?us-ascii?Q?hLBhx/0UJ+fe6l/t6KHEIZFKj98lR1QK7bLrq2C072c4q8fnPIsEVKd7pbOX?=
 =?us-ascii?Q?VsvJ5SkvZr2XLI5ShABk2IgFBII74nq1tcCzmd/qsOl5Bae0ocu/+YKFY4mQ?=
 =?us-ascii?Q?T0HDMy/MdHiduVWmoBoVmNADkL/gIoPna1iFoUzorBI+UqoQDl1A4QDKrl63?=
 =?us-ascii?Q?nLWUd6sqyfpYPKpgB51C9bu6Mo/MBGsOe9hHnaG+SvwbVx/Fh0ja48mHd4oO?=
 =?us-ascii?Q?QXeAGOhT7Ilt/UNQg+ZoBEUd5YdGvPd2q/LQj+vNiMYHfPy6iZ6wK2qNa75r?=
 =?us-ascii?Q?4TrHw+9lMZB2cC4BzR8Nn4wgRw3U5N+UpjT7MUhCu/Un255Ma8eJ3wdNNpOH?=
 =?us-ascii?Q?PU20eC289flsTFE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KQ02zkz8VG9MCAxiht6UKiwPErZKU3kJiWHRHI+2dHiEPlRZxcV6IqJdqjue?=
 =?us-ascii?Q?LKysIuuHZ3lEAH7alRg1Cmio+A8CdigiVF/LqXwM+8PjfU2rHFKaXQldlgA7?=
 =?us-ascii?Q?xelvlnkaSlFZOsLWD1v+vBEcZxa9XxFmtI78HdgJibelTgBuv/AQWQNinEIC?=
 =?us-ascii?Q?PDkmFgfxUnZJsHKT7j46/vstv0FFy+qA4tGdY5CBcRXzF74Ug0qIqwbNacxB?=
 =?us-ascii?Q?4pWSzuI16kiLzlwm++I2Wdst5n/wlG2KoZodnHjxbxSlBKDn53VG3qkx51tD?=
 =?us-ascii?Q?sbJBg9MzHggovfD0VnYZYACx8y1DTdKC5UWDBH1UNEtFB44G0mZVVqTWhcU8?=
 =?us-ascii?Q?SMyIrVLDYZ2s4v+lvjSmx5I3f+bbbT0klI5a2Lrlop6xYbqhqGipZEw58Pbv?=
 =?us-ascii?Q?CTs13tPVu0784xQu9MOzJL4wZ2EWnUSJFXU3aCLoNXbyUbDLlZbTzcn+eaK6?=
 =?us-ascii?Q?eB2tpokO4vG418fB9MAXSWbNtFNLc8D7JfpQsoQ1cqZT1x4D63oqvHhKMPSf?=
 =?us-ascii?Q?9dKsgN1o/5K5xhqwqmjS7HOVT+qEDxze0jyWJIKEU756QiVZ751finQrisCS?=
 =?us-ascii?Q?WYjWnWWmjfFjK17HBEAb89zLndBs5QcW22ecLWmWO2LAEb07GO2NuqQDX8XK?=
 =?us-ascii?Q?dXwEI0a3zjCZYCylNImMlu16jKDGGMglq0U11KS7rGTYfkbg9Gq2pEg3hAAd?=
 =?us-ascii?Q?ppWouY0WxtSw0Z2e9k2lSpIm4gZt/owq4RsGYvqdWIa5Z7gu3sNHOyAQBh6u?=
 =?us-ascii?Q?AuK/0c8IC0eVYIfwzdSg3VGLMPBNvjFFu43cJmhI0/+3Xj1FTIXH/6Svp0gb?=
 =?us-ascii?Q?FgjBnj2knMdx8gpOFJgxLfuwdrYnYFXpC4M7gK/volGdwXci+VAWZ42pTc/1?=
 =?us-ascii?Q?aVkDR5H/ua30d3o7Kcbd0TocA67xgVX8ye230d14PcZGCzkzkAQiV0qJGJiU?=
 =?us-ascii?Q?d1uX0Di0EnIcizJmnplprGb+1q3p+awckMVAv0sYJ3IBz4H1N0zEsEsa/1w3?=
 =?us-ascii?Q?772TESXRksAlph4YPQEZrJjDKpMuc1pQdCShMew27cdlOfCu9h0eCdRXVyCu?=
 =?us-ascii?Q?FOr6p0vs7f+fllOWygxMIh4w+AoiCHzU23lcQ3dkI3yF+Hs3ptytN/aXoO4a?=
 =?us-ascii?Q?nClZtP/dwdug7fTlCfnVTygOJ/ECYVx+kynH64zkCAZDKp+19UvVE6Nlv740?=
 =?us-ascii?Q?UUokLP91MlaXmdJt2VCWg3Kh25HWzpB2K+3k0ElwgWYAEZuOvQ5UW8QwNbBJ?=
 =?us-ascii?Q?YaeSF/n8xaUzLFblRNJSKJSuGemLqya8R3drN5EIttksz7O9ejWBRM43Er72?=
 =?us-ascii?Q?L2Js29hQZmH6ttDJbC/hLSfBsJztGt2nw47GsJFA6qnnOVsHHevXgWQLn+AS?=
 =?us-ascii?Q?kc9w7BtjcZD14FQhwDVx1+PgLM2u7xvoBtzmK2e1QfeGZ+lWjMpuT2oX1evR?=
 =?us-ascii?Q?diRxFAf8yjiooAAnTGRzsB+XQAZGy5dha6ExexxYCiHyJK7mj6Isy/iZcVDB?=
 =?us-ascii?Q?bQlm7B8jRp8wvTGUjC4xpOTm31nuiWZ7PWCAHAoyezdYbZhSM17XwKOzvwtk?=
 =?us-ascii?Q?iLfSWsY7xD3FjbVVVSjXOAhacs6GLpR7ugpFmVnwPbI3WOr0aTaW72g1iODt?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4639418-1f20-4880-18f7-08dd7aefe969
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 01:01:38.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tp9cDg7siFHHRgfM1oXeu2scZ7FFiIBCHIWiVQljqTGwE9fy5oXJGpT8p4bVs3lMYWkwuovjwbpa3uomNDRS6vP+OKvBS/5/8KzAJW0ewQRXQ0FPHZDf+7c50xvmw2AM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14587

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 30afc942d381..0ea0f60d1df0 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -597,7 +597,7 @@ int rsnd_dai_connect(struct rsnd_mod *mod,
 
 	dev_dbg(dev, "%s is connected to io (%s)\n",
 		rsnd_mod_name(mod),
-		rsnd_io_is_play(io) ? "Playback" : "Capture");
+		snd_pcm_direction_name(io->substream->stream));
 
 	return 0;
 }
-- 
2.43.0

