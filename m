Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3CE165F16
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670017; cv=fail; b=HZGnnMynX/75H5xucU/kk+PtqQGKO7JecceVYpDulv14xx+yPSvRDjFziALJzswN2l6qhMj2nMfJrsCIs6uT59K/KUTW3ilwFo868KD5Fa656ZL6Vh+W/vd+lQmkr+fnmFPC76JuQPgk3DCaFiSIH/vHcHm409GMt3S79Sm8lAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670017; c=relaxed/simple;
	bh=3oGpQpFtEvsGzCJr4QtfXDhRfYluNZu5EPH08UF/h8U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=irlv1cOVwKG7pgkohT+NHfM+sv2L11jPPhG4lxiP3ilLe+YSt2byb+wR/BcfJUMAcPt1W+Z7bkR5qAABwpL9UOYBPkYPUnczweQ/TFH71Lw3KiTFYgOyu9JUTWV/Vfs9eIPhQ6J8o2iqzsYR/JTW8bF8KTAuMHaH45KKbB6DQVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i5lofYz0; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i5lofYz0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5bFR1I3Z6CiY6KhaFpHYH/JcJTx8mbG0y/ZU10iunTn6C+w9DCarXIi1817x0wutwSom4UzXl8oCKUd1sNimJP2uTa2eePPLP4fmLgzNiCDdHSkO+lNli/h5lDFKtc60CR/f0hVEBxeZ3DOemg3cDEI+FBzPnXIVeURST5mFhEkkhAeyU223zvlfczCgRjr7URadlPsm7SHDCDjDOB2N+/uNQm3q0LC4uWvzB7IUxuQ/0KfBl+rmTUJXDHB+4tQjps1C4pYeAKkvF29VTWOUB51sFr//KmalSMMXliUnmziywrCy5pMF/GIG8iP4hbxQ6egx5nRDDXRp3rVy82P8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNlyZmjfUKIRfoKmV2+ryp4/z2g/hcLWEzJeRUnbUMY=;
 b=RbekwhxQbz0MXycPim3xwL+W6SqBj0oSQsMN+J6cUtN8QEgW7YZTiCA6DqKfPaHb4HOjhrk9iAn6PkXgGP8e+EwO5fJTaNK4tlOgpBchY7on/HgLZ5VaPN733/MlBYAk4qPnd7Lehu/07QyRvxm4Ik/OIx9x5vIXuw8BGZ2xwYXUb+rBGJpDFw4YLWPJqqb7ggpAsp996YfV5aOeuyp7ROjqyEaXOqF7rPGKMQXYtgeB7PTCoBBojoyokkOZdR2JalOJoIbovB0TBmJnvcSsnmMrjrcWnRkFtfrdrPEDwxXtv+R/+pT6URKMiW0boINNDwiRVMwBmkplNYJ0/QOpiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNlyZmjfUKIRfoKmV2+ryp4/z2g/hcLWEzJeRUnbUMY=;
 b=i5lofYz0Lf7BJsHS/OT7q9tlA/VB3C1EnwokfTSbErupRKPmj4sWYvNSHt+J9O3gzp+E24cYQjReHBFfcLKdnEaioKjL4jCJ9jMj+w10gmYpqbUL/vWE0QvlKB+2kxIz//iqP4a/AiXERajgyGylXFA8vwjZxvptqurXRY0TThY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB13228.jpnprd01.prod.outlook.com (2603:1096:604:354::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:20:13 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 04:20:13 +0000
Message-ID: <87jyrx23ya.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH] ASoC: soc-ops-test: remove component from soc_ops_test_priv
In-Reply-To: <239457eb-e19e-42c7-9ce8-8e427cfb4f43@sirena.org.uk>
References: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
	<ailKjsngVh4q91C0@sirena.co.uk>
	<87wlw5mufz.wl-kuninori.morimoto.gx@renesas.com>
	<aisSJw1RJTXmC3jl@sirena.co.uk>
	<87pl1syas2.wl-kuninori.morimoto.gx@renesas.com>
	<239457eb-e19e-42c7-9ce8-8e427cfb4f43@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Jun 2026 04:20:13 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB13228:EE_
