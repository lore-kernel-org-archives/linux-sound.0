Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48D3D6CDE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455298; cv=fail; b=me/7gMLPlSv+KdWjM6ukYHPlpqofzW9qw2qvB9xuvVSlGAYp8mPoRHox8sm/mh6vsm6L7VEjLjLOenliEa5/xQMWy/J/JZf3QbExkN5gwOIrRYygcSPt5WX+pVa1PNbSb6M8cFXR6ig+4qnrdXUn456GK5S3KUBJfHHzoFrS3u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455298; c=relaxed/simple;
	bh=sz85t+lXlZqv/Dxvj3hEPdSdzyD86fTcxMrKgWnL1/M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VznTdfSCTDc8t5ImweFxvSiXR3noGUnhkvzPlAZDkkfnswMGXVgHTPV/mCNpuUAS4mN9aWFOOg+L5KqmxpVqt55yvQPfim1y/nwyaJNBkZ1wZ0cU3Fg67eTUASUyNA7uCbkCb5arIA2VakE50eYTkKLBkPWGToSBmy//4hEWWTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GbLsfmGv; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GbLsfmGv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVBQ3Bzg3NHo6TB9uJttrczZ6CCLAT7mGok7NY3RFeXnaKdp9zumGldKzBWLWUWmI6lO6iYD0kCHUnig4Az55i0XhMejIRIqsTuv4AV8vTYzaSm+9HU60/D/RPVWx9zpYvKb/N5yQz44XIHqQrEvPw8pE1HtARlgOJiFhlRarGBN0mOu8GQHfapBPrqDsBy75k39V5ddesEOw/z1+W89XBW0EEdcLIy1AoP1otHySakt/Dfj+OTAncQJL6E80Kl/XUcIpRHr+d3w2TURwRH4Dj62yIlrmIAw45BRTDhMOl3dsWedHn5cByxVYR5ApE9vwebN94rkY3OFzjr/Uw+rXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zer/C/fSGKLzUIKQke2T2uA+6VryQsf4W+BcLZ2xASc=;
 b=KiNO3eG4o5EJTut4Q75SOJKXpW/rM/PL0LrauEkh7X1oNRZ77EvWW+A1cfPusWADKGKKsHXSJoDgXuhYzEdasIIXfMaD2wW51EGZVXHD3KZaKm9pZeY6W8wngs7NoCWd4JbT7uilX6fv0GCNbfzNaNGmtpEV404EJ9YQSgB3cRIRhfViRSKG1kHI3ohrSZbg8hvb9eXqnekM2Z1wHhryJeJc03tZ/kwXdM59HJ0OsybBy/ZwwWdLLIES4VsQHPubiiO5M783/93u9rxu7As0WB6Odj3LDTN2bcrCnkBbaPvaLh1345Xcp6nEWZch0gssQrV4spuNm9kjEhQhKztrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zer/C/fSGKLzUIKQke2T2uA+6VryQsf4W+BcLZ2xASc=;
 b=GbLsfmGvc2csEU7/rP5LBq2CLcmTvydbKha8EyB0qKwKiuSzkSM17q949iRmRiATwewov2W39iOQ4yrdW2lgNxuAu2ZE/4p4Zw29aLyQmVnmPydtrJyUcgAfhM06LENjVOmSRSY6tidb1/cMxr+iVHb2qRiWXQ0ycMi9t4TyXto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:14 +0000
