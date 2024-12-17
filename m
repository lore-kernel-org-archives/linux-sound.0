Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EC360DCF
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734398605; cv=fail; b=tHW76wUd1uld1YLBOnrjy5gYHwJw2/8OwcPGkRMC76YZzXm1zGp9AIQHCzo4spvuJLaNgireiDEhc2IAEDZubXaMkQLfNRN+hejbnZxeEaQnqn3A87Vmu2ayPpDCJTPx0KH2CVOHmqzgCkCKp/ZcO0qTZUoYPsOIfhfTe0D3jtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734398605; c=relaxed/simple;
	bh=oCAY7ZlS67KCCQsEZ3Dtv/bg5lOFXvDejtCNwEXrQlU=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Q3PFK6vYbJMSghJMVlJDx9/MZGErqyrWoWpig+/gzgi5mtOWwM6FVqDSsnxzHkkPVugiSBOSMSWiBcoLEHhasb4Nm+tSvd4JPOeuYLpvi3vqETzqRR0Xgj/cYfgr2kmlsKVJZyD1BmDkTgUOElCxgfyadj3BbOOVUXvLXJv7/U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q4TRQImy; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q4TRQImy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON0lG3CngXWseXXxrbIjka12RSJEtXXzlbtxlSkzlxwctDYe+4whkw2OvYkr15jzHuso5adxtizfmNemYFmDifmAuQQmH03krc4JzSvVAsrZTNTcyX0kjQ5ETCEZzCLO+wzfMCrWFz/2PU9wQ39ZlKRniimdgO+LbAQjWxtE2MHGC4enlx+lpiLr4kAOGZq1lkPnCGLJB4eVawyrhYCCDq7Mu2X1KzotQurpV/S6OGWRLK+q3igi9b0oHKRPEXEAwBehrQ2kWV5hZOVTTQgBOyIYAjteN6Gm1Qytfkmv9wZoi2ixCiCnv5h8f/Q/xNAfqcQyQQOcwTWOy5MQ8MRSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DMh3WpPLuXCgx1CUcT7DJ8xZ1jbRMldvtSspX3DcH8=;
 b=IEE86234sFGGqfeUkNnQC+HjfdiUPLOQIo1WdtFxQymI48Iw1Ky6ga55545ANBVnnEtTWIB4PEtoBVaI2E6PWUxgnpINzPJ8n6EQEwwjBAvh1jV26s/UqI39k91I2W4RBxz7DZDc8qSXFTUyXTp6Xjgm1ASGYQsAsD1RmMpcAUXYJEzbZi28dm++orMyFmbRuuZt6WEuRpMx8KFaCmXAUbM9LLz8viZqN6UqAtm6p/CX/eGwSkOO0roWSc39VCd5hdDM2tVyYzUh3rDC9aastfQnLoOn64hm+nyBdFanQRRO5R3/LFn0NHv63b6lGhPL3I/A4UJaBc4QIiAt4b+5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DMh3WpPLuXCgx1CUcT7DJ8xZ1jbRMldvtSspX3DcH8=;
 b=Q4TRQImyhU9g4S+GWwIBihLJaMJM2ZXH/oy1vuqwzqDmy0Gs8wL4O6mUJ1lIWm2U4xmdR5Tmt+w7k3xlzrbEGyTrUdiz0JEmUg6YZvhBwnDNtSD2aO1yo+UXqSdr+jQdjn3OYpgX/DmYzaykxffDa856QMrT3jvMchXm9M1zWyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13698.jpnprd01.prod.outlook.com
 (2603:1096:604:37f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:23:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:23:20 +0000
Message-ID: <874j33nlvb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: add snd_soc_dapm_add_routes_with_card()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:23:20 +0000
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13698:EE_
X-MS-Office365-Filtering-Correlation-Id: 230430ec-834a-4730-9525-08dd1e39649d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?diIIEgObyfOyqm54bidwE5suZ6f0lkZIfcLoUzXe8LNIddSAScCN/XbbMy5k?=
 =?us-ascii?Q?tgBhjYQv5S4LC/HjwO91RGHDx6iAK3RW37pK4ZcWOkAIaQYLlDDT7pT89tAn?=
 =?us-ascii?Q?utNO2C1/tUs2y+5zPvUdGauWwzOg42a1oHHExmR0S9pS0q2YHGJvm+rG2IuW?=
 =?us-ascii?Q?VO8k1xuCakaWI/UeyBEYy4n4yLdMcbjmNi1SbWZ3Lf8xnHNXuW9/NuvLGzSq?=
 =?us-ascii?Q?So1eKDBDwWFAGeT/WPkXOudmtnJSY3pdia/wXJqbAd0S2aZ7oITO/Ky637UX?=
 =?us-ascii?Q?B1Ydzq8v/sEcqV1/Dzv3M355xKPQ5VJdyZ/rCaR+P5QIwZIvVNdn0mFLAi/B?=
 =?us-ascii?Q?V7i5qELmfr38B/pgBMM9/8X18GpFFF3KHYkPbuVT/dZ11mNoe/6rWwY8vVf5?=
 =?us-ascii?Q?e/hZZKETJVfFozflEOOD6B+jsnsER2a8S3oTQt8/y0jmr0isGYup4Mqv9Qdn?=
 =?us-ascii?Q?bP3uXwpAo7IeGVumny2uvaLHsdQy1hxd4/02f1Z1NwkpMEzBY2HB4kunJhG1?=
 =?us-ascii?Q?xq7/Ty/qosSNMV9EnrsTooU1ojF6x228F4C8g4BR8C8XjdgscrWRMtN0FnyP?=
 =?us-ascii?Q?xSl9ji+mb8nMIyay3KGgY3r6B9hVou50Qx4JXeV8D7C4sQAxZmZ3qNMZQgWb?=
 =?us-ascii?Q?UnwBOaM7ouc76a+oyIRp6bV824Q9FgsX1oZmCbaHircoEkSynphk3GWJDMqB?=
 =?us-ascii?Q?iHwJzO1zUO+DE+D3rXNzWUfhJrf5HeZJW80W3Qe4l65utMmyhRZ7uu8QYCeM?=
 =?us-ascii?Q?TuppR2WJRyKZyNnu919wCMesx6pUIesA2gP+wWSr7JJIFW95SME86Nv3b+Jg?=
 =?us-ascii?Q?98eMF7+lEGdglOZpIY7mkt6faF2hkV2X5gGcnogNICAXiciZDFejNB0tttXQ?=
 =?us-ascii?Q?+UBO1MIiChmDhSdq3LsnwD/TF2hWvdJDfvn1qYfH+bkCCbjpwRma/f3zYSzQ?=
 =?us-ascii?Q?Oz6ikCjSb2hvDJwvhcuEksVAm1mmc2l1WoN7xN2JqYP7HoLJOhUsxxoSGPjt?=
 =?us-ascii?Q?QC2CGcv9qRx3wcm7eKoj1PeQ0ks3g49AFAGlvHg38PVFc/jYlO74hok3kRv0?=
 =?us-ascii?Q?x2P6AgCYA8QE490+s8izvixbCcuVhOLSxIKt0Qsj2l4jk6ytUBNWHRuvN6d6?=
 =?us-ascii?Q?ac3Uy9ZxnIl4LDiqAwpYmXqctTOA3r6zZ3F1+OWdqFWZcrXTbT/WFlNdP7vc?=
 =?us-ascii?Q?s0GOMiek0xA6ruNulpXO7/e0+Y4mixohIyNUqZF05dSBsff0RoS1m4GPICP7?=
 =?us-ascii?Q?hw08VHtxf5f4Ch8dZs+NrE83ljxPRZX/ENWl8Zsw7Xy9vhm3UcE2JPnIZqjy?=
 =?us-ascii?Q?3ANF/Q1qi97Uzw8xq+Oyo2gopbg0TJ/CUk4/VR/1NAtx2tPOs0kZIYkxofmE?=
 =?us-ascii?Q?rwCqFFDUSCZ94td4ItdXT2fLY9dkMHuqxOWeXQOrmCdHhFVlYkozT7vLXqjN?=
 =?us-ascii?Q?anwnFhhXLCtTo8fWOLN25WffMlLlOZcZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XHx+Z07c7ahRiHzSRlD0RGvMe9dOBlAsM9tSAv+Tki5WYbU4Se5M8742kvyt?=
 =?us-ascii?Q?+iswGSb22Xul2gO71qbZkHZNvdoT82PwyHNps41dr68T/RbWATtEWZcQ5WCn?=
 =?us-ascii?Q?HAA8byKVM6IOvfzqvamzq4MDeYlhbchr0FRUk40f6EyR8BOOUPLEH9qTocwa?=
 =?us-ascii?Q?UzstTTr9/lL+lqiNl4qn/MikZvs2L4THtw2/GOR4YDOS5O8zj2iMSEvygOpJ?=
 =?us-ascii?Q?xMCUI3PkrGM3KJ054JrCn1ZXvHFivR+3yEZhI/QhWanpG//4Cs3I2hxKPsjx?=
 =?us-ascii?Q?nblUgXPA6B+LslUIViyGK1xPVCKbBBxVmrszjvziKj/f1ZRP7C7vHlYnEOey?=
 =?us-ascii?Q?WNXa9ddYNx58krN9mMc68G5614CXYRTd2u+I+KMu3v/jCDzUX7wuf7JMJ8rh?=
 =?us-ascii?Q?FcDgPsPrTyJdyQvfPUlsbSI3uC0x29yuAwtc+ROc/45QRW4z2NY+5tgoTB3d?=
 =?us-ascii?Q?OW7idQhjSll3eYsP13yc9wg3LdPOdbzRjh+J1LYO/Qu02vJkNNdEBXJXvZ+s?=
 =?us-ascii?Q?HIDwRWXcsU0BlJt0o6/QHPOMr+2NnAej89VTJy5vc3Hu7Nrt6FwXENwiU/uM?=
 =?us-ascii?Q?wza+tx3e+pxJmHcAlTOWoY3rGxHezxAshDXi3jejdFta9dOBQVTHnVkBd1nH?=
 =?us-ascii?Q?5cNjxVraX02fvEK+e8A+G6S7bBjjorUO1WaIXhj7eir8CR69aS05iXGDSOvp?=
 =?us-ascii?Q?mUpgVlaz+QrBYKG/zh4BvDXf0EYVdfR8CffGIBOvHhQ/EZMl5X7hu1Srq3Sf?=
 =?us-ascii?Q?jptfukBvoXQ2QVW9CTdXzmskoSANlzRTZYNZ/qVDEb2DYjZtXxs+N6FcYRvd?=
 =?us-ascii?Q?BTSu6MpmCjwX4TVJhONTjxKn1aalvFUqhPB55CNIdCnazJiRKz2FMyVU/Rkq?=
 =?us-ascii?Q?gL4i1jKqBitG4Dber8JOcXRMrlakE9RV6bC8MJMc9vk3Xfn7wjLY1h872Oag?=
 =?us-ascii?Q?SmM1NlibINeN1kvqhZorhrKcgmS4xbbiRKL0k54NZvJVjhlgGfatoJF4TwSI?=
 =?us-ascii?Q?gQCAz6o9dyEugiJLbRDFFXtjcr9Zwb4R2IKquSJk8UgLMzCxbdoLgrisUzrZ?=
 =?us-ascii?Q?5ALOII7m7ZwT76MSnxTWmqOa5OR3gnFGm3A+q2qGJ/NxAxWCE+Xen175/mCG?=
 =?us-ascii?Q?bmZpw1RN3m7llQq/0UAsxUWR8PHhtX8I8fajbMyxM1W+ap0G/HgLNAMXCAO0?=
 =?us-ascii?Q?qltHVlquyk8L4KGi28iJWKiQeoj8xz3KhokjDZbhogbOj9vUHae+KTCpGFfk?=
 =?us-ascii?Q?7EU8ykzgEr13qUJ6ckGGszT2+l8+gEKTrPHFulWAXgs4ZryFyy6LARzlHm+B?=
 =?us-ascii?Q?8xO5JwVNGp0tACqtf2LBLbbzXRK6d8sSFsU3b00L35EISnSndvslt+ehF0rM?=
 =?us-ascii?Q?ZhFeecb1P+DNksv9wQGlI38OYGJvbvvP9fHqkSzkNXltxIi+jy7z/f0fIabe?=
 =?us-ascii?Q?BpbdSZMjfkIIsWheyjNfLHK9WKkr6hu2EFTi9MXQyIBmgqSjGW1XcJovy1FF?=
 =?us-ascii?Q?VdK6zvtTDJI9lIfPN8KWp6rsUMrFOxJrx9X7uBgjT7v9d5wx/qdOAZa4yWn7?=
 =?us-ascii?Q?5KQ485n+D3eYjVcvyaPO9YVXzKf2o71ggcQTxdm6KEJ8U5KymiGSoywl2dRt?=
 =?us-ascii?Q?qNHSgyxt09+VQXOJp+8ZzDU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230430ec-834a-4730-9525-08dd1e39649d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:23:20.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUuN5l2UsQ3WrhBFwoZ72gH3iDpebWsYTgp6ga6p2G4gOQVNyE6pRgVcReA2vNN5IkacfoJzNu8l/BdwosUOnBwTQQDTed5bCIRGVUHSTO+a7TI+mH1r5vfPYoDc3l7H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13698

Some device want to ignore snd_soc_dapm_add_routes() error, thus
card->disable_route_checks flags had been added for such purpose. Because
of this, ASoC has duplicate code for it. Let's adds new
snd_soc_dapm_add_routes_with_card(), and share the error message handling.

We don't need to indicate error message on this function, because it will
be indicated from snd_soc_dapm_add_route().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |  3 +++
 sound/soc/soc-core.c     | 34 ++++++----------------------------
 sound/soc/soc-dapm.c     | 15 +++++++++++++++
 sound/soc/soc-topology.c | 14 +++-----------
 4 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 12cd7b5a2202e..16f4a536cdf52 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -478,6 +478,9 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 		       struct snd_soc_card *card, struct snd_soc_component *component);
 int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
