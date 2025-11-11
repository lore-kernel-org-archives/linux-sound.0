Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C331C19992C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820643; cv=fail; b=i8z3l/mFfh2S3mYX/AnzlNwDvUPJQBRJvEMgp8cvSB6J/6mtxZtMCE3Og52rlo/BAyop6kdMggblH5lmq5SrZiPBYNQul2VnwkLwenPUIQgV9+Ux92sdKRD1WayC50mjVttZoNhUITfYbY+heB+zNNqEYA0FRhCDtwJiYbbc5ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820643; c=relaxed/simple;
	bh=QB0b38yvCLyPPSNxtTt5nc6Hv122igeYeWozr0HWl18=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YYRDgI91W1v+EuU769OZ3dCUEHXENLQ3VnrAdf9ZfgS0eY/03jZ/oEq8TJ1S97wbplt9d7/MIOHtcaSQ0KAo0IRvOntxPY/6XxNss+cJAz45a34LyIlSmarex8N0jq64FabsEHL5oqiaDtMbXZUnZfKePO5hYuLwdWkFIM9vfJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VuYo5Qll; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VuYo5Qll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfOIIQm2FnkTP6ma30EK6OQVAsZfhKr1DGFNXmOf5o1Q86OI7I80+/0397RzgUF83qm6cYjisX5T81k3qJBlxeLj4daVWPH/69gdd6C3rbUAxe42Q0/ysLbzLmOUmWCRZF1GeQpcz442SMogOALbJBK/IrBuimIi7+cUS6VziJdvZ2FKl0k9znI/tQrBdUdQlnfcsOe1JEkhB8sJN4jIUf2BVHQIRB2dL+GkKijtlqs14jNvkOEg2vvF3oOe90yWQebqjN2yTt4q+E2PQUMxmIInaLvbJ6ElLEm0XuK48Efwj4RIzwf0ossBTYQQfxmIdDNzsV4KBPUDApurnBKiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+3ywU/1mygXuGxLXs4O6FwmsAkEv/sCseqPZy/uHMA=;
 b=OzxFLD/rUsxKfDlYNQUN3InKVEU+9qs/pvD41PQp4OFWsdbqUE9gqZsLA3pZPosgK/dtM3ybdU9jhQzZEIlQ4hlwyfcAZvfwKlQGvbUhnbJl8AZjpecyWYG82hRf/OCyAtsc8RLn4qH0JQbQTXH+Kp2xBv0Mo9l1PPvRGDAm0J0w7oFJgOKz8NvzZM59n/PYGQqukTUXYNEQ5b3Kb1Gy8R8zDZkHgtAjSauqDlIktv5OESDTweeUMnJTTH6c+ADmj8Yt2YnabzsP7fUlHiDbUwwYQeEqYkxK4y4bN4WkrSpofvtXBIlNcLdNZWXeLbZcm0/NR2GK3BBUtubpnC8bCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+3ywU/1mygXuGxLXs4O6FwmsAkEv/sCseqPZy/uHMA=;
 b=VuYo5QllhYRr2zYdF4kkdQ0fwbo47x5a9MnXNaN+lsHjkYwshkOOEVj8KwCKtRn0Vgx63oKZ1H1ZBgjHBwsVXKFyDwdt6VyNKbRTeeGrUYxgWRwkTWGDrwFzEQ5JLva9en4f9RLjvlshi3ap+4McsWW6dkw1D170Nd4KDVdXzRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:24:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:59 +0000
