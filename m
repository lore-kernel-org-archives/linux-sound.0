Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107C3C2E
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 00:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783382584; cv=fail; b=dTaAuOUiqUIkIgyWdkJH6+GNbQLvbvNH+fO++Zqzud8weEbrrG8/XZ2P4z6khev2m2ZZvvoQMFLBFTi87RPdeijvHxCdWiQIibyhDTxEnUQwCk0ifjvvf3bzmjL1aZvFLqUUDvsF5lqILgT/8FYvKaq6pWlTsVvHP+1CLz1geAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783382584; c=relaxed/simple;
	bh=1PJ15A6qqxe6Cnq5/cwjwYNzqPnVBK1W3H2HDkYqKtY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D9YEDNwD90+LKn+TS2C+AIQg6sV7wfUirn+upTgAyUU1U8LOHfkeepho4bnWwt4hLOE+1/qRQ+Jr/KasIluzQn6zkzgm6mid9r6sKdKGt/Lti4vHafigCCbH3y9CLzSTlzMPNNp7poku7VRlRB1f5PRBbRR8s6/wSqpnj9fMPHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Dn3+AJsS; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Dn3+AJsS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sb/JmdIn6s74DEflxBg61ct6VqhKqVhN/eOSxHNcDkdJUYlzbAlbfJBv3EN7oNq8bpvmVFyJd4YM1CEFgQwOu3j9iV76zc2uyOWmjXmCfSBS/kWUf8SqKaRzsb0wxI8GXrOY0eksVL5L53qjxFhRzyNVVXVo2Gxmzjf/5QdnGRFPHE2DVDH8thW2RTN+xTqnYbeDDPAdzE+tuqtJ0q6G2+AFdAKQ1HTUYy+2lLe/TzGLQuj4pEpPgQY4C++rkcbTz7fT8oyaz+tqF5E1hX5hOg7Y0gvy9U5FjoUfJ3sFlOTyOTh4EOkxfS1HRN1zzvYtJbJG+qz8RxjvLWjrwEKf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVQFgDIh71GrWXM8f5f7DTpGHmINrou7SfiQ+PpvQTw=;
 b=SfdnSppH1uepV/EerdkFTqO4iVIqyTfuz7s/T3JnswDqHHsqZ8h5bsrXh0guuTgqReKw5iwD9SYRqh06bqvRmsQIsxjhWi3nY79ahds3RuybAG+W9K3uAdVeNb7vpFJE/P02WOa9yFn/WdNH/gmf3vau1urD6cIJrl8CjAnEyB+sf/kquyl1tQ1aNfvJdTwSMCFsUjzBOFKbu3eCUhS6mW/B1CaSgA0E9rbrB5DsK9e2AJlmWQzgHZoIJ//IU3Hfbuj/vK6n7Uz47YdnEr8+Lp5hTU6ANisgOwOotdyv+cEL2V+eoh+evTpZd7OmJWFhYoQzDpnf56Xo7hUuudPEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVQFgDIh71GrWXM8f5f7DTpGHmINrou7SfiQ+PpvQTw=;
 b=Dn3+AJsSiuo4phsT00E8ts+c0ux5A82CYBxPflGQylCLurZb1VlPZBR01QQ//VNrwJmnBzlgQIvd/kH1RK9yFH+5B7oatUbNsWz4nNovGUSU5JGugOJ1Nb+kdxYKTsnJCfdIZEnAMkvolbF570n3U7BOniaW2IcgaiSB7ymP+CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB14534.jpnprd01.prod.outlook.com (2603:1096:604:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 00:02:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Tue, 7 Jul 2026
 00:02:57 +0000
Message-ID: <87echfhdji.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,<linux-sound@vger.kernel.org>,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH 0/8] ASoC: add [devm_]snd_soc_register_component_with_name()
In-Reply-To: <8733xxc7xb.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
	<64a890c1-5db9-4bfe-bf28-4ab5e4d1b1af@intel.com>
	<87v7aw64xb.wl-kuninori.morimoto.gx@renesas.com>
	<52993b7b-d8db-4ca2-92b6-a23e6cb05b7d@intel.com>
	<8733xxc7xb.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Jul 2026 00:02:57 +0000