+int snd_soc_dapm_add_routes_with_card(struct snd_soc_card *card,
+				      struct snd_soc_dapm_context *dapm,
+				      const struct snd_soc_dapm_route *routes, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c8b7f78b02f0a..01ce1c9366223 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1641,22 +1641,11 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (ret < 0)
 		goto err_probe;
 
-	ret = snd_soc_dapm_add_routes(dapm,
+	ret = snd_soc_dapm_add_routes_with_card(card, dapm,
 				      component->driver->dapm_routes,
 				      component->driver->num_dapm_routes);
-	if (ret < 0) {
-		if (card->disable_route_checks) {
-			ret = 0;
-			dev_info(card->dev,
-				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
-				 __func__);
-		} else {
-			dev_err(card->dev,
-				"%s: snd_soc_dapm_add_routes failed: %d\n",
-				__func__, ret);
-			goto err_probe;
-		}
-	}
+	if (ret < 0)
+		goto err_probe;
 
 	/* see for_each_card_components */
 	list_add(&component->card_list, &card->component_dev_list);
@@ -2233,21 +2222,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		goto probe_end;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
+	ret = snd_soc_dapm_add_routes_with_card(card, &card->dapm, card->dapm_routes,
 				      card->num_dapm_routes);
-	if (ret < 0) {
-		if (card->disable_route_checks) {
-			ret = 0;
-			dev_info(card->dev,
-				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
-				 __func__);
-		} else {
-			dev_err(card->dev,
-				 "%s: snd_soc_dapm_add_routes failed: %d\n",
-				 __func__, ret);
-			goto probe_end;
-		}
-	}
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
 				      card->num_of_dapm_routes);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b1..ea0c74f0df102 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3189,6 +3189,21 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_add_routes);
 
