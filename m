Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469F37FF42
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605410; cv=fail; b=c2giXEh9VdHDmjfdCrC6y+TnCPSTFA84TD9CASJfaIH3nSeXZhHj7n6mjtBVwjnBOMy85RnachOaceDCeY1U75kksjiWx7LmRVsbc8Sw8qF5oGi/8ldp53ZfKzZQBNu41l729TOimnSOJhOGtFbb8qupoLppPWxClIQRL1yx1tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605410; c=relaxed/simple;
	bh=qRjNU1DUHsq8Vf6/Vn1ieC3px1Jh1Oxig5EGtbol804=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NkkKPEx7amCi/4+KrX2kMzwsQh99FbTwFYTgIt4fn29d5ihKVf3KlY4Rx4MjeU2QyGGjcYB6xj9nZpmSyZT2nE8zGSPjTKXQPuH2YdAW/aOUPMU5ZC07J0GxHDiTwweM1VdLKC8TnGVApfe+js5IWiEXHXdkfQxWxbPkjABDeso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=URtaRfFs; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="URtaRfFs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0seHRBK1+hhPJ3ViNLjdOfadzag2BwbXUI3yULY45y/vSkkV2hLelHPc0tzo9q/bOffGWonK3edNixLaKLkw68onjzDR5s8myKiFeSqE2MIi60thWUGEnYCIFiUiNruRy1ftNT4hbP/9FvlTT7wfk8gpASlpheXIDEBhbSDL6OGBf3TBOFACgRKp1ucZ3ApIGr3RnYm0xH1vPA0XQRiYS9cfXqid1hD7sWjWXyn6I245PLLYiCryTJVpjkIqQe19+0zo2T4gA7tz07p9paEYZCIccFSTimLmlx8LJwAmzoWK+ERSVZNbobmA/R3x9WGPdKS35PVoDq3GuYpdgVOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln8QyjgalqnRpZzXrXOAqPMhEfmvJb9VeyAZ4MM55cQ=;
 b=DDQoGgf1mamYndJsGCHZAqg6icd8siFtzUwgExLQCeMI6tnB0OAL0Qr3OQG1FTYgrQLjp6RTB4VykLrUD90Yh7g48Yw5Tn0jsdc9Y/eZ+4Yd3DHCclC8qth3n/UgSwNN1Gw72AetJ/4BzmnO8kL37i0UMxG47+578di2syiTo2sTA+59KWbXVdCJLnX8tHmPTl28gdudJj0sdWl7Qz+1jNyc7SQUBT9BpggqNhhNgL0BEoYLkJa7djy9QxILWcPADf4z1b/Rcx0dP30oEW3Ed3Qj7GYuZe2ModiZFLnjUe3IiqGkdcoRSi50fTF4pBM893C1yq1N7xSzcLlnvI5afg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln8QyjgalqnRpZzXrXOAqPMhEfmvJb9VeyAZ4MM55cQ=;
 b=URtaRfFsZHsGVtwPNK6wEDcTPkXo1Er3X/yNyNPIHSivBwLwDLYkIF8Q7eaneXzWKv0WU9f/6YN5/7tbrhnMHZ0Gyy7uts5YtfFhUQpWW+9ibstumC06sMwmZXSWUokFgPLzhVsZB2aDJVOb8Os3MkMyhWtfY1xUnx9nf0jy2Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:27 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:27 +0000
