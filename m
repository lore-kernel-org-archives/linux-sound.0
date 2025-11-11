Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1517A1A285
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821015; cv=fail; b=s/iPLOcv5BEpQ6pNnH6KpXKtZZXP97hKb7DeSvxIzX54cobsZeLzwz6hRMh9Ern+qVzyDpyyOMBYA50D9+EmOaSf+O3bbjt2UHrNYEaDOQTCt/nL4HeN28/m7+1csBw6nWk3QCvtt2TrPPlmUqmGgSdAme0i70pUT49D+9CkaSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821015; c=relaxed/simple;
	bh=xQEPLrny1jvgUWk8ABaXBaHPQS9PTGfsM1uJhM9iZFI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XN4+GTMKlUcagH/D/0s1U8/ZVKnuIXGDAoJXlMnJW4E8FwTqdzx8fO4LW/++1PBHpPHfoAylYXXPO81gKitN6hRFZ+VD5imMDFZJunqlL2dq7wVttsvc6t7AZ0b8/vKIWrxCcAVF3neKSfrebiSm4hdDtv3b8gTbC0/rhFuK+h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ctUi/RkO; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ctUi/RkO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe8AlGdpgi0gv//aDSuP1CI9CEAVQFQIaI93XXMk+5p5kXr3wt/x0Y3/phh5t/0Dh+3lVJXbmKWi/7MeE4sryYD8gaHFUgngMbl1PHX1LYvWB81iVWoSu/JGGhjIwwO2NIPznmXsbaU/Fbr1uB/qUjRI3tNhyCOt80zjmEbrJtdeCHaT9Q+usoee9Vs3QrkmUUfRw4Tw3Bp6NwrLHQaLgnH4mYL5Qhn9hu6U5s9lABxP1KFAD249JljK9gIYR5QCxGPHW8EWfn+KBgDI/IQabjNjDVe60SGq5KY9dbXRQjKc1uRmT9BxAtnDB1cN4wQlTbd5mFoJWFSQiBESgjISDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knPls5lQQY/MGLG0RLUnFhW38Zwpu0owX7XGuaMBXt4=;
 b=fY24lY3VsNUDgcb5wXnXrVvg0vtWBv9SlJ9llJYhWzqwWa/C6KCnNw+JC7UIwtWyMPniZ8zMAGx2x4mAIOIS2vtInhsfXI3Djp6x+kQaswjf44NaUu6f7ar90RFBifP76D0q4XflQO7UAof2tWT3Lp96scMftIKOjm4OdbsrmVoqz48RDdA8T5BvHR945e5r9BZwZ6jHkNaCP3KGe1eoHvQtH50Ai6H3ittEM0AV6+4TMrWpSH5mBY9XRBLLllkObdJG4j28EhDINUbh6jQy4yGR4mcgXU4330sp+w2It46hN1XWEIIEU5CHoM2kwxW81XID2aej8Z0ofbzm4nboRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knPls5lQQY/MGLG0RLUnFhW38Zwpu0owX7XGuaMBXt4=;
 b=ctUi/RkOv37DIF+NfSANyhXWqJZ845P4rHX4BPooBleHDjSOENp3zl3TvYN9odKi1lyckNn6qYqRsuPa9FBnMkoPnKTlHqn4vA7veMr137pgzmXHtk9Atw3tIOgledJIe4HL0Qaij1Sbp6fZt/HKmCoP1XkfGFKKHMNWbY4JvG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:12 +0000