+int snd_soc_dapm_add_routes_with_card(struct snd_soc_card *card,
+				      struct snd_soc_dapm_context *dapm,
+				      const struct snd_soc_dapm_route *routes, int num)
+{
+	int ret = snd_soc_dapm_add_routes(dapm, routes, num);
+
+	if (ret < 0 && card->disable_route_checks) {
+		dev_info(card->dev, "disable_route_checks set, ignoring errors on add_routes\n");
+		ret = 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_add_routes_with_card);
+
 /**
  * snd_soc_dapm_del_routes - Remove routes between DAPM widgets
  * @dapm: DAPM context
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index ae2d6802cce05..37e7e1147c241 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1100,17 +1100,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		ret = snd_soc_dapm_add_routes(dapm, route, 1);
-		if (ret) {
-			if (dapm->card->disable_route_checks) {
-				ret = 0;
-				dev_info(tplg->dev,
-					 "ASoC: disable_route_checks set, ignoring dapm_add_routes errors\n");
-			} else {
-				dev_err(tplg->dev, "ASoC: dapm_add_routes failed: %d\n", ret);
-				break;
-			}
-		}
+		ret = snd_soc_dapm_add_routes_with_card(dapm->card, dapm, route, 1);
+		if (ret)
+			break;
 	}
 
 	return ret;
-- 
2.43.0

