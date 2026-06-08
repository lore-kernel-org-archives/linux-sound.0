Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C241624DF
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881872; cv=fail; b=MQSPrurBKiHpOn0taa4FVbSioNWbQx0TRqyV4J8BqC6++wr/6AjW1QTZgvbuxmqSnB8sgmKR0aNIv5aaM0uJDYXxxPP3S7CweAuv5KQBLfM307mP8HsHLItOrnrUgdDIQylkA9obKWEgjY2Mrh3hSz9m6dekxcCHg3Hgnctwnew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881872; c=relaxed/simple;
	bh=0Zhk9+oJFpoi8O0WdHTEVUwvcZ6mqTkfu1TPSLVlJW0=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=tlebEgbPwoRb249AOZaRw4azMWdfkN0buwBU7xPdPc9e4uYrNztUY1n44tIczMtOkT27KkqyuRMsNCFDnsR5F4C+FT3vjkL2RoQu9cfdBNq7I4r3eE1QGkz4sfmlXz7vwgv9F9XXA2xEXhhdnRbs46aJoHFTka0ELWjGGLGmzDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p6L9qGJJ; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p6L9qGJJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TA0IXvHVWVpY0AP8Z+5yUwwxMI7RJdgd1KaQPqwdx8/3GTDN693484dUKEV697nD8yZhfJ2LlHUARBs7qABrbgprCqs1pDGo8KCrTGkZ1pm6HzHJZW4EiZjJtaPkYtEAviRwO5bjLoOC2foglaZQkTnnkJKBEqy9JwlM7SQwHpxFmWGwmWlQ2hslvhiwbxe0Ep8vJzFXQpbtXU5DmY2gi0TAzR1MfQTJzKTCWdjVS9mzcGtsT2tnf6RlQQuoRKoM57cDpGjj6aUO14erPtSvSZprAST2CfWIBCpJ7NE39eKbzmOtKZZZGFqCV/IutaQjwVhObieBD/CN0Mqx5QeZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMeDOhfkh80IEO2nysZr04NGD1IGG9OBMcCFTwPblPE=;
 b=qXGkyNA/4fjNZA1I9tmwBcu1dU12tzFN6SMIjUa2xnMRC9BfOR/tbLXgOfd0MDbLRNcfDGUWJaIazGtggGjgBazlaXFDLQOwLD0ovI4jFaxYlj3izy5K1Hum8jjyFEqZ/n4aMYYh3l7qYVcPy53FXAQv4alAvMAEBuVfR2t1YCJ3tDd3tuvEZYiUkMv0l12QyynM4WzH8g8M1XqQgOVXMFxL8o2ZiYLqyD0JRfUgE1n3UQvqkIzVUj9ckFl+IQHZd6gDcfpDo1+PEtb5GsUOH4IlgctUA4Gm/YLsIPXR46nvPCTJN2aLdT9vjepID8pJNgAENjaQoAS63mlrQoaatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMeDOhfkh80IEO2nysZr04NGD1IGG9OBMcCFTwPblPE=;
 b=p6L9qGJJ/rYfVoit4rjfGpskFoYmJhjiCL4xpPx/0cHX143ljm92kVGnpCjEhNVA54uAscDh9MXOT6UEEYfn3DAkkNK6Ef52mVAjlLwuts/eS8OUF5DlCGO4ZhRzJZJLhtj7gRcQVJyiEvXaE6TJYfWclvzE+Jv3W5eDe5xBzdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:24:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:24:28 +0000