Message-ID: <87tsz1xvfw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 187/292] ASoC: codecs: wm8997: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:12 +0000
X-ClientProxiedBy: TYCP286CA0232.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e83942-a89c-4337-5763-08de20b97a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SSO/XC0PGIIE65yGLTg5BaEZ+7iXjdyihJHR/vlS82Je51rNsLpTAWy2XlvV?=
 =?us-ascii?Q?46yonqbirlPjyiOb5SqGeXjlfBbGQB/edv3cP5c/X372S3hCIww5Lp7qTjZW?=
 =?us-ascii?Q?tOIUL16i3UQWh3ZkqdlfFJf8jCiP08UcP5gf1yf4+uQv175ARrWwHZlbmcXb?=
 =?us-ascii?Q?VJzsZ/CPZVkmo0vh1eIGbdXTDhIidRZnYPtl3n9K5cdhaF2+jZbyvGSCLUgB?=
 =?us-ascii?Q?m0sMi17OgLihrd01XoQbiG+DWz5TQ4zuzXaZMEXwGObD1zWX0oJMCmj7+GLD?=
 =?us-ascii?Q?7+hSwOl5eI0zZ/g+nnErLd3hYCI6DT9UNSwCiC0KG1Mb0sKN3ZlbFcI2hFgj?=
 =?us-ascii?Q?5dTQcSNxSGZOXaHwYOhUi2FQYPSqoWIr8Gthwd0AcbTfJLKvPsWfoAwUFTIJ?=
 =?us-ascii?Q?/E2nEAag8ACVTW0vNv8QK0vLdspdiYWGn8G8++LKAnuEaY/IKONM7cHvRJxz?=
 =?us-ascii?Q?mG7fRmcJ26KmZByRGydxnADtWHSOZvMjAbIVSZI3eQ/IL6QbQH0U8qxoNCmD?=
 =?us-ascii?Q?9WVHLWhbcQalnh7kz7zrlYabVw6vf7ux8SGLkRVtgqxQ/0Ei0pWGo0aNx5qw?=
 =?us-ascii?Q?8rVB5zbn1aRIy3p5qN2Imtssvpepk+DEtD/2gdhOLFGIszwgHD8jOhnJYAnG?=
 =?us-ascii?Q?IeMFqRujZ2HJSC/1N2O4XO8Hs/vky5icmuj6yzwIcth769rA4r8OkvGBmnMA?=
 =?us-ascii?Q?qab+CHJyFnHdbtxVThVbvOgQOynCEusLJQqbwig8/e8ItQP+d2ro9MlSoN/W?=
 =?us-ascii?Q?6DQ3/wnHv6AQRWXxjzF6nhjVbeouXFmyNR3yb6u0uDEHWN3yjENeRg4Y7USb?=
 =?us-ascii?Q?TgwAtvzxOFFLlF44bCCxdAq6AWFO0MLfmBhs0DIF/ojKmB/wIkUCh0r4fuEf?=
 =?us-ascii?Q?uzM2PKUqEemNNBJq0d10RU50mC8WAQaif38Vi3p0xRPRNiVKfWbn3qb64y2p?=
 =?us-ascii?Q?JDhQxdK1xqoDOoESMS7hPFw5OfOVFdaDy6QBIyJ8hk/kOkLpvxCnBfUxZlID?=
 =?us-ascii?Q?lVPeA1SVyBUlQqckz6wNuHrPf8tXh1xx9mc1cXN9oLk0EgmvUP/sx4fDOR6Q?=
 =?us-ascii?Q?n/2qJKJZRZZekwhlcuLgrAXMKnS8FdUICD6LwHcMZL6Rj9wFGTDSliJ2BlI1?=
 =?us-ascii?Q?uVtSOJaKM5TXYChVm2/eBU6d8QO2KNWMW0BHKEthNaFW45X77TSCnz6D11OD?=
 =?us-ascii?Q?z8AkqzXWjsqwd5BUAx11aB8AZf28vwm99A4/WTnkUawt0yMjZGy1cufK/3bE?=
 =?us-ascii?Q?lKDlaq0eoWgjLVkErnEmuPMQ2Vn25Ek8Z4P06WIoPQXSJgb6jrp/UcTeaEkO?=
 =?us-ascii?Q?rY+/s+FVPKbOwiZTATS7i98gddKZAM6nymzh8yNjepVL8cH532ON9KUmhBiy?=
 =?us-ascii?Q?4y//kvm4GKhTsp9tgnHin1bRCIZRTxfMyFAH4iMTIYX/+KIy8zzsgY+vOcVS?=
 =?us-ascii?Q?fckT0I9n7K3DPqfRIIBwaQazwEKSZIRIo4Q5miKgsqF71DQVXyW1MTfM6Cqd?=
 =?us-ascii?Q?/VzrTEW6osWDwoH3zXyIZgxee9COJqxn7wbE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TIl3wl2F8gPLYBblhfKmy8K3KoEoTY0lUxgdCuYLp54NwhztAyTLlBRRyn8r?=
 =?us-ascii?Q?l42GGHHcLWI6G3b52pCJ7bbNnWqohyFCNMDuv+vzXymKesqeBAKx+ExlClpm?=
 =?us-ascii?Q?C58fFfMvlirNVVGNfyEfnD2QSBUMvG0cc2GRQMoWEp/CH65ybo02YMdbRMoM?=
 =?us-ascii?Q?NrUVdLZ6SejpwHsd3opRgY9bloRdjnMfBd1z/1tNe9DzvZi1JVvU5+36Lk7R?=
 =?us-ascii?Q?pRhMga1ezemDEI3vfp+2SkKqk2skL3MTBN2jIE2SVPxYnMTBiunbfm6HYWzU?=
 =?us-ascii?Q?pQd+JmfoNFYx2Rw/dB6yzlWIldGdV0FWXklAv+8ErpA0tJs9pYxRVGWXGljm?=
 =?us-ascii?Q?PMa6QmBNbl3yDBPHHIVHsbv4e+yeU+zEW3Q08HXldU/psteuQUnIvVYZVDo6?=
 =?us-ascii?Q?r26eBkm2fjl2ainE71fZCmzdKKrVz52hhwbvg/QKiSbducmk9iDh9/7+Y5oA?=
 =?us-ascii?Q?6NLxGxJE1Nbk5ti8KBv5i4zcfWWk0EmHlK7qZ6ncbpwNQh598s+ONMDpB4NY?=
 =?us-ascii?Q?3rt242rTZaGsGn9f03zcV6X8NVglBGr7gsU6ZCsj+H1GohQWnvtjz7BhYpo2?=
 =?us-ascii?Q?P7lvC0RM2F+eMNafAFeI6O8NQobYMyfSS9gMKCgCzOQ5KM2/ROEdHyLVXjij?=
 =?us-ascii?Q?8bRZBV+mfVqDwIkFY//ZnnIMOxitjf+ZRT9G3nw49fpJ1dDV40EAwXQxPpfi?=
 =?us-ascii?Q?w8YbQD2+k+lcis7co1ZZscnYluMf77gjo7ws8GJWFfXjb7GCK+azlRiglazX?=
 =?us-ascii?Q?Fj2OsNFiMj4mCPjBcxRWeRslTr5NqhtCDyR7v9znct7Lcd2cln32pDGB8KUx?=
 =?us-ascii?Q?e00NUl8rSCn3avVONAhN3L/LeyGMftdjxuY2Y9AgGC7TI1dHIyX24u1oBQ4D?=
 =?us-ascii?Q?MRjeBfaGflLMOt9hTjhifvrG7282vumclBkkB5QHgfqAOQy8MjohkDPqCO+D?=
 =?us-ascii?Q?miL+YljBsSerMVrkmJEfMM1oO4zGIP4Sw+07R9odUweowl+TQQ3vkvID+5E3?=
 =?us-ascii?Q?r85eQnGVK/YbegzD+9x0p2gzhCHc99lPy+V9EeD+rpYxL/N2rQj4cHJgR3Il?=
 =?us-ascii?Q?WwQ5+FRvEJOH9mFUtYvaN/hq52+DUKN2FrmiS+/1539qxhyy8rzzC1g4QEdF?=
 =?us-ascii?Q?9lVUG9MSiUUSbud04B5WkQBy9wHbN9RzM2PxdtmoEIEKxx3grwFc/KDbZE4E?=
 =?us-ascii?Q?ZRmO8BQpTE5oaCdHxH8/9LHINnGAkUWJblFqcLtAYHF/BVN5zRA2RlI2oyHG?=
 =?us-ascii?Q?REY1k9Xq4rBpOUW3lAR6LOmnqc2XEugiOTmLllACF9zKu5reqVq25cUS5fYJ?=
 =?us-ascii?Q?IHYCVSoj9pE13+A9hi77O5No9rwFPIcGZFe/mqiWjYi9iWJywFFQDY7W6UHD?=
 =?us-ascii?Q?AildRuYGVK9N0FJrj7c5+i0auQ9ZITN1AeFF9iK8me7EjHBfVKyxDD/c4f9K?=
 =?us-ascii?Q?/K5MHBnBMLhVyW1tY5u1b8xluTGzI5p2Dfp8O1vv035pcNjnEpbziY/T+VOc?=
 =?us-ascii?Q?SXg3/CC6p8zJed1vh7D+l6ALlA5zggQIO329CIIfGYAd+Ht52kApwrxCAHLt?=
 =?us-ascii?Q?jC+xP4AT5ChsPUJVaf2kGC9N+mPeVKFhQnGW+OSwWxQ3mWzhdU961DuFOLy1?=
 =?us-ascii?Q?YdXSkzQZ0YpVsE0WYuwGyr8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e83942-a89c-4337-5763-08de20b97a0f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:12.3791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EMpgJ/qRYlp20bWqUMeXyPYc5BrHE07BVKPAnMQUQmmXljPJ0sfdpliFsm+aaQwbOm5RvkcvNZdpTRsZT/fRYH1YfX/R8hhLqT/dK3TefR9xYKqEX1AYWV8rWKKVw/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/wm8997.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 5389c363b14e0..83106523385a5 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1055,7 +1055,7 @@ static struct snd_soc_dai_driver wm8997_dai[] = {
 
 static int wm8997_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8997_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->core.arizona;
 	int ret;
@@ -1066,7 +1066,7 @@ static int wm8997_component_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	priv->core.arizona->dapm = dapm;
 
-- 
2.43.0

