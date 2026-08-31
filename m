Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390533C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152956; cv=fail; b=ozymfTatI7O1qmnzTqjQZ7UQF6yx3YImzGp7w+O9fpoEQ3bkcgtvknBPUdis7YBJ3C1qg5DWzlXyv6faoTsfiPrC8xC0hZa6VuIyOWzs0pnxPY9jmgM2iMkI1QA78H18f6vHemJY+lF+tTDKt1XcTcjAduTapyP7vRh8McXSJgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152956; c=relaxed/simple;
	bh=fz3N6AUuqgWsB+M3FX5i6DfmhJim281ohqv5Dhv+crU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZrJ4xVBC682oijj6fUe0xLioSE1DDa36vskMG+2gptsImyDVRLYr5MSrCoJ2xadLVebVpseLPNeGqbiClW14QLequ6yAw15A+WBR+YSKCv/v6v/6plnE5RBVbea9EohKQBtpqiqjl+ofaL88/pGkU1a+0mbrSreOwg20k7IMfBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h4o7Ofp/; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h4o7Ofp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4wS5TjHvva02/pr0RCAtijgos5TpruGtjkEvidf5PosKKDk1S6z8R/J2NMhl+itpc00TbVWPSi9yrQ4u+a7gNSafHi8f27NvQXZ4xQ/0n/zdjxt8fRPlp7II0GaTB28X7fMwoRy3HtsSvwgRCZnSXNU2lT5J7uzP0UeBfoftrfWLq1J7VeifLEk68oX7VKvaBgzol6ZPWawEfSyWdnvy8QgRep3U4IZCrZoTA3yiLWmr5uDKBG6Kloczda9ryHXqfVhYIROytsI+kLTe5VN6tmILRSqiSYbqiEvoA/3RwQZOIPY1PIBenhJgR51V2gdorqnTgzJmc5bNqEGqWabAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSNytrmSyh2FuLO0qgMa7BACoJZUx+Hz1flcAfBNpaA=;
 b=Z7pbnUckfmx5fGeEjKrMJq2AKFKlw9anr9mnpS6gsbJ3dZd0e6WLZqKuQzQLGxBJfOeVWGFZMR7o4TL6bfT5RCVVIueP2HBjb+hBoDC8QcMOhtvVx/sXHyDt2EVvf08sgw8tadaQRg9f8bLINRdVPKxGismthGLEDjHYUZUEzL5EPN+zisJn1v7dQpf/EFVilul59k0gXfzOtTiHivBPGeIAMYI6zW7aDX3/A3PAJfJOX2NqJMlLTmNuhi7PDI1mcKMu64VnsYY8setjFumr9hpLmE/eMVuiONkmHD8OL3frqwVXaDybJHtEUhIMVxXPValkiXwr7kVgJhwARApqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSNytrmSyh2FuLO0qgMa7BACoJZUx+Hz1flcAfBNpaA=;
 b=h4o7Ofp/6bwR9tbtmJOuXbzp/F7p2iMt10jMiPQTgAtGFb8EO8y2kaA/G97T3kjBhtxmTOfM/WBXfNcHM6GFDYAIeeH6vKx3u8SYF76zOZ0CZa1WcElWDLnMgdK5yBI70ZqBSGq/KPKfL2tlxlhBqbUTM5zI0rPEFmHMS66ZNS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:13 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:13 +0000
