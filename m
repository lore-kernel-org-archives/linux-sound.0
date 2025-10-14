Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA5B309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415767; cv=fail; b=BbJqnn8d/ScXbo3SAWVe5DoNtVFG532U+dVlNobZP/WXwfjACvsNPUp7yFvJkYuT99XmqHGfGK4NdAjeuQWgvxs/G3cc1RGFpkAa4vPzvN0tUstKRmargh1ItvhNW66E1OjAO0cnFwFxU7oiFq1nu1gToanZmkjfcTY3ShjNtSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415767; c=relaxed/simple;
	bh=9DSRWu4179JXt8UwXbwMY6JcSsR5MYEzVqYV0WjgcQU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iNdh/7TcDn6mLF2DwMPSSfWes+dJbs3I/a2JD4tKuyZZIB6M2MmP7knpcl8IuxLzIwiPgVLesBL1ppHHIPIowk+YAISLjZqFfRCoAZO070mpOx0wzduerB48kmHw2ldlYt8UygMQQmrfcZ3h6PLMNPuKtcKZTFT8zegpH8ICgY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jOgpLZ87; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jOgpLZ87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S03hczMMpXTsxL18/8/8EG/W1f9lxiP1CiUvK07NyO/672fn3YAdpM0FYLmC0TE8utY7Qap2rHsOr/0Bpy+2WC0lA2LISv7ual9nTX9jZztLp3XH0r2dGJ/CrXg9dKokrexC8Uyook4YYW8rSamAR2nkzyheeoiElufWk8bDYmyVnfY82zCikT3Eo9p0wxfCsI7KaWxcwVjogJ6Vayyb09gsIR7GJVO3tELk4RkWz9rIE89M3I6Qwd/WIhekOvSdEB+Pc6627o947pzldBrvh3P6zxKxpL6C8pNim9RYTEGDgAANmLEUa2bI5vOeRMcCeSBpBMfvgo5os3k3sql5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9j+2PjOw9CtkV9iTKNO8XMLOtXa0JLwUXHd056gUL4=;
 b=kJpn8upsPjg/8NJEGNZ2JJAqS836UPuNY1cpr85CC+DTVwGWjUSY+J4KdqdxE1KKXurVWkYb19wUgjjA3MtLFwDOJaFkuM0xf57LglkDXdnvDm4hv7W6nz7lMA1+xDoUR8TI942g4XN6Ih6iHj8GERXxb3zEb2bcogbtHBYjLbd57/SKtBE/9UuTPBjPbsm3Nghs4ojGnown7D/MOcb/eUDy2AsVn+pYSCf0BpSnljAEyn7jYnAXNbKs4R97FUVy95Xz/6dAvWYU8tzNBUmGZ6rVQKpBtji+0WTSYIV/TIYdffxy6r40T4jipuxvl6/5Rov66jRODXQC2EWs936R9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9j+2PjOw9CtkV9iTKNO8XMLOtXa0JLwUXHd056gUL4=;
 b=jOgpLZ87rw8HPgMwa+6DZNRme/wDMUBqwscBFTFhoM9Qm0j35Swgb+F5OAwSQySFjqf6Lg2ueWpHcAKQgYYXYwFMa7Lmjm5UryUBHyxE0PUBeIC8m6HPgYo6nCStI8f7JWxu3qhT35bJLvnPI0wFYT3csf0adqSMrkPUN6dOw4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:43 +0000
