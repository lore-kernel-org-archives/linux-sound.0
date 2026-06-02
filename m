Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E7368D73
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368965; cv=fail; b=Q074V01qPr0LoaSMfcnswuIZhSrS5A3RcUiG4QlSt73pccjWrh6CrUo9O5cbR9HdV02ZwnbwRtm7KqkfAAdo2dO2JLYEqo9egXBW3zIOfflbKvXceMyoLt0U9mzoNaQhYR6Ra7YSYrJz6km7ileRBSWOavlcu1sgxjmcolSa2ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368965; c=relaxed/simple;
	bh=Rjg8iHNGZSbO7kHg2ax+oujYUipkS1pNrtwyY6/ygpU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nC8LwrtUVVXm8mH/e+3d9fy6NMx0hp8ay7dBTwwI1lblWVB9HUvf8Ia/iVsfY/+QKWBB8mEkM3PnTBNO5eQx7yQagd5ZTElnmLpnV99g7ZtlxDem1Vl/LmNT6KCBBDQ1SjYUZbtV2hDqQ6QASiOH9bq9EXcwrgWUUXZZdVDPXso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bC0Gjpk8; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bC0Gjpk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuggtPlHevArg2Hx+4YWZ4eO66inkcEES0+G9C5QAQzzigPU44UEsKOQGzp+PohZsyeWsXV5mNWVlllHUhk/KgUpJxqq2WHeivl6LaE8GsHvpga+9mW5dqVm7KQ2fUyBk8UW3av4xeSjYNYDey4LSS7wQpIgVR3yw++TssWTQOUL4dQWPSxlk5m3a5/xxGAVV6LhQuZHBuZJ5EY0m2mmga+TwtuEQeRoQ+gUNUjXlduapMu4MYoxJaOhRpyWDLfCM93hnyMUCzDWeesRseF7xeTTZEFQGjfnGvRjQoAgsTs9tmsxKqm9xjNsaKl07j7W0vssb1tkxh0PM16ru8mVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGY5GQqpKBRF6BvUDdCax/mk2vKEvLFQM+Fc7efjSfM=;
 b=vYjbeyy2SZ6N8chfAdS4XdtSs+s8REO2sR5SkxY5C2b/vE4gwhXpYYtA9TYd4sXVZ0hRwTT80zT7YBmSzJaiLgCE/sRYnlcVYviTierCJPKKCOyis9bHlDNOq7h5VoX4xDBJEOtX5zcUUU8gFYLF3wDA+i2/3YlLEwBNmbXApHEhc4Inj/e1fX4w1UIh9JCWNLF3M+IQ2YOCPydBIdIIVfV3bVRVtLR09BXMqrxfnFxObPEV6lS2XlQZhGrwyaHs+vyy5t0o9HXIiS2A8EjHoxc9LjDZzqEMorzXGnw2qexQAskx/mcdUylsj4zF+BfbXsPHtSsCvXiG3bYXc4L1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGY5GQqpKBRF6BvUDdCax/mk2vKEvLFQM+Fc7efjSfM=;
 b=bC0Gjpk85nsVtEr0wf5jxfpei2qm2hhr5UESlBs+rBbPhxe/aAm5qRRZtcH76FqOqv2Y13c0pLlskDSyRwOPy73qVGkWgSKjDRMi/3H8bkqYMNwhwNO6xXLk2jnECedG3mHGyYMjmdRJyylgE8U7AQT34CKz3si8Q0QdcsGKkdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8313.jpnprd01.prod.outlook.com (2603:1096:400:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:56:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:56:01 +0000
Message-ID: <87cxy9k5vj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: soc-component: remove .debugfs_prefix from Component
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
Date: Tue, 2 Jun 2026 02:56:00 +0000
X-ClientProxiedBy: TY4PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: bc155ccc-77fc-475c-2c2b-08dec0527a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	GBmr+N6b5R7GO1hZfGnr7y9PaX1IOg0NgRosVmBTi0jIuJ4gFe1acNhZlhj6+/xHknlX7+HVLmW/mKBQY5JRFFwcyfI5AwgiBLRIIa6M40zJeDIB8lcWSnkP3+U9DJ4e29U9XZuGjmdRbBx6qCq1YyC+eacutzBSrFBFm5U11GLhj7Gn2+0KyOVg+A5RZFxIFk/gHR/oTCAb2r0JZzSrno7tGrYPdrEn2ijRV4opz+2KKK94xy2YLjfbvtyxR6QEW6fKIeAznCj/EQ+80VShcYbc+Ck0txBYBQ/F3NPJIGAOYIhvf+Z4vHkY9BXIYcwK4pJWMPZdizI9Vc6yNC+jN537VnxeOKOuHrLSqvELDJHPq5yD+GvY3P10xtsgd8orh70iWUWVEqowQ2vB/sGJDfFNpB+0pkurTCisCzmahMWPVaY0ekZFOOXJcXlnSknPI1evjSkBISssRt7uoOtKCTfP/jsm7BNjscjXgEGrHRxbTQRfA5MOycqYesLZxg9ENaz8yZEqyMMFDB0daiIAh0gdplUWkn3UiCHNHn58VNvlQPKelVXnnLkQ+AlfJ7Ign+PVJxfhgM3Lbut/BUDHBYN7KqEGCZrS6jwP9ubZNUJAlUOFZHuFlmlhFfhU6FUdow24LXxmerN2slLOIRYv8Z2GyMorc6yQt6ELZPdbZRQgm0/w5oXFFLAMI5ccRnXqjs5gDK3+iUWl16e0sk5Cbmn2Yp9kl8ggccs8tedw7nRM5dOucaSSkzxaZO6fVMQA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GD4gQT3VHLHSt4BQ++OkZEXn0aO3tVlbBgwqwWhPsH1qs6tSh230eMAEcZOX?=
 =?us-ascii?Q?UE0btg41L9A412mARxXcTO625i/BKP+XM8FDusqTTWf90JywKf76pHqNminG?=
 =?us-ascii?Q?1/BMybhIuRPwgV0WYwy8WIAd/TZbxv44Kst6HGzMTKH1wQaeEvj2wVURh7NL?=
 =?us-ascii?Q?P0zzF+7PcZnUxe7dO77uSH4o2oykZ42xZEyYj0it/cXcHWnQUIR5nl/PX0oh?=
 =?us-ascii?Q?JdQ94eDEkEaKgpO/oY3nDYYMl4xGSNk1/G9Zp15J8RlFHEYQlkZ1oAcI45nm?=
 =?us-ascii?Q?DtQCTwXbtDXcD77DxC/YMzXQtJp5kncLGYkN0rVhjeSSXYWsggozB/zqwQzG?=
 =?us-ascii?Q?0lomxLM5Pac6BYxWHHCZIL7Gc6b+Ln9EUsERL5wqSgl/1irZdSvVfELSckCj?=
 =?us-ascii?Q?CgPWDF7hB/L/3pbRIJwKSHavj+AOjl8HJyoi3quVTzqYyMy6NC5SR0nKndkD?=
 =?us-ascii?Q?S6xLkc4oJQNaZ8w9yIGOT03SOau+JpqsWb+GuA1os/LbqHR+ebaILBcE4HDj?=
 =?us-ascii?Q?3Kz9ojR4iwjyxdWALvvkzAz8Zw456AaXctDDnS7htuN0bIKwVS6EDQHhE9c2?=
 =?us-ascii?Q?geV0N3AmoZeHvBq2E+sIpR6t6qYcZrcGvQOjGRaAqE2mgMVfJDpvlxdzQp75?=
 =?us-ascii?Q?sxHdXcJWD9f+bfFXySs7tZtRQA6rLA0U+A1SqgKMdCIsz6VMlwhgfIP2PwD4?=
 =?us-ascii?Q?mQR2JAjBqT5Ww3eoAV8rZJOXR/XyrBRI8KxfQ9jouQulsBdj0o3TNa/4StQN?=
 =?us-ascii?Q?92PmA2QpeNcIkmxiS8dTFIsav1HEueJohMcFUEsKcT6sGEb/8IHMMvf1igz8?=
 =?us-ascii?Q?eFOZPvknhLrSGGI76XHCPeSAIvrqgKgoENnNteRnouOnFQlhVgiZTc+XJsjT?=
 =?us-ascii?Q?eBTmHZnF+TgnK2hhpK+e4rQ/pmZw49FzHhskL2oiklbsGOTVVqXJGRoR/Fjx?=
 =?us-ascii?Q?Fmraj7uh+tCnXiMQz7AgrzrWhSWh/usy9Dz2xBIejqKfC6IfJdaAgp1Y+3/M?=
 =?us-ascii?Q?cZTqDSbmwCP48eudDe8IOcHRDgpe0kW07uuHk/o7BT8gFGlx0HKGwqyb9P2u?=
 =?us-ascii?Q?9C0rYoKnkMVsFVtzMbRin7QGPn/afFUT+V7IL80l0lS6mckRabd23peV94ep?=
 =?us-ascii?Q?R3zq7Orp3SfpFacv6Fdagz/34cjJhgmbOVoKCU/Xjg9fPPGEAJ3i21v4XwaC?=
 =?us-ascii?Q?DegR5MvIvirhLPv7jgRRX7GhgitC+/k7o/5n6USIA6PXmBFncG7Fq1CIS515?=
 =?us-ascii?Q?KEXyYAJSbCG2p3au4Ks2WwURF4cfKKysC7YAScx7axBb56opQ5QfnWxhk6r2?=
 =?us-ascii?Q?F3ERyb2dQeSW8HE66glPGmzGIUWxLTMBci9o5EQX3MgeC9c8NrWPrlKr3lGi?=
 =?us-ascii?Q?lW0cOKSGMbJQBNCA2ChKohTw0exNFSt3pQn2SSc/jG1DzArgeLxFaI6w/PqN?=
 =?us-ascii?Q?af+8nyIu3FEi8rtXwQIdvxvjBshUHcTYSJLhZGY7pk8wp74G7OWi8yhzFjiB?=
 =?us-ascii?Q?dMPyNyvqIRlngmfxPViBWGzCk71Do5qfCLM5pH7pRRFO4CYqIGP1ID7PsDa2?=
 =?us-ascii?Q?JHb85nYjaPHXDH+p0G3scfa8Wp1wrhAEVQ0xaNeXjTFuYNKMKn651xThDjpv?=
 =?us-ascii?Q?qEr62sFOCmdppNDFgvAeNYFbz41y4dF3GJsnTm2xF5plmgocV5+cs6Exx+Q1?=
 =?us-ascii?Q?3G+jq80J5EYJANFQ+rO4ZaW5dONLo4cYqlQU0RmsJJr663LeBWWtG58BzSx4?=
 =?us-ascii?Q?gsh8ZUwYm7s3fVR7dxFkMab20ShnY1oM5NLdeLWRGZcfyax0+hCS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc155ccc-77fc-475c-2c2b-08dec0527a9c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:56:01.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1c3aJJNHJ9IhNz86iA/e4nTg3dr8mH6rf/55YkhH8AXuatNpOouaLQHA3BEPXdvXCG/RGgXKEjU1913TUvXLUYgNxD8cpiQOLJRfbZh3Djk51zrE3GtG9uI1CbxPdgH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8313

All drivers are now setting .debugfs_prefix via Component driver.
Remove it from Component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 -
 sound/soc/soc-core.c          | 9 ++-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 337b7ef4156c4..11bc9527653ff 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -248,7 +248,6 @@ struct snd_soc_component {
 	void *mark_pm;
 
 	struct dentry *debugfs_root;
-	const char *debugfs_prefix;
 };
 
 #define for_each_component_dais(component, dai)\
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c0599031a3e4e..e8986c039aa54 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -136,11 +136,11 @@ static void soc_init_component_debugfs(struct snd_soc_component *component)
 	if (!component->card->debugfs_card_root)
 		return;
 
-	if (component->debugfs_prefix) {
+	if (component->driver->debugfs_prefix) {
 		char *name;
 
 		name = kasprintf(GFP_KERNEL, "%s:%s",
-			component->debugfs_prefix, component->name);
+			component->driver->debugfs_prefix, component->name);
 		if (name) {
 			component->debugfs_root = debugfs_create_dir(name,
 				component->card->debugfs_card_root);
@@ -2842,11 +2842,6 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	component->dev		= dev;
 	component->driver	= driver;
 
-#ifdef CONFIG_DEBUG_FS
-	if (!component->debugfs_prefix)
-		component->debugfs_prefix = driver->debugfs_prefix;
-#endif
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
-- 
2.43.0