Message-ID: <87cxuyub9i.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 33/39] ASoC: codecs: tfa9879: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:13 +0000
X-ClientProxiedBy: TYCP286CA0308.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::20) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d41c8c-ce4d-462c-baec-08df071dff98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EhpjmEOSFtO+nFVBBxHS412/bduZq89KZFToefKQfyksxaVwrTGKxumFzkCITvfaNu8JoCEcmP2tkJbpNvclzR7vQ8WHYvefHeKBER+KUjvGs7Js4ZPcYzMYFEbg9qK8Ww1tTzxwyXG/foBhPJg/eS13J3EDEUp0KKBPCDshTvSsXzuYTN/AG0n/6i2/KpsVYWe2CMjvwlMqJP5SI/LV/byfHhHJGAJuArJqQBYufjUCkHjTqIUUUdD8qJAZQXJa2TUayrMqtXIPmaQ2S1TbsSeZ3xTPQ8glTNqCjQsgbqnZZg0AXxW9o0iUP6o4/Ln3ttXgMtLgrGC9eJI7WN58mm6Pd3oWIeAHJdNip8xyVgJXr7jnwlxP3elp30o/HphWiXQygCn9VFaZfJbkjzGoq+L8aULhLAxVUVgixHyVtwrgq2zWx/dpYvqkBxezaYEjwDy+djsQvr0wK5tJInlC6Jp45TimFbV618h0eh2vTNgBJL2WT0X8DqOGT0b3EpVhv8xEiWi/EOngam5uMdMrLzDDMSAs7k4CsEnJ4lmjlzbTChPq8l+/7RpBFJxVh4htV8Xf0COY3qzKDe03JUKyXF+gw1mQlrn1ZTkpMOrnlz5MZiMwf4zeuDBCEOyppFyQ5TfJD5/VX+YSDE5pIgRmvDmoAfkKrS2xUYfJXMz59W59VdnrNRr4UR5W0vEQkTUbrpsXXD3X5sFvnGB4padWbTazs3GOkDw19myGb7wH5CA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bah2VHmJwfMZrqfD9Twa+xMa8cKrR7nGFJY2I149QkqQnZjBNSNeCxh0bF98?=
 =?us-ascii?Q?zr3hKwclFEhLRByLfcFXaAZqUsavziNx/Ax3yaj6ajertKL9Jr0fF2Ygu5YJ?=
 =?us-ascii?Q?IL8j64h4sVtUOn38XNXE/ymh7BjL555ReXHlkb1cO9XOW3QkzDU+tq4O2kvt?=
 =?us-ascii?Q?VumEFvR24X9E+OyjtCopo0hFhHYXP2CV09Ziluwp9mwal8scCe1SjfWA0yy0?=
 =?us-ascii?Q?+io6kT2WK51N/lqPFKwLN0VD82M8jxLl6GZn1G0LKbJWyChB18pAjcwJ+WuQ?=
 =?us-ascii?Q?UYtDFn1wj5TS1vf846jPAtqh/Cc0ByBKxIWCV42UTLuAerxoL248vBgc1r7O?=
 =?us-ascii?Q?4qZECTZUGolDGWdhWWdX2i5vuvClhCZo7BJF4yHBS4JZMo92ULDZ8PzyDXjT?=
 =?us-ascii?Q?vKAlIKuNhcclXk+Tba9+9JsykQWIn+kpsVD2OiCxBsmBqqXJFWLgso2T5PT0?=
 =?us-ascii?Q?V5npgdHujuaJIg+PBjp0f8IVHnSe0cQliXrLgTcqttQQRDVfO2UErMzL1I+7?=
 =?us-ascii?Q?tV6qPivHXTIu19ahRzrYKSFe2vwuSXZmlpLbcR+QRp/xkXnmh6NwLdyOCLb8?=
 =?us-ascii?Q?rqwaF4eFs68xfX07RM2W/iDAgrSOD17cZti9L2dy2NSfciY028tlwq/7PNO+?=
 =?us-ascii?Q?JeBtAqrZ8lh4cHviCpAR+IsX2oMXJMvsL+5XViAZ0cPFGX1d+jAwswvJCM6e?=
 =?us-ascii?Q?4SiudnfE4qIhcCHeJVJdLJa8Rq834mxQQeNcZ9zJ044lTGNxMzo5bP97j41B?=
 =?us-ascii?Q?wwcHevZDqMW++oFo8vJLbTUb89Gq2943DeA/ey4L7BKzbkIV6AYk6RgRvmfS?=
 =?us-ascii?Q?zMj2QIodyD1hjKMIrviqN6Zl6wu5lfWgvIoz3QGzLhoYWSKns1t0bYfycINQ?=
 =?us-ascii?Q?c4zizBnN8YnCiXPF07V90RwZ2JtSZY8oeYEcDmyhGYimzeXfbvoJCWdKCq6T?=
 =?us-ascii?Q?2QvCYYpZKgOfA4X170pTtgg5aj3RC7qSrBIqDeoInsXNHNCB06oY9x7sHu2m?=
 =?us-ascii?Q?DdFBJNKknIZ2vfUcFr3mDUd53drcRDuwar1Aomvmk0mScrzlJut4sQjluVrn?=
 =?us-ascii?Q?BOf9JoODxvjQ2qZbGuspTTG5HEQrVqXJX9eOw2Eqrdlz3UxCpXTm5pxf60l5?=
 =?us-ascii?Q?vR/vCCxTyPBInQM6R3ImBLPTVfQr236R/LbKTQ55GoXCiv+fZJnFH1pWQsFd?=
 =?us-ascii?Q?yWuErw+gWpGMzj68fY2tXDGif75yFb8AU30PB9AdpFU0bx5DpLb4mMj6sNQO?=
 =?us-ascii?Q?ZwphCCBWeC/1GzGahQTeMGgf0sJaGJoncc7/JnIC7JasVm5ys7220M6/EbRG?=
 =?us-ascii?Q?cLxMezPAqjVkX0dKsaIgLtlyfBzyIxLVEb4k212h3A7Unk79G3pvOYQe4Fpo?=
 =?us-ascii?Q?FP6Z5DirIifwCbKym3/zuijgeg0YjeRw1gcwLERPX8xzhq21GPYhZM6GCVdO?=
 =?us-ascii?Q?N7/DVMf9BQEHWCylkzgN2mogOxT/OuMo0+8QpreeYzD2Wo9vepCgCIFvfYlv?=
 =?us-ascii?Q?wu3gZYEKAaqS+BpPLieTaiM37JqzddYBU173maWl9ILwCzflXG97uehjNvGl?=
 =?us-ascii?Q?Jt3OQQObIILeDzcHpUUXZPIwvjd+ZVspvuAbs+le//dRA1bQ/qHDkqroH4g2?=
 =?us-ascii?Q?ehpgXpossuClr5J2GUQ+sBe2C7ng6FdI5n5EUDlyHix7p57Bf+9H1ug3WQnD?=
 =?us-ascii?Q?LuYfr7yNPvHm5heuRUlVpbZ6yBQJmjnyZKb8XB8bdLWp806NmRI1ARjY9de1?=
 =?us-ascii?Q?K7B/SGY0L0eOBENe5te02GQor1sSrHnbATRQPn9gBtKJpaIGP1VV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d41c8c-ce4d-462c-baec-08df071dff98
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:13.4928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzrjzWnr8OlAKA+9GPs/Rpol/RqM4NZ6PuE/Uu57hrQr5nUywBZ5R+j+7ddU4Tm1AJ1c7k8xbaqpggMSV5hfli/qU3HHzshepliANj9V34DKcC58ikfUTMuahGiUVWyT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tfa9879.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tfa9879.c b/sound/soc/codecs/tfa9879.c
index f30479f1f53b0..5191037317687 100644
--- a/sound/soc/codecs/tfa9879.c
+++ b/sound/soc/codecs/tfa9879.c
@@ -248,10 +248,19 @@ static const struct regmap_config tfa9879_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const u64 tfa9879_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tfa9879_dai_ops = {
 	.hw_params = tfa9879_hw_params,
 	.mute_stream = tfa9879_mute_stream,
 	.set_fmt = tfa9879_set_fmt,
+	.auto_selectable_formats	= &tfa9879_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

