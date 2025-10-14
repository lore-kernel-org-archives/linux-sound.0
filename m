Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A327D30ACFD
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415978; cv=fail; b=U3rcPgFzBbrx52v6/B9mBqY77z2w2S1T7lY9RSb9+/xFP4iD8HMtC1KoLJFp6geJ+LNB2i9bQB8ah9/JHPJSbRDhnxImhvFiiOLm4eRL9dpit7C1kM9L7RuBU37EpqrmhFBWEr3dJftO/eky3QRfCVoYKLER2b4wxCMC8AujiwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415978; c=relaxed/simple;
	bh=YznCCpkze4OTWSpc7vzjMiF+EOCD3PpFSFJIIrKkt7Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bNs1OpsyfOvZJe5z5wnZxAhKaKlHoKnKl9L8YwEzt/8IUxdPtX7GCcEKq+5+8mvcSHqQix62GqYUyZ/PvOnctnOu5EBNsfH9zEjObUzLixQB9uUDFDBFSrxZSLbNvo4qAFx4OquO9vb5tknZNkmKkjOo8pgk0tNzJpmtP7I+KDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PMWbHT9h; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PMWbHT9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnagzOlRtXcDBhpINh3wQiUraq/hQTeMJzlHnd4pDulIw7hoZqULqkLru5xU/9CrdtnU+7+UNpxH2pCKQIZS0bvfRdqs88KCy7+11esOjRBSLhWKk9B1jRLV27CCaAzRy0UfDGLscDJ3CQ+e658Ru8i0nN8Wp8la9uk+yqrad6b2RQrTfCohuRF/QWP4fWL10VEbM/m6Ba0+znoWRlKabljKcfnuw3Vtthix3b8jIAJLiaTnzchtowk9nIYDXzE4VmXwpHXhAn7yRIVU4Im5FNwswTrzeH9c2m9AHSY9DEU7XaUuYUf7jVvwNf00HbahUGABF08bJS4SYDZtbgifxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aicKakwGIJ6MJDx93sasEtI37Uqwh3fiHUoTFltVQz8=;
 b=BwkTiBqiHvmCNvgBdlnRCnzh9wWxywN6KO5sPmW9ORzq0HF/4lPt3FNt8TfQUtAcNvTivyMRnwu3KN7HHryfY9/jDIl3mJ6HRqXp8e5ZP3g8PI1CH/8cgRMHB+/lAN+bw2oGbOwvilne6Lw442yrm6AKy62GVxXvwnChBKP4XjS26hrD2JrPXaiybGM9jqjIfRjBw+he10rMWJSgcpSR0DonEpCvKg24ozpyRUjShWwLbPPysT8ZOXa1Am31lhvW+ALSqNp3K4y/nR8Bbpdp+pYL63GI7nJbfP360P33o5zuohwPre/pbMyVagIhpRDhqMs+VQhXDo/J5/ZoHa7MIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aicKakwGIJ6MJDx93sasEtI37Uqwh3fiHUoTFltVQz8=;
 b=PMWbHT9hBaP11mUK3AcFpD559JmzhhxtWbw3Cq5UF0AmPDZtmQwhQkp6grb9D+gF2nbkxusf6wfpYsBVsFnOi1VhrjwUiJDtE61z32hItXoPNZ9c1beUUcfNKcu4Mveb6m6zy9BI6xjMRrUDoc4EqsURkSGh05WS7zCQz56hrAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:13 +0000
