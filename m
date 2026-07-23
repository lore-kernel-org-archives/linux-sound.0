Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2513CB911
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788505; cv=fail; b=Abkw6u4ifVL0a3opYGarhiO93Kb0v8D88IDEvHp6SOhGy83Je9ILEgr7kaIJHD6ojjV1X9qd1QCuOoYl3whEXouD7tC8J15P+GnJqC0hjkHZI4hQiFldYNs+YT1M3a8aYni1vKJelh7ussBlyxzaNyHo4V9+YeORTZfVSCkmtJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788505; c=relaxed/simple;
	bh=RDajbSWteOufqgrl+1yfU8QZOQub5/sJV0mcMPaBvV4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LObuPiwPSO/0E8XWz9s3rwxv/aRHfawbxuIdrSJa0wSANgQ7SWFmcDIaqVJ1FzZI5BeSLkNckf8tC9GZxy9GBMSDP2nq0i4HyCl17327xOjAXVTozlVf/JbBrF57vSFT06UzBQsIzyfPTciEaFNcI5nsnXMcuScyDx8IdhKekY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QQK1401X; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QQK1401X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emB22qPHJUtQ3a3quKPQJHpOIfZAXATitqrVC4lQV0VYTtTx0ufgHTg3qeLOqAd8PDTG2jrF4rt1aYUET63PAzGgYnddHeb4kkvbOrzS6IwaIVpzA6ihGKqcGV1WiInzlcTpR9Q2v/WnlYw3Ut/aa13X7u0PGwgpA8g6H/MNlxedjEcBjgHfKaf68IrfXDDNULfLwk66zo5eu2jr9lVP4QmkPsJKTXpzFh9aKYnwqpCdVHejeodI5vQGwbGGl7Nfmi/yZlbpZZHk/oFw9HqtIjKsewxAwuKWBh1t0udHq5FpxXFIOUBNUobCh7+++JHeQOmZmwL0rChM+k1/f8fUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZULBQB2E+AoqItkf6H1vg0abQPUgfMb8+KlcYsD+DU=;
 b=efm/QNixt5s9hAsEO3qfZjTGeFJsBzUE7xpxMKGifjX8csrO2pMTBefkPY0G6MdmDJAOLztzt49vgUyXbgcT6Z+rMnlH7kNT1v809aa5g5FosnIRyy5CHaUXxwcLqqkxBLNDIHOeIKv/CqtEsoM7ysxtsUbcuT8P0gAI14ITUbA2LXObZ/TvbM6vaK/cmDcZJAD3iTvb3Mkt1iXNcdf2IFXGyvpY9yN0IEICVMdnQcW5ts88xjERtzFuIl0aNiHMPqBgmKTxlQEo4Y+TPpnL4rWXtRgzFXPyySoxHkEOqZBT3joMHuo+2AUZjaijtYHnLEAqdzm710wzfPAr3K1Z7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZULBQB2E+AoqItkf6H1vg0abQPUgfMb8+KlcYsD+DU=;
 b=QQK1401XOTrmT9k3vSO9O64USBtusbvyuhA5PATMg1y77XIRIChdP/pwEHIuWvLClVg6wW8CZGKuLdhFGjeZ8iB/ZfZUwes3JWw2/bt0lm+0ScUuI7HgY2Z9ysAMXZI0c9Ty77KOYRMa28RDUCPey/0gO1OICIrDSZKnm4xKpB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:35:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:35:01 +0000
