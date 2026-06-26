Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5422580CF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454174; cv=fail; b=pj5n/O/Z69/Vr1nWmFF+ER4/4BgL9zk2biSkgsb7JVquiHANBC2Kbdk9pNMCotk4Ikk8rQeCxbnSK5S4gVF4RLmqxQinBocm7eWafe3fjxDnNZo7Wf9zvOGw0fkqI7s0IIygdPrbMpAbllF6s4fxoIwTPXRgS9Em01TFCtvsODs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454174; c=relaxed/simple;
	bh=yiLmtPWpJ/Code8EjpD8E4lej4nVx4BaOO8Ts4Z3gMM=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=W4KjY/RkJDDNN0p26pJIqSnlYGOUqZ8WpCIZJ9FVvPRWf4+iZKh+KKjMP6OLlCDr5V4nU0ghOP+XYYe9inzyG5SgSPZMXjdc22ymC1gz+u94wZADw4xo/0r6Kl/WxgP6xX9hLjD8Pik/75ez09vLN4y3VCO2qZPvbX1QDXyh9NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eDc7r4U8; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eDc7r4U8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4V2+Vkwy7PDVUvkgsFRJHZmuOilsSqIFKWKu9ZR4r0gdUj6peqDQsQIIRNQLrC4JkoBu02Bb99ZseSkM6QGzYJEnT7xuV/iRwdkIqZLlNAQ5wyGMPmOwywSa+v9giDYLXVsIqpWWIoYP7TkvASmqwO6EUynh5vJiCbOQX93KoDEYwJXDywqfgIFBCPTp2fJFoQYuauNEwoxkCStth4unhEIH7I+fcmrOxJ0Sm06yixl5QSJ/eWeTFecIXHweBfH2P6IHqv/H47k5hwLQyZfDoOpjv9gAUlZoT9j5G6PS9Yq6l1nbQ9bzcvXfBzjAMUB7lZJNRPKx1jwwmG7IGmrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk9m1GTXJrGHqpGh3Pj7nBaDFHDYvc3jexAWGn6HxkI=;
 b=YSII3iXG0WlUTCRiXBt1MdtPectlWEE6NmCGqrpSe89FU0d/04NQSVpjxLKKA2I8ZBf/pqChBsugXydS1bnADJlb9HZXwg43XSUCAUt4qrQh72atBnx2zO8mZ2S5RJVhTh+dwvW4G29Nm6I7cJxfVoAF3L1ezV/1Zn3+8u7tg/JnXWjXxerAxcGhkSbnul6fy7+PztPDTpLyzBK1/1Olx89M4tT+wpATBnsD6MLHUY34Aj4fjdS9EhBNcb8bkhtmw4q2j7GzdZXfIHOd1T0qU1/W6qkYNz7EkneiupcCrDmynaEXrXMt0MeU5gqyyurlzGPHKt5XuK3y/+Wg1N7DPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk9m1GTXJrGHqpGh3Pj7nBaDFHDYvc3jexAWGn6HxkI=;
 b=eDc7r4U8Va3cUFYqfL9oEyNa6zRzXWTO5lEFvJRgvo2E5HpVSESHYQrHcCs9dt/4aYpP+CaaPCTSKhSqUTNk6bqGB9ndc0F73e9SC2DBRYn69bhBUTLLUfMZf7eAjYJR2lUNpAdPYqkeSdRV052Z12KuFNj6qHDoOyNDiCCGodE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:09:30 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:09:30 +0000
