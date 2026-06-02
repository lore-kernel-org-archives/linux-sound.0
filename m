Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9993382DE
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368914; cv=fail; b=Y7t6T6juyLpcs4QIrHNVF5rUeArxY5ysYLnqrOAVLw9I0xToSQwtVm547ddb8prPQ7YtkBfXm2aq+9JI36Z914rPXfxp54QbcXKfsmgULK30wl6Ca2/tWOuncjXLKJiZwh2Y69EYO4y9fEod2upY2qKvIBv6qTw+z7K0QHwXQp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368914; c=relaxed/simple;
	bh=FfHnvUKXWZt8IS1vLNBVi7NqfCsNc8JLGm3UYoTvBg0=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=NGfojZftHBxaX7rR+l/Hrj3YKLSrr8Dc9IRgDm0ynK61ZyjnZkv9+sGDZQaqAONffGKDGp2fEHsdphy31ei7ISbHLZTf5wW6vefPY62Y8lgjPBRLpMijKaqvd5mlSQeZ2RH+bH7eq771ji0C/+zk78nyekMKOk3B25yp6qY0DPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jlgEZ628; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jlgEZ628"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMaNxZK1M2haQAC0Ady7ueLjkjetSePm3tBPuuWTdAS0yjIp28/fycF16JA6KH7AFfcjsosYL/5pw6xfRW43GTpoFOOPR0EiRjRXHPe9NJa+K0Yl5b86S8rnOjN1dfGAX4vlf7O8egEbaoQmudTRivFkUMUmJUT+hO/Ks2jPfJt9yz1cIrI8Fir8we4ItGyfImmkQkNW+GPUUhqX+ljmcjcWzPFcgvLEQ+oAAoU7tfI2+4ryjDYck6yHajIjRq1z6TfUemgtuRr+zG+FXy0mUa1VqQyg+8e2wVam198LQ1Uf4m9G9vuj0Oj0DaBSRh8JYPL3cQrE2QB7KtuPxTjL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSpacPV05MQ9Dzvu5y4bwiFOsqMXVPtdjilOUKds6C0=;
 b=O1QLsRETHd2FBu5Uk/VYVEMQdUHMdeOLzzrRApq9bz6KsB8Mxn9NAWRXeEPTAGwvgBRLq+IrYFMhf4MSxYqq9MCS3m5RlrAQ9J8VUSCcBuOu8cf8wr0+2ZjqCm6ruRTsUgSqggOOOapETxDa5npOQ7jfblWLAAjbLsHleMOz0EFZSo7DSn8hv2wdQERw6yMIQ5/lUyHUGqYdf/OW2OP5656SXDiPc01tFotPkWgPE5dVMxOXwqSxxnKVpaBrx4azvlYtpaJIbQugZ51R/rkTqZ6iQUDPOQZt85H38GBJm0tQdj2XUH7sVnhZO0qXRZo911uDsh8HbCkYXJIo6k3b6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSpacPV05MQ9Dzvu5y4bwiFOsqMXVPtdjilOUKds6C0=;
 b=jlgEZ628Ucxsn0P5g/vGldMCkttJtP7JA+nNPbwGLVhUbMDdltoHDE9NCerrAEl9vBPWXRKcTbgUfs71qvZOCHR/YH/nlUOeUk62y12CYhS4SBBwJuzQtjLDetA3rFb+Z5ir3IxxM3epp+ooPAIjm3M6mNpACcK+m+GDUdpl4ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13216.jpnprd01.prod.outlook.com (2603:1096:405:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 02:55:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:09 +0000
Message-ID: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Chen-Yu Tsai <wenst@chromium.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: remove .debugfs_prefix from Component
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 02:55:08 +0000
X-ClientProxiedBy: TY4P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f459f87-5e8c-4092-9f5b-08dec0525b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|18002099003|11063799006|6133799003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	xZ3LfRpRGk8gkLxNtFeMPXfWwGnrDkSmb4UBV8KsZMrXo7lDURc/OkgVDObkijQ8IJO+iqU4NRNvL4R4UN7S+K9ikVsSIw9lqqWBW8R4D/gT6QQSGS13jOT0zKYS/9WCuWbPSALc75eni2irsy9PI5hRYf/4cG4ktGuqPBOfjdn1iqcMDTbBj6bTY+C6Z8vSpmCRNK4oyMlQdpNXCeEb6SZpYe1i/KyVFdY25chzPeekIxAXr9VNvkekNa4K+RvEQLNiCtYjIfHdJA8tlHZuyFwMGvCpmP5vi0v4J4b2Rf9pxqamTJ58/0M5lJ5ufghWHnpycYCgrEWw9Oe5TCSq0TKUPIjudXsS87qiXavUGMB0SJ1WliS+C5P+U5TJwva05dqHkkXnxyGLFv+cBBC1U4tyk2DhvRZFts2ixJSmWKkL3yKuL0kfNh4oPf051prWeZ1AVijXXsbIM3/CE4oXRA4NCEsHbldKcZGcRXJjDQfKR8ktiRSADqHQI9M8Zknc2FR3gl9vmlMg8v4iCATaxrGtSVq5xqMdgAHD4Z+O2Q+c+kRjx361dK/ujdTERs1Ib7fnAWy4Evg5iNFoH/gFerKGx6YBeJL/6+/m1Qd/SNkWgJ1947IHRozfdy6ixUe3FFLOgIMQiAXlAV2nCAVvozzIucQGrDuqX81bE65U6HiDuIAqpjopxgjztjizWIbDqpamL3WO9DShsBDQut2BOe/uWEUpZedymttbGf8YLksnbes4xdiYeWyfyab3Wer9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(18002099003)(11063799006)(6133799003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uU0tcSzvxEAB08UgXn5Mki39OLSC3MLQKw+oeyF7EZg1gwu6t9IR2X8I9XzN?=
 =?us-ascii?Q?PCkgsutOBZFTP0aK4/YYdgQqJ0KYtFbPsd7ST4GuTymuzSsAFniem3T3Ot+t?=
 =?us-ascii?Q?XBaDjtfI+T3+5KmJdlrrXoop2F+Bg8s/XM3LF4rqBvy+iui0VopS6DvDa8Ph?=
 =?us-ascii?Q?mDZeL0Up4UOwhMgvLUcGwNwFBkWECOBcqsjWqEF3nwI2+ddqC9PpVZB+G2s9?=
 =?us-ascii?Q?oGWl4MippYKTBwVNyTPqMMp1tEgWVgtWQXzmZwADKL9lwdLXMNsIj9WaGsNu?=
 =?us-ascii?Q?jMd2L7/K+26IH+OvaXlttnNW9HkDK1ZBzZHCbyDj/RqZP7AGCxyENkZwI8/J?=
 =?us-ascii?Q?cwP5rAySWiLDwD/IPu1FSMX/4q5xZRYcE2NtHQ4IfdmZYvKFEDSHUx4nSarB?=
 =?us-ascii?Q?uzkkX0qpce+iyLV0bZlAM05yfRNkSQSUb/A81Y3XJXl5aJ65FX79ibpLHnAd?=
 =?us-ascii?Q?cVbGYqwVYHwLikaFFtzxPj9UcQiDRBRcap+s6K0S6NRMBgDXBX3sxxUZWzvh?=
 =?us-ascii?Q?k3evsrqC7Ko1VXbW60TEgbwhdi5ys4lR7JoTDmwxql8i9HZicGSIFaCxM7mq?=
 =?us-ascii?Q?BxDL3VNaPCfKNe2BMkbHCs+/5xeKTa39mnM1vodnUwsJ356G8/ZUtijyGGE6?=
 =?us-ascii?Q?eev2hpJeAipGWXEZVe0b9e8lwyYrmx8gpVPqZ2hf5FyXo4hASHYraS0Oi9tY?=
 =?us-ascii?Q?GanpeeAWOqC08kIaEjHZBOSg7aN+eTxqxwgEzY4LT+whWLuNYww9+LpoEJdc?=
 =?us-ascii?Q?A5Q70a6QLD/89GzBleD/Fi03mpRVbhN2wi42sKWdKuSNGFd2nwX3Ars178Kc?=
 =?us-ascii?Q?vhvhvPk2j9WlQssn0t5Eqiy4VHdt370Gb/xkQ0rXSThVjnq1sgdQM3Q0offo?=
 =?us-ascii?Q?g65bPuymMX/LwTGKB8iElkagJJuCxaxHYTyZTPwYyGYRkNtaqp0pPdhiOfzG?=
 =?us-ascii?Q?vFezSvWA5KqFG7dgLm+bd/M86r4IaEjt/BsUQLwGIfBIUnO4aTdrBGiAkHqQ?=
 =?us-ascii?Q?5dh67F7X1oggnMFi4Tyn3+0a4XP+TxjR0BHU80qAL1mzmb9BcgUDp1Ha2cTH?=
 =?us-ascii?Q?qYWWOM13GjYrgQvgBeDcYUa1PFJjQdB2Nre2XqmuakS8+u+/4vLR4YZggXF0?=
 =?us-ascii?Q?8goIVstS+GoJqKtCjFhQGYMx6d24eNiJvdPHPU52rKuaONMkQ+tAfH0GTPxZ?=
 =?us-ascii?Q?xQmSjj7YNh5pubOG9liRAo6E8qSv72dfjPBQz1Cf7aVuZxT0ghuFfYfFeuKs?=
 =?us-ascii?Q?nQDQcV5zKBbC3TEW4Kyo+MdHVS+gYdiMFLWtcis5DiOWzgBsHLLUHXCRTFbk?=
 =?us-ascii?Q?HU2yUB1SwWYOQ4Iqz5tu7EtstJptEjeiDp2zkAVK5WNoIYMJEKRs25SMPjy9?=
 =?us-ascii?Q?tARQy0uFdy/gSnvXr7nS1OXTC/HReZPPs479nvN3VKoJsRIEyfgjFWYwCnao?=
 =?us-ascii?Q?8R2eJC1DcZeVdUu+ehgvM153PpAHDjUOCGKDbpKB0H1oFhgUZQixduZFK7gU?=
 =?us-ascii?Q?h6iZjNOp+a+Ap2I8neN6A19lw2pf6Te7PGfFVcwKOENWAzXGal1+koJabnD2?=
 =?us-ascii?Q?tLi7Yoqfua264vN/ZQQRdxcFxaaDDITFfejs8QMy6WX+O7Uf0jNNWOr773qi?=
 =?us-ascii?Q?ilfjGC9aU6pojtcgfcGf9bdRyw4smq5ZQtRQmKW1xrRcAv1UkTEkaQz3jnpg?=
 =?us-ascii?Q?OQi1DBzppo4TeEF8CukUZkTUse3vOhJMw7PWFBTKRCQWkGGHmVkgoYroKWBJ?=
 =?us-ascii?Q?U3nIom64pehtE4Pgy2sBuVYQO4aESUSWycT+jBU9FocmyJFleaAR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f459f87-5e8c-4092-9f5b-08dec0525b82
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:09.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PY10zeHtzbCxJx9mY5Z7+bH5FHfoJ8Bg4uDRBipVWArdyczvK5CkyZxGp253XE3H79LOIOM2Mq6u6Fy1Ql/pki1IKRCGrgxzJ54S3LTRNANo8NPY9uviTjaJN+7yt+AO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13216


Hi Mark

Basically, we are assuming to use snd_soc_register_component() (X) to
register Component. It requests Component driver (A).

And, current Component has .debugfs_prefix (B).

Now we can set component->debugfs_prefix (B) via
component_driver->debugfs_prefix (A) today.

But some drivers are still trying to set it via (B).
Thus, they need to use snd_soc_component_initialize() (1) /
snd_soc_component_add() (2) instead of (X), because they need to
access component->debugfs_prefix (B).

These functions (= 1, 2) should be capsuled into soc-xxx.c, but can't
because of above drivers.

This patch-set removes component->debugfs_prefix (B).

The functions (= 1, 2) are still not yet be capsuled.
This is step1 for it, step2 will be posted after this.

Kuninori Morimoto (6):
  ASoC: soc-component: remove CONFIG_DEBUG_FS for debugfs_prefix
  ASoC: fsl: imx-pcm-rpmsg: set debugfs_prefix via Component driver
  ASoC: soc-generic-dmaengine: set debugfs_prefix via Component driver
  ASoC: stm: stm32_adfsdm: set debugfs_prefix via Component driver
  ASoC: mediatek: mt8173-afe-pcm: set debugfs_prefix via Component driver
  ASoC: soc-component: remove .debugfs_prefix from Component

 include/sound/soc-component.h              |  3 --
 sound/soc/fsl/imx-pcm-rpmsg.c              | 12 +------
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 39 +++-------------------
 sound/soc/soc-core.c                       |  9 ++---
 sound/soc/soc-generic-dmaengine-pcm.c      |  5 ++-
 sound/soc/stm/stm32_adfsdm.c               | 19 +++--------
 6 files changed, 13 insertions(+), 74 deletions(-)

-- 
2.43.0