Message-ID: <87h5lqrz6z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 12/12] ASoC: soc-core: remove dev from soc_component_initialize()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:35:01 +0000
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 1261e761-da8c-4088-5449-08dee88485d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|7416014|921020|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	13rVOq7j572Vr5pJAbd4khNuQ809wm2oUYGbhhper4ZVaDAr71aVG2QXW8gw/gdPhd+m0hYBBr245zk8o2bEJ6FAdozarCBQ0upFRZYAyE+N282OWD18NYS7RiIB4LruJkjxmvvlfuos6s/pGxO/YdQkLC583ubHG0bm6PfynaI7urMNxQcb0MxdwfozxLwTxSb5SQAjqZmmUYFt2q5sb06cbXPU9VuopyUrXstl1txKBMx74Ro6qufF0PpL705cXelZRyttjUH+vXOeniZ275c0huYeQAWaS6R+vEQYIjBf1JwisqRUmDTNpSMfl6aI8lRt/DUHBpi6zzCZUX08PoP5BMkwzmgrkOZu+RK81NwNhRlj5EGe22C3/CSfNPaThI7dMA2lAC/mm2sbzKuUJgGpYVKOGeUmqGNowqzydgv8MVVX8r2p1X3jeoya7C4ZwR3G+m3Ko/R6U+dyXttBH4cSBYmySzj70UkzQqV4+TLpm2G1X1YxW1bP4HhognaEvH8gX6qJM8TQe7BfmQabMvY4pbTMimzcQ7MgPe6yMOvqMaWmqvdWnhZY4yr27uWjFaAxYgGqrRXogS3nva6af6CBghEmuGEZnwzzyE8ZTyjtIu7DrWXB/q0FRnVtFq+9ev2CJXDsbT9Vuj0Qrmn70oYFbIC2fK3mNnGPdF/KGmtd2ctJCnq78lYATd4AKyNGW1tnG5vWSEZXxnftW2J2hsm2cGlokXCJRZiHjHGCXWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(7416014)(921020)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tbhw2q4l2lNVgYvxexcXjqVvPzooGvTjLrxu5qlaPbSSUx3W6KHGg/SO2y7T?=
 =?us-ascii?Q?1vGChuyBccRyjFK7J8ty3uZhk3ZlyTlZE80Sfj9s4XOS6/NE4N5ciQPbXiD9?=
 =?us-ascii?Q?WWXVosGxt67sI+gTRWRfG5tqTQthv76w9X9+G3hO5to15x5To7xp63FVI1JZ?=
 =?us-ascii?Q?TR2rfIukLbf5fkGWNDKp/V8g8UAHNXp25n4wiPoG/T56JNvW/KwkCMpCer/W?=
 =?us-ascii?Q?YpXIWawGNBsYzTujk5WiJyNgA4vwDvvotJfPZB7c/p1pZLm8b1wRSqBOrZGC?=
 =?us-ascii?Q?0f4G/+UGsk8j+A0t3IBiexbTBbwhLxh9PqHADkzc7skN84T6AgahyfgmRV1n?=
 =?us-ascii?Q?32cX1sPLxP9/ZWwyYkkiQLEq3/LYnoL6kfU/fAqaiXhRbYw8u6vcoX27vMem?=
 =?us-ascii?Q?LhiecI6LXSURKisYatcb/dOA1Kk8b4C+AGvunBUYC2xAqakPOqZpBzHHqEVl?=
 =?us-ascii?Q?IqUL2Bx67di0+KwhudznmyMw34jsEvS5DVz/uC+XktxKjMAjvMqQ4O0l5Kr8?=
 =?us-ascii?Q?fokMfjTa3ZQEOO71r7DvvoCLfc/eQCfQL7wW8CPZ6QVdOoAC/lHwc9+AuMnw?=
 =?us-ascii?Q?oVm+SYqcf/ozSnmTxMcDy91zZXio1mY1gFq5WZGKAMkYtT1sgSFoYRoGa1rF?=
 =?us-ascii?Q?H5wbbiH1x8s6HIdzyx76ovtIXS4aB66Sr0Rd/1v4UhADyAd6X55adQ3G3fiv?=
 =?us-ascii?Q?01FUwUWIJbShfTAwoZ8LFZR24lWFT2zKbjswyTQCSxf0vt1kyXhh5TpYvz/U?=
 =?us-ascii?Q?/FWW4qd14iws2KklSOriZb+1/MvhP6uONaPpDV7gHIk7BMxNlwOqpLOaooag?=
 =?us-ascii?Q?AH+4maYbWfYgLvdcTL3SLN8KumOzOxjqbkRtURqd2vctMfTjnT879KdKyUzz?=
 =?us-ascii?Q?pf3HHTTVE1kuHEu3hcH2xF+9shB4wsyUI54mHA3RKJWXkpsoFKN3tXaP5S8v?=
 =?us-ascii?Q?ulTnIb/+cVv+jvd5YOLRL4vD1JBG63Qj93dgUiUa8p8zTUqEp7yk34WC0PeZ?=
 =?us-ascii?Q?ec1rbuC/iB08qJIhGY2kI0r9IaERfyV3n6g58iPKMguDWuouQNAHhF0QTw8b?=
 =?us-ascii?Q?6eOVxghjIRzvTx7QHy8M+n2Aq9erhO3KLSS1+8lNDkTbZdS3/8Yuis74NXqK?=
 =?us-ascii?Q?mbhYcxUH1W8jLw7UDaWpQPuBGoatTo8HRJLtiL7+rAMTLyS/88gygvzCo5/P?=
 =?us-ascii?Q?8sy48NpYmjm5SgfntHNSrxP9ZJ3jdam4+6bJC/WjI0FvkyC3pmQhumlYVzSz?=
 =?us-ascii?Q?GUbWOvmWDc3rWkKHKT2IuluEodbv6RQn9GyfICCwNmLY2hP1vG2OBIji0vQx?=
 =?us-ascii?Q?fhFyUlCsOCcheyfXqocR+AWxj+ll3jzEVqBk6esc9YXk071K7bUe3JOsTf3h?=
 =?us-ascii?Q?tyRUMs85j3uUax4unBDdV+cddi8bkW1YEqP3Y1BZvvBxuSvirjE/T4BOULGO?=
 =?us-ascii?Q?R7kmDvfamBrZJNgxCgrXiqeKJaObvbPDXYhCa+jXs4Y76sa9It0x5BtBLQPT?=
 =?us-ascii?Q?DejhelhiMkGub2itQcuoYx8mD31eeGEP0f/4QcAqEk0e2sfyYDTNyOBtYFfr?=
 =?us-ascii?Q?vK8aEC3+rG9/VeNcUw29vWg3GLC2ni8oC3EBoy0v+51a1lgerKMEIs0iGg7R?=
 =?us-ascii?Q?UiDIdKCL2g6p5ao/KZKQYYzC+uVYl2iq0ciqi9dljNl+nCB18US9EfVt/4he?=
 =?us-ascii?Q?ZWzyanpbIaXB6v+ObyVEE+Km2NGpjjCc3ezSWwzIbFPHecbs4/hpi/EnuCKT?=
 =?us-ascii?Q?f6lMEl9qMOTTYWUV68kM3tz4qmOQJ0whTJlVKU/XSw1MdS0nIzD3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1261e761-da8c-4088-5449-08dee88485d4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:35:01.2865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmHdc64HWqmxViR1P0sWKfkFmfnXpYgtp2RGKUcv6j8pzXWFVe5/K6Wym60rSgBXsFScs65U2uX2pNNdML1UJb+gVEapJXbh/0i3jKNLm5jEdAkd08cG/ux8yrNHh+uf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Component already has component->dev. No longer need to set dev
on soc_component_initialize(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f1368bfe3fa4e..8aaf85db0ea5c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2703,9 +2703,10 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 }
 
 static int soc_component_initialize(struct snd_soc_component *component,
-				    const struct snd_soc_component_driver *driver,
-				    struct device *dev)
+				    const struct snd_soc_component_driver *driver)
 {
+	struct device *dev = component->dev;
+
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
 		return -ENOMEM;
@@ -2725,7 +2726,6 @@ static int soc_component_initialize(struct snd_soc_component *component,
 		}
 	}
 
-	component->dev		= dev;
 	component->driver	= driver;
 
 	return 0;
@@ -2780,7 +2780,7 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 {
 	int ret;
 
-	ret = soc_component_initialize(component, component_driver, component->dev);
+	ret = soc_component_initialize(component, component_driver);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

