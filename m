Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2848330AAB6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415897; cv=fail; b=OhAzFqw5r/xLB8SOl7nLRchM3MhokCRnAEQSOvmT83aGKQcmleopkCWftIOEwykZ/qsx6Sq/N/pVeA0L8j6vZvQrjue9ukTdADiJJpSHQBM44oH8gvILbSnpjgqUXiW6p73y4fQ//Kptf/7poVyr2/Bo/fgSb4iHDx8brUT2ETk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415897; c=relaxed/simple;
	bh=NiCbPyePR2Z943A17uqSc5ZXD6G2LR9rsiY4GAGvl54=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EUCX8sYLk3QW/XHR3f83ohVxsnRJSqbDTh//+JBHbeK1PNng2ODulWdOfqGfr4ah8axxVjcTQWqNFPDZFJylv1xRosRSQtRdfNROcr+hYE6ADOGrp+XhPqK2pJ38e+xjvusAdnBQw3XENiJDZaV9Uc0XRO03nbbP7R7wK+dZ1rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PtrvF4Mf; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PtrvF4Mf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW1ly0B0/L2mn9frbQGH+eMdPeeAGGGcYFLMBnFECgTgvRev6CV+stG7s7CFjKH1uOGFaGhcnNJK+wku0I+R27xdElSXx+vLps+gnfSOv31H2b6yPw7p7idpGscdN5nql7UgttPfOZuEDeAGO2YtF29LktUjpUSzWm0KANchKukzle6shp0BJfFOAU50Y7VC8sJGPsBbUxoM9api8qRmNOA7buB7mVo6xHn6Der8ASyQTL4H6EQqBBGrAOEmHandMpY6KOmNCi171ZvU9/z8Vgsqx7QJnqx1RboVic29K8e+wvrqNEFvhr2GGfroWqbXG1EEqIObV3aqJlJ0QFz6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ckz4TCEayvHMtcyTKnZyMhuP+LMFRPrN2S8KSW//mZ4=;
 b=zDm6xhFKpgJkpI5Y77j+H1KI8s67lj8IJYyTgMHnarTT4jdXmL2OA84v8QYnDJwBjGvjL7i4loZs1gkofG6xQOD48e3J3sO97ecuzfYW1UulPDQhzt71uSqLxjzMNJdlQ30AWK2rxF7ytaiYgkV5bXihsG5y5URZtRByDFfkpFuF+KGnoY5KOn6sbjMHj9tvkyL49Rzc+JTx//6tbIkyIqcJ1z+Fhv7lkXgOmxbUqR2fL5/lWAvKGfN9fHHjhBq3gfdNUvyWWkkyxHJJgdA9ehbT/VivNclkmf1sCDAM28hZuiUYk0sPN20fI2l2/fMGVxaeQuRUaOW15+derKLULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ckz4TCEayvHMtcyTKnZyMhuP+LMFRPrN2S8KSW//mZ4=;
 b=PtrvF4MfXrNZknkcQQbefYGKivI+k2J8REDOncruAVJoMiO7g4fALVADg8eBjD6+OOB8tMn/gLmlp6Xj83DJ6KDA/sx2/H0izGyRuhFgt2uXDrqZr4c5s1AeqxGgla2Fzbg5zw+XOWyTYxsPvBVLr+7L8b44T6PfNYu6HyZ8N9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:54 +0000
