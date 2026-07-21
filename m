Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F063F5BDC
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596626; cv=fail; b=sDrob3SZyyWpgrEyzBxFr6pI2v/9T7kex1XtpK5/e+vuSyAu+xzQ1PEOeBVpgEZSaiRw6ab+/0KENUekYjxgT6mGbTto+Idv7yFUOnJUyYmr25kkQVsb/YOASWi5aNtS0cM5S3GMPlaOw6tNtc6s7F6cGZeuEC53wDrm7mso5LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596626; c=relaxed/simple;
	bh=AJhXd1ZwYQwTRAjDrUCD3mBXoFE3gqtl6BA/Ffqai+k=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=JvOI4K4XgIm4IRuREnKgMu/fBZulsqNYUZUGJE+8LBQexAO6fVQ087b1BTyeozFv/kPfxCRYXocu4k3aqhmNe/uGPqtOP2CIVRawIeo00pmiLM5/N2NOo4fEwSojjqNN4zwS5E/GnnNpxLVLxsfwzedRFMHL4VbLJ5C+GYmkHxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xil+sPBu; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xil+sPBu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/eAB6krjdF+0vrYwPUKZgQMlYN4HMCOq4OULtABu9PMQxXXP8D95LXr+wUScjtk0dr9mR68qthi16rdb1JIfVZq19UFmExS+CfVaK5CU5CmkJO9Z8DS47HlELXdPLSgX7SkYNQ//mSfH92ogos2NmouFapvsBXFN1KHEKOfuIEZKAxc1bR9WlUsaBTe3a6DNYAUbfsrG8miJP5Se+R7miZ72L3WJ/HNI2PWFNv4Sgw6mYFTxYzvHYaQpbNPKIiy75qudPuaRDARgdoiUH56pXKePVJGTz3ZMcRy+Q2FNON1KRHrkEONruT+Vrd4Gwc/DjZ4mjcYa6N0GrPWFG+hOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+IUP7PKM/zqBOIVBkjxMXTUfjGfn22tdUXPJyEnBM4=;
 b=HuZqYNGWMv4gueWHhUywRw3WiVa7TXNbLuzQnNVyzayWWoQC413qsJwYFcn6t+qT/lK11ZV2+VoiVmlRkfp1YHDdJfocNXc8HPFKLu+mY4cFS2yYbZcrRFpKpavNVxuKnAQ5wi9S+3LHfrMUn6v3gxHUjxwkpdocjkLKJ5l4kcEUFR0xsXDNE67Y4Rd2ltl4zbfzJd8H1wQ4vI8uHPKDidRAD/G8gQorfycaHVB/LmI2zsyGQvv+AAh0Pg5spvb2t5HF9TDfTF0Hx3RjmhVaeg+0jIRw+2vUEHJAiikb7hjwqfN6sgC//GMq6LePD3CRxb34KiMo4TCCkU1CyF5TpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+IUP7PKM/zqBOIVBkjxMXTUfjGfn22tdUXPJyEnBM4=;
 b=Xil+sPBuMO8wKEZQWSVqfCFXOB6JEL11QlDHngsKk+orS0H6SYY5ZEeKPTKdFy6yjQmFoUG1OKsBIauTz0S4jXJt0utVcJXkutf4ZBCS+rEv8Sc8V7PAgtYYGe5irFS4tIiUShgd6HsafzdWY7lnjzliRlbMmcPFhkCJ30N2tis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:16:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:16:57 +0000
