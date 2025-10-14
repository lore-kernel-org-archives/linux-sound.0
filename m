Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A830AADA
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415922; cv=fail; b=MXJGUCQMPAb3YfojiIY/iL8SiR3kMPXb09ni6L0rI7kUrHo2Rm4fhkWciVlhssf/UjICQ2Q1X4SLC/5rhNc7hB36ir8+9mgFdJuLaHaDipHgXVMPNCtafHnPcgGf0ZEE54N4zrQge37THSCQWSVPl5yGx3ExqdF3HNI4gIrSmWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415922; c=relaxed/simple;
	bh=r/iQhUi838dw3sl6tQzifq/RlNix6YykkyuRKKurH/8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FxqY2zAfmz8V/SLpp5rut9JwrSnXPGJTX7ngvbC3ecfDuFH1k2yWQ7g409jb/Zm7ci2ECb5A92EXzvf8HN6JyJ8uQF1Pkc2hQi50IItA9lSCNu13VO+2uLVRTWax0GqR4NSDDewCRuxQH3VwixFMtc69aU81azZ4wFSu5AaU0MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=atfQy+QW; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="atfQy+QW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A47a5iVJN0QB08oPw5gyVrskMG6RLQOb9B9rhWG+NLxwm7Rgbnp/b4RFR+BfBunjTr8G1qn6XdRvdDJ1bt7bGYU/ahvhHi5KBTPMqRlpdrCwGEn8e+qv8HwjyRrOVUCzDfKpTXCLmIYMmKWGkfScA8H2t3W44qOFGAgrAfW5Zs04qLY98YsA942mIHCdzH/GshfCmEgvcU8jqPH5dpAstuLP1P+nNczVadyjw59/c8KZ/2por3I+dsTtCJnkx70TgvN4mRn9CPFtDNiUsgBWrblB49uBDHqbijI+kyce4G6wGf6jJBkS5vNcB4lqbItlcvc6GCZOoFqtKBLutbPFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AldXkiIezDsm7RBNcRPVdo7R28fX6xMsYW7Er5wxKHc=;
 b=SOoSeUOxlPElOiPQGduK/nZ29xlSIGRWa42XJjInebY0mAxWxHr+JCMY1Puq6aNNXwNrFjwEaftpA5o1kw7UJknLTFUZGtF0t44izWlf1AkUZv8XJaLit0ZI9v/qB8BHAarVJBgT2/2ff+aIbZGrtFzxHLKyzDhAoWNTQZ8QPoUll0m2T8TcNTkCJu4Ys9MhGmpBNxB2c4A0EA8lG7gWATjj/Xuws9MmuWVTNTn17goTRl2BEqYMP93jA+4upbTOQSGmQhzsjYz86ndkmDyunvQETXGMCG8+ruGSX/29gh4+51Oej+dJuc/1Sw87fzUeytDSRSfkZdxJoUN8s9UVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AldXkiIezDsm7RBNcRPVdo7R28fX6xMsYW7Er5wxKHc=;
 b=atfQy+QWk5lr2rSWvNmlDFIUdZlqKCdulUypjMjvQJbM3KXP7sPU85dxWah+oCn2Raxo4X1XqRFx9GXq0Lo71VYx00kZvYQmyTBoVLE6YxvV8ncsIj9dGq2qKLNgirn4tt/5wY0CKaTMwl19jAjTC614IDnQfKipbrzHzX8R4V4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:19 +0000
