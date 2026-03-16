Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7C33ADA2;
	Mon, 16 Mar 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654641; cv=fail; b=NFDnWogrcQPIINmx/6b/4VxRXo5cBrfPmRrB9S+9Uc/PC/AyOvDXNXyDr7DrYm9sE3c1mlLKPZpCksR+q+iHFcOCBqqXlfLq2KETwoGmCzBZfTnpMDGsgI2qKQ3XKSdsbEBQTPx2WRd3oEk/ptGoF1UBNrtUMJAgVXCdccuJads=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654641; c=relaxed/simple;
	bh=MBET0E4TnWCfJystyltaZMsrp0iXqvzXpFoM3tc9dh4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ECso8RACXgaj29Yh17OntWvU4TKSgEsq0JkLaZyZhOUR9vq1W/yfiywuitJQ3hxWoM2H9Oyjt2UsItF3Xv0y3x/iGnmJ12fWcJivDYn28aB5uylIz62jIT0PY0vAHx2K87rfBGsgzg2C8YE9IJIjP8hsq6YA3KNp8Lh9k1SoFkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OVLlLLak; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OVLlLLak"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIcF5hs/Yd0Iyu9d0wShP8u2sO7YUPsxW4p4AnGDwCpgpC32nYXzddboSNhX1Jq9zLmltjtRmvJ+Uv8mEWFQzR/3X2egqWv+3pgVvhVJ3rb5rl9KP9268QqCY7rFxBvGjeOrzbPUTX41T6RLQgDv43u1/uvySiVh9S/3gYePiEo31TAg4fBUcUqbdXxqjgYAsjubd6Dk8ZW5qwIOqVQAjjO2mitGFbT21XPnBG4nK7uClKvMc6+/bsY3zgiht/u7ssyajPHuUnNLvH6Fz1p9OtcrOEGpLjGQmFR+ZQCfi0OZiwQK7zaBOK9wKGZC5TBn89Fzj0VENIqB+84NPFWs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7FEpRYaFE5pj2evMqeXsMcSW8T1urkiY6qZo4IpE5U=;
 b=u6Educjd/k5KKGKTVnKVJX+2m8xBV7GKdjp7RszI9OBVzsrkRkwQrWMv6ousNmTfYilARK9OmsH4Dj5InBILcW0O/AIlo0k4Db0pHcPY4bz/qAjM0UsEBMJ0PYZZ2S3DuFg9/TL/DZk2EuMGWVBKtjquMTPCSC3/xa0u52Zkvg0019HEFAibulFYzaBbeqyUB63sWhO3F8NWwgxE3bwpu3r19hbAuIJmI7TtfQ/EMEFWF13JdmBqSLsjAMSUSlA52w7+Vv8srzLX7KI+PNi6r1OXhP0WodpxXmfc7WQVwin/OKDgEko7kHpSxCrSqqIk+Wm5FZFP6+lyDEU/Y7wwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7FEpRYaFE5pj2evMqeXsMcSW8T1urkiY6qZo4IpE5U=;
 b=OVLlLLakxSrxFMkqIo+s2MjHZbqDZ2ueSijDae8gukU5bgwUYyXhgmyLFk+8KwjPAY8A1Ua8vVd7TsWqc2fXZubj+BG07ZDy0zvuYS2EQIYwSG3/FRnEYzrSmxvAXLurHskh5aqzHmRkvSxi6DfMKKNoX0uXKZDJr7kMSwkdpoXwwUxVYU19+4jBdZrJVuS2yMZZtHAQT2+4KXlsy2OKF5UNQEFyRRQ8CJnh6qdEZnNE7uphHrOggxkOJr8izQwZNZq2BO01rPPZV9zEptqrg8xNEmSnVc03nlRzl3W4s2V5fMBBo8JxGcRPNaxpzpZAMcUwRz3kHCINzowXCefwHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAWPR04MB9720.eurprd04.prod.outlook.com (2603:10a6:102:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 16 Mar
 2026 09:50:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:50:36 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: simple-card-utils: Check playback-only and capture-only input value
Date: Mon, 16 Mar 2026 17:51:56 +0800
Message-Id: <20260316095156.3913910-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAWPR04MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd0ec26-b055-4e98-c043-08de834178f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wi1XMmnNs/o/pNHdiBbVgMr9ifdH1PPEEQHk7eeP63cPuypWqXgBZqPRj96LHuhpOYvOC2DviHcq/f6W0gZL4VIUJK1twq4IuHyIcGGOtVo0QT42dtaMlrtFrK4eoAZ7klre9EeSjcxkJpDBx4O2fXc4h563env3UHuo7pZjEMA0EU6x2ykQ9UYAToo8QodOWbFKlLNU+QF02kNpEK2o4l1l4ERQIiYdoFTArIaz7PV0YWSCH7UirnlWjZ56cnwqHcR1ydOmTI554ypQIYWcjI5CyF95v7wFCERGFOtkMw/9KUv7Jf5ue0nGnxXYCDoKZ3oUh+w1VFhG7Z8cCPJgNantTxRlIrpIpuklUOjHBUSfmw2P8CkXH5WIqdG7kgdxwJU6uqcaMlGiasz55WnWzXTvjEjBHkcJYkOTTcRk1JxbdVWVv2UnesFjUm/gCaT25aW4HKrxBcf+kwqihLtKUJ6NaSa66i0zMPnIz8R43H+q9iSjIKvz8p2EQDl2Ej1Qjc27231vCDMLyP6JFCiGaQtSZTBxX+hy1TCo0Ppu3Rxy9EDoEZqyWWStF7F9dlfZ4/dLwd2B1K4zIg+wKTlnaNwutevFvZpUAdR4rczcB6Nuf9slES9hUp+8uIgufsFGZAh0k9GFmiXby6l0yA0DjWRRruF1q9gMuyPngnOm8pa+ItB6KLsMXZXo9dky2T+2WFgAuADWQGnuM8keD74sw5n4oPBwqbkDgeFWsJXAXNVIKgqyOVdwItIGr4KADCtaFgyqcqw2N5ZDFEHMfcKfynW6o7G2hAUNWZfQqWKh+x0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+rEWTvCcymBWptlxHx4pdGqD0ywFGvfPzAOclemfGZRNjQ1licH6IWKXVULC?=
 =?us-ascii?Q?amVoiY8wkMh346mSWgO8Y5pyxshAWavTfYBsSCuFlOyIRQWCSoCipL7U1yEQ?=
 =?us-ascii?Q?3lzhuMwNyJ9ixVfknAjWnQJxlKqaaNEogE6WtiVJD4ztDUM4hHIOPBgu6kNh?=
 =?us-ascii?Q?5YrU23Bae1EuAr+czneRT4aXiab8GQaRElOsxj2Ma0Z0hC2TeN4OGTwE/d5n?=
 =?us-ascii?Q?4flIL0lh1EStZXlaGfMx1zlhinmFEvu9eETNn6B/C/w7r75Ua65TxG9U9/w0?=
 =?us-ascii?Q?Hr0+v0+NJQ4rDqAPAOuxekBrk78n8l80nqlOFYnexz+msPbzvdIGZGSJoaXv?=
 =?us-ascii?Q?k0V+Y2S5S37xwwaNh6DVSG/PeZ2xWVWTRw+Z2oGGGZkEeJI0R+SZxuMUbuvt?=
 =?us-ascii?Q?54uKj4XqSxkN/+HA5LiJhalrY4SfsqxQ/kkgOfgnc8t5PlURYyCMiv5qPbXK?=
 =?us-ascii?Q?WygHU6anVu2Q18plWrUUqZw8me+BKrkDZ0FKcx1+isnW1q4I6KCBQs/v0Knh?=
 =?us-ascii?Q?9ILBUOTJXVoxX1gri2RRriKiklLgbVfhqOyh3BOBFVlTMZQMRZW+6F1mCPhf?=
 =?us-ascii?Q?8IAC5UqDK1WlrQK+BLLfu3V5cx3oG6MgLMu7QGDfqKUbJTfMYovLiajjUjcI?=
 =?us-ascii?Q?ueAdbsSA0roLuLJ9hYSlgrPb2+aJ5zRYa7QfmjVxrtCqer/Oao37EICxRTqH?=
 =?us-ascii?Q?Uq1V76GtODCadZ7LyHetmp+0LCUdArFVtlGtXTX4jVREeaZ/x+454iT0e9ao?=
 =?us-ascii?Q?fhGtHIcO6kKiqSwwbMD3ViO5+XIa17DK5Ub9X6WNYxo0xfs2cVYFss4BvVlL?=
 =?us-ascii?Q?m99dha3xL6YMCfhzYzxIMiC94uZa0EmMJewWNxex4dbF7kL03CDFSeE+HilN?=
 =?us-ascii?Q?ofTGWZnCj7ptpIYxfWd2SDcHhrU4D678NoTgvGr/CBV2DiJg6syb9p1EZmza?=
 =?us-ascii?Q?5u7dCwsCLRC01heBOzugfMaCCRZ6URd6CvuUtyhLc7up5F6YqGtBpCnCIwGI?=
 =?us-ascii?Q?7mBYq6082WtaQ+cc3BTXlzQAMAKvrmX81ltbRoZ5/4E5BLsrJnNXvteM3LOg?=
 =?us-ascii?Q?gRK/WMnYlaMJuVo0XP34/eOpBulTtO5ErtDFDlnzpkpE4qCZZiIykx9lcbmd?=
 =?us-ascii?Q?mZ+XKNciXnbY0jYFQw1U3Z7KWoKtf0OyMxbFhWtDkqMrmFLc/B0kmcLF+LbH?=
 =?us-ascii?Q?S/wj7hsRvZOqIg40T9b7bKG2qafsHLYtfAnIh5ot4V3+oajjQy0EfGdrbBRH?=
 =?us-ascii?Q?vf0whmSE09A8i7hdLiUzdobSsvqsmYexQ6CqeqBWI5kSkegIZ7wBF2z/FSrm?=
 =?us-ascii?Q?/DE0vf6mCzV2riajzMA6lvWCuIuJwA+j9OdfOTd5Ed7PZw2954M50qIw7Gw6?=
 =?us-ascii?Q?EHiRA6vSd2737WVMM9EvYQyzjBc7AyRHy3hLFb0KbF6EWE3De9oUrVWphGQ6?=
 =?us-ascii?Q?d33wMAg7KXIvkR/vKE7TDZWS1zZfA60WBTwHgzRfHq8Ea8O/kZaTYnpeqOOZ?=
 =?us-ascii?Q?/QFPxRfUUhN57yuN4Kar/BneGFGCXU5NF64g2VjO3Dl8Moy/a2vR9nwV/eEn?=
 =?us-ascii?Q?i4bRIeuqiNiP0mW/jy3KG2c+Mm0xNllEPiYXcEBU44JaOqss+GLcPWI3j/7Y?=
 =?us-ascii?Q?SJtlEIgVRCovrH+yhbndjf/mm0AMwx1XgHtN5tcc66pm8snC89ShGm1I9u3C?=
 =?us-ascii?Q?4Sx3h1EfDSUCJdjzP2Hv79wQ0CXn9hmcO4s3wz5KQDUMKJZUiDEBfPoJ+dKX?=
 =?us-ascii?Q?7Q3OF6rQfg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd0ec26-b055-4e98-c043-08de834178f4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:50:36.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4AjMVSzF8T9X745SIpr5P3fE4sy1d3fbypzCckYtoO1zlJt2tmhS7lGTgIg2HA0FlqOW5o/SY1GjLH+JykNbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9720

The audio-graph-card2 gets the value of 'playback-only' and
'capture_only' property in below sequence, if there is 'playback_only' or
'capture_only' property in port_cpu and port_codec nodes, but no these
properties in ep_cpu and ep_codec nodes, the value of playback_only and
capture_only will be flushed to zero in the end.

graph_util_parse_link_direction(lnk,            &playback_only, &capture_only);
graph_util_parse_link_direction(ports_cpu,      &playback_only, &capture_only);
graph_util_parse_link_direction(ports_codec,    &playback_only, &capture_only);
graph_util_parse_link_direction(port_cpu,       &playback_only, &capture_only);
graph_util_parse_link_direction(port_codec,     &playback_only, &capture_only);
graph_util_parse_link_direction(ep_cpu,         &playback_only, &capture_only);
graph_util_parse_link_direction(ep_codec,       &playback_only, &capture_only);

So check the input value of playback_only and capture_only in
graph_util_parse_link_direction() function, if they are true, then won't
rewrite the values.

Fixes: 22a507d7680f ("ASoC: simple-card-utils: Check device node before overwrite direction")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3115e1f37c0c..e1564c1f7d8d 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1202,9 +1202,9 @@ void graph_util_parse_link_direction(struct device_node *np,
 	bool is_playback_only = of_property_read_bool(np, "playback-only");
 	bool is_capture_only  = of_property_read_bool(np, "capture-only");
 
-	if (np && playback_only)
+	if (np && playback_only && !(*playback_only))
 		*playback_only = is_playback_only;
-	if (np && capture_only)
+	if (np && capture_only && !(*capture_only))
 		*capture_only = is_capture_only;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
-- 
2.34.1

