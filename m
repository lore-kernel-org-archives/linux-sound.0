Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216A30ACED
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415955; cv=fail; b=iIh6m84oWRyhbY5yhPs9doAmfAawaw/TxH0zcAcQ8orTfnAWaW53pfjODX+yQfVjKVJ2UM6Hxo5asrLIH89reJqne/j2ptrVGfIw6+QKEnC/Or2d8IJJSx+GkWWN9JtnItuL7Vy8HwGqXMs/nIaWu/8F3p4TKMueEge/HsniCVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415955; c=relaxed/simple;
	bh=feoHU3O+J42IKZ+YgPp/Rwx1IAaNi6r9vAVf6WKWy7w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z7tSTs5pa/t7YMsrb5xpo+H2g3mExQPTytXtBPl1+hwQHYkn5z00bJbz7m+dDHYcAL2/PIEMKiAmmeMBH5m5SubmiHUeEUtbEyZTxAD3TOyW3LcgC5JVHbbDz8KIBhqYeA9duOfysO9OplaEmQM/XPPFZrcsq95j5yczAa5jrGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QmcDEOZ8; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QmcDEOZ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoHAdaasV67TDLEUVlcbP1A9rNakYpbOET7Cn6/JMe5IqwOEs6tAyd67q8euHD1q17KEmFGFLhdxueG8DI5L1AoXYMr35R5mwMBMM3rekFvs3ZA7Dyqj9/kz2IEc+PQMvPV3XAI9kz2urnWA2GH2JU4yUuPmVrsd80p2Im9Xo+/7zEcOB2o9OsfQmS25IaH1LiTe/9KoDC3QeFg3mXrrt/Bdr7a5sDOTmX0ZloDxJ4q3yS9aG74KkyjLEwMSLY8kE0hqY4LtLCg2uf/81GWM780rujgHQNDOxH85go9C3guOxIj3jOXCq7gbvbbOfhfN0B//Uqti9sy+Lgjl670Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRe8hLJ9cCoquu9OvefNUJBg5N4oDKYOKjJTe/Bpk3o=;
 b=azGuu47fvtwFDuZVASoaUpb3zt+cyFSby1C8GWRXXSU0G9hwzPQ7uToDqC+Ihlf4R+H9fpmW/RpXbcn5kPv9B5rlwF7FUt5l+vbz6nxe2VvqCI3D8KdfL8XyY5dQx9C2i9KC6UGrXqH/pgX4mbsxzPwhb6QZYpKcU2GCZTGGNNS8rzNeSbl2DoKFLiE97T3LnETtKZC/JcoZ1Uhe7k9f0y+bqdijjLDpCfSCSwSrerjKBU2anzEVS0K0fWKEa+9zb5IFb0pWoiV2MjX628KBC/oXRDyM9sW1K4w0+5XHf7T4hgGZJIna4gG6tvWzwkBrwM+/gnOK4exfyjXWUSulHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRe8hLJ9cCoquu9OvefNUJBg5N4oDKYOKjJTe/Bpk3o=;
 b=QmcDEOZ8S0Jo6wd5envSQMrnThoSPemRTVndQ4mLqiz24KjABAmbmKbMgs3RlRC3dnoY8gb7BXyqdChHybnOVSjU5BoPuhfNHn2s1i5BXDfP0DpnkwWm6CQl7DmRvLa5ZimuX05/hLU01S6jFpAV2z32aIFMcUzZEkGdugqOfCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:52 +0000
