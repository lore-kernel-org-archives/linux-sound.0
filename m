Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5E37FF4C
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605427; cv=fail; b=Kwker1N6RFe5EXrUepbGyjHFIwtl0aTUrr5Igg+tnRIuAU2JpsYUQ8JSMdxFivddB4IpCuzakicVVt9h7KQf9XVZg3zilssbPUuuf3FZmgjAtHYZv6jQohVPsKY7wO6lXrPpK/JZgWvXvdlysv+fzjAMsG7Sq8pnzp8jk53LPgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605427; c=relaxed/simple;
	bh=2E8FHAN2p7tRNBHNi5+u3hD8vJMearFOTywD0uUYcss=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oy4I+rhClUokiM2wvxnU+SxAwRBxByrCUnQqus5HsciGZVAUc5dB92CX2OH0uTcZOyWL74Ei8yy9xMHeEhbecNfA8RibX8sC6OPhfTJTEcGPJzVLEEilW60nWXdIVeGYhenUomia3Hdxe/FTSUO+EdtSCwyg9hcn2wCP4hRrG2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NeV5SwTX; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NeV5SwTX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdLHtNWpmu9e/WWXOwhstpsRzaLlHtAwr8YctxoH5iWPfeNvPgqTgH4LQbHjxgZctSW+7YTKlM2MoSz5+BjgSK4ECNvRmI1UgPKAj1pcrJSP1IV9L335M9tSVLY+tVUCrIQMdRYOMHWez1hg809Y4eTpaDLwitHlcjEQrnBmdl01CQhfy8veEwcVJuXtMDotKMLLFvp4E5Btdz/akiG3Pf0dpsL/BwfwLSbRIeO3+6UxAsvFV2JgH4ohxCAnNK1jFR99sfXjcbkLycdUeguIYiLXwF1xeTcCwgJXDItWhSK7cxTohPmehewjtUfAi2pyuSBpLonoajweVD1EpPy2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaU+bIewngahAzUIS5+CSaobYPI46wRkHsWe9xIBzIw=;
 b=RIENqVUZmqrJ45Nq/1VQqHfUWahRVXd2Xqe+6TTaj46lDQHD3WPdcxz833tAzag1O8hJ+eWyephAduvi8YKVwluMRFpouCnuAFb1bHigtOgxdTu68RosvH7MTYuhbJgyq6J6cVQ9jLnZX7Izq4gKpOP42c3HGOiTWMku2qOGgJK2YSfR8/RmRsbRgBYyux4/TUviUcYXDVW+vB3dbvGK6qyDYCy0mufD31/OB0BQfxl5bmQAyxOAA+EMT7W3s2zUJz6HO12/s2Qc53cDB2sCqXO3fXuWBQOm3OwziGPhUfORjWQq0ArpU4vd+LLIUHNVx0nqaOdoipG1H1qZ+EN58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaU+bIewngahAzUIS5+CSaobYPI46wRkHsWe9xIBzIw=;
 b=NeV5SwTXVxafhTg4cxm/dNWpP8T0nc4YK2jf0KY+X1QtiWktidtd8KLR6Jb3GTeaVl3J8zXJiiU5d43mYHcZ93ha9vN+SjpHAAnabhfaqYYMk4Yec7MFhvBvS05UmxWjhHeFGTBUHSrUc3cObBTB3ImvXVG1X76IpPbrkK1lkrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:44 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:44 +0000