Message-ID: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 00/12] ASoC: add and use new snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:16:57 +0000
X-ClientProxiedBy: TY4P286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 204f7ba3-7ce8-4007-ad16-08dee6c5c218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GnJlUXG1ri/LyeEw9LuxHwQ4F5ek4j1N//VuJC530mcBWVG0zg8pwAaHxGaKgyN6vdbPM13RXwVuXHAxu41gjROan/YMoKZTC+ZiHszcDoLseuy2YTA9Rgm7De3KOKp+9Azm5Eqa+qmSeurJA/aQ7yLHsHKlsfrVQmgYdzgqV2dmfz4z5wM2feqPWGtiyiV1pqdT6MXRSPwNMYKjtH59NggM4azbdVSPTuczm7S6nwax+tvR6sHiKAanBZ/ePDeWzVh4fFMpzJv7w2jr82lFq7X/ulamRk+oRsZwKKzagx8rCwQmFu+ydMvyTQTI3XZvBExRBNtiSpugATqJblMm75r/ufGjYpzLaRl+WkZ+5EQPtJNrmwD2OcHS6MV9Zf00eq2oo7S/3/w9pmbdzsto6TRU1UsfndyZy/bwsXU/B8dMG3kHWk8PyO2Wcgyt9AuYDYsuk423zoAT4s9smZEH2N46f3rc2O0PUTh30DBNZO1FTLNm7H1wFL+xD7BQjiiwqRS0C4Px1Pg+xzPoWBDBS8Ma57nEjRwfZtd8w4WW4uihhUYum1WynSiKncqGuyGMlYJa5MfpMOAESPa6I/K7V9XoP7EFlzzIvZLWF5u7JQjPkbk5LviclM11xdqz9gMvWLAu6PrcO3GiUMVXBSXIutXkTBnr9xqUVUEKYTYDEN7zwArQ8t9lo5NmjtNEAmLjPzNhnXACuNNR/y2wjcxyFux7Hq3miUcM6NQVOyoaCfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HOARHaQYE49Bi5yGzEojteCwZojpDTjwlFYjjF7pjQ/wCMrmLXMGE3vqj48Z?=
 =?us-ascii?Q?3HReI3dyv8/ZSLtDi0Y8N0h2ifCj5GEFqIxOPEgA+K7O3rWubIYlvZ7SJKVO?=
 =?us-ascii?Q?qwRy/xDuhkDymnm3b5s1vJVPIM18jK2ENjp6i+47+JDsia1FZ8KXSaj0imze?=
 =?us-ascii?Q?4PAZCRypvV+gb8hPmiIKuL3lBqoN/bkLnK/uhL1MgvdMrjMcdyHLGlSfq0KT?=
 =?us-ascii?Q?WHNdS8L5Ps3lrfSOf4LdKTu8Wg6/OPP0Yw83YMCN92loGxqRw6Nd6d8D1e8P?=
 =?us-ascii?Q?FwtNLsXnsCkoWG1BgslqPY0IaMl4XdDb8s4D7tmwoQFO0YSDlm1zIGScVgd/?=
 =?us-ascii?Q?psdFyuoo7JCHzCcH62JVqjaWwi5vMj9ex05vAVuCTs+Fy9NIxfJhj/AEvYaz?=
 =?us-ascii?Q?y5Pwx0mhfr8ml/qKuOII7w57cupXtNLztU2f9j+GY9YcwPSB/UypVd5DQTCE?=
 =?us-ascii?Q?v9iJDaz48QeSOWqJ8Gfj4+rnqQY81d5dEMmFkG+YVu9JifnM1kL0xwyC/LFj?=
 =?us-ascii?Q?U0uNGbVDG9hUf19mCXDU/jHGpbIOPPdB2lOtV7/6XLEaow9EhZUsPN7jJv1j?=
 =?us-ascii?Q?5AP++JJvHNWPSshiEeqeC+fQTdJM+nsSIyIi0JG0VEsPX9M4YuD0TO6gwFFp?=
 =?us-ascii?Q?xkR5EIG29WN1T6LMxt8Y64HMg/BfzWebkeCINoNAhB/IIqRlBpTPfA82tts3?=
 =?us-ascii?Q?PskIVksy+uDpigD6Em/qYQFO1ttiP4hwWyjke9ZURwaHHFGWahYkZVP7fnOn?=
 =?us-ascii?Q?ovoXChgS3IL1apusH5CoRayU8EfaHSNJwG2bqBNZ4dCJZcqDjTc75fL/dvpR?=
 =?us-ascii?Q?jApmxdbLxw9Iy6sONWiQ3VzWm8S3yHHNclkoUPl68e8R6rM6zFiojPoTBcGT?=
 =?us-ascii?Q?JK7rdfVgl+JQQrKvTq41lDX10xpMJUW9AKGNgrOpVWiULXMb4SppBaMCuZFQ?=
 =?us-ascii?Q?WCo55nDqJd1U9V/l6U0HtbC1lZJ2dkGgwIAP7P1OVDEWxJXPQcW+DhXcJ3SI?=
 =?us-ascii?Q?tqeDqFE1QeqjfIyxM7FKAGy6PnEH3hONp5zKkJK5R/0TdE1MS8vGYppJizhc?=
 =?us-ascii?Q?Ue/S5PWREeRkRPrSz8RqxouLaKJGrcoK69tfdfoOtl2SDJGIRP4mleXrCqf7?=
 =?us-ascii?Q?BotVhSxtf8pOjmyaTBIgspmAXpx/iqBvDXwRZUxE5qog7mj5zU0cP+Aqr1v3?=
 =?us-ascii?Q?GCp9mkdyZ3BxJN9/ppS5jaHl4tBK47gu2bkHhFybWnijMqvu4j+MUaVnztGC?=
 =?us-ascii?Q?Ax+KH7LlxqHONg7rKh+dzvgnaYiR6kT1flzuzdAkcIjfQhj3sDrQElrLiu49?=
 =?us-ascii?Q?1gWDTPRkuDrhPnBrjNiuW4q5RpYhyr2+LcTlSLfb2MLWMLvlp3rsmU44DbCk?=
 =?us-ascii?Q?yWe/fgM/nD8bO/SQ1ZfP18/Vo0soBYi1PKLQzs1nILuGaskB63ZFeb9X/xNr?=
 =?us-ascii?Q?xlzbVREUHKGSJ0nOgj6gKb4MgnDzoh5/NJFXmhtnWJeWn8UxTmp/Z7+Yiszp?=
 =?us-ascii?Q?4IPsN/MmmXgozU0cgYmDske+SGuTXbqR0BvUwHPN1vFJCrmimE0VHP/8q3H5?=
 =?us-ascii?Q?tDZK2+FYZOXCPW4AVjXGxgBFhpSHjAZjHZd8uL4Q3O7vj/BOsCD6TYi7v6D+?=
 =?us-ascii?Q?t25OOdJf3lKCojszUU1COcArWmSGyhCJ9eVG0RRZjxUFFS2bmW4NSINBv1AW?=
 =?us-ascii?Q?H8M8Q4khGITl4tfLxLeNNVmQNJLpBe1Kodpm5RdoPBabV+gApKn3BSwkEUin?=
 =?us-ascii?Q?ExoorHjEARaLM903S7h76dQ2PuHx2E9ByKadKdLulEu711Dos7wS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204f7ba3-7ce8-4007-ad16-08dee6c5c218
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:16:57.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bht+YGdB6q7OVoqp5b8UjRoxptCn+AT4PioHja321xx1Rh9t44SJ1FumR9q7FamiHB+Ar8MSGBn65lzmp/snvX4NAQLHcBCQJgDegp9zUk/l3qhLuhahqEz2h0jdosLN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810


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

v3 -> v4
	- add Reviewed-by from Cezary
	- tidyup around return on [06/12]

Link: https://lore.kernel.org/r/87fr29esth.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com

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
  ASoC: soc-core: makes snd_soc_component_initialize() /
    snd_soc_add_component() local
  ASoC: soc-core: remove dev from soc_component_initialize()

 include/sound/dmaengine_pcm.h         |   6 --
 include/sound/soc-component.h         |  11 ++
 include/sound/soc.h                   |  15 +--
 sound/soc/fsl/fsl_asrc_dma.c          |   4 +-
 sound/soc/intel/avs/avs.h             |   5 +-
 sound/soc/intel/avs/ipc.c             |   2 +-
 sound/soc/intel/avs/pcm.c             |  18 ++--
 sound/soc/intel/avs/probes.c          |  16 +--
 sound/soc/intel/catpt/pcm.c           |  14 +--
 sound/soc/soc-component.c             |  53 ++++++++--
 sound/soc/soc-core.c                  |  44 ++++----
 sound/soc/soc-generic-dmaengine-pcm.c |  30 +++---
 sound/soc/soc-topology-test.c         | 144 ++++++++++++++++----------
 13 files changed, 228 insertions(+), 134 deletions(-)

-- 
2.53.0

