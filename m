Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF41F21C16A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303279; cv=fail; b=AxLGcB1wsp6r6cMv7TJt7zQhWXeSNAJGkmR6tXXq93MCNubPn9lz1lmS0ar56ks/TK600XCXZExWIkiiAB+q7S84OSjybbBWLRfJ8kMC1ixk/nLqg6d5t8W6wMMcgQmID77ml4F+/rXSJLPGUrVBdhoPWEPdy2fD26bWKMARwjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303279; c=relaxed/simple;
	bh=wPaL+A5ZeJ71XmlFQ3K8bEESxPPHA7ckH4aoyoFc3oQ=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=WvHi9cxodfj3olhtN2wlXIbKwY576yVN7YdX3C3lkAM1YNICOqkOpLkSHtt6ZkjngJxxKe7AhxY70tIoWJRz1sAd4UyWRTR1byogvexH/B/6oCsISJmwzw2GNCtJNM83wNzNqBjtVgXmmZ20F2i3vzaCM4VEihzAMTwMpEYS9xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A+53KAXP; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A+53KAXP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0LRRxcCHxMdCbQOLByQbqx8QFPfIWUPdi2QnmD+nlvpR/AD48TQn0GxjZuFZm5lqqk/U+Eou2K1t8+KaAkub9lOK0ikxueVy9XjtkjEQ/FeGN8xkf3gz55D6Jj4RLCl6cuTxZIRVj0rWuW+YWzncMiMGiaInfBZBiHFQF98h7UIIhtN/hpr1BCaEe1jeTMZimcs6XNzLWMiFvf2a71Nv+nhgwWF3kEsYQWPCPjBZ/oT2Gi/rmQgZEP/FpiG7Z3kUlCSp+90WN/LHmZUlBYwnzhtDoYFj5lMhB0bf2706FRBqDUDmF6r0Rt7zEtkHQqbdNJsKWmodXnR1wh3F21kCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB1ujnR472VPZj+K5Bss5KXD5AmnH4fsUrhMxnH+KqM=;
 b=exh+C0Ju8kxTafjsQ34ZLYMK+3/DkUg5H6LQ/6YLbgsGlki5rsH9mUW/d73HorSK7EoyECCNZVNRkBKnAqZKgpNww2Ekrn8L+vMBqRN/MKsedf05YJAUtRRzPwY/ShWgJZWfq5aWlAarnVp40vdQiHH+r+NVfK+cYIsbvnBB3d35KAAEseREuTQMmdUPoi1koRVSxa9oUBn0UJJmodJX0FowjHAPacju+4J8eIahNGxN5zbidR2SJlUJooH1x0a5RDw2DwERmoFa4WudjSSEmakT4JhqneOtjlme3pgkgTd58dP+HcBFF0cQ3YEwphi/ytNPl++2MlkoqmF/9bgvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB1ujnR472VPZj+K5Bss5KXD5AmnH4fsUrhMxnH+KqM=;
 b=A+53KAXP3K7skOvmoqXG3ITvd5WXXWoLFfLiZ63R2S6iT4ABhyndnjZYjWbizr/yspsTELA9D2hICTdR9gyUQF9dbPoU3Hea/yIHVj0gCQxLQ1OuayCaOdxpvuqsFXyUARII0gwjkEu/BmZl3b6uUFmrPGTd0p2mKDjb4yL/Fkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB12262.jpnprd01.prod.outlook.com (2603:1096:604:2e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 02:01:15 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:01:15 +0000
Message-ID: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Fabio Estevam
 <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Liam
 Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 00/12] ASoC: add and use new snd_soc_register_component()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:01:14 +0000