Message-ID: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: intel: use component_name for Component name
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:09:30 +0000
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: 692f099b-041c-485f-d504-08ded3497c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	6mJvX8Wr/YD4TBly4/2oaXJ+1ZXUVVTb2gfKsQBfpG1aYcllDTywOidURPJnoFkp+qgv8GkCrRktOL0jklbDZlPxUDPyD/rJhOFiGB0SQKo4eeVU6/BZTGl50kaGTjvbq6eZDyrnEVEr2B+x4j6iEv0QJX8n9iN9DaI5G02VlMAbFaYLD1Wwj9Zi63G6twprWEda89S2+AZfV95jfyGmHzPibrDiHNbQx0xai3SoKc0EZYkZU2Qd41Iwt31k4LRPmD9MLLFClvJ6bB78NfOKM84LciJy9ef4H0DZwxXo+LKirbT6koZ92UpuumM3GPfvVLUCM0IMpd4/kt3flfoW2Q5APGNLx2MRynRH6NuCHCKTuW6W4JcW+FQ8Cmc8WneRXe1EYwHLdGWbFqu+AnaELWNkuxLYLGZPw3jGpOh64jjKEsI9uspwDSapb4iSHAXSUb9Tng+NSqVxBVfAyvZqLV28kNQKKrBbXtwIHtd7Z9H3YTthXaT5k+1MFxI/OfhEBVzWL8P/dHu4vk2fneH1H7J+kpjqDMBUEdsWmYkvXTFRLGfBPnd/HElmFU62E16YNGm3V2U4iYrWtq6ZPlRI1AQQG4QLXmIntATsk5AKL2F3wu+iSDSRsApl15+RxBfuR47GKsjLIk72YZFpGX1zVK2w+rKlJ+6Yj9wxKSrHd3SWUc8F7Brl3o7gk7nGXh+JgcTGUwyGtWeYiWm/H7ZQw+OrhP9OFOTxDXcnsfng0co=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8IfsJDfFJBJp6S31gH40BDGAz7Xq8c8cSgkRfsbiLTYrr9yOfNHYwcMYxzHu?=
 =?us-ascii?Q?sAqw3WhrD1zNaV8R0Zsi0bD4bMCH4x53xO+4Vo6RDosLve3ADTFcpVUoAV+W?=
 =?us-ascii?Q?D8f+1lQVQ5DRCRYyoenQHjPbVD4vdjnTlv9fa3bjR0XnhfkErv8EsO3WE7Mb?=
 =?us-ascii?Q?kFLh2jA6E3oFbXShi0jZGlxJaP3FXENwVrvVnwy7idddp6toFpNvKR+/QfEs?=
 =?us-ascii?Q?31HEVz/aJ8kfGB50I6vPoS1sBFQtT//XTKjvj5D2gMtJFJpM/Z4CYHs41jj4?=
 =?us-ascii?Q?QelJaNqmPn+EFAOJzqpY2bWR04ff63neSz4bsmftrx7U24jgOOcWuz1q6WEi?=
 =?us-ascii?Q?WXG/9/OJ7JOcjgpCZwq6cdkH8a/Ia9SnH0TcUqPYjcMWzqdK7RMTGd/ARVaG?=
 =?us-ascii?Q?9f7mmBDYppk2yi5q6I/5bu6rMXcrVRn6LcewLmOOi6+BX/cbNMtHYhw7d0R2?=
 =?us-ascii?Q?2RQjsSwn3PEM2A1S9qmffets4apAab9yAfVULzxSh9We/whnzs4Wrf/RfGta?=
 =?us-ascii?Q?zeB+6VFdzhue/7+zl/R3hop/E9F7YR64z7AJi5I1DLl6fjap0x4EK3PeNnum?=
 =?us-ascii?Q?bV7jiyJoGsZl7VA9RHhSl0HQDGvdUmsH+SztqzUvox33P/Cmc6kbMW4kGCp/?=
 =?us-ascii?Q?/dwDYdiWclGLfTciqGyuuxCXrtmIAV742QZiPZ5XhaHafI7hDU/ewXuDP51W?=
 =?us-ascii?Q?mLiteIHkGj8Yf1lRzSbO0UhPAuNeyZp1TTlA9/b9FOATVJhFSEIOOh5QXS/4?=
 =?us-ascii?Q?ykv25Bz3EklJ0glhcT0yU5g+OBny7giBhV7CiPn7DsbYMY1LgwcCfGQhqcDQ?=
 =?us-ascii?Q?mUsew5bTWt3qUmyr4P5bnbxfQ9Vs5AeHiaslGqcJP52VDiCLTYkCg+KxaeaR?=
 =?us-ascii?Q?Nppc7D2A9eghulSPYkeQPGiF35rsR1dIgiC7UCgNlOfOl6rfhaoysKujyTJV?=
 =?us-ascii?Q?IziCjI47ldxr7/OiIB3iuSAb6vGxSWsaav89FjvIf3qY1GTJydZTex0/VtaS?=
 =?us-ascii?Q?CkRKTMbn3nykiIPqUTCKF0KvbLKlsEjRGFSKdM6bUZouF2YBJT2igAJRMCOO?=
 =?us-ascii?Q?ZQyCHhrQtBgo1I13LmhJnJrATGWdsUrJvacmLDXkfNNf+Q8CfdMTOpl1+aC0?=
 =?us-ascii?Q?ysbYP5yiqTYbHCCnzTwucCefbJYsoEUQSs+wCHZJrF91jihSJEkgI5E6uT8Z?=
 =?us-ascii?Q?4xTgb8ZMRUmdo+xh4gla5SwKi/Qr1axHOeDkj8eOBJkLDBsvzsd2gN6iRByx?=
 =?us-ascii?Q?eTnpxB1Gfu00jh38MwMsYlCupIDD1znckpLxi+KxKUCsFffjNrPhyMUKvxh8?=
 =?us-ascii?Q?fjGzg5S2KQ/XYxop6Ao+EXOHG6su7H85qBMso1Yrs4aX4YCPrl95zAHSLicn?=
 =?us-ascii?Q?p/47WIIWouYgLEjf+9J5G0Te8oNQO+yrP48z5Vh7FjRvSoo04AspCd/sAyRw?=
 =?us-ascii?Q?DnKw82lEAGzCF8Njo4eng3f3QJKySDzwRqPPSbWKFS0k1ligir2wPfoztoPA?=
 =?us-ascii?Q?qVwDz2mw//rX9tcOY+en7MFVFDcpaaJwAHQUP3GEe75zbyfXNHQKeyKYl96p?=
 =?us-ascii?Q?1IFiCw/sykA0rQbQDpzIcQhJFXzSEODMJkL/M9vxoOf2hl/bmlxBePkHNixb?=
 =?us-ascii?Q?oALOd80TBzmmpU+L58vOeDCPcz18hR3R6nyr7WBfPeKx7ggq6rW++HFb01JT?=
 =?us-ascii?Q?HKZe9d4HCpD4yonB1qBVmm0CmAFCJQQckmje0TXr3y0DscgajMjTa+eEz44/?=
 =?us-ascii?Q?F3HiiaMbLJAfxPPOgAuc8jFflU5v3Fa/TWkgIg7xTfk7hP/jgC2C?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692f099b-041c-485f-d504-08ded3497c3f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:09:30.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6isLiUtpsFLWxl7/AAusGHpOYMdT4T5j3UtfJVoTyMQsHHQ+rhwvgo5B4A3iTAa7R5B8GKa3drYBxL/HV97WrsezzlEr5QLjwKEnM3Nd/jbD6iJz+4timyEcwrFOndXt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

Hi Mark, Intel developer

Current component has component->name, but we can't setup it via
component_driver today, so the user need to use
snd_soc_component_initialize() / snd_soc_add_component() directly
instead of using snd_soc_register_component().

This patch-set try to solve root cause of this issue

Kuninori Morimoto (5):
  ASoC: soc-component: add driver_name
  ASoC: soc-component: add component_name
  ASoC: intel: avs: pcm: use component_name for Component name
  ASoC: intel: avs: probes: use component_name for Component name
  ASoC: intel: catpt: pcm: use component_name for Component name

 include/sound/soc-component.h |  6 +++++-
 sound/soc/intel/avs/pcm.c     |  4 ++--
 sound/soc/intel/avs/probes.c  | 27 ++++++++++-----------------
 sound/soc/intel/catpt/pcm.c   | 20 ++++----------------
 sound/soc/soc-core.c          | 11 ++++++-----
 5 files changed, 27 insertions(+), 41 deletions(-)

-- 
2.53.0

