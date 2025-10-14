Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F295309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415757; cv=fail; b=h9XU1W8qi+NUf+ckN+j5XABy8awf8x/dTaG8Xm/yrzaZdCQut2ejff05H2/l4N3hwFoV4N+LnHBSMr6hqxQbLlhTdxD52SnvgaiHfO4qMAwnkhrMnflC8arl/rwcXwZ5zE4sOIGNskx89aHYChXtR7muWtnY2QexUroHwpp/S0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415757; c=relaxed/simple;
	bh=TnVsB9Za2uAtA9Ny0B1S6LrX6NqN4/3zWVVDO5fCh84=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jfk1wEBTAf+m3mu4I4CgEKU5csKU/MV04UDXQhUmuv50QKReugX3TEvopL3avaQm04wtkv/SxuBS7p5oLUPCgVmGZH5rbbYj4RzsaDSKls02ICTB0+6946GDWf6xbKgbXnzj8Ve8G4mxPusees3rGNOZuffDL7epLOraXPvZb7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IX6G4Tj8; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IX6G4Tj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEir08B2SsbAE0Cp4tMufMpAlq2kMIz67jluvpxPS9J2HHbifujwGNKyHT3ZGETtbCxOVAaziaeEI7JbOWQytSOcAco49pkOiAxY2aqdnCjtcOtQbeGP1PrbEootGWyXhoZzaRxPduNixqbiTYO3et0o8ggk2U1c/E/83JuhcFSIULRG5BWiyT5uhDFoNcD+4My7wqcK7OyGWmG6rEcq7rAcFTWBVc9qG4uykOyIvIkFKL7IRYDIHJ2yIyUxDUtKjBQpSPBkbnQOepxBb4iwPDBmElZtEaiA70gYkc0IvYO0J5ff0806zzy1E02t8hJlZhi98ry6I+egjMt3xB4Drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsn9vudy5GcPu0Nr1L5HbHzV+lTZTiM3QUBrUQ716dQ=;
 b=la9kxiNsK4DQe2WAAykD4gn60VkepGtKgaX1sRLNANpVaHLGmBhnWcdTcxx2RwdsK9atuGi/xPfXXnOJCzmna+UVAI1WECOCAfYxictLco9DmzE+fe05Iy2jB1uJAZ3x75VpT+AG8kONZ3Pf0Le/vUyHRj5wTSWbbCCUttaTW1QdODS8AU/AeZO0YrRdv5pSm2RLBeuJwuHSqY+PNqpnKsHQqIZ3znqjyEsdyGalB3t55SY/DaTtsOMmEcsB1nOa3FeJDVu40iva0oh9Py+v7R4Fc2WW08DQlxVyGRWthrfy/5KgzDrE+758MVuDpGg/78BdpHaIzXpLmKi4eNvYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsn9vudy5GcPu0Nr1L5HbHzV+lTZTiM3QUBrUQ716dQ=;
 b=IX6G4Tj84mu4CwFa9ybx/rFbteulfle0Vx8ZP74BdmVtHwJRtCKANzefpNj4z06ZeUcYoN81YwsZP6xYOCWLBlVVX6+zQkF2TYxtKXOrG8zLISIo38nX5e1wd0OIucFwvk9WhJJcckFuPAAv9n0EY/NmQeVI+9Ian5T2Z1HI6Io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:32 +0000
