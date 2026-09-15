Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97442E40D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 04:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446625; cv=fail; b=Z7JTc0hoVv6mki9lZprAArAB5UWOZ9XrDIC0kOqpmYm1cGZyHtLAPPkNq3lS5J0LqMNlaOsYbaNwkCJjV8ZWLqmB//aNnjzNVSOptUdX9BWEdFBoC/821Db8BLVlUeQFvlx4ExrPD+vj29YEIaZ16/6+BR+VcA0cyqG7ev2L3tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446625; c=relaxed/simple;
	bh=bw6qf2rCn1NpTWPx+gQ8nWc1slQSovOd9zFVApgATrE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d1fGPKwvSiagSxAB46ZkxqdV2JNaRpDiKL5fE6a/4+LBssXoByhJ2iMj6bQfUiKBYopyuZNNJa91n4zogYUJSoyfgXzuS+Qozq9JkVFJtm3EIeab5mbyA0nofT2lzB+iNOkIjiFn0F7HchZzupwTr79MNJlvSdoz8e8otlnHlFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qx80+REn; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qx80+REn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xtye5Eo4lsxF2jpPcGPpJLHTM6wBUfYzIx710VrgOzHIg7T38r44RaxkU/SgCvNODUlEbPUJxJZqxoAPL5uauJAjPPk0FxBP56iQBfrQJKzfYM0tXTY+wk9cp3L5JgqDySU4BuWSOit5A6rSGXPuZouXYLWLFihvwy1v9pvM58Kj3rmGMR8hCn1h4fD+Pstx/7dTbxysL1epb07JHnNHW1DlLGfeAT6bsVVszFMoRHBNbsYfyAUQpMuhwHKk1a/YZb7olx8nPMD5rJ+LOmbOFwQxt3jm7SJlxSgIIkcZNgO9L0CQH36e6v+0/GYVCQv1DxWRr40Mfas9ZjogLvF3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXxCu60EOP8JskB6syL8TG2kN/5PUXlpBGsOjh46TSM=;
 b=pAMy0OtHz4vJyloYtm1z+36G5OEG+RRwmeWWvk0Dbq+OSNo3i/imw/sMvFzgdVfmX0HYvZ5PQEbM2JNfQOsfS/29RVqwzrj5l8sstyFuctXsgeLpIUz1tPVM4aLYm6lssCDTT7bj+gGNMDeK7cQ/v8K8c5D6FMlZ/45UdmftRUrhVAM98OwzzkftUpL7YX/Wx/IUdiirJvQuS8PGbGlXqNWgEpdeKWpxDgTp5+ATXawRxBsJBmW0dfPfiUp4egbDBTgJ8UVe08fUeAwiWu5qy686KGeUbawFYmxeolTzCAFiCztY+snoFC7YIYBrqqdA4KRuB3beEuDz3v1oJc7j0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXxCu60EOP8JskB6syL8TG2kN/5PUXlpBGsOjh46TSM=;
 b=Qx80+REnoDaedUW9eRz6uCrQBMr0sZb1UmkwmXwLUdHwetWbbiuvE4zXBrrJn7QeDrATzYJqR17lSABykgmvjzVD3CXxjeAU1wkpkSpcVkuv4JCMF8PVnAi5/4Ndq9IU+Yqn2p78qVQYL1AvdeLXdPre5wgdzgJRMQOQyV6J+qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 (2603:1096:400:3cf::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 04:30:11 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 04:30:11 +0000
Message-ID: <875x07rvak.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/10] ASoC: soc-dai: add snd_soc_dai_symmetric_get_params()
In-Reply-To: <aqiahbyrYADuK4_Z@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87jyooli6u.wl-kuninori.morimoto.gx@renesas.com>
	<aqiahbyrYADuK4_Z@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 04:30:11 +0000
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY3PR01MB12089:EE_
X-MS-Office365-Filtering-Correlation-Id: 686a4bd9-00d1-41ab-6f52-08df12e207ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|11063799006|56012099006|4143699003|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IM1Q+sllr4zUIQE/rdfDQ1DX6m9qK0/1T5MxADAOY2n/5JsrgVnSneZ3nO4xpjCwEejRxJlkiUyYim0XQ/fAwtUPRwYGBDy2e7wE41GyMYYFz8iWSiqM/ob2cyexfBAiEBtUWTKlbidXdxNCiZeb3s4n8iA9C/wPjCGYH+mu7HOgYQbVfbvxBOs/7YSQdCD2CCN5X4SdrQtfi8MFhUryni7J4TOa5tYaXT3Qga61rwV/C/10S9rQ6l6bskeyMge39QFIiKO/ThYxoB2HHu/LzBnrjYgoq4CEbg11vib2qHglm/3XvmBVPGEIhV+Av/hLB3FVYHKaBfErCLsCsATXF34TeWQvP2+T1IH2LRr80A44zuia7ZqwjV0wpwD460zUelqEz0ihk6yHc4KCIJyPfe4AkOhqpnVwggYO1y/ZsIuaJnXLIpnezfV+19V9/yxgNBsB7vdc0TQUgC4P+S6FIzhh5lx42pMuNm9T1828o8TgxXTJ/F6XdxN0b3ckIsId+y0kBChIMr2oIzZs3zncVZu2Roe0W491eJQeizOoTm1s2BxCp4nFVIa7lDl0in4rLttDShl/Uuz/pwsbs5tY6lbtE1qcBz5BHuz8PrG7KhDWt1aXqDjLlnA6a7+OeMfPjAn4hNMiC0pVydY74wvnLI2o9SYuHNyQyn13CybjER0hYzi023jg4bjPvIooHyWu8yURJf/0z41LKx70X7EupnUQQtVRPAgBqJfZZI5YDgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I9Cmq8NpOVU0ALDHuOwmeJp0lb93/n5vwAxkfIVyytljcFZSX1f+cMD00oLe?=
 =?us-ascii?Q?0vBZf5BMW+sLejDUwlvss1V8ulwSIUMc6kCSDqibSlHMaK34zdOwauP81J4O?=
 =?us-ascii?Q?yJJRL2JpF4XJrX+3Lj8UxjO45d9XMxxIYhjN/hpQxYD5L8LYM4B9zaBD3tv+?=
 =?us-ascii?Q?hgVhji56MDNy+WL7O2iLF1ycpriRoQXXZ/hO1f5vUxl6aHHzmlMgT714dpT3?=
 =?us-ascii?Q?AI0+UVQUFjygP5A5NHz+7X/Aolx6qPq5NdQ2CK/dL9D9Pl2qZb7FYyLMz8T/?=
 =?us-ascii?Q?+23MirqRZ/98TtOLKIRpFTY/3V7uYHsoCpbBqSuD56GznxHf5fW1fcyvQZgH?=
 =?us-ascii?Q?vyK9coniJBg4raK1r8Lhbl15/BkXYIC39GRyBgukX3+RX0YT1UTYpyocHDNt?=
 =?us-ascii?Q?EYx24B5gFXn3tdM7H6xfOw9SsBK+rFRdi9j8KnqUmui1e1OWDERhkhzZTQ/6?=
 =?us-ascii?Q?qtXFGfpJHwKirUdz1M7VRtAZk4cnP7HveUf2OrLNVTYMwMQkEs8zc1qC/BgI?=
 =?us-ascii?Q?nekN8ivnE5oq5KhnbgCVM8s4y3bjce95TE3bto696sS8KrGGFBz/3JqmXVif?=
 =?us-ascii?Q?8T+PXYuwJd4x4Ogzg70EZffYGQfKmuY4gqgdbvYriqjvs+4AYjOrlYuJC4Vh?=
 =?us-ascii?Q?ZJF4Nllsmsy7B04arevZD++vj5Iouj1T/XMJs+rdaSh+tbQBTH7mYPpITM0O?=
 =?us-ascii?Q?48B7dXN28kh5XoZerF5QqpzKBEjSsffGJrisaS2aMRKHAkqCAY2yykbt80v8?=
 =?us-ascii?Q?lQ8Q3L7qhLxljfp2OxO2wrshUHXm+Xkg0Z8FFeYwjt5ggDfFzTzXIdny0qP5?=
 =?us-ascii?Q?S0nYsBZ70TZhcFL5AQ0tfBVA4dWqkM/GsGJdd4dC/LR2bynzWmge+tRMUzBA?=
 =?us-ascii?Q?fmxez5e8mGPDvU7sc2RJV33RAU2AUZ0AiwlRvSQH/pspY7NInEkRNQg5GwYh?=
 =?us-ascii?Q?rBX+Y4Q7RKpb87kfADm0E5EYuvp4NivzRyxKQFib0jFuODZZo1o+P9ayHFR+?=
 =?us-ascii?Q?46m8f2xmMWZtAJBtT6HLBZ5YQTBqRHNRC2tZ0BY7koSEGKMq3fj3GaeDjZ24?=
 =?us-ascii?Q?QczH4Os0+vivc5TS99p1aLXTBXxtqFy6CEtbdtlI3FN5aVivQJIjrSE/pwFk?=
 =?us-ascii?Q?SSYvT0otpjsLLtYg4yUlWQzgzLCHf4O3SM9zIZmIi+jLfU1frkzbUuEoi2OR?=
 =?us-ascii?Q?hyXtrSd6/irEDwoLgAzYxNp5NPsRqaDKKTNn3SCtuQVf7WtvNRof1OH7aT7o?=
 =?us-ascii?Q?B9PAykNzwWc+EviCzvmWhTkuWF1rK7atvtonlR53m/4Z1f8W1c3C1McJpnoE?=
 =?us-ascii?Q?LuXpj3tlH5dRnkUvKR8Ges2EobuQbp6qFSE2hsGUZoM1X/DDIjuoSt6U/RJk?=
 =?us-ascii?Q?Eu0Rr6CGLn0qTRcwHcHcIzKLMGdtSAjlFa/YkwoZURE0C+kfnPLuWzFCIISK?=
 =?us-ascii?Q?Cb6DETReKnipHdViHf87IOxjl+v/2+ZLT5ipLykKSp+l/SaiUFw81RGOg3Up?=
 =?us-ascii?Q?xcmtoNL6SBvLcOOMRWoNkjlIat6mZFmXRSOji16Rz/o9CbTfPchG9bYwioqY?=
 =?us-ascii?Q?75m/lCbxWqGq6FWWLudUGhxnISAw21QDAHQdrkWMC9V6OhynasqFyj2yVIwE?=
 =?us-ascii?Q?f0bTdwExpjGD3qmDzABZUhqTBONNAO/hiajiahkCdB0shueOotazGTzKUvVf?=
 =?us-ascii?Q?zXbJvorKQfRtbNXnroeybxwpKBfF0IXtuR1aB83egoYR8zRaGdjF+e79JayV?=
 =?us-ascii?Q?cp5RS1JfxOxXl2MvOtqOhyShV3AdUE9/ztRIApAtUFJlFnh+evky?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686a4bd9-00d1-41ab-6f52-08df12e207ed
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 04:30:11.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsI1aXgiHXweo1VPd8mpUYewZopNQ84GlfJsi/y2LpUzz9ekcnMfCCsZAOAsSP3bi0Ji3S11GSB7kU/1UjgHlr618hhy0AAOFlQLSkDRB8E+w5s0VyQvDCEkG8yULJXu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12089


Hi Alvin

Thank you for the review

> > +void snd_soc_dai_symmetric_get_params(struct snd_soc_dai *dai,
> > +				      unsigned int *symmetric_rate,
> > +				      unsigned int *symmetric_channels,
> > +				      unsigned int *symmetric_sample_bits);
> 
> Why not split into 3 functions:
> 
> snd_soc_dai_get_symmetric_rate()
> snd_soc_dai_get_symmetric_channels()
> snd_soc_dai_get_symmetric_sample_bits()

Not a big deal. Because user was very few.
Adding 3 functions is very OK, but 1 or 2 user only use each of them.
But indeed the code can be difficult to read, let's add 3 functions.
But I will wait +1 week for other review

Thank you for your help !!

Best regards
---
Kuninori Morimoto