Message-ID: <875xcip0sx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 093/139] ASoC: codecs: twl6040: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:19 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e1acc6-9b64-48f7-fba6-08de0ad9aefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LJE7nvTWxP9TIxiRuf+KEr5uU13HAIHnTV6gV7b1leXunJpRtaSuD1scuL1L?=
 =?us-ascii?Q?VXW6JET+CkPzptg9qpMs1KRxh39gSLS0SKugb/Isg8HnKH/NfCF7+rJapWE5?=
 =?us-ascii?Q?t14pKMpeOutz7fJpUbs0QGF1T1T+P71NTMOrwD4PxlTozpGNZgQSvgyxz7Ig?=
 =?us-ascii?Q?V39qTFfdoDTHquKAQEx2x3PHozP37fhWfrK8/9Wtp9+4UBCOdn/RX2aG6LCM?=
 =?us-ascii?Q?Zn1m89EQgAY04RgTLGqZOd6KWYG9dG83N6W6sTAo9nTut8xLKYgIXqA7Xk6a?=
 =?us-ascii?Q?iDjRsCuQQjFv9efiUKRsN1zNjCgRhZ00W8aKtgAmDdEdgHkG2Eo7BVjRDQ9/?=
 =?us-ascii?Q?OUa92Ql6+c0HWl1eLweUUH0bGlnpqvYlylXYjF2mR5jAibk8KmxSl5GdHxK+?=
 =?us-ascii?Q?njrStWIgUWUcU9Wk8JSPtlqjIgFNwsGZVarPw4zjXXF1fBFAus+lDl1YJxKd?=
 =?us-ascii?Q?cnJqAW96y68Xao00f4xJ1RuYkbzTRPggCSeqRf1jYUi9bjQ2g7syZJQwMuU0?=
 =?us-ascii?Q?k9SNHsc/nlL0sNxQabtiUkM2QsT31B2sJ1C7XNpnv+SARo7NC0Y4/mQ3AIEk?=
 =?us-ascii?Q?In6p1WkF5dem0WigtLJcsf6+LJWpBJ+GCJvKnqxgxEIxC7L+KAIBaAPgO9wJ?=
 =?us-ascii?Q?5+uwD0GfEX9084AvYTK6Z6XLq1HN4BXREHNahFc20hqpZ4URqcuIvHMa/sXF?=
 =?us-ascii?Q?y2N6R7NHOSj4vYBZB0RgWrhrnin8MdYPRNpmQ1kgqbxsstoOdM8lJF6WKcnc?=
 =?us-ascii?Q?6KlU8/oH19Xm5iV4IsuIXungPVaPM1nvWxq1PZeUeYsSXC8dmX5f/9JZCKZ4?=
 =?us-ascii?Q?uPR4E3f1uOhwDGSSkSDuN4LCbVDU4IThERF8a6XOemPaKdGIaJESdr/VYgVL?=
 =?us-ascii?Q?9GjLRptsltFcmUc8aqOdozgV0sqVuli/h1uzYwYcuG33wQua1ajrWrnvPa/2?=
 =?us-ascii?Q?AF3QUXy1BcArcrD7au2hpQhgxM9JKQ4lGx43ITh8AsjMcE62vEGO7NO68Qnv?=
 =?us-ascii?Q?FzUwqDIwEejdhHZDR9oyzluxTgisJJ5gdWuxbFb4FHRqrVO7MHov7SeoPVVm?=
 =?us-ascii?Q?XN5LSrZAocMJj75I1UWoA6KoCBY/oqosnXEycVL4x0Pd+IoG16n89bSwK1u3?=
 =?us-ascii?Q?O+u+dkHj3yqRR11B0fpTz87Qu6mf4t1xkM0UK2ghLA0ANAFEdPC/JRLwNFqT?=
 =?us-ascii?Q?mIQVDKlY5w0xAJB9dGxa/2Cv7rXtktTSmRWF1bbF/zm3ZJD824hcVE+nbOjK?=
 =?us-ascii?Q?DuA5xG/eZxNtLX9GjfaiUckxAy3nI4i3zoE+6nU+RgihWpO1u6uD7xnQBpK2?=
 =?us-ascii?Q?v6gv7zlN5kzh3nGnmKlJNi1GumxJ74DwbcvVyCcTayA3fcl/0YIRU2bRnw4d?=
 =?us-ascii?Q?NJJJypKPLeonAbGNiZ3HZVocJlHQnQ8CPbqMsO6Yny6+Y0BXJ+Dg0tqURL3h?=
 =?us-ascii?Q?AchB2yD4apWqLtEOj5N+V1yStVfcWrYn8imvIdhqf73v3QVxt/OnqQLIrIWv?=
 =?us-ascii?Q?Eq+6P04qyOh45yCMbI7xjetXIc2v8KAkJTvF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WeRC4h4tRv9cyjFaFHb82s5hMprJKNBP18j1kKwkXmUU0/OuwxcqXf+o+AOi?=
 =?us-ascii?Q?CZ0K/Ei0ktVE6SAaL4UADmFq7YReV9oTSJSlmZ0MZEYjth2gCJ+i9wPw2k73?=
 =?us-ascii?Q?7xqcGB9UKn5MrSBLwPYCt3dufAzZkG1OwtIQpDi8zlBbuYQdS8aOhowlyrF7?=
 =?us-ascii?Q?WO7TASDBQpkAJ2n1JvRUbs8lTHq8bIs1aHT4HN9ALy9ygCZ5gx6b43pUyHPT?=
 =?us-ascii?Q?4go44jH2+pmzKi5HcuRpIPod02bMC6PKqT9Nx2uREt3SFnq0tUv6Vz2WYtld?=
 =?us-ascii?Q?tzOuQ+Ev2j3JaIZoyt7wtyjJJGCc+5QZS4hIIbdT7DW3W89J2dJaj/CPi/h5?=
 =?us-ascii?Q?2appN0+iVTR/yxT+r6dHUfRi55qgFNzAFJs6a3OewahN9EtQQhzGSJTL6nip?=
 =?us-ascii?Q?DSXILpLsEpjxfcMIqdsiGyQtDhyAXKNcRtzkLj3ZAGPODwQxDwMhEUsAIFb9?=
 =?us-ascii?Q?CAbQW4O8sWyPsT+5wZ/BOBfFWxR7TgXoWMQ3/q3/qLF7uGRykYci0X4MdeXJ?=
 =?us-ascii?Q?qICP6GowZ3RnIVQIO/KcgDbdctV1zZrgXM/bcWETKuC42W3mX3R/aBYztSKe?=
 =?us-ascii?Q?vXYRsF5vlIb4IuB3ZgaZqczuCagMAqlrLgd+Cldj2ERPH0XN5h1YUQ2YVyrs?=
 =?us-ascii?Q?NlZPpUgf7PbWPZ3LmCYgo9d/rH7AIWGt4xtRyz+GPe/zrETPaOc7IuW8TUNc?=
 =?us-ascii?Q?mSWfWzYlTFeWAS0p0cpx70E3khvE0uwrF0Mt4E0OhG1yINx7BaGuLiQ0Z3YR?=
 =?us-ascii?Q?s2yLuduOteclMV3kx5acNVmqFt8qehRzjASG6rynSfFFKuhcGVrQxgUGv/+y?=
 =?us-ascii?Q?Cf11pFB4pSVacJZeleG6n4NHxDDB/hrZUMDHej8/qUPfL6ERbHuqbe9e2HHv?=
 =?us-ascii?Q?7NG6EPWNLxAYcr8CRsVkvihO3z0gaQaH8YsJdbdybqkp9dxEKMufHsCMeIzt?=
 =?us-ascii?Q?27qEEtZIzv13hSotSTPeL7Hw8aAzgVjtyHYwOlqWBivqq92Jj5epndC486T2?=
 =?us-ascii?Q?+htrsxB1IfNINrMjtMg1ARM/VzXtYBXlB+tg5vjM/miEZHJ3DHGin0pm1eGT?=
 =?us-ascii?Q?517g8xajMdUCGXw7NrzXp9QOFqrFlpcUAq7FSn1LiOVwDGaAebfk4/7EhL0P?=
 =?us-ascii?Q?rXGzRvnrOos+RMZkQ1uT/SxuVljF+9gmywbqkgXWEBa89FQms97SveOe3AUF?=
 =?us-ascii?Q?L+MI5TRg8duSwDZAnFFWZEHQbVrab4BkeRK8b4m6dr9ub7ueHMjBbkqZIhLs?=
 =?us-ascii?Q?jDkfVFs6vFNM3HqHozWeZETlfkQbN+S7G5vH0zEX7YO7mOyYBEKF65GBzj+h?=
 =?us-ascii?Q?64dFwF4f7hsG9qqjAYsFiSvy5H7jiv5/qS4IdLDnTh2LC8Z/cRj3upEhmKFj?=
 =?us-ascii?Q?2TI6C6SX5bjD8bG2fa1ojVFFSMTrscm6K/Y6p9zCNXTbR8/6BgBdezF5geeL?=
 =?us-ascii?Q?kxQHSYsyh00rHVmywfJG24RWnUhzYvVJmSQYJW2inQjgEi0MwLcNbnIuf6Za?=
 =?us-ascii?Q?po/Fje4actDC+CKKD0UucEkqZPYTMTCSXh4+bbME/vlFgrVT59zDzKEdCup4?=
 =?us-ascii?Q?HdVBQjI2tNM8NOPmdXPz1Nx2zKMHhKh1esRw7f7+yjw34xomSQpZhWtqJOkx?=
 =?us-ascii?Q?W+gV01yXh95kmTCTJv6SWjY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e1acc6-9b64-48f7-fba6-08de0ad9aefb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:19.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbqoTTkm4weL0P40EWaDgKeMgj3ImPTj2t0D41KdTEBBo+W0y4mrqrMeWuOKjP/oSdlhMiOzpNWG8eUvoE7QpSQ2C8dy0SqmWc1qAQFkCvWIV5/IR1VfSL3bm9HCAkr3
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
 sound/soc/codecs/twl6040.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index dd5ee5dc0cd75..fe813e0960713 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -472,7 +472,7 @@ static SOC_ENUM_SINGLE_EXT_DECL(twl6040_power_mode_enum,
 static int twl6040_headset_power_get_enum(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = priv->hs_power_mode;
@@ -483,7 +483,7 @@ static int twl6040_headset_power_get_enum(struct snd_kcontrol *kcontrol,
 static int twl6040_headset_power_put_enum(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int high_perf = ucontrol->value.enumerated.item[0];
 	int ret = 0;
@@ -500,7 +500,7 @@ static int twl6040_headset_power_put_enum(struct snd_kcontrol *kcontrol,
 static int twl6040_pll_get_enum(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = priv->pll_power_mode;
@@ -511,7 +511,7 @@ static int twl6040_pll_get_enum(struct snd_kcontrol *kcontrol,
 static int twl6040_pll_put_enum(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	priv->pll_power_mode = ucontrol->value.enumerated.item[0];
-- 
2.43.0

