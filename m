Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F22BE621
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956663; cv=fail; b=ZLbsrxgyIlA1vENPNN2/yP3cnhBdx+2lUozM6jfNLzWVYn0CQq3UDHzJRNmj7n8+V3/nqF9MFt2ReU4JZj6rwF+d3mNn82XIJdPp34/lLF/Cugwys2ywK4FLQJCTYPMFUFI7+swZmeiD4IQyNO5wSTs7nCX3jG9SjC+VDNY8Sk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956663; c=relaxed/simple;
	bh=WqchXI/3JYuvWLbmcNR1laHlS+NJL15wugAnUUqxxz8=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=aWNaVv73cjhaIdcgXUdOrEJj8m8/9/Kt7KgtMSaHAJcTSTleNzpzNsfvftOy2yxiD/drQ4HCvGfY+tiHd+Z/vvPbLS5RNHhcF7PN0w0l0Mv+U51tQkwlQhemKulPTxtwKMIL/EYAzL6qgW7zm7l+61nOXsUur1mbDWdb3BKOhbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lm1ovqVc; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lm1ovqVc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYIPo4iBbzDcVzUcQB/ktLYbRU4VpfnQ4w8mZftzUrcavEDHe/vx2grQepqHmwx6YoCTwfEENlsNTxE1qVRsuiziizB7fBAO06Txy6wNvVZW9THCuJ9yy435a7FGFOc7K6Dx86Z/BFhWABCFa2v9hT/d13eMs2RVC660mHnfmv1J31S33QdQ302IMqVT42Nj51ZCXhxfLQ6/dQ780qHrkjxzsqCfOWFMQ1FZmGfk05ck2ftquoKnnseVyRXNovFLKLwvZQ+OqzfiE9NR/+cQO9JeKBPlPNoCco7nC1N0nzAwXaNSULRIz2acfY8GI3z8JjuBmZnnZJF1mMNOFWtXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGmpGhQwXODMg/VmWr4j8gliKhZluWQepXAARm8SNqI=;
 b=Kvs8Kx0H2R7qMrys2OfPEoKN+LECWIB4MtLiAMUcm8rcGjFUwZDDGlwSgUwpw/PH1Q+fjr1xqgiDGj4uaCSvSBopOYB4jbRMab4KVSjbo4FqAnMbW05G7ibIp5K44YUfABCbQpfIYSzx9+/Y4rQBRAk3nBugaqYn1+Ymfk0pd6gAlDNMaBV+BSXkkFqLSt5QXS0Q69+P+LNM3NH4dqXVF9UQHQPcd2j/lX9EBCTjlHv3bSWQ5FlOm+SAPguKwxrJJ7Ee7kj+8NjXeVP0MBIScPMjoACFN9WN5VPPR6YclsYHLuHfT2ROyuYRWSfkufIrApozHiN6EC+9BV9vh5smeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGmpGhQwXODMg/VmWr4j8gliKhZluWQepXAARm8SNqI=;
 b=Lm1ovqVcuxDLfm5p7G7tpRkJWhV1kdYa/HKWK9vsL465Pvf8fTZN9XCTL9gBKwMlpP6AU/vFKtSany9xjDjOevG2lnUpSSo7+b6UDqr0wMZDO0bKvymIeyOi/YDXAUABasGJfeb6Fg/IrvWUdBjTfOx7JF6ntFfGZlnckpUF4Vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:44:19 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:44:18 +0000
