Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F381FB1
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 00:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274485; cv=fail; b=rpvuUlzSE3iadzy6whZV5NHR16n1IdaNgD8+w+nuUQbqN1rwoftbi7n4Fywq3cu4j4HV2oyUt/ezeI2pJdmCBKYNb+RW0KVSFL84KT2OjqGffxpUXrmdUkYC7QFR7GoL8ofQLgpXIQ32vByFjB0UMSiqwZGVm04I7qXnKgvPeek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274485; c=relaxed/simple;
	bh=WWrCjcED2bMTvvglbcdfILo7cqquyWJoPjgxgNljuQg=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=BDyL0GoagojhZL390Kqzt7djYJAycyqe8r3QqnzvNOzC5HSCF4XpMNql6gjLQzwn/fLHkfjDYckOjZslS0LzaFZIR/QDPAtIMQZSEvzJYbvup8L3LafCYqS5JttIXcZjcAlRi4GX6bsUV8VCrCS205eFK2JFboO+1+r1DKIOnJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kBhPFII2; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kBhPFII2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPt3A+b65tN1LUi4rD1nWP3U9JMP3ZHAi/GQNq3avb4rM3u1345CPlrNo5vebrjI4h0juLQIGU78YBKg5Cq3ZzE5mh2PyO/L9aLhsfazg/uUP4MuLwSyNcskSr/S5gO5LNRkhZMLACkUY+tIjHJIz1TsNIvE+I1O8dT7GOUNcXkgDzNPvl0L2z6cc/8t8I9UKJRwo4isaPa2nn4maP2RjbEWvPvwxWHCnnLxVD39RdLrH7s/KXMj9Gpp0XgxPburgI6JSt7x0S8rVfXjsi1r9gwX0TSUK5R7WmUcc+JTSNNkkCA+96VSZcuO8nuAxksNTQo870uS6dxO6BZd4FuvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxKYA0lW2IrnUixX+13rEmLAC/GQRANUeZ98Fld62Ts=;
 b=FB3AD7PhIAj0m1m0twsA6GWCfecxCgeBerw75YvPB+UuzQnb2UAy8gLmug3yjvOtTM+ad8Yg+Z+k9lNQmQgA0uGVRkkfvDGqorx1uLp2Pipe1d9vYifo/TrgaD06C93xn9hHND7pYaL5LY/D3lBEhdmIf/YZeFnivJvlEgYPHOHS3bVIiIwQIXNnvBz3UUdBGAcAVvV4rJvsSiaO4mXQ3Haac904HRVGHed8xN0t4KXNYgCjarUcGypPeQDNwpREYsODCOUOEA8RzGDHGcVXwBPTXVw/ImfdvRu6Bc9sNJRCiD1pozjMPuR6TnhbydCt2fOFTJSJqU+bbwfHxEouDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxKYA0lW2IrnUixX+13rEmLAC/GQRANUeZ98Fld62Ts=;
 b=kBhPFII2Oz3TObATyMXeJXTDe24MnvuHQFryfiay40UwoXxk6d9gsulP7n7jrRmwQHptYT7Hc5/T1aQHQq9G+HeNma0BMuJirnyGvmPNN63GrQI5VwaRuAHb82GBN/ssQrcSWuG+rOF3+NCsnclJjA5BP55hpp9yo8wLt67VJhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB8282.jpnprd01.prod.outlook.com (2603:1096:400:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 00:14:36 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 00:14:36 +0000
Message-ID: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal <sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/4] ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Mar 2026 00:14:35 +0000
X-ClientProxiedBy: TY4P286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::19) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ec9e21-b6d9-4e2b-c43e-08de7fcc5805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SEPZyVLrJplgoBHPHEfOYX8MtwIERm6oP1+6BuvZ5DvAZFq7X9IOdOcmnWrR4plbQ3u71DblKPVJ7jeAnUETaLfHmklBpav6jQqEI0+e26EU7te50I+cyAE2uUFkgSb9lzIcTP2rM6+kNr1/R83pEzyRWRgInE2NEuU9/IgvDTQtlyW4bZTiM7x2CFax2ZlsfYTlzJXrnCPqmksItqNOIy2XKZ8/yFFhGJrv4c1jbE6g5ZTOp/y6USi3IWYgl0RE4esK99EXqu7iwjkyyLfzrU1T9KYCeWkpes6urtCjEtTO8yiMjH19l1R38uY+6OpalJtEH7IyP8ycPzG61RdkRpnECrPgh8uuPInxJ6mPgAct7dip6kIKOJ4A4+SNoQPtuMRzE1rDLCy1MJgb7DlvZRQrK3MPZsVe/BDcuIEI5mZqtPfztlA5/nQoj4NNydnLTCHA17oqVWOKSSf7R66Te8syLKDGZXVClhMEU2g6LGeJv09gxcrYPD3oXu9eWvKlBTEFzYfwL7s2ng4y0bmcC8JmhSJRe7YWKTx0kecm9IooQXIUtco4OVr5SyOO5SNoxK1gwa2clDRsRCiUP3E2X84JfEyw3fZ1b57ot02azkQdCzjmW4pTumSPc9o+xSj9g5Y4C4P9+KApq1P+0NwWnp6XB4bOWl7QTora34xAtkAmMiwITYILpg+CKElcxtljySTOxHFs2VTJnV2xLb50b6XIntaKjG8fesMSp+0wTjOBW4/Sb/nbAzEO6iH9b25cM6SgnJD+qTwCC+caJWRhWEkx2MHQTKGquFMQ48++4Rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0jBkAK01RXyXE++65BFNKMCnlnWxNqGnml2+U4SuJhOqvNcm7ydUXrqgcVC?=
 =?us-ascii?Q?eP1i1PwjB0VypvfSx9dnZ1NbwlTngzUcM5jQJ429lZYjrBo66gBjj552aWcJ?=
 =?us-ascii?Q?/iytCPXr5Y+x1yjAzQXyn3lmR3bWEyFdzQ8edDpQKUzx+PtfnH1WPU1UO8a+?=
 =?us-ascii?Q?SH2ePmP3KW81v0XWkyADNnOoo0WSpPgzfxLJPP6z3VpFu0MMBANok26kVdfV?=
 =?us-ascii?Q?QtO0GulPkcYj4TUtWqGB13l2ogc6ijz+qAb/hy0cVQZMNQKtg9ua4JqRqRh5?=
 =?us-ascii?Q?GiqJID5fxH+HeZ5o7O30aHphTgVsWmDpmEgaEto36oeArOHY2dTlwboeHum/?=
 =?us-ascii?Q?ZUyS6ADN8x1Gwt6lCSRVxzABGc23psYqZkysrBHwQtN+vZ/6Rgh+BBF1+MZS?=
 =?us-ascii?Q?LEyfmwVX5NWlYwa6/e9BwYFWqyJho30TPDXc/tmdE5FrULMu0Nt25q4X05sX?=
 =?us-ascii?Q?xlv2o2FQ2puuHU5q/lG39LE4EQAJ45tQdo2jt+R40R4iaJtU8cXyNXrl3Rlh?=
 =?us-ascii?Q?J//9yWiBVE3IwwxP1SzpunHnxJtuWePQD6LbaCY8zWeJhfX6No+/aCEACD+0?=
 =?us-ascii?Q?fWvOOf/mJ/rFpe56heq1BqbZYdNEeUkm4hUPn26+saqfqMO97rEpXUZSevv+?=
 =?us-ascii?Q?BTRF7RsqmDOa5ddctK2S465GlRfe0Xz2SZS30oH4fL2jLQjVAt8MqBuKyI2o?=
 =?us-ascii?Q?nyo+WcSJWJFu9leb8w2nE6wi9KoG0fOvBmi25ExTX/HKUMFfPv9RNqFzTj32?=
 =?us-ascii?Q?HycFXRfR6HQlUWf4z/B4hmTuNmwbdE8wID85GNCLapYCdNRIgC/VHR/XUxne?=
 =?us-ascii?Q?bzlcsqI8OaGGHcr1gAm7GakJjr+heZCFS5sdaY0jRtufit1aEe9N4XI72GK4?=
 =?us-ascii?Q?ADRhf8151SfXwjQMSspLfl1g2jnzWb2Za1k7/7jH3cd04os5+C6NzofObTWu?=
 =?us-ascii?Q?/kD0iQi7D4ty8RLRmmQcGE0M0zEYNto0Oep+w7r3Wf9HeDkQZWNpG7WruNmt?=
 =?us-ascii?Q?KuuR34CNLMqip/lQBHfZE2evQdpwU968rdtjIciU+G0EPHVEpt1maRukAMRJ?=
 =?us-ascii?Q?s4petakxSTM6PWz+c3SiQRxPoUkCNX9MjDa/dQiET6DHYBaRQJ6SJ0e1QDEn?=
 =?us-ascii?Q?s4g6mpc08JAA0dmOJd3U6/aexj5fbOuDXgwBP34rJd/GOn+B7GXfyAQA1S1X?=
 =?us-ascii?Q?XJIjua47A7Eks/xTuMNdhDhZ8B2x7frt8g8CLgKsfI0eGzP7PESjtpWwoCxb?=
 =?us-ascii?Q?qwyomfTvd2abrJ7JEk0FAqCp5HuOTpl4B7zqCg1SRih+7loGYWB7WF0XqHig?=
 =?us-ascii?Q?JIyXL1iQueL9EoeEg2ADbPUn7vLZUKlcnYQnpnPaF8/V6NzBFYZd88NEu3PO?=
 =?us-ascii?Q?+JooKv7SRximw1AyeY88jJS+KwyKBhZlGSx900O/vawBZStzKA2s8OlNtr/n?=
 =?us-ascii?Q?E1DfhXSfH8YAudQz6oUzn7gQt6xxJsM+xl7yj25+MZYtfdnqHRPgt7Z+2mhj?=
 =?us-ascii?Q?lGXEsfVPOCYH4I9GSktbtKs2JYvgEB96awSH7wDMGmDLDSy5vLkFST4M8ATQ?=
 =?us-ascii?Q?ut+PqaymXAX9TPXaVGepklNKQegCuMNOiZFpqO7Y0gNoAp476IKAGzoMF/Da?=
 =?us-ascii?Q?rjrIGYjlu0xasgSzTHOHT1ZPqKJASHEUMeYV8mPUljEcedLCTce3CmqSAHag?=
 =?us-ascii?Q?NE6yzpGQbgQWXiH491QIejMmvEamezWXbFPKEStCF0mUh16THmi1QYs+/640?=
 =?us-ascii?Q?pXREB3o7brGCuzOsqTvt4Vr+IFSdmE+YsouPf2TOX3iv+zWWVILi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ec9e21-b6d9-4e2b-c43e-08de7fcc5805
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 00:14:36.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YiZ2y20s2Hj8GBw9WlGfUNLM3xzt4ds2Jk5ez4MiSfRkkf0xV+lAEzE3wyyjfQB28egdClayUKE7rGK22UcsnBzeTtD3odqWwrYNsCjMZRlqFxGxdti3vMDN6F/Y5zE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282


Hi Mark

component has component->val_bytes which is set via
snd_soc_component_setup_regmap(). But it can be calculated via
component->regmap. No need to keep it as component->val_bytes.

This patchset adds new snd_soc_component_regmap_val_bytes(),
and remove component->val_bytes / snd_soc_component_setup_regmap().

Kuninori Morimoto (4):
  ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
  ASoC: tegra: use snd_soc_component_regmap_val_bytes()
  ASoC: soc-ops: use snd_soc_component_regmap_val_bytes()
  ASoC: soc-component: use snd_soc_component_regmap_val_bytes()

 include/sound/soc-component.h    |  3 +--
 sound/soc/soc-component.c        | 17 ++++++++++++-----
 sound/soc/soc-core.c             |  2 --
 sound/soc/soc-ops.c              | 19 ++++++++++++-------
 sound/soc/tegra/tegra210_ahub.c  |  8 +++++---
 sound/soc/tegra/tegra210_mbdrc.c | 18 ++++++++++++------
 sound/soc/tegra/tegra210_peq.c   |  6 ++++--
 7 files changed, 46 insertions(+), 27 deletions(-)

-- 
2.43.0

