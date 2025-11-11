Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81187237A4F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821368; cv=fail; b=u/UlhxXvnQePYtiIC1rkDUlzjSbfcRShINfMeshhWKotktJ+55iaNPmX2CD9gGC6G3mjBWYnneza2lN7o/IYxa+hI5GoFvey0DN681WHjxc+XLTX6mJz03zvni96dETpTt+q3goDS3JfUeP2K5KmLdUlThsc0eXTeChKnEJuFBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821368; c=relaxed/simple;
	bh=sW5zDR1fC4f21iQefpxgvd/XUBtg35SGMw8Jj+ocL9I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PTjO8t1pM8LTytTy3+/5pj+abmR5rVGiVtlYpsmhfgi94i31UvgKQQY2ftOi0mmUN+0Sgok7ju4wfzUpAR5D3W3Y4Pg3/tqgj3SDHF5HF84FjBW+3L5rV7hmTGqtCN6A/I9ZuDvtyt2Y6z+2pc1A1EheTb9HxkR3DWW4s1tV0b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ecTcP394; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ecTcP394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIivrNVhPrrPuYvKtmnDcM0MH8J/Nh541OZIy7SLDz3y4kJAG2o5/gP61q2B+r+DZZDW/RmoylG4uNha74pQV/hIKBPI6BNwW+2R54C4l+MhEY1KOzGQ+2Mqp0nAwr5EdXvVGHsvFJT0aE3m0XihKoTeH+jIG/7Ra8F1DwrY0wxEvJNWLqiKBbDHUVzg71dZ9Uk/Zc3a7qGKmY7+uJQjTnkTL66XdZTKK10bbRplnFKA8OS8SC6Dbf6msiGsulqSejV/MCp2GBRPx239Jp3N2M6M/+sH3z1N/LcWPgQ2nO2ds8aJV7pf5YtyOaFXeXnhSkIR6x0fQEZQ9csqYF8QpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvChYzO8OZHLBmY3IExp2qGWXCtw87+ZQwr/vzzeBfo=;
 b=tJFvuLKEeFDblhDcDCBN89H9p0OQRpd4h1uXMwGlYlbmLWjRQl57sqZyGzo3xCNy8wl3yt/VwOoSoP9/iaeaIG9GI54A8LP0iKwcFJsAa3fn7ijvCSkJd0b5JDxWoMcFiO9LRA+rbZIhHQBvR4WRFO2iIKhYaJ7gtXz1ixo4dHC1WOh0UFA69OIDkoejjiPC/QZygXp1kR31RIdBMGR5TcnWpFbI7gumOB3XuQRlAJq58fB6mDeir19VngTInVZC0MLJ5zD769JTa7QnF49i3H7gTHLS0HnX+ExR4buDYrVwjL8r4pTy47Bi/TZlG/rh7V4XeHZbrSYyNMSoVsF5lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvChYzO8OZHLBmY3IExp2qGWXCtw87+ZQwr/vzzeBfo=;
 b=ecTcP394ND9vuPCd/1Q7cAMinVbDxyd5yzU67aXCLZAPDAcfE+zNgfLuSO46Q9GXZxXPltpao170ZrZFlT7fE9oXbtN96a6kwAlX0fY3sTNbP0iusDIJoK/C2ck65V7ASwni8k7VS+dp9QvVfPeMr8r8K8zN3KXqo2jvZRJObTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:03 +0000