Message-ID: <874imwp0y8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/29] ASoC: renesas: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:44 +0000
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: ea64741b-0a42-43f5-a408-08de79b69601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	K7TL/IUzhU4eOvfmUS1RcTJ1PW4yjuuMsGmQwC+pdWM5GACP8BL2kElLaIAFPESQKs1ZHyfq+vP+ZU+F3tMLLnlkSc9CddU8H6Wve5f7ZPweo9eoqd1g6sOIcfyziETGrI6RhyvKaMoxGwoQmw1jlMKAuEP5wxE055VncgfI0n4c8U1gN3YFxm6bNLW2Jvy4RkHKKK11gAQeHXtr4XSJwbVVOe7SEy9aIm6CRqAUNu22imlblsvzVbkmpfiMEk4AvmpV5OwVE4wy3vXofd4oj6VE39T74xTBp0nkCxAZOkBo5AGSx3WjbTxVInHpPNO/ZtFi8aL8zZ3ljuoTEzeaQJBAHO0bwdVJrDj+mtWkoBp/66EXMdtDxFQmYnNJc5HSwdDdcpogUMRzWiY+LUmB+CByonhG23Sevf/XWiDWOzEUAnXkerehEReV2QzTDEYfhRCVTo5eIEmX/tFIdiEET+CTll5qWqDvVNPbYarzkQR10lJS1HSPozoinNVklrYaciBxYz7fHfGrgXJIY2e4Rf0Wo3m46XO45ySm5g7jF/Bn6YcBdJudoIAB9o++rmOxLwK6mqYSkjkJP9q2UeTUTU+IXTeuIb+wbgNqV6IX8O0xpbmUv73+RSJhH8rhYQqDFQSaC3HjFvHONBnxICx7zaeSZvlrkrBml4Vghzr7afdqlginoNlHer7J4cR1JNZOCLZIGevQLtGeGu3cmZ69PjTlzbw9vYctfIkV1PokM/bEDZeAEXaJby0uY9Rbhnv79LPUqdeKx06r86+hSvDmRSr4oCYrexci1fqQODl63To=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?glAsVoXkAyLUBrh7X7OklyZYit9oXTZKBKAVWkjeJS+3wG4qtqzejWH9csuE?=
 =?us-ascii?Q?wyCYMJq58pHX/lVgJu5mKHMpynveFPM99/HLjNLab7Q2hlzTWXMnr6z0Nm7B?=
 =?us-ascii?Q?quWBrf1pCmzk2Kp/vdnYSyJa4u9qsKl1DkqODq2pabkkVZV83/5l8/crN60C?=
 =?us-ascii?Q?ibqogpjvsr47fx6XHAG4fNe0eB1LIXsCbSa6uxf0Wjxryje5umPtDtAFH3Z8?=
 =?us-ascii?Q?DMDagBcoKaKoa4IYYpU/vQRM4sfTxu8mR0NI9nXDAngtqEqhZbx4uEIAVHUp?=
 =?us-ascii?Q?JGR3PrrD86BjE2hB0hK1QVQbJUvi5NRrRKGwqHzaibp/TDAi3A95Bc1iqRpY?=
 =?us-ascii?Q?GvHj4GxiweueMFh+x+2wtWHzwpCMfpGE0xWy6kCnfrn1r6VPq5ejqoiBKScL?=
 =?us-ascii?Q?FKVZFZ66GKlvPZyiOoyLq86DNIwWMOC6EYsZ5HCjPe0eKIGx5CXSl8h9uqJ4?=
 =?us-ascii?Q?GuW4FpA5Ft+jnJOmKBkOFIvWFXqUIFv8Pl/YOZ2vyWdcjcSdBCCer5yPl/O2?=
 =?us-ascii?Q?1F9tNqwROcOeVOKx2D3UqQihfxlB6T6WhYIqtcHa7zB1tDoHH5jzEjsNGp7N?=
 =?us-ascii?Q?usNZa6VWoYJYnglm1WKQbd2If6M8X1qH8S2KGSriXulmjfm1oq7UOm27ONVF?=
 =?us-ascii?Q?OQsomxhlKweaA65HM1iG8T3ZBtruBlvGNLkxh2AncOorAtOXRP4qXuB/mYH3?=
 =?us-ascii?Q?LVcUWpiGHnXVS9lmzNhJKTrB+P4DFftcD8hYsR+RiTYB4gBACU7D7VXafQqv?=
 =?us-ascii?Q?dOwKuqPqqHZh4YCg+3oldnTxHEnufWqt3XFfSfIsg0fWmgrGlxnGfDpsJ8Cl?=
 =?us-ascii?Q?oyn0HzgzKtZF5FTA4Iohb8a/sUj2AqHawmPgv+hPRpjOSce+GpqSoJL1JzsK?=
 =?us-ascii?Q?vS5mWgOshjL7SAZQcXxblEQsS45lbQJtaT0EO+QibeRxnYPV/R+zP92mvHAF?=
 =?us-ascii?Q?xGtlpw8Dhqv8C4735hfyWFrbdb6UY1rfOBpzkPvVxe9iQMw2YGrh4Q950TXp?=
 =?us-ascii?Q?Da7kwHLDbFjzVsYnhNfxmL/MKfH2gODv+iQzb9IcA20V3qoiznsEXXRfgoJD?=
 =?us-ascii?Q?CpnWZvRMIwuRQopoWRsC5xQRF23sSMXKe/1JyMH4OhCNxkouENkB0pGrOFhH?=
 =?us-ascii?Q?XCaO4XsvZY4iWPtlsZMeLYUfvgeuVA3jV/IURkVPmUFXV2bWzotV/dNgoTUP?=
 =?us-ascii?Q?pnB3Wlmu+o8kaAYIWx8/hz0X5+nkz08MD3aMVyGmVcm9W0UwVBmcwFjx5WeC?=
 =?us-ascii?Q?z81sYpbKRU3CuicZcRCIfvzSH6PvNU9d72ccufKCXpISXB2EDXqJzdiKBlRQ?=
 =?us-ascii?Q?smCakOkFxLHkqnGYt+orRc76liBAGyxIlvcCnscsccaQ0Nr8KZZe5QWsDoXq?=
 =?us-ascii?Q?NBG8r1eb/8mbr2fztoffqxTTg+xNQ6fShj9XVerKJeV6IeEi4H6RpfQIK0Is?=
 =?us-ascii?Q?wsYkQd8WgFUKZoNZyAyUKHo71c98bicGVnQv/gXMXt07im6PweYvom0qbJvN?=
 =?us-ascii?Q?b6Ewt0WJbAKpwDrcEV133p8HkHM7Tvg6WPTiqbGUkENlT094WUpOvm+0dYim?=
 =?us-ascii?Q?NuZxZS2tEttX5zXhf0CeFvCeiQJ+qtkjmlApkxxOqJPOlLxy9XjVV7e2xRyj?=
 =?us-ascii?Q?2s6eRVVf+MVL0TeycIVERn+OxiDXkCkUGAt/bia/8MAjt/8ZGzV5d5rvTMwC?=
 =?us-ascii?Q?V6e0jAyOfadrhowUlFfRamAloFjdghFoRONOihkqiud8fo57PpOFz64WFUJk?=
 =?us-ascii?Q?KNfb9LFC1w2pvF6T3yYOWzygGGCGnbopIk83agvePFWExoin2yE1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea64741b-0a42-43f5-a408-08de79b69601
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:44.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVYapzoc0Uq5jZ324isk1fcFuEqhl9+gktk/zTBTTltBDpU1Ap65IYaTYe5k4V4YFb8SKYHxKNIC/+gomjpeLMJTQLYABfHubTcDsi1XBeGQjW3AkdLXD1D8472YYxW7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/dma-sh7760.c | 2 +-
 sound/soc/renesas/fsi.c        | 2 +-
 sound/soc/renesas/rcar/msiof.c | 2 +-
 sound/soc/renesas/rz-ssi.c     | 2 +-
 sound/soc/renesas/siu_pcm.c    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/renesas/dma-sh7760.c b/sound/soc/renesas/dma-sh7760.c