Message-ID: <87wm4yqfhz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 049/139] ASoC: codecs: max98095: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:32 +0000
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f2beba-9f94-4826-9485-08de0ad94bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sI9wrL/h37Pt+/m5xD3TirYJ1DsRgTv/u6YZLE0RarenDGtzuxhDeU20z5Ku?=
 =?us-ascii?Q?gFd/+b4tIPZjKIj5N+UuHeUZHRUBWjz4ns8PSL/LTQF62AdcxP/lew6aAIm0?=
 =?us-ascii?Q?YF9CWHJN7CV0P0GG7ZGLQFUTaSA734B6vZHtmK+gCsrZm4ZAjOwOvZK8uNuv?=
 =?us-ascii?Q?HolYdPfW77iOG3nwoHks2nc4mxwihbwXCho7XH1yXfCDxjB5RRRKz83gp8Dz?=
 =?us-ascii?Q?ST9xrDugQpRHgEm04vuxxmpI2If4101GqgdyRvTrXByjPWR3sv5j/cGVW4AO?=
 =?us-ascii?Q?FiHptmsdZzpYa9rvMahM/gGfoCL8KmXmwcHHXlTRN32DDQTkjILCVvJL0GF2?=
 =?us-ascii?Q?a9W7gQe8HavC2u2OR+OpH84hCICNuOwINEX+Dm0Rf1MUe64RIGSOpmUG400H?=
 =?us-ascii?Q?b5TLQrQ5VfC347wLXF08zC76q2Eq5mNoEL5gcQbnMrxS4arP7K0I9/SVZOR3?=
 =?us-ascii?Q?cqClcnFAIbb3TGIfNZN0Mo5/VXDgj9Fu/MAAhejHh0erkxogpwAJk/SoOrmF?=
 =?us-ascii?Q?a8YQ5tmpnlGr0gcXvz/kzHMusrSQ0VoOzHcJ/Jc7Ne/34flqBwMVK47ZhE9/?=
 =?us-ascii?Q?OvoHAu80fUR85EGDtHqP46CpwYrmJ+71pDN/5OAYvswzFAhIMv6p0wX/pzFR?=
 =?us-ascii?Q?Xn6migEI7mvvDKO2BoLfNxJ9KNmIiKf3wB/oeTk2d4gi31rniSFPQiRjuuds?=
 =?us-ascii?Q?pzE2Z8DqgHF+U/botdS4HS3a0IQbREDJDrQIe4M1HuMoDprUjTF1gz9lxCql?=
 =?us-ascii?Q?/4MdFdnTuB/dweWGLhVnXc98/XzWhgm03jzPIir8633Q6p7aYLrgeVX608w1?=
 =?us-ascii?Q?u+E/OSDiPM6AhZNxtCOF9P7cBiNVd7o21PfVyry8bC4wyp64rDiIbU2E/9Dp?=
 =?us-ascii?Q?CY0WmHwwPaq+JRtycVi/q0UGV9iMBYIGGEOLvr7epG0lm1Em4tvM43tW80Od?=
 =?us-ascii?Q?7068ScBJYbFWgSIDhDGpLy2KYNeMr5XbvYgJwDyqTwW+UoWx6WFSq2dQgu8B?=
 =?us-ascii?Q?R9gutS7LWHBDx8Jtu5qcq7kqQ3uyN8PjzkCegULt8/Ia5yLGu+FePXhb2f0N?=
 =?us-ascii?Q?xT6PsGXHOo5ujZIjWbX+3khfAYnM1KvpeXcc4083jw4jZErODfroLTg3dYi9?=
 =?us-ascii?Q?gyRphr49KAoewOonPktZHzEZDota5vMN36X4DZHOyfuGkXk9+0p2gIi0vfwN?=
 =?us-ascii?Q?Ra5CqAfkSPnIA6CR90Z4Qu58QEQqEkKcQvZRKMipJlNGSF2q7xaaLXE21d2v?=
 =?us-ascii?Q?ZxczFohb8lIeg8JMSkL1bg1fzr0lHodO9PBGclyOF8nLiW9T0j4QvHlEdG73?=
 =?us-ascii?Q?YyHt1uV2YFRhgGJUlxfGIMpRNoWY7/3msz3wYHX06FJvNHmo7Os2e+h9DzE0?=
 =?us-ascii?Q?7+yOz7mGLMuxTBjw71UBG1ZUPWdDEERDTLt47uTH4BCqoCVAEEg4zEtlh0jU?=
 =?us-ascii?Q?eVmIY4ovs8bCpD4T38RCrpY7mMMJedenCL9copPSfgAXaMJl8yLGdCoqvXiE?=
 =?us-ascii?Q?y1Hjrhw9WPr1QXl1bjHbcl0j6lho9Zns7UdU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eY6gkpOVlpqGNvXGATALBZXQUeGVKugytQ9GWohT7auOPNCUYarwBs33Y99A?=
 =?us-ascii?Q?OyxQ0p0vTcEa2QRdVjzO6UoMUE3BukZwX0Z8ZE2ohqWT/2NCB2XPVqBb5z9C?=
 =?us-ascii?Q?uJFOyaz+IDtKVQkXejlA58f2605Ij/opejWhVw6by8K8R3yJUM33yoCB520R?=
 =?us-ascii?Q?YDh0jh77cHVN/AC8P46fd2ajBct/CSCvtZOV0lQlZHbi4iNQHWzcYrn0nUsj?=
 =?us-ascii?Q?X4C93Wn55IeLZKOkDrcmoHmzEqV9HDp61n+PcFGTtkBa30pNETdur8oTXQeX?=
 =?us-ascii?Q?Xr/q7P35tWDMoa6X551jZU0NlylM3ZyomyUmXT37PAv8cMu5o0SlRzjvl5WW?=
 =?us-ascii?Q?+bbXysBoSoOAabEbLtFp1+ftX7mQrcoLNFLYZL1dtufEy4fK84A/JQLfyePk?=
 =?us-ascii?Q?AdUxAXQvyBCNSN2nzKy4VpSp6wLlqBYKyOh7SRJ9jo6EnCxExe3/EHVG1nhW?=
 =?us-ascii?Q?vEv19MKdWjhEuIg4IRBuGt94S8cQ9a2j4oSqM35jUYN5lyWzKTD+Cdg+JIHx?=
 =?us-ascii?Q?3aRKmZnUKzKuNvRAaHfq1KiPwZ42XNW+FWO7cGPjM+HGMxJqhTNdeJYU4AVR?=
 =?us-ascii?Q?J7Ii60IIcLBdtHTF4ZAYGrJZE9uZeenNTCc8oev4S54NTv+hmD1OcxtUXzzB?=
 =?us-ascii?Q?8M9lxSyg/UYfZFpJ0Cc8Ny9j//oK01HgbfXcz3Ypo0+fkzulcfTGY8Z6FX5D?=
 =?us-ascii?Q?yW11Ffdk4wyy7iz27Cse9FcRtgupNHNLda7GFOczJkZFfmckXmeflEBqrkcD?=
 =?us-ascii?Q?HI8ORW6J67HcwK1GG7D48uwIba4Gl8+RQl9tKb8jDAymyUkzmllY14HZC+Vy?=
 =?us-ascii?Q?uAnPGokd3kxixFfHYxaH1/SdtaalWQqMcqyG3/BwDwB4EhV69OlkSazf9iPB?=
 =?us-ascii?Q?/fJG9kmBwrRSHK7opfAk5iDl02HlBBD5y2W7O354jJINzZlA/NuiWI7A7WwW?=
 =?us-ascii?Q?g9S38YWG9gWQMLsZEFyR5DhTWjyK8qIVfX/IKpf86KNXkCrtts4m+rfR4JHt?=
 =?us-ascii?Q?v8XrLH/gb3R84jdHqDU2EBd9rmNSBz4duaKId9wKiJVdeOCdzBEfFPtP5mgx?=
 =?us-ascii?Q?B6cZkBwDp7i7mRe1WJ3dNZ5xpFjVVSXpdOJD0wbZ7Cxi5D3Z5MWZ7MK6qDgT?=
 =?us-ascii?Q?b2mk7uwFq8Y6ci1KZ2e/V1cxVojXj5YWoD6S5OqX3QHIllYG62dXszF/yx90?=
 =?us-ascii?Q?cwzEts3LIvlvx5sB9nojVNp+VyTQHIeXpPROUNHrf7xEFuuJotNmh89P7i3G?=
 =?us-ascii?Q?onxb4dH9K/7yB+9XoDTnEL1JwpDzgyPYdjDLM++lMC6/mk0tt3TSqM1sRzBR?=
 =?us-ascii?Q?m2jmr3Tf4Gqce99zN+g6z2AKp2gA6HNf21A/DnmQYxFaLPZgx8ACS4TqJMUC?=
 =?us-ascii?Q?LH5tznxl40Xme0RfCgWnt6NQN0DqvRDKWodXTBR8Pu0yKYqAkzj4cHQNF5i4?=
 =?us-ascii?Q?pZ8IVEjt7/9Sm/Rs5aicQbaRQ3rqXivjGg4yuc8/EI+ggiM2dsCU149yGsJg?=
 =?us-ascii?Q?8LNFk7Td6XVEjTpG3W1xe58X7QlLNmSgaMZnOrqgzSKkVnSw6BYHgi/zYDp8?=
 =?us-ascii?Q?oiRBS5n7RSsbfI5ycBfgceH7rYwm0LEoB21YW3oSsQmsxOiKb8BURJ+iOPSV?=
 =?us-ascii?Q?Q5NN/UnwMStDQGLYT0uhwrI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f2beba-9f94-4826-9485-08de0ad94bb5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:32.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jfk/sH4FAbwyFUhhLQyVk9fEiJHYhS+ev/8rKbF0ZRuR1j0hnybyGYSY1LjN8ko4KIidyWuazTzX6yELwYJNplGjbVK7+AGV98Bgk4EOIIZabRoDDNk8O+w5NY52QinA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/max98095.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index cfb63fe69267b..ab5a08a9b9c77 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -350,7 +350,7 @@ static SOC_ENUM_SINGLE_DECL(max98095_dai3_dac_filter_enum,
 static int max98095_mic1pre_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	unsigned int sel = ucontrol->value.integer.value[0];
 
@@ -364,7 +364,7 @@ static int max98095_mic1pre_set(struct snd_kcontrol *kcontrol,
 static int max98095_mic1pre_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = max98095->mic1pre;
@@ -374,7 +374,7 @@ static int max98095_mic1pre_get(struct snd_kcontrol *kcontrol,
 static int max98095_mic2pre_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	unsigned int sel = ucontrol->value.integer.value[0];
 
@@ -388,7 +388,7 @@ static int max98095_mic2pre_set(struct snd_kcontrol *kcontrol,
 static int max98095_mic2pre_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = max98095->mic2pre;
@@ -1485,7 +1485,7 @@ static int max98095_get_eq_channel(const char *name)
 static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	struct max98095_pdata *pdata = max98095->pdata;
 	int channel = max98095_get_eq_channel(kcontrol->id.name);
@@ -1549,7 +1549,7 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 static int max98095_get_eq_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	int channel = max98095_get_eq_channel(kcontrol->id.name);
 	struct max98095_cdata *cdata;
@@ -1636,7 +1636,7 @@ static int max98095_get_bq_channel(struct snd_soc_component *component,
 static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	struct max98095_pdata *pdata = max98095->pdata;
 	int channel = max98095_get_bq_channel(component, kcontrol->id.name);
@@ -1697,7 +1697,7 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 static int max98095_get_bq_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	int channel = max98095_get_bq_channel(component, kcontrol->id.name);
 	struct max98095_cdata *cdata;
-- 
2.43.0

