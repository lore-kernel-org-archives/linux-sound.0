Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA1619F421
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903954; cv=fail; b=VGRViLoBCAsq5ZrSRMAqRZKTFYsfbmHd1i40+2Qdh2SM6RIBtqfwbubQw1rpUJP5X8o5SYY5AKEWN22s4XcNMXpkj+vJtu46/BxEraz5zoeVSO0EM7trapbRUSed4teyFD3SuHGn1UsiBPS92/ZQIFe6MBgof8LSn4QvHQad6as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903954; c=relaxed/simple;
	bh=nLKKu9laZxeQU4S/WCeWgA+xMmg8JJmbeTIROi7Jfg8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PZvMSWvG2CJjfQW1Zkrap/GZUs/wad99fXjcw3CqdzXzOgezggMMkVjn+W8u2DbnJqQYwEw9IjNsj+6DJgJFw6evSdTNoFBr6nOVPSePclHCrEzjo8zzowE+cPqzut8LuMpEQLK6njD47ds1H2Mi8JRODdMMDHdBZ5tRKowt55Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ApuLB7jz; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ApuLB7jz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmLyIpoZytJcHpZ/7h2KchUH9rny6ZG/V429fvnsFHAy0oUaShHMdvSi8ZmjAzEJHfopADSAYiBhu46E22HaY0Gu8+5og5VILXSxrMaxY9D6/6kOh2gIBp/yzRbMywUeGhAuUKs6DusXMYRQDh3kHnHKZSs/OrkRU343MYZqaREVTPgxnGq6D2jKDSyG17WavZtQqqJnHtwhGqGR79gGYWzP8Z7BzuOSId2nvFBgI6gucM2ioj7TUj+9nIlN29EKqR10aRt2hnlhLqLO/a5IONRS57iM0bEECEKIR011l/FNZdGFAVSlL0dqCjU1KgbnXQD4Klck2Y0dZNVNW1lMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ioy8GIjtkVfwHScthlOTlvOzkhh8l7YD98iYxOxtcI=;
 b=WufChncjPpxsbyZOuS9bUHYOAvvNzX1YbNHJnsQ9SLmzXdaXkcg1JjYYy+s7scTB1XEkBL2bvoXeo8N/YEe4Hhku9xBD3H25ySNnUGiJ5UE6GQCSjr8UELcGWtelUiaXVo1i+HrhGtR/f4zn3Wwyj2U2AxyovS0qWM4et0vgplpEfrL9OFXpnqGlqoJbGwrVGSoCLL+0oPzf47OfTQ3jSrhCQ9bobbn2/PkHAhHkNkHFco7ysJ5T5s5JVUxxkO3nhZmesvfyT5iKp2cqePiU2cpZoSfitF+rZ6d6d6x3DS/pFtjjZfTYH7c4qk1sfzqIA1+O1Voc0bBnG9ReQtILCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ioy8GIjtkVfwHScthlOTlvOzkhh8l7YD98iYxOxtcI=;
 b=ApuLB7jz/fzG9bBEDDBqrjC5PaFF4zQgPSOUBydJqmwUxrQtKKlPBpSyOu17Ded134XD75iNCd2oLkZkvpnmDUqw8UYFkf2ATVCLplfoLBVHanPmdUg3QDGocejCp+qmv87epEEGq0QvqnTcaVtB41gOe/pItuUoCapkDQq331M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:31 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:31 +0000