index c53539482c208..ca128ea903dae 100644
--- a/sound/soc/renesas/dma-sh7760.c
+++ b/sound/soc/renesas/dma-sh7760.c
@@ -310,7 +310,7 @@ static const struct snd_soc_component_driver sh7760_soc_component = {
 	.prepare	= camelot_prepare,
 	.trigger	= camelot_trigger,
 	.pointer	= camelot_pos,
-	.pcm_construct	= camelot_pcm_new,
+	.pcm_new	= camelot_pcm_new,
 };
 
 static int sh7760_soc_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1491c2f2cc961..8cbd7acc26f49 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1817,7 +1817,7 @@ static const struct snd_soc_component_driver fsi_soc_component = {
 	.name		= "fsi",
 	.open		= fsi_pcm_open,
 	.pointer	= fsi_pointer,
-	.pcm_construct	= fsi_pcm_new,
+	.pcm_new	= fsi_pcm_new,
 };
 
 /*
diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index f2addfbac9237..2671abc028cce 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -514,7 +514,7 @@ static const struct snd_soc_component_driver msiof_component_driver = {
 	.open		= msiof_open,
 	.close		= msiof_close,
 	.pointer	= msiof_pointer,
-	.pcm_construct	= msiof_new,
+	.pcm_new	= msiof_new,
 	.trigger	= msiof_trigger,
 	.hw_params	= msiof_hw_params,
 };
diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 74e078c041502..71e434cfe07b9 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1117,7 +1117,7 @@ static const struct snd_soc_component_driver rz_ssi_soc_component = {
 	.name			= "rz-ssi",
 	.open			= rz_ssi_pcm_open,
 	.pointer		= rz_ssi_pcm_pointer,
-	.pcm_construct		= rz_ssi_pcm_new,
+	.pcm_new		= rz_ssi_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
index f15ff36e79345..ae5c0c40299d6 100644
--- a/sound/soc/renesas/siu_pcm.c
+++ b/sound/soc/renesas/siu_pcm.c
@@ -546,8 +546,8 @@ const struct snd_soc_component_driver siu_component = {
 	.prepare		= siu_pcm_prepare,
 	.trigger		= siu_pcm_trigger,
 	.pointer		= siu_pcm_pointer_dma,
-	.pcm_construct		= siu_pcm_new,
-	.pcm_destruct		= siu_pcm_free,
+	.pcm_new		= siu_pcm_new,
+	.pcm_free		= siu_pcm_free,
 	.legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(siu_component);
-- 
2.43.0

