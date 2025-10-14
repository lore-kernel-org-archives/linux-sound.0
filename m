Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949D30ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415995; cv=fail; b=m/DymqnQ68UXPxNRoNBjDdrLO/nQsIrGe1vpZ4Ta56YSv7P0YrWkRVvx9/6b1vCzn4EGlTjI1mRjdFrTdSlU88n73LHcuX3iUKX+ydlSaoVdQe8QhpV6Yk6IMTh0zS1n3JzzMaCjr1SreQZ9OgzHmKjImsCsTF8q3bzIGZi2fEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415995; c=relaxed/simple;
	bh=ip5xNHrBBKBR51Z4h2EDNuQ6FzAYroO9lWKDyCUbcqk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bUJfU17KVrcUojFmlL2BsT2cKcMV5iw7HgnvxYnSBvpWafS3VlW35qSgSxlpSusNMu89GnYUj1tBuEJRJFBwgxdAHSfc5tBqAR0t/ZbcHinJACNEiC2emgllC9S2pm66GzBb/ZW4vpz5M0yFY/oxDAwfed2af11Qf3bfIkWnKoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X0wZhHUp; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X0wZhHUp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOe7kIKehkArhRTfU9XXt3eZdAwdPkpc5jbqCj6H19e7oRKgUiop/1kY9ekUtLE7d518Xrg/yATScBph2nETtzEKnx1o/Bd1nSGnwg81/K4Rf5/kIPhOQfUF/Z2He0PxHgBtw9vKw5ne+8hROl9vrlQnqIg6rOy6KZUza98l76X0rP3GOFAtjZNkBlONLyotEizdlo8PCSX5PGiwzGMu+DC5zi/+JrvfDC7aMd8IeHCtqjAFZjJiUN13v3AHnhXQKL8tu+i88N3mS7/PisCKu+50qObVsV/kc7CbkZXClAAp36e+sEarSuQhjhIDC0e8zMIlYrRdNHYrr4OEWdiekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QQUufgTqtsirmyJia1CQWigUd+ngZD2VQLuDY9ATrI=;
 b=uc5zD8Pk5mSGA3ohsvOrLfIFI9nO5b9+fomijswLg2RYPQHqbhZ4Yp0AUpzPWchNoW2LKW724/42O6G58X3MwwVIhCZa6tsvTVuHO1YdEcu6Nog4NADuHRbW/qGs5eZ0m7syxBsSIDow7mol9g3SHWLqUezB8U2KyJn/8mWl1JKq1b0up5qFUZIyEepc9ZLSexfB6PLhdOTubgKCutFl7xUJIzJjbv1eTMNluqnKcmVp5vo9vSHR2ye7N7OuPagAo6uioJmfYW9L2TUNdef52TNAPwLRoVhcXZokJSrDBx5w1Z4NiPgHh1mD8q4wdUvPJwrsbcGB3VhtOiMjY+l7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QQUufgTqtsirmyJia1CQWigUd+ngZD2VQLuDY9ATrI=;
 b=X0wZhHUpCnSALLA99qLIzydmI0gguuAlLZAg5FoLuNhl7QUaQRotzQTuc4TR2ybv+eSRxkQ8WMF0chjoKvY3AJrjz/qdpIBOwzA2kOcdksRBFNonEinJATFhRTgfl/rt25xwcn6I4V5DumF2Ys4KhripRJJkYYzE0uBv+zbNfsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:32 +0000
