Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB531CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064047; cv=fail; b=TXrbJwlmOFctrkIxCPJN2wTzDp17WkWAiUXfWESUQBJ/sqdEs6R/eQhzw79Huf64cBFo0EkjsQsrid+vhN7sSImW5BaL/p48pqPPYcy/oxlAxwC3iuptF0BMc4oo5IVcTypMVP0e8unZQ3SULpVW+VhfkGQprP3l+fhvEx/9TTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064047; c=relaxed/simple;
	bh=A2bANWUx91nNJ6Z/rqxngZ0ggcWaQH9Np2S+HpyPjAU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B52ctNxWAHN+hX2wr/LugKDE3IVw8X0ITipbJj3igVavdOscpsJ4a7IweaWgCgbAHbTPJ9u7gBoiJk45c9YP/pWnXalSA7ILk3XzNDOQcuSpdcsXPSmhom9f15DU+AEW8gn8CBHtLcmn43wx4Di7S2+U4L+0TeCGCaDkthMimYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CZrhrb3+; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CZrhrb3+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUUgzwl7Auw8Q/YGfmSDvakbehNnaPuUH9ra0xO+i8LzAhBvWFMqYej0dMUKMYq/3L5s8hMBD6gaevJYRA3aEdHBFirFdvKra8noGeGNklEH3b/JDuXzxsMBXsDct6jyUmqN2KKG0+/FmwhmOHOKgfMkb5oSAG0P0kIEnjwBSJL9Zu2WUodHutZEeqYe0BtFLmjovOHlj3V3HJoTfAtto1o5dD8b5qoJY1K3aXRB7DYEwAtIUqwF+5b5+aIk55mT/TBChAUFPrC7vX8ZWPYZcL3qTyYJIWP+3sYhH1P6U5CalTzVpT5pygEx1zImtw6rCeqcyrPs9L2yPM85UISaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kTdg0XcNvwyAj2rdq1d8zRna86FkaT64C23GKMxfuE=;
 b=LYMzTAFr50FsKMk0F2Gu3Boi4TvPwO0nfKrpkeVGoOWoGnUmBeW8zYgy8CODzkm0TQHLfYgym/mDFtdEQS+gBU3w3w4rxYD8YllBNUfKaILYUIQtbmAGtWjES+VgSuHgFkK0/rV6uT9AX7He91qTnV6jUtDZyMPmmdXpzqFjPBXI0OgxvdHvbmG71A/W7qc/lZWAo0n7No5RK3AUkULQNJys5OHHKnC2tzRMNEIiSL/R/qgXyvqYBiGXNtD+ysc1hls7Igzkbf/4ZQS6ANSGjO3hwBRJQEe4UwmhzVIzcdSEh6f8btQHjeXpQ4jmCzSxLFZqvPU81/FeDfUR8ay2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kTdg0XcNvwyAj2rdq1d8zRna86FkaT64C23GKMxfuE=;
 b=CZrhrb3+AycCuBpmLfu58Ocae5vrzZH/QeDp+RoBOTw3715jiXmkpC8jNe6MaXTc//0m5/ZJSZl8/u/IpYJwVKMpL/l74AB4oakUZU3ETwC1fNUQdaT+J8sqm4ZVbsV+AHOdzI7jqXkLTaSCtlcyEmwF5Iwg8Gfi3ahJlPJ7acU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:04 +0000