Message-ID: <87jyzxtngt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 269/292] ASoC: sdw_utils: soc_sdw_ti_amp: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:03 +0000
X-ClientProxiedBy: TY4P286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 020414f0-46bb-4340-bba5-08de20ba4b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ie4Siq+J5gtDlluJMeaBX2Xg/bBU9RJvnqWzNav5q/HuPED36z1LI7JKuGdh?=
 =?us-ascii?Q?y7R24ZeBoKcE5qKzUi1S9Amu1bZS24uGFZu+E6dwveB5oEdK/kC/hP1pSl+F?=
 =?us-ascii?Q?GMf3qbHIsb+2UY4kiEEePT0o8t/oBJLma57i4CPQsbWIBnQXQcbepYQXlyCj?=
 =?us-ascii?Q?qkDyyMUhawABHIGqT192R1dR3T6gJPrjZiudIfuwqacw4NEwAe+YIS3zDuNt?=
 =?us-ascii?Q?Mvbwh1UddKQ03OWIzcgU6tQZGN3++F5Xqk8nm0tTo74hGFJf2r1TZNQvo400?=
 =?us-ascii?Q?O2ZbM/X2KsG5PC2FGGGoTjkhoVen8zCHpzfmRGI/PWXvo/vtmujY182hM1nQ?=
 =?us-ascii?Q?jQBmZRrtC2m1IuhOQYGTA8TgburVwBLGmWvvfu+ae6ky40ZJU0wjo+Egklxs?=
 =?us-ascii?Q?6tWF/3+mpCsyq7MwS3Foa/+YA5mYG1VTtLA0jfeZwDg6wy/gxly/nuOG3IT0?=
 =?us-ascii?Q?AEUCb1k/X6Cz1rFN9TqHaIfiCU306lMjl2NTuWTznzxF2nzybxParHc2Ld8S?=
 =?us-ascii?Q?dcsrt3uqz6hHBmueWahBAAlGNELCQdeOK+i9X2qLF22jof+Mi63QABC1EJJU?=
 =?us-ascii?Q?GYme95fpH3CguGZ6rBkkmDnRCwYss/1GD+prWs6eYe7SSmtFFwtWwYtDLooD?=
 =?us-ascii?Q?fr9Q3/oGu9myJoxdiulmEcuWnnwKr0bK4z9qxI7Yk03RRJyfBi+u1XQ2Ehe4?=
 =?us-ascii?Q?kINaxElBtNCgyPK027tl+3h/iXpCYPHGbQqGev3qigx88qV5A8/2aD5WO8ly?=
 =?us-ascii?Q?/+jrKVVlFkkTo95Z9sOsloKNU0Ji0ySmYG3dVT1r9G0+ixciPk8uNaKwg2GJ?=
 =?us-ascii?Q?8Qn78d8gY+UkFUA2fsjBtKu9gp5xYcwuGK942sdA29H4nV+2K4DheFknAGGC?=
 =?us-ascii?Q?G88ukwTz1aridcTBq32s6JTz2U3WBP4bEkHAAEnjfz8nNzM9rZ90hvIR13ay?=
 =?us-ascii?Q?kaVwdKN9DPE7i/it972xFtGixg4CXgyQ0kuaqosc7EjCUtHsJlL0sAmbS31J?=
 =?us-ascii?Q?KhV/HyXxWVY+CA5L4wFM+WkC/7EnFsvr6veOebY7zLxV5mRQCP7Q2UGp4GeU?=
 =?us-ascii?Q?L3i0++eCntY3Qof4nxVVLxfiMDVDlie7BB3a+OrwsNmLeNbwoJjaJCUonmbk?=
 =?us-ascii?Q?brZr6ShSZL7SXJ+Aijf5WRMwc5rViQuXzTtwuW87OKz2Rj5AKdDdQ2wffbW7?=
 =?us-ascii?Q?H7/dyjpRbE2ilwk4zvKgg4K8NFJ08bDbTtgXBrJBORIAyv/2+jn+qNQDVz4C?=
 =?us-ascii?Q?Bd4p85bCVJCEw3D5JOvu5JI4FylCSVzYF5lJKSmWWQ/xiw3glCCGkSaGyF4i?=
 =?us-ascii?Q?0K5uVguFupT6eB6ehOilSPMSFxd7KAc4T7hltAsOvfOBgmVUJmssJX8RgIki?=
 =?us-ascii?Q?vRYBH2rbxeFWoSysV5vAeVuQXuPM2iFdFerGWoWAvhNqpaRyYaT8bjltlRVH?=
 =?us-ascii?Q?mpBJ6xpV/uLHIduoXtDyD1D2+bSkiFEzcjF9JXRg6aMVJKvwVcTjYNxjWULN?=
 =?us-ascii?Q?4oFmiqi4qGA99pk0UmCvx+P9C4Wdg31xFUYI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+yonfYTHsHW14a1abzKsAC9K3a3kRhx7UgMml+L+fJo5MjC7dTmbTIvoV/f?=
 =?us-ascii?Q?ar1Qe28cABpgF8Rg0zHFxdNwzt2i3g+/geUmBl3lEwNJh7w54LTQS8gfsL2i?=
 =?us-ascii?Q?cCbSWlD6G+SV1bYFiPEVicI79GlINhs8edpmzNFw0xPANj8HaVuuOtbdziJw?=
 =?us-ascii?Q?umEfAYM2+1Qa0l+6dQLtAny+VEK9tRGElQPMIMVvB7rqE0enNdhRNJK6i/N3?=
 =?us-ascii?Q?Z8134JioJqV+7TuYykcKsG3A3RrpD5mjuk4NYhBrUB0G9/MI4tZ3kt0w9NhG?=
 =?us-ascii?Q?FPzwAzLykPQcJlLZvO/k8y3pDHdB37V7iT+Kt4lhiWK/pbwCAMm9hiHI0t7p?=
 =?us-ascii?Q?K+fERcR8Q8BhjiYkiNa1q0gqKQh7HbRP8WKRPK3i94tDEi6a7Z1pLsNBmk8k?=
 =?us-ascii?Q?yZVsnWyhIYo+vljeNpB+lktcdgdvEF+mwKtIXsvcWAqw1YkRwxrjjwxP8MWA?=
 =?us-ascii?Q?6Jbcn+BxSMz5dSMuj684ZoVYiweuvIirWdTmA/A4JpxZ8juDX/SkrSS6xp7u?=
 =?us-ascii?Q?dePQXD0YC2gmTn9BNE4FWjY2CD3dqe35OR9B1YPmvQCJ8IOk4cqgtoqXC7nV?=
 =?us-ascii?Q?Nh1bCsElj1Z3dKErqwK3PQNnOFMCkHZF1tgGi8ukkggGka8yU4Lorro4CjH4?=
 =?us-ascii?Q?vxYszbPd4vXVcsP3Knk3HLUfYE49Hdh7APEJp/TI0rkz8iiPdhmLgB/JRE7s?=
 =?us-ascii?Q?wL2+DBVFEhxa/nqSyFygp2YFygZtJDkvNVqwHYcDuw55txVspf4/NM33+I6R?=
 =?us-ascii?Q?H8S8E9C/ODpMDnsi/tHq88K5KZdoBmMKGJSAxjurLgtPtMZgJMtouAe/EwrZ?=
 =?us-ascii?Q?hbIjn0ZmtCf2WV5w6YDjJP/ivzor4J+KIIMPYuOHQMaohduO6qR2l3TM241g?=
 =?us-ascii?Q?xaP1bmga77KPcpTdEMEYRFvHHi4k/lXKzjjPDD2EOCnAcLmAWybWl5x+ZIDG?=
 =?us-ascii?Q?uapVkkTBMqIzBVb4p8C+ralfzDg5bv/08pBqwB5Wd5r71oqrn6CDleCrhAtF?=
 =?us-ascii?Q?gku5ZFO0/a7CEB4eUt9cNGbQJvGcnrsA3XpUdBzfirey734/kt72ncObUoqB?=
 =?us-ascii?Q?QFRrDUuC8Q2wnM0VKNxmS6mGRi1JNrp5BqTJqMYdhHB6phM6CgkWNoXtS59Z?=
 =?us-ascii?Q?UbNrRuD0KhwnCC6qKC0kxETTAarEZ5Eu4ujU/qSdObsLnV6p4fmoa3PtNwJv?=
 =?us-ascii?Q?9bLZQs4X4Vj1Be7dAWkzzj1StxKPnRVrRiBmM7qA18t4VtENO09wv1Ah3lVN?=
 =?us-ascii?Q?S/N/8VypyVsdLey7lJ5KrwoqkkOG4J4mqpWsFeNbWhTzo6cr0IMc0B738A6v?=
 =?us-ascii?Q?mAthlyh1CmCaJLdqbrJk86rQeX1ryyV6qAwZYog5vDuKOWSs1VFBiEMiMkjQ?=
 =?us-ascii?Q?4nLa/e1VgLcXm11+I/9Z37BjXXePQb6W13j2NTR/6BeSZubEpzWWoIC+sTJ7?=
 =?us-ascii?Q?MmFMrpHfVU0wYwigLCq10Uy7rxdLiWjPOvQuXIDm0GkXYfQA1nqQkBQxjfBL?=
 =?us-ascii?Q?XZjky6Dc5hfpyuGcaES4BvPMz3q0N3kIUY8vQwLROPNssILQkYxGUdDYd2VZ?=
 =?us-ascii?Q?gh4jEpBdMZFsP5awbnxY1Z9qw+sOBBZy6O2DvW82sRj7vb0j5k5aNPQHZqAL?=
 =?us-ascii?Q?z7SuPgjIpXrwZW6Z1Zqir9Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020414f0-46bb-4340-bba5-08de20ba4b48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:03.3385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLUROchA1IGdmLGbirddXJmzKGeEvIY3LXDTpahrp3msz5nLjEMOvZiWxzuEihtw0eftBVb50Mez46Yw5QakEKWnvPfapVSZBOmvsD2C3Lo/jhCXRh64pQ3N5zFZp0iU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index f0011360ae9b6..cbd60faecd098 100644
--- a/sound/soc/sdw_utils/soc_sdw_ti_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -41,6 +41,7 @@ int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	char widget_name[16];
 	char speaker[16];
 	struct snd_soc_dapm_route route = {speaker, NULL, widget_name};
@@ -68,7 +69,7 @@ int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
 		if (ret)
 			return ret;
 
-		ret = snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+		ret = snd_soc_dapm_add_routes(dapm, &route, 1);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

