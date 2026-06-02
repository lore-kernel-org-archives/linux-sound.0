Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B033BBBD
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368954; cv=fail; b=LLWgR7+r6KFIbGcHU+VX4STqMmM+DMr0tT3TtQL732x+KAfjffERdsQxJvn4snvbbIQm04YccXtefLds2BeyTa7mPXJ8Z2J3w40anxneFFzgmaDWv5+q3hIOZJ+CL4Rvro2fevFW5zWxYlKzy2JIxwDS5FrGshEpiMSC0oHo3lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368954; c=relaxed/simple;
	bh=VcOnvm7lZZiaqWb/EcH0hWrY76Tgdt+D1Zy462+V+Lo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V2/EZytrbpPP3vuexK0o3Qxz7H/5iqsOpGcxWfrjTrxlb40BFp8Yv9lM5zOCFmfb/eNjvyVhRjOoSI2IYiTjpnV3ZX5p/CjLAvR3unsreZN3b6JIm1J2tEHgxlHxT4FoxUv2itreZBkTY1CdANhAKVXIzCH5OC8+mJ9gcBTKTXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bWkLDkcB; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bWkLDkcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXjFMVdXmK/P23w48XoZEDhNllkDSfAjPBVwn7VX3vMFNcS01LHccxI6yFA+Kk6CJgBBTT/Uu5pC1jyfSlV1cjooDIYHwjqCpm+wqA3atFUykrPLjzcii99iIsv/IcY1W4cKED6sfl9FA8d2P0sUXadn40P1OJzsEwi7mm3gmfNsdIp8V3tuIvTlJxLFi57tr9PLcRGpjzM0Sj1zOaQm9zQaFsSoTS0kWyvvdhyITc2buJ+mih1L54rQlJwQcXdwjf5Y6LaiESL2igMxBii6xXMQulYw/tQxXqUN+6xmNIgkFtOok3BTtSjS8WmSdmPaH3ZYSdWPiw/FSHy140c8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bf1UKJqg+OEgTCgQk03FH745G2RUYFDqQ/hGGeMhCE=;
 b=cvmyzdyefg2JDqpq/7hnmC9zR1pTu7RWidRZv2u+Ckp9Bm11kgQhZ5PKNkIhqjQDnJ7KG2S6YZteH2I6bBZQAPvjmdwZ/E1OtBqBRAtTwDiA2HMBWNOKr1TmXX/ZK/JNhnAsnltu9Y12lvTg9GZ0h7qjOFrPMxGgq6ZFpTw17agkLxO0VLfcWg6iTKjHl6qTeB2rlajpCBIYGYmn/tY1R0lNaLBEVp45xLsaE3lK8V0ctzQkzZ2FTkYQBTUeFxPlephNKdo7r6pRYnWRPhw6uPl7T+Sdag8bSfDHe5YfY0CwL2KSE25IuzMqdVLBfySNmpl/OmdPNo8nMgx7Vf6RtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bf1UKJqg+OEgTCgQk03FH745G2RUYFDqQ/hGGeMhCE=;
 b=bWkLDkcBXYT+Mf0wXOqypl+pNju7l799Tym/lhuvXa0fWsGyCMIF++QU7yPbWXHHWegMhn2AX2/6ucDGVGkBIz58AfgwKXnION/FVutNLGSV8a/3G0L8/wMV5Rb7Kd402krYABpsyi6kXCu3kqVBL+QDCGyC3X01S7QZdIlHeHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8313.jpnprd01.prod.outlook.com (2603:1096:400:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:55:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:46 +0000
Message-ID: <87h5nlk5vx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: soc-generic-dmaengine: set debugfs_prefix via Component driver
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 02:55:46 +0000
X-ClientProxiedBy: TY6P286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c84eacc-fa80-4724-6fa7-08dec05271fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	LalQZA5MjWL7KVvcthGefukhfvIiZrPbYviw8Hxwhvh9Cxngp5H00iAO38wNyYbUS9obzhj3WPhDMQlDfptHqHn1YrDUGOmgdaAsSsZC9X5wgbhQpRyO6ijFFnS3s/gtb81+WawNJH61jyvJcJ1uhI57gKKTRWGbE1QAK/i5cZJLCC9F4Q+DaUOJFPaFQOJkM3TyMdB1TQZVUh05Otx/1VJAQQoMlb04m2mYwS2PLqY8rSltrAFoxUA3mi8f4Epi86zfFlNRaQftDiMWMvc6ca3L0L6G6IIj/0ZNsghJgv5E0/hpe5cncmRTUjf3ED+Otu13c65RaNZ+Rj0hAytNH+6h3zQW+i7dZDiXrZVkMjjihOFi75A1upuXWpHoYV5ovm8a6MkprfjWzomHBBANIjJN46O0Z9Eqze0RYQcreoLkPAxHPEsthPpnyBY+WGxrWFyuiOqUgLydN0KWXjkbLUo83bTuSVGR5pI3fXPZsdhnKHg+/GqkH+LckKT4OjOTQwYPgQ3q6LQ3lyYUo5k8AabmxFHddmw4IvhgBwjwEwQ8Dv33nz5WbH3xypfvXuvG1lNu8CcwOgcPWsRP90asSSvQLH5GzgNdwnnHxX/l0HEeai4nLfoWCngW1HjRnjo290Himu1g/FYXWfJH+VoBcm5VA0QCvDOzjRynzQS48R3JNExbb4yosaxKmKM6r1Utup7uv/4JayyiloIqL01jeZerdw7hWMpqbQw3yE2zFs29jzQgouQRzTZ2IWR5JhV3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6zEWSr6aHhdd9MnJLkFmQkya0hxDZ3X+wWB/+o6KJfthSfgjsaRWKI636nBt?=
 =?us-ascii?Q?Sl9j4EBWSTq0/S28ZJ/zWyY8zoSAWsUOmQguyg43UrVNom+wWJCS/iK3vT8j?=
 =?us-ascii?Q?y4uMu86f4IUcyxSK9sn2kx9bJaXiKN4CPhTlOGHMSunT7rmW+js/7kJISgC9?=
 =?us-ascii?Q?3juJlGyppZ8hEs95cymIAo+YxDs02hVjlf37pGiZXgK5S87mt84DrJSIytAF?=
 =?us-ascii?Q?bCD8BdOV6dpzQJANMOcc/dQAFU6XOC7cJkuOUkc+4TMBC3FXhbcaKcaWmAkr?=
 =?us-ascii?Q?hFl9hFeqNi1QwVwkAw7NGC9uLJN0uhEIRcgtyZwltCmIuxlDqQa5CVpQSZRH?=
 =?us-ascii?Q?WCyYaCTekN/q0hb5j024NSS57A7ZYhADSXVUu//esaCCgYgVd2FvHPwsaJEe?=
 =?us-ascii?Q?s26lMiFJ2BvIdZZkw+lcw5GFb18YOl1zPoNTsrQoHWXZrDtWcvE0Xt9Na5/1?=
 =?us-ascii?Q?f238CdtvYIWF0XzYE8Gqn+VgqictZz9e90ON0T46PTpVKeIKdyxDXEsu01fV?=
 =?us-ascii?Q?VnSvOkhfdiiMa/cvZOwdBazrkTybK07/2t4k/pTKC39MbEobmWEFeGe/9R+h?=
 =?us-ascii?Q?fycCvh3Xt1IBMsyWB4Jj8zPn6ji0lvbt0/QWMNVFK8x7SY1itCf9e13TigyO?=
 =?us-ascii?Q?XSjnN4/j6UEy7SnK3ePIGVliLGLvTSoqg/ALbq9w+bAULkTbh2oYgNksv5oE?=
 =?us-ascii?Q?rdbsWzIEToz9ftuOHTnriFBA4ttqOOCGHobYtkDiodRRrMdBUktc/5GEmkhK?=
 =?us-ascii?Q?Gsq375dOrorqHOC8i01rHd+jLgrgmuoGjVL5ruuiXGRAoPgmGtLIXY7f80v0?=
 =?us-ascii?Q?EzrMX3TDjki06hQi6onZRFYq8OA9eBCjyoEzfDk2Z0MZdDS/ns9o7FtgSQRX?=
 =?us-ascii?Q?QUQHCuZHWAZC10b9jRxhlaeQVfcfrNHCQ/B5lP7jGFkur9aG1WBzcOLF/adi?=
 =?us-ascii?Q?33Ff9sfGOY2w1OvTWBJX59NKFq6eZFVhFy86vhJPndKjXkn7PpwzJYqOVQal?=
 =?us-ascii?Q?qj6ZnL8cs6OzX3sJBjWvZHobn1ask5LLygfVbsMRyyceRCZ4eDPSeAy1/fId?=
 =?us-ascii?Q?Voux91Dg6C5abGgCDaHNAtfY/YdM91LZQnofm885hc0In6pOzzU1pIziW97w?=
 =?us-ascii?Q?u9JVh8mvWfMZ5aESf/Z+DprXOEDDapGEk1zl5RrON6YzfofBfh/xxdPfPYnu?=
 =?us-ascii?Q?ARROy/YU6Rm8xy/U3z6+rpMr4R1ntMC55R+8SZYasKgmZnb/qltBIxq9eMmx?=
 =?us-ascii?Q?I3UlXK8iwV4hbzoHYyef3pvQTFWBRXvTmpTWVQJgmB8Eum/Ewma83aIKPQ3f?=
 =?us-ascii?Q?D+erB8sjy2Zf0iLpKA0h4UE1YrTVXpcNnht3Rn5G7k1YbhC8aq0HscWtxC6H?=
 =?us-ascii?Q?t1CmiYeHyJRdO5CN7Ic4BvLhuOcpnkJ5XwR0NaEbZTswNhKg4iTP/XttH/Kg?=
 =?us-ascii?Q?0nwcJb9Gg6X7B3u6NLc7XiRzy7KKWKE38AJ0tqxQ8T/9ZxV8Q6uJiOvZYf5f?=
 =?us-ascii?Q?MxA/DUJyS05YI2xG0dVJes0XZxoUvk0fsgTNbwgwtDNkHU2aL7xXkoeJg6v8?=
 =?us-ascii?Q?0AyJm+VdEbIxB7e7Sa5eq9uwHcLR2sbXwk2kOor0u4Z4Z/0rVuYwY0xghoL7?=
 =?us-ascii?Q?JDSrz+izJV9QzvsEs+lSrTsYqLBHR8pcvqBCQTlKW3vsDLLt//1qmWLQsERG?=
 =?us-ascii?Q?9xWF0xvPFg8qj80rljmwcUU0WBkVXxY/sc1XOgfsVQ1lG77lAHi8tj8VTlha?=
 =?us-ascii?Q?nXBnsh3o+NjuqOmL/ak82zSYAdLjvVEd6NHOdHg9OdD97GngqAf5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c84eacc-fa80-4724-6fa7-08dec05271fc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:46.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUgIeVzI0f8g5dWJlnE7dPYuYVG6lVWRzmMF648ExmkXTw5QZh9sZvtzTXnKtUHYD55jYBqAIW5OY/RsY51PQMpvAzvb2Km3x77pRTaJZc4g6TB2n0FndY8tTiB6rQ3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8313

We can set component->debugfs_prefix via component_driver->debugfs_prefix.
Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 6b8c65763c828..467426d2b5e4e 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -334,6 +334,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.pointer	= dmaengine_pcm_pointer,
 	.pcm_new	= dmaengine_pcm_new,
 	.sync_stop	= dmaengine_pcm_sync_stop,
+	.debugfs_prefix	= "dma",
 };
 
 static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
@@ -347,6 +348,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.copy		= dmaengine_copy,
 	.pcm_new	= dmaengine_pcm_new,
 	.sync_stop	= dmaengine_pcm_sync_stop,
+	.debugfs_prefix	= "dma",
 };
 
 static const char * const dmaengine_pcm_dma_channel_names[] = {
@@ -441,9 +443,6 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	if (!pcm)
 		return -ENOMEM;
 
-#ifdef CONFIG_DEBUG_FS
-	pcm->component.debugfs_prefix = "dma";
-#endif
 	if (!config)
 		config = &snd_dmaengine_pcm_default_config;
 	pcm->config = config;
-- 
2.43.0

