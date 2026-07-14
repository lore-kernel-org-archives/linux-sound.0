Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9F73749EC
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994283; cv=fail; b=O2BmDDdCGuiWfkTxfsrqICr2hbuhakgVc4mZQeLbJfmhJ4BEyvo6LqpbubtQGfqNLlHc6S9ud+q1HSpNP56yIcJu+uEVn2tiR5Fmf6IgtTyWL4VwWvTcqTD4Itwc4ArTwDKZi9Z2yGgrHGIGV3LqwlSDzFU4g1yJbhJI7/xrMYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994283; c=relaxed/simple;
	bh=RqjfI693BexkSaUEIf3bbbsSHevF3OPsQ44O9YFffkY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZAgEkXer+IkpWgK6+EQU0zTNt4dEqzVcFzKSvwrigtYwizLvuw0pqTeMjR4IwKfDOw0ImyfPEWmg8g8DDLuEsO1r3XeIsBMEYgib8T8A4LkjEcXGczAx+Qfqf2tlLdLk/EbUJJvVYDyRhPLBU/qNTsj81R78GFwE6XuXTTBudXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=flso6ga7; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="flso6ga7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwrPbYAAR7BVN30ipDGIuCoRbYB4vsFUnHXp5phYjoNAyNXGhSup1GPbbpGugjHWa5ZIRKcBtsc1ovwQDcDJtDOSgqNN5mGMymYW3Id+GC9iOrE+XwFGQcLAAXV7UFB4Lbesxu+Idu1aSldOFIcMn7D/e3WyhVitBU3E8Fj7/FuMPjhD4RfBkwwe6eZx90wly64jzsexpWtOa77Rdxbs25QUbd4xzal68NMxRqtAGS5EuOmINliSPR7vc90zEyd8RTT/wWPhG7djADiwon6zomThlgvHSkLtPp20/z6LE1/pEPdzqeRdvCavUn4I2XhWaNYqRL6/gi652x9iR2FhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAkRNg9HjV5twQQRjBNQFnAYU6Yky9O8BjVNXVb0RIs=;
 b=E671IAbHr6D736sDgig4E2NIgrXwDv8nIDYbpNR8CoBR9/7yiu8IIOf3CFeAhzvCzbK+gwJa3YLfZoiz2wbbty1zOS9Wik05yHGS+HPjcafLKlW7O4uAZyWgoU40bn2xUoyJBihMCPuViNsD2PJXaEaOpr9z8pJTnRD5LHpVB9LKWadg8erHOfM+F0S6j0SdLDXL18fzY8cdl+B5GeOj2doUWINBkaRTOmhegqj+7HexExe8++Xl6VkfdmW2yP9ksh51V0RA4K3/PR28WCs4PKF4oJRXCAaFI4sOPNgABlsPsvzTZma/VEhX6iKiAPO8iOezBIocjJRmGtaOAx068Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAkRNg9HjV5twQQRjBNQFnAYU6Yky9O8BjVNXVb0RIs=;
 b=flso6ga70Kkpbmtdsg6T2BJzyXYycvUMrpbFuNXx2SCQFQYMRXzGELiuvmus0jL51eSWAygBWsU1nSg6JwUAw+6zYWiZVAKOEKVM8rqCyvei8VCtSWyh5ELzUd0WV6KO4wt4Vc9wWwN0yVcIOXgj0uGFN+mPTXNZ2h+tmYxJ3ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB8670.jpnprd01.prod.outlook.com (2603:1096:604:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 01:57:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 01:57:56 +0000
Message-ID: <87wluynxi4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood <lgirdwood@gmail.com>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Takashi
 Iwai <tiwai@suse.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
In-Reply-To: <871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
	<87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
	<9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>
	<871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Jul 2026 01:57:55 +0000
X-ClientProxiedBy: TY6P301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: b24933ea-77e3-4505-a3b2-08dee14b52a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|1800799024|376014|4143699003|56012099006|11063799006|38350700014|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	yY5R/k3oIuiO3pIec+21AmAWFUQAuQ9K0STbmYXko7x/zAt/ZlHA2COqYKTvHM0pFTCSR1ewZzRcRPHwZDv3U2X/I9cfra0RLcvd+GVhGsT+TZId54p0u312MBma9XLrDhXlA3YZT7vDhbM+eaRHsIblcVif5ScMjsTIBi5Zn9wURhtHk2lWKJW70k+O1vK3ra3YqdQzL4cs7DI4ECmzcgTdKbneHW/QngGG6LLisHphFB/vVy5WF0vBnjci9ZEIxZB0AGCB4kYi9yQDZXfkTMAsTIBwqtGPqFuQy4TCpGzNEA78i7GruqcNLsHa/K5l0Y+NO7Un46tGjkJjEwaf8SsNSAN9bFZjW2vSG4TqJnv6593TrC0R/jqnv8w/WRRUXBZgNFIIFbX31jfEz5rIXWd679lS9qtGZ2waqY0KKbHk1vMR+aHIJ3hwEbshwZnm/We55193ohR+pTMG+/AtJUsIE7SMC7FgjUAeuCUVlGY1bxYi7nMd9AeFh13SxgMuuHGIJAo9pJfY5yNUCF/av32X7OgHNNVV7e7Ca9Cw8KXvfMOlZWMRQdJPb76wFyYy33eKD2gBgshpXxNqa64XKLxW/M/TJEtsdsJaTNC8Q2MZZT6i1uT0QEy4T1P1oT+uzX/NB8tIVg0Y1e+sroYTTq+8/qfPf0c1RNoYpTlIy/+o1PeRF9IaXdbPDyP73NA/yIr30c7OI21EqE/kWiLtBBRmlsL1+7NvahTumg9p8TQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eNrQ01WuQrnKA4OPzSKDPW0EQYUHRlb30OqDbOQUz5w4vtYDe+WnAdEWrcgw?=
 =?us-ascii?Q?G7CVuuCIcIYzU4HdRiEC6q4imHG2Zi5cQ43EV6qQypC13oK1GK7M1Iv+3XuN?=
 =?us-ascii?Q?TG/Lu4TAOF6o+1BS6f81ulDdVB41mOqDUYjhsSD+V9osx4o34+gbDINeSvgE?=
 =?us-ascii?Q?/3Prv2HVn/7J3CzWgpO5kS/ZwK/w1JdyHY2ye34MuB5SRcgJbUW+hhN4ihPL?=
 =?us-ascii?Q?JyZsIToEy10yX9SDUHS89TMgObJ0nk3+fL6JRxl8ajqMth4X7WtBWtTJmqRS?=
 =?us-ascii?Q?xjzb45N+ToKadLqZrtBC+/ckuz9GWZBC1WRugT5EOnkqK0bD2HG8XsZPhlJ3?=
 =?us-ascii?Q?xtBvCBMCMx3c7j+SKIgo9f+82d4OVQi/bqNpsD3sQgK2HvmWMtlI2ZnjXLw1?=
 =?us-ascii?Q?rWFA1ssO2Qo0CIG/eSDA4NEArzv6DCPz2lWbmVzq7Fzt0IAbHJvdQM+mI74W?=
 =?us-ascii?Q?ZahOONZ+OfJ927jy0PVtrw+1FTsjbDrpIT3zKhTzuVbJZZYSIeMedmBkVpAl?=
 =?us-ascii?Q?6fR+3xwTzInPZnHO6O6lpmYUnPemiD650hovxzq1aq/PAKTdd7WUA9CXaU17?=
 =?us-ascii?Q?OOjb/XaqMhE0Cd5jrhURHcYylW6u13540NXAb6HF1bmwe8UuBUq27S7HnCZP?=
 =?us-ascii?Q?SUq+RkQSFqzvhrmApOT3F2jA+gclyRZpsxw/cBdDui2Xhr+OG/vFaKt9r6qn?=
 =?us-ascii?Q?19tVR6zO3CWrVmcKv7WdR7jVHX8LCadoETMOMUEgsDhrDck6hec29rQwV0a0?=
 =?us-ascii?Q?miAWWGFPExkKthZVS5oZAcqTGcX7gF9IwEdSZ2FW3fns3eycVmsAf/kXtlSP?=
 =?us-ascii?Q?rQGSe6NWg20BrbKhZO0BOWizeX3v+tczOfbcDJxkcSkbs4zUYHtvmun3dyqP?=
 =?us-ascii?Q?5KPyEmIDPWnrkFEjFb6fD3AZWTIS33fyhqaqhJ39FGrqyR8h+0ZfcYavh57Z?=
 =?us-ascii?Q?DgildiFgLgzg2XLT6QokY1POcFJ8//Qbriw/6eovZB51nZmXUpLL3XBRa3W6?=
 =?us-ascii?Q?3jhd/WIscz+FhdIMID5IlQMh/6UqS8h9/Kv5iZBUS19NHJtqMrszWFa4bN9b?=
 =?us-ascii?Q?kUeDGc3ZBZ+G/zhxHLeAByBAOCkdvBL0Ow5lvyop/F4+X9UrujoulnGxq73V?=
 =?us-ascii?Q?0DaBT7+qkXwBWgPnTo6daAhKSNxfmfKOUnPYC9nBZpPJdB2BoaFN/AcoKLlM?=
 =?us-ascii?Q?XhBEs/qcyIjlQkwMK/yeASMHEynuxGeKpFqG82fUpQUZ25KdNBmiWt7uEiQV?=
 =?us-ascii?Q?HivyBbjRLd1QRju6hlmVYpR0dDBvnntlo3HRzuwv/cyPstUqHc7G9ZxDqYUH?=
 =?us-ascii?Q?J+e40sdJIWAQGx7M25BV+ZisZX1nRCYwXfBCVp29ShVr5/dy7T7ashSUcLzl?=
 =?us-ascii?Q?gtVpAIpn5+rIBXcr3PMJ5xorE0YXk5/x3yMnUb4ZHfhBipuz9y3ExFU6U5m+?=
 =?us-ascii?Q?OgDY6SdbVTNzuGrYlaWyUdWmmn5OvGuy1fEPyg3aGtZ9Ok0ycNL9WUdG1EAK?=
 =?us-ascii?Q?z6n5Fb3WObMZXO2UVjmKe/hT7oIM8/+wN9QaJ9GuayDtiSmJ8cvc5Lf9buwt?=
 =?us-ascii?Q?V9PoGP9RqEGFtKDqzZWkDArEdD3minkLzWpudjNfcKlHkDDJ132Imk1rKwKZ?=
 =?us-ascii?Q?I2ZToI2decJZzZvf5Iv+n1r/qRYPJ3dEaKtxirUmMjtTajx4kPNFeHwkvYML?=
 =?us-ascii?Q?8zYZwxdCsuqkL9QPEQHK+pXRc2QfMhXDbmxrbmBwqoE5dZfXC6DYL9Y2qanQ?=
 =?us-ascii?Q?flthO9DHuIMAaMZ5b9GPgAdpHAwwHRo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24933ea-77e3-4505-a3b2-08dee14b52a5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 01:57:56.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHTQJCue7XOkd8DlcoNdQrWbuk2fvX59HtMmKOm6fQOlSV4hTZdhdmK6PglYcT/uNkXm6gA9BPCASfEXs3qTB7Z0cKnCelG1FfNmbB8VpHN6biaTGQ98qnOAxA3uPBHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8670


Hi Mark, again

> > > +static const u64 mca_fe_selectable_formats =
> > > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> > > +
> > >  static const struct snd_soc_dai_ops mca_fe_ops = {
> > >  	.startup = mca_fe_startup,
> > >  	.set_fmt = mca_fe_set_fmt,
> > > @@ -706,6 +714,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
> > >  	.set_tdm_slot = mca_fe_set_tdm_slot,
> > >  	.hw_params = mca_fe_hw_params,
> > >  	.trigger = mca_fe_trigger,
> > > +	.auto_selectable_formats = &mca_fe_selectable_formats,
> > > +	.num_auto_selectable_formats = 1,
> > 
> > Not all combinations are valid here, should we have separate formats for
> > _I2S and _LEFT_J cases with the appropriate clock polarity settings so
> > we don't autoselect something that doesn't work?
> 
> Do you mean some kind of limitation exist on this driver ?
> I couldn't find it.
> 
> But if there is some kind of limitation that it is impossible and/or
> difficult to select format automatically, I think
> .auto_selectable_formats is not mandatory. They can use dai_link->dai_fmt
> same as today.

Or, do you mean we need to have more logic to select format more correctly ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
