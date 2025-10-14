Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7EB24BBFD
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415750; cv=fail; b=rDVi2VfZS3BRQWg/wAgkwDuswWRqPaonGubMATrQNNsho3igbtEsDH/moHU41A5KjPaWMFnL++SoBu2VgohfPFFla8jqGSC2EIJPAaNe0KaZDNzGlROECRIEfDzA69MFkMsm1P0ZMpg8An7TnBk/V+4xrIq6B69YD76lQm3y4HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415750; c=relaxed/simple;
	bh=dVMM8L+qbkAeFNnNd8MCut82A8P+Xr/Tp4skahCEY28=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P07LvyyqUQ7OxVaUEuw8qPSnz8oaqlZyxeTVZclaSxRcN3zEp5DxAhfLA9BxDcdX4BBvwhUW00ZUzKqQ1YJM29/5iWn69truAvsciwoneu73enDqwm67FbnH0yG0KEclPG+hKWtZ2dvW3kJvbDQJ5doOWAarPGzw2FeabyO2imM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SW/VbM9M; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SW/VbM9M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL4oO1TXgKik/TB5FSbmlKk99FanhtkIHTx6DF4H9IbUv2lYemolMOCOmttAcgUeZ0D07j7hfx1TvHNxQMjgdO8u1mhwaHX1KwrkiOJ1jGYQLy4znJ7FzX6hxpZ1VjnqRJ6V8sknak9OmABBKDGjdfj/wZJG3/Rzk541ZNIO3iZpAKcjtLoVr5eTWCGjSZhfUsRLsXPBWT4YmKbKrJ82MP1MJrg0A7ESBZ6dbNu1//IknBUz+I2gDJcbQq7+nPKqupIMki7/8QsUQftzQzH38oYfPvJZhSQicWNlXimTDeQexasHEmfgesYEPFJ+1ERgaAg4GKmORZ7QtBMCoJIpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68mEgM7iJWH1mGmnYFjsyulSipvFpWGgkWnzlqmt2X0=;
 b=Vz8INFK4rUkx3qY1AnO+AA5rYLEh5w+USW9DAfqLrRZEOwlL/WkektlqwkhMo0jQBuK+spukCQCaUdQPRElnQARRfzgpBVxG1E+42auCTRPnaVMOoJl+9fiVwyAJRtcUDRuI3my4G84Eo+gGXqYPpjTPI0pb1GsHEqEgjsx6XYdm/Z1D3xtgjlevH7PmNAjdzN536527O/TM9obOb1zP2RBDj0aI6Hl3oECUm1EC1rBENDb6wX6rXyPagZsiLzUI6K07ClqT4746bv/61xdjT1PFscvIKuOG66CqcYDh7bjWSi38W+uHwPfFT40chI2YbCsOBegF9xL8/oMUb3mXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68mEgM7iJWH1mGmnYFjsyulSipvFpWGgkWnzlqmt2X0=;
 b=SW/VbM9M/ioNVW4h6SyJ6sky9En0a7wvz/roryRASC43+4jh+etN8tQgfqLQbtyxdx6hFcX7h06FtREulEHE6SGq66zED2GMBZ+9xIhEjGtUvfilC7zkfsbRpgikfgi1BlQtpNXNgLnPhFCB1Q2yTepgp8LeoRXoOiQnxedhom4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:26 +0000
