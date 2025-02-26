Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC918FC8C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533647; cv=fail; b=YM0J60uyov4vfqenCIFbb+bP7z6m1Q4UcB2Kjmln4tSs1wZuzvpcyZdjfsHEfhD2PR1BrDIHINyNkmMIj42oK7o7vtzYFULeHCrziqkdCnDqjUbajygjKMdpe2qEH1k1R/3rk01mBdIw2B+qLYpEFaq6jr+xCoj2BY6VQSgcmqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533647; c=relaxed/simple;
	bh=ya1e6JjmpWwDmVvCX4o1VhHEr8FVItcpFx9HPT8GGtY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rOH93xgwzBQE7ispIOV8YJUpOF88Y0mgEQVgDLpdBE/Uu2oZsAdC4/N5v1UdcNYDOty5afxHbFvly9KGePBirVDFa29RS+hfhAYG/gQoigVKFvdP0MxMLRIhTqvVOOZbEq3/VwSjPtiLuvFelTjXr6UVEOkm3SuKX0ACiZRKVZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NRLEGGw5; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NRLEGGw5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1LWiNpYS/gJ6rFjzUoRQqgpvuV6T9KnDfT5m5yoX9uAUJWpevftC88leUbOrCGdqKCcHQYN/vB9MiCKE0Xa8Pc9ap71NTDcIT0o9tqhlLp+IehTJ+SEau0sdlp2arYf9jRONk2cye8Ipymks6UcHyNAy9/RBPZCk01FJrk5ihr4ShcmfNnpqljgBTSGOhhsWLxW+re7MNXenKQ3D5poZ4ySvOgbTaSV8K9mh7+5M4Uhlytz6n6xVIT+3dhyI6Us2vOjP3+18QfVZB4MfChdgtPDCZkt9VzAnK0irMadYmLfFdyjR7TH9/Tbp7d7TqRUDOJyIjxIMPxfI8dDCcWJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21x7Ht3yPNSptzAF2UN4y7OSgg3m+kG6Ds8UqUC7x3Q=;
 b=Rb9s4BSawTdGl+uWc5NywGtaZaAxhMNELsfFiypp2FrqKfT3QsKnEJ5zhQHN6jif0S/zEpCjYWhg+FkfO9xGd5xETqW3S/QWU+fhvjIE3XRDWTEuS43Z0XTESmLbusBp8M0okBA4dD+4vEfU4oW3hRfsbN6WIdUlGyUi/g6UVE4tewNT0Gx9AAYTTUn18uf4NEp5tBEzz+OMhW1ux7/xP/zH4xSu7IV1xajxz41ikDaLC/Trhdi4+oNr/LN+I1J49hzw/gTd0u7xJAMlBgA/zlVqKBGxxUfmnXg2Y5RbNVq7kFh9K8qZpt522iQe7T/9oZAJA7GVjU8VEypaxpz2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21x7Ht3yPNSptzAF2UN4y7OSgg3m+kG6Ds8UqUC7x3Q=;
 b=NRLEGGw5g5FRyZZJsaQZY8NBlabPhvbQvpslraMWM7ieEo/i3JlWpehM2fghpmHQb4RhbOU4qVLlHHTEGNfCdc0xWRvBQYgx7fmqh3RBmlrWnviGsWAp6K9gggXF1DluWFEOlkMg9kbH5uwmrEPpFP/jkCnaZrHSwvF7ck9Jc+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:03 +0000
