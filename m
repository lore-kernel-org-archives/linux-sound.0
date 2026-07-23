Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E3345EA5
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788449; cv=fail; b=QpneK3hdQMeL/7ul6+x5Br+NurO/chJr+enb3MuGy8NScZFe2anlTgt5ylVy4bQkwy3xfvwUk+WQRHXotim/kBQVxomJPCTjgnPJRIZbvcLM+oPPTgme2ZPsTQMOtjasTGUlrSELQhMrf5rufZ+nn+EHGz3dV9EwEv7qPmc59ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788449; c=relaxed/simple;
	bh=qhrtmSiaXPPULshcT+IMNPskcZClB1THAJ/Se2pb9eA=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=fhBV0521SDiiCHRgrg1Q7KxpoLV3F09TjwIrSh764F2Jg+ra5wqEalZM3opdfM/m2ww4O54zLlInsDS6cEFcn8SucFtSanVdcVD1V1dm65QI8TvD7eW7FSgCutL1FvKIaFZrzrVe17M7lHG593X3vCWkDFLY9OWqxHaF8p4VnxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H96KEq/6; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H96KEq/6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chRHYa3wFyqwONZV1RWbREQT+tRE/FLfAi89V2Hry8LRm4TD2HJ1GNWIRoPg5r+SDn11G9zO6gatOq8R5fUBax0Qw8XFFD6z5Q4RztwWMuO7HYgo4rrHUhaopVtAy7GV9xWQrZ77ubS9LE13vRvkamxg2cpmNbE+r+4dLDBGqwB0Bvpg8VtGT2IuIlJGq4QxZNB+l3MRMyG5woSl1wHHIajNRPgp1Z/6AYkFlcwgWA8du8HnRimCwmpnMvxn2zSHAI80fVk2vaTnGi/hKN1CzFeH9/KyxVMt0vUWTs0JJaGzlmc86CJMeJHlLXWv+OvjMsaY1OpRv5Ks13Dux+pbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EneoYt9Wyx7kAF572+QvrQAdsRWqkTq1NumERvIFWh8=;
 b=Ah2tuozqhV+51v0jpE6/6bh3Eldullo5lMbDNB+yJhAiQP8dKZEg1p5fmjJikf6Tydd5N5xFCPSpuHjbe4BJcfNk3NWiymkV5Xynfb3i4T7OleW/LwBb44JSGbOEX/dfeFnV7JUQ9EFMHK/EJafc70AwX8nJb/Qy+fR7yHa7wd+4gWExbxU52N9TSk9tkJ/Kh3zYyZV39uJKNSBlJwLK98hxsywyCzMT6CfLVo7fzCtAI4Pghv/KnSNHOlpJxW68/BtdPsL17RdlEl1MYvYyHETV49bAS5hY+2CWf94q1HGXmH9GsrOc2oX7h8TYn4NYRP34J4jumjsDAaHewZpitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EneoYt9Wyx7kAF572+QvrQAdsRWqkTq1NumERvIFWh8=;
 b=H96KEq/6qtz4GK3ZbfxbXBlzGIpQb/Uatp3CYhTMeOD2hgjnFnMqrVWh3dognoZHLzZA8mqmwmW0gIerpO3OCdN4L7i2t9Bs+mnDeeld/LKGI4icVhSpHCE387Ey0oqJ3ffsJ3sDJ88VY+ucWrAj7nRbPGRJS09AYRPJJrgXDxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:03 +0000