Message-ID: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: mediatek: tidyup details
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:24:28 +0000
X-ClientProxiedBy: TYWPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 19bfaf59-4459-45ce-0ffa-08dec4fcaf50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	kCyamPGtewyW2A8PGambdX5Az2IIewKmz5Kq7G6dTspsxyUXCFSnh1dXl43CtUsqiIXvpZg/pbvIYa53umbcOcXNsmMI9zUwGVGYiVUZpKNnIsTC62xIqem5nzODMmC6NXgWGGjQZay7fBldfbKxBqsRvp3+EIIHlaFs9YQSVObtrCh9xSoZN9zxDYQnfkH0oo1byNtKow5CWYNmVZyvjHcCt6gI/5yHHNOrtPz+zS/79eNvYKi++ygevgp384YeXMYQFBBbnecCxR8biS2tHqfVoRIzu1IOQ9LGAm9DlAmwIXjsVNb/6Wq7OtnGXAv0PYx62hx98Yo8BiS/Rkg7YsCWskuZpCq3BYkSsjliVNIJlBH8RhJjvbAvpjGKrgZbSf87crp8T22WEoJ2OYCbSyG0n7mi969pBiGJk/xWZGAYy0t0ileTw1EqmbuyqpQOZxVm/FqBSdqRVKUb1Oz0nLVslLYyQ3km9PzSCpJse+YGnhNJ24LYBZ8T1bhn1MIGLQMOi453/psqrcI8dsWtxEPPUjmWUX/7WePR0Jz6cBs/M4sekqL+9KS6hTWLkCD98JJ7t9fe3MEthc8fmm57SZuHK1yzTj29mLgoiQOPYwKAsUQlPO9fv50Hjp/2TpR2H4YLBE5qKb5X9MeGDVQKb52HHlm0v+ySDScT1vLB3e8pyJ43kZXVnrgzuqGMcv1usf2HoeIBcQVMh2pQf0qzb3TGhaTu0ZZMKJDlOSHkC7TgkVetkF8ZwzfrfJL18m+E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jgbvYpIPlr/0VujQPqAA/+uH5UgbC+ZdL31jDhYRg9Iqbm54wsM4gik2jD8l?=
 =?us-ascii?Q?FgJtzQAwCBPTh6gpyudp+GPljSvY2TxQEmd6qgZQHYVzGB5rD2rCTQtxZz4D?=
 =?us-ascii?Q?3rxrLWOflqn9IkqOa/OZITDd15z+BCOs+tRhh3rrqa17PIbcE7OHHRWXbXO9?=
 =?us-ascii?Q?org7vAZ1SJ5viukHB5ggdc6CgAI1/+Q2FlEe4xyzCXcgCqD8vO7oLKp4A5GB?=
 =?us-ascii?Q?SBJcv1QXev8EAN/AEHrp8JStkAW1lE5miz322MDTjiRzoAnit/bHxNDzrjCm?=
 =?us-ascii?Q?55h4sXt8lMo9F8Mfr9aA0N+YH7Y/gW9r6gdaLmegkGjzDbZY1Ub8FtlRdK/d?=
 =?us-ascii?Q?mhfvOXvVwPy1+MbvyVY35KKdbCGwcX0iovzbcw/ptMmFirTR68jxIWrhMQ97?=
 =?us-ascii?Q?vgi4K8YPJTIYEMVYSA+1HUASojaY/FUja6OI4dcw4uHsJ78fHXvPos91pxe+?=
 =?us-ascii?Q?l9wSqzCOpfNKP6kMMTNmUHRmkaGvsaDJc1iG7R18dj3TkJYwBZGJWgxGjRal?=
 =?us-ascii?Q?ct4hA23gaGElUM0TVUT3OyicFtmirZuY9O8Je7+m0ZOXwNlCO+Z670qPTTlm?=
 =?us-ascii?Q?y7/VYf4ZeG9mTp7Ak2mMnNjYNpkS+pCQJ7PU9pwxnfDLa7DG6LpJRRvvx6lg?=
 =?us-ascii?Q?dfXUJMshMnfA0qBJR+1CRUhwmLT1fWOS8vKS0JXIHOG5LCnTrkFOVI0pM0UG?=
 =?us-ascii?Q?sT2/QdcjYTBGFA7W20Gh/U5KATrYctO2hSet8Z49V51iJW9N7nRXtyoWdV6n?=
 =?us-ascii?Q?8U26azeSkhl6cO+wwwbGSKkDmTVKp6YY8/0iCwrVwen2oOIivLQT0dHi1L5S?=
 =?us-ascii?Q?Z3C35a6sh19fG03KGSr0XH1lTUZ34QjZ6xVwRJC/I+9Ww8/6q/POHYc5lAHm?=
 =?us-ascii?Q?pecj7SYkYna9dWzs8CfQ9KGLJvVXlmx2pdhFx1fWIWZ+X8IgcTNpNl0Ue+ad?=
 =?us-ascii?Q?7lW6a9KqOZqdz4CzqvHpeyhMpsL6e6Tg9rUNI/BTMJnV4NY+XJmf2uji/tzS?=
 =?us-ascii?Q?bGDppeKRqZ4kcpfGxirO0Yihke+dqSkGHaL7VmXUS26RAaceEQhIG6DIZS/+?=
 =?us-ascii?Q?2d8bmwnVQ5Yi3zflgmuP0OX91CgNfH2Xe2eKY+Oi7raaSoIWmh7kQYKp7uba?=
 =?us-ascii?Q?O95bSyk7YBOvvSxoQCxrm/ylaP/srNfi+tAmolTdQp+YH8Fe2AROYk63VMkn?=
 =?us-ascii?Q?SSeyYReMJKHJlY4SKMYOy5x6HGRQISJ31VKgedvnqyQKll+Z5Y6BbqtuKLKG?=
 =?us-ascii?Q?QVL2LiTLpC+onDtK5KR0JSawbXunVrximvhfSyA5Hc+p2sPsVY+B0Gna+D9u?=
 =?us-ascii?Q?4mzEK5yjgmoL8u/WDkcPUCm4/ZCuMeD2Jei66chLxMHp/CY/bmDg1vfrIkup?=
 =?us-ascii?Q?ERBBMNTjBSL0jlsXE51QXpNZoXcEB0JfFLCx73tyhkr9Xvzd1eUmz1kpZKvG?=
 =?us-ascii?Q?Ee90cJHkXq11Xh+PhKNphnarKbnMYf6RUjSzaXY5MQbLGCPANx7FmDSjMeFm?=
 =?us-ascii?Q?NuXmnVI197GXkTGC4mqMd4+fLv/UG+IhjA/d3c2qwI/BeBKJjTdwTNUTy4kU?=
 =?us-ascii?Q?H7ijdl6m85a0/RJkN1qTdzHvBILKZZpW2zgWarrrtmzRS4KQhuV6VJ/hd1tc?=
 =?us-ascii?Q?BAQzOGHRq61na+EkAG7S4TL5HEGdwqxEJwDF7hC6kQRBVNLaA0g71/FwXo4q?=
 =?us-ascii?Q?N55+Xg6RfVEUYqjbzStZXAWlQs8lRbRI9TrP+5s1t2NhrhKf3MT9vqd5M2sV?=
 =?us-ascii?Q?dE1o9ymQdN9L+MB6KPcHG8MXYEDHVvsCAEKJ6Mf3DMQKqKsQ52Lo?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bfaf59-4459-45ce-0ffa-08dec4fcaf50
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:24:28.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WctYyKW517u8SsKSvyxdMgfDL75spJ6YiZKsNgrv3A7RLqTocT6xX4nIAAIel7/VZGF2k3Xfa0ndseFJ3ULBcBiK0UQsY5fz2MFy4NaNwhNJKbtcIkAxmTTcMNPMPEYb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Hi Mark, Mediatek developpers