Message-ID: <87ecr6p0tm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 087/139] ASoC: codecs: tlv320adcx140: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:54 +0000
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: de9f5ede-a3f6-4582-7e07-08de0ad99ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1UvdsUcCW45JhvZFE0Mq3DDYLm+Ww74dhu+Nn/U4dilJt6fCiVpn138Afni6?=
 =?us-ascii?Q?MZYXkH4V6wSrpbrxRZA+en0J46UjUfsac3TmqIUY/mfG7h3PR1AfxYYnRJxR?=
 =?us-ascii?Q?GAPusJpOQEDBsKFQQcpo7tyoU18KUN+LXJSeAMMCA0gATZNOpH7KP/zhVqD1?=
 =?us-ascii?Q?5S4XYeBNOt54iytKT38VSaZ5rl4h3NtFFCMh95/NZ36QhOJBuNliZ1YVr3ZG?=
 =?us-ascii?Q?XeIlEoDWim7ymY7MB9WEfDObJymcGMi8v2GfQWL6o4RgAQmFTK6Hi7a4a6S9?=
 =?us-ascii?Q?DM0814IgPP8sFsJuW1Hy9Zz7vNG10fbhX5X645XDgjNa6/8jzZyOFoug4R3L?=
 =?us-ascii?Q?PYn2q0wyh4GO8mVfrvvQkfzq9C2kPnpZ1q4HLurikrsUhS53LKyshWbM9rE1?=
 =?us-ascii?Q?SaCcybpX7dSmQJTxm8zfLQjQ0bNxwDQovQxH/junEvD45tKq39vPs0N19T5n?=
 =?us-ascii?Q?7ErYlOndJYUtATuPCpvOaGr+g4lsj1nMIxxFzSLKgtqg6TpUfeujUX1bMOvv?=
 =?us-ascii?Q?XRktsg05dVb18N6kGU3r11/G3jKRz3YTZRQ7EHgF8GMyHNOyBrcro3wevjrY?=
 =?us-ascii?Q?jlQ1fBc0qeQqXFn6beXNz+lTgFso7ibT1qWj1nAejmFYiSpDKWOEfXNQVf5G?=
 =?us-ascii?Q?ZF8oW3SuQuizGwE/ecpAyTyy28q1NZ7dLXWxCQ9lHkjtkpO4IkFDV2QxzNgk?=
 =?us-ascii?Q?4PvNpdUhkUrVSCgWRhFKg532ihtudKfX0aEmmY8+ff0KIUIZFiaESBEBBcKH?=
 =?us-ascii?Q?VCpr/n495pKmpP0zUlFU6HWmiF0TYnbZWkindlS/cYvriNpgW6JZfja90RzD?=
 =?us-ascii?Q?jZA4tZsAqBmvWb9FwSQEF6TVXvCpzayYFvML6U91cpC8JQtTc51/EFO0dN08?=
 =?us-ascii?Q?3pTeeQyxFQhqBsKgg/q0CTjpoykllsVDOBa8gHWfGHIHVgd4Gul/EfrgXTt/?=
 =?us-ascii?Q?UIhO6ZrXDTwXnkfkMjEZOYETjNn238Q+m0BpevY0Wqh/YirEMf78WmRTVMLu?=
 =?us-ascii?Q?S2pj/Q9pO//tIQazGezcDPMmvxfcssA9KuhWFyrB6QOEylo6fY9B8hDZAUBv?=
 =?us-ascii?Q?ypKfpmYqZEed5fQnzUb5Q3Es2F9gE38/PphWqsGOznm7UGhxEd+bvY3QiJyD?=
 =?us-ascii?Q?yIlPiVvkEuWXn129CgMZ/Voi4N4ViAMYO5F0Aj0oav+1Lii+2j0K9Nj9tIGj?=
 =?us-ascii?Q?Q0qxz5qzA8sMKpcNL0uKrhgE/sfG11bnV56xBHuxhScqa5ceKAHAS2kr72tn?=
 =?us-ascii?Q?T+2LLY7ZnoFz7/IULJy8K7lXgI0yCndIMreShXwpvot0eQMhfP1wC7kP0E/f?=
 =?us-ascii?Q?ccKuY8UfGEYvk0DJScax7DnLn3Doe07M+e03bsd2aP3rSrbjYVhQJPx+OTfA?=
 =?us-ascii?Q?QG3f3b7OwJqZ3IHLIKiYeHc3NLsO1PfJYjB5KZNYVDKl6dM8DeT9Eqj05d/1?=
 =?us-ascii?Q?ZENtRmy5E/ATK18htQ3swkjNeRPJpBhLTYi/sEF2VMwMqmxjID8itc9AhXPm?=
 =?us-ascii?Q?qPb6tX0jiAJGc/f6P0YQqPQvL5uQNhHIdgdA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HUaPqhAlrOUfcFCExHrSgEnqrbwnB+rcQ3fuQKI9xCa5UbpyKZaQPVlF1a6N?=
 =?us-ascii?Q?s0eJlAPjH1/tTy3Ij6tjdzPH4fAnSIDR5vcNKXDop+yIHt3m6fMbbL3NfC8d?=
 =?us-ascii?Q?DCVcnfAkHtpJQVVRnIDimuQeR7DR6AUF44b5O0MPxUblIgYDCFMyYj3KQ93r?=
 =?us-ascii?Q?/PwZsVEstfP2j9yTtCC/0fx+2PT5j9lD1mVMHNcFcoUnLVfYIlCFK8rrXvUa?=
 =?us-ascii?Q?+m/26BsdPhX3525g9JpA2zCJU9suic/OdP4R4BfaJ4bH3XTxAJGyhjQzP6Zc?=
 =?us-ascii?Q?qiRJp3OU/O/dkKnBMaHqe2ElxFQXnUufXzSS8te4QJWykC5ak3UNqQQFOE80?=
 =?us-ascii?Q?qNiNZI/1u+a48TGgfIozxJCUlmTlgDvZuXDjWpciKkhRsnBmR+w/SjZ9p7On?=
 =?us-ascii?Q?ir0mBRzX+0w/Gl/JVMjmyJXqx5rSjJBXDnydRaCrArvnj0peCi5D7aUBrt3E?=
 =?us-ascii?Q?cqm3Z2Ryo+zUOLRr8XCnIyqCo2MfK1kup3pkmNLtcDHTHoRI+F4ik4U5aFpi?=
 =?us-ascii?Q?HkXqBiYsTdnDwQi2u8YFjAJ2a2bls3xhc5XkCf4ksvKvmubosrKSqmStD1VM?=
 =?us-ascii?Q?eAOU2ZRBAnZTbP5EkaUJKTyX+kl6Yh4mitVxK9rym0DJ63k3HeQRpwimeARk?=
 =?us-ascii?Q?rTMyMw/pEPb3E1d3E7qLeIi+v8oITkwE0b1gGNL/k1zJ8PVpbm8/jyoHRjvh?=
 =?us-ascii?Q?mMSwd2dygjM5FfTkb+3jSCdx+ubmB+cxQpNriFuabZKjxg5Z0NhIeseQl9iY?=
 =?us-ascii?Q?CM5i7X1WCGW6GRmCSUKdlNwmWO/kZVhbXoHW00uwzHLzOOm6b8jP7TVu86pf?=
 =?us-ascii?Q?Ai5JuAqTNa1HBhEPC2+3klyhih0zPLKzQ4DRU8pyT7CYFTtvNatTM+uTjaA6?=
 =?us-ascii?Q?97wB0zcUuyAag84Zf+ph49UR4Yu1Aq5e8a2UUrszia96kP5oVZsLnlvCil1X?=
 =?us-ascii?Q?s69sNyC/anXGctBvMUFZW4VPJbS3gaihFXNV2ta7j5Z0tT6HeaaqRj71iQTW?=
 =?us-ascii?Q?/dTrnoLJ2cye4UgQOYzYYQC77Ej4hACPgwQHHFAaCNvxzLSseKtAvqwgnhlJ?=
 =?us-ascii?Q?jdN0QxrYS/MIzqVwx11y0lquzqTtgYpBVnW5ZsydSzX7MVg63537PC0T5uom?=
 =?us-ascii?Q?QILbqhA6cCiwtXUNJo81ELWNsIri0rcOo4RxBY7+Z3HQ6/mnv3gfuWbyUKKS?=
 =?us-ascii?Q?O9PrBT9frpY9I/2KAWysBfcMpL+fx0cJB57mdmDcw/st9mBpSsc2OyDudIcV?=
 =?us-ascii?Q?2vZxlV496to0USttTDYogD3TjaD385O8oBXW5Qx8g1x+/uHKeEx5i+jPVs8e?=
 =?us-ascii?Q?+EUddv1GFLG0a+iUjeVv9JRf1ebtGCUq444AXWW08aoGJi/L7gq55GVYzhqc?=
 =?us-ascii?Q?4kCGHLeCg2e0cpO7wZGwaJs60xcKURWJ5xhTZFh8sNbTByvvgZNQPW96dZqN?=
 =?us-ascii?Q?P7ssKn+5j/m8vh+lKMM2RlSXbYxua5AU78zvxOdaMnBnAzixw+MPZRatK6PF?=
 =?us-ascii?Q?gxcKJ98C7/I081/6OtBCzd1JT/nmeHK1M74eWJM3UURUda84WUne4p3hv1Y0?=
 =?us-ascii?Q?lBbfd4wqX9AfR42IyFcZxHjHz5Cdd1l5u03wxHPtJC/FeG0Kc9ZoHEPxHlZ3?=
 =?us-ascii?Q?H+t0I7tXV0i/lQNP+WCvqac=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9f5ede-a3f6-4582-7e07-08de0ad99ff2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:54.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afZ+ydvVSWtbmBwv7jHaNJTfxfrLbAprRkceE6c2Z3f+3L3Fr33y3fgHb72O/OrXmndhKO+py9zB5hnTJjFSevRNjItNIF4+8xxtKXdQQUmYngyiG3tDkerq2+LEhrXC
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
 sound/soc/codecs/tlv320adcx140.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index d594bf166c0e7..443cf59cb71ab 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -612,8 +612,7 @@ static int adcx140_phase_calib_info(struct snd_kcontrol *kcontrol,
 static int adcx140_phase_calib_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *value)
 {
-	struct snd_soc_component *codec =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(codec);
 
 	value->value.integer.value[0] = adcx140->phase_calib_on ? 1 : 0;
@@ -625,8 +624,7 @@ static int adcx140_phase_calib_get(struct snd_kcontrol *kcontrol,
 static int adcx140_phase_calib_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *value)
 {
-	struct snd_soc_component *codec
-		= snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(codec);
 
 	bool v = value->value.integer.value[0] ? true : false;
-- 
2.43.0

