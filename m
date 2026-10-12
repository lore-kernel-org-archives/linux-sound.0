Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3C2D7DCF
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848478; cv=fail; b=ppxgvBkkz8taY1seQy8c6mmeE9x56r1S4UiwrZi8oZbU1JkNVfGwMVHl1BVYf98rFcf5Ng+tyvRRBZ4MD8dj6PAQj3ScCWjDKc7vbSRosjmMePlhyVRI4GfzsbInZ7XMeme6nV7jiC9ZGjys7C6Zl8afAOCAED7/Bg+i9jRf6o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848478; c=relaxed/simple;
	bh=jWn3mGwCTPsmgIIhFPnOliv6FOPxk5UxppbOUVtMohc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=htzQLK3X6i+kSBVrlX1fMCQHunGSU3smnkLFoUD3/WQJIeS/B1VjWfrjBCBuZi/Yro9iv+cS4e7v6OimR9iuY6osbniiaagYyyIyMXkueRFW6EsVrl841wnZosOiEb9Y81Pxx7NCPCzcx96k+EBtpCdhDZ5d+YMfc2NNmkBl1d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Bw/ewpEh; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Bw/ewpEh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k34BOOmKltGrUhlptXnDlVypo9KB6zy96FoKroZvKf1dmVabo1e0QF+TUHbIUh1wnY30NoEH/aCLiWW2vrZaynnbz3au4cNTPpChQaqxUg7+4GE+cZNDdNEItYhjKgrA0ThqVo/By43lZAWYI7T9sU8EyEikGmrp8jlMM251EzD9opqqxwjDeftS/8gkHEEv3L/yJuPQB3L6iW9IDjcQ+XValyDdlBPp/N2etsylvAmskphUPb2L7wvnw0nBob/I3bIHLQvuYWpnz2BYepXC1/dQBFP0h0ho+tXaxcCnuCbXvrsd7qlcgpD4fQy476eK3vJHMFFPYiRQIdh7Iy9hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GPjXwMRxkqtbB+NlAVV+xlptwLscBQq9i3LzWNfsBA=;
 b=AOY3pas9/dORwSTJfwOkW1im6jAFHAeB48YjywP8izDhIzunKyIomAyX/Nt/ss0kJD9f4BxMAS0aaVWdva9xM2Mk5WVT6+vL3vsG17kzQPS8SWma1eJ8lB4uUw3Q9yl4Gu7w1+chXT+4BvfVukQkBel7iFImVe3v2GZCHGO0R6BSWM4Hcr6WUK0egsoWw+URi2e/1hAR6rNtY54QzDpzRRjTBOAZIxG7T2v0kZcaYjdtJrDxZt/Xn91KT9d1DHdl8UcLLcJmAoDZXvCsF6h4pVR7WGsZwl3URMsG/nSHwGzVu0nWRSGAjcz2zNw6mAt9ppVZL+fMldxTaSsnKoZLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GPjXwMRxkqtbB+NlAVV+xlptwLscBQq9i3LzWNfsBA=;
 b=Bw/ewpEhscHVeFbKESbmQIZXhhD0mWH43TR8HJB8IDNyViHQbioY+jy217tztgWfMxlUK1xkp7FuJrW02UY+DGbON+6zHRxVzVq7m2HXamjHJoOs6ZbeBZfCLS7ENgtEOo57YTRvn3pS/CP2/QWVQeZSpTh9XCTiWz3LB4jyehg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TYWPR01MB10035.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 23:41:14 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 23:41:14 +0000