X-ClientProxiedBy: TY4P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB12262:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4b75f7-ddda-4fe5-37a6-08dedb0275e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|52116014|366016|38350700014|921020|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xUVlVrxBGewKwiyB1r7zD4hXMQXfEbMoi+Kb5jFQlZeCKX9MjfT8JMV3KfWewGAWtV1CvSbjjPxSWT84FY+bmOTYtDOG51Uup4tlldrfHOmYvx3VL0Lxswhi8xpVnrCF7UB1j+pCwdljDiGgCabzj80pbbFmQgelE0SHfDF+37m0KT56m+2+cx+3gb4sZNhCfzVwAx4FSvJoPHsziszASnPz/4xUII8RX3CDimKR8285IQdRfvNwGmEENtgVRSyr4/zw4CnxDTn/WVWxZu1naxGWJ5xj7hSYtx/iBEmmMlgo25Yb2lyWNiY1tf9UFMSW/t3dVzPrNE+/dqmG9d9pUWKsiK8CxcilukprtRw4f13Wxl5UFFZRiOImNsMS4LUC1kgVHfqGwuJr1fCPaOweZYv7bNsKFtg1kN+wjvk9CfhB73YpW1IYPz+/hi8dREdVlUkeTPmZkaNXqScY3HjdQuoQWIoRvYfM6A+q6/n3x0HkjSL3zkk3aP48wRZaoVJOF2+MXnZbHx5b1bBGCCnbzlvarhV6G0AVGZD5OI8GomwSV90qmA0/+uQ2GWy45qL1S0YqLAPfkd9H4AEQt7dy1cTT0GrX6fn1WSWyA8FLo+shnywP2Dl6OM1vVtatFxrjsiq3DgTXbhewE12110MQCProrQpXrx5pElvCBgSvzY47FgPaD1NTe/U3TLgkczzuw5n1MtZTzfdRDKpLSA4Me+l8lTKK/Zrc5yImFKr3jUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(52116014)(366016)(38350700014)(921020)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+LK0kXNBqrra2GPPXwPybmX7yRf+1TpgodUM9rVD7tRXB/wrFYwgRacbeOk3?=
 =?us-ascii?Q?WXJfnUx+Q7QJGJa/JOImlo8yuYesAupYVGH+HgPpuHTksKgSAiZyP+Gkae+3?=
 =?us-ascii?Q?x4dBKxmbDEtbSy9SwOEI5w9VAEBNg57a5uPoK1x3G3HE/nmRZP1XiF3wdlA0?=
 =?us-ascii?Q?V25d0lYI/vH1ncXhz6uK3121xdj6WLKKzsTSEwzwmUO3muEHvsRLR0H3rmVl?=
 =?us-ascii?Q?jIPTs4jQUy6OBj5rfcsVuuHONhbi6NPrbT/s+KbCO+Rxlfxs5SKdxadD79GB?=
 =?us-ascii?Q?07+3Pndda1Ng7mtxjiyBqEn+CrjEPgcTe6Ya9awH58k862E49xPunUPNskK8?=
 =?us-ascii?Q?Mu1cVUA/TQy3qcEL5vHnvtKgQy2swMS26yLH+IF1Iy0KA6+5uVztiVOJpmnf?=
 =?us-ascii?Q?to9SPRM0ljnsDM84+Ai995ael1L3QTQ/o3ub2KJ83+5uZt8lamgjXZ60K+44?=
 =?us-ascii?Q?iJ4lvwg7hzxkG7Z5UPZqsUMu4BKujsdJJZMvC1aFtN8Jz8oITuF6UKKwkbem?=
 =?us-ascii?Q?I6YVS5pTq/DnNtS/YU2BJD1sF84oc1nrS9ffpEj+CJ7r7xnBfn+TqQcsHfDH?=
 =?us-ascii?Q?ezm7FUeTTunXXMzDFr8EDiiiLBIes4q+hiLaLr6ig2q4CszhZqsHBo9aJOm0?=
 =?us-ascii?Q?HlGb758zbpIROp1pCmJhH9eH41aFE5yYbi8U8LP+1DYHyDw9Ri3+7wXWWTqg?=
 =?us-ascii?Q?kYGN4oiavvDfLyOZelZ0qS7iq64gbjrUFsp8KT1eEHnjlnaNTdlLI61MkxVw?=
 =?us-ascii?Q?Av3906t0VIrduEnfjeAElqt3PSgQn9GEdKvKdmq72jfpm3uyK025Oz+T0ZeM?=
 =?us-ascii?Q?Y1kWeKeVK9qqvaqsYHvaEfWz/pfgPNYYKAoCkfVW6UseNKfhPKR9wRBpu/Vt?=
 =?us-ascii?Q?rBdxT/sqC/Gr0imNxo/vgVvd6NFiH1YoIsDmbyc+elUh4rjHLr878OwGRbh6?=
 =?us-ascii?Q?P81z+HRMYk8nKqPp/IbknjpBLN+qhL+HPqtWz/41WQ6jwWPxj/1AP3J30/TQ?=
 =?us-ascii?Q?Q1p0N/8gxDXRnS2WS2HhG+qfXkOp+lzTa629qmD6aWIb1Fw/OmSqfQVcuMzx?=
 =?us-ascii?Q?fdgJNnc8iU14utIX9hn1XX1y0qdGPtS0XtmeaFgE0+ZcXeMoyFVXYP0+HIkV?=
 =?us-ascii?Q?QoxJrkkG7DH1LCUewb1J+ZqSSKnf+0UpOCtn6tXphDXsCUP9HLepsurzMwAW?=
 =?us-ascii?Q?mjT5Q/N0TDxUvPRk3w/xe9lERZ8BRRqBSGkoT3x2bBu5cAR8y3CjGp32D6Vd?=
 =?us-ascii?Q?r82mMmgWr78BROroZHlUqyPCkHRJqH/7jvBhDFEx2oB56M3LcjnD3C8v7MP3?=
 =?us-ascii?Q?K/EtWS5MMTROs6o3EzziRZdQ460mWW0Gso3qQ4++S+5php8qRi0aR6e7KHHU?=
 =?us-ascii?Q?9Nc76CPKy7vaMwTGRwpigtpRuY5KhmWj+8Cv62J85yI0cF05cH8s3ebeJpYZ?=
 =?us-ascii?Q?PNbALVNYocbJ7fEcGEbNpt39D2FX4saYXUWaQYKiAuqRPcDRGmD83SQ08xcp?=
 =?us-ascii?Q?vTI48x/KK4HmxyOk3MyyDsgS5mUpXGSo9smBCgf+DgL5pYtfa4kydSiIsw75?=
 =?us-ascii?Q?THAEdeyxEyuiEspiAujYY2X1fJLSp8jguogmEu/eX03foM1mwbAtVDRVTkLA?=
 =?us-ascii?Q?/4AbwLBl5f7F8nf4UP6XthZMez+/KkAnDBDf1v3/8zX8ABWDIqqTCRrb3mHZ?=
 =?us-ascii?Q?mZIg0jxfA/7Ht3XnEiuBiTzrge5tUihtAml1vWDL69sjkXWgvV8/BoRg7qLB?=
 =?us-ascii?Q?qPW7yto20IhrxOZARzNMyjPu5ePW3/w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4b75f7-ddda-4fe5-37a6-08dedb0275e7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:01:14.9975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDRJFi8erErorfb7dLPP09tXGaKIL8vttXOPjjVS7hzJ7/KFXIFGKxZQIPK9cxrYHboNDu1yAcycdhgH//5p5h74hLqjtpvTgSS0+38Ispmf1jiDeotL+rq4UblXz33b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12262