Message-ID: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/12] ASoC: cleanup simple-card/audio-graph-card1/2
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:44:18 +0000
X-ClientProxiedBy: TYCP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::13) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: 688153af-bc22-41ed-ab78-08ded7db6e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	StZHh2GpEaIN7P3/wUwjMdS/GzyCOx0j9qgDEwemP+MwWtANCFYCLwlZt7P5GFbdH47zvCVrjdAwb9YpkRTlTT7ywyc7XTRhSWXccNg64sB4OO1EXaLykr7HVP7fkGPSToimrc3fQ4Esc5HEbW4VKHhogjHRCbFG9+MpJw/PyZAa4Lb4chge4JLsZiMubgjsMp4EoSQa44NBTpXn03J9cA1mR75wS60XRsA5jdKwqeNYDGJxk+u2UhyqC1n3qV8jKY+CO6Y1xLz1FL4fOcPt+3xkHIp3PAt97l3uouIRbiI7NsIZhIPhzPjOJL6yaklGLg5VuPoLVyXEUcGPyI9nshY6JwIfS2J/p60bdWmUfUfxjhvk7iv24m0k3bgkK/YNA8BLHmXuObdHCipiqluPIIjk1atmjR9IcJbf2FY6tWmjV0QnS3ACQ8DruGHdELzbfB+4yuBk/4zQ+9mXBpyzajUfFXIezLPPdnSRHgwk1K8pDMFFJcWUfn0FK/Wa/56zlJSjaKd3X6gbYRZ0YV/i0/uOGEnBpqAHC1mN+lNldWz3uiwn8u4LZnuoHh3I6GotfC3oH9U5ijmkM7RR/GmPH2yfuA5abpSC1YsQrEx6d+EPI9ABPEAS5t3+IhbtEr/OomTAe8Rlnq/RWro3aJT52tXe5y5vq2jeJumIi+QnK7edWHOrBpYLNE3B2t8u/TMBLf+r1SMrqe0mUrj5O9iPEAjjkgVS0pUU56HprlvxMXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6GIY2Ls7RLvU71Zps0AWU/1XMKqeOKbCDS5pMRLW+thRUHc67K/3m0rw/d89?=
 =?us-ascii?Q?oNFBMoC7vnxLGihYEZ/3ZqUhC1+dog0qh/RKH/yCo2VJ8QkM9aAEsa2DxNL9?=
 =?us-ascii?Q?YmaN4x8U3ZrhCCzw1lZFVJQVapd9MAIVpwJz713kZRX8lSl8CWLrkLqmw+Iw?=
 =?us-ascii?Q?ivBEhGDZiskdiuNZrSn3VZ/b9glPLUZslXeaUAf8JAtNpMtdwMTPkwrROLo7?=
 =?us-ascii?Q?0XNOkEzTU56Xow6rGpCLwImuZ/ZDvMTRshuheWHRnzvqhe6QuhcgZbvsIMks?=
 =?us-ascii?Q?S/zdUb63bpXMix24aJ+J+i++xI30WG/HxoI2IdUfgUJe+UxRDXzaoL4I+XB7?=
 =?us-ascii?Q?VsXXeJF6+7K/V3JfMWWEpeDTMOTEqDdPzefYML3hLIfMGXQfCMxxuYlWqt+a?=
 =?us-ascii?Q?tiGO+lzUTohxGeGY+DXOhBzO3TQCi2G6y833ZgAxdDYKbmh454F5iLucn+hY?=
 =?us-ascii?Q?rme6PJqWnRObcMu81LNvzS619Bc7P937UpPM4PRqXMuvTXuxsV8hG3gHi3VO?=
 =?us-ascii?Q?I846y0rkvi9WQdKwbi8Dr6mPsPwr+pO2ZAknLCPTQx+jzh9eKQveW+iJRBC1?=
 =?us-ascii?Q?J52hIix2aWEpbP5URuqgW8ioKTIv6gvo3li0trcRb05Dy/J6QfYhVYzMtp8I?=
 =?us-ascii?Q?8t/srn0nsmX5TfrVbonrspuVtgxyDs+0l5Wp9k1sQjy4/GI1e+zv6TNp9mZC?=
 =?us-ascii?Q?v21q3alqU5JPDx5u0ke7vXntL+jtwHmP8rqneTtQcyG4HrohO2HPpYBM9dWI?=
 =?us-ascii?Q?HwcXdxrh0g2Md8MTEeYT1PN0PY4PdCI/bauDKJP7oGYmOiIYsoaBv+WTPv/z?=
 =?us-ascii?Q?tfwH/Q12eE8SkbNkWEpgnzLYp3Tyt1+WYPMYhgF/bESt73jbTYXeMVYQ9qxa?=
 =?us-ascii?Q?uU/szj4fJ5ZqETr71kJVemskbUISPnm+aICl2qxQbFfX+sRV4jvfhIjPBUDh?=
 =?us-ascii?Q?MV+sUQcidJyzhV7i6HGMYfHYbqcGC/ChNK2UmBc9ddmPTurYR/xxFthdfHum?=
 =?us-ascii?Q?oJ7wlUXswl6Oc3RsD2l4Zyf45IlqrJvnDQ26TzKZK2xFfPdx753Lb+al88OX?=
 =?us-ascii?Q?QJiOAP9IxE5h5cyMl3Eh24KSxl9nRF9b5VDw2pNMYZj1DUj18oeWtx6M1o7v?=
 =?us-ascii?Q?bz4c7fg5lCgKYNYcCdX/RlmPwRN2ZTUXH46vDlb0zhP2kk3t6NJ44aCVHAF8?=
 =?us-ascii?Q?L2s/eFVEwaca7bkx2A5Hq3itoQ6RphMT2CGnxYf873elHezdJYjdrg3ST8u4?=
 =?us-ascii?Q?2BPlNqON7W9pWo6Rqawdwwxj3uPyGECrygcYsWff3xBisIW2H6VZdu/rMckS?=
 =?us-ascii?Q?v3FlSUY64+jSTub7RFFbbW/24Y/XJ37QIpFACU5xxl8ntl2LusmWMZYcF4Of?=
 =?us-ascii?Q?GIyEy9/CGI9nJBHA+NDh+SeIsCu5pOmXcoF+r7dAETn2eCfgQsBl3+xwyYy3?=
 =?us-ascii?Q?KZ5kJsRMyqGE1Gf+Qv5mfYaqJz0bGAUK5KC80BiSqrOlxLtB4nn9flGT9gig?=
 =?us-ascii?Q?EbLgpfPX8X6Q3Y+owOfx/yUzKibe+GE2NI0RP2KXqrHZHw7tvW8C1Ttjx+Bq?=
 =?us-ascii?Q?B9IsgvHyJQenf69p1UEMTd7degqSHXHF2Hu5D5AYwJgn1aRkq8IHkcbA8GHP?=
 =?us-ascii?Q?4Obf3CXz0yfDC1MEPaKhB7ysLV2TR5Ki+a+bg6cTgWzFW4lNPfYAHnXfBQZ2?=
 =?us-ascii?Q?iaUpZxambSp+46OKNbMPMUQMJFwnXLMTw085Hq2VPk58sk+R2JYGL3tEFDgQ?=
 =?us-ascii?Q?I0FXpGVQAhQhWSbceLMITMONnZiyV4YaEQFDh8JC8g0UD5/7gS1B?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688153af-bc22-41ed-ab78-08ded7db6e94
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:44:18.8309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dszuy7IWo8kTMyVkpJ6n44QYy3PnNb/vXmc1mHQ3qXMt8+oFMAZVA/1GctJoecWqdabYbHv8gkq2yV5vBGv4nLU5AKAfMFC1mhYsofq4P1DAKnZmc9LoO4OxQqPCd6F2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951