Message-ID: <87qzhuxzae.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Arun Raghavan <arun@accosted.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
In-Reply-To: <asOtJzxO9bWQ1VaX@sirena.org.uk>
References: <871pbsnce8.wl-tiwai@suse.de>
	<5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
	<87se48lv6z.wl-tiwai@suse.de>
	<8733uoys02.wl-tiwai@suse.de>
	<87ik3gs37v.wl-tiwai@suse.de>
	<asOtJzxO9bWQ1VaX@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 Oct 2026 23:41:13 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TYWPR01MB10035:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0d7bbd-c206-48a2-eb90-08df28ba4d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	rvXuSk304HC4sjS5BBzRnDv1cpdVSxziy89CMDpbCMjUFPOcc07Ye/Qb0iawAl+yikEvvCAJUpCIVyRcWRChiZHK3T1klNiHE4Dx8jRMsgBA2wXqRxD44Aiu3w2wFukR2c45enGcxo1NUyZUjPpFFEipqM9UVQB+twSRnZQ+AspceRtDdwYiuiVlK6gV6kLl6I0IneMEnEZBJZQYkK3Lf2VyhySq39WOyixANWN9KrUkUH/Kpvk2ls144NgM9lyO324bYdUZlifdmvXP6oCMea+/oyvPSoya9cbmQHdT8o0hRAh80hnLzpC3kx2fSOU+dX1JLv6B6llE/iCIFQkF3TqH6db+5LIPg/RYCZxybDKOoYFjeSHw9uz56o4FUtvqt43ZjR/MJjY+4Vw+nrC9ZlaZTqsOCO4ZhytGk2DDehOvLVHNptKNN0lx6KzOGLiv1MCzaml6TIaYY6A6hMVdWTNaQCl4XsFFUjHcJIkJXBRa12ow6ox6hsBIDskTyoHNrQPFHVoxrCJRdT6wQ4sdXS8lxHvSctl+f8K1Qup3h/2OTs4llRrWxAfBuYzWSpi8/y5Fywhg7R2DODVQ9pfTb0HIhXVZqrHJNtLwkg6H+PzuQV5D7w6nspSjn9RQaCEoBJGmzwpPAFT7fvk8GRHCy2ZFPZ4wiX8D9R9scbVyEDB8q7xdmIgekOYwwtk97V+y5ac2T54rDZIKQUNkvXyHNjcuvSk2/TVH2iJhbK/m4Qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qdk32CrUP/LQHKhBSW85IPp9IGpU9BLLj5+pkUeHRjdGKKthDBgtV1SFVfiI?=
 =?us-ascii?Q?eq03EoMGssWH8VZXrtJq189XLUCj3+0WS97nXoCdUZONmGhZQnACbf3xd+VP?=
 =?us-ascii?Q?+PgCx/jkYzrLKd8nQcA4VJ9lIRr3gRkDuboALugSf5UylDde+gN6PT5rhfNb?=
 =?us-ascii?Q?jsNCCTuP3Xh/u3TXQgNChSmmbLauW57xVN5uHlsG0Jk/olSTGCuF/QvbtMIb?=
 =?us-ascii?Q?aRkdMlraVMJPW2zgBIK53W6k2iF90MtQb8RsFFaKj0hBP0ovPp3BFiLzzjp4?=
 =?us-ascii?Q?/UWJtSXNOMtZf67n537APLUD0Jitd5DGELzrn+VLQzwllbxDLwcdt6aiWHig?=
 =?us-ascii?Q?sQP0aqGhqGYNETwhmhzvNr6OZwWz/kdVMQPtyP2szlrLUsbxrobiMg6dzShd?=
 =?us-ascii?Q?ythibP7gAGrvXZEU4YTfd0oMmFKdHfPQ7me7WZvpFsWXtipnmQg5/dpr8JUz?=
 =?us-ascii?Q?KtJlJi4Pz5bFTwTLcZUKMlvLXr1W0Voq2PQm1H8gITYF5+8TGNk8GtzpiE56?=
 =?us-ascii?Q?Zbe9B4H/JL7UbSChz4PtKLxAaeIH6qxuplMA+ak4OxXz+KGV1wTQX3Y00vyg?=
 =?us-ascii?Q?9AAZqXZJgX1peDBDG0nl9ZuRMyfbBWrCoZldPl1cMyanafE5kKfsNlSQ0m03?=
 =?us-ascii?Q?l7/fJ+P/BxkMQ9hX0oaCi6syQ9RLmnCcxWKYd+AigDZ0ReonG05i/Mpd/JMD?=
 =?us-ascii?Q?/iV2QJlQUJEI/RN9YWobbLag31vd5GNPxTdtQpFF7iSBR8sG3WMpndLbBtu2?=
 =?us-ascii?Q?itBWl23Zd79NPpm7HqjKHdWwkNn5znlp9kbVdinwrOqbtvXC6FBosA9z1GWu?=
 =?us-ascii?Q?mlufzKF5UFOky4mj0aS+Ep/10VM2B+tnox0h9cIPIlliksT+RfJZ847EfCNj?=
 =?us-ascii?Q?sClPZpm2ShpJdFz9RFHjtXyxZnm+zBmzsTImG7kOA186t1rgJ/FeTqELoqEg?=
 =?us-ascii?Q?aGIqkmHMilcLSFLUU2ydDRLPO20KYU+LtAWR1GZr9nO3Jr/f8QGbvL3gzoXK?=
 =?us-ascii?Q?4Q1hTFJ1INYtRqRKaiy10eONpFh6GX4ZV4YELRBRpB7MreXNz8DuPkAdxvmu?=
 =?us-ascii?Q?+intvqsmBTTnRQ61hs38JZoodXZ8FHb/dgU/qDZb1Jg+CyUrU9doVZMrmDNF?=
 =?us-ascii?Q?UxRM3RuHhYeBsTwgetIO/BPR/ykCSD07WCJGA5/f5oE/lwstOUHWi8vwxLWr?=
 =?us-ascii?Q?nzPcZBVkUbFs0PE+arM1wCOnBMlGL8m0LkZWj6KXGm+qPXzcZ4DVFTcxCbJo?=
 =?us-ascii?Q?OhOkZBj64X8lWTlJNhBOiuuEej9hlM/ojPii4jr7KFnlPwZhDSOPhZK/u3m9?=
 =?us-ascii?Q?xpW438ESkV3Mdm2I9wiiVnZUeYwhCguiFigCG4obw26ciIO9qWKdx8kgMUXj?=
 =?us-ascii?Q?2NK1nBWyYtZhUEZ5F5Lmr28WOyTm6Jo2xrxFPqftllRUJso3sV6G4WTvf862?=
 =?us-ascii?Q?qKCD+Nyk0Uk4GaHQFaKEB6rT68l+j8oZ2GvNahTn8tEAUzd7/9uHIo6c+7m8?=
 =?us-ascii?Q?VeQu0rdKsHwLLQo0m+fBrItZqlU21iImRLiUSggFR6qPHYwillaHiILF8dO4?=
 =?us-ascii?Q?01LO6EbyGtvdhB5EH8/yrf8nxZXOPsdaKQxgZnI+UceEJ6XGYZ5EGqeaWJ/0?=
 =?us-ascii?Q?3zQYVHCv4Nc9WuyCmLRRmRq9PPFbvZE0xTwR2yRB/zDYcUFenTyVe5idxxxy?=
 =?us-ascii?Q?NwOGd7LcZ+7pGFRnMp4F0VO1qm4vGqAg+E5FGVlfXi1xV8gy68rknVBN44M9?=
 =?us-ascii?Q?oCthqa0JGMZnxKcFbwAgqgbZ6s5nDQw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0d7bbd-c206-48a2-eb90-08df28ba4d83
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 23:41:14.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7Ay+/G2ChOAKRzl2XOZ8Mm5aU5RL3re3ZGCC2nNkKU9qFO6N7GXdoyYZKBz0afHkVElw0gKM0QdiseqhCYf/k0ad30d4s8LafWybW5altr2biwOvG4Jvo0o7NEAoRUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10035


Hi Mark, all

> > > > > > a few people including Mark and me have talked about holding a small
> > > > > > meeting for the Linux audio stuff (finally again!) during the next
> > > > > > Linux Plumbers Conference (on Oct 5-7 at Prague).
> 
> > > > > > Has anyone already planned to attend there and is interested to join?
> > > > > > If we have enough people, we can try an official BoF session.
> > > > > > Otherwise, we can just have an unofficial session at lunch time or
> > > > > > such, too.  Just let us know.
> 
> > It seems that a lunch meeting would be fitting at b.
> 
> > How about Wednesday's lunch?  Does anyone have a conflict?
> 
> Adding Mormimoto-san who's also here.

Sorry, I didn't have office mail access in Prague.
I didn't notice about this...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