Hi

Current component has component->name. But snd_soc_register_component()
user can't setup it, because component itself is alloced in that function.

So, to setup it, user need to use snd_soc_component_initialize() /
snd_soc_add_component() directly instead of using
snd_soc_register_component().

In the same time, Component will be capsuled soon.

Let's tidyup around here.
All strange code can be gone if we have both below style.

Normal case
	snd_soc_register_component(dev, ...);

Want to setup case
	component = snd_soc_component_alloc(...);

	snd_soc_component_set_xxx(component, ...);
	snd_soc_component_set_xxx(component, ...);

(A)	snd_soc_register_component(component, ...);

This patch-set adds new snd_soc_register_component() which allows to use
component (A).

Originally, this patch-set was posted as
	v1: ASoC: intel: use component_name for Component name
	v2: ASoC: add [devm_]snd_soc_register_component_with_name()

Link: https://lore.kernel.org/r/87fr29esth.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (12):
  ASoC: soc-component: move soc_component_field_shift()
  ASoC: soc-component: add snd_soc_component_alloc()
  ASoC: soc-component: add snd_soc_register_component_{c/d}()
  ASoC: soc-component: add snd_soc_component_{set_}name()
  ASoC: soc-component: add snd_soc_component_{set/to}_priv()
  ASoC: intel: avs: use snd_soc_register_component()
  ASoC: intel: avs: probes: use snd_soc_register_component()
  ASoC: intel: catpt: pcm: use snd_soc_register_component()
  ASoC: soc-generic-dmaengine-pcm: use snd_soc_register_component()
  ASoC: soc-topology-test: use snd_soc_register_component()
  ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
  ASoC: soc-core: remove dev from soc_component_initialize()

 include/sound/dmaengine_pcm.h         |   6 --
 include/sound/soc-component.h         |  11 ++
 include/sound/soc.h                   |  15 +--
 sound/soc/fsl/fsl_asrc_dma.c          |   4 +-
 sound/soc/intel/avs/avs.h             |   5 +-
 sound/soc/intel/avs/ipc.c             |   2 +-
 sound/soc/intel/avs/pcm.c             |  18 +++-
 sound/soc/intel/avs/probes.c          |  16 +--
 sound/soc/intel/catpt/pcm.c           |  14 +--
 sound/soc/soc-component.c             |  53 ++++++++--
 sound/soc/soc-core.c                  |  44 ++++----
 sound/soc/soc-generic-dmaengine-pcm.c |  30 +++---
 sound/soc/soc-topology-test.c         | 144 ++++++++++++++++----------
 13 files changed, 230 insertions(+), 132 deletions(-)

-- 
2.53.0

