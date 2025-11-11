Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FED237A4F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821325; cv=fail; b=CwGkG7OesgpFZZUTa+zt345xOz5SPIw1cc97jFxG0kUtaCFTeb+sIcqTqZbeat/DDQMbmTI6DISury0pY4jf+LYi8N2y6GvHGXgIBqQJBKY2tqgyFmbjuwecJ2GeiC5vVQv0j/jBTcC5hH4/L+81mhpGEoi3ayyk1l813nawRxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821325; c=relaxed/simple;
	bh=g8PEBNInUVOH4O5+QU2m8SXnRD7g9Fh8g2/CufCoT8A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MmuldTxCcoEfCmcWaA1CTR6GLiZHxFon+pe0tNClgCMtASSWFWs0kRToHdpycpYAB2ZmM4Zc8Opp/2vJ7kI+Gli1eQO3OFR5Ztk6iMdMWheytUvx+NYUYyNf4i2Iq3/XckIgo7++Pf1p2ZOBcr8wsg0CXUtXZbJdjE4ky4XK/ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cf7RSVUM; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cf7RSVUM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgRW4eJjBYApVwuJ8CinCZ+24FnPWGccZUv6F+H4UgaWeGdi7q/V7wzSWSNC/HCRW4gVn43dMbHaSmoxjb1fxV1KW1l24bSDbV9IniR/S2dQayTA5BPrYzd7tZ2l9qFtIObgTc8wONbgGDxa6XcRjleX9VEdZPpXsnhXif+VPg950BbHvNNRrtdG/gwqxMLqFBIka7q2z5bnjecKT7rRP8d0MxxRY5vUrXrE9z9nr1w0T5yRqW2ajvmwfWdBVfUH/yOG//M42an0aJyeLUoDxs5Ym74DS2F4KKnX06B3ZrFNexmfnjabnSkpkXqb767fIBHPLcfVBczKzBYVlu+8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tmXuyjStKMmQWdM8SN5A5bUKxeRoWaUOheIvpZ0ujk=;
 b=suctZlm2Mg8qrc1keQZK8+IqHeYOB/TI9f+JZ+wBwfDEEqDctBV17mcLT8Mdj0VSh1RkJieUj4hHTWrYhrnuFqta7Oj+0n5OJWciNmD4C80N4aEn4QXJ1BKjoi2zGZqN4yuBFcMgEeFpC1Te8Uw2fjU+3aHsbNHD2WlZXaFNIBOrMD266yFgjutWm0vqWNTTump9RiP9WjGnkLF6vu38TdKyHlJo0+mVre9UBYbbtBg3Br69XTWhNl7XusyGj1w18i9gWhssYDAx4ZZSrLqMzPBZ6YwTOSKvcjldAbpTJR13aoYpk384AdBu3jWvCEyVSpLk1L6UAwibdYc1SdaK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tmXuyjStKMmQWdM8SN5A5bUKxeRoWaUOheIvpZ0ujk=;
 b=cf7RSVUM5I+s2HlR1lHK5kJ3YdjNsxP/9WE3ZdaJHh6CPkRbLnfrfmblS0A2ouQ7CBlUC8uXQwxyU047wEai17Y2KR1H/hmCntjnOX19iFvJdZVe3X58fMnalEOaSPJ7XOU1ZaNqYDkj8sR0vrAgFWceIt6TYIUIGp9EJSTlP0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:22 +0000