Message-ID: <87sejn1ca9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/11] ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:30 +0000
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 196d27e0-69c8-469f-4b94-08ddb456e800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tsLSSg6Bo5hrOtIG++EHKrcoMrXT2e3hrZga1CICxs47cv306U3WQjI3sF0D?=
 =?us-ascii?Q?aUHKscUgZZcP4fA9PfZmlRp8tRV7z735DyAcK9/MuuX/3UYweQl0ka/ayys+?=
 =?us-ascii?Q?HNe3Q7tcchgg7Uc14Ykwc3szy30KQiDpOwrPFY94f6MGXpxcNjijwfzZVpiS?=
 =?us-ascii?Q?HXchPdxztfPYpoQCF+3RsyrhH9g88Gr+Pf/j6TnDL2MddgEXpaWnd34iqwEL?=
 =?us-ascii?Q?tlEUg0mnC4t06ah/GbDlcU2aOwRO/mI4GqM3P5X7iD7bWcygmV6QGevUl5Xn?=
 =?us-ascii?Q?STCpamG7sSIfIVeRwimpiSwnL/s2d7BQIqWLVxkZumw/Pv7BE0FmJ0HNMhSB?=
 =?us-ascii?Q?HSSJ/0w76ectZ3QdeVemfzl8Y2birSyEM3LNntJKUSMynsqflbWWij0/J2pB?=
 =?us-ascii?Q?WFRLFKmbj5E+3BKRi+MX4m5crSvvHX0ENKevnsBabH6+xSfDZJHhTCSVnexT?=
 =?us-ascii?Q?owqrDfuvEUjK4KXxB0BSMAvbQI4x7/1J27IxEbWx4N+XJ2ycEnHmHeGYOV0/?=
 =?us-ascii?Q?SuvmLff8qzKzgvdTGMQlUZt9VFZ5JMYpYSXm35QARvLNKQtto+BqZZ50ikKy?=
 =?us-ascii?Q?Nn3KyiUWN2W49NlO6ogtzSaKtS2IYxYtgGFDhmuZo7Aabn9S4KlUPiQDigZ6?=
 =?us-ascii?Q?03zulZDL9RjcryaLQWebNKVLJlBvWpTkY4ClLgOHQyLL/M6VIr5XW9pzeQzL?=
 =?us-ascii?Q?ykijGUD63KOq/z2+6zKSg8Kkapy3exjyBFJyoQTtQ1DUZmIHptefU2pY/qIr?=
 =?us-ascii?Q?tKlxcOY8H7JZcwzXDSADh/g3/0wlXFi6i02T/+ReUZN2aAcDqKEFUXyOVVit?=
 =?us-ascii?Q?gWzeK7fbL8f00pJ0TJebIl/NtFYMwNto8lzCuB5aNFdh61EAftNndsfjJW4e?=
 =?us-ascii?Q?kScMhgrcPtj8e78klSpI6BlUQht4o9YCE9KO6Zh5Kf6T/P1YzACS/VSsrFGV?=
 =?us-ascii?Q?wLBq9j7QgGSctcGsM+4jTquhpJnnl3GGkA8hfuIxN1JyPN9rTfi0EJGwM/fU?=
 =?us-ascii?Q?22XH6Jng2ZDXH2ls817EN/+Ehln3GqPZnqG4wN1B68QGzPb3T70G7yu+kxKf?=
 =?us-ascii?Q?x51TvgujJnUuaXZz64pvwxDocUOJgvv0PinHqmvaMR42rK2Dmwlhq98E7NvU?=
 =?us-ascii?Q?cCgOq1ChKhdYYw9Hz9HZjRKMEiGySqQpl2lg94QpLurSZOYIsfeaLwOny0mn?=
 =?us-ascii?Q?ps7yEA8s90kYA/k3boFHnQDjxpo42nXKg4FXwoiDcL/gGRZEB2h45MSucVNi?=
 =?us-ascii?Q?kVVa2QUoOgLmMNzJ7L0c4EjiCBcKZt8lFnl8/cfqCk0GSIjDcXyFesCGRvaP?=
 =?us-ascii?Q?uPvhBwT/5YL6F4pycgjc/huLiF9qiLm9VY54W8TmuIhQGR6Hn+2j5xZIs/Fl?=
 =?us-ascii?Q?LnTj31F4h1vDQqvTjopIel4mytR08tTRQiThaLMNjWHr4L4NXh1lLdp/1GW/?=
 =?us-ascii?Q?PudLbDRqOG9h5MPU/h0YRauyqGjNKKTOmG7cYPDxpuX89dTJ37VvDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JA0Ov6dlCUnI0re3T4acxl8wqfGRF1SsQMGjtMj3jWDh66porRGZYuE3ixcA?=
 =?us-ascii?Q?Peyy41LZqocN7yvgSxdHvVJLOd3EIfCur/eK8rvbZ6DOsCNf9j+icYIXon6X?=
 =?us-ascii?Q?uQefP9aIAHnxxkuoLKCHeWrrJCFXlg8wLjcsYnfFi0iSGAWC32IW6BiQwKcm?=
 =?us-ascii?Q?ZxorXeS+/i/6BVBpSI++8vkLXRJbEZ+OnrJcbZYR6n9OldFjWVOOLH1B0UZc?=
 =?us-ascii?Q?OV2TKkdVgPGuwJTagpErUxeZGlk44OgYtT8Z8FYlEGvydDGF321kv+JbwVIB?=
 =?us-ascii?Q?iz06ts6sgTV4jGMzaxQ4H8asCr66rWAxAuPiPTCYTlr8V/LhUDCiByLnTMlB?=
 =?us-ascii?Q?vDkS+yBoafkVM69KLt+WU1l+VDJs6zKuTeToYsJoVjh3+F0qbENcjYpH2XNg?=
 =?us-ascii?Q?SXK5Rsooz2tdlvS6u3hF47/YoQgElt5wo44Mfy/5vxkuyX3jyoYDKeHhIQ8V?=
 =?us-ascii?Q?is7nl5tTqC0MsxOfOsyO8X9/vLc4JOb6E2B3+dbyM0Jmx5gdMsXLXtLdTZW3?=
 =?us-ascii?Q?MhBahcwHVLz3iRvwkG2Z4KhOgE+ZpMDKHjUAZpRCjF8m6+5jd6SV7ETZqrze?=
 =?us-ascii?Q?TovkD+HNULBf6naYOJA7Q8KXZ+8V6FCWGdIva/rQX+W4fnlPMhT+IY3U19Lh?=
 =?us-ascii?Q?Yb7m23Msqfpbb0iL2/VgsQ6YMa1ggqaTW7jvIMPfx53lRSx2BrihEFvaYQdA?=
 =?us-ascii?Q?/s6+qs3fPKpvtB8ceCKfmTSTdlE8rpMzYYuLn4U5lAXSD0PygxeGAT/Z5mp3?=
 =?us-ascii?Q?cDVKTNoiE/RLFFgoX0ZkxNIo/StYDW/1/tpOVjS0PH4s2rhqMS/X+RqRcpkx?=
 =?us-ascii?Q?Ly0NCb2y4MFVWJH4VOBWckvAo4yb3Df/GRUOmwy27ksPti+ZMWvjU35Lh3Fg?=
 =?us-ascii?Q?X00yRfRi2/ckktfPA6aBEmg63tPL5KT3a0/sOrcMA9f2mKd7lPw8UBHVUYK3?=
 =?us-ascii?Q?kDBHEzcZQfxiF/tCtxpSQ9VrJilAOjFeeXPx3a1MgItNfAru+xWVhgW+lKLg?=
 =?us-ascii?Q?Qrh2RuqdQorWsHK4Z9TmrGJOk2M6qCOpN2NxIMkekuqwWsQ9t2qWypWYvPG0?=
 =?us-ascii?Q?Ygy2aST8MwvVX4BwfkXCByvJox07SgU+IlYvZeFXeM10tgYYic1oIovsnbQy?=
 =?us-ascii?Q?igG1sQ0j4o2A6flVHocxI8KBoJkH3AwZUdmV+aliLHGd3i3eBYCsy+FsSb8y?=
 =?us-ascii?Q?8bH2alkD2Xjy4TT1jmobRxDGpQqWA/4LC9zPahsVemYGhlP7AUvx/CKFNX0m?=
 =?us-ascii?Q?W0K8rklTB+FZ73lavmKyjdRP+fR+M3WaZS5SdTGhwhX2kdBFD2s4Zn0/1pHZ?=
 =?us-ascii?Q?6Ch6p21lRPCYMx8EGRV4lpSqVionXOc13Smlc7vI5NiVp3WSPueE21ybw1Fh?=
 =?us-ascii?Q?6PJMDTgTk6++HRzIrClx+lTISAhomh8NKMcJeSHyEtGdxTk9nVnBWCeKsPJx?=
 =?us-ascii?Q?CE4QzWbpXG9/zJMDUWpkuFAkpxzrk90CfcZAy2+Cm39Wwy5lmMHiY5klbCl0?=
 =?us-ascii?Q?DUfSK8HGXXHj3w7pcOdOLyFL8SPDVsDYI0ZLn2yGwU2DVAj206pvDHtlOzFF?=
 =?us-ascii?Q?guW+uv8+DaIJlZ0SFio35MHqGRjHdFfPE1NnziLi6lAKNNKB67tlNZwgerZf?=
 =?us-ascii?Q?wjhKX8muASz7jCfrO7s9gQw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d27e0-69c8-469f-4b94-08ddb456e800
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:31.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87L5bg7YMlTdFN4vtpvejIvn5E/SNL0o6IM47umvS/XmZNw120eZecsfXZGeokNSxfSupnl8KOzDDVoJESDXiLvwx5JRqPDtdHMjvM9E7HfUj9xvHZiVZnWiM5EnX/uF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

