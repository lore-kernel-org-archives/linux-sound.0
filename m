Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6770313635F
	for <linux-sound@vger.kernel.org>; Sun,  1 Sep 2024 23:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725234259; cv=fail; b=Y3zouiefnY0eohUsqSQKEHUaH6lqN8U5S4qkadpqcDl8okzvYdJjUOMtbSUM1VcWoIwwnGa/H9+k/DZsdbHKCzXohv46RbkkY+Dc/zIPcZZbw2NjZQ2JgyQFJ9YkkeGfd96nuE8hEwUl/UpKGL5TVSNu69UE9nXFqy3b1pxreXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725234259; c=relaxed/simple;
	bh=TDIA9e9en0QVdriO1BzAHMkNtRF/96ce+LL9sT66u30=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D0FpUL9JJTSbEoPhSvppuHnhlxNSFVLDQYxLgcDYGeq6ORP7xSOa4O0RtpAPCAgbfPWXAdZfnAP9Zhy95Fp1AW5Mpnf1+wN4dLh8hzACytM58NOUcBeB0aw/KtHf/97Ed1+NNYqPeZgM3F7uo/WqefNxtmmexo8zj0QxiuXqlXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZnfzQi/4; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZnfzQi/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcNHNDhFujxInmOlXSSdAZDHt7s7BgWcHiZ1axk1GPQpzGxtfw/QYDQMuVj9nIfuFArnPj1VlwfLvuCENrYeZTMFxFvp0/7IUEeTQ6GJKfW2HZA8u7msDaBsau2WrHPQvlwJI+01mvsfSPZvcAYK1tsMRPTGI59w7DwWvrD1NXV668vWL7GssWbHKjNfkEgzfrN9lZxevhTUpU4iOOiFyz73gMJRIxhh019ZRN2xVxZa3FvVG85EC+bTsszyDu58QaU9/PVvX2AsxH8Vsb1EASRWAMVOTiVpcT6vSTUEh5ohNjw521B636U/lnsHm9ynDtDP8koFQ5GlNwOJoOY1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GE7iujdf047qdb0wV43Hri+pm5OrVfr5w+lcm0578gg=;
 b=yj3gblxw9seWuO5kGod/LggNPv+xn/NPXmN3lmKcogmHbKR/0mD60+jCmXpTwPCdvDEGE0UPFEcWshBe55EAXqJInXOkPiNWYXKkiUBvaYyf+LK7JKzM4M9Ye+Fqm3xUbxnR2cmalNwREyuXqLFxXqrZGsAft/lCA9NHJV2r3YE8bbUcD1XPVnV/Dnci13880hr5NqCd+2FGifGPc/8tkdvQi/VlwnX/BL0MTk7+zG2KAK7wf2CZpnT6AXNvmJFjznOLN6KYsLe23zoomdU/cb0sJ1+sTfYNhtVJiQh4Kis0uY/quDgiZ9d1dk9B2deWD5uHnC/y2e5+Wt8gMTieZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE7iujdf047qdb0wV43Hri+pm5OrVfr5w+lcm0578gg=;
 b=ZnfzQi/4ci8CRs7p1bs0xra2n3/qTpK+sVjSfZsIIpMiN5R1Y8kYpu8l0TN/xkEUzgE3x5L9QS0QXJiWuIOtiIYdjP/I1eLlRXia9RQ/hgujFQEqHQKQuHbaBjRSvPIVBYwxtai4fn+ON8+B2t8W1MrvlnAD0GTfvf10Rx0h4Ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12771.jpnprd01.prod.outlook.com
 (2603:1096:604:339::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Sun, 1 Sep
 2024 23:44:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 23:44:12 +0000
Message-ID: <87jzfvndmc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Zhang Zekun <zhangzekun11@huawei.com>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Some clean up with helper fucntion
In-Reply-To: <cc0dca4b-7850-4c2e-a4c9-3f016c7b4e6d@sirena.org.uk>
References: <20240827070650.11424-1-zhangzekun11@huawei.com>
	<87cylt2ria.wl-kuninori.morimoto.gx@renesas.com>
	<cc0dca4b-7850-4c2e-a4c9-3f016c7b4e6d@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 1 Sep 2024 23:44:12 +0000
X-ClientProxiedBy: TY2PR0101CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12771:EE_
X-MS-Office365-Filtering-Correlation-Id: ba852040-a3f3-42dd-3a09-08dccadffb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3NMRa8qAE5JM3C4I3qKZ5ZCONPPu3VZU78859BoJwQ9/xfzyJTDMuDfio+Qh?=
 =?us-ascii?Q?wvmc6Q9OUSmBnfQ2t8fJoFV2QH8kJPSSDjUdnrRxjwP1MZeb4pvzTYpteSDy?=
 =?us-ascii?Q?Lxs6jZf2Y5Q8J59viUJNL+N8+IcAFmGefaLDJPvZf7p/ia/QJyZhO7uTY8Rc?=
 =?us-ascii?Q?WLmv+pMCNH7pwIwiBxLjjmMCbCMNLz4837isj0BZJf/AFT8zbgG2DofT95Ov?=
 =?us-ascii?Q?sKTn/E+40ueCgJkZr3RpgWPG6tIUHrEAq38m0pc6s7fsESFXVS52vTpQtPlY?=
 =?us-ascii?Q?l254kxyzISVnwWTokrYJLzJjXa/MjR66l2FK+tbLzrxx98N/HXNxbW7G5UB5?=
 =?us-ascii?Q?cF0PEnM67byIUEdrmVPeI3qIyaWZZr9A9NTpA1bqf15yh5n5MJ+C4H9OhH2T?=
 =?us-ascii?Q?cg5EbIBCtX9JxbNRkJlTKJxT4Fmk8+183YA/u4EYSvMM4UVZFF980U6WsOIK?=
 =?us-ascii?Q?Du0hFnIeolZUqCfzPhjIkuHTy75QqrYmQeZKt8CkmLcwojrOEOHWTFPHls6G?=
 =?us-ascii?Q?GTw95pbacPunhyp6ugGWxf/jpeX8b2i96FPqSSh0Y8mRYHPUabU9v4eikQIt?=
 =?us-ascii?Q?efcBHqnxGjNEZ4/KppsioMIlxmZcLOR7WTkA/pprp4IqBuCKqiFgiMj89bK3?=
 =?us-ascii?Q?2WrCm3oR4pdqbsdw1cuwu6SJCMLvcojEGbh1nX23sCF8v/u8Zf/wtx9JJeKC?=
 =?us-ascii?Q?+3/L/MHrtlD1iPYaDehI3gcxp2jLkWsDJG2DCeZeQtlwFuSsxFmh42W75IGF?=
 =?us-ascii?Q?HokVr/1um2RtLym+CIsTU+QTnsxRF9UKs9SijDlOfC0nIt7Zkqxxe3TIiSx4?=
 =?us-ascii?Q?ns/wvxDa7Oc82mKSGVP7ZBNZGtJWDRK8NKbuicDbVsC7vdueTPkjYcnDIXmY?=
 =?us-ascii?Q?cLDTnTJNzo6q1CCZI5MQf1S2t1OfScLxPo/94IQaETtzd2GzuSDcVhg8bzS6?=
 =?us-ascii?Q?uvqmJGXEKIKimJHf1qMPrSRK6i3cabZ9IJnh/c2p6OU4XWkeLk9/2AhmfBsB?=
 =?us-ascii?Q?T5a+R0CFbT84MBKHABzqgkrsvn95Qowg7WbHLwHY61ZGWEY3FQ+Ky6DTcIWq?=
 =?us-ascii?Q?5Vcm9N/55OgirU3k+cKY0kRe1n4EfaPNJW6i0T6dqHdEQqGBA/Di1+hnYeAr?=
 =?us-ascii?Q?AMzqqIspBhgLb4UO2WBXomMyDpQBWDnNF0GeXXrVzl4Jn5ZtSMnjiK8iHDPv?=
 =?us-ascii?Q?cyV33qQpOUeVfb3YXohx8WAZxZdyV8gTtJu19c9SECiMyNoqEvElT0iAo4Es?=
 =?us-ascii?Q?PvOgEmDHbPVZsOcjUbRqsjqEcwTzxU0ETw61aYGhm+D9MfDrRcoUw5510oX6?=
 =?us-ascii?Q?d5L/d4e1/itMY+kjfpP5qc0Gjk1h8Zh6tEdbnKSi8ZyefvNssZ8xL/lIF/UH?=
 =?us-ascii?Q?Vc9JwQlAIuUtPIeDKtaVK5fI/49Sldi4aFnA3y58emIbis3Xtw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EiY0nSiuSni0nUE9J7q7WepnV0yE+mV1Vv0HE9el3L0anitRy33D0otmS8t/?=
 =?us-ascii?Q?6Os6FZHOMvFB/dMDJJPGI2eGHrYFZRuu9iBz1p7RGf0UrJvwCLdbCobwJcxy?=
 =?us-ascii?Q?N4wF63NW+J4W+wr43rbOFcl3ibryhPzZzeAskCDM06bvLwkS5RZtf9rjrIlQ?=
 =?us-ascii?Q?ySH3UEXn8DoWlbzr7pr18EoSPdn/wlseuFXRfkvsOu0Qe6yEXKZFV7TdSum7?=
 =?us-ascii?Q?z+eXtJLbel3TPJTg+39pNsj2O5U6Qjo58+mTimmz7OGZMZrX9lVQsF6wQ9jp?=
 =?us-ascii?Q?AkdA3EG9r7AwPHnOr1bCaJ7oVOAbyacGL5BqT7xFPH2bdAp0dFDeAourWdBR?=
 =?us-ascii?Q?qZvdxXPwSED87gnzKbrTJIyLBe3ee0SITtcSc/5w1J4JkCOHFKGCIoBkCJJN?=
 =?us-ascii?Q?G5gqwo86FORzQsjd8lbMvCpLkgbuOKVUpB++ZmR2k+E2Fqy1dS/agVBaJDbm?=
 =?us-ascii?Q?8AE3eD0mRpFr4dWPgerXfl4mesp9I3/OthwY6GTbwqLSf2jgbVH3l8zPOXNq?=
 =?us-ascii?Q?DANJgIZazCiP7Gb8kmoHjp2bA2lWNPjWtDp0FhGbpTybtMVP2tLOMuZ+VceL?=
 =?us-ascii?Q?DgzgTxa1YR1OTjXzxBhGp1m9F0P2hX0k6INUe4F5G3AU+KAywG6mTyYg4pa9?=
 =?us-ascii?Q?tsuEsJPCSJSErZJiIU2aLnRza3JiaBiFICL49me42+a9lnnJJkk/XSWdD3n6?=
 =?us-ascii?Q?HKGPGt0vaIKblrD+Pue8GSM3nPt9D2xYK+98EltHBHrGdupmNPMI7q6PmUpi?=
 =?us-ascii?Q?45y7MVHNqG94DkhOrx2xJUbA84EHkF0/S+1TZsiy++d3meNcMCRIiOFG3bUF?=
 =?us-ascii?Q?wgcilVsE2Q6p6UZOV1w8ISOVyus29PpBj1sOzHBSLerl5eokbWEmIyv5RPlQ?=
 =?us-ascii?Q?jDapSA6dt5A7DUR2UMblFt9f0ulw1ADSTf3nO3/e1f1vGSuwGIVJrb8ONY1K?=
 =?us-ascii?Q?1FM/qE/mkJ/R2ay/Zhj7OF8E7nTBCTzGDkjY5LBXB84KxdLXE2oEsKB+Z7nu?=
 =?us-ascii?Q?4TO5hB2zGTEir1IE0ytqV+CsXz0O5elnJkq2jEtNphkBtcn5yy8mXEo60y1D?=
 =?us-ascii?Q?tia9a1Ir0tN7uhxWE6JvOlnaUovlqPidSQFgcN5R1RUjsAu4gulsJLoGgJTu?=
 =?us-ascii?Q?B+p9NkJ6NPA14+L+IDPSzrUhRdvMJ/wklARxwRMgv1JnsICYSO+Z0vTxQ1Cg?=
 =?us-ascii?Q?iZ4/7uIuAbH8NcLouMTegcToLzDT/q2U8Qh5PpP82JSN/EwkvYSs9XF29Zcd?=
 =?us-ascii?Q?apZ7AeVOTWJZ0eqi2hotIBlju3jNIYbr5uJ2dx7FLZIyEZfFYEspOIW9vaBh?=
 =?us-ascii?Q?L+D+uw8F14EicfS96lfcJsFD321oVzEyCH8TYBpwapzaGFJkn1KlMvL4OCf+?=
 =?us-ascii?Q?bLNdF9K1GrKGXWkHkCEvkUOncQUnGGJTr92Sox/NcSDC2tA3gSFmYmdA80hJ?=
 =?us-ascii?Q?iYy0JP4FTim0n4z47I8nN1jFEry/tRQ6nlHKTDz330oG+rgHIvkN1mQuk/H/?=
 =?us-ascii?Q?ZXpMBOkYMtaExM00NjZIDNGanca8lIkxpgqqo7uV39/HdWezU/JPPftRKBRd?=
 =?us-ascii?Q?lB6rdzzOA0/DvzFXmEzyauOdjbBdeAPfmQS8zRCRN6bP0AaAXAEeJgzIxbtp?=
 =?us-ascii?Q?CGO8qQv+4D7KPAE5cQ7fdvM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba852040-a3f3-42dd-3a09-08dccadffb44
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2024 23:44:12.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5gnb3mPnEIAU6L/UBbVr/qQucZ7dFpgZyygXEpGUL377nQvhx4U3jOCJ4OEeo1fl0MTsEtrUS14TJVdYFnKpmPkALsWA38T2AeKTece96CAk9ZT3qzGkCaUNSg2UYI4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12771


Hi Mark

> > But I think this patch-set will conflict with my posting Of-Graph patch-set
> > if Mark apply this patch-set, and Rob (?) apply my patch-set.
> 
> > 	add of_graph_get_next_port/port_endpoint()
> > 	https://lore.kernel.org/r/87cylwqa12.wl-kuninori.morimoto.gx@renesas.com
> 
> > Thank you for your help !!
> 
> It looks like the of_graph patches might not make it into this merge
> window anyway so possibly it won't actually be an issue?

Yeah, indeed. It seem it will take more long term.
I will explain about this and adjust the code.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
