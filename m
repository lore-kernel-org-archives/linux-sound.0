Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738A13AA2F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820441; cv=fail; b=oDjEY0jEtouBoElyHPmXmH9tfLMd9/+Cm1lECEP0hU5d2mAxBC/d2wbTBRH2OJ4yAmUi7bLpjEBxIbSwE0kqv2nEGZhqx+kSetOuhu5+ccvFv8Iw4Fg5j/ZrLOwyi0EjI1L6yuUBZZ1VvBksZaBe2obz6UbU3TJxt5QdUcbGmG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820441; c=relaxed/simple;
	bh=UBd4Yj0FN34Mb33jMhQc2jUBPfKn/cfAJIi5VmuUeSo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FKl3zHwYT00El7IXNrGn4TIt4q5fmtWtdYDFIzvj4Z7Y8YPMgC1RcwZN92rKDK+e8/zvA6pwlt1PUNIebdvMkwifCvYjrX3hLrjJfHO6V6CVz6TtpO727+dHLF/dmiA9C3OCCtecwC0S8s4cU2aUj3MzVP/RypjQqFcC3rOjCgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nk0F7EYM; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nk0F7EYM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3+3fgGNMvEhIzeE3b/3Fegl/MeKZabWIEs58//naIPAUWZGUO3zOAK8I1rZ6g8K4kp2PmYu7mHiMGqVFVhgZi6lz/3qzIMviLOF+4ocNJbTCyNmehKGNFPpsLhF4QvLF7qkZTYOL+HGyOgon4rTupUR+fGeNowvoCe0abE0NCpWSoB+O9SNWc2ezbj5sAXtrYFqIYw1cPNK7hVbXqxjQM+68Ze6vOyJAVND8iteUbxkm0eO9hqVihd9xtunJaDUU3QPEzq58wK31/TQB9SO0ZamBYT2vfJt3godXQRGw6qsmUqXJCFKkSCOFbXv1eEpttGsnzVQw6r998+Ct7meVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAhL7ABBB/mks5xF7Gef6LwEHaKWYRNJGj29go7KkHc=;
 b=UbYYPacLX7RAn4YndtRlnV2/81HkRH3TWNtkG1wu1ApARKKu4ThzenjWt0GOO5R7gcMKwp1kPKFQNzv0Pao/f0LqjYYInxkD+EP9p9B8LhWOjK5zF0pdWmaB2AyiUP3dVwv6PigO420An4ozlMmF0FuwU0XdxtfJbmbBubsFk3OBtTVL26VL1ouOmO8lp92OtKTa7GUSFs4aM6uARjRtCsuEnWlAE19VEvZvB8iev/3uliN5TY8tLlWbeBubMYqdj+uVE6tI2NHm4ThEYfxEmEhRUH+bRuECCL/TVjHVTMBOfxROqB8LLFXgbtDiTaAE3RrjQxFsTOSlvj9Y5G+DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAhL7ABBB/mks5xF7Gef6LwEHaKWYRNJGj29go7KkHc=;
 b=Nk0F7EYMnlKK8x6uB7eX3ojV0EXop4QocpzHNd/I040ivIZQgsO9ZjO8u8hv07peRJk8t2odjiSuNwhRhRUj4uBmm8oC84Q5114J3w0Gyota9uRZdb70c2zsKFa6iQ5QHxnIf7YJv3Z/3b2gtoayxpybj60eQh3eCrBzfZBOFSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:37 +0000