No one is using snd_soc_dapm_weak_routes(), let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |  2 -
 sound/soc/soc-dapm.c     | 80 ----------------------------------------
 2 files changed, 82 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 2a0250fff9ba..d3ded7f5ebf5 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -473,8 +473,6 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
-int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
-			     const struct snd_soc_dapm_route *route, int num);
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 
 /* dapm events */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1d7457368a82..d6b09be15377 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3202,86 +3202,6 @@ int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_del_routes);
 
-static int snd_soc_dapm_weak_route(struct snd_soc_dapm_context *dapm,
-				   const struct snd_soc_dapm_route *route)
-{
-	struct snd_soc_dapm_widget *source = dapm_find_widget(dapm,
-							      route->source,
-							      true);
-	struct snd_soc_dapm_widget *sink = dapm_find_widget(dapm,
-							    route->sink,
-							    true);
-	struct snd_soc_dapm_path *path;
-	int count = 0;
-
-	if (!source) {
-		dev_err(dapm->dev, "ASoC: Unable to find source %s for weak route\n",
-			route->source);
-		return -ENODEV;
-	}
-
-	if (!sink) {
-		dev_err(dapm->dev, "ASoC: Unable to find sink %s for weak route\n",
-			route->sink);
-		return -ENODEV;
-	}
-
-	if (route->control || route->connected)
-		dev_warn(dapm->dev, "ASoC: Ignoring control for weak route %s->%s\n",
-			 route->source, route->sink);
-
-	snd_soc_dapm_widget_for_each_sink_path(source, path) {
-		if (path->sink == sink) {
-			path->weak = 1;
-			count++;
-		}
-	}
-
-	if (count == 0)
-		dev_err(dapm->dev, "ASoC: No path found for weak route %s->%s\n",
-			route->source, route->sink);
-	if (count > 1)
-		dev_warn(dapm->dev, "ASoC: %d paths found for weak route %s->%s\n",
-			 count, route->source, route->sink);
-
-	return 0;
-}
-
-/**
- * snd_soc_dapm_weak_routes - Mark routes between DAPM widgets as weak
- * @dapm: DAPM context
- * @route: audio routes
- * @num: number of routes
- *
- * Mark existing routes matching those specified in the passed array
- * as being weak, meaning that they are ignored for the purpose of
- * power decisions.  The main intended use case is for sidetone paths
- * which couple audio between other independent paths if they are both
- * active in order to make the combination work better at the user
- * level but which aren't intended to be "used".
- *
- * Note that CODEC drivers should not use this as sidetone type paths
- * can frequently also be used as bypass paths.
- */
-int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
-			     const struct snd_soc_dapm_route *route, int num)
-{
-	int i;
-	int ret = 0;
-
-	snd_soc_dapm_mutex_lock_root(dapm);
-	for (i = 0; i < num; i++) {
-		int err = snd_soc_dapm_weak_route(dapm, route);
-		if (err)
-			ret = err;
-		route++;
-	}
-	snd_soc_dapm_mutex_unlock(dapm);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_weak_routes);
-
 /**
  * snd_soc_dapm_new_widgets - add new dapm widgets
  * @card: card to be checked for new dapm widgets
-- 
2.43.0

