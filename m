Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288306;
	b=slGr+tphyTHlJpWO859mypyNloyf/F4woJbSRh7FCoSbdAydnXdTEgFHrXdIQ3ywp22I
	 V5eleY5KU9HZsx7HDmZA8a5BQ1BCcF/9NMlT/bpGxmF3/0vvy2pHCbxTVhKjbybC/cfJr
	 aUQgw3tTBCIyKI93Bdsgc9IRUH2thOGVVhIQGN4l2WtwWtpXdwva25Y8Ww3AaXpjfEfvk
	 G4CD6nr3N0kPwUspE8BpNDhcOFAi4fAEt3IKHof5t2hOi8g8wmwb0ueKS1O+CwrWBkOpP
	 AkL1itYACBsJPabJwnB47ZweQUwCMYz0wkbGbrxGfsKsOtrX3p8yQqx+9FTzUihuXsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288306;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vZYBtUkfh+XXhxIiTFcBc1QKsYL36z/qlxG7YmvUQ+A=;
	b=2qkitV13OVG4b3TN4Fz8bTPcikMKXOkJ+ydGe03muRQVtG7qUnGpf6qROjntohnET71O
	 RyWqnW3RAy0lNW1xMa8rVq4ynTb9Wyn1ixnOTKOkxZPn2fF8D99DNATMcC7RPgbT4Txef
	 1ERD6gPmE2mw9NkENJJkP+2GN1Ouai299bJId2n8rnkbeMxJWfZYVChX62R7w7OtYpt5u
	 T7jdjJpAJFR9W0WXR0QvaPmjq+zQTSOQeuT0Rb/IaBJcsx6t3IFLSlsxdkjklssCU8Obe
	 yIuHYTKck+/z9zGmVA8qZRlf7wVfYtD/M5S2HHNmNn+7hDasLpGoyL05NexSSKcLz6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=d7KhN7Tx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.51
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40119606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40119606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=d7KhN7Tx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySNXyCEyV+cSP0MY0i3uFrF+4k7K3AHCKFgAJq1cdK+eft3g/SM62fAxnGbkXKoF4h1Ql0sTzWOCrNvw9J+o1c0o0cyFWN1Fn40YOlqYfRd5ljPaBc2y6qHFzgZ8rvIhUwyZfiG7ulWsz1IULdSmWl/2Q8RaGv5Gr4rOfMxZoS0rxxzJqO1VkboBc1wOjeKoz76D/VpS6W8yCCqmome6/MWKm9s/0d9xTxnuTYectFzKp0Elw3QS+pc/u9Ln94Pp1U3c+y39H2hNt4IbiLnK4tSzbzuCUpG+QyUpDonfT0Zawoh1qpCV7hxhoTjzfYLXhIHR/m7yWYlQeeEvKaXI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZYBtUkfh+XXhxIiTFcBc1QKsYL36z/qlxG7YmvUQ+A=;
 b=i5Ty0LYGk9Y8FdD2xDd/6v6DBXYqh31R9P1O4I+N22M2Xt/9NSZ71LifVojMf53SO/ILck51EkjM67TcduSc1X5s/n3vyFq0B+d8yDOoPiOsh36CNmyD3EyiykrXXEZnWlI33/UlxMr7fofMkr00UlN1wW5bzO3OzHTe18gerEvYRfFRT9ucv/TY0aeMC2CpqhqPN6935k6tm7Iw9E4txnb1Hro3LsduIRJaS/iku46Spit3J8ncie9xOFe+pJlgwSp7+M3BFw5/DAkznY+EFHL2C1RgqaWA06kuHKxo34ZiKDoKrfCTT1XC9X00UKElv5vLz2VZdO+Rsb+ZWIISnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZYBtUkfh+XXhxIiTFcBc1QKsYL36z/qlxG7YmvUQ+A=;
 b=d7KhN7Txq2WN/vEwvpfYBLguS1qimcZAW3hJgils3UKuz9jzGzlADWIAqDTCFu22Q14rj2i9886/HNqu9eS63+mISvG9NCBrs72ASMgmy+EGxEGElkYGDm4hNAsa4XBkogAaWP94pPvypN4zlnAynNUtiFjQR/Dr4BfuW4SeAng=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS9PR01MB14259.jpnprd01.prod.outlook.com (2603:1096:604:364::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:25:01 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:25:00 +0000
Message-ID: <87ik25mf6b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/20] ASoC: soc-component: add snd_soc_component_connect_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:25:00 +0000
X-ClientProxiedBy: TYCP286CA0339.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::14) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS9PR01MB14259:EE_
X-MS-Office365-Filtering-Correlation-Id: c2963bf6-8487-4847-40fd-08df3eeaf784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|22082099003|18002099003|10067099003|11063799006|261028144727099003|261102130727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|56012099006|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	e7QXM7V3803I0AOgOBC8jxnS2SlTeLanVyoq+F0t/jRcdIKfpPXum2B1lRVb97WJ7j5/HTlZ1KOhLcvyshuPE1hdl7GUxDpit0ngzhNwI/kO+yYgofR5epUkJoc5Nil5oJFM/Xc0BwdrVIgF9oLl6Wj2Pe5LfdZlqWrCp9ZjupCWrMGfNfP+oc+LQJ4f1q8gmqGmChrapfq4Ua/j7nunMAK+y3PQ6FdPDyr0f1PU7vD/pJGDqSyIeQ8tVZVtrkL7KIWcC3KdF6P+hRVtcx6ueszgBksHsMxESaDaLoKKtawPCI32VMO9RQYuibclNB8dOCn6mqukBMwu8Bagkc2tUeMyOuERoGnEwPGZb4EubfonnI91IHVCzuz4t0YLr9uIU7ejnrqaMF+75SESWbcthB3ki8WluKPDWrjAR1ue+MP8ewazQV/J3dhkXKbDTmimMo+thngDxKaqzGSRWnhaZKZaEFhqJKfx/A+XL4OhLhSf+6k5Bbwk0HWZUpVXnyHCTWWXyBRHrkCidaB0jHLK4W4OHexKMUzNNwU7Na8bbjlaiWCwfi2ez7+48+HnMFSqyRS9vUUMpdcoacttyAbGoGjrKjEPJ8i0K1U5wjtXxEYmUeenYsD5QvN4Wa8bP5lDebhyT3LbohVeA2hbM5AoC+A5wCJTzqLSCaTaVccfaDY8Sx4qXXh/tVxyZldSnb9qaYcLiFDf0dSiK0K/HAhZAVa+/2zZDHnNuSTTL00FbD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(261028144727099003)(261102130727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ghvgvtu+/+wfJ9/Mpn0BuzyBooCyLVF1Mr5qFqQ+QgX9pS6dusPOdwdQlgGh?=
 =?us-ascii?Q?0AWcLtEVFTa+jI7PXGjolYNq60xsvkhp9NpK/L3U6MHigo1i1HRacZGsLuA4?=
 =?us-ascii?Q?sPdEghztK0ob5GfQ0UHK2sW1yG+Kmy16ENhwMkdlOZWJQyAO9woW5l9YEHWp?=
 =?us-ascii?Q?cYXvMYqge5a2Hlf6nbzSNcO2JUouQKde4C6C7cSZvAW67jIpmBUMZJDHKr6t?=
 =?us-ascii?Q?Ikn8yfoK/R7/mXoFrUXzeBJt1uv8sk7aROz/vrXZwZ8u6o/7veDP4ULXZDtL?=
 =?us-ascii?Q?7mu8o2HXIFSJeqQ5A7SD0GCSLXWXWrEC8/t1AbG4nkof9xzPwL2grb2/5L9d?=
 =?us-ascii?Q?DWxLXOkSKjjsjSf8cLGS+/naUfb7Pgha6Ac6UEPiMYqNSuei4CclkbOiWtYH?=
 =?us-ascii?Q?Su/17JOBIITis+TPhvUVajgSnq1g33fBDqfWw9c45vLhakCEpiDVJX9kApPJ?=
 =?us-ascii?Q?eZk8mCGR1h1CntQuTdopO7nvIbEIU6wgm8yZ1eF5OjwoJ888GN+Xr6sZd/8J?=
 =?us-ascii?Q?l9DF/caSEZf7jHHgLAEc9I66mlOVoV1iOvTV3XZUE9MQCUs1NZkKAK0NxmbT?=
 =?us-ascii?Q?B6Uo779OpSEMOeVMWiByfU5wP0+yywV/Z3vZRWcMKh1jqQbcY7js/1BX1pB4?=
 =?us-ascii?Q?gSzU2cGq+WIz5BlN1X7AOvCitUlXV4WMrTlJ3E3AX5nejOIjXihhmmVxdh9Y?=
 =?us-ascii?Q?85PAJR+rSJhuQft78e2L/Moy2SwMWD+cgCZdatIXjeamjs0Qt3UlCE5oYE7N?=
 =?us-ascii?Q?d8LbXP9zwmPvthJiATKqMJkXHZCowDJa93ARvOOKGjPlrZpVPGtQ9i1uSTnb?=
 =?us-ascii?Q?lEjakH2ZvEynTiRXFvJxY6bqbjRLkVpZ6nBfkUEMY1Y31k5twoEloDFs9rMH?=
 =?us-ascii?Q?uGNRsx4N6Ccmsqc7n7NsKKnbbukheTnjC0s5siMDrWuGC8ttRhWjpISVHpve?=
 =?us-ascii?Q?32GerR8K65vFgvTInsnT29mvHWVsit/CREVkNpAny1v91ePiRIDXAjt/kUhy?=
 =?us-ascii?Q?zc4KX6TjXOltxmonkSqG3hiuuKEahZ7QKVwWDhCJlhMhalk6IYuBql+Ttahd?=
 =?us-ascii?Q?G3FV52Zk89uVx0dzLX4+jSsAJug4PMB8GjQjY/C9L0kLpv8p0hwe94A6c6A1?=
 =?us-ascii?Q?NR1diRIzjO9F9DpZ3hNQ9wLJRkDaqD89YNrrefQD01FHeatDTW3hqyvbYNub?=
 =?us-ascii?Q?0jmfDojrNO7R0BeuB2OzRqdBEyyQJPLZ5WZ5yrezFMcZy9jQlSHbuwc9FJ85?=
 =?us-ascii?Q?apAvRnJICgx7kQKjrwD5rcNyYI2rpUU7kKKYM/TwF7stXPAJp9DLbTlKYQR2?=
 =?us-ascii?Q?virXRWRCIfCOIhKOIkfyjGmjnEe0MjOm4kkH64DrjgpNXYKg7rkrL8zEAfMo?=
 =?us-ascii?Q?sA0zJMxtmCiDTh+Pt/otlG5Q20L0y2QE16k4O9BwypSCaeB2Vd3OjpEJgyCP?=
 =?us-ascii?Q?XwWqO4dQ++XpGqfJOj1VJxQ1MKTJjXJ9lggDi6pxjhfbGE4TdL0CEkbD3g0/?=
 =?us-ascii?Q?dGhao5jcIsEnQi6IjYymZnTMNmTkUS2ImBJ0N/6Eupu6vVTwnfA/j9xXHOtq?=
 =?us-ascii?Q?0zxQXUDkf2Ccaj7iat+eVd6GOPpRN35xPPMCexIyFjVy6Ara2l9y0C+MvJgR?=
 =?us-ascii?Q?9cDXfzl9a2M0BMbHBEtISueK4AiTr/+Df459u9BPXhE7blnhZjN30nhEQEun?=
 =?us-ascii?Q?kSgEWyZvpSKjRHTBaR60Ilapt1XtUmazg4JRSVE8v9zyQjk7DcpaRQZ9mwJu?=
 =?us-ascii?Q?yeIOanmn6Omn/J+RdfhSFojeaEGpWbcozmPFW1GVzK1qWWBhVcjZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2963bf6-8487-4847-40fd-08df3eeaf784
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:25:00.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo9CsR1o5x28X3knNkImdjWDuhaWuhIYtjL6ARMCwVpHSqeGHXK5nRt8SbJP3h3LHLQmgPEFRCoufmdptsBdYZn33ig1ALpTVfJeapvKsC7MPsPW31/gwnzad36HgpaH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14259

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_connect_dai() to connect DAI to
Component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 7 +++++++
 sound/soc/soc-dai.c       | 3 +--
 sound/soc/soc-internal.h  | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 93978fae9b840..50101d16f8539 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -110,6 +110,13 @@ int snd_soc_component_num_dai(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
 
+void snd_soc_component_connect_dai(struct snd_soc_component *component, struct snd_soc_dai *dai)
+{
+	/* dai->list <-> component->dai_list */
+	list_add_tail(snd_soc_dai_to_list(dai), &component->dai_list);
+	component->num_dai++;
+}
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index d124b6afb1b8d..e222268d8466a 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1265,8 +1265,7 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 	dai->driver = dai_drv;
 
 	/* see for_each_component_dais */
-	list_add_tail(&dai->list, &component->dai_list);
-	component->num_dai++;
+	snd_soc_component_connect_dai(component, dai);
 
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index e09d283d443a8..98ff0e2fc2e1d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -69,6 +69,7 @@ bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 void snd_soc_component_remove(struct snd_soc_component *component, int probed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct snd_soc_card *card);
 struct list_head *snd_soc_component_get_list_head(void);
+void snd_soc_component_connect_dai(struct snd_soc_component *component, struct snd_soc_dai *dai);
 
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
-- 
2.53.0