X-ClientProxiedBy: TYCP286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB14534:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4ee37b-e721-4e3a-e2cd-08dedbbb19f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|23010399003|22082099003|4143699003|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dPDOcIrc2Ffsf6C4E1gpVILnsIVSnndY2MtMtFltMdNEhQcW5KbRO+JUEs86g0JORx11CJwX65yRQqWudiRgvA1vUq/QPyAY9R1pquZTXH4aB3HmAIAwZwkXukub8AUy6lZSwD4gyATWmDkLyOchFDNFCFMixTDksZxaBzH1MTgPxjOX/MZJGAO5gbkDszc6mAuyZvI9ltn0AW1G3wPaE29wsBhY1TdL8Z4F00vLPceMXC1xcL6vns26cYO8NNnPfRfLX5gvTNHKEV9xoAEufJIGXOdkOHMFu0gW6AEo0V2Ltyl6k8ttRkeivbQqEksIdkMmSrQZsOJFReSYqSdPXN+QLDAXTEtCvZLpnCnYWGAhn7yzQnhgDFqlUYLcla2pWz1BTRVip/sRBAYlKe1k/4VeiSCFnuHYs6sgwaTSDFoeL6bt0y/6r+bPL/gE3XUlfUJPgGKiDe/EXTL6QHcTBifeQ/db3feWSNaMT49nAJ8mdKxKeBAabFxnNuG53aNp8wjfk4iKEPNN+rkwZXQxyabW/Au942LLGG10wjAb62tPEu7FFW4xNmWsi6Xv8HSxU8hLvr1Sz0SwFZ7YjSF/yhqHUK/nOY9AnTirX5lVKvnVfBH110JZQM1cDXuFDEzsfbmjeXjoHOmtfC8p3+CWLo1F0kePR0anG4Raz5ns0mglVf9/qtPbgr+IBIU4IhDuXWobEejkBNaRrm95UiFy/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(23010399003)(22082099003)(4143699003)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GitEt8IKjSGXrcqrG4qkcA0dWO8bxu2emajuMLtn1PPEO9gCTUFk5M7Hkook?=
 =?us-ascii?Q?OhYMBEmmHwRxbvZyZC+9fZP0uNFW9W2v1mhMUSTEhfQMvQN5CT969czevX3L?=
 =?us-ascii?Q?S0jkCbHIjc6UQj1hK6aw+XvfUXxXes9NIyz1p0+8YLuZ2kXXrLIRSKET6O7m?=
 =?us-ascii?Q?V9LqHqW1bEKROgtTl52gUB2IlFhMVwCsLPWCEvlASoRgB9dcfFVy9M+xvosN?=
 =?us-ascii?Q?1qZLQlcxMDBQV42h0pdX1pqpmFbUUmxCJNqAVMJMMONtGHkQzqh0XRWOKJfJ?=
 =?us-ascii?Q?s3GWBJLc0QAJQWBtYRcWVyBbpqLjs2WqSWh0belvu7+gdCTQ9I/cg35lCkgi?=
 =?us-ascii?Q?56R7qEnQw/lg+XXqeWhFPoz1u2s5RP0X7L905s6oRUyBPTXbNtVuMPJN4f8I?=
 =?us-ascii?Q?P4BBl+939xgaaaX+U/uB0rljjujvOsG6qj+it1jBgLcQ2xIu9JfCxpTHExv8?=
 =?us-ascii?Q?y4tJnu6oYuhOe2wAxYOivOvkQNI+6XuVsv2jW+ILAhyZuB1k5f6Y8qJ0yaEs?=
 =?us-ascii?Q?nO/ABiBBv+dx04hG03dd9u+OTg7kQUqH7aUt2dXYK/S4fL+plRJF02AkZdyx?=
 =?us-ascii?Q?/hZTtyLtKtKGKFsm0SwdMON2HzXpJTXQyPfZGpqW5EjgbycLiHDhNcUYZrTf?=
 =?us-ascii?Q?KGy8x6nftBJuPUVuDGAECo/+hulh6rU/qM3mCSm3/6p3/BP05teNf2fkhJ2g?=
 =?us-ascii?Q?Ms80lAWHDsVgFTAp95+cTP/yvn5dF6dvZ+ZhicwU3oqwAq6O2KyGiK5um4gK?=
 =?us-ascii?Q?zPy7gxnkDb75t6AZPV9von77gjQNnGVzzjcehvFthgZY/CiP/EdT+uFLXo2+?=
 =?us-ascii?Q?kNCexoRq0vnkRL79fjI37iSM7Q8uNNwj/U8iMCfm7MrNCn74H7ObC7rfCDHr?=
 =?us-ascii?Q?/OaTqsLODSCUC3eS8Or+IxQL9OibVV6XCZpynoLoyn2Zjgb3mpOfC5EXaiAe?=
 =?us-ascii?Q?TGdCyyHbNJ2pE/DS/IiafuknT37rdrnndz2QrPxsATmK0VtPxY3fAa1q+N4J?=
 =?us-ascii?Q?NTdb3nxwJ+IsGlJogZgMwGTRTORnTdgyA6hAxsMyMG5K9/oGrarQb2HB01ye?=
 =?us-ascii?Q?t9oLrQTTBE/KqxsZyecPTZ/SJQDe7Dbna86K0yEN801EdKLPraqd1SAlhIPU?=
 =?us-ascii?Q?Rs/Vbqp7NFYBlvszmPpTkyKn9pdNOMYhI3fHsfTIdCOJ/aLYL44kQckfPnb4?=
 =?us-ascii?Q?MhnSNfQArK2DRpxyZ8nrrCrmCq2pe3mweZwAQ6yGRhr5C9tVtZ4iD15yFDg7?=
 =?us-ascii?Q?qfzFe0nX59vTdZsbQ+fKr5XXnNNVfkohatSraQEPEDe4MW3Ix3styeUPLS2l?=
 =?us-ascii?Q?5QhyQ+Xr2b92EIYrRwx9PAmBcRWsiCp//7Y4blti19dhk/hC0AnuxFBzOJA7?=
 =?us-ascii?Q?Pn2InuDJ6GzqhAYE+zoTMl1x5Bm1c4Pzs5Y7JafIvCZmzqqxM6QeVD3OOhET?=
 =?us-ascii?Q?HMCnxTwcVUnDudQAHxhEn7Vau89No064nDWPzafV+cJebkkeSLEftPVEg4Z4?=
 =?us-ascii?Q?xN+PYN7vgoZfr3wCvM/z5sHxDpnPt3JG5bnYtSFzz+7dzjI9lMUYPQwimH2I?=
 =?us-ascii?Q?xLRhxWlgQaNusrR84bPe6YcaHPzKOHCPgddOyCV3wV8wH9zDTJVPP1hNxPCo?=
 =?us-ascii?Q?CrfOsM+vI56MD4e31hEHGwHIf/U2Z9gLX+7nNx9a2h8dKMOu54ZxSYkRBmiQ?=
 =?us-ascii?Q?wd2MTdfcfiznikdQExslHFNzsby9Ylyg6az4LVo+jzkmeVgM4yFZAQk7jX+6?=
 =?us-ascii?Q?ZQDtDl62sBJVwMLgSJjytFzZddJi7uQIGpTtZCkFp9lqB3niz1rT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4ee37b-e721-4e3a-e2cd-08dedbbb19f3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 00:02:57.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctotzrStwKdaunMh/1ivq04qwwS7E/oO11p1p0HaoOOIGmsICJ33R4Lz+u8BfuafbMh0k9u030Mtg2bO45VTYNn72tQ8nw06PIdwmc4nz9A1XDPO97WrPHJCtxt1DJkm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14534


