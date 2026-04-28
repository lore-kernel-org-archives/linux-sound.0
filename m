Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655131F992
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777350420; cv=fail; b=GmNs5x9j2GjCmI+M9NEq5CedpR9lJvVWRW8Xehifd8Zw//DOoz+bUrV/0fyqoCJ8nywQdQNbRf2HPMFSrWsLVhdZfnU+5EF89ZgvMoKlj1rdkiuEkbtANuh/JAuPH/kM0UFEfHraUfLmLUQ26HqwjMN1eMk7Kgwuz/Imb5JHw2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777350420; c=relaxed/simple;
	bh=TK3G2Iycxqsl351FrxdAPGkv4v24IUZrL/4KBsWqIBY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GM6WfY+tzCy0q9Ziwa7IgHSjSOZRYg+Wz+DZniBg4BAkC8laJHa5N1eXL6FFCcSQQfFQ9LK4CR2igiEDYKIv0O1zeJq2ZJAfydO56mTBo0NG9JaXvOwxGdfikqBUZAroGUnnFi8oIJdoE/E7pKmsqePHLa8cxDFvkFi8KCkYdKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oFTLgoN6; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oFTLgoN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tte1sMbZtMAw/ESawqe2MihnhSdq9rE2T0LERw4UFXuuXpIGHSDTsjICrBrpezVQnKMq3h2jhkcvoh0iFB+mW5LkyLUWneXCupx+brxawzjqUKhCLUxWXMOOPmluXh9agudtD0nLK0KjomgCZ1+oFY9rjj4BKjPZMlqhHbNdYGeJI/4v4d//qocTWLUUsHrT7kfiYYk/hCVoJkk4pt5WbrS3ACoAO4xw/x79p/YPerl/6liNqCxsw2E3EKWbHmpIeQzlhoscVn4mBgojuWgMLbWQpVvHGDqqsP883QiQ2Eda/qin8ncp4U7P+VtQn40FKT33LH30D8X+4B4qQY/ykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bCJeSCb6mesDWhlKW/XUIJceSqq1Pv683ZLrH34hUo=;
 b=kubL+nZpSi9vA4FFz0SsljllruIaSQOX84sOKEmL4StcfomzkTnWO8rQhGtLWw46C31shk5ITd7RNod1uCZxuD91KWav1b+jCFUJBpClYTCBqO4gz1TiiLeEk25Tbj0RSNuyyz/U/pH15C2cPM49u+a+qdMMMOmVj8S78ixSHGn33D44634HdMDT+yRlZNJhjN8R3AAjU76opcf4V5heS6jDOmXUupFjw9DPboQGt6hC9bv3gvtBefR+WuYZgnLtfjjnKuLiF9ZOyILN5hXnrjlNQPyI7h0fThlNJPjdyb5G1XEJFg0AEJrecy+DW+Gqw2d0cXvZ8oMuVHU6aeL1VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bCJeSCb6mesDWhlKW/XUIJceSqq1Pv683ZLrH34hUo=;
 b=oFTLgoN6gkUOiDN5iPczyzHZPw527AbdhFG89mVr4S+IFo7tbjpWxnt+Lt7Ukbm3Yu5ZMvs1PejZg6rx9iMKijK6AKZk4MYsDaamMvUu/Ys+zLyfxpDOpJsy2yBcuycdZiuKh+VPV/ihnSWa5zfd+ut5YNM+w8Yjf9gFoEUIVRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB16226.jpnprd01.prod.outlook.com (2603:1096:604:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 04:26:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 04:26:56 +0000
Message-ID: <87ik9byak0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/2] ASoC: soc-dapm: move card->pop_time to soc-dapm.c
In-Reply-To: <afA0zyjvdWdXwAF9@sirena.co.uk>
References: <871pg6d19f.wl-kuninori.morimoto.gx@renesas.com>
	<87y0iebmo7.wl-kuninori.morimoto.gx@renesas.com>
	<afA0zyjvdWdXwAF9@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Apr 2026 04:26:56 +0000