Message-ID: <87wm3xtnhx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 260/292] ASoC: sdw_utils: soc_sdw_cs_amp: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:22 +0000
X-ClientProxiedBy: TY4P301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cea64f-a910-4474-ebb1-08de20ba3324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vJzDyPe6wEFKH0070r0ZE0oR/ycR+RK6RsmGYSOVVCAVw/l0J1XJdTYJ3gT?=
 =?us-ascii?Q?5AccuNw7XOQaPkNAwNOwd0AGNtmBISHFIPkd7vhFsnmW8CdORDWjyB4WMOTR?=
 =?us-ascii?Q?WM6rMYBBfcZuOVvzRzYjwduWflNkBIBq4xNexKWGjRfhDDlN8d3cFxxloN0E?=
 =?us-ascii?Q?lGggxdDySBmONgG4pRTZJstn5pnWYW5SvF0b2/9xMlExNOFvohcrHEspmewD?=
 =?us-ascii?Q?l4+EPryqfYeOWeVuwsrEfOeJgi+ptLMmahjdJd/ZESYzlEGEI9FHEOMsUeVT?=
 =?us-ascii?Q?36Abq7Pw96jvBwYkJaMMsTTNuqWuCimgXsEJGSxAD/ZFmnaI0qYYTllrVUUe?=
 =?us-ascii?Q?qrboknK6KlJQalpRHUG0aFKJwPBZutmaag8ftWU+VYB8QGG94FHtUVk9KVad?=
 =?us-ascii?Q?Gy5H67PkdvukOcR9YfmlayAeCDqPg9EYv2N/YGp7Ttfl/9AZv6O5SESFMFmA?=
 =?us-ascii?Q?2ZJ9oMa+zvYHdqO+Vq5G+vsUGUieVTjgKUTXlLnSlQp+12DReZZ/ikqzbKWa?=
 =?us-ascii?Q?R83EKDa7w89F/yvbduyTmXiAMT6LLX7DkgjkUXRoyRQ69gPeq6WTb2f1UApd?=
 =?us-ascii?Q?uZRCUPpAEtCKULPQ8CoJ+UmIfVtr9m0IlM+LtUZS4ZDbmcVx+S+4As2P/kzc?=
 =?us-ascii?Q?hIc06QuxohH7s/lopTgcO75aUU9Y+rL2q7Pmn6531dpiTLPQaJE8UF0NQq4e?=
 =?us-ascii?Q?ECitK4tgbxn6Dtrfe2/B1pmPEmv7+oqZNo1YrJJO6cWU8C/Z3ZjmXX4j6d+d?=
 =?us-ascii?Q?YmMaduAlnIupBqD0/uu5dsHyvhdDkjW7BPfBSpqPBrWXUkLiyHeO1V7g2owf?=
 =?us-ascii?Q?t0pmGBSNlyM3BoHUprEHfrJyTRMUqBYptjLp4Ei8qjOKKWT65+KxmAC9O9zv?=
 =?us-ascii?Q?8LBxEMmwhLFn3sevzHpAqDM19gQ4dKSD1KorOmz/gDq86iKM3SPQFH8ggPag?=
 =?us-ascii?Q?Y6SFLjsrCsUaPGhX+1GJlN3r7UmkGg6QGTDnpj7mkLlrhXkD/AnBp9GN0W4u?=
 =?us-ascii?Q?K9Z6STdgF4m6VTBWIxwshrRMOjiyZOtUfHFRCfehnfNKDMchKuB16PS13XQ3?=
 =?us-ascii?Q?SprZCcGSwLc16pGvl8yWgEAQnrcbe24ZkROJjhNpglTpVlaBgCGoC7ydtlkI?=
 =?us-ascii?Q?A2vnmmbtSXaNkZ+V/NcD7Uq4ZdzAYYlMyL8jGd/dN+jV2qyh3vCQUQYB5j13?=
 =?us-ascii?Q?/BN+rlLPDDLc0fJZw15ssYGE3EkrRVggU+gXfjuU7rofXpLkIBc9n7PnP2Rn?=
 =?us-ascii?Q?2O5ydmD3JZZ493jwFhbZA7ls6Hg2HAv2j0UOd+SMgyVQfjWeUok6bUMBcSiy?=
 =?us-ascii?Q?HDqcb0T53j1Xl10L8Q6J1pvjaIaE9eppOm7YRxN3a+h0rmfGTUPmxLNZ/uqO?=
 =?us-ascii?Q?w4zONiHsbuOG94SxgkroVNel/nGpmpDdUYd/HhJLhlKTAmVwdYxneGwOzTud?=
 =?us-ascii?Q?Sg5iehX/1pXQC6zZg0IQWd84J8kz+/kp/JRrhQguCkAYqsGYC7okdvvXJf5g?=
 =?us-ascii?Q?H7g40crK9TyNQEUDdBhGGDJLK2p5zRd/jPi9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P+qltPC+BZLUdqECk90t4MForP48cFXrmr/eyCcALWlcoHvwCQhbpp38ycv4?=
 =?us-ascii?Q?ZR+XEwXF69t+gp7W6M4QZvjBnQG3cLqa6+lS6J7IJLcbUixdNKf5SBFyTtYP?=
 =?us-ascii?Q?fwn0xrNgiq5E3PhVzReCT+WoGePa9xKtDM7RBpsadqZAMI4rOx/VTbDyIjvp?=
 =?us-ascii?Q?yxI1/4R2IYmB6Jo/uXmzS0gTFEWEwG12qDUJbs2svpGJm/K8SRY8QuJruFhE?=
 =?us-ascii?Q?43ExzTkM1fBVpdxqnO6nkcnP+d3nUVbBGlre0B3/Nb7p1IO1w5zcjvkdUm32?=
 =?us-ascii?Q?OgtSi6E+eMkfld8/b4kX1EBvEX5rmG6DXI6Z37dj0jTNk7AwoxR3nws6KtSF?=
 =?us-ascii?Q?2SqMv7vX2CJJ3V7dxNkC0SUgPmMtZ6Lsun8UrgiU5BDoT4L9Xm/akGrLz5xd?=
 =?us-ascii?Q?HBuJ5CMBmNsw/s9n5QWQ5L/Eh0nMfZTjHolyBWuOe6gznfgzejoLrEohxuaR?=
 =?us-ascii?Q?Uw4wFmiQoNZERXg+Svb9nKR3vrLYl7Q4ibUgCEOucI+igxT5QeQ/1p7q1UFj?=
 =?us-ascii?Q?evRIbcOvm+RoGnAL4SwmyUHeXmOofStzdyp0ds4uzJordPw3pE7qgINKGxxj?=
 =?us-ascii?Q?otVsNqdo3HnVlt54S7gsO42zw5Hbyq4m+4P6CZ3sDpRcxu9MVzpGPpnu5Exx?=
 =?us-ascii?Q?2HMHOqeBFbjSI7fAV4ULLd/LiBSruz65K2G1ZaqEjYXnhQTQpcK4pdS2ELlq?=
 =?us-ascii?Q?Uakzx8shoeocCm9aSSrSu2WGUGFCnI98/jyZwFksD+dl8PUmlgaiNyR8hCoA?=
 =?us-ascii?Q?fBgbFV/ZsWjENfmfIyAEsnz/uezci9B6vP/xnzd5rzMaW8KjLHQb2DGRcAZY?=
 =?us-ascii?Q?cnlBog/Luu3B+0yHv2KF+9lnxLp+o3BGW0BQ66LsTxeK56e0GdtcwCjRMbEx?=
 =?us-ascii?Q?Gxv9yt7FHbPfFWzO2n2f4ZdRHmagGuvPkG/RMJkLHTHaPT/9LcEgJB4DwxPZ?=
 =?us-ascii?Q?lSTsV8Jl2b9+jv/ao3HBPJAh83bCn03p0iLfMqfq7Uyk3A7duwH10yMFUwiv?=
 =?us-ascii?Q?xwSmLnRH5bsb0B/iMy5BDjKKKIK7XnqE1he8h6ylYpUzR9I4EDW2mpxknrbb?=
 =?us-ascii?Q?m3h5uL2LZNQqSs9qnw4MN6Gotgc5bBbo6IP9mKt2x3yYCaKBtdi7ou0dj62j?=
 =?us-ascii?Q?912hJ6YqZy77waxgPQV27wNbSb5sATfUnqvwtAKRm83ohGy/orTKPoPpZYnO?=
 =?us-ascii?Q?k+DysjjF4c7B4DUcnz8C7L6ayl93dylI3nT4RnZLuaLL+QHvLv5hV97neN9f?=
 =?us-ascii?Q?SHaUGe9HxYktTQsdi11olRBO5B9u3rMUVHfVfhubfTgPTBO5dJKLQzVlFfs3?=
 =?us-ascii?Q?DXtcKyWyXka/YYCvO2qNnE93sVamDBRuHTldlEbtBdXFd10NoTn8kEbAFUh5?=
 =?us-ascii?Q?9OHGOLoanLVqzM0L9wGbanysstbFH6ujtlw50F62GznLhoCtUCwHYRsjEltP?=
 =?us-ascii?Q?ylilXWjjxZqR/GvbvhSa3q9M+Vo9uEIr49uiPs/3zMUpqsyEa5MHBu9XZjzQ?=
 =?us-ascii?Q?BSmWyO/nWNxU4B5prZolP0TI67hg+vDtAPMcBnIj8FkSKUInYjAtWP1HvP4b?=
 =?us-ascii?Q?WAmWB+l2D1XPfoqXAUuTX+gQixbgQb6RPq8R4dG8hIe52QS+GvafcsKGsl3U?=
 =?us-ascii?Q?RmN9AlufnejcM0hUZQo1pcw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cea64f-a910-4474-ebb1-08de20ba3324
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:22.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUnCCCDxbhJJM3lSPAoEhO/bikt6HP5tksmR4jkplvvJEysRAtRQFgyKSv9FvwGOg7GsNlMg9rb5K/9xHNMPPMZOOzGHFMOzrQvoPJqj8dh24O5wZdkA6JCkpGArtNJI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sdw_utils/soc_sdw_cs_amp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs_amp.c b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
index 520ea36c63eee..325ab72304817 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
@@ -38,6 +38,7 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs35l56_volume_limit, "SND_SOC_SDW_UTILS");
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	char widget_name[16];
 	struct snd_soc_dapm_route route = { "Speaker", NULL, widget_name };
 	struct snd_soc_dai *codec_dai;
@@ -54,7 +55,7 @@ int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 		if (ret)
 			return ret;
 
-		ret = snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+		ret = snd_soc_dapm_add_routes(dapm, &route, 1);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