Hi Cezary, Mark

> > The headers I've mentioned - dd and dma/dmaengine - have rather short 
> > and crisp prefixes.  Having to do 'snd_soc_' e.g.: 
> > snd_soc_component_xxx() (repeat for all other ASoC types) every time 
> > kills 100char limit quickly.

Since ALSA is using snd_ for prefix, using snd_soc_ is not so bad idea.
But indeed it can be longer naming.

This is one idea.
Current code can have duplicates, like this

	snd_soc_component_xxx(component, ...);
	     (A)^^^^^^^^^     ^^^^^^^^^(B)

	snd_soc_dai_xxx(dai, ...);
	     (A)^^^     ^^^(B)

	snd_soc_card_xxx(card, ...);
	     (A)^^^^     ^^^^(B)

Maybe we can remove (A) part ?
Even (A) was removed, we can still understand that it is for what via (B) ?

If the function name was duplicated, we can now use _Generic, like below

	snd_soc_xxx(component, ...);
	snd_soc_xxx(dai, ...);
	snd_soc_xxx(card, ...);

	#define snd_soc_xxx(x, ...) _Generic((x),			\
		struct snd_soc_component * :	_snd_soc_xxx_component, \
		struct snd_soc_dai * :		_snd_soc_xxx_dai, \
		struct snd_soc_card * :		_snd_soc_xxx_card)(x, __VA_ARGS__)

One concern is header will be confusable/complex, and/or Code Navigation /
Source Code Indexing (like gtags etc) might can't find definition location,
etc, etc.

It can reduce a few characters from function, but need to add complex code,
and need to update all drivers... I have an idea, but...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