X-ClientProxiedBy: TY4PR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB16226:EE_
X-MS-Office365-Filtering-Correlation-Id: f05b1554-7374-4ec3-a325-08dea4de61b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NJid3lMRrn6vy7to29x53H2gMjMYUDmnRWonRmgGgRyp37Nz4U8LaW284Co7hpRUjeHUYrg/8gHaF2FBpTQk9kO/NYku0mIaaFI3dMDlwOKlQb25KqR0rLhWP/ynE9Qy60haRpneayq6v/8/jdcjhsXzdhQrv382rIs7BF1ryRviG0azhUn7KHG+XF67EX8M+MlJSIUzB5ibKzHtLpDKSf6KyGbxgu+roTj80dyg+IDKQ5oO/dpOZjY1IGXwVN8YxwVzpPljUT7dDr9DNJ84Jr9G5IWXTz1mfWL9lc1d5NqKRYfwcubFgEdt2C1UTeGoFDdh9WAInwst9umEwOIimgxcpY83Y9oEqJKFKACLaUhdahVdkiMnUL1fFLSKiBB4c+6fSdnawUaQ8PdRK+Eo8jjpNE4m0iUe/+1zso3DxTG2mlp06Q5GX2wCsAx6cop9bChegh9RdsWitBqrzg2902kZlu2Aqy2Q7LYKl6gmWJNzYVA5xi7QE7u4E8/asd8hXesmZNBlz4/C4TR+m7JwBJioT7OeEeUgKKJ46XXtfxvOOn+hZLJpFtvFIloT7HJcBKKdsYzUlp//ywgxych37thn1jnwagy8x+Fbk80pjZVQKXJT+3vWJNxkZzv2MrL0wGBmNF2ebuveWhW8pJ4B8H74Y6A91xX5SuEAheJECZqwW5ukIL1b9Q+dsj5EMsPC3aAaBTMPL53MqHdJ4ITtC3CBsPf6JorYk0D13pRstp+jWgcLLLLr9Hu7fKeZjz7/awV+9gmpq3zbaXczNgiuRc0t15jBzAJ3XelmUX8y8aA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6IBhgI6AqwZbEqJU1Viie95Uqvb1nQSNKQm3vciC1lKda5/5bZ82Bxu3VHOL?=
 =?us-ascii?Q?Mh3T94mh+sI0FvdqpQ3I0txBtYKIQYJL/8ZXln3Ve1N+AYPu8aR1gC3xpIU8?=
 =?us-ascii?Q?24jWrZOvpW8qRREQG1d+TGhQseCLkZ2rXJA5gh4q5tkWnouzrcwKgE5vAyC6?=
 =?us-ascii?Q?u7QFNCE+80gERmxE0YRzAWisEeOHScr1p7lR2HYUUsNist7ZZltQZ20DXrPf?=
 =?us-ascii?Q?X/vNoTW3MvNxHtWqW5hk1XjsIQkB0eoOdzSvKT5d9yvihXD2iM/9pXSyKKtl?=
 =?us-ascii?Q?4o226tuqWmDkdrTh6o3glc+9S2eI/x/mZRGlP/kGwCp+5KyAEv4MsBhUa6hO?=
 =?us-ascii?Q?vyE5oYdqab+62Y1MJGhzWswtud8Z3PFGKrJifHnQll/JL5sP4EvVrVbO1iI/?=
 =?us-ascii?Q?gMxVs6PpiATW5K2xQbei36j7a6P/+5J8wwPj5Hhu64Ni49DvCIPsWOjtaJqX?=
 =?us-ascii?Q?YccGp2AhYrShzTogMwgWpcb8aj1NkPbfnVH+oinsTWVq6twcHF1EgnRIevPs?=
 =?us-ascii?Q?IcGEMvwrFVF66gTJkGbnm5vd5oWg6MaFtofjgNDaojGUaLit0CwXGZA34f20?=
 =?us-ascii?Q?MuL188Kz3fLEjh6qnm0KT+g0KIp53MpwjnjRGPiysEM7O0L3Y0fKoKDBKw95?=
 =?us-ascii?Q?AffUyJh6NHBzU5qK4AmohozKGOPMyRFmr2+FV4gOpGskIHX2rKe/Bfz3eP0s?=
 =?us-ascii?Q?0Usk9NgPbtHJv8lj0Ydh0i5lLo7KuxSOSd6W2k/Kt27AkBXpkYHPMFvrOz/u?=
 =?us-ascii?Q?cGS9ALyCanpiv/eOHuryHIkmYbMKyTro8PNR6Q8RZ8LcImWw8XcsiYr1/MEa?=
 =?us-ascii?Q?fUHj3+gAlaZctSUTUF29cqX+eD8jFjbNQO13U4AviYftCJ1L2wXxwSzvtcZB?=
 =?us-ascii?Q?d0w94bljGlHPsAwMEwmZWbaE4/sNracZGds8lkTiEbwAfQyFIOQJP9PrtBZP?=
 =?us-ascii?Q?g9aJb2Ui02UQRCWKX5LHRrnBgPkRjWt75TMY/0HKbss72qdJ9kOQp7iWrytn?=
 =?us-ascii?Q?JmEWRHv4508op/IfSsrksZO/ZKzyhhNovPHHNn+wA7pOmRGBBIZDqdnZ31vI?=
 =?us-ascii?Q?/FktoguP8aTp3JdVVhgy4AhNfHzXfkJJGMp+MQ12eugnhsvV4sc4eyiWePGE?=
 =?us-ascii?Q?gZUZjqDk1BMhYG+pWDC/M5ve66KieGbMxPIr1ouHBj2d6J0TWOcsrsLf/9tR?=
 =?us-ascii?Q?IP/B8aU8kiPowu7XMPVRbyYwTlVoD24ujQevYGWakZDSfvu1wCOBLGNvpqHU?=
 =?us-ascii?Q?yk/p9PPKZMBovMENRiRTi8oPzej14EU5ElGtUcbzSo/n2ZX4EvmQ11JFAS7k?=
 =?us-ascii?Q?mq+1/VYLSo1hDgX2vxccxDR0tzyZL1FI1/C6R5SLn/7Ebj8e5U7nUTtKWzGD?=
 =?us-ascii?Q?LvnqaA3G0ivev+pIXLQD+/Mid5a49cxmTAL9/p6LOIH3Xp2Ui4Gn0+d7SWkt?=
 =?us-ascii?Q?qmFns8UlNea7llRzZCqVW5qZRRQoKhEhEgfwJoGlqyiqWE3W0wAJCRDH9he2?=
 =?us-ascii?Q?PIM2WE2kO26F90oW9hKxHgkr/EbzdRSP87GrEIZBSoFl8TQf4O3HrqC4vSHL?=
 =?us-ascii?Q?hxVIqITeqt3PTkvsRpnLQOOcNp4aV/VFkOBx4UJRdjZnWnlsKKZo+8AWGu9v?=
 =?us-ascii?Q?e5b5qoSEJzgOzPDgGrZB1PttNStnDk5BMUlnjsauZU6pmwDvFu+t6GAWegZs?=
 =?us-ascii?Q?3bvU8g4QdkD4kAtQJbQon4QSKqCa43I2qiuxm3Ca8QBkJ5MNFpICwQHk/09Y?=
 =?us-ascii?Q?Kz3pv8oQ0AEp9rKpIXiDZL+XplSa2rwOmqmq6R9gXye52A2REkfW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05b1554-7374-4ec3-a325-08dea4de61b8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 04:26:56.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLRtonUickWrLTSjGS0nQwjqNjJmZgEd6luG7JY6HuEoCcXmizko7CXrNMbmTHcw2lg3jsUINFK4Y67yFgds+tcqwIFSRQQ7UXIcIC3l6+M+MqOPzTmq7vYVtR68l21u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16226


Hi Mark

> > +++ b/sound/soc/soc-core.c
> > @@ -194,9 +194,7 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
> >  	card->debugfs_card_root = debugfs_create_dir(card->name,
> >  						     snd_soc_debugfs_root);
> >  
> > -	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
> > -			   &card->pop_time);
> > -
> > +	snd_soc_dapm_debugfs_pop_time(snd_soc_debugfs_root);
> 
> This is still in the per-card registration so we'll try to create the
> file every time a card is created - it should be done when we create
> snd_soc_debugfs_root instead.

Yes, indeed.
Thank you for pointing it.
Will post v3

Best regards
---
Kuninori Morimoto