Message-ID: <87qzkau4wk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 11/44] ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:04 +0000
X-ClientProxiedBy: TYCP286CA0306.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4b32b9-81fa-417c-a866-08def41e60a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nuecdNGe75IxbKte3qEtiYIoT1DE3mUp82168oPX/Wwe6QnhLL3RYYzQONecBovJ7Va4ZYr+J3kFVAV1pRzH7eP+H406VeEXFf/cZ2UDBl4IVl1z27zSYscf6wyo2UOpPLZdYIOT3jdbAPo4SNXRwVFId4I+kR8foVSK9mEzH5fHSygV5U6xTugUqggYFVFioxv2i8y1m2Cs6fk+v9pf272HI+MN2aAgHz4qWTdUyN5CpW8dY9C9TqEb84q9E/01c/dh4o+6ihPRghSjB1/K13l1A9JoAZtrEDHNrKaHpGj0hLv/HZ4IDI45Z3GwjCoQpAeu5bycrnfsYi7TIK9u/HbENEzDLXYmokGda3rnjMg3GqPhDT8SCNB0gWlP0Am/eVBAEInRb8K9hEfj0kx41+GAKDXPOYworCdZxNIx0r/ViG4DO4M1dv59kgKRbZ99YiYFSp0aAQehAzY8b/eaSozShMyhsiRJ6H0EdZYqFkxN7M1GlCtrTdlZCR3BRnATKgTI2+4OLiM7BY6Y9ozmYILHaSoqQGHw4TORklBiwQS9D+ACkUq0eylBPrZe2D8u+1s1PZz9Gv976kxSgYBKoALHqT0ip0OfEONDzWp3S2S2/5L/rxZSytxCHluhzTJrqQTVMlE/BU+P22sCJEdLTgC2jq0VF0VfXF1t6/tnG0aEfDrQuuhkubDVVGSMYX7Y0zUMOM0PFddwX41ABABGmxmXMkua+EdFW1qfr6ZkwS8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tX3wV6QX+7I7U7i8F94WPlbYmL+XqijLpDIMCDoJysdv0rJOoUBsdNm0h6l7?=
 =?us-ascii?Q?tgCud9ZG3VoLIZGcxGx07a0A46e19OF4zYuy6bVVxAruwFjA+fC1QGDXpeXn?=
 =?us-ascii?Q?QP7AuUcpMISps5gUPUtB2rf+egl9oP7xTTtIWhapFeUvRWHu3f7KwtJzfwE+?=
 =?us-ascii?Q?pr7KeUB0S0bfCfsz+QyBdhjiuJTOkph4MsaCtShI2UE/0Bfs+AOe42uw8EF+?=
 =?us-ascii?Q?mmfCu1qKuFhDGIMcsYVw0q09bgNBYyQlz2jG1B8CW/KEFxcZ54YA+RvbzBEx?=
 =?us-ascii?Q?nux/NyyFDrUPTSbXxcEoaqNMD+S4jHHGw9u5XOh43tLWU70xq8+MGo32fCyj?=
 =?us-ascii?Q?M7PvffnZJGcaC/pGzBTxCmjePYrllaWAXKRVJWL+76J6TvHT44OiidfGax1s?=
 =?us-ascii?Q?iqKdWoeDWdg6BcFxKM5ypwf6cEukKxGsqlmGcC9zzYB0wGp6DSSMau9w2Tag?=
 =?us-ascii?Q?eJ9vnP0tkab5YrXGlnu6OYARgmi7AJh8qmHDosMZC2HOCNhdpN7daxafCy2f?=
 =?us-ascii?Q?TtiNYnmdGbK19vlxrfy/K5QRRfEOP3muwlmdPjPzni8hVlP0B5RflYrYQlye?=
 =?us-ascii?Q?uQdhwsqkCMHktGDJcloRFtXD+pqJKUcU+zCbr28TTtd2Gx9bYtrRO5dbcV9X?=
 =?us-ascii?Q?JfB7Ql7ziJgYRED5tJszwA/LAuFGRC1BYXcYcB/oyHRsexeumh44nMtPiYRl?=
 =?us-ascii?Q?PIrsPl4hv6GflTk5Iock6d/+0p6QPphn+7+fwq+K5pt5NqCRruJryZ3JZcG5?=
 =?us-ascii?Q?qQHPhJ91xuxYbnXAdJ2WD5N6sOSD3lNlYFfPr0XuEtLl+pQDbxBCj0TtJUOq?=
 =?us-ascii?Q?ugVgnN4KpLXnwaMEiesME807HAcOWdqJ/TfgOjjzPP8raodjkyaUs6KCaZBM?=
 =?us-ascii?Q?vV7kEpdq7mcqlKGfgYs4KMhprZV6ZMSh5W/8QC8lvKmCIJkz4N7KmloTvtvL?=
 =?us-ascii?Q?Zl+WRGzUkaCW2s2hbwrpk2VsbeBFW5F5Uzga7iET3JnlRwCTEJ9nLQ5tQA8h?=
 =?us-ascii?Q?3UFxkXmndJavbs8jE+hvWf1Ug6cdmvr/PJUeprOZGdY2ojZ4xxEzEc6re9i8?=
 =?us-ascii?Q?3AeNcUpa40KNRyBTHRVe8CE0za3HZYYG3KaoMRbfIEIwXZXb7+hFbhTvOQEf?=
 =?us-ascii?Q?7laG00WLaHT1p5zYXr19+jHZ7oiQjGQzVW61Mev1E16rhVnYaq+399Bqhrlg?=
 =?us-ascii?Q?XORkC8VzBIeOkJF5bpnTe/OJkwnNb1Oop+USdjvQQ0i/b5FiKyxoFpql7Azm?=
 =?us-ascii?Q?lCYXymBE4tcXaKwWiXm8A0DP9/tCKsUADwcPXBDeWzoY95OzmKAZP0QJrhQv?=
 =?us-ascii?Q?a1RBjiScOi7HyF73AHvMzItrFcjvoIOQqilkNT5huHiI6TyCleKasJKqDlY6?=
 =?us-ascii?Q?BGuvwQGNbQRemMXAw98dBe3iAlV/3/0Xjx0nwubFBl2Yp3dXMvtkc2VfAUYv?=
 =?us-ascii?Q?TycMjH/ZW6rUjl7oXm8tRejX8TCPnwJNWQnmr9/bhk5tVWF9rO6FsSGQAlDy?=
 =?us-ascii?Q?32K1WLWiLiccVGawBH2Q9T2yygtK4RAeNxduzm65VufhndWztGY5t4ZDgYFj?=
 =?us-ascii?Q?fqPUg2ztEzWKK9xq/1OnnIh6V2o42auOMGt/CcgPumAtldPSenqWip9Mtdsg?=
 =?us-ascii?Q?MhoVQ6f9kU20yD6Gh9P9haH6LDpTHtibJk/8vreEl5Nm4ReR6YKvPyIHRR3R?=
 =?us-ascii?Q?DFigKcLvN5ZlACRvu9qrHkO8XQynOzjjH6myJOBv3aUh18YYd5h9Dxv/2SlY?=
 =?us-ascii?Q?SdiuSSusQnGpWt7hpxqm3uSNXWkcfaq/ZSeQt6Yluj92vR/rUBxp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4b32b9-81fa-417c-a866-08def41e60a9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:04.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iubhaQSOIaNeNw6PLu9xmakknW7pWcD2PXKoLxv6eIsUGeE7ElG4MrUs1L+bFPjHMFGHB+Ognlxg3+/c33XWagiIAYMehpPY8Trg98WbKMLCAIG1ffZ80ZwNR7Hw6nxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cros_ec_codec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index fd2d5d7f92769..1148e37e29cee 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -320,10 +320,18 @@ static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
+static const u64 i2s_rx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops i2s_rx_dai_ops = {
 	.hw_params = i2s_rx_hw_params,
 	.set_fmt = i2s_rx_set_fmt,
 	.set_bclk_ratio = i2s_rx_set_bclk_ratio,
+	.auto_selectable_formats = &i2s_rx_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int i2s_rx_event(struct snd_soc_dapm_widget *w,
-- 
2.53.0