Message-ID: <871pdtery9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/12] ASoC: audio-graph-card: Tidyup audio_graph_parse_of() around error
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:14 +0000
X-ClientProxiedBy: TY4P286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: cc174891-db88-4f96-dbcf-08ded34c1a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	B99MtnIDwpmURP+eLPlu2mScvgQAZHSzmkGutYRt1TaLBqP3lboJsmM6qiZcdH0chreM/h2qnzvC1HOUo+qPAYfCSlCQ48PTFUp150m2mQmms4XVIxH73crTgrZPYIDn5TVEDwGnQdX0AJs354udEW9DyQCABvnEhj4JFtCelOKpk3D7emrg65opFo/IC6tTaUex4vQDDrSelvL7xbUw0mxsKiy0Kz+/U+KtvI75MWf6iozCzffdvJoN1E72rNtjjJNET11H22oW6KzdyQvKQKb7VEjIa1zxUVartyJkSpMdYH/eD5dLp0ta3htcF2HrS/g55TtZ5+zAzyemYSqA+tI4JeAQy0V5KorMJmsOpLaISWMCuPgqW+Yteeuw72/jzzlr11ULTxDy2Yw5XdxgImWIQvjB9amwa60rmvkwE9C7cOTDM610scLg57WTZ/EUgcqOmeGmwnht3OSv0LfD6BKHoTn4lN3zpOSGfF4Xy8MBqkz9FUlO5N4lBSsjznFEFdlcJ7nXjydWbbKX3Lpq9V2FbsMfMgpoRVqomRdw1zYTg9Y9hK079uHCmdx48S4J/04olQJ3BBPCE5At7JEh6s96KWzHN4gNffF/0tyNt1rMisTt3zExkA8hYmCrmaouId/NKdZTGLku2kf0LxpS3xs2mny95jTvKaltWKXHLaz1aPQoQ+r51/YTg9TfvzpjQ3kV/IR6yDG0yTnM950mF+yUlVSYtGg22+AKvMtpS7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VhpzLvYpVEHuFv3aX8iplUr9JvXWZ2piyHzWf4RYEG3Vr3nEATtErlTkTlUK?=
 =?us-ascii?Q?4QXJg3B81NDe7YgcGczzNEE3REEqZ9BYdEUt+QHc8yp/z2uWaj4nenchz2yU?=
 =?us-ascii?Q?KzuvQHjBfz3U3O3teLrHn80ttmsBaVlXyuWS7S1KivbUVYKcphtKYpgSQYO0?=
 =?us-ascii?Q?YTzqEEI3M6n/Sd/mCMThOvlABIfHl9u+zfEYh0muirtUVp7dQvFx/CcFxO01?=
 =?us-ascii?Q?7Tvc5kaA+g3nsALddKA3fzXvl5ClA49N0+bIMGSkMONd1DaVFihSdadyQdFx?=
 =?us-ascii?Q?d/bX2ekKU6rwz6pqcQIN6xtHxXRScXJEWUUkgFH0yTPB/DORRlEti5jwKvTP?=
 =?us-ascii?Q?Wre+u79Af562GrES2tkHHoCZdN+lXn33N9qijzyfYJQcWeNaa+3CDcOvrT1h?=
 =?us-ascii?Q?4okq1+hVlAaxeqS2YU9MW2ypbNyKY5ER0u+Xqq2zVvr0FE1m9EUde8JJW58V?=
 =?us-ascii?Q?GgEnR/drpA2AtaggY56VtfEYeexMeTZ0CVyaTjqspfdEjkitA8ZSWrdEkuva?=
 =?us-ascii?Q?pmuAkiq0zHy6dqiP0VgEbe4g2P7HupWVSLkwBYD5Af6zdDJ6NPk5/RdVKrJo?=
 =?us-ascii?Q?UiER5+72rD/aJNZY/3JiY9Up8Rkxxiy2mtCuuZtolRxiXEhZk0uB+A3Q8R8n?=
 =?us-ascii?Q?LSBkJLYhDGmhMQhHz3r0Ep5BwRt4l+2l+so//vKPrUUEsKs+r35JVudk6HN+?=
 =?us-ascii?Q?ZrAL1SuUsIQcnm4t6C9MLAbs/8Cn5lSKOgevpFv30h7hQS+8ggEmZ/ct9S6t?=
 =?us-ascii?Q?qTfskn5quWRGhzG8K+MJ0C11m51YboocEb0p60zD90OO89yXG06aFDd2tKoM?=
 =?us-ascii?Q?aOR8sJA+5vmo884t1xvAT8gAG96aFEt3GKsBLYpwJTVW7gbmY9/ZCC2K0IzU?=
 =?us-ascii?Q?j3l3BGMunhg1VBAnYFZFVDQDv+GpY1UHA7gUubNZsON1PVXm5xEekvc1rk+U?=
 =?us-ascii?Q?Tsi8Q1j6n7Nzar+Cqc+4KBbv96xsDQo5sbdk1GmVAQ+abhu2xSTdXVM7GbUz?=
 =?us-ascii?Q?EHzS9d2eRlBCXOrymJWSXLALBTvsi0NNJoDmVM/QLovjzbN7PTXuoh5E6DQR?=
 =?us-ascii?Q?EF3XTHPyQXaxSzEYVpTBj8SxryP2neOUznM/H9b89R1ihRXrL+oBNU0hFJhv?=
 =?us-ascii?Q?/eZ3Vsi5zRNluhuWwNk2M2PPTsL4wtxStQeLFLzaslGgwSu3aef9w0q9yhFq?=
 =?us-ascii?Q?9Yi92mJ0GvbiijZzZRJ/2sPcflUE4EgrQU1mANJPT5McEt4Eyl9e//ncqgnK?=
 =?us-ascii?Q?HUX0nCZ/tb3v26xHhCFpgpK+wX8C5x5tf2B0BEdW++MDfg8DeCkNLgKo5nza?=
 =?us-ascii?Q?bbFUjA++pFiWOIn+DKBc7v996MchK7WOLvbspII1Y6NMGGBWfRYPI8/1NkGN?=
 =?us-ascii?Q?urmclgTYIujbYQgFzBVEq1CnyzFlRuq07Yi71yUMOf2M1XpzbXwRw2nv6Gc+?=
 =?us-ascii?Q?Ph0IqHBKXnXzjp9Ce+08siVieUB4pwE3f4Wuvxb1vNSGjswI6wr1OC8gpJa1?=
 =?us-ascii?Q?y2/OEs1K3SamcEYzfaY+u6z1dPUNkzAgt7fS4Yu+dzRCJTQIEpPdUR4thdDx?=
 =?us-ascii?Q?hT5uCLYXfZu/7RTnmmJqBQVR9JaXV7buAYYh8HSzKDgFVAUhLDtuZTc1jgFl?=
 =?us-ascii?Q?KoUKdlAg/o1h0svypdn2N6p9mNSxPVWHYiZfgXNxeCrRaQD6JwF13FvQuxR8?=
 =?us-ascii?Q?tq7gusr98tfJlbVY4QNYViWmG+LQDU8GLFp8KHipDJSpV8bEjxEUvLoFM5yV?=
 =?us-ascii?Q?yDDkJryELgrS2EeEU3T+6pBOR54UvlbV1EOGX7W8WuZcrsXDcyxc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc174891-db88-4f96-dbcf-08ded34c1a24
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:14.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SgZ3MDUObOm/jznV8Xkyu6NPD+hSswL9iSAOdi3aJTpyB/GrIDp6/F91ZKZj3vlzIn/kUy7uk1vu4ADTVFX+wuX2DbaoNkWRc2iQRZolv1IXIxIHRVyM6eFTlMJIdB1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

It is already calling dev_err_probe() in error case, no need to
call graph_ret() in success case. Tidyup it.

Let's keep same style with simple-card/audio-graph-card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 18ce4ee063509..42e1b77fa65e7 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -603,14 +603,13 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	simple_util_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
-		goto err;
-
-	return 0;
 err:
-	simple_util_clean_reference(card);
+	if (ret < 0) {
+		simple_util_clean_reference(card);
+		return dev_err_probe(dev, ret, "parse error\n");
+	}
 end:
-	return dev_err_probe(dev, ret, "parse error\n");
+	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
-- 
2.53.0