Message-ID: <87bjh4p0yp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/29] ASoC: kirkwood: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:27 +0000
X-ClientProxiedBy: OS3P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21d::10) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 82318be0-dd28-42f5-83a0-08de79b68c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	1BE3Q0UaK67hb4Ghx0TZmt7z43PzYMc98N07EQxMiR1kRYMAXgUOSfEVcooqYUvB2jyTKU/qdhyB2sE5QkVamFZsA4IlRcGDehLMmxzPddR9yBnDRZnBv+5j60ah0DKDGwiJWFuOa1N+AKJGoT3fUxwSLagRIz2NWOAmZLdoV6gCy/WIVEjI8idN3lQZhbPCywM56OcG999aszd3v4kO8FYr3sgPFRvsBauxzgRKOxQ95RU5Dds403XbEzyp+Z8ToXFIRUIBvPUuZ9XdrdXRVkHEgFJOVW/U/2CKCSRxmTfdo6MfsbCWcpNEtcoSjWYBBkRn8dPbbKhXLmlxKqEVtV7fyjv4Gjc63NEgDJnFBSQ3jJRoEgAbeI0W/E6e4eNopmlepGLU5g2E/KIcgaaeLYBzX8k+Z6G2kaaRB5IG7g6thQsRM8Tew35VhXE3NNe37fyk43KvcpcKBQC3uPPMVK6BL2PQO4MnM4jW7GMp+1lusVDU98+C8kIcNa+EhyWpfegtUHjsQU7elmdF3FyIb6sgIKO1FgorOLbKZp1LQzGeg8Zo2LQ4Cp/7h4Jku+QnWhE5a62DGRfuW6mdalpMpIN02WOezC820sknidIw5cN+a+X0SZDQrLBdRpJLDW0G2eeFLkDXPFYVfbHnt04gdPicFuVguuNf8dBoCsS83u8T9VdCYp1y9YTNOlqSiM7X7KbgP/W0e95OXQ9wSWhpNuVSjYoUcWVtyoIuVxIhWyqTqbwQpgKsVcfgL536PFkpR2vLky5SWSTj2+GkMHaiKdX0BipRgi3xNgzxIzAOXDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HHhMI2cwJixfkyMKqhorZKBnCvXjKI7DJUcMSOsUMANoSVBvoRS5UbDdCtOJ?=
 =?us-ascii?Q?jvUP6oyw+SahQ2bKKPKMoaYbJED7COMXo4Z0L+nVNx04D4pr5/j3oj7nUXsF?=
 =?us-ascii?Q?vP/fo2UxNyc7+sKTBTN+skEOO1q4F5kRBx9YorKZuxy/zfZIuOY7Fbtj6MI8?=
 =?us-ascii?Q?BYg3LJfhNxMVAsSMn5LKIRN0NDwqNq1/mexLF0JuboqIiaPMwwkH1qpDv+Qr?=
 =?us-ascii?Q?O4TGt0LeQfq7ZjvZq7S5txLWcNxq1UmJiDe5/zFIjV4pc1XA/ENNlxDlZSpy?=
 =?us-ascii?Q?/tFMk4SgR4gr4TEkYRvazp81M7beLysGrmr6dugJ40qqR35aLG5XKqVG6pca?=
 =?us-ascii?Q?043AVN7FGWBpnS+CTY7LvLJkrs6OK6l1KgMcxXpZVWO3YcG2zhzlfHR97Hhs?=
 =?us-ascii?Q?WK4SD/jBXBIGVAelO8NnykvMMHwjwpkfygFPPhBs7qFAh2WI0atFa68jeSsk?=
 =?us-ascii?Q?TCvJacrPDPglNuZVeK/avZNll0R9IHC1SdReCTCuekGgDvip2lkK66/9pj/N?=
 =?us-ascii?Q?kx5rSYQtb/hMm2hm0/fMR3DDxCyTygb6Zrx2yXcS3GkqGu5M0AATi9zRsu/n?=
 =?us-ascii?Q?eLeDUy0FjOC47NofX/MtyJcJfGY7lz8vzN6cH5e1OvXGD5DbarQRppN6VFP5?=
 =?us-ascii?Q?wnm1O/IYusa2MwB6jptgXihQodhZ39e4NO+GHIdcxg3fepfbfU4+NITudpCa?=
 =?us-ascii?Q?4L7BCJVguFNHQ965YH/rRuwNT6+ztv75PvAee92ecatcaSS8/qGyuc/yhWu1?=
 =?us-ascii?Q?Q8soZ5bduZavYclThGAUpetd4oijfw3mbjPWJUbylWlQFaKh3BsUzGpdGMPl?=
 =?us-ascii?Q?7yjRUJ3eJOgw2roVbYW05ro4TmE5Bfv3euq2GsHZ8B7wbbk2np4lQu9tsqHm?=
 =?us-ascii?Q?H7OLVok2m/ePIv0q4ufF9yC5+6TDHfo5WmVcLiL2cxj6m/HTLF+W6Vk1f6PZ?=
 =?us-ascii?Q?leDo5RhwOCrA6XKXNS5TTblf4goG1vHqcyzNOM1uhzMl9/IhiSnnBjf8umyU?=
 =?us-ascii?Q?ZnfDyPo94oJ7+aXuk8a2ZWzlwyfOd7FnQQeckHTFVCegcyFoR5WVyH/u9W3c?=
 =?us-ascii?Q?5DjvuI3h/bvNhhL756TzQfVzkUSxFyDe1t1LXmR7DfNeNtNnRhxX+8YWaZYI?=
 =?us-ascii?Q?5sMCRo7uKNO4RxEGA0OmUpSx7n7Xq9ISL9+CXOIIOBsXk5gDnyEs3k6BfV65?=
 =?us-ascii?Q?xSrRvJmreEhGPo8GhbEhLodV1q761VWg66mMjmdVpkRCb+7SEPsGZUnNWdt1?=
 =?us-ascii?Q?yxt+4YFwChYP2ZUJzOn/4WfqIwJw3f2tU4hNffQlVTWSIAg1ip5/Rs4RlcXt?=
 =?us-ascii?Q?p2ZBmDeiLEwcbJ/8Lm8HinNVvp9Gwy/ekoCYPH5fdMzxJCC/CchbZyq1Bu/z?=
 =?us-ascii?Q?Rh4szmIjjaWJFcSrP9VyE/TeyXwsYiwv9ZJb4WKyNJ0PV4aYhvjNk46EMJMV?=
 =?us-ascii?Q?ESLR3f1iBgokd7YsG45Pc/lbQ0hsUlzmXQx2DuBtssxgTU9BoupOoyHYyzWv?=
 =?us-ascii?Q?3A6AR6z+i0JKfZ1kZvHI/4vh8gt+PYNMnkn73ewivz0yUrGxJIQm9g38DYxM?=
 =?us-ascii?Q?tj+LXb2Gjw7v7DHQXajkJZBTZBLgUEFxywoSvO0QNboWmDvbZHrcOiGndEuj?=
 =?us-ascii?Q?CTHaM8OQK6HBTO86iSISPH74Drm2StRdJ/MGv01ohqqu3EOS6PhuXzA57neS?=
 =?us-ascii?Q?2/EWQ+63ZAibITTCLEOrsr+UG+jNZYeX8cncyd7DWiFRqagMnQ0XFM328lAp?=
 =?us-ascii?Q?S81YKbphcyY+tbCG5RugUWxjViUpX8hR5qlMaKUwlfx6sMPVK3+7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82318be0-dd28-42f5-83a0-08de79b68c22
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:27.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULnh2TLH1O4uT6CpagjLQmLSi3aTqvP6FYle1kVe7q5AEUTxO2xkAerVCQ5PmyHqq3hmUBbgwLbsGVjpNI2eA1honJSz2rJi4zyqdfVrd4NJnKmxOcmIQVjoKW4z//pu
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
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 036b42058272f..bd09cb163e655 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -261,5 +261,5 @@ const struct snd_soc_component_driver kirkwood_soc_component = {
 	.hw_params	= kirkwood_dma_hw_params,
 	.prepare	= kirkwood_dma_prepare,
 	.pointer	= kirkwood_dma_pointer,
-	.pcm_construct	= kirkwood_dma_new,
+	.pcm_new	= kirkwood_dma_new,
 };
-- 
2.43.0