Message-ID: <87sefmnm7k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 102/139] ASoC: codecs: wm5110: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:52 +0000
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fc036b-884a-444c-200e-08de0ad9c2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oEolYitrtaLm0eyRiFTJsYt1Hw3pHau8Q8ETsFczPt16N+YrKwKad2+GL2C9?=
 =?us-ascii?Q?VC64M1a8f+zMO6Aj06CTvE/tB0B73MbG98vhayYGEV+4piJMWM79cEwwzojm?=
 =?us-ascii?Q?6WK1L84E7GvUkeBoEeyJYYMPx7UnJKo8sPRo00YTaL3J3laZzujbeRKeyYjT?=
 =?us-ascii?Q?JETXVWBzWez/2yme2L4GkRe0FBGZNK1wuTdbkAOhT0G2iPHu97YvL0RSmUh6?=
 =?us-ascii?Q?sj+0W/vzvF0p9SIu7vMufZa97zvJhdiBYhPkcqJ+OQ/36frzY8Ei3Ug82Cn4?=
 =?us-ascii?Q?6Z64evhhNiejWkWFDbg5pRIn5vOvMLObBJcmxX2AQBifLV+O3LV7L8rhDTw3?=
 =?us-ascii?Q?2bfUYa3mBmfdv9YW5UqYXlyXFD+UZJBR+eLIzkMy20JJN71l/Jnb3XtNzDU3?=
 =?us-ascii?Q?/sW3b3HK/9a6MNq88rxyT4Wa0DKWIUSBY0laYbrz5IQqBDGobUMb7bURKzh1?=
 =?us-ascii?Q?HHjjzisDW/jt2PEW9LRxtkJHQhS1D0EiXwxXeQFaAmRGMuaEbyFGOejuFhyu?=
 =?us-ascii?Q?N2GJ5Kf1KZwrQsjH+ixfOvG/MjvP/OSR0Of+ZJNJOOzyhxVsiBbKb3VlcQOZ?=
 =?us-ascii?Q?Ci1mEmrV4vJXQOgqupBNXU7tEL+LDZm/ww6dXIDWFvxm5SiN7NCKj9CNRqEx?=
 =?us-ascii?Q?vFvDVsufyeFyt7tX3zMmDHTKzHYOvfTiexbqpoxMGHqFYfpXJ77VuAZ5xmHv?=
 =?us-ascii?Q?81+95SWE3qucoCfLtkPxi7tvlMSNGPCYH71QpCtNWKkNPo2TZgdH47L77g9l?=
 =?us-ascii?Q?tKygIJ+vAD6JdXEpQyd3kKvdeqvWSKE8NwnuDWD3WxuvrDtoTDSEeuyZLS67?=
 =?us-ascii?Q?uHqEJLEs75Zilxo4V/OGP3Rc13Hzte2GaCJNUG+kw3vgaRkPkhGgYRIxVx/r?=
 =?us-ascii?Q?iuTVXpFiZGOEXpa/VCn7AoF+zevYilB7pHE+vubbPZMn81EBatAXZzLG0bDm?=
 =?us-ascii?Q?2BYZWtfPU1b9IkH73Qn9FI3Zj+O6ms6Imwopi48KRZM4tlfMfQ9YgbrEXBnw?=
 =?us-ascii?Q?kDC4TNRsVrii39JKr2QAKuTDUiL2QOqk0YiAG+gj876v1ywqX2oXRo5FDuPT?=
 =?us-ascii?Q?Y9hWOZz5/aYOYqYag4Fp5NvB5OTL9jVFOsk8oYY/6T3h/sizsJaLMBnMJDvq?=
 =?us-ascii?Q?CBQthwpd9d1NIn41c9X71yCXSIfADDq8LEo4PXGU/5x8IPGBIz/603xtw8Kh?=
 =?us-ascii?Q?E4Pjrc4dHHcgEcxSqyxKqMYBlRcY05XGVmdGrtetAXBsO81O5zcdgxkcDKtX?=
 =?us-ascii?Q?QPn2P16ehp4FAhmRPu8Mrt5aMdggpNqOh3MiVgCnS7jUvFKgFflh8B5dxsFJ?=
 =?us-ascii?Q?k5+3B0ApPu8pP/ZmdVVmu6jpvek/pJD/RWL56s9qW7+hnizjO5o5pFnjEnaw?=
 =?us-ascii?Q?ghMyRdaXY09maqAd/D5Zs3fF6G3ppL5U3Nnwu5pIzGgocTNM3GS9A9FO6rF/?=
 =?us-ascii?Q?UZqd7rgpCALzk3D7HBiOhpk1wFbPUfBTbIUwm87S5K/pyCmc09YRW1ucM8ls?=
 =?us-ascii?Q?GnffM7vSCZoiTYSkj9TPwmGP4DX2K8OM8N0e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aIvLtJruZe0I/qc5Qo9BTD58pyUZnk31oTdVwepc73X7X2Wne593WMxDefqX?=
 =?us-ascii?Q?8drgbNfQnzjq02gmZqJEsYfFiwAH1GlvbsWOS/kmizBwKBfqPsDzl4JAkgDI?=
 =?us-ascii?Q?v6nM0yCN4HvRTsS8rpTq+x5zA2GGI127WGVI7xlbBh0bOUzpzTnHWDh7kveU?=
 =?us-ascii?Q?fzXSISHEdvusw5Z5XQLKvbJlNde2mie35Ac3ePUheo8a7PFI5h57r2TFEPE2?=
 =?us-ascii?Q?co4BdhV+N1ED6CuC1b48/3/6/x/2QXHIf5jKe44fWXk7AN5WQThMc+RnZxU4?=
 =?us-ascii?Q?lyLkfNeVxmk1svpgsVMjImC57qooZMcyXFAWPjlmGnzaMiMa3tUw7ETVLhPM?=
 =?us-ascii?Q?WnIO7DfYELWzkzWp1U3NdbqhYG9kd4ljQkm/73L0R9W9ZS43W1Xb0eHmLrby?=
 =?us-ascii?Q?nrfTiV9JGDGUrgNC3f2CKY3Vds8PzsOTzxW84MRgtnA8IKdZpuWqQO3knbjU?=
 =?us-ascii?Q?fbDvQpb5pXyT9Piay83WkpRQgocJR3iz1LPzdcsYqaqG6VGyWCHuEs6Zcqfm?=
 =?us-ascii?Q?+rlk606Eu+za6ggWupASsId0RaLOjGsIiOotmZ62vYAyfTSkGaJ+ztCeJqBZ?=
 =?us-ascii?Q?hoKtMKKvkRIhthP6WKHjF1hPqaRzCVK9IdxUaqPhuYkh8hdj/nYw4G2AKsBB?=
 =?us-ascii?Q?WvYAkaYtjSS88UgCWDhn+piIHqovgMB1+HipiAeiSQbSsx3RH4GJAihnrMgV?=
 =?us-ascii?Q?UlC2FXyCXSu6g52u9TkSLopXrUrvx33vd/v70HAk7T0oX3D0PRNlo5KVjEmV?=
 =?us-ascii?Q?WnIdrg3TsjvAzeG2AHuk2ZU2Gs4NvcFiy2uMKzniTrFDuP904R1u50zdYIxu?=
 =?us-ascii?Q?ACuHUFNdapMfmUSU/WM3I1BD2lPjiUCG4GE6PnvtPXMN7VreqaeVCyTiRmlz?=
 =?us-ascii?Q?ka631bWgqVfjqvcHJhwiy+iPh84Veau1kooZpKmobgvyB8pUfnYwV2Y0sowj?=
 =?us-ascii?Q?3VR4olHPJMmk6tAfTZvq3M8UxCTrKZgNaCZqkh9q988RLhPODMQv5PSweVES?=
 =?us-ascii?Q?3Lbw9fahBfOMZBNA76gzdQwkA96aPBsmno1XJtMtgUf1qH2NQizvK0EZaLe5?=
 =?us-ascii?Q?dQaYkg25ZfDxf5gJJlrdbaT3Suvep7ibOEu0/hlSf3+MdxXk3zeuVNe7YF/u?=
 =?us-ascii?Q?OalSyE2+j3OYf481WkFwPdOtAS11bm9JTZWzqtMUIdxZVl6df/gT6+4JCsda?=
 =?us-ascii?Q?lElr+12/afT8cm2UYOIcUK7DrF1X/dF82AvmghBRMrpPbOxT/Yfu1cKGKMTN?=
 =?us-ascii?Q?J93WHgkNcYNCUajh6bPLITnIZh2topxBnmCa8NqtFt3KsZ5BZSE55zgZ6LNO?=
 =?us-ascii?Q?oayQCgVVNy7OgS9Q1/DMMKEKgqMidCQUMiJwZKlFPFcNJJSxIXmy0FK6qb+y?=
 =?us-ascii?Q?Rjf/vKz0aD9eBDcfYq4b9dy++dY4IG9LTaKZwAZMFwPrV8ZmiN3SPVdHd80E?=
 =?us-ascii?Q?o3LwjNj6+j87DlQnD+mwOgeS6OkQLfl+D6fF6uTNLv2kdhJw70KEDZPH0Xpt?=
 =?us-ascii?Q?dH+46i4k+eZyHK8sqxSg8Ob5PyyQhE7CQqTwZgzeYLj6AFs2smBQALPvhmnY?=
 =?us-ascii?Q?eS9/C7g65nW0Uh4kWlniiI/tm6Ww1qmSzZA9lLpPLdXn/s1DG6/rGEQiYUzE?=
 =?us-ascii?Q?AKG5ive9rbAAE8183p0Vcc0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fc036b-884a-444c-200e-08de0ad9c2a1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:52.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ+TTF1i8MCWY/aCIVuFd+VU44AlCMP5Fu/lrjHoeA1TxzdrPj23JHGG+YWt6WMkpFhiI1bNsjRZ59cAVU8WbRhYc1VAdteOVyZbNxljSvL+AXRe3InTvVAFMJlHBDLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm5110.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 212eca675f27e..29b805128ae55 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -402,7 +402,7 @@ static int wm5110_clear_pga_volume(struct arizona *arizona, int output)
 static int wm5110_put_dre(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_mixer_control *mc =
@@ -467,7 +467,7 @@ static int wm5110_put_dre(struct snd_kcontrol *kcontrol,
 static int wm5110_in_pga_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
@@ -487,7 +487,7 @@ static int wm5110_in_pga_get(struct snd_kcontrol *kcontrol,
 static int wm5110_in_pga_put(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
-- 
2.43.0