X-MS-Office365-Filtering-Correlation-Id: 661fb596-c18d-4cbe-3b7a-08decc27ba76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|22082099003|18002099003|11063799006|56012099006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	6+QW9FImoVcdW6ffvGxDLNEVroH/0puvjzRecihrja3dvrdseP/mMXwHhE8/dIBmPdMVopueRc5lyaNKwuWwBduK2Y4zwbMG3g/Z94D0GkCZ9eu+qka1co7OOQpIuymJE7/I2QTwIOvXaKqoiPYK9APhc5oDJhy/0Us6S0fDOQe1KILQGf9YMqZqIAreotbPCpi2ONK5jrW/DhlSo73f9aDV+JP9JqkKrqoD/X1qmbxmCIzGKX9SVjLWtgjYSJIq4szFfoga/h9pFRGGjDmJXGwdzpCWZEKvf5dQ2cXKsV7JDz9pN9ojduPh5CdD0yZdvC0T9d2lmsCLiqwurK7AS+jUXz89cDbyGbJ2rZY6VYckkpEBXJAWURNb0SIYKA2dg5oGuu9PvBZ7//K5lAgnLR2UX86m98T9EIK8BBd5CvR4KCSS+CiyReVYQgys6WrHntEJL+YwF9XN3Z/BKspdzFOGfJtyMTq/3KAbcEn7o9i+zdw2EFPrDtbUxo/nl7DSAhmAL+qXkjcFKTqERe2eecLTxV0Y5dZNWNOsWWXD3eiUXL6oN+o2d60InrOZsB6Cj2g926B9BKvVzMOqUhkKHsZ9IAq1YGMXO7g7vD5qpsNjkkgAlVSACTYgoGpdFnSpxnSDjyoEdoa/EMxg5QRKpv9Miu35L2pUZ4HmrHrul/O/FfhfAV6CMmAnQnEYOHWVHRMcFSF/S7bSbDeuBspAJG/Qev4Lb7oU3Pv/pcqqNtbyADhqD09SJ0oWUUSpMJ1m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UGhvhwKhc7/CKDAXWmTtnp5oELVptSvVw3pluYIudKLV/9Pwyp5+j/lWQscr?=
 =?us-ascii?Q?UJx0p2FX8z0R60PDlFZLjhTYgSlrNu0SfAGyuAZbx7fFSJH+sWoivMOucbeG?=
 =?us-ascii?Q?O3p/Mo5Vw7EAymDAeX5HA+GC0M7q4ftcsuNXXE+A9JBgJ+3Clv7V34BReANZ?=
 =?us-ascii?Q?3hJL2tqQt1DNz84U5kEwlDg8tui4QjtJ7jsMF+zNUWLL4G/Es4Z0EQOOFpfs?=
 =?us-ascii?Q?Q97lpAFc6zoxc+cavOsSepBwv8b45GCx5tttpIsjkjm649Hgwarg53awn3I7?=
 =?us-ascii?Q?bTpLqmD04Aeju9rQQ7Vikcjymx588Q6/GRg7W8mMBmYPFU7OPVTLDR6kw68v?=
 =?us-ascii?Q?1eJvP7GHHaIHKVD51WYmlo5I3L1rGx5BRYafR0c0O6RDqVv58DPZwD1sTspR?=
 =?us-ascii?Q?gnKCpvAFlm+pybKaoFBBd5jLpoI5UexcbSlD0fcuOLDAnf7CeiH0wHpWUYTh?=
 =?us-ascii?Q?fY4bQKnYdUxYFVlBIxybewlTpGi1c9wpqo/3f6/SujNYDqwxawzaqVvt9XWM?=
 =?us-ascii?Q?yXUm+0sqyqkg8E9oyeaipG+kLaX6/kI5QBSp8YgiV2TXlLZidDkmrn9Gexrv?=
 =?us-ascii?Q?e8l1Wrgwm13Q/1h8fB25Qa/eKrGaULABNxSxlR4H8LRYf7Vw+FxPqH+dh6rw?=
 =?us-ascii?Q?5RlK+wtITtaCnu6O6KQgi+uw9wUhHgPHfLIY33CwQ+nJhHrDXWezB1PxT4tu?=
 =?us-ascii?Q?3/ySOQTPJNK8wz00NiYWWwA5S4XSl2JD1bkBfJOVt+s73mefiDmYaQAq79o2?=
 =?us-ascii?Q?XZu0RIZhsG22JiDUMynOPimjCMCmjUNkOF56jc6ny+69MO46wPpreh6lRBry?=
 =?us-ascii?Q?D0P6uBNY6qh/bgmwe9cIIdyBeUmkzHU0IxEU3PUUFubQB4trQ6gbTFyog8KU?=
 =?us-ascii?Q?tAmIdORCWVw7ZO4oxmX3wR8sEDTQM25YZWjhswpuR6zbJOnYvUBpiAXb6bVA?=
 =?us-ascii?Q?LmFVLvwX0PxNxcg8fKC0EYmPu6lgR6RJHB8YjEubAw8xMQonuEH1JFXFJEnp?=
 =?us-ascii?Q?GF8SjIQnt+TY08rcI+KolCrJ//T+RisQ47++cckbH1Z6VGK8Df8/AsGRKVga?=
 =?us-ascii?Q?GiynWSXObDW6Zw3PJUu3ZzykwpKVNMOEatMLJnB6cV5BTljVuHYjykUPHyf4?=
 =?us-ascii?Q?FELNcrklMnn+LG08+jPSYnbnGRUnD3J1iQntK8TBlM7c7jUwa6zqE8dMJUGr?=
 =?us-ascii?Q?DPBdYkKFO3LYPCLtG9/Ax3LTtM8/8TrEwGzajCQ0ftMnXibDvfDqkDvehsn5?=
 =?us-ascii?Q?Jzeetu73m1FOPIY0gYhj3gY7VtoFGUwPFGlZbIic+dEfPi9raNXYTMEjkG3G?=
 =?us-ascii?Q?k7j3mIPjVKnxdEBSwUCKf+sfFQy6YDFubGfI2an4LncR/p8tpbjUMKymfE/U?=
 =?us-ascii?Q?QxbGHFbuIJG5gcA9dxmQ0tqR7kPEcOCRKh7UYqU/NmPKArpLD6WmpsL1bzza?=
 =?us-ascii?Q?qbTynXzxF9hJKpprWC69QA2QRQliqNM9touWogMOv+2gglID6QP2XuX6sZE6?=
 =?us-ascii?Q?okZhRe8qRgEFXMYb9kZYkXC7Jawcyxq0TWOauDWuDUE72Vs3YxityvPmQ+5K?=
 =?us-ascii?Q?FrY9W0KimFrsyLwepUsNbULvM+Z7+zcwm5COJF3xciRYgNSqakPfd7oyR7/T?=
 =?us-ascii?Q?UV4jpCoe7Pq9CYqh/dPeiub9MOQQBIAtYSorJvP2fLyZKTRaJcGbRWcM3qZa?=
 =?us-ascii?Q?SVpAuoJaUxzAW9Bmlec5u9TjQr/APTUNSsDVRogiGgRj7K34DsqZME2kf6jZ?=
 =?us-ascii?Q?SNySt23a6GBtIUI73V4F5pnT9KTsSPbECv+42Iep/sm3NlRDuHH1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661fb596-c18d-4cbe-3b7a-08decc27ba76
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:20:13.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyroeSBnvhgT9begLuF1lHQxckd5HiQTJU1lO8wdN3MgDQGhpQu9LEgs8ZKdBHuCuGhDlGPsQu4G6f+832Si2tfDdKBGIaMLKvQIBlaB5+h1ozFUa8W/SCrfN56BwnVZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13228


Hi Mark

> > ----- soc-card.h ----
> > #ifdef SND_SOC_TEST_HACK /* naming is dummy */
> > void snd_soc_test_hack_set_param_directly(card, xxx, yyy, zzz)
> > {
> > 	/* these should be set via official method */
> > 	card->xxx = xxx;
> > 	card->yyy = yyy;
> > 	card->zzz = zzz;
> > }
> > #endif
> 
> Yes, something like that.  You can set a device up during suite_init()
> and reuse it for a bunch of tests.

OK, Thanks.
Will think about this

Thank you for your help !!

Best regards
---
Kuninori Morimoto
