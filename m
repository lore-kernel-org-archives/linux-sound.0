Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A61AAE28;
	Mon,  9 Mar 2026 00:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773016852; cv=fail; b=AipReNVCGgZOrHN6R5Sjwyn7X/y2+z3vGLZwg4JHB51kDbNopLFdwSw/mk55vVLhQ2QSP5UMbvud2EpGzg1PIYRKJBDt5NnMAm9c24s4wr6VD59xMbjUqMNV0+xus/ToE95T9PQC3RBhtI3cB4LOCi2CcaKE4gZOMahLaj84Dlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773016852; c=relaxed/simple;
	bh=BGvBWraWmSkUiwiXQ3Go4A/U/WwW1X2xduIsB3hYM04=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NAVId/82mRxToPZlxYnMsuzqtuf8qX3LMVOT9V6O0hGmc0sEaXAnCA9BplIula9iT/vcihOekWlQMC5jJNOEc9Jb81bqvFaLcIZSvzZLtvj1bXTZi/TxuuyW29r6KNhLjn7T9DxAJ2V138rsfEFKQDT+bny9HRnKah9TKoRIGE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QwIpgXSv; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QwIpgXSv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRhyPfN+h8M07QpyHsy9TEyVht0BU4KkQjK0Xgy4tHSkecU+7aJOlWTn7fmFbpsT3KcqBSh8ZGRZIsdnAS8YPxa8LHxfDKXSaM0URdteA7LUe6ugL52nWmdP1WCzn11Qhd6nWqorhhc8mUq9lhazLCm9EnSX0zAM7xVDK2ROxWsRL0BO8/tCnAvuO8fniDe5j/n7n4in+Y9caQ730qlzyKIHZ7hdb8QSOIv0FRx2lJ15GQpnEThLFeZ7zsXYa4aYbdbXA5CmCMZ0jbocJKMJiOQwjExNJW4Ijhvo3liazZAgqKc55wyGpT5RgbOrRKQvZw8xo5ehYPREXFeA215n2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTynScpr82BcHKy3P8sYqSNO5MrdN0X0Ee0lzB1zvB0=;
 b=wnhRima1oWC1Wcheds4nBsgxpa9OR8wImSTWTHF/N/K+HRhuU+kLbUT3KyXX05AkvwbNjpqMpQxF5MpPljYmSMAApZ+sTfsujJyEYHF3lFZMfY49e5jz80TPMKohMAkxKMSnYctLCVyUPcenFg3Viag2eFMoSIMs2Ntf8IoWOPMyL8vaVCZpejotJycX/fDDU8r6a14qL2LKTWoZphsnX3U6kssXQVdLdVSk3quKhFCBEboTWlCp8sMxNLY41FommKUWMDpnWdi2qql8rSlzZ5aJ4cCi0ZHEU/DwD7P9V09KDq9fUZ7yq4HgBF4A8Ht1WrbSwAwNn9ff4cvyCxSk/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTynScpr82BcHKy3P8sYqSNO5MrdN0X0Ee0lzB1zvB0=;
 b=QwIpgXSv+ax2Ah78poMdIhI19KQ1GIg1EpWDib5LHl2Oi3iMgCB8kind9toMZQFWa2fxw1grKwCuybAfTZ/UnYKPEh63vMaFcDPebeNy8ihCJuBFei9g+JHPT931vB0wTstpEr6lgLLcClA52Su46qlGXow8Gl0FmktSgORSkPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OSZPR01MB8497.jpnprd01.prod.outlook.com (2603:1096:604:186::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 00:40:45 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 00:40:44 +0000
Message-ID: <87jyvl25tf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sen Wang <sen@ti.com>
Cc: <broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<devarsht@ti.com>,
	<v-singh1@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
In-Reply-To: <20260308044130.1991091-1-sen@ti.com>
References: <20260308044130.1991091-1-sen@ti.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Mar 2026 00:40:44 +0000
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OSZPR01MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c43c21a-ea7e-4b4c-5e60-08de7d747fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	whKHouhbGkLb46yXWsbYqz6MStxOr1vIvD0tpChY5Uv3s+NyOjZAhrooBOQegg3/1pOm2eXEvtL8l02/wk1B1jzc8/H07pxN9BhAT4fAPkFRDvuotjopFBUudg82ni/cOx6+uaEvh/9ewHSuBIDBkld18yE/Rt0UjH+iB99xNqIAci69CJT4I181rb8ZqlaFBcyNGZxewUoODX20X3kiGS79HlByS1QNhjPie3bD1pEPl1WqPgOaqqwTKru+GOwpDHQymj6jBsOB6rCWLocffq3j7CQIKnLIL7fKT5EPVCb/uQ4teIZLg/JMwheu6IvPTb+jF+MoKq7alf5znrA/NM/oH+8yRpS+of3GisGa6eZinTTwoIsxDfhgyZMLlSNm9LddFT1/XHhsj4Il5jvtK8VJsJHMDLOUfN7CfnWvR4hCFYz5ACsUxqwcEvXpIqimd/EkSREXT89L4BdwBumzLgPRLoU3QwQwxYt7SqBRkrojskLdJgEwMRnfzqz+esNwobV+Gr+zQhn55uyUpcVAQqPsSoCjk3dZIkisCcHjMlRiLNwcVHgLPxTDlJ+00Bpvhpx8hDUSaBgIygHGIP+x6PGfSBobfq4HOrqzkDezfKjrXv19zDKu16tYhgPoO8AlO7x1fpnpmRancsqvNe9casebczG4RKKq1xnowcYDLQQU4fo/pBRQmKTV7JtirVXz9G8VOZaTC8QLJ5bxobOUojLvyVGR4vtXVPkBzm9jXp/GI/qYgsau1wndUMY5TdDTKog+rkW/XxGqnZAFSqE2KrXXHgRALEY/S9Pgc0sjIUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sxce+NYXpTEYpzrKqlVPYintODA09jCdBcpUL3V50XoumAL4ahQFsIwEeU4J?=
 =?us-ascii?Q?toKUbFpB87jcz66FZlhTnU8Kw6BkPGJes1CJbSdIouMZTuiWHB0+3YVy5I76?=
 =?us-ascii?Q?o0VzWMZJHk42eLpWImWWhguNBqhKz0BJAXAd+0wmSTgMcKujCTMfb9klBvRZ?=
 =?us-ascii?Q?LqswwswnS3dVUUy9BOvhGwgUDYchA2n5CjIYXvNMCdiMO5Qdmay03FfsgtFr?=
 =?us-ascii?Q?BTvuyUFUXF9mBidhC3LdSgTCxv2buALnhGAAUUfsvHOxTTWLOcNRSlEMsP3C?=
 =?us-ascii?Q?9wwmy9riEsQIi6AMgbwftGF0bF7HJhJjFq9arTfWMs/ufMsqPOynd6hmSS2k?=
 =?us-ascii?Q?GPzXOkCTQW9Qn2LqG4mdZGaYn3qyYpGcA5TzhsCTp3437+kQxiXBxvO726EG?=
 =?us-ascii?Q?HB85otbsE6IV6QWqnFvGS50V+h4OVbZ0wK081cKkeutp8gXvPhyiQaXU6CoW?=
 =?us-ascii?Q?ZH+NvSHn29vtJflgpCFCcOS/PeOh93wkAz7+LlzNwdWM7RuiCwhDxnmk5Ut0?=
 =?us-ascii?Q?6GRvZyY6xPtG1OLttzxOU0gWhOKwQ+gst89sC3m1tw2/yXg70ZDn9aHeBZaZ?=
 =?us-ascii?Q?MNoCTg6pFrrafC3pyy5++frJfQjWCZgnBeJvdVuxut5qGn/4eQjXWAoiS/KK?=
 =?us-ascii?Q?MAs2iRM3W6fF3YwaraqdfGZkinFQA6VXuiemQzgFfq19ZNk2xKVZJafki8CE?=
 =?us-ascii?Q?y0vwALTJbdJ3mJ2Dbkfl5vFyunjbrEtuecx3Nqwc1GKkbZeVBCRY8M2WmTKj?=
 =?us-ascii?Q?A5oGJv02vKTEyvyzqT97qSWBYPggaaHFIn/noqAZv3SwheV2Re/Ksiu8tnL4?=
 =?us-ascii?Q?Q2+7kj5V3NDF2LP2hq3GbLORS7im/i1qK5v62ipoSi/G02ZgMSdJD2gwZATr?=
 =?us-ascii?Q?kx/3Pu6egiqcObCK+2//sUyJkqeZdqNdoPfODWR8giaYYWkpMJP7xO4VTsmY?=
 =?us-ascii?Q?YVDhPC4PBKEA5p0Y5eNSiAtjmxhL8RrEQKb68Dapy8ALYUboHo8vXvDvVG10?=
 =?us-ascii?Q?RTpe9jSzyEVYKXg0jNfLNZsj2X0d47iLBlv9E0tHTdKoN2iBAJmF2x6lhVT9?=
 =?us-ascii?Q?LPzhQZm692X4qELiXR+6WiQwhuV7bbzlal9Mana2a0hQhmb+envhFDpYx4v4?=
 =?us-ascii?Q?SvI+wxXAkvL1RZ6CaqmOF3myDQl9GpfMOlTBbETPFsV6eTPWlcCbvCSiWp4R?=
 =?us-ascii?Q?PaS/lIogW0nfU9VNnNO9tZYWiYzjb8DS3e9Uvv9aH5PTarCSI/dcG9HzeNCa?=
 =?us-ascii?Q?v/bOAzVTb6RytC2qsIR/P3XQKwHDE0XBreivsqGDbtRaBaAIviuDa89jj8Mi?=
 =?us-ascii?Q?NEXQaomvKh8F6CVH2FeiHIsJDUa1n9zsDzdwcRQr3tQx+s2IeF1Iy+63cWSx?=
 =?us-ascii?Q?EvfvYD+GSOR0EgKke5I5b+/GDjMyGJqvtJiZmIrR0xlLgxUbvISRRUUNBrjp?=
 =?us-ascii?Q?VOsCXD/jlQE+PQWW1q0i5Tn0Avba2Sw77HH0hB0pkWlHJsD3lNd6ujSeKv38?=
 =?us-ascii?Q?5087pU+zUc1qJ1XEidojzpQWzhx/1O/yq9t9LrRHm8XpyI1tT03LOUNkCAq3?=
 =?us-ascii?Q?DFNqPfPGj3jSpWySFZpos8964bIRsji+3So2sMmR+E/68GtlYIl10cKosbPR?=
 =?us-ascii?Q?Z3HGqydZaoG6TN6M1359FAF05rMk7Y2TyPSrSyfAmIs0HMD8+8tmJaaBgO9f?=
 =?us-ascii?Q?dokKDbUYxydk9ISrV6xbbPXDfjzEGKmjBAu5g6fELr830f+PjRHuKb43/z87?=
 =?us-ascii?Q?fCQjnbzrHwbX0fuwqotYWZmzpsQ2kRM/LK/oClmWvllhD2BQ/9hA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c43c21a-ea7e-4b4c-5e60-08de7d747fc2
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 00:40:44.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+9kWcJ9BHx8IcrPdrUESASwGitwM6dtNwqHjW2ZJijlM+LwcnkxsNkBgoPvNPLfQviCpzohqQCUwSwyNP0L7P01zGy9OhqcOqQ/g6RyYxbiot9dj/6xr3u1aKXzP5LH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8497


Hi Sen

> But when the DPCM topology comes from a DT overlay, __of_attach_node()
> inserts new children at the head of the sibling list, reversing the
> order. of_get_child_by_name() then returns ports@N instead of ports@0,
> causing all front-end links to be classified as back-ends in
> audio-graph-card2. The card subsequently breaks and registers with no
> PCM devices.
(snip)
> +       /* match "ports" or "ports@0" by unit address in node name */

Could you please indicate this method is needed for DT overlay ?
It is the main reason.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