Message-ID: <87v7jh773f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 036/292] ASoC: codecs: cs42l43-jack: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:37 +0000
X-ClientProxiedBy: TYCP301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad9e667-3f96-45ef-ba3f-08de20b82346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zUCfu7g3eoXJTVk2ydK8ectMjpbnQVKStShcUaiS5VFy8N9Fxpo+U2wpTO24?=
 =?us-ascii?Q?z730/D7zjuuaW0/Bw8paPv2MJ/IX5EDmmkNVA6aihpZY6x4zhLlSpMNX5Q9f?=
 =?us-ascii?Q?OvoicsA84gmsjT/xVFUJr4JeNqTAA0pRoKLBZ9dA+TOeqWwPNMmsICqBb1ud?=
 =?us-ascii?Q?vGkuzDWz27jTXX1EMmwOM5xd53VcPJbXFiJ5FWwQeBn62+kQBXUK5KCgCDci?=
 =?us-ascii?Q?fD1DanOK0ezd98EZfwDVq8VX/J4xECoIfRaT5w3VjfLbGS0hVKJTJWMmf+2U?=
 =?us-ascii?Q?7xCTOYstoRnmzyrVmbyamJIJ9MT7h4ZMtiHhPJwZRrUs8ge15AduSH/YLXoV?=
 =?us-ascii?Q?BRzhg3dkuchdswr03qK+OnIXSGCE2rHVk2EVRGlKc0qnWFd9frmPqdGjq3B3?=
 =?us-ascii?Q?vL99bHdTj7Glvs3MzO62Bemz0LVnHWRPxoFWBVSMU4H1wCuYvWNPxJuw18rj?=
 =?us-ascii?Q?uvxae5dBdY2d2m48WPPvn9Ayelte7tNsRf4r+Qy7pCVPY5AIZhXuWltjC6OT?=
 =?us-ascii?Q?dZ43O9twgPI4mwkyBCCxrTCu9n/pbUaZWguaVxWgfvR5x87lAjAoJKOn+1Oe?=
 =?us-ascii?Q?yLCwWJv9C2UEc5rx6MCPorODFRw8/4zt3Q5+N2bSL2vWggK9jhuWyX2+Yg0Y?=
 =?us-ascii?Q?0axuZSopg74xEpWs68eQ7/0hC4P5OVfX0FpTh+zvhl/aitqrdUL7I8FF+gJX?=
 =?us-ascii?Q?g0AXuV4qnnMcKZoYnMbmESxB5OMfng3GEL+kKcZW9wKsTQXGU0UD2KKA6u99?=
 =?us-ascii?Q?/62zdUjyaNu+Vry6Tl/H9cTagFpCxyUqMWB541vGoIstMONtwy12PVeOq/O6?=
 =?us-ascii?Q?s9zFP6XiuLh8z+Z+MZIrW+TplTev56nk4vQSzZBCucOVexAj9FFQxi7LXQOl?=
 =?us-ascii?Q?3syRXYQ/UeKnyELuj5kYZdyCfihjLOmjohjRL8a0DWsZKsNA23/UVNxtfC0m?=
 =?us-ascii?Q?TQkbnx5Bhuh0XrdxNGx15Ha4hDxpZUMbBmEwGixP9oBVgjSmNDOwNKAwO1Oq?=
 =?us-ascii?Q?pyQU7CHKGDBGtabBhNYbLP1+xv+YVtoD232yq6sRPQTAolp5hi36JPqbpz/P?=
 =?us-ascii?Q?JgMAbiWbT4IBTRlZ8jWmF4aOdwzHhRMoYRVgWyFIStIPBQK+KmlMSXspJ6ou?=
 =?us-ascii?Q?Xxht51WhhmM4uFSPwo8eBj4gyD2iHcUtQUQhp2cKb6LJs0KRdWkPG1PbTjLK?=
 =?us-ascii?Q?96JzI5CbtQvfP02jmkp+fvOBzswqEZKr2jUZSocfoFE1jtFlLERNtxLudRwp?=
 =?us-ascii?Q?G4/gGBqq4l7xiNmxLlV2peIiaSfhLLB7+7izbXEmO7GRr/aLaWkSr4yePNV4?=
 =?us-ascii?Q?pQz7zFhqJtKrgLyjIqGchr5OWRTrhgCezSiPhVabz7eXPcL1sgvUNyddrAy/?=
 =?us-ascii?Q?xjK8u8vfkGiWjzYacDiRgTTYbVdDwlQ80OgbIKfZQb1d1vtby9yId/QswmUK?=
 =?us-ascii?Q?92hZsh7o6sNJPTnlPaCeUg5+bAdyjbEiIVI7JVpGvmkjG80P/v9RlT5FyCa4?=
 =?us-ascii?Q?O8nirsSXR6BGtjU5zSo8Lm5AmloTTKGVvdY0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iO6YX+fqGSla09moBWCjKnPQEEvtvVSBOxFcbY++VKZO/Up85F8tZ8ItKUit?=
 =?us-ascii?Q?GZX8EOPxGComKp33JurGOMHEp1XSJvzu+oabf3GWhd34Nx8nQW9KNStDCB7e?=
 =?us-ascii?Q?t8hieHRWLbkrqxQq1z+oNKn71L6auE2dcyc77n3rKnLDvii2pQoW6bskffQ7?=
 =?us-ascii?Q?xjrskFj4/+9XWL013bwH4ETVPpBQRrF18LT92IkDfEFkLEzrvfSoEbNs5N7B?=
 =?us-ascii?Q?WDQoP3Ai7Sd15Jp+U8ks0fPyrfnxQ3cdYp9cUt80lV2xkyRB3o7HsgBFa4Dh?=
 =?us-ascii?Q?7hbT2iDYsqQqnthJt2LxmCMW7VZ3ONPyZXtIPcupjWMeoW/PbYzWNzJvwWYt?=
 =?us-ascii?Q?A7FE2Mjho/PWFRn/mXj9SI07EOzKp3ZqxNzEDHBgItPaU5qRBFvQvrQseUQW?=
 =?us-ascii?Q?0Pu4M9Tpf95jatwjaHg9WPhG5QVyD1btdhJQuIxb8Q3OQaXvKfufbpkzLGxa?=
 =?us-ascii?Q?aRheBUWniPZu5G7yxYzRZocEMRjKIqWwH90qm1e/uNj+m4ZXnBseFR7o5VbU?=
 =?us-ascii?Q?ur8CSMbfjAGroi6Es1jNThNzVoc9AVqGTBZE/ZPAT83KoEFCd8ah6uisXoew?=
 =?us-ascii?Q?qBdlYOW7jkFHXHkWVvXpKPKYhykDn28vvqW9diLkbrYvZyNHATE0XduOVnaG?=
 =?us-ascii?Q?3aSR1KK4fB0gG8gW5NiiPAoYklXedODcrI3QfcW9c93FEBTntgZ1g/h06cqE?=
 =?us-ascii?Q?4U6WVIwgUNx9DPuNXNi7X2mgkj1ndFRfG7b5k1Ix95ONrbPV6mu+4CKxAj9J?=
 =?us-ascii?Q?t1ZRWmw86MjvijDN3KO69+Hn1kVzw5yxBc6r//QDcDaGbcOn0pXKyqgo59DX?=
 =?us-ascii?Q?M4lywhSDmjcYKEqc3HI7jZohjvcBoMNn8APcv22cq6HxfRIuciWt8shh9CcX?=
 =?us-ascii?Q?kfH240ACI2e4XYdM+6NfYxt5LLYV3+P2pSrDPgKrZAfmf3TROVLsCsOerAFC?=
 =?us-ascii?Q?cjhSWgjyWdGflUn+Gq04zWwFiffLh5MzfRycJwCZMHj9hxQ2fzJSEKYFw0WZ?=
 =?us-ascii?Q?w84Lg7J+nSvwEZYRmUPrXi4CaiAilV75OxG2u3u2eSseRmcVnyCT5ow4FGli?=
 =?us-ascii?Q?YZ2sHsPO6u+wLAi3sCfW2qZJrhHKn2HEEing6LDsEmYZUZ6nKnv3ldiaewH7?=
 =?us-ascii?Q?fsuW8KFLz1c8r8IKjeC8LcEhS/cFpqVtAJpyIaS85wwn2oErERECtawRDHXN?=
 =?us-ascii?Q?p7Q+GPbVHBYYz1uz2yC5JfX17vZiXQ1rAk09hJIM6ugjYf4pQkusQZLdfzwi?=
 =?us-ascii?Q?U03hs5K2dVtp/BfCTFH0a79g+WMRaA3kqGCJhkbM8wVIqj3KMZUOiAPqqeKz?=
 =?us-ascii?Q?/S67kKrGXe8+HtbJ4uQ8FZvas+fK3Is9gYulIGsGq4EB7Cwg5kQs+Hri2Cs/?=
 =?us-ascii?Q?H/HWDZ1Y5afvI9xWhAWtPDRHMmawY/upUu5bv+pZ9e37GSLH7SecamIsKkUa?=
 =?us-ascii?Q?p2Rg50upLjqzIgN4i7R09AsXrIdVLP6gCLLljRd8tlgIJksW+ufjUkHm84Cx?=
 =?us-ascii?Q?VFk/Hhq9an8Hm6i7b87nqfEYSoXGOU32L7zS2ehsGjddYFWsOCxN2Qe+2gVf?=
 =?us-ascii?Q?6WtsGd11vcpZdJ2h+BbK6pRtJ2GQbXNawZEvWsrG4fslLnShUYAV/WF/g1md?=
 =?us-ascii?Q?BSAH+y2l1RhHufBb9SbYtEU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad9e667-3f96-45ef-ba3f-08de20b82346
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:37.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elPBkSmht6kmOSAtG6L5cJ5ZMAExgR+EPnSxivNy8JFYdBZdepTootjFkymWsMmmt+XaTmPT0ThK/E5jnVPZRs9X3mwdZW1ZS0MWSD1e+6A9ID3TETk1hgBYr+vYwHkL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs42l43-jack.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index ab6851d9afc77..b719d62635a0e 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -502,7 +502,7 @@ static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
 
 	dev_dbg(priv->dev, "Start load detect\n");
 
