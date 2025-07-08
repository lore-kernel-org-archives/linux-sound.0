Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E71DA5F
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 01:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751939622; cv=fail; b=ChNK3N75BksfIXnMYBMnDdIphO6h3YSNH48y4m4HN+OXQ6nzFXog8E+I6Qo6caayxlV0dYQG6qS0hlJnKYlh3bxHQZHdZRJFHogruu+1ztPZkE+Hu3i/cgTyd5uJkMFUCTiJTA3wBv+TwDBCfkMGotdQ9KYnQqctqnIgrYl9Lt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751939622; c=relaxed/simple;
	bh=kqX9jyEV2jyPgCfVEnhnTg2L5UmQZtfRVCqZtDBBAMI=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=U3ShPDR1n/13OTjNCSi7ohjb1lEEnDVTjqwVG8F2rp4dUKKptbUoDtQvCaxN9BYGYIThfo4pbiJH4cm/CUUdKKaJuCprSXdGQlphftLqHi9sKrhKcJWllj8FdEN2QqETAYr9F7CtOAUywmma+jjLzFZMyowNXvIBocNeLXknX6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=irfNpGWz; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="irfNpGWz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seEDZrLOIgBZNrnbQkofNKoqvVgUm5pbzjZaFPO+hbE2pzXPg48mhQFWUNJA9ZWZDDpzT1+AY3am7wyNP4UGas1/TTOgc6x88N7oFDLh+tSBirNRs/8RDsHSp4o3ShZgGWR31oeXCqtMrCWvaYdj7igywjjoHexHkQQRAFnLqLsukXivKYG86QnEL73Ui5LTm/J7AwtEWN9YpkIOZ7VI9yJip0Rjyv42tErO09/0ikY86LtpoK82qscOVOhcwtcYzYXiHqPbTyBhj4xoGlgcRl7lCmRQKBBBCs2e6aeZjeyQ/T3dZuSc5sXLmoF1ZBachcwVZdwDqByoo4LmMrO1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN3uSkyibdFKMN6Np2/ZquJ6pXl8uqSDYP8RlIN8fCY=;
 b=W7FBdhN9m7ENXnmF1zlC6eX+sUUVaKzQ91T8r4W7OmKQPm5//hW1qoExRL/dj2t6OtOOi9rpJsqX07ntkiYVRmZz0w+9HgOybPOpC01hGRJC2hWRehZDjnCSx0WZuhraip6zWCt65itq5e0jEfnyIxIydFTmP0lRiTkwHXAd7cmFpYGm3saQHJADLgLRFhs8TnwCqg/h0DdXdlfAnddwmhhOBuV2xnpovh6erDeZ+tQHtUwScDI0rwRLwmdgMD/F8Ngtsa69joHBq087IlctzctyrEKnUziseOc/Z3ckGw0ImOuZWwpwVyqHm2Y/G2h4/bwbHltlfWh3EDhSTH7vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN3uSkyibdFKMN6Np2/ZquJ6pXl8uqSDYP8RlIN8fCY=;
 b=irfNpGWz68F4py4S0LjA10qP48EhDkxKquidOrsZJtWHZbOybfgFVHzQLSNp/qj4/WT/8Qnblw8ItdRUTBhISHtWthq2yyUqSWPp/9TvANRBiuDiFkS4bXiC0HRr+YlcBJTzJStHo+VswQVpC/Rwxjl8I+3BotNpFxYfmzSiR5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB16763.jpnprd01.prod.outlook.com
 (2603:1096:405:32b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 01:53:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 01:53:35 +0000
Message-ID: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org
Subject: Question: how dapm should looks like ?
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Jul 2025 01:53:35 +0000
X-ClientProxiedBy: TY2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:404:56::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB16763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d046b1a-e592-4ac7-1263-08ddbdc24030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4PilfpapmQ5bxWVuxr0HBZlU6EwasKEV/c6jp0ULaT96S6fX2J5Mvm8ymFuf?=
 =?us-ascii?Q?9KNBJxUeMTybsAtViDiiefYXaFojGf+mQ8fGfCU/nyNnXOgWo6RWDYg+t+Bz?=
 =?us-ascii?Q?b3zJ+GbXESUpK2GldMeWIYF/fjK22cahlgJCFMHwxsp1ZnbfSyQ+JcF9QAQx?=
 =?us-ascii?Q?A2pOkqXP/zUfj6QsRXhXReNcirikx3ysRRn69xgaE2Z353IwzNe0abRB/yuz?=
 =?us-ascii?Q?atuQ/+1F5Im6IDbPxqYxh7Q3QjB636JPQiJug7Z0oAu6ekGa5ViucnSzr6VO?=
 =?us-ascii?Q?9eZBoL8m8GIwbsD5vsHnQbvs/ax8y+PlBfuxUzLP9RMutGdWYr/x0iwEGMog?=
 =?us-ascii?Q?vjPhVyMjkoJWi1rJlxqcbaJrOH0DDFfP8TsKZ96V6nd62dsd3pApwEPx3lRv?=
 =?us-ascii?Q?u7gRTe4465NmgbuYHUMvDGZVGV+9p+AS4oTvQiOVlnTKC3P2KjqOOw2FDMOe?=
 =?us-ascii?Q?+TdL5uTpXmR7aQsMe3EMumT/UYKyevNDDs8ogxeG7sQ1WUOxyy9ZmxRh2Wvy?=
 =?us-ascii?Q?2gtKpTAqQ3/tNIvKlMcZsz28kXbBJoZgKwddpsLya899V4iybsESinX5CmYN?=
 =?us-ascii?Q?Hwg1hWU3EIiU9UejjsUTFmh09n1Q5nU343R7kog6vxQWCa+cFfPLYpa9i1MV?=
 =?us-ascii?Q?70f+7aSIsUlbRRlNxd1WcvnGyKr9wj5c4P01zl1tp0WrR/Lzml61YQuo28qV?=
 =?us-ascii?Q?6oq5VvjgqJDHJQ1b3Xak7m0ahs6XlmBsR8glj6FgY1aVlSGegnZMLXnE/SA5?=
 =?us-ascii?Q?X/hgVceVsGo41xGHbv0/1o9UCPxVHOhoGtk6RJaJby9U7QslHuFv87f/kbw3?=
 =?us-ascii?Q?Sol9kShd5g3hJLvEmBm63gz8HjM7pcQVxL5fD7Bj4fq+I+UzH40b5/WCcn1V?=
 =?us-ascii?Q?41M80PlZstmVDunqp/S9igNcufkMreLKU8yc1wuKS6njQ1qnLuDSpEiUt3OC?=
 =?us-ascii?Q?302+JkKbUjWrvFuE+CjM6PKAPdG4UkBEpy6aEUjfciuSpteoUYtewb5Ci213?=
 =?us-ascii?Q?rVSIo2I25BR5jrKHwg4vCLHFCZoiS3Oe56NYXat1ojNqoyK2wkvj6kNAI1wE?=
 =?us-ascii?Q?kknmkZF39vXs58FWU7cGgRrJX4O6D3ACYUXLWfAQqI4lFecVSwnlgk2oh3jT?=
 =?us-ascii?Q?0RJrAKfeaeGbzgqXE8iDcP483tiVz0jvD1cNIj008e0r5NWg2MR1i85ErS+H?=
 =?us-ascii?Q?k87I/A4DXaCBZpYjxtQmHodS0KAQkumqW3k51um4kXEk0TtFFHVhDNDYa0wJ?=
 =?us-ascii?Q?6s1H5x3J+26vItKMtR8giKNwsS7afUSD9R1F08LkuEeQWEsMsNf3XapSNoca?=
 =?us-ascii?Q?U7kAIBa+Q7EA2iK+odSupTlNQeOJRZCH1fSgoHSw4Ob63NWfDgkL1Z1U5jKm?=
 =?us-ascii?Q?/8rlq974C5OLKdiA0MzuCmcamjCcC3MBZHOOpQ7mG3cebf04WByd+jHUknhF?=
 =?us-ascii?Q?vl0pjP+CADnHJnMk2zejZmU5bRLM6Zr1zk6JHtICYHZI4bg7Z3B9dA2cQgge?=
 =?us-ascii?Q?yaTpSO9PJCptgZQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EPnlSK00I4Jobc+5epdnxgnIYpbS+CCdtrI7Rvq4LKy1qoFu1Ly3NoRhqMCL?=
 =?us-ascii?Q?P+gNp0L2rXbK5ndQJ00tFS8ON7oZBjOPnKUFfRX7jF3LcAa6iMysDaG2RcyN?=
 =?us-ascii?Q?HAgWXd2k78T4tqZAPncyuN1zyUbFYamurinurqnFF+D378uNIZSpF+lkbJhA?=
 =?us-ascii?Q?klYNF2wFpRRJeMKR8ZqQQHtgFfkaTOxFMpsZfWlDDZWh1C3Mxjet+HQItE8A?=
 =?us-ascii?Q?R7Danf8hVpHguR2C40SysD/o1H1CQUssSkV39DkmnJ+bngki/e1xv+9JiJoC?=
 =?us-ascii?Q?PwgnZOR3Qj7L9gu5tGwy2ua7mu+sHcXpTRYDN93h9+saL7LZa8OdhpRI4T3+?=
 =?us-ascii?Q?NLizzke2JsnEnb0A/+ygOB1sT6dX6gh6U3FfnqMZ7jlb3A1MeZQijobtw/im?=
 =?us-ascii?Q?WNpy3udqmR34HL6zKM3Z0Y9XvVS6TtOC2p+fSmN2s5jxx60jK3EowxMu+X50?=
 =?us-ascii?Q?AUoRujDzF3q908cMkpXUXAiK+c6OSuDV+aRw4+CKrLlRng3k5gIda5mYaf82?=
 =?us-ascii?Q?DSrinIcZqKpcsL0EfwkMcdv2yOtS1LKKU8j4OFVvZIFMUU3jtp9FTCauTV5I?=
 =?us-ascii?Q?lzg94lZbhWMfkZyw82NPi6XobMa86NhpsGFoFuLKFjd9dXHKNKcoMcGpa0pZ?=
 =?us-ascii?Q?rWplsPQLfFnwveYkVBDTomu8vTyykNhWp06R6S2Fxj/3cf/3nJoLVUz/oJsV?=
 =?us-ascii?Q?INDyI3JLsPTn04/aS/XnFY1v7Dpx04CUnfXFfBjoYA7McFPZHTVO7rUUY29a?=
 =?us-ascii?Q?Lgk8a3BjyF4i8Irz+W6hbyb1Y95jBGo5DeJzyyjkRYR79APPeXzroIOLBVq7?=
 =?us-ascii?Q?SdsmfHaI0K+9Rm2uQd/3+yFeLac6AqoPAdPDaVwOL59ZFCNrMQLKgURcOByY?=
 =?us-ascii?Q?MFAlbo7xVR7z52HhvxdP/tcLlrRRk0ac/QnokSsfa7kpJaeuZNiImhOw+OCn?=
 =?us-ascii?Q?kVp9NhbGbzF6yHkUJjniqwOPOI0MQQ6zPywHnrRiPJYM0lSW51oLGOjIH62J?=
 =?us-ascii?Q?qNtH3+BmiCo0RzCu48SxJBpLHWVwKP/Rt8lrzL0LZaCploVj1PYoPIsu2bjq?=
 =?us-ascii?Q?9b1bZts1KWxtzkJxzLYbsi6AreRyiqem4zucACFB6kElhtBumYrju1qt1cpw?=
 =?us-ascii?Q?1FpcdzzaiqGzmARgv5amNGEukCR8SBpG1aiS6iBaN3wm/FXx+yEbpZ3yRzuE?=
 =?us-ascii?Q?3WxSNAGml995yA+a4BXcwxIcaj76PbBhEpBv3uscHIWJ6NMebZlkrIEDvjmT?=
 =?us-ascii?Q?/cZpu7idu/VkSnhCrU/z+1cQxcdgU2Htpzmvw4WG2wThar28JvrEP8WYcIWb?=
 =?us-ascii?Q?G36QnUH81etsdL/7nRhsfC/LmUpY9xYKTFZstTSqjheuvRH+jNRBxZkRO2gV?=
 =?us-ascii?Q?qzy5kv0aHU3aN3EPHFwjkQsAtXDbZz4Ci9ljda7Ffo1n602l5tj6VutDfdXY?=
 =?us-ascii?Q?V/CF0fSh5WOcipScmLlK8BxCnLGILm9jqh/U5rZ2BFfPVLCG6mYf5JZBKFcJ?=
 =?us-ascii?Q?Ovg51GhUdtMdD3b3JBEO7H3vY36jFTtCF2qAO5HP682EL5kKLG24kDUZutwg?=
 =?us-ascii?Q?KBIqTDTDEUg/ngivAA2TdGq4bMZZ1qVTBLTZOLJep76RbraIPu2YAkyDS9RI?=
 =?us-ascii?Q?zLcx5Fz9+xflc+UwfKuuAyE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d046b1a-e592-4ac7-1263-08ddbdc24030
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 01:53:35.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ej0j4Tu+qwQepvCfuAHIQZMfIxz8Oq6OQxHTfCfgevAJRPrES1fia5cOZphfXcpVWWIk+9mKrTKpfh9L2kqyJU4viGCaeenKI3bkXy0J98l+Ue+jQVnZYC4fhpiTQfZd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16763


Hi Cezary, Mark

We have discussed about hiding "struct snd_soc_dapm_context" into soc-dapm.c
because it is framework internal entity.

	https://lore.kernel.org/r/87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com

I have been working for it, and I'm happy to post the patch.
But I noticed that it would start to affect how it be used, since next patch-set.

If we assume that the struct (= snd_soc_dapm_context) has already been hidden
into soc-dapm.c, how it should looks like ?

"dapm" itself is hidden into soc-dapm, non-dapm can't directly access to it,
but it provides access functions anyway. Should it be accessed from Card
and Component only ? or can user driver access to it ?

This selection has big affect to user driver...
I have implemented as "Pattern-A", but do you have any comments, favorite, etc ?
(I start to thinking that "Pattern-C" is better than "Pattern-A"...)

Pattern-A:
	User driver should care about existence of "dapm".
	This means user driver can use snd_soc_dapm_xxx() functions directly.

	-- user driver --
	dapm = snd_soc_component_to_dapm(component);

	snd_soc_dapm_xxx(dapm, xxx);

Pattern-B:
	User driver should *not* care about existence of "dapm".
	It is encapsulated by the Card/Component.
	This means we need to have wrapper functions for it.

	-- user driver --
	snd_soc_component_xxx(component);
	snd_soc_card_xxx(card);

	-- soc-component --
	snd_soc_component_xxx(component)
	{
		dapm = snd_soc_component_to_dapm(component);

		return snd_soc_dapm_xxx(dapm, xxx);
	}

	-- soc-card --
	snd_soc_card_xxx(card)
	{
		dapm = snd_soc_card_to_dapm(card);

		return snd_soc_dapm_xxx(dapm, xxx);
	}

Pattern-C:
	User driver should *not* care about existence of "dapm",
	but can use snd_soc_dapm_xxx() functions.

	-- user driver --
	snd_soc_dapm_xxx(component);
	snd_soc_dapm_xxx(card);

	-- dapm.h ----
	#define snd_soc_dapm_xxx(x) _Generic((x, ...),			\
		struct snd_soc_card * :		snd_soc_dapm_xxx_for_card, \
		struct snd_soc_component * :	snd_soc_dapm_xxx_for_component)(x, ...)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
