Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC41990D8
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533911; cv=fail; b=VD4E18UdkPHSp6DKBJKW8kfFSItlwgE8oOultxq2Jp4z3KkreQ6HhguxdaMPBT5dahI+x1Yme2DDr0JXVMUoIGIY2E143ZkZDNt05P50om7awGUvU8NgmVzH5u28kicGdEiFXxyHmQrti5YY8VJt/bUSmLLdK5h0vEWK64WOfG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533911; c=relaxed/simple;
	bh=1ZOFyIE2tVyfmu5wKd+4ztjBQKj7rCR0T86VGabviP4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=soKiDVL6s2NIyuKTV0HS6+tpdhIeKH0ejcQkcodE7kU7jBMJq1Aoj4ZpcLWHOradIiXZBUhETLHoyVwV17zYi59Hgnc65OjJhRzGtHS4PNn61PSZJqOpqWI+V1fI7k2ljwwbs+It5zFAhGQL9WhHUlXwMlLmfm98jbauNygVDnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bXi7Ow/D; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bXi7Ow/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TP0g0jJHy0miQS1MEYrGMYKBBXPtQL9ShYrRtoHFtMY7fqkj44n/7CgNt0YGh57aUJJ3TIK6HxzxbU+B9vvsgR83BAf3ALe6voXnBHF2BhlW5vzWhZfkabCxnJveQ7d5ueuzc+tc1JMCwp+E3Oau4a2h3o7tehZAjGTQdOW9dq9RdXk31qgIHVgpoZvPm112elZcT/e0MPppQ0Eb38JOvBn4Ay6ZxCJ2brh3LDwGitqXiyxi6McyYZglmb23bnMJ7fUk8l5dVr717C7xFnsGsiFyUOf3RTssmxZR6z8puAd+Ybq6Nu2x6HgqxeOulsSeSyfOZXpfzudk+XwFQAoZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxOeOLUm6acnIg2lCSYVgeAswJSSze7LDF+mid9GkU0=;
 b=ll/9eifvYg4/5a4TI7fQcTWU7reN4FwArlh5akTWZYqIfgy3cfi34WlmqWnCbn3U0QtfzPanXlSEEg+2rtEQhxw8A3zplk1ENMYlH/1UZnMO7QOo3EIL/L/cKuscl+xf4POAJUCuojwaXdiIwz40r2vQSGcWcDAIv77FUiijd8/oj2oMcyPenO8+5awgORElwsEtspoORzfgROEsDEO1641nayUKf9u19vR7anFbKjg5cvseE4lsY2ID0qB2Nc+Ujq1k2GZDB9LnG38Qd7RJDO83B9vrdXSqmh/EnQSLMvKGMt3ftyTO/1F51cYbrh7dJoKi+Yo8j5sir4/mJcMn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxOeOLUm6acnIg2lCSYVgeAswJSSze7LDF+mid9GkU0=;
 b=bXi7Ow/DMVLHOPhb1ljrPchwyEgewzrcLfpAnClFPytDQk/nWxIO+SG8cglrUjkimnWh8iSgD6u0FnearY36d3kCL9kfZ19uiIULmb1zb2TGM7W1gjcqHYiqSJBh5Pn/j84IXiyUNqg6yqNdAEGZ/QFF7xVD0mEqYv4vYfVl0+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:28 +0000