Message-ID: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v5 00/12] ASoC: add and use new snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:03 +0000
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7e9180-eed4-4cbe-cb63-08dee8846359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mYPOibxPOnPdJBtBzRSvUTVmn8XS97QOKzVhJUuIeINP9aJ02Ny7kEK+PQWIGc/9/lJpRG4T/LlPiwaZg+VDRVp6w+1ZlHfjpO8TU9jCl2H0ENXqVu7ngxMvht+PggOz5jM0Aj9EdcAHRt1K7rfsDuzHKbG7pcMUouRNqfsA1o3QxoAR871h85A2x+QRXAYvpnFMW96ahN3hw04sb3uvXz0YswsL6cQDzG1ALbPtUPyQdjpcdgFZTJPI2bB/jRl+/OAlZoNwJ4AXa0HZCL15CoMXxerbHbe8Vo7vBUbZWC2VlXK7f2nCjWWNEbizyQjfvZfTXmb28flBa9sQUl/B89HijLgzyibQdTyrj1zfJdK/G+5jUinlUWremTjTaORkV51cFW4LUjNnHS6Rfach3Fj34A6sICkfIaXe0YH+z2xoglyMhwFe75RromQErjKqGzbBBPFS0hdjYGpmExHAn5gLSbDYZHBdsWLiTnXe2i8+3z7zSc/xsEOpWHVgLpOVj7WM4dcTujpzSAiZq1QS1mJ+qxT1IS+vqGea0eyC6XjC8JnMqO0SCdrCRGGAUwKE3OZzoNdyA4ZgYGjwbm35or4IBBLyNnGeuVyqSNHgUNoFlY9wwm5ZYs7u9+6VnNw90DtMjNAf+9AvqmeHMrDRWo1+36riWOdxhhNdUggb1yau97pwZPZioTr9xOa2+TWc1e4di4o6l/Ef5ZtKyLSELSrwT82P0nvBPUy6Tdvm0i36dzSkvVCYpSq0eFHGovij
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Y1Yazsbb0m4b+0IjUTLMftdMUhqXE9vF3afUfdoFMDgThtHX8kFXOlkITqP?=
 =?us-ascii?Q?0V4a3mVyGF5YyzwUPhWUr6EoPvso9jTeKJnufSx0uYf9ItoMZHXwpK1fs74U?=
 =?us-ascii?Q?Nq7IDltqhO48IRDqYLmEHVWu8mA2kiUQBF9f9HzzGn7ITTE9lo82X6JO192C?=
 =?us-ascii?Q?P3XvBHa+NfLNRv/mIRjkp6yD83YgvKO7fQgfveZ/WxRYfFHddM26PHJ1Mr7e?=
 =?us-ascii?Q?hjJWNammj01rqYBOvwqblGk6l39M939aoCv4yFO6UOIbFYPujP/S2BsZdugG?=
 =?us-ascii?Q?QpxHQb9zzA+pI4DwxEGUm6hyDtb6egcQMkKXKJzVF6gf5F8TxXEue2IOZAa2?=
 =?us-ascii?Q?JxTGstrRwH3eprKrJilyrnreXgiUOMpfcP5n/Skzano3fRuCJAamxD4Cm9JX?=
 =?us-ascii?Q?1ynrrFeWr+Ezpa0N8EfLvb5sm8A2AwjOX8U9/qvSQd37bJi00UjMZEZmIHsx?=
 =?us-ascii?Q?b2A0x+qpgp2lU1USnJwKBsuEEDuT/iNtmq9ym4vjImiMZA49l3fFBf+vMg+g?=
 =?us-ascii?Q?iEhizph9pDU4VOSEtyvHT0JYJBJlcuS4LuqqPBqFAGKptxWaWXRtx6QTzVfr?=
 =?us-ascii?Q?80xZDCnr/jcHzUqLcX0rCX5hBW6G4BjOMpxHXFp5ZhkCJhc4zbnlyR1lnFtE?=
 =?us-ascii?Q?aFXOYzu3dgfDk1FgxMSRoib7b2k+yBsJaBSKGpQK08UXpfZAefK7Fy/LgEde?=
 =?us-ascii?Q?hmDSntVF/aKEbqBmsy6IrzhiIKm4tapFD0t/TtDKObarEgMpKxL8rVl22RcD?=
 =?us-ascii?Q?m7knHvPi0HPlN4UxKvHdBePslsS1RRGt/cTcf1m1dRqDz9itpkZRQRffV5Op?=
 =?us-ascii?Q?u/ZE5ydwMwrEGEhHYUxmTlsfYKB92SynKmsT4rI/1YrD2i/QjAvb4i5SvXSq?=
 =?us-ascii?Q?XihC21iCodYb4OhUBTVdXzrZzvWZ3DsUpbXXWAMA8gbD0rYAESZzuSnlvwtr?=
 =?us-ascii?Q?FHRtXF4VJVlZRXWtZf1nxL/VAdLZ0aQs4rZCNdhPYXWvQoZWxfBKKsfK7cjr?=
 =?us-ascii?Q?ELgbYZGjWLTUfQP5Talh18i/9TG6TeO+bQ/xJwRRhP1nUWLPpXLWXY5UF/Wr?=
 =?us-ascii?Q?JSmbJRRDLsCW+OAiueTtGElo/gsHiSr9HQpPV169YTm2goWEuNDg4qTml8jc?=
 =?us-ascii?Q?pcbc6/w3S0Ci6TcaKHicNsTRfXg+udH05IPLu0hcO7ws3nZDYdQsO1LXOzeq?=
 =?us-ascii?Q?BW+hVWE+I2XpcPo5g9NQbYtl/aeEz/BbinxROO8HcoDq1nZJj+6Mtl9pINYT?=
 =?us-ascii?Q?0FbplWmHMv5cli6LCizL9EMWIaqJvuPJ9hYWAQ3crynYAcQm1J0uJDyn/qr7?=
 =?us-ascii?Q?F94ZTtP+I/K8b/B9wy0cZBb+D8hYfmDF5M1l/iB43Q0ICYqsjlS0+2bLw6gN?=
 =?us-ascii?Q?qraWIi97UamJXmYYzg0b/VoZy4UScKq/z2lJdAIosCFCOTX07Nl7wlOjb1n3?=
 =?us-ascii?Q?4i6o1pl1xDdE/FHcO9QvohZyF6Rb4D2yp+3K48mwLuGuCMjMVIvfvSteehZp?=
 =?us-ascii?Q?wDZIiiXo2q1OvUCEs+ry6XEnEx0JjKDcdZLmmOGgi9AOU/RSW8mL1KXJ1Nga?=
 =?us-ascii?Q?1nbNMoX/iYIoQ1Mo8CFasqbPgyK2h6QwXx2AWaZR86NJo51hrM1wyMZagqdE?=
 =?us-ascii?Q?rQzrpN+ffuEOrXdi9kw/vmGZNtltpMotAUK//0ZBLrE+W5SxyVkmKKeyV6hY?=
 =?us-ascii?Q?eKoLDllOlLMPjQRmceuVr99PxWv/sOyv8aiWkgX/JSNbkkwdCEZayXvon+yU?=
 =?us-ascii?Q?vql3bV8MIBNpN64e7DDZH1Y+puL8ZI53dAUqSrern8fNTm1f1F4Q?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7e9180-eed4-4cbe-cb63-08dee8846359
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:03.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hq4DVQUymjdfFXlExw0567FAY52EwXDfCsvklGlOOjmH8ZLSLVN3d+b/8rJjGXzQfMApV+oulgF+d4Y3+60Ehel+DJaXRq3WLRuva7XEbEyyq90usrxPUI/riexXlCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103


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

