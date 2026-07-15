Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BF732B13A
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081599; cv=fail; b=VRSa0FjVABx89zYUxPr0VAcHL3133YEXVvFuuzqCWe3iu3OVfLn4xmPYxs32jv4Y1TtbKBK5DRX2AaycsDUUvNdyOJI1dt/Yfkhb/TZPioOIOc/82ZnsUZy+Vn8oUI0VP8huD6yUyHD/jbraLnL2/hhmLPNxhV60KKemk+6DSvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081599; c=relaxed/simple;
	bh=0zKlKX3uXfh3spWAXWkgMzQG3vIbxE8AhEuIVUV6qOs=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=H0NZ1WNcHAzbIlEv1DAVSLHnIgOUvEkqW9ORJ84K8ePtEIWVngxaHkFPENNyTIVApKQFVcC5j6bHIGAEKadCaPxNtNutXeTT5ipRdNv4tSrJxgJVfu+p1R5QfvGmuJ85p607G78QPysl7gYwfdkG9tpDrvJUS4ujsaLYRKaygWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TGUxBZvH; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TGUxBZvH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlJndhvpnBZ2lRSt7NxelJEe5o+uPj+6n9a6atVnt/uuLY5rpdDtlYkUPcCNnBy8FYyhZ736PCySUL6r30VpU1BOkhX4SycPgMViF+GMwSXRcxrDBTPcoQ7Adnxq6SQf42Fhh+DQvnJcSEmppx4nrROAb6iibpVVZ3UIXkQ0MLa/oyAYAIcUDq4OdMCD83LbitVFj3HeVqewSpm9VXg+3R5G7+oxZT1zu6e7wLJXMkIAol9vAWDjLAqbETfVB11+B7aIBJWDM6Px9JoEQDCSNJ/V8lnJ1BZoVFQJsgRrG3TkDdhIJPTLGvItFPgiBLJaoyimbuv81Aapdm4gf/oDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUAcMTtV1xVlgMlk13XDoxuyLZHlFPxA17fSv0+vKFs=;
 b=YcscfWvAcgOScs6/SB8zaI9beqB64F4UXU+QIWOt0JqOK/0C6nwWyvhxu6oURxczoZfqKNTUKTi/HKLbU25onB5UbMRanPcZPvRJTJqIPrVaSIfPVP6rH9Rdpy+eiFTQHxycSkypeMx8XK+NMli1bQ0b+QzLzlf2OpUrBk1O8KzgORLFAU++FtDeyGSS/ex8ioeTw5YZ6HucbCJJI5VvLisIh15mCJ1vLSTkMLHLHKFW/RxZ5pPOnF6eT/LC1DnLMkzXj7pYJ5NYn2zPRDoD3v4YiOeviPD9Af2tc6/jR0M8HhEYMjNi08dx/FH+vu7ZRLBT5T0D2ABqaAhYrEK8Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUAcMTtV1xVlgMlk13XDoxuyLZHlFPxA17fSv0+vKFs=;
 b=TGUxBZvHBeOsleektHtQYOSCxbwHWfIwKHDqq8XLmlcULZ0/7uPXB/NUejzzrX4nAGHT5mN3WtQOMz/d1aZdQXyJU8hnEM/8kNMEh1/G5hTR2B0oiXuzYkcnRhgJL0+iHxH5pXJ8cC90Qk0bqZa4D2ZvaoqX7O1Y1/PaT8XaKTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB14253.jpnprd01.prod.outlook.com (2603:1096:405:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 02:13:15 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 02:13:15 +0000
Message-ID: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Jul 2026 02:13:15 +0000
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB14253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0033e123-954b-4da7-69d0-08dee216a13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	z3sk73ZMESsB3xL10BdM9GNeEq6LQkNGo3YgVx2b9666YRvD+LYXR4XRyaPWGivsyojl5jP9BM9YlvpVIUHyaUeClqEnF5B12OjSV+WJVR/KHQaOtxNS7KWFmtKN6eA0wFZ0Gwh2blPNH+VLhe025Epi0LaJHErUDKjBB1XYUU2LHPnn/dOo1d6/+XHTQRfHnFnzmDVXxRNOPYZs/8foKxY1Dd1JWzwQq5dbeBZ3pqtywoQZhF6AlAjdFynRsHqUFKNR8RKhWJjDNAiTlxqs+gog1D2vfrL8eXUPERkIvl+BETLTXgDfaV72Dm+vOrm5RmSUcOaLW6v7gWQK6x/4kFs39BZidm0z0YUibfPpf9ZOh15KM++327AI0rEsBnyVGELf7Kv/K9O4r3sco5bzlRyOB/dIwrdJ7K3+F2pQ8k/CN9sFsJmSex3tOrkaHUpQHXMOSw0+qVs0H4pHRYLMC8G7Da8z1SibfbztjlUw50IJlm+/rG1sZF004fOsbP4HDkHtf0OzGrpm0DcaMScsygzNXx42cZ0qENFfOZYLuo8DIInVxsS64PWu8GxBO+bEFaDYQIRAC3PJsu9BsavLkKd6FLjX/WPyEKFmLEx9n7Gkj/KxrtJDc1Q/nLC/UrysbLK3et3JNvY/v1qVQKVUw/2Z/X93ZZ9lSadkV6JDmrJKb540zxyTXa+EF7TRWqNQw0TZwF0o6XaMdieRZ0nKUdyRbCUgr2hVeZ+46uQG47Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nmVNCsK8q1Ftg7m7vhL2R1DB8LHLIZhfWrE8yfgoTdi2raxvV2B0symDilNz?=
 =?us-ascii?Q?VKFKtSboP9A+jcSVKySLosVL2CPS4T72POz90erhydTVvfj96XYwxVw95Yer?=
 =?us-ascii?Q?TUH5cFJb+20bGjQB6YR7BwQjRBSiCncH+JP1J/Id2jyBQ0QEZLwiYpq0CR9d?=
 =?us-ascii?Q?I2IAba8TkqU6z8lUDqa3ybKQ/pg5NdmIb/pbspmrhbyx5e9xfSFLcKJXRpCD?=
 =?us-ascii?Q?OvsOwGPcHdOf21mm3em7MUlxWgra6IYustWR0rcSmmcRw/hO9Tul527yIo+U?=
 =?us-ascii?Q?spTOKjZZkO3lG2X5bFwyNlCEd082FA8WkHOX7/2L8MnbXsxmriDYIaTTjMlU?=
 =?us-ascii?Q?qATxQedsaUAFVKSoRiupfzbxZlaZfO8x4BBpMQM1h65T5jN0nY2HWJ+j0ud+?=
 =?us-ascii?Q?Kqa5iF4M36Pnbjp/A0rTRdAJzVKZjKJ5XDl0rhmfNygMEgy8yLG45rS+9pa6?=
 =?us-ascii?Q?4fOxo8r/mRvUF+DX4EQ0kg81zX5zb0Kyrtsp1DgvPsD7ITsU3M5FmA9QxPVX?=
 =?us-ascii?Q?jk4MHhQy4tkcSk1x7Z98C7DEku7f3U2yguA4bPQr73DPc0+2cVekEAk1AJL8?=
 =?us-ascii?Q?SnkV5OIgAGSMZiS20ndLETQV195Lk3T20uJPPHt40ui9xi2GMnZiaecLfV4o?=
 =?us-ascii?Q?7BmG9STbfKHgtY2KMKJ5bNZcHvtAyVU+U4JydNZY4e9Gs1Z6eO3jLjc/C5/R?=
 =?us-ascii?Q?YvkxvqAy9/qHtce1g7YT010boQvCAz459zlW9cGWcdfC5nnpnp7EwN2dNWSH?=
 =?us-ascii?Q?yNZSWAJWssFVGRQCb09FBL77m19nfsKJUsFT7JxYUnaZNlfGxFrvdadoF6vC?=
 =?us-ascii?Q?0w1HXV+m3OOouXH8LNlMFUsGXMKQ6RihCouJBL/rJbZqji+u/L2PZZM0RG78?=
 =?us-ascii?Q?+S/mbw/wLfQnlpE/pSU7hJ+WsHFEOJWfh91c/1dvnEoNSA41QYSH0PoQOqxb?=
 =?us-ascii?Q?sK84DJcv1xIWLliJ1IH9ejeYY77kl5uo7K+kShbeK9JQwrUUDSph9x+qZj9a?=
 =?us-ascii?Q?N5v/B33WlnOCrft0F6ezXNlwuzBr2TPU4w7So6cRc7op9TgMKoPNPbKvDjvU?=
 =?us-ascii?Q?WriklcH8XIgTMUuN5NIR/l5XHMIZfZz1bn6aQZUIqaKHQ4NJ+loYZvr7NyaV?=
 =?us-ascii?Q?JXuNYOLZe4l06Yeoc2IO9Wm47uodUFoWtLsrccv+kBDV0HY7GEwbnrj8qlq3?=
 =?us-ascii?Q?/W8GLwHJjYjKZxNRtYAqeZYH+FfyyUU9yx+MdH2MScBWCCwMKeYw9ZGtLmm0?=
 =?us-ascii?Q?AX498qu1mtwydyJsaQYJRzih3rMMRnQev7TuCXulAmsjr4qKclKPGyH/Nh6E?=
 =?us-ascii?Q?Awe3KSUXh8oryZVz/CP2Ii1PG6sUY+z87PZzY9acJdLP9vs2tXMjAg+YiFUS?=
 =?us-ascii?Q?aseY+PTGidrPxc9SoU9v++l0hoBJJ3fwTOHUNfOCJfETlG1uliUTh6Mht35q?=
 =?us-ascii?Q?6FHLvin/9pm+4bEPFe3nwjvh07puYpTQow5hkxTRX7cQqmtpRvawc4bgtlpV?=
 =?us-ascii?Q?mdW4vI8dV/gEejZskcHad9MMMwWfPsfxi/H49K1HKepfvyO4vZvgIoiOpswZ?=
 =?us-ascii?Q?D8mAtc/lKbdOzVduW0s72NS0M3s414PoRhcv4X7DsXWMpg3i+kbbwiDN+Q7Q?=
 =?us-ascii?Q?s7923jaLC6w6cjo24knoXWx5OQuxWWWPhZFiJeLT4ON/dP5vPl2BXX7dymJk?=
 =?us-ascii?Q?vf4b4nTFF6Xp5xbIOEzbgbZpf1xqyEU20Q46uPF/kiHHH0YPxOBk3L/exELJ?=
 =?us-ascii?Q?oYQvMnp+lLwK8b+Ck+mGl/xPOOu5wh0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0033e123-954b-4da7-69d0-08dee216a13f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 02:13:15.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tntM6Qg35+fXZbyQ+ZJwdVxYWf4FjkkKme7FLFBVhTjovi/S99839d2n1XzWwDI29JqkQmHV5PDrsBHGbcYtznmabNO4iY3l/QDKnOiLZ7A28bBgh1Zr6jyQuYTYCDaE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14253

"tidyup simple_util_parse_xxx() in xxx_parse_of()" commit changed the
function call order. But simple_util_parse_card_name() should be called
after dai_link settings, because it might use dai_link->name as card->name.

Fixes: fa6222d5e121 ("ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()")
Fixes: b8081307f5c9 ("ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()")
Fixes: 27ecf4da5ad3 ("ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()")
Reported-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/20260714103428.2318895-1-geert+renesas@glider.be
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c  | 9 +++++----
 sound/soc/generic/audio-graph-card2.c | 9 +++++----
 sound/soc/generic/simple-card.c       | 9 +++++----
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 73ea562ce52b3..0a8a6d891d1f0 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -587,10 +587,6 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_card_name(priv, NULL);
-	if (ret < 0)
-		goto err;
-
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, li,
 				  graph_dai_link_of,
@@ -598,6 +594,11 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
+	/* Card name should be set after graph_for_each_link() */
+	ret = simple_util_parse_card_name(priv, NULL);
+	if (ret < 0)
+		goto err;
+
 	snd_soc_card_set_drvdata(card, priv);
 
 	simple_util_debug_info(priv);
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index e3e92025b317a..9fb3d3df5cf68 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1344,10 +1344,6 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_card_name(priv, NULL);
-	if (ret < 0)
-		goto err;
-
 	ret = simple_util_parse_aux_devs(priv, NULL);
 	if (ret < 0)
 		goto err;
@@ -1357,6 +1353,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
+	/* Card name should be set after graph_for_each_link() */
+	ret = simple_util_parse_card_name(priv, NULL);
+	if (ret < 0)
+		goto err;
+
 	snd_soc_card_set_drvdata(card, priv);
 
 	if ((hooks) && (hooks)->hook_post) {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index abfbc9fd7c6d4..3aa4e722f4d75 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -704,10 +704,6 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_card_name(priv, PREFIX);
-	if (ret < 0)
-		goto err;
-
 	ret = simple_util_parse_aux_devs(priv, PREFIX);
 	if (ret < 0)
 		goto err;
@@ -720,6 +716,11 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto err;
 
+	/* Card name should be set after simple_for_each_link() */
+	ret = simple_util_parse_card_name(priv, PREFIX);
+	if (ret < 0)
+		goto err;
+
 	ret = simple_populate_aux(priv);
 	if (ret < 0)
 		goto err;
-- 
2.53.0