Hi Mark

This is v2 patch-set.

Simple Card has removed platform data support.
We can cleanup and more sync Simple-Card/Audio-Graph-Card/Audio-Graph-Card2.

v1 -> v2
	- tidyup prefix handling on simple_util_parse_card_name() [06/12]

Link: https://lore.kernel.org/r/877bnlerz1.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (12):
  ASoC: simple-card: move simple_parse_of()
  ASoC: simple-card: merge extra method into simple_parse_of()
  ASoC: audio-graph-card2: Tidyup audio_graph2_parse_of() around error
  ASoC: audio-graph-card: Tidyup audio_graph_parse_of() around error
  ASoC: simple_card_utils: add simple_util_parse_property()
  ASoC: simple-card: tidyup simple_util_parse_card_name()
  ASoC: simple_card_utils: add simple_util_parse_aux_devs()
  ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
  ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()
  ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()
  ASoC: simple-card-utils: tidyup simple_util_init_aux_jacks()
  ASoC: simple-card-utils: tidyup simple_util_clean_reference()

 include/sound/simple_card_utils.h     |  37 ++++++--
 sound/soc/generic/audio-graph-card.c  |  23 +++--
 sound/soc/generic/audio-graph-card2.c |  40 ++++----
 sound/soc/generic/simple-card-utils.c |  94 +++++++------------
 sound/soc/generic/simple-card.c       | 126 +++++++++++++-------------
 5 files changed, 153 insertions(+), 167 deletions(-)

-- 
2.53.0