These are tidyup details of mediatek drivers. Basically there is no
functional change. This is prepare for later Card capsuling.
This makes code review easy when Card capsuling happen.

Kuninori Morimoto (6):
  ASoC: mediatek: cleanup mtk_sof_dailink_parse_of() param
  ASoC: mediatek: mtk-soundcard-driver: tidyup set_card_codec_info()
  ASoC: mediatek: mtk-soundcard-driver: tidyup set_dailink_daifmt()
  ASoC: mediatek: mt8186-mt6366: tidyup mt8186_mt6366_card_set_be_link()
  ASoC: mediatek: mt8186-mt6366: use *dev in mt8186_mt6366_soc_card_probe()
  ASoC: mediatek: mt8365_mt6357: use *dev in mt8365_mt6357_gpio_probe()

 sound/soc/mediatek/common/mtk-dsp-sof-common.c | 13 ++++++-------
 sound/soc/mediatek/common/mtk-dsp-sof-common.h |  5 ++---
 .../soc/mediatek/common/mtk-soundcard-driver.c | 15 ++++++---------
 .../soc/mediatek/mt8186/mt8186-mt6366-common.c |  6 +++---
 .../soc/mediatek/mt8186/mt8186-mt6366-common.h |  2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c      | 18 +++++++++---------
 sound/soc/mediatek/mt8365/mt8365-mt6357.c      | 10 +++++-----
 7 files changed, 32 insertions(+), 37 deletions(-)

-- 
2.53.0

