Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2048.outbound.protection.outlook.com [40.107.114.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC38161
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213627; cv=fail; b=WON+hbtMD5gOkdw7sbK5rUlEN5XulrAz+SPWyTM6iPJsBNB1QVUlpU0SMRtruQ5e9bWPQ+zOkVhI6ayNr+JVT7bjFLzzdQNAx7Dfr66ZpNJ5OZXoYSxRB2D+N2BFRi6nqbpYj1AGcfrf6GVzMsGgGhdLPpXMogZiQx0KfrBy1vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213627; c=relaxed/simple;
	bh=QMZaihZyNi1kUXxe+2RL9FiL6wZDmHjqJj4oBOEc3XU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OJWj1bpoDaLqu4d9JfLoYGi3J/ywpeVriaFHGy9twdt1+QHw/NjMqYunDxpA/QnFk/fpzOp1iz//j0eeWlevOxW10GzCis71cJYO69jQT6iR/NWtd/UctXVjKDkXzVG8Q04b61p6IA1tH3V6EO6kdkUMgEGFygeFNlZn9Ktv/Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L2240Dfe; arc=fail smtp.client-ip=40.107.114.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L2240Dfe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TajM8wnVaEs93xq5h5poQ4oMG+rH0FK1KaGE5cOSok0+c85IHduuLMEf/ldebtzRSvKF4c7vinElTGKIWhMxcMsw1wrjOF4CTn3W9uoU6LH0KE1U9Dp63Nb/cJo/WVGU2MGXNXOCA4ymLeWWYRwPs4ViPjjOE+ueQV0U4tKUuTIsDJTrteiVYNwevyYA051QVEefOKwTAVHX3z0JKFQrRVVD735N0dLwo/zI+xSz95Nae/rZDCq7Mp9sAsbwyQsM+tU0mgixUvDE0uT4BIHEJTwun5EQf25CCLcrOFReWzlkZZ9Nfw7iFhgGlqnXnNNsf+1vJwh79FYfRnWt5LTwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vReFR3emrz7n6AhV8vpanA35uXYhLhBpKAInGU3ss8c=;
 b=Wu7U4JMYiwte3caQhdcoukGdcz1ThJEN+lEU+U8vcQD6s/RXBD5BlkiYY4zGBaoDY6ck1QHy16GMzQVPlI11NtSuqm9pD1dCR5kiq9J8gNoaALOxlFmbWqbUwgQNH/7cgc4FFcGxUpMidlng15sZyk8upcto5wJK8muWNESRpQLjaV8p+oIqMDl/Mrvs3ihvAtyf6fQ9nTybPaQSa1pK/ewxL/bcS+b+ZCNK9d/IkvGLp/CXThsAME3B12I1nXDLfOfEDAy4D6qMarH5CITWKa6QBtneh9zaSr8lH4RxI/hne+7Itul9Tk7PRiWzFro14DMJn2x3gVef3jrZFnrGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vReFR3emrz7n6AhV8vpanA35uXYhLhBpKAInGU3ss8c=;
 b=L2240DfegmgVKuW4wQIYnGegObYAnxmAOdudmYgTGd4J0/vG7srm9bTD44FlBJ9x5FBw7g49u7rx/t0UybPhJzxN5B5a/pahHNjeQws1wz/1Mcgi1jpbIMW+MlKIrO2vlxCsGgL7FNc9M2OwdxztZ5mulYRtuALfhcxJeC4208Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS7PR01MB11501.jpnprd01.prod.outlook.com
 (2603:1096:604:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 00:13:42 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 00:13:41 +0000
Message-ID: <87le4jall6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [bug report] ASoC: audio-graph-card2: add Codec2Codec support
In-Reply-To: <f930862e-9d30-4ea3-b3e7-b4b4f411f6d1@moroto.mountain>
References: <f930862e-9d30-4ea3-b3e7-b4b4f411f6d1@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 May 2024 00:13:41 +0000
X-ClientProxiedBy: TY2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:404:a6::35) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS7PR01MB11501:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f188266-aab2-4043-e1f3-08dc6fbce212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|366007|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cPTI+fT35v9u7is7OOkBwGgQpq+G0dKZ6PvYXgsPf3NIytPolOs6NYT5Nwr6?=
 =?us-ascii?Q?qF3VMIaOZiDxy2U3ox6pLylgeedurkii/2k9Iab4O2ULL53fip4TDgIWpj9A?=
 =?us-ascii?Q?GS+n5kerqZjdid4WY2OP1UsWntUZ2a+KlHsES3DtCyHG5stVLS5WMs64P73r?=
 =?us-ascii?Q?pY9x4KY9F+LuvF/sda3fA9WsshFtMXK+0zISq++yzu9Ea9E3AZpij4tvBnp5?=
 =?us-ascii?Q?afCvpXubVDt7d8PLkauiLaGNETUT06Y9MU7MLpJFeUy49QyfQEuaBhU2rdqz?=
 =?us-ascii?Q?FdTklJAm0iQJnNoycbPW0YBJIjazxYydgnLsczsN3VAOjntEoVQqbgBaFlCd?=
 =?us-ascii?Q?8FrUihFJbC1Dk6Tj952RMOojwZ12ylRHxs9RP8iKh2c2yCYtST/ipuGWAScD?=
 =?us-ascii?Q?rcqQ79lM1RK3Fz7c++SUluyV25IVuTGbuOf9OOx1tB4JRwf+uc5Z6HMPxG6i?=
 =?us-ascii?Q?P7AqHptnxtNhjCUWLgJ3LL2NAEi4j/ykhBroCK/0c7PN0SqsIHntwZydYVDR?=
 =?us-ascii?Q?17fBn2V3wTqFalZgcF/q794BOZPKIOeiswamQP0rOSFpXOpCNGG69XxCmjP6?=
 =?us-ascii?Q?sNx0Xo8KHSqsqF8TWuhlrER7zTHAjEbxENKkNE90pV8GFBGHlIEDD1h/ZhQd?=
 =?us-ascii?Q?FPOhVLKx/ysAcMzkCstMja/mNU10u24UkE1sOYL8ycd/rCx2yrpPVTuFDi0Y?=
 =?us-ascii?Q?BwqmFIsHN9273Ps+dYbBirEbfU8Rh879Z2dXUtN2eqCj2VQhGuyTL1hcb4Ys?=
 =?us-ascii?Q?SbIP2wUscfFJZfqaAsaPStttiCSoBRvj81l5bDPy0LiEPSaOcReeNFivfEvz?=
 =?us-ascii?Q?Bmiq2zM6pI9w7LUl2SmF8lFXn8+FkA0Ne9A4F99sEiqZd1PFvS0aYLaKwluA?=
 =?us-ascii?Q?6bxPA6nRrFt5PrO5sXefryultUyGFhfR7H+l3OYHdlccvucev328BtlrNJZS?=
 =?us-ascii?Q?hWd/CIoezNy1lmRgYV3IrWwVtXiwUOJp3KfdJYuDJ9RIhqxy/6UliOFcprH2?=
 =?us-ascii?Q?2yIVSC+1XxdY8EpAQVr0gqLu+e1R9Fz2x4kOcfzJtj1ez/jcAR1aq3+YTqKF?=
 =?us-ascii?Q?+6K+go8Iw97AC4Evxi4RxSDHqTrFELTkH+A/b13bbi7OcVjjjD+MLHcMSKXe?=
 =?us-ascii?Q?YIrM9gzhPWeo3dvapUSmUSDUTfMrUQLXWVt0UPStGWdTrKEFKdkUWwWpB3zo?=
 =?us-ascii?Q?ZMWVroRED1XQhRL7Mh5hT78zfKpD7vySCvLXHcfhRiyqITEoEOpa5JMrHtnb?=
 =?us-ascii?Q?b+6V7Qxb+MtIFTSWOdxLmvqltJMEifBuqoZDSCmHuelIuod5LmpJunVNDw9N?=
 =?us-ascii?Q?V5sDCUAsMfN4gwgW+boBLDBpmex8HSJBVjJnWmCIvEvF1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vaowJa9zF9EvELLBhL1MvUj3Y/0wbYA6rC70qWLrQEBBAM2CXYDg7vOC0fiR?=
 =?us-ascii?Q?rbVMttgY8zEggRNV7+RK4Vo/tHLUywB8egpmcr5wlclYd7vB44E9DRPVHxOs?=
 =?us-ascii?Q?fyKrtocYqi7f/TK70I//pXALOKFw+amHIUvpfFvXnQtETH/5zRLpp98jfAWi?=
 =?us-ascii?Q?MR3T5cauF13IeVi73ZaNFt4CK+ukhxx4ALLYWw3rZMuZnzsIaSsl4eKgJaA5?=
 =?us-ascii?Q?K91yEWz00Fzb5urdk2D55au5e1Y/vXhAc/bvd8immgYG2o0dF2LfNNtaXPiQ?=
 =?us-ascii?Q?rBkdnLOdjJ9OQ2e1H2mlZ7xje04tW7ynzvX/QdOaoF8LkMa+UiBBqylSc2K6?=
 =?us-ascii?Q?qlHN4s+GFE6fVN098CuLbpeFq7lrRF+hzwlbgKrJOJfzwFzrUyywP4YslgKq?=
 =?us-ascii?Q?hg0GbBPPNH1weyFe6fWlbVMcOMMK+esYCJb3B2xucqB9sVraRYsg0wdQfYaZ?=
 =?us-ascii?Q?UwNWT3pm/d5txg5XQKAprvYyCFw/RxULKPKelZldKZf8mCu9b7XNjc8MhF9m?=
 =?us-ascii?Q?VfuoeTKqONx00ywXooCf//z7t8E4AwtWY9Ho8jb6xXT0XwprHJo4dUx1DT1D?=
 =?us-ascii?Q?PMb0Fs2bAOJUI8ZJzeVaCWgN079LOKlCplH15ek45x8pKXN5yYs5Rz+o7u1d?=
 =?us-ascii?Q?VnGYF2586fFyCGvwmZY0TmDS628hr8jDshh5abTZkSJgsMeh2RxMH2NnaXiP?=
 =?us-ascii?Q?rA26jFvyJmMwxCTejC3I8YUoIXSxwYN32irCtJvcmfPTwIVYVvhnbk4tmCit?=
 =?us-ascii?Q?8HLPStybLVDRJfULFguxYWOw99p/Ao2aB28hls4xYld0m8HT5zhgqL0eM7eX?=
 =?us-ascii?Q?bR4+uxFwuiQhdF9tipHvEImERod80DLQdNFlTH9s+g+fLscpzXD5yeLQm1yj?=
 =?us-ascii?Q?85sNUf1CCIo6cMwIhZXPwWWMDmkNLWIv20KEyQsLeBGRYuqnvgAFPo7k4SW6?=
 =?us-ascii?Q?SoF5sgNocs+ueh/Re/Ayooins6RzqZT8h17tfkpSpJ8LZ4gJK58BnMwU2ZOf?=
 =?us-ascii?Q?lzuPjmtTSli1wKMK02RYPHrmVniFy/+RGIsColCDhq75fgTmTp/TbeE1u4Pb?=
 =?us-ascii?Q?ZEFBeADkhydWK7tltq2fAi4c4n6hYMk2goJs2gh0aOqybW1Zo/Rkbo56Xq2Q?=
 =?us-ascii?Q?TOUBRCSGxBTh2YAkfWWuHCzBm03F5bA2HKIfh2m30S0fGeYoN5DKYtotDIKD?=
 =?us-ascii?Q?RwMF5LeNKsg3WLToCWi4r6oMa8zHW8YVDBOilHClQR9447DclqnIFQDJkSw3?=
 =?us-ascii?Q?UGdvo0gai1qTOGMUhL8ONIi6TIGJrjsJg1dvzm5bAkaUtI1/vMKTAEOXQeqo?=
 =?us-ascii?Q?q/u3hvw4T9YoS5cqMvU9V2joW6XUACxTWL0qtNH9bIiwEJJDym5FtNth29IQ?=
 =?us-ascii?Q?iL8sWipTF+hw9epTUJqPJcR3RRwS1/uG0aRiGMbXmG5W5KoVSZ/WQRQJq90X?=
 =?us-ascii?Q?YwsQ75nDUXHlOuCiwJqoxAk1POSBuVDkVYipigNj99dTuKrEx0v7Q6kij/Xr?=
 =?us-ascii?Q?JlvUP088o7IOo2DzDhtw0MNal2Sbihu1w0wX1L1tgFJwwGrqAtjzASkPXxSj?=
 =?us-ascii?Q?0sz5V45PCXHv0+tJKvx3T1O5K4pHvBfYYmbgVxmbdbgNm9p9eSCTN/9u9a8j?=
 =?us-ascii?Q?O4S353aQ57OObO5Kl2DruWo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f188266-aab2-4043-e1f3-08dc6fbce212
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:13:41.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nxqac3BBLuKrR402LIRYrmJaXehm4aNVSFpryK/BzgNTU55v+DOfyDZffK9VqABEd/Ijfsu/JkJ2EThsC2EQb0XiSXuyaaCB+0vW6hUxQWlwWRVnqt8I16dHsS/88NXN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11501


Hi Dan

> Hello Kuninori Morimoto,
> 
> Commit c3a15c92a67b ("ASoC: audio-graph-card2: add Codec2Codec
> support") from Oct 12, 2021 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	sound/soc/generic/audio-graph-card2.c:1206 graph_count_c2c()
> 	warn: already decremented on line 1206 'lnk->kobj.kref.refcount.refs.counter'
> 
> sound/soc/generic/audio-graph-card2.c
>     1194 static int graph_count_c2c(struct simple_util_priv *priv,
>     1195                            struct device_node *lnk,
>     1196                            struct link_info *li)
>     1197 {
>     1198         struct device_node *ports = of_get_parent(lnk);
>     1199         struct device_node *port0 = lnk;
>     1200         struct device_node *port1 = of_get_next_child(ports, lnk);
>                                                                       ^^^
> 
> This calls of_node_put() on lnk.
> 
>     1201         struct device_node *ep0 = port_to_endpoint(port0);
>     1202         struct device_node *ep1 = port_to_endpoint(port1);
>     1203         struct device_node *codec0 = of_graph_get_remote_port(ep0);
>     1204         struct device_node *codec1 = of_graph_get_remote_port(ep1);
>     1205 
> --> 1206         of_node_get(lnk);
> 
> So this of_node_get() undoes the put.  But if the reference count
> dropped to zero then this would be a use afer free.

Thank you for pointing it.

This "lnk" is used as "port0", and of_node_get(lnk) was for it,
but this function doesn't call of_node_put(port0).
So yes, indeed this of_node_get() is not needed.
Let's remove it. 
Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