Message-ID: <87sefmqfho.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 052/139] ASoC: codecs: max98925: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:43 +0000
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: e4397660-2254-4216-ed04-08de0ad9521b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7PRcUpk6cSwNGRjY2CWQOk5Ps72El8Tr8k8y+W2CdUd6k4Gedkg1zib5R668?=
 =?us-ascii?Q?PbeZF/dHvN76nAf3OOUQngncS9W6snN2Caq06USjeC6BF5uxoYWZFbLyMQwc?=
 =?us-ascii?Q?5OdBWjeL9OD6Nvprc9Kwr3BF+Ir6xmqJaUvM6C4+TQefwJVGBj4q8PU13Ryv?=
 =?us-ascii?Q?xQ7272r09RoTlnNlxgm6uHO8pz1ki9NMro5S23/kIM1iyus69qy7TVoUJRZm?=
 =?us-ascii?Q?75d+nEhSOzh5XPoS+YoiBUatu0pMk+sWzvXpaEg/WC2fj6S2qk+hrX48oMLd?=
 =?us-ascii?Q?Y+qQjmkTMxCYpuyd2erDnHgdrilUpf2MyqXKcXFtnFmsFtxHK7qqh2jd0gox?=
 =?us-ascii?Q?k9iJgRZuca/7rcwumisoFsdSIMh06FfLkg8u6H74aZo1Zww4q8e4H4+mogx9?=
 =?us-ascii?Q?hN88spBtgvepL7hLr1uxfR9J7V82Shcd+ouHt75m0K2YOwP+2efJNeBHpOyb?=
 =?us-ascii?Q?CE7pdRmeFey7uv9GNE6bbSDg2DxmVsJdiu1+c33uvC6cNhlfQo8Uj+8S/gS1?=
 =?us-ascii?Q?7AqluErwGicqSlXXO6Bpns3Bqut8ZaF8y+J/0tZ52jfxciU2Wdy2RI4rT2TY?=
 =?us-ascii?Q?8977dFwm2lveepgFsNyol5f1qsikBXjM1Jr1hmx4x7+NlZsJSXE46CHuihJ3?=
 =?us-ascii?Q?9Rw0/aG/O5J+9Elq7VPkbB0a65HYjrWS+7Odeoc03llE+h+NNqywJlDFhVB+?=
 =?us-ascii?Q?Ita4Ny5FkuHzBIKlZ/8xy9/iGS+yxBMXhPZhNDuxPM45p8NSIRM9egnKmpPK?=
 =?us-ascii?Q?VyVM8mG0ZMSqMOXPnCLEQo88dTkglFT4S7IVL0FZZsJzCy4wNh9de2M3bkDw?=
 =?us-ascii?Q?SoYv9n0nf2i9RDinG+vtIafdca8ZgNcp9DF5B3l3nFPzrRdddxaJYXMcE90j?=
 =?us-ascii?Q?t7h/K/xpVxKy4l1E/zpXRRGByCIlzb/GxnldY2CTR9gbTGyXfLNbqb8cbitJ?=
 =?us-ascii?Q?xS59Hg8bpfY2MUb8c5U/fRxqMZikX/Cv7DJakhkUnVspXcnuzROG25gdFgN4?=
 =?us-ascii?Q?tM+1dlFprjSGkNqTzHwIl4kO8MCs1Owwa7omI5mGts+I/nUxuRBmB9w8Dnt4?=
 =?us-ascii?Q?s64cTTHFRuXkF0ZnuOfN7+X0iWMjwVwHcv/vFgUyDopINfFoHJzV+DDx+5xN?=
 =?us-ascii?Q?oYFzOSU84yD4B2keVYmu0EmbdJMUkcScxBLBukV0JbLhJhjxBe9k4MFO8Syi?=
 =?us-ascii?Q?eRrhB8rKyb40D6SC5p3huMGXj6HzGf8E6tXowf73+X/pZgriW4P8rwKxN0AX?=
 =?us-ascii?Q?AqLqm+KXN4cAenBuBdj0oMAuSyezxB+r3uQ5RIOlkIV7cvOeBSV5rTbu26Ce?=
 =?us-ascii?Q?hftcMIPl6mpJHXAU/QVRowJgyPp31QgcmfVPbhTUw7QA9A9gmcqIoy56Z9Fi?=
 =?us-ascii?Q?D7mrpy0VK95D9xW+uxwqNaPLIjIwPE4JDS4Hmf+Zr5cFf60jrxUuXaKymiXQ?=
 =?us-ascii?Q?BbjeBjazpIv7khKAl+KIcyuC9jT178/JhvjAY4itBGaDENRlaoEbDHMyXvF9?=
 =?us-ascii?Q?iDTIO69zqF4LC5s20cG6ZrcgwjLOo3wJd/Az?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V053ue/mRTIUbRT8zFFp3B1M05g978+d2h5nfhELz8iiiHBcorWw2H7MvgGp?=
 =?us-ascii?Q?Jx9Jzh1SNpbdJm7WGmWKCouzDEgc63Ju+9+3KmFMNhJtWbE425wek8qjgF3+?=
 =?us-ascii?Q?2e2dagN1/VvmcYJ1oFoRHSPZQoTFwyCi4ZC3IUTzoATyvdHzXL/xpNhVlaSv?=
 =?us-ascii?Q?c3F7ERrsJYXG4tgNgmsQUfMg//lNKP4edlkjX95Z02a64Xb0UGyeQ16tRW0z?=
 =?us-ascii?Q?+1zmTahizRKwDfPTCRBWz0gN6pyLnF5OP9QLBLwX84avI9iy+uklMWQiiY30?=
 =?us-ascii?Q?QoB6hXwxxbg7CDcBvKfT4oZWD8c5w89lsE47RXmYE+BcBh+NbxIJA3WJLkl7?=
 =?us-ascii?Q?Ch6q0N3Bil+sTFXEuS9YC2NxKHR0f9AEEz2Mv9aMVuuuzuGNNya+S/MOqFzO?=
 =?us-ascii?Q?h+RCOjL5ARC1y+PPasSb9dwuEV/X7e4NBo8aWsisjwJKRiqomwndD1LbnAjG?=
 =?us-ascii?Q?JMow8oio14XHIoQbByoU3D5uG+pNaMa8roQdxD9yqPf5VdzQexOAstL1qg13?=
 =?us-ascii?Q?/pKUjMYOiXPLE/fBzFarlxCFRw/l5iHNLrZi6cXrCfUP4Fulos8LBJmxRQ3r?=
 =?us-ascii?Q?+wnPOZLoMeWCCHzXC/ZqSa3waODLIQ8WfxBaxLp1nqH+eXdfY1H9HLmEHtip?=
 =?us-ascii?Q?vYI2chzdFSVbbfSdaUG093NTsvLrIVacxhBanacy4oL9FFGB45zY1XF9xfhp?=
 =?us-ascii?Q?0j98aAv5z3p+Ey1NW2kU1CO2Hn8UjjnJWSLXDRgnaZH5sXHY3EFZP4VH9ypY?=
 =?us-ascii?Q?WURYr79/PHhu3KHAXiTA2oNvzjBxmzO0sOCn2dZiiURgbcPsgpBGCkLxArur?=
 =?us-ascii?Q?iYbpI08RzJaLX1uhojqPlNL6D1mQ4dRXh+e40tRUvDy8T/h36pvzTcBXhf8x?=
 =?us-ascii?Q?Ri9TQ5NTeBSBxRh1L1t0U6KuC80KjifjmqXWJA3SW+R6xuGcURX9mCemvDK9?=
 =?us-ascii?Q?DNvG/adshBUBf2cbeDc/9F+L7RRRSmlp8OJmtSYXRQICRi0epXKRORmEaBOA?=
 =?us-ascii?Q?0UIIntm+cGjh4Is0urmxhNV9EDpEMndTU7PHN7InPtefwb4jYmu1Hnpb8Hm0?=
 =?us-ascii?Q?5GpwJNAP3qlfoFHXESZBQZJ7Zj6Ar6vod+7+7cDJ7NeHFibEN0jpvXb6jy70?=
 =?us-ascii?Q?IFe19IPleLJa3uDjD8CtMneoUzHyNlHt23kGq9Jt7LAsqpuWD2QroqgV+307?=
 =?us-ascii?Q?UiX7O9qkOqP1SXTOFUHXmExvol1vNyNmy7msQzB5EETKRgKfXdJgPcW1HqV/?=
 =?us-ascii?Q?yS9+v38CEm+Hvi25YGiNFOu35FnCg9ikX0FxTI823pdP4iqtFZg+TExrKxWL?=
 =?us-ascii?Q?ABIpoYWtp0G9z3nyn4GOWFiiQe6vmIdCBh3XpPL7gKJJUyt58czxxeafVzQZ?=
 =?us-ascii?Q?xpQBILhTBLiQZNrr7u5JrJx88NXjFLPcyELPiHdUgPssJ6udBwamleAVBNXm?=
 =?us-ascii?Q?K50Y9w0eNnXf55XmxBrRzD6cEuOuCaWCkmnhT/QtoymEUim4gaUxZFxvF6j7?=
 =?us-ascii?Q?sT/CBVS6oiR5CYgHQy59AlSXvRl/ddTz4lSwUB+QbiHgctABSMRBceRvJ9CQ?=
 =?us-ascii?Q?aKWeQjF108sR755mtNbgbaFyiIwn260bO0YZbnK58myXyiQfrIP3WbzjYBOP?=
 =?us-ascii?Q?7/CBEt7+OSiM8w15uTp+rvI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4397660-2254-4216-ed04-08de0ad9521b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:43.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCnpTAHKO3Eo9huTH3zLfakZeHAZIcsTR8on+mTfzRIoqhJ7zu1Pm9IJJOuvWWSl90Ue21Oo4bBYKTGKoKIg/PRlS9XugU/AdzxNdusC35qBOPmvwFExMM7p5g5inyrK
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
 sound/soc/codecs/max98925.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 66c78051bd098..124af6408d966 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -97,7 +97,7 @@ static const struct snd_kcontrol_new max98925_dai_sel_mux =
 static int max98925_dac_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98925_priv *max98925 = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
-- 
2.43.0

