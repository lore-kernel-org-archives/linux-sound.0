Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99999500952
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868081; cv=fail; b=Hbx0DNSmI4ICn7BOJh5EgBvbNOCdUeNOHo5lW8WGKDSVVUq5vdapSoNRV5iNN2GbIQaQptCqcJSX5lLJ+4KKvR1dyqvwPIMmBQnOWPYXfr9trRSOWVIjNInfXbvZQxh4mWSEuADjKfpeSYQZ12RHYUArzsWZqo16xHLnM7Tsy9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868081; c=relaxed/simple;
	bh=52pGof3TNa7pfx0ug2ydjjrwA0vZQqo12XdHK/KgY8M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AMM6x/DmH37BY6GB9LO0W6mscWqOKyxzsM7ySCejRQXURVWXTuxIkDqC831Tb50VdlE6rZnqTYZGlYAgukRlNf7vo9Qyi3XOpoaIBXITNyT+xr7xymwmIh1wL30JaaykWfAIZQD2gWPraplJP2dFzRMrjI3dpITsrtbyJ6keVxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=N5R1xz6S; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="N5R1xz6S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f46DzDp/q4ELrYQBa72OIXosK1RVLd9/sxy81CzpbUBSncDkSWWvLDD1Uefj9r8GiQYu4mc44mGsAQ+l8Bvr3TzLyKQ+d87rqH5a5UPFwIA/Q8aoxpOcKjU691LtEFYR0X2Hhb93hMtLjdWS6jC293VKEJT8TiQFbsrCOsr1oQcuk/I/kQKpAwXxmKzWhhKtOF6Y8BoN6eMe1C1K7zAvs8OgumNUUMSEuY5QClF6GhN2ovcETKdzteG6Ks5QtBSYtdwNp9vvKQyi4ckUWSJEkrfq2uoudH4rJRs2q4SQ+hRiC2zW/4nz9T6MhtIG8fYzgMLdIvtg8weL0DUcDA6nGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nub2GX/UtUXV0jzeIJ61m9ib2LEbo3At2Bak53b4xWg=;
 b=HUIKX8jWV3bu5fpVAK6T3P8oZUmmmmroAH6XBXG7EPDC9vLrJtL7VQuVW1aCorU0x0j9YiWlIw57hBWBV7EqquHjhMBDsEyB4TPwn7E1O3DBfatz/urC9oP3Ahtev6g6BJ55ZKt0B7xk/rai9Rizt2wSvqtRx+FuHeAuQkqwCx21EoCgqelEd1xCDVmTha6rtQwj44kTHTL6ZiysVqx3sMvHn56izC/tghNe6bP9DA9KTskZF/YpXxxouD4zICowPFVM4iCtxpVYK9AMH+33xluaQJzM6IZsSWVomAnw+id8VmlJCBMGUd/UWQsRxlzt+aLTtBSbR/Whk/+gtnQ9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nub2GX/UtUXV0jzeIJ61m9ib2LEbo3At2Bak53b4xWg=;
 b=N5R1xz6SKtZm1m5F0ZrHZzTdlWemdvqfG7bWTwlIbXFOblG5lWdjs6BMmWfaCgEE2QeRgVURuYwa2mOiuERNTS+C0S+BVtChNatIriKr4B4hxAhNABxAu8ee+ma1kQkWO1r9+0NKEDqVZmPJltAuwc8l8PqI4vPTU9D1na7ytA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSRPR01MB11727.jpnprd01.prod.outlook.com (2603:1096:604:230::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:14:36 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:14:36 +0000
Message-ID: <87jyxdqgwk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/8] ASoC: soc-dapm: remove compatibility definition for dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:14:36 +0000
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSRPR01MB11727:EE_
X-MS-Office365-Filtering-Correlation-Id: b5284390-a2f1-49f3-88bc-08de57b8e51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HM7tlVWRvMQqjO0TfafDjXRZVvlC/9T+uHbOBLIrgcZq3Q1EIN/QhpXBYhZR?=
 =?us-ascii?Q?upetadeMuBfGScwK06dPkMv0D/sAwXMC6ZYKev8hnqvFDKSTiC7V0iKxgF1V?=
 =?us-ascii?Q?xjFj17lHkHUY/o9Je3yMYCsWWZrMmOE7uvrTNR9HO5WJyfGFf5VgGQC0V7HQ?=
 =?us-ascii?Q?qvKfCnrG1C0HyotAX8k94xaH2IKXkTn+l+NSaLejGY6lBWcKY+eRfjJXqZ1A?=
 =?us-ascii?Q?DUUDunKvtOKfK20jq3tJfbIDhkWmDGO69aaSXy3boxNWSuZWHgK9xtTORE1L?=
 =?us-ascii?Q?eNnp9u0SKk8c0+hb0StOT/ZVkSUy2WBdw7uy4Z7h4ybE8Eb9yLScHtah9/EN?=
 =?us-ascii?Q?reW1o9lQ9iu6wl4oVppP1k8rguggEwopzM+1NOg8EqlUZxU5/AlbQEXsS6m9?=
 =?us-ascii?Q?UaPGWv0mZjDfAlmxffreW3akj67ccAR8ISTtjwSc5P9laTmbZRbOaM9AKM8G?=
 =?us-ascii?Q?3LFdasWKUSPBuK54ZsQSUX29AxoxjJUkqR+K1g/RoXHs+C7bfLJ63uVLy2l0?=
 =?us-ascii?Q?lRezeaFTqpYhri4AjSs2zD+P4wDVUafDaYBxRsVaOLXDjaNSV5hwVNq+gBIM?=
 =?us-ascii?Q?brW5/pg0+LK+Ey5nYSy6x2pDLZ9EpN3pEYMBLtfn2tmzpuXVVXMKyPSXMEx+?=
 =?us-ascii?Q?AOXCmyKuXVWxTceIvQGVwO8ssEWXlO9YfcjJ+lTnVFzAdeCn1IMPzK9LCrpV?=
 =?us-ascii?Q?i2RS96h68p+vxAeJER1JyEMzUXL1Oo0Otscz1yorQg01kn7EQtAWdjdOXzPE?=
 =?us-ascii?Q?sTknuJZ2dWSii6z6j81eM1Cvc+8j/LCGWCNRWvak+n2gJzMq9X4KVQenTfKv?=
 =?us-ascii?Q?N2PylR7yNXvzQLRxNpOMQwJd6JkFZ2xDLBnAJ4DyfI1bHYTEHzoqMMW3zBZR?=
 =?us-ascii?Q?alfIbz/U0hgR8qVOoe7HY2xljz7YGvM2I1jDh5nJT0XJ2GBh4JIp54h9r3w0?=
 =?us-ascii?Q?z1fttIJu5U1e9KTXZasrYkmwrI7re/LfqUua2FB8VQhC9BkCDaZjjVWDPCz2?=
 =?us-ascii?Q?KxDMkSTkKVRuUjaYVoFXurwLJTNI6FGipGafe+EbaztygCvNVqEojtQLXOds?=
 =?us-ascii?Q?waKjqki2JRBKyPDvn8qJ9Om8xn6eBip8zwEw9C0XiHHSnkzTAQBkznPJ2kYm?=
 =?us-ascii?Q?cAo0ka/vO8gu4RfgGWnHly9nromOErnvV8K37Nub3LX+wnOX3FnD0LcpRktw?=
 =?us-ascii?Q?KAxQ/hdecRPPD9Cn6j8O3mLWqkI/JjbqaKlIohByqOxiOgJRejjtmEXkFuXE?=
 =?us-ascii?Q?uNnTBrN55qXglczEjQ6AWrIBhTS7ps5F/R9SSYU23irPi58kHR5NpxI0vogy?=
 =?us-ascii?Q?wqFcYNIWFhuTOVKY1sPS8/RFCMWYfDZBpggvadYQvIK/9eQh7V0HUO8IQ6I/?=
 =?us-ascii?Q?6APtctbSETwnKdFd/iV0FO+xc1zPMBciY1Iyyj0pPBwTWTy2oRqVUQQr6HbO?=
 =?us-ascii?Q?1mJL8YBlKWBHI1QDkppX6sWGkPRK4GFsy5K8y/2mo0m6wRzJjynW98ZQTbP2?=
 =?us-ascii?Q?F1//llCd1lgEVjtEnRhm4MMt5ptEKT9lHBcdeQAJQrJVlusxbcZvRTCagMy3?=
 =?us-ascii?Q?jk14cejNyIw6CvkezgJD5xqmxbFzoIjPeMvwzA3kSkQN9HKgk2cmhaVbz/QO?=
 =?us-ascii?Q?Jp5fxV7Inb2wVda2L3ogLXc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pqLFTARylKureWlKL3SDTnktW5vGrSBDSrVatVIAL+yv4dpxGTzrlyWccmzf?=
 =?us-ascii?Q?ELJT4ICCgTc1EJwQ0Z5sKKAFosXeI/QUDecph22gJGK7kDswx47LukPx58B8?=
 =?us-ascii?Q?Ih2pqAQSPkGKEa8wrPlNEvn8PV5tYxOoEiG7Jc83nhoHq/5jWOaNi8oBMuO0?=
 =?us-ascii?Q?xzFsAQgL2qIh2ic8KZ5ybWKMtLy6mkXQqgL8nLD0i3hDACv6CTNDk/lR7nx8?=
 =?us-ascii?Q?x6fQgxoiL7MtMKE4sGfLHCbirPTODjBZUEs4nBbh2qi12ArQ8SytxdkUMEtK?=
 =?us-ascii?Q?dbtYlmgN801qP7YI+HdJdcu4COEmQ/oEQnqh1ryhTeXbYmeNobj9qUVAJ/Ir?=
 =?us-ascii?Q?ijrJGolz1kmPe2su/zIZsJS5crZr2i0ZYz+7QvuXwOlL+E/bnpwZ68XXFOnS?=
 =?us-ascii?Q?qAxfGCXINlGd/8K4sLxCNEr3F+NucQRUnEikn6VmdHeCWQuL3J2CRe4V0C1I?=
 =?us-ascii?Q?Es6Tywgs4L2bbmgsJhTLKYd2brZG9TTHeEZiux5GIwDBYoMjfDqHp04Gm388?=
 =?us-ascii?Q?Ndw10avmIOYcrKafZ0TjTZqmBVX0A28sWv3TSWZzPxzFmO0SPhiwZJOnyff7?=
 =?us-ascii?Q?fReuDFKU0zI2/VcU18YcdhxJwCbVOBj9fgjNYZ5Ymkyo0X/F5YWJSjwrSX3N?=
 =?us-ascii?Q?JafVv3WPgV4krJamapAO9gi62gJ62dgdezw96zZc1PB2PpbfKoNurHYH87rS?=
 =?us-ascii?Q?aSW0tinMWSBmcgz4qC6dBXBOjEVKF43WJMdB85awzlRxdjCZ9bOi2f4NwVZ7?=
 =?us-ascii?Q?oblMHlo9nzUukXTx5aFE+Z0g9rpfYw2q4f46KZcD7TwEZLheqUBqOUG5SL90?=
 =?us-ascii?Q?lWYJB8BJCQ0qi9m7YLWB4DoqtjJ9hVHx574sm2EtqKAfRZ07IodzigRbsdFq?=
 =?us-ascii?Q?4+wtq2uSI9iWSjvWuI9IPaKhuBMbmDjPyNGYFahw9gVPbW790QQ5bmKmkY2x?=
 =?us-ascii?Q?uyeM+DPCqwEzXdVzKSqxODWH9hUlpybDXBuncpNJmacxl7hwmgMewl7DiMw6?=
 =?us-ascii?Q?6pyG8a2B7cqwgWznA9kHAmg29V1kJ2IfaRsrTZowEzKLhgY4BvtwV/xNsIV3?=
 =?us-ascii?Q?OQcFEfEHS9aK+VBj92y0xzefBIfrLWdnXwpUyEyUoxPhpo2FwCFyvJZtnV0c?=
 =?us-ascii?Q?z1cXkt4z+g0C7VUdpMJNtmCKxmpF6EiqvWNq7LdriwX5Kg439hhH8SHiIVkG?=
 =?us-ascii?Q?2njqjQFK0nXzTpOIWR6Tvw/sj9+Pm807KDdOFe6k0t2AZOo5j4td0vROTCDZ?=
 =?us-ascii?Q?MqWCZQhogg4QY8TH9bfiiYmAhaoqE7mQ9JPrJayzggn8xjpjY3JlC/8Nz/H7?=
 =?us-ascii?Q?J9I9bu26C9/Avl0ju2oPQWftlXv5yAmbJ7gWTMmsN5c7vG/KyRRLuO/y5Ym2?=
 =?us-ascii?Q?lu2d4gJHHELewXA/54ZV0wDNiASr9LLwLD3WIewRvmQl++SPanuQhQ3cyXcc?=
 =?us-ascii?Q?m6IkSjYv1aKfck++889chznFfx6XKrAdp/zDPGL7nVYcqqcK/ZCAZDB+NeDc?=
 =?us-ascii?Q?sLYIiM1lYZuLn5shonMtSupwnYUtjJAIexRkgzrrSZANCji+A5C6G+zEl2yj?=
 =?us-ascii?Q?6iJTGjUoWphA8jwvaBuU2VouLSTZJv3W6Q6UnFHNb1rFiojW7jlWgcTk0GJ/?=
 =?us-ascii?Q?qJEs8Bk9Uq2XQbP5GBWTJLCBu9hYssJ8lXN66v8KtZ1Re8m99unMl+kIAVBd?=
 =?us-ascii?Q?olOqhidqK46vLjnbwcr0eI0i/e27mFIP9ALJxCaZgJ38mfdPo3v3FacSBCzm?=
 =?us-ascii?Q?HnrcBPzVkS2p7a/eYWCDIHFz8PYX2Bt2ysj1yUpaHH71lq83eOM3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5284390-a2f1-49f3-88bc-08de57b8e51a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:14:36.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6yWvsc7OGif5IvROJHe+xrPKepV6sstn11L8AtG3s6MNef6lIzHpjZBm7oBJOuw59IMyaBENgXe9tVNq4mA6+gRqTR78mOmnrjpE1oLX4RK5hwp3L+6i6jHajjSdhVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11727

All drivers uses new functions. Remove comaptibility definition.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 75941324886be..7d3ba38260765 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -705,16 +705,6 @@ int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, co
 int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
-/*
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- */
-#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
-#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
-
 /* dapm path query */
 int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
@@ -730,15 +720,6 @@ int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
 void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 
-// REMOVE ME !!
-#define snd_soc_component_force_bias_level(c, l)	snd_soc_dapm_force_bias_level(&(c)->dapm, l)
-#define snd_soc_component_get_bias_level(c)		snd_soc_dapm_get_bias_level(&(c)->dapm)
-#define snd_soc_component_init_bias_level(c, l)		snd_soc_dapm_init_bias_level(&(c)->dapm, l)
-#define snd_soc_dapm_kcontrol_widget			snd_soc_dapm_kcontrol_to_widget
-#define snd_soc_dapm_kcontrol_dapm			snd_soc_dapm_kcontrol_to_dapm
-#define dapm_kcontrol_get_value				snd_soc_dapm_kcontrol_get_value
-#define snd_soc_dapm_kcontrol_component			snd_soc_dapm_kcontrol_to_component
-
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
 	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
-- 
2.43.0