Message-ID: <87y0xtcwvp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 062/157] ASoC: codec: rt5677: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:03 +0000
X-ClientProxiedBy: TYCP286CA0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa82844-726b-41a1-d008-08dd5605a6e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Ny1JA5y16jCgbT+FOaBsLn2Z8NfcMtPTn3h6bFldX/jPFfnBWepju+M5YCM?=
 =?us-ascii?Q?tPLbSa2Wm7+QzJhVrxWGxqSuraboWQJjLKdFdwqwIN4CmLYAI3veuCSK/ObL?=
 =?us-ascii?Q?YZegazb02r5TzTAU8q+RKvBDtzqMUqH5wLihw+WTtHFlAk0lCnHL2nvStkEt?=
 =?us-ascii?Q?8wyNc6nTzkgDajpL3nnBTYEIsY/r5y1BrB3ZoZQyezhdt7EU/sauRtAt+KUR?=
 =?us-ascii?Q?Hv1a3Lj08vhnx8bnP/tLg+4zGA+kxo5dT9vQlp0wClS8OcjpyMWmhpxK97Bi?=
 =?us-ascii?Q?jjSL7rD0gkzFwueH47dv+TRY3xpryNg1afgBnPy13Ss3qQ33q87hQNw0Ltmg?=
 =?us-ascii?Q?QUllGyEYXlFjgLMkB+SANSngW0ClVd5OtVu9bYrE+FrnJIEJob3Urp6+8Kh8?=
 =?us-ascii?Q?p2Ju5axvjInq3NFJefbQGq1AIdPPb11SIThUyzSZfS3U1tpuNa+++3IKx96y?=
 =?us-ascii?Q?ns5yHYN8BIIuLkVHhAUU+WD4JFDKigci+E4gaKGkZyuurfxKOTA3YkYg8EzS?=
 =?us-ascii?Q?0t8SFsfGe6tPNHPtSsmNbQtd36W4yKyBiRCPYkFw2ZEEq0BvANhZ5OhMUZor?=
 =?us-ascii?Q?fhyCA34p0nKyjO6Ko5LP3UzD1S4/0WRq8XSb6MGXFOfLPGe3mcru+6w5i/oX?=
 =?us-ascii?Q?K9FE5p7JHiz80y2U9iQz2Qer1UAHPrXdpZpzx+GJBfb/NFjbYoqNCd5qLCJn?=
 =?us-ascii?Q?rt4fersEF9fheGyCoUlC3QT0SBIadVPRahawfpBfGwy0xYxq66k5567wdnVt?=
 =?us-ascii?Q?fY2ihRusae9rJvNM7F04v0OI4oinWKHs6FSvGLqFqI6Wj2QDMLD0SrDWGviM?=
 =?us-ascii?Q?IjHr5vnyN1+ICCp2G28KXSsLvzGZ+Xq1d01BkOUBS1gtbzsd2NiS/flS+xp8?=
 =?us-ascii?Q?b+LmjsfHjUChnqxkL+N0w1jlo663J3YNXMkrDIFjMDW0Cji9+VzuqM6lAOk3?=
 =?us-ascii?Q?zaQ1MKHW0sdjwKD7vNhwG+JCmwaov8HIhl2T9ueG5XV/oJXlmi3SxwXP0BRt?=
 =?us-ascii?Q?IlpHKFKHgCNEQpcNl94WOKM96jMlpPsrBDUj0a90gQeYgney+it8Eg5Sim6x?=
 =?us-ascii?Q?zcyCyjFtfGIBc/MBCb+Z35EFFkqU4lagVAmVf4felAa1Bb+68khlPzQoapoc?=
 =?us-ascii?Q?58br3K/ypWjeBIVAgolNGSGQYL0bp39N9j9mIeotq3cvFEDHx4/Q9RX0ehqE?=
 =?us-ascii?Q?Nmr1d/Y+dySAjo3exLWq0gZfK/ktfwOaemS8ncSm38DdErIDTArEp2tePZEG?=
 =?us-ascii?Q?xJnOOF6Sa9NpBtccavASthkF2NfaGwl+X7Zp7Y1gdedQ8R11MpQ0aWP9XvZn?=
 =?us-ascii?Q?y1lBK0VhakK290YDLkubKZIZIjXsuqMhZQXteUySOnURU4K0BzwaQ58DSZbN?=
 =?us-ascii?Q?/pkpL/+zQm4X/pY0sZGkXuvEoNL7py1NiTo+ZpkAlH3EdwYfchhmynFn4hVW?=
 =?us-ascii?Q?0Y/9SSWt+GxmoGX1UOXvS0ncjuifjONF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xs2IoR+y3z9cxYghonRWkoIj/AUBFti0oSH+/NAECCeBY6qupRP8jnSg1Wsh?=
 =?us-ascii?Q?cpbzOucsQtl75TEwx4lWLtcGk7V+0VCpUE5ZgfI+i6/Ha4/sqczDNCsxskE5?=
 =?us-ascii?Q?THchLoRPSrwysjSsG9e16neNtJqNiQtjl5gedQfl40QsSCToXzLUyVuYAIYn?=
 =?us-ascii?Q?GrYrb35avUtuJBI5lU0nPQMry21bpKfXLpNSV2T0KQaN5QlNKVGq09u0ReqQ?=
 =?us-ascii?Q?UZHi3ggx1eWSp9qygMQBSsNJ/yo+gNs6JHZyGTIrZkXKaWbD8DrqoFGBsqYi?=
 =?us-ascii?Q?DuP6FGILzSqK4tQlAyPdtyKaJqcL/nC5czDPOOqfKJFbuYM+og9wqJiknqYD?=
 =?us-ascii?Q?xm+9JF1pDwLtr7diGtJ5+VOTkm5O4aPgVrPs8kc16IdC9uljY7NdjSHjg8Bc?=
 =?us-ascii?Q?u7hA2oBrO6VVkXN5D9uHwSS9dfMNoH1Nb3qFv8yC+vP5qzzKgAYrKhvGEtMO?=
 =?us-ascii?Q?V4XP9vTIhPMITcfHZwwZM2wkzt77k2TD2Fb4qlRJheB7PJ1NfASga8XwwxSn?=
 =?us-ascii?Q?QgpucgcQZdy9Qy8uKenTHbGM3qLLxGHyh3tE3aZb/ipoCead3pCkY6oSSMjI?=
 =?us-ascii?Q?i74ndr3s0alTQbMLdzWGNmED+E0fHFjbYTMAbItkfUC4VJmAsDSqGeiQPrU8?=
 =?us-ascii?Q?/Ib8PRHKlSZap7V7ViXjopECuhlAUlqapHKm/Jz20EGxUqkTDmOwTt7bE38J?=
 =?us-ascii?Q?nT2q1e0DwofipxUjLQtDryCdqwAa6pRM+ZgL0I2Q12bhcDhDHjFKtSVxVxKK?=
 =?us-ascii?Q?5wB/1AddUM1lMtmb1OmTTK+joo/qEd6I/eXkcid1bp89ogVzID9aI8IV8pUa?=
 =?us-ascii?Q?h8t3OsZap4HJQX1fJxa/WoGMu7KJNHCo0do3mWvwINybbBiXwmxJI9ngcVfu?=
 =?us-ascii?Q?3VAq/+UtKV5jxQ0aLEylddqZhhHuWVPSYf7758CP/BMcEUhr0KKWard2H4HX?=
 =?us-ascii?Q?+B9luj8HxEJDS9ZXGG/RnBidZ2/TDXnj0lYWujfMlKy3vYA0yHbuzUqTEgpr?=
 =?us-ascii?Q?7uyG8qGqQJefkn+GykYZFSXku1N3h9JRbnLKb6DL8+Lt0iVYN7oXtVnZi2tW?=
 =?us-ascii?Q?IGmoZetY1MvgTwnjsv0nT21nQeQdPMn4DGT0O/KnWFDXaJk9K4H/7WgV6a4x?=
 =?us-ascii?Q?HV8Qbj1/Q9TB8Vay9KDfC9zz7xuQAUeocfP8eXIpnpSZm/MR6q5zpDXtwuVT?=
 =?us-ascii?Q?fdYnUjDSkXFXvjkZ033+viZBrycAcnjHD+Q+vtXSNdb+WogCawbTw4i5ShuE?=
 =?us-ascii?Q?4hn7KJuQGeXdvnpxx2zLyEGr52egL5/7RLmNlRNcOjXRxrHG8dGo2syMDi8J?=
 =?us-ascii?Q?UZAsH12SnYI3m30JTBHoCLW8biZwi9Iu3+LFrTEC2UYI7TTkYQ6jpe4DgBAt?=
 =?us-ascii?Q?9wZ2SDZIdAu76PxMYz2/0vfkpMG2J5YfL5/HFq9tnamKUg5GJ0JhacNgtf3p?=
 =?us-ascii?Q?YL/AZi5of7Y2kzZ0G0i2rXsVDS4spIm8qHKZcwnX+oTx6i6hgjrDHEq3A+YW?=
 =?us-ascii?Q?12S/zpN61e9KJ+ORbb9UX3r/oQGqNNYrlEfRTUShbq+i85IKW3XjQXXZBite?=
 =?us-ascii?Q?+pqsft+71UwDWS/rIrwV+RB5DVe20aF22UDCHjImVJhRM/huF9LDu1l3Lqte?=
 =?us-ascii?Q?lCCfJAbitZAscv5R0BL8QwU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa82844-726b-41a1-d008-08dd5605a6e2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:03.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlX1d2pi/aK8pd7o2RmfIRfdBJAvwFoBAcfNx+pURVgVPBDdwtcoOdjuhR9HnhRuro3SWJ+WZwa6B/3CTAppodhsCiICYSFbpDLhJZSGhTtpxtUe7YDyUO2arzhTIPx/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5677.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 0e70a3ab42b5..753dc3c85630 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4377,10 +4377,10 @@ static int rt5677_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5677->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5677_I2S_MS_S;
 		rt5677->master[dai->id] = 0;
 		break;
-- 
2.43.0