Message-ID: <871pvla3jg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 135/157] ASoC: samsung: midas_wm1811: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:27 +0000
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ea1eb7-3eed-429a-4ff1-08dd560644c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LhVlDsK3Px5HfHZljngs3P85kv+7npyE9d9fwLE5jfxUIVIc66jI3kT2JOv6?=
 =?us-ascii?Q?WLeel84fFVxoN8lgtBr7oqx8k1ka55Eyo7ggvfc+C4VhImAHamC+oB4y0S97?=
 =?us-ascii?Q?fxvB/TiPWzEqBc35VNmKxzRC+gcRR0G6LREfXsQM96kicXBcF2dwIyS2xobh?=
 =?us-ascii?Q?7Ikt4nGWnI5SLPsuQa1l0iq/tNI7BDekKyh6DiTSBMsCa8Qhne3zd2tYAFE9?=
 =?us-ascii?Q?zx8jEaf1umjb4urYXcfLnK3lRWmj8DEwHO6IrDrRUAjOgME68omULYpV6Io6?=
 =?us-ascii?Q?TOW4wNVL7Ft3YNGnixKPmKqR1j2FG4Gw2LO49pvgvZrT6Hj+V6MNbcu25M57?=
 =?us-ascii?Q?D7SnsrX0yEwbNJjHx+AV8H8PhJ76ZlpW9BTMyIaiUFf5MqZOsqR9sGNw7u3O?=
 =?us-ascii?Q?/iW9pwRG3HFYQGrgTe6U8ELdCW0+mpahJUDtzJ0L74hMjuVecevjSOXYkOnp?=
 =?us-ascii?Q?Yi0hVc73AskedFO+0TyKYPJKB9LmiFcJwp0iut8pBctmyPjl7WafLzFdkHCo?=
 =?us-ascii?Q?LJsR/g8wEf6VQyLOTdpAifTBnA9hNEYkC3bi5ry22mVwQn5CQMhC1ZyRyyNb?=
 =?us-ascii?Q?gAj7Z8dvYARU8QmWN1EDLhAC3hv02oyJjE/kvh9+5YrYjb5My0X7jdRp+uIL?=
 =?us-ascii?Q?q1E42b3E78VS/C37sUTEJ2WJHN6dpTjIhMlGthB5wDsNgMSKGgfJ2XrznSAf?=
 =?us-ascii?Q?3tl5ct85qkijBmOz0pIdW2ednMWv6VzQaIYfsZM1q0pQz1ly0Q+M1VMDRTNa?=
 =?us-ascii?Q?OdOdkUxB6Gy0XeKx4Au+aAkShxsptKitPZKGOMIdLhnv/Lofuh6nY79HhdpO?=
 =?us-ascii?Q?n9LDoV12GB0HSVfJi2J7cfDfNuRBeJAsxNgeHIzCPmJ0TpzvVh6qZENuvSxT?=
 =?us-ascii?Q?5OZgaqzf8YQ9vV5klhI5azT4lBagjra0IMrrSnR1SpFz7jUeR4osu9BNEE3w?=
 =?us-ascii?Q?SEgk3aCByfLY5IbURc9CL7CA7sigb9nJCLSw/uK1w3lZYdOZTiTmgesZrGtM?=
 =?us-ascii?Q?26eBabq0ATJpuhDXJL618vY0rlk9jAvVzdQjc4TVZKlDby7kdvQ/gqjDxAsn?=
 =?us-ascii?Q?jl6o6QtjeHFdp1OIljSia3PeISjuPf+ZS6hqY8vxi25zoMc1x9qLz+nxkxKL?=
 =?us-ascii?Q?JNeX2jTLvP/jwQUwJGMiyr57qhBO4//Xbin34VbDlIhecwJMPzAPXU3HtoL4?=
 =?us-ascii?Q?U3OtldrlVtBGVQxJVqG03fMnQXEb4yhNuGl7n87XK6XDre5pUgF6UQZ1/YGq?=
 =?us-ascii?Q?nBLpuCbD4bRsmCpL1cfi4E6B17vyclR/rZqapre02VPVSCwoCDhkiLKKBoF3?=
 =?us-ascii?Q?ZxgCl08/tVZTdU6u9Ss2FPw7cUklwPIuEMADdJv6wV92IVS1K9kswI24NMuN?=
 =?us-ascii?Q?9fphrln4EfwXqlKwItEnG9x46sWpntefIzyVbBkjfu3/9mAnYNT+QggmiSQQ?=
 =?us-ascii?Q?IhLoh3JEZ4wkLz56B+px0QrPd/BQuLb6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRQ6sxKBnTr7kCkrsfJO61iR6k4YiIWWrHOIcgXZvo8czoJusXJ77yoC+CwJ?=
 =?us-ascii?Q?vjxwQOoOxhsmrL5w1KUg9qZ3BluLdjrbeJ1ZCEoJWJ816KXWwj8R5cqsbr6W?=
 =?us-ascii?Q?GZlIoAjU42iLbE0UThiCxaRIpffWsQoGF38dOoqfMYgUgzXjnDt2BLCpyUO4?=
 =?us-ascii?Q?Xrcw0KaIxscU5/pWfq3N4ys/3NBClAsDOj41XiGyzK02Ncq/3tvI84xBabiN?=
 =?us-ascii?Q?Jp13GyJYWrSJdYwFn6uEzhVVGDHp7skgmnKhDyB/x1f6xjSPE8wa2w9n7PXw?=
 =?us-ascii?Q?vJPndNKCiKmu9uvZGqlJO0ADd4VEbGXAjI1iZKyM+LpcbIAMXY6QG3hdV9o7?=
 =?us-ascii?Q?P6oBy6rvs+iQ4Xmy6LOSjGmfmn+LpjFGz3X9s3xWUH+zq9Vng33Jckf8HGt+?=
 =?us-ascii?Q?4NLzr8xYO7x7o/7epS0VB6GfmqY9uJ85hkOqJ650o3wGjoer7q8/b23t5q3A?=
 =?us-ascii?Q?p/1wXFWtMKFLFSA1uCf46RFwIx49YwqQWBFwc5t49SuE3QXxQRc7V3NM9xLF?=
 =?us-ascii?Q?vOb7c46/gH5LSprHHtM7YZ3Mx+QVA6niwQTvMnXAgZTXLou6MYb2/hoegzlU?=
 =?us-ascii?Q?2ESVdAKyaj12ho5eqQ+uOvlimtW5SSKkrKpRwkHzLBuSfP8XPwdHE55rik1B?=
 =?us-ascii?Q?eindUQoVUSCK7BJPcBWTKCn108w+l6ILW7eaxmJgkzW+ukhPHWiBt0PSZdFa?=
 =?us-ascii?Q?C0Iegh2qr09+2ClNRdVsaQYqUjWsXkmRwWHGjDgtv2K2g5IiExjDVS8Hn8Se?=
 =?us-ascii?Q?LaHokOs0Fwdn6taPMwADYSJcMjWrK/+wWmIIqlM2gTZaETzLsUXDVmdStqfe?=
 =?us-ascii?Q?9PnHHuuXvMwBftOw1JsgaLb66vSVjAT49H5FV+miq1FsWsK3M8ItAwWL8TsM?=
 =?us-ascii?Q?DN9vU+DOqeOAYrORRAEyTkbb+4IxeBP0Fwpq1fwQPV9hNJvUyuV27aMSuG+t?=
 =?us-ascii?Q?wboYVRX9Ef5I+wliappQDBhqfGHOiBgq32ydvJxx2Cab7pVrPVdlsp/clnwH?=
 =?us-ascii?Q?awoP8daEzJS1jcc3dxMecS53w07oCap7sXdZUlxMLWa35y0cO4UKH1oOR3eg?=
 =?us-ascii?Q?91ZfWa+njypd1llQWvt73ImAhI2fNsZ1ND1mUVXIcRXEpy3+xJficDWejEio?=
 =?us-ascii?Q?niQl4c/bfLq3uvwY9501E616EsO0SlMbyUvB2VRDt9fbC7sRQqAXcr2RQiXT?=
 =?us-ascii?Q?a4T01ysgDHYU0YddrNcGMQC4KPfnA9yCPpQfBQXvZV6ZgjgZ9w81e3veewa4?=
 =?us-ascii?Q?4D/PvhUsd5iV/EA+EA5KRUc1k3N7uMJYs2o7ySgFGf3EsswZRCdVsxmO/Vos?=
 =?us-ascii?Q?dCt30STbs+OeSW/McxGUGa7Cdft06WzbW4ubXYJen3PBxmFvqxb5FcMgWiLN?=
 =?us-ascii?Q?9Hc52VFXdNZ6WlSKEPHyE43C7kcwqQoCgiW5QW4ghNkjYE+Ktd+Am1J7rd+6?=
 =?us-ascii?Q?zJD5CbKCNQpnTANStqE73XokxiX6LOLoKKrpHFuGgetZU3iM9T+cup8nj5Vx?=
 =?us-ascii?Q?PVA1zYJsAXWv8fjP539xvSgAsohSdl+8OZSkwK1JOkQemZAuPAgls0mzEZ7D?=
 =?us-ascii?Q?SDoRjfPxc7ev5ufJURebwzprWLFrPaF9RN2OvLgH62k1F4ZOnIkXv5rT7Ud1?=
 =?us-ascii?Q?P3CB2iuBA3DZvz9wJeZ+6hA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ea1eb7-3eed-429a-4ff1-08dd560644c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:28.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iolrqsFbz8Rzf2jFQrGoxkzw7MVy9deGLUQCyw2gks5j9hx/+CNUyKADx273LmGwmoand60O+h7hj5cHXFj8YuPEWIRgbPLrnqYYlMOglrTo+JaNx0DDeqgbGELd7Fst
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/midas_wm1811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index bbfe5fef59af..239e958b88d3 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -537,7 +537,7 @@ static struct snd_soc_dai_link midas_dai[] = {
 		.stream_name = "HiFi Primary",
 		.ops = &midas_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBM_CFM,
+			SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(wm1811_hifi),
 	}, {
 		.name = "WM1811 Voice",
-- 
2.43.0