v4 -> v5
	- tidyup return value from snd_soc_component_alloc() [06/12]
	- use KUNIT_ASSERT_NOT_NULL() [10/12]

v3 -> v4
	- add Reviewed-by from Cezary
	- tidyup around return on [06/12]

Originally, this patch-set was posted as
	v1: ASoC: intel: use component_name for Component name
	v2: ASoC: add [devm_]snd_soc_register_component_with_name()

Link: https://lore.kernel.org/r/87fr29esth.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com

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
 include/sound/soc-component.h         |  11 +++
 include/sound/soc.h                   |  15 +--
 sound/soc/fsl/fsl_asrc_dma.c          |   4 +-
 sound/soc/intel/avs/avs.h             |   5 +-
 sound/soc/intel/avs/ipc.c             |   2 +-
 sound/soc/intel/avs/pcm.c             |  19 ++--
 sound/soc/intel/avs/probes.c          |  16 ++--
 sound/soc/intel/catpt/pcm.c           |  14 +--
 sound/soc/soc-component.c             |  53 ++++++++--
 sound/soc/soc-core.c                  |  44 +++++----
 sound/soc/soc-generic-dmaengine-pcm.c |  30 +++---
 sound/soc/soc-topology-test.c         | 133 ++++++++++++++++----------
 13 files changed, 217 insertions(+), 135 deletions(-)

-- 
2.53.0