Message-ID: <87o6p94dsw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 091/292] ASoC: codecs: nau8810: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:59 +0000
X-ClientProxiedBy: TY4P286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f9530c-4df9-4981-65d9-08de20b89c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9aVU3zuovcNpGj2IwlY7v1IMCqMy0kTJkjNyEJ9XrRoOytXb3XAIVSX00T/y?=
 =?us-ascii?Q?ytE7MtNKmBlVdL1sbC0OL0QIiYNCUjg4GFHHMbNoLCjUiF/7j+cfH5de4ErF?=
 =?us-ascii?Q?OxpP4dzow7v2kvigzVXJIdXjG+ASO+lxdanuU9eid63gAWLJ6zZOaolrT3Le?=
 =?us-ascii?Q?W9t0QP7T8crcY2nrdULzDKv0IaVQpgCC640dVbksDYFoTbMt94k/VCt9NJVb?=
 =?us-ascii?Q?dAHOzwYWk2D0skpb6miMq22b+e3pJl1kom+kw+aROINt4UJtJ+8Ob69opIvZ?=
 =?us-ascii?Q?/wo6MaDPVjaOLqPGoWJPLEzJ3JDkRyfxHYAY3W7csQ2QgiCxWW6DjVcLy7o+?=
 =?us-ascii?Q?583D9+NO2p2eAmCUbapeCxKngnRiCB3PvM2/u086EC9kRL8u2tPsu1df0CAC?=
 =?us-ascii?Q?IQGu8dWLMTZ9U8IM/UGdprWAwnfaKKrhxB5JOr6V4EewFNpip4TmHnDok40a?=
 =?us-ascii?Q?3G4zvkoOl2omeCAI+08EYnKM/PK3xBifxp6RrYZvHTkFJ28b70qM1sonS6Jq?=
 =?us-ascii?Q?iPe8taY6B8oADaz9ugLDta4GrQvwb9t7bxeeg456+qhFy4ZhAvo1kRwppp4I?=
 =?us-ascii?Q?A5SoHu2ZSANUcrbxiICGoEoaDYC/toIu1VfU5u9FVcjXQu8BgdIcuLFfAXqX?=
 =?us-ascii?Q?4SuTNhpeIAAsJtcnauVdU3uZtUJ1wRJcyhHLziyOM0lURIyRpPhgRrJWs5Yz?=
 =?us-ascii?Q?WUR82hIoFZWFD9UVq5Isj17L96Geqk+BMwMa9behWxqF0w23bztmlhTXcpAV?=
 =?us-ascii?Q?A/d7JuwALfLHzfiYjvEQXA1Razk/6sk4EfN6JHqFyp7/NLklFKdVscz8wCLk?=
 =?us-ascii?Q?I6tAO1lzNuALBY9fkgkYxB1aLdAp/s/j89GK9W2ff6vtmd8C6Sm206wXxHmo?=
 =?us-ascii?Q?pkuBuE/wytWJue6+5QTe4T+aAMSnmnMBbUawb6yHWVrUIXrrXRGUEc4av2oL?=
 =?us-ascii?Q?WOMlZjWTGLY8q/2nHoWGR1/LSJqtmSmaW09S3dSEv1XYyDjoMarYVMdLccHI?=
 =?us-ascii?Q?b4T0kUB5TwOgNpXd1P2doUQ2yZe/KOyQfQa7fFjnoqUJ3T5WBRDPFnu7DWcn?=
 =?us-ascii?Q?ZoXBOQndsUjCK0OqvTOA7sYK04U8csnj4aTGeiYtMOHApRhVphxffGQ0SRjs?=
 =?us-ascii?Q?B9vKPxJoGgNtitjbS8Ph2K08GUk4oePPARJ08JdMItsW+44UijubsZliclbM?=
 =?us-ascii?Q?wu1ZyU3ABu9iL+1SoFTlLQmYt4ixmClFbcVVInR2UOJ472D0Unqm2BkNzybD?=
 =?us-ascii?Q?OuyU79k3qfQlrWPjtCX9IuUhwoKdWr0C/4S8Odz6GrSU6IYZMxiw4P/OFuPd?=
 =?us-ascii?Q?r/BgC4xDsEzuQzPPHOiacGvTbFddVESJgwpj2LEoliZ+ta8+tH5n1+3MKSrH?=
 =?us-ascii?Q?lr8PPzkbRc5axcy3XPWF3hOHqzVzBA+f+e54qFFiFKEroV8bTTFufiC9nEf/?=
 =?us-ascii?Q?m2hKxq5e7Kd1g59/1z8+dnAb1uqlaK0Tl9+IvRlY8Ah1a8LCYH5ifOoj2mf7?=
 =?us-ascii?Q?i4qvEggXjWrdaBnjJE/Kf3g+c00eZIyCnqFi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7eH3EenPPP6SkyA8DTc0eXEB18B7rM/ryxzxGy1ic204+lUgGglfzRQZWWRX?=
 =?us-ascii?Q?UqT0Zm5LW7j6+HMTgs9OdRQ3rvtHXCpb220UbaJqz7hpUmXRNkYp+a+jIt6X?=
 =?us-ascii?Q?3+3wMcUrujLw8YpnE4kzM7T8KfR2EYpchqYSHcST/sBZR2+2d/CjXZq2a5XD?=
 =?us-ascii?Q?EI4nx9rjRYjN3GqMbjjKTzxVj77I86bzH1MKZYX/9CC07v1eZu5frDJEQ/Og?=
 =?us-ascii?Q?epUBlVwh7rhCxqcN45MFdeUGmlr1gZ+LK7IRGpCxxkKtQkX2hX65iB7dA9L4?=
 =?us-ascii?Q?ga7Fffh+6OWxS3cJWUluglV5fM38+hLbImxdz/htHmuf1PWfDbwjbC85d2VV?=
 =?us-ascii?Q?uNP4aPYgtVG02TCyFprcZJ1+Js8rQuN60+XyzPQmD9s/mWy7jVWsFklefSqs?=
 =?us-ascii?Q?cdSIItmtv0/pfZEx3IvrtB8gtu1KBmFbjBaITgT2fFpeu0jKEtZVlU/JOBtz?=
 =?us-ascii?Q?UEh39j8Jo6E9uWW3oky9KGw3YmDLCr4wNdOc/u9JuTFtufRHuj8IvLavxRZo?=
 =?us-ascii?Q?PTkrwvWzcawF4hQpVaqtgvgYKG+J7huldiaD9VR5MQT3bW3K0Eop6yRRQ55g?=
 =?us-ascii?Q?XRfATi5RnK8Ps31Y19S6s7kJ5dyzud6HLI8z6jEOifT+5tkfuejNzzcBSCax?=
 =?us-ascii?Q?hWtNHTugj476pvQYGm4ue/vXAjszZgt6DE5AbFIUs891t/gtNbMJpwBmZoyk?=
 =?us-ascii?Q?p9Jtdw4GzZ2laGZ6B4kXZLVSLe8IhAWg92/ZFgskMjbBtdeW9yEWY7jEF8fh?=
 =?us-ascii?Q?eBOqDUgcHhzzv6yOhH83lLEZHjEx3kLA58NZOJ2qTYxmwpmI/EWFfvImvmqV?=
 =?us-ascii?Q?hrwMylz3cG1XZqSYuVh/fZCN6EXyJRPDVHBNvC2P+7GMc8Rb6Q+6exPrcGMt?=
 =?us-ascii?Q?MHAbD1U/RyNiN7v2cRufJVwHWidaGabMxdKr81UQ6NTwws1QFrU4M9CFf8WX?=
 =?us-ascii?Q?BZWhw5oXS8QNQwbCV7OQUXYSjdyeUv6zWakygF2zOSHa5vUnewy7k1uKTnh7?=
 =?us-ascii?Q?eMOLwU26JQgqT+hIXq2++zSutpH4vaHUWE94jMia3N7nP9GoEp4YFMdzLr6T?=
 =?us-ascii?Q?0328UDjKt6hG9jQAmrjOd2tY25oJTtYEi1mcS9S+EGXq5LA22W02ou8anWqS?=
 =?us-ascii?Q?nBsEEbqlaK1iLYxS1TmGCkCkvLzhdgzaQ0iu8IK9LNUhLp2KgBA/ApAlIy0O?=
 =?us-ascii?Q?7Aaq3T/3IkRmSEu83WcslWjNYeAVgq2ua5D3wMNil8d4vz81qdLyv6jdNwTB?=
 =?us-ascii?Q?tV757CdHcMaarzozbJyCK+kvJPGQcB4QbC/yKSshnDxYxXFrcE9/SLSJSYsF?=
 =?us-ascii?Q?W+N+Vy3zDXonIrAJMPwqu9oKyH6nqPSiPjFXBYgNHyBu7R7zn2BRdeKMIuaq?=
 =?us-ascii?Q?JptgX1pFA84YaxYaVlzAr30USQz5phdB6bxqRNUQsBhghaR99vh0wtS55bjv?=
 =?us-ascii?Q?TO2AifW/MwCCCtpdRw8QbMvfVbl1h7KrUXqsA6amUE69oZEyo8EZNm5KW8iY?=
 =?us-ascii?Q?KYD7MuSgonrEtTNOWYE1QIgB9BE6qhlYLY0Y5jBB65Y7lOW61GWAhtGKziEM?=
 =?us-ascii?Q?xwCD2WogiQKgmTqreFbi6csVWtQ4oZKrXAD4hAr4QH68j28tNp95ov0/vNCJ?=
 =?us-ascii?Q?W9+2fHnelT7d3fKdQ/0++Cg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f9530c-4df9-4981-65d9-08de20b89c11
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:59.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 565ygtbdDmKmO2aiAHPFZLlB/PYPrufDlRGJowWtjifzEFv7l/5jUPDW8lVwc6SMuNyEe/bjNWz19J1c21waxrhchoLDyBtSFdiTaCv0HXx0DmeT5g1fj4KRgt+TpTO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/nau8810.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 54ff8dd82f66d..9870e62d372e2 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -775,6 +775,7 @@ static int nau8810_pcm_hw_params(struct snd_pcm_substream *substream,
 static int nau8810_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct nau8810 *nau8810 = snd_soc_component_get_drvdata(component);
 	struct regmap *map = nau8810->regmap;
 
@@ -790,7 +791,7 @@ static int nau8810_set_bias_level(struct snd_soc_component *component,
 			NAU8810_IOBUF_EN | NAU8810_ABIAS_EN,
 			NAU8810_IOBUF_EN | NAU8810_ABIAS_EN);
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_sync(map);
 			regmap_update_bits(map, NAU8810_REG_POWER1,
 				NAU8810_REFIMP_MASK, NAU8810_REFIMP_3K);
-- 
2.43.0