Message-ID: <87jz0ynm6y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 108/139] ASoC: codecs: wm8903: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:13 +0000
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: b37a99a8-8c26-4637-2199-08de0ad9cf54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5uXVjDfXgz6vkAA6NYg4JuNEoRL2RGma4/i0vXkMmox5kwZXjmVq0HBCjWPL?=
 =?us-ascii?Q?Q3Fs1gQg18HpLrMO/aC1P08H3y23GOe5q6xJkx70JHxvLm98Xq1Azt9iOde8?=
 =?us-ascii?Q?IXi4R7b8N6m5spxqNfAV1IK19K7hPI/tcyuXp5NqDjws9ANLPCpkjK5CbfNr?=
 =?us-ascii?Q?I9OARXmjfGHDTvVCvp04Lu4TU7e/4AHNzE0nRg/huwUKR4Yv14DD3IwNMmCP?=
 =?us-ascii?Q?qHpT4T3gNeS8st1YqkSoM46vt1xdkW/ccEdVnT4kX1b2Pxv2j+IbvKK9XflA?=
 =?us-ascii?Q?PxAsIDPjIlWZTHukd9HVmePee46tbBthLYULnQoVsoODSu0Rs7zyuGchicfz?=
 =?us-ascii?Q?rASbNAXrCLdqBjMdAwWLZMWUjtDYBSxmlKH9/9N8yYMV0onWQhEk8uHjRCrF?=
 =?us-ascii?Q?G18KOR1rYBbdKrNllJy56Udl/hT5EJ+gfEullBh69LuCuWbG9WDedyiKHWZm?=
 =?us-ascii?Q?BrprxucH8W6RVD6L50molXWtvtpT4vZA5Kt/klE4uydXIc54qfzJJ+E3yOAt?=
 =?us-ascii?Q?cfTow10BnwqguvV0r2yKW7ZUHYFPoc2wDVY6FyLxcThBez/cxne59Ty12SNZ?=
 =?us-ascii?Q?m8sApuNKClS03T2KgNq2cb8z0vTJ3ZM/lDiAnCCoYF/qGmKEkI6AMDthtMg0?=
 =?us-ascii?Q?HLQf/0vSMWfNMRzIOEt4RGbd29ZoQgw4PmSLipOeh7AZV8pusa9xusBizw6S?=
 =?us-ascii?Q?iXVmIJ4te4zb+q5PiQcVEz7peo2lwvY5jHygAuE/DOlCeLJZARd2EUZvD7iW?=
 =?us-ascii?Q?wahHjnPWO63XFeDc/3aho6BWNh/lrg8Xt78CGVqsRl/0yLt1xT9o+5XX8g5E?=
 =?us-ascii?Q?92Mb16NHN41OlVAUuWpbsEB5F1OcHlmnDC4GFCMyzJJvktS/5Nz3JZyVKFyy?=
 =?us-ascii?Q?uGU1QOPTlh6VwHUTx8Kl69qHkhhrsaMLXSo+eq61IoOGoCKCcxhcdt1iZF04?=
 =?us-ascii?Q?RJ2pse9itiFPJJgppv4Wiw/rKw+sdSJTRQ5mGfc27c0j5E7ZB43mcBcMFAY0?=
 =?us-ascii?Q?Ris/Gk3Smdix/HQO1IQx7mqkpx2PHnTZe3fvjWfcyAwzwO3j3/lz780417Fk?=
 =?us-ascii?Q?/b+TjCzQTaMsdm9grp7uvXLKSgq1n+eU/C3DWHnLcErOFXGXtCcRIZmf0FgI?=
 =?us-ascii?Q?oiUXZYINb8Z9qfQ0aYn69E4/oY2DDYNTEFEAo5Kzd8OHNjv/fz4T9oTwKebo?=
 =?us-ascii?Q?6huxc/9m63D+K1vjj3VS+G4+bYYwGlgdAtLc/2bUtsnz+GdPG0O0TqI0AlK3?=
 =?us-ascii?Q?NviFmbpyzmP7spm3ah4gvLprGFZWxQv8/ZTRN1ZcFLclqL0g18oqKimqGYeF?=
 =?us-ascii?Q?Hsj2xid2Q5Tu+SlpzXfNNbOFpaNF8TI1SDjLPIisfJfD3GOpz4mkIBnRhu4i?=
 =?us-ascii?Q?RIG1cHErVZnpOCFYVQERgTsYzbVDcWSVw0Hr3RgiOGjn6aefCI+GhOlxx0ot?=
 =?us-ascii?Q?VeKiPG6cPv/DdmrZt5NOwM0AfQ5VX/o6aooGGh9VRgK1TGgTMbAeSpULLfP2?=
 =?us-ascii?Q?rOaxtY812xsUnyIJmJbp3UiFE/6dGRIQ2PJ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3vvm+szuT1797tvJvKGXNPGWu5h3sL8oYp5+ilS7fbpLRCcTMhzMEFhjd7s?=
 =?us-ascii?Q?ibQF+e+sYsVpDZrDgD0Yb8pqHtW1X2w/YOm0hhEGndG57uWFeXJ0TjoE0JHD?=
 =?us-ascii?Q?a+IgPhiy9kJf9f7a6y3zEgEONTC5jzeiihIi1EowicQ+2eYGUsoPZNp8zYeW?=
 =?us-ascii?Q?jX7qklYJRXKC4FnXIWDzdIIfhJ+orOWbWAjf56eAvj7iy6S3QfghEQc9j5Oe?=
 =?us-ascii?Q?NFTWfB2FU7UkwXtd1Mr9KTXbQCEN69Kh9BrxXCU01WJmngtb5DVk9K8YtXXf?=
 =?us-ascii?Q?HjKAywIfNJBOLmgfA7SFwUAxSmTP2Fz7snYzKfnQ7GouhOgGal/XQjIfl7hV?=
 =?us-ascii?Q?pt0DkbWkK3/ZKPARIlMT9YYdi9iQMwbEE0tpX52iqUHL+9r2VWEAmh1y2h1x?=
 =?us-ascii?Q?bybn27ZCccrbb86OjioKbIfDCyJBgTUeDmOX4d0sIzhuTmE6DWDyxXIdnUd1?=
 =?us-ascii?Q?085JAWYDygbSBwbWCGIgsIhG+Yh3+Ytm2yqs07cL0kZfZZV2IfL8cEN/AGHh?=
 =?us-ascii?Q?Mn71uYdfz/NXLnfwKFhMul6GLgUjqV9wJAqO6xaAWg8ZL+CZM/jJvFIIcFgL?=
 =?us-ascii?Q?xP5SO6OPM1dU55+Rhch03ivxkEWcf7MOQjuJgF7MDupsQRSTcEdgYluU5LSP?=
 =?us-ascii?Q?Z+pLIx3ehigpypLcpw/+MtDtMu3vu7B6XDNqr/ImiIo3s8rbo6cRHfwZF1bm?=
 =?us-ascii?Q?GjDp8i1pZEm7m/xFQZn1MylTpxeKy4ncxzNETu/BRfGkYcu/xnHfHfL1q7ie?=
 =?us-ascii?Q?yxy4YHqW5rqrni4Kksh2JNJHK2SkBKv3aGNOb2AfO/aoZQ6iYr7rDWmK4qHA?=
 =?us-ascii?Q?IqZgPUSys+YgZQCogex2KkQ2/ZYvdGHjienaZaP7l/ZKLFNxW8RzYhL66MMQ?=
 =?us-ascii?Q?qJx3ENNsVm+j5YO7tqihxdjeRk7vr2N+v0Vmr4UeoEHkKrUV9Pabjsr44NTs?=
 =?us-ascii?Q?qZ7pcpHEMZ7opiueFaQH/yLW/sEcCfsjQAs6PCElitGe6FWc+GChGohq0JdH?=
 =?us-ascii?Q?kuKqB0Qxpagj989Zmw432deZovOIRv/VO9jTBY0nZlN4453yy1DPaZwz4SHx?=
 =?us-ascii?Q?NKmdBRbOmaAppBVyTvVu316BlKO0/RJqoyTTInjq/Bz79sfIxSGIWhCHV1zA?=
 =?us-ascii?Q?bZLCdbSSX1yQbMTWF3pR7YKcBy86nYZXgVcCavU3qE1iD3xiQS6xXIBrXwti?=
 =?us-ascii?Q?qVWcF7OoLKqaKoV2BOlTE8GEblvQIeFLKMLA/FrLwgnXAeupRvHo2/tCP3lW?=
 =?us-ascii?Q?H5B1IQIEmP7Pos8k24im2WI43kWaPdzpYNf41nSrKOnXs2vk9qlp9oQf17cz?=
 =?us-ascii?Q?HG6RX0soIgDO0Jk92YVn7w3teqzKGRZsvjEj4lEyyv6LG/HGIHSjBXh4b2sW?=
 =?us-ascii?Q?4jnKZSa5zSp5q1br9JahUrayktWDeZzVfZxo7rzT2ntEaE8G/zB1ZC+FXWmU?=
 =?us-ascii?Q?CMbXWBA98LZnRvto1T9Tj7UgPX6HdAG1Pv0PytBMAbrqcjRh+9bjMBIB3P7z?=
 =?us-ascii?Q?Y/O8s1H3dEPFsCveaT9KBYTy2KZZUCkiNGjx9oJTJVlVl7jpmifgC11d/hnT?=
 =?us-ascii?Q?RLc67Rn7CDZd0eJ8ZPG6iFDl0RXf/aeP3SRo5dO/WMu3iC9qjyS1I7wXwBX1?=
 =?us-ascii?Q?Y7j8qO8S4tqR9rmuTPNUr7w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37a99a8-8c26-4637-2199-08de0ad9cf54
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:13.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHzN7LIhQWJdNrh1kp/6CgOS9Eq75M2Lo6AinVwrBf21j3ZPI3rSwr2VWEjJzFV86f48tlluTNsQIDFauynT5PkSo5js5WcqgeSAl5sJkfjPY/HpuV10Vu2/Ur9Id6+V
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
 sound/soc/codecs/wm8903.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index f7d726e3052c1..ff91dd1824e60 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -444,7 +444,7 @@ static int wm8903_set_deemph(struct snd_soc_component *component)
 static int wm8903_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8903->deemph;
@@ -455,7 +455,7 @@ static int wm8903_get_deemph(struct snd_kcontrol *kcontrol,
 static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 	int ret = 0;
-- 
2.43.0