Message-ID: <87zf9uqfi7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 047/139] ASoC: codecs: max98088: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:26 +0000
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f94683-8e56-42c1-da8f-08de0ad947cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k0vHDYmy6piwuA/Q6MRzgT7Pzak9KkVbopuRnvZNLalMdO1mh39KQjOiq2Eh?=
 =?us-ascii?Q?6xlQp+dVbnCCHE3CH7WVgdoCH/Oc8mlac9kIWvx7QFhGZUtq/5heOBCUuCVE?=
 =?us-ascii?Q?D6AXuwml+pBrDsQ7HifkL+2T36dHfN+vkjsK1s7iIHOPcnuHJ8mRX5d6N50o?=
 =?us-ascii?Q?TGnJ9X5MRLbYbo0e4AcC/v5OFhtLv5w87c5k9N+Sd0PeoV2tryW/m+UQMZo3?=
 =?us-ascii?Q?mywrQYkKP7JUFNxzj+5EvlRzCJPn7sRvYGyH62BjUCQoNULBim7EToeTOd27?=
 =?us-ascii?Q?IYKW1vK5w8uKaIz4fBaBgvAsXr1/ydY9i7V4jTfNPMPcsBlS2iqwqdnwPo8h?=
 =?us-ascii?Q?tZfJ69XuHXwogUOAgeqoW3FsGm+MqGPLmoaW6Sn/3Mc6TLO7y3ui2/uKuJam?=
 =?us-ascii?Q?SJkty0Qtjrg0CMlWd80IYW/8zHX8zme2oXk0Fv/WCe5oNzIs8O9bWGY1dXyN?=
 =?us-ascii?Q?Gu5G3Lq3GXXX9pbiOKp7ltatHF1SPLG9+isfMUGjDd0rP6kLljS9rNyN4TBX?=
 =?us-ascii?Q?rR5zNRzMMYnWh6WHfIZB36FaGsKKScaNuCp7BiQ7domtTSZy6c+JoW2IuuP0?=
 =?us-ascii?Q?LcESN1u6LthmgFeRjuj38WaCvIefvpVHJSMVj7IXfrn+WMRfx24oJ0QJ2fsf?=
 =?us-ascii?Q?I96a0c+fSXDbE9PQxzoIngu/TF6dRyEut303+m+QSRtrgFC96L/JDxZByGAz?=
 =?us-ascii?Q?yOd27r25qrpgRRi8shLSWHrfakeQVBszBltQqh6WQgp6Ngh+F+MiM2DDbaqx?=
 =?us-ascii?Q?w09tYyEjcEXSY0f2XjUNdGmUwq7yfYBbBBXhhoqwJMmrYyuLwaEIpDsMVISR?=
 =?us-ascii?Q?y0BOPBIVb40Gkr9yssVaO74T7xYQOAiz1mZDi6BZNWCFJ47orrcU5fj738t1?=
 =?us-ascii?Q?wGigH7eEQuosqhCl0Lzc9XlzJWHK4ivnqFnl3hy3w6ecrkWYmSIrUTAbLAVy?=
 =?us-ascii?Q?CT1hYHu5mDYW7PAhJcaqDDXlwzQ6GvKoXOIZb3U2cBfBuZLnlyJPuiANH71N?=
 =?us-ascii?Q?zvXzTbIvexdc+fx5o89rNYDHZ0aVoDmAMIt+VanPvcPsSNI6SciGAytfKmk6?=
 =?us-ascii?Q?2924q1DxlCnSbQFHdW/m/E/YtB08PNwPuAHAPi8G4IT/nLP2biHKU9cNNltp?=
 =?us-ascii?Q?z49SmGKG+THyDMJqwdotjPFhJqKwyV+JK67YXv5Fz1y1W8ykvJXlXwUJ1LBr?=
 =?us-ascii?Q?Vn50w56z5WIxGNnu79UN6WTem036l2dODkoY5MP/Q2WyZGbchZM4vB2WR1HK?=
 =?us-ascii?Q?+oR6kXY2RRPcRWWSTb0fTrF0dcps7ty1biewiG9i+u9yHQkO9Q3oxxrbss4B?=
 =?us-ascii?Q?DnZ0NTREmrLXa4+ODCI1X09h4LJw7CNabx/h4fyxmZqAtp9mSOPk+VIxx+Ip?=
 =?us-ascii?Q?dadS5xWrUxFYdsQWtKMK40Q2ZVaSPhkW+fCxVCFrGILHh6hHUfW5MfQipMC9?=
 =?us-ascii?Q?mjSbU4/n1GflnuFoxnH3oshUSnW1W21f7GPza1SqYC68Sj3bRvjkH1KYe1ed?=
 =?us-ascii?Q?6jf+OlYj3sxyjV6TQXLJU3bKnyvXeKmEvGJK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kxc5YhSM/jwsmWxyFa5Uwuus5TMos9KXoF6yybImJInF5jfjdrNdut4fC3HW?=
 =?us-ascii?Q?v4zIxXPCHLtsy8F/EYnGCzaBGilfXDTNjTOLkEXa2FYz4u5wWOfj1KW9TBEi?=
 =?us-ascii?Q?VymbIpZr0tdWDoinIJhQdv8RlKQWj93iGErLcQ4pZL96tu0nsJSkrf+FJe+q?=
 =?us-ascii?Q?yxQaEwSyIUyvJM3qRwhe8uY48xDpRHx3k7Bt+gqNvR2SBjwDxr7gysclsQLh?=
 =?us-ascii?Q?jgFPN10fxmPOY+wrIb1lERTCle0ahWqEjyYvrluBd7uJLh4gyYhGGJi4rRqA?=
 =?us-ascii?Q?2SAEMJ5PFvbA31dL/Xne/WsB7Y9N1dzfdc7pGoTuQeUC8EZv458y1ZOMyqvT?=
 =?us-ascii?Q?IT36T48+QCi74xD9OnmLJqMbtaFI0cPemijZpckrgDtEZjBDnfJGhYLfyJXI?=
 =?us-ascii?Q?WsgGaCHWNK9ijIvpugvvbOxGRrnCOwcgXod9ZGMEZFtzk9wprZfgSpr5e1kP?=
 =?us-ascii?Q?oAF4pmvgtkhmiT0RPACMw9Weyb192/QkXsR4LoqbFSVkh8FwMAklhTVTqH7Z?=
 =?us-ascii?Q?SrtuUT6mo0exeXIwHU9tqa6yW2UB7K7/Ge7ercJIOCYRPusRdJWcEcqELPWp?=
 =?us-ascii?Q?ikzJ9xr5P/zLbt8UMD5lC8Fpz5+QOVZgFZaIm5lg13/bhUvN6UBz6az8Uluh?=
 =?us-ascii?Q?+iLYtZgmcVjPCy3OghwU72WxUhhFQ/pcBEeeSJogDInrhLI2pY+umeJ5Q/TW?=
 =?us-ascii?Q?aRoVrBopHyVnJaaHOBEvkCTZYU2hPAodG1vmXUUEd9i2qBRKHehNkMdr5WlI?=
 =?us-ascii?Q?RvhK5LW0Eso0QmuzlYDhS5y8INHBczOtFcl0uYzaHFhFD+FFM6/X6431D0qJ?=
 =?us-ascii?Q?5HUpy3cpYP7l2rRv5lgXehWi3Y7Ey9IvBgVOTBt4xMjHQzlgmfKT/aDoPfCT?=
 =?us-ascii?Q?1TGosP+RBxJcjn2ifMTjYRLGT8x+nMvhsJJZH3YgctbCsR9hTPz5z3sYoFUD?=
 =?us-ascii?Q?7t/Wxca0X9sitPN5p893KEFKIzV/TVMtAkgowykUzmgMlg1LnQaQNOtnzPU6?=
 =?us-ascii?Q?rlSEeo993QKbO20t00GlMxWc3l+P+HE4S4Zlm4Fk3630hSozEfrmiqrRHpJM?=
 =?us-ascii?Q?Yhd2TmQsDhkJRz520KxAnLneBVPasXjit0EMf/MWWWFKxjKmqHWK2l6nGrM4?=
 =?us-ascii?Q?vD/0cq+mjNPJNt4WBHugr2QROwOcNJt/7l5RsskpyON/x8j2gG4UYAVT4Shd?=
 =?us-ascii?Q?/3tkZg4Zc8nlBJBywjpgEisZ7t6eJikHGm00emszgeJo0DFqRnVCyMIiYZig?=
 =?us-ascii?Q?jzIWZ8PQXuDbAuG0Z6nBu28aSMZuMhR4WyVF4G+Mal/XyQr8f+/hpKd5nMX/?=
 =?us-ascii?Q?vt3+G8j0wcukwRhhVcMr35tnsiQ4OnBQYORo1WVRREZ8fAZQdt0732s5dvX+?=
 =?us-ascii?Q?PWzOmNdAN25gyQ8tzncyjPlcWVj/UELZfsiABAvV2ecFV5eFLFFffLP9WLD3?=
 =?us-ascii?Q?0zmgmoJYR5d3iCgpJoElSVLL/Bf9DRcPeppyKpmH5RpbJyXeOvZ8vqY1zNut?=
 =?us-ascii?Q?xzQw7V6J2sD83AHGPz4LZ3r3bdSH8hYTL4SOGCDv4fAIpi2NxcnmtVdRdz8n?=
 =?us-ascii?Q?XI0pGjrkIKXytdCVe5pHLPLxUIikalWOMF9apCbXq7R6vf+7miWPftjlMnI2?=
 =?us-ascii?Q?0fZz45pkQdzWtfz0DIg49G0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f94683-8e56-42c1-da8f-08de0ad947cb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:26.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SK5F9UJy5ezOVOvY/FPJUmvvj70cotW22oVllBoyaEjvc6Ffqd/H6UYHb1W1YiPUsgOZds1E2/40cFyjhNtyZZFX6PkNXVstYywO9hxFB98hVO8G9/wvnpWjJLlFafPT
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
 sound/soc/codecs/max98088.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 37e61d8d4be6c..f1cff60abce0f 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -380,7 +380,7 @@ static SOC_ENUM_SINGLE_DECL(max98088_dai1_adc_filter_enum,
 static int max98088_mic1pre_set(struct snd_kcontrol *kcontrol,
                                struct snd_ctl_elem_value *ucontrol)
 {
-       struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
        unsigned int sel = ucontrol->value.integer.value[0];
 
@@ -394,7 +394,7 @@ static int max98088_mic1pre_set(struct snd_kcontrol *kcontrol,
 static int max98088_mic1pre_get(struct snd_kcontrol *kcontrol,
                                struct snd_ctl_elem_value *ucontrol)
 {
-       struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
 
        ucontrol->value.integer.value[0] = max98088->mic1pre;
@@ -404,7 +404,7 @@ static int max98088_mic1pre_get(struct snd_kcontrol *kcontrol,
 static int max98088_mic2pre_set(struct snd_kcontrol *kcontrol,
                                struct snd_ctl_elem_value *ucontrol)
 {
-       struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
        unsigned int sel = ucontrol->value.integer.value[0];
 
@@ -418,7 +418,7 @@ static int max98088_mic2pre_set(struct snd_kcontrol *kcontrol,
 static int max98088_mic2pre_get(struct snd_kcontrol *kcontrol,
                                struct snd_ctl_elem_value *ucontrol)
 {
-       struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
 
        ucontrol->value.integer.value[0] = max98088->mic2pre;
@@ -1500,7 +1500,7 @@ static void max98088_setup_eq2(struct snd_soc_component *component)
 static int max98088_put_eq_enum(struct snd_kcontrol *kcontrol,
                                 struct snd_ctl_elem_value *ucontrol)
 {
-       struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
        struct max98088_pdata *pdata = max98088->pdata;
        int channel = max98088_get_channel(component, kcontrol->id.name);
@@ -1532,7 +1532,7 @@ static int max98088_put_eq_enum(struct snd_kcontrol *kcontrol,
 static int max98088_get_eq_enum(struct snd_kcontrol *kcontrol,
                                 struct snd_ctl_elem_value *ucontrol)
 {
-       struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
        int channel = max98088_get_channel(component, kcontrol->id.name);
        struct max98088_cdata *cdata;
-- 
2.43.0