Message-ID: <87cy6qnm6g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 113/139] ASoC: codecs: wm8962: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:31 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e61ee1-a7ff-4300-9f8a-08de0ad9da49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0dL9r+eSYh2eHEeISlZSaV1HvPO8n6HaNkuB1G6vxRykjnKBMkKcEEP+uV8s?=
 =?us-ascii?Q?67gVIBn63yhkh8BegHc1iSiAkHUp1eD3B51A1Djvw8xzQaA2+RHO01mDfwxl?=
 =?us-ascii?Q?9kVBfJ8Qz2O6w+8jodsyDNBPKyDAxpAH3cXQE/Xdrh6VGEOMA6BSBMUf1K8S?=
 =?us-ascii?Q?MkUkScBUhHp2ZEvvwxd2wXJQOCyCUBIMS4J2zA3TKPoR4e2AMGby3zstAWuZ?=
 =?us-ascii?Q?3NE9FqbWbMtu1fL4oPpLMQ+479gIiQiqU1hUwkfbrk2PBMh66Chb7K7DLNA3?=
 =?us-ascii?Q?flx1/ZK9YU16QJgLYiX5UyJNtcXnivo7a61H56l/A/7jeDQOHOZmxsFGJEUR?=
 =?us-ascii?Q?vWMsvNHl+SqLEqS2ZHKUFVlDIauGHgcqf5ovSIT5f4SlLDMzfIFBdz3H0Ih6?=
 =?us-ascii?Q?MEVrdNzauNnvT0sQUAFcTRzD2t00GiIdbZfTETdPkMJc7vfnApCGTd64xuQE?=
 =?us-ascii?Q?rUxEoAof0X0QpLyvS8HIGI7vt1tEI4d+1QZxTRiq1CZ6FrSvKhZGkknyxC28?=
 =?us-ascii?Q?hKKSr1brGEyYQD7vl5T2Tx4j6cfPN7KMWdlCVA8UKCwokHO0RfSBg+m3hfmN?=
 =?us-ascii?Q?XR1+CzFfzq7aqGT+IpnAnR5sn43KQNAFZ7q/Z/ZA1PFkl4DoWlKjXyuWLJ2M?=
 =?us-ascii?Q?bLtpXcajHgzVsmuYxayKAQwNQ06S3xz64Xgn7NkNEPEQLfKvXEaU2DzHSCcw?=
 =?us-ascii?Q?yzUd5XtMeC6rIdFrmJ4WYgogYqWfHyvfIqHF+wRuUfTRENx9n+foN+OUk9Bp?=
 =?us-ascii?Q?WLN87b//+rkBeWp/SuSOPXqc2eAb0O6NkdKcYLBooOFAiYn6oYskzn8cdQgE?=
 =?us-ascii?Q?AOuHMEJAEGMNH/VfDGKIMq90v5FlaKKYwXUiquFp53uS47UkMcWhNpLtzLOd?=
 =?us-ascii?Q?xKJW02du6MI+6rfi9gGTtV3giFrTVsY35Xvct7nXH8npRNQVHqe/xRAro2Om?=
 =?us-ascii?Q?RH0OHkXeZbjxohb3YaLA3LzS9b4OHhbw4uvMGV5USNuwLVhBGwLK+kO4nsig?=
 =?us-ascii?Q?MDDWrGaormux0ixBuHgk0XDV5lGrhyL4YLKa4l/ovfJrefoDImcaQEpBsD5n?=
 =?us-ascii?Q?lXmqo4t+ivqmHwEEW1ANk30SBFoLnyG4ouwZre8NRFV1mQHDT23tx62lhLBn?=
 =?us-ascii?Q?mpPkN8suBl38ng4CVypmGuYUaJbCrA8Cm06Mn5kQSZSlHmcZlZKnLX3sizo1?=
 =?us-ascii?Q?Kebi8CL+5+2OaWCMImi5wZEMZS3BncCXN0ukEFjQWUNXppcJhWXh0i/PvOrZ?=
 =?us-ascii?Q?BlKRtZ8R4tQCBImjus9b1/zrzqrlUH4YEOMMZrlS1K5LbJg2b7vhY4haEcK5?=
 =?us-ascii?Q?T8LzeNJ95Gd8hxLbHIzw2FaEP2UlISQ5MtSrzM5p1KZthezhgVkKSg0C1hnc?=
 =?us-ascii?Q?eKOpKJVBqRqUn6Pnolg93ED9gS73PvM0vWTvnBTqHtBgmTaRZzsvXmdUNt6G?=
 =?us-ascii?Q?b6Q5kLEb9VXuBTPbSlTPegVSUDSpiO1eHZE06lAnHQnzA27ld5yoFdprESXY?=
 =?us-ascii?Q?E2bnbzY8aqf18AKMKO7KuEHJt59qu+wWtGjL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c82uXNT8wOLtiK0kqRxwL5tefV4uVFagatv8TtzAdonNg4grHb/CmGEXc2NO?=
 =?us-ascii?Q?TTNfT0fGY9rpGW/JEQMPBbDSQLuAH36ryR9IoTweCJ9eY5tV2BLNZLpe8KXC?=
 =?us-ascii?Q?Li82FhPOJCLuFgEkBfD02E2FPiUq625SItv310IcCWkIGp+PppCbxt08cDjM?=
 =?us-ascii?Q?n5ObfkadVS3CXhWrz/7fb0uMLsqP3CNegQuo/aDN38kUP3uFjN3C7ANGB8NE?=
 =?us-ascii?Q?OejgbfkwLrdlCf6trKewOJZGQptS3OS4TE2RyLnUXs2yPbzlmfQf+IbAhrIF?=
 =?us-ascii?Q?m4AwKxomgejEGc9vCTZO4+8QdZHNvajoaPXexebVJss6xqY6GHT2NeNkJXIu?=
 =?us-ascii?Q?VnOx66KWSXbeSI6G8i6XVFBUQJoQLNN8PYdiGq/3lYHsGjMoEjX4AZPNONw2?=
 =?us-ascii?Q?Te38TC08xuMVoAXrNxWZsuzdxQc+XZy84+gbB65X/Snoyu6io4bz86YcB7yy?=
 =?us-ascii?Q?o46vw71XxPDR/pDSnOdlJF2/SoxWgf7ty0xnys1mmpvtrFWDXIwAAzAGj8gA?=
 =?us-ascii?Q?GBwmEKrPBDkmm9ynKEj12fRwb10R34C+sLUi+sYnevySPbZXZL8V4u3omuxQ?=
 =?us-ascii?Q?/Zydvf411P4l6fLltRYSf2abboR8aBwzO3GpkXtx3baWTyksR7wpJwL2MeUO?=
 =?us-ascii?Q?JKz7YR7c2OT+Z1RgkR9ydTcRhTGg4aSkUBx96buKdV7nJlZO86EtceJyoJOn?=
 =?us-ascii?Q?7y6adD37tn7x7U87FMXGA7e81lUXQjJWkBvf+C5ehuhT1mNhX5vqNFCBTGwL?=
 =?us-ascii?Q?dVEne5K6YkMtMqYJck4A4RGyV7UvnmTdEPVH9ccRHq8g1Qn+YwTBdzZmwB7B?=
 =?us-ascii?Q?nSxI462LAP5zxrNrQnKn0bQcT3h6u61B3QN5PsFH1m6jgz8msOQH5JKGGLXx?=
 =?us-ascii?Q?fwlrh+k3o8C0xDjCp7vwMrmMiNSJpxzSp8y+zDWnvna3yNLFLFL4jlcx06GS?=
 =?us-ascii?Q?JQhNivIczRUgEnaMBlP9cB3y59Z5ezEYAgXM+G+HLOqR917jfN8ET4romx7S?=
 =?us-ascii?Q?CXpZ9pEyqC9i/Zc7EXKw7nAJ/cUO6ai8t1oZmuU5iNsyrmjKqtSG+5Dj8fJA?=
 =?us-ascii?Q?2qrVIdXsU9oUAe7IJWBBQselmxis31R8CVeEcvQhUoE1xO8df9X48Dej9gYH?=
 =?us-ascii?Q?tQF7ZEZ4HugfUl0EGUyn3wYAqJX1puBYwjJYqwHwYFm1w6JJuX6GOcMDTlBJ?=
 =?us-ascii?Q?nK0wbd1+ThRRx9QNZn2dSE1EV35W6p08a2hcJqS9W/5K6PjKnpj1OB1XYAoU?=
 =?us-ascii?Q?r6Y+zCPGyS2JJYYvf4YAhCvGViOfmGlB1AskhrdfCKQH6yL9GYRattS4x8ox?=
 =?us-ascii?Q?OqObf7sJuIZDnTjPNzoN97+fFvU57N2/hH2bdPX3UI9ydz4uE0yKGWpbPswt?=
 =?us-ascii?Q?PeACtgC1aSfoga3KGgQjXgVSWC3z1Kv7WdWXjsHjYBqY2WJUIf0UmTsA2xvv?=
 =?us-ascii?Q?DOtDTVSIHasbAIOaXUfbsZePqepFyV5un86/nf6C2m7UafMSBMLHnOBl9bLy?=
 =?us-ascii?Q?jlBUQeW63ddHfA9FXRh2SBQo8G6JEqALs3u68zYXAphYI1g9cOQfZLBiXjFg?=
 =?us-ascii?Q?rA90PUHACokRmnO9ol5hodYdEBPFA/9HRZuMtQ4J2ae7j06vrEzbelcUgM7v?=
 =?us-ascii?Q?rx1K1tsA/g6BENvtB0rYd7U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e61ee1-a7ff-4300-9f8a-08de0ad9da49
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:32.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0nVc+Td5Ng8xecZcLpLjZhApUGp6Caf32Hf7gpqf5sS+Ft+QcNczmf8iBvfqqIxM+MJ7uChOs/lA8pQm9DOFZsp61jInJeBlOY+nHYUkDw3hltF13fcPygN0YdxaGc5
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
 sound/soc/codecs/wm8962.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 08c8ec3aeb449..a5ad916966b27 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1545,7 +1545,7 @@ static int wm8962_dsp2_ena_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	int shift = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = !!(wm8962->dsp2_ena & 1 << shift);
@@ -1557,7 +1557,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	int shift = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int old = wm8962->dsp2_ena;
 	int ret = 0;
@@ -1595,7 +1595,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 static int wm8962_put_hp_sw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ret;
 
 	/* Apply the update (if any) */
@@ -1625,7 +1625,7 @@ static int wm8962_put_hp_sw(struct snd_kcontrol *kcontrol,
 static int wm8962_put_spk_sw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ret;
 
 	/* Apply the update (if any) */
-- 
2.43.0