-	snd_soc_dapm_mutex_lock(snd_soc_component_get_dapm(priv->component));
+	snd_soc_dapm_mutex_lock(snd_soc_component_to_dapm(priv->component));
 
 	priv->load_detect_running = true;
 
@@ -539,7 +539,7 @@ static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
 			   CS42L43_HPLOAD_DET_EN_MASK,
 			   CS42L43_HPLOAD_DET_EN_MASK);
 
-	snd_soc_dapm_mutex_unlock(snd_soc_component_get_dapm(priv->component));
+	snd_soc_dapm_mutex_unlock(snd_soc_component_to_dapm(priv->component));
 }
 
 static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
@@ -548,7 +548,7 @@ static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
 
 	dev_dbg(priv->dev, "Stop load detect\n");
 
-	snd_soc_dapm_mutex_lock(snd_soc_component_get_dapm(priv->component));
+	snd_soc_dapm_mutex_lock(snd_soc_component_to_dapm(priv->component));
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_LOADDETENA,
 			   CS42L43_HPLOAD_DET_EN_MASK, 0);
@@ -587,7 +587,7 @@ static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
 
 	priv->load_detect_running = false;
 
-	snd_soc_dapm_mutex_unlock(snd_soc_component_get_dapm(priv->component));
+	snd_soc_dapm_mutex_unlock(snd_soc_component_to_dapm(priv->component));
 }
 
 static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
-- 
2.43.0

