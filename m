Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793155380;
	b=IWq9N6VkLLWesTLXqsFhDJZc9CnbNa7AyJ9ukpAhlZAIlkZZY3imiNcQCOuDgnnIAQ//
	 XDr6+oZ1LwpdLQJhPU+45pZaeTzt+LWOVsd1pUcgc9VTE70WydgsrugKu5V3EQ1UAJhME
	 +v2u3RoI2atQ1W1Vdqg4o8XOM9Lij1J57nJVmcaOMv9xL3nw2MlOIVaGUoX/gd1dfFfEy
	 w7jQcpElV8Vu6LVJEJj+ZShkyGdOMr5bgC1zo90qZW563aBXBpfk+ukKfYzNYF2LzQ3FW
	 rRRAOY+nf5bJ0KtcvY9edtpNqj8STRoJArBgJ7DZbYjRPJE/ydjj/J7TOCwsZJyDg4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155380;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:Content-Type:Date:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LMiPd2+virPkc/+cX5RG/1mhNxYgx634Ue+jZEEQ4Q8=;
	b=fTzo6bVIBCOLOXn+ybFhnPssIKcQTQZVFzrcOoCni92RSznP0NOwn7w6Bc3gCqSImSjN
	 6Rv5KbLp9/zB/OBUZ5EY95fo3F+Vi07ddujHSUhqH5r9SAABTv+YzkwfEdeef4qeX0iq8
	 EM2a5jxPUj7kIrtuLtfndPmMRHMVveTEUBCs9Yy52OZNsgYBaIGDULo1EcQzCEEH3Shjm
	 Eybj9inJrcxUgj2bvbFnaKI2WJPnxaiqaAZRK64p2j0W9mZuOi6YSDCBeT8aJg0FVC0jD
	 a0663Ugcgu6a7z41eK4WzcqfivxABcfpdCBK8HOm1ABqjcTfCLHpqr5Upyk4dElP29g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nh4n1y21;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.0
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D33606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nh4n1y21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1AcPFE3sGdnKjo7jGmfGXhlu8M/aO71PKYL0mDqBZ/wGZYSKjbLU7TBNxyKtLH/wqHWBuRrOcJIx+xvXrf2q0RyOk+iirTydEx+gXpLg/emtWhcI5l0uGvrLURYPaMRg4Y2OtxQKR3MqViWWEp8ZJFpxVOHMguSSoAEROCENIGgRSO72Sp5OAGB0cfJIWkzlPF0xVog+T6ZfzBUMoarz/emZg5Tm3yvm3XvqpGKCgL1QvByCxvtgTYXxZeGOHbq6VBM2Sa8cayu0yW81l/XdnfBZmn6jzgrtWEDNxoK+5dzWof11Cb/jFTQaBR6lawH9+R1fmVLeXyakne8yUWFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMiPd2+virPkc/+cX5RG/1mhNxYgx634Ue+jZEEQ4Q8=;
 b=lwd9ZJnulKFSgsOlYGlGe4C/wceTWNMIkDJ0t7TDv//0/ggskOe50WGFn8Lx3Zh/37XpgDODTiqIwM3UGDO82tHS53vfZVUSZKXOYgmozEke3LpXpf5GOYAAXgk/nNb6rh5rRmUON4Or6z0GuEJQTKQRO/Z3r5hKmG3I3rlmG8guIF1YiBVlDGcYZfE3nSVUqMpBhWFtrc7jfN9StyAI1H/iuOr5WeX/bz19SdrPGWFWMQ61sPfG+3OWwWlHlxVHqY7+RT14ob5L+BK5vOKh0OpZd1b8cT0zQW36tWuZgsfcKNF2rEY8L5BNOwUXNCfBPezLgVytYeGce9lA+mPHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMiPd2+virPkc/+cX5RG/1mhNxYgx634Ue+jZEEQ4Q8=;
 b=nh4n1y21/PZg77WS5ZWw9bs4gBvTWMnaSO6b4+AUf3bfd2LrJK+Md9vcFoqGxuwEn5JvB5ofgcXT6Ps0HtWXqvwiT0cSi4qyACWRHzV2HsV55g8DPtsl6slliWMcNQlXxVi+6CzRkqOHADZRgqpaKQloWrAqKYrIdu7/RjQjJxM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB18530.jpnprd01.prod.outlook.com (2603:1096:405:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 02:42:56 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 02:42:56 +0000
Message-ID: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/15] ASoC: soc-card: move snd_soc_card_xxx() to soc-card.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 02:42:55 +0000
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB18530:EE_
X-MS-Office365-Filtering-Correlation-Id: d8960e04-5be5-47bb-771f-08df349d2bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|261026140227099003|38350700014|11063799006|56012099006|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261022105027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nFb4LNfM2YN8mdD3LivOh7do7jtC83naJam5LC3hEtWdS8gRsgf74sYZPaYLPIWCCzLc/gktfwhANYRWp6t0gZBltmfTmeiy/jScw3teRewqtGADVuYwPsydNcO6VLInNDXovTYaa7mYXCyAMDryaiLXjbwIC0s1WKUz03AdeBkbRwVVpBe6gmAp0vAUniHaKei6k4AEZ/Es12o/hNvdHov2uGr73Lo4YApgtePZXSxCuVtj5iy8bWSO24iGyw4K7kIYBWVJfAPJJv8qR56kBVedIWojTMSQqTt7ptGXYREKgYTdaOxHED2DqGmOOzTKQpwahF/B9bPyVNIrq60SfsVU8F83tmp3QfQY/JjuABAfuUI3/Nyf7eYyl4m9AvrRYcY4u2lJJMEMEtVFh4IQlUqQkiWKIUECdmjZyUANAzuKBclNmCkAtBFOzBFzeajn5BU91ApLiIz7FTPNUMKzxM7ACEOi5Pc4Xs5whc/ZVPdjooocT5/MAmbO25C05CJdHLv/6XUab8PZZnRDDzNtby/zqRzDq7+pXktpHhsKsp0n+yOZgehK+J9SBP5YGEqBTnR97miO0kGcQVQRUve09GQcLzhK0kzZXDnT9Z4nwG5RA/4heHdSYbVSxc0mMNke+4O/2egCNcZJwI7uSiZxplw3Exw6FTu0m3TtCuMpPO5DGDUHU0hM7ibkpG68COoypwMXJjhhnNEwYGFk9kHCtL8f/EW+b0dqzc8Zys1Sl90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(38350700014)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W3y6VRnlPjxSNnZs8VBa09efOMIT2GQ2+xMKee2z35xbWAZOT+b1fOvPQZFq?=
 =?us-ascii?Q?R+wH3gtdsYl29u083hIlJ3Pzb52g0b3IVvnn/8bTgbY4EiKhINGBMBgWSxM1?=
 =?us-ascii?Q?6CaNMFC+n4cidJtZLaGaRY2YkpVdicX6dNEVqEyuCojIxv2u+LAhdFs6BdSf?=
 =?us-ascii?Q?gZ8tzC7QJkER1HeP4E0wjgemzYueESPZbZkp6QmrdHIxlubHW/lgqP4uZknJ?=
 =?us-ascii?Q?zXSFlhZPdLSZ05lbrBgvT5D228UmRa7i9T0f55mhNX5TDBVf4THDnwNEtgv/?=
 =?us-ascii?Q?L6gJ+/zH/tycnk94E4icPP/Xg02gOaR9h/nx5qrKmtowP4DK6BytcEfcLUgh?=
 =?us-ascii?Q?iF5vwtOVyAZ0EKNkB+kISVJrdNZtmxmWVeIBu+2ZvUgDjKtr6l5+qSbJ9sMt?=
 =?us-ascii?Q?3SWIoaxQJWS9m18Pwbkrr+jBYC47UfhfXhREH1oDkyNDKm3o3jUfaqcbhyF6?=
 =?us-ascii?Q?Q6SMRIOrDFZjFfEiZhtctEt9nUc8P7HhDyMD7aodPfv75kiHMIngO/ykqSfO?=
 =?us-ascii?Q?ougMXDH/kmUGX/KfuanDTwqYFSau9WVNUIHYYaR0C6vOXJTz0d+52dzPwiiI?=
 =?us-ascii?Q?2ygHvlLnqUUXSu5REYQznuzRP/o0SYUIkvmVjhuEqurZYmvhOsnVspRJ90Xq?=
 =?us-ascii?Q?SsLaylA/MvkU4jHnK7yBMlNc/f1zWfaqCpWjF6Zr4mbIWeI47qJXNkcD55sT?=
 =?us-ascii?Q?gzZpHLRZs1+lOxeHw4JIgK3DIt2wBJE6S+7E5QdJnCLnBMVU8qJErFjb9YGY?=
 =?us-ascii?Q?WIbLC6LugfSXaH++SRyzZCzI2YxUseGYMp9dMA5Ya0FFxl/7hYcXj4grKLru?=
 =?us-ascii?Q?I/yo8vKplbXLYNKmQy+gD/P5AicA0vZlcbSzviXqkHhC2m8fFg32y0XKxjbP?=
 =?us-ascii?Q?7rgHHFTjJdJ0b9ilEVQHkVbRY0xm+2zTRm0SHAqlAHPnB8rzB+bnJRbfUboX?=
 =?us-ascii?Q?vxPehFPF+EKdASRiZxUZkpDFWQd3lNT8jhTkv9uT7EvcS2aSxTl/WeIYG6Gs?=
 =?us-ascii?Q?bvt6zW1RjQnK/yTOmkZ6P8wI3RGm5DTNTBpSTy3roCyT789IY3Q96sen904D?=
 =?us-ascii?Q?RNzLiwnsNFv6Ebeb+EkNsKla4ckb77jclrHWjprOvCWAHTG3jfunWKmqjQIX?=
 =?us-ascii?Q?y2b44vf53ZwLmG5rMJTG7mi9R9EV4phHCmDbxFguKwYCelBeF0du40Ff/Che?=
 =?us-ascii?Q?rep+ixrBy+CY5lzf1G222Ym/RAAd0L3nspw+A4WxTnI/jhbd7TFkqTQkzhJv?=
 =?us-ascii?Q?BR9c95FUmF6W0Wq9Zt1gPQqkPEECk4UmGuj2+lg7yDlrBGVk93P04Ytbd8lS?=
 =?us-ascii?Q?fD9Figbm6OnQw8vpDk5vQnsPox7n5LEYgO/nQczVOe1NbR5IrxCxBfewPpDi?=
 =?us-ascii?Q?RMdwlTdtkaGj30F+Qx3YowcCn3p5S94IqCFWb+jjJAqCXgjXWYs4UzuaRgwG?=
 =?us-ascii?Q?bgXJrWMHxRVYWt6FriUsrtzNcuy2j3Fzk+3fgiohH7lkeZ2dZoE0YihNHCK3?=
 =?us-ascii?Q?SjNekTPBH03qIyF85RnEqxVMJA/P643T6ZW0tL+w6wER7sj3zqLEo9CnxvvB?=
 =?us-ascii?Q?qVOmPwlj8RlUXMpRQ1zC/aOogQVUaWgVTVKCwAXEnmWduMtviAgazgKrbQKf?=
 =?us-ascii?Q?BtPwF97vTaJjIlR04HB/wke8ug9mxbE5GrpUtFkMN09IF/vDVWlUBWWXmDBj?=
 =?us-ascii?Q?anuEDlCgpS6l60acvE6aSOaDNnioYZ54mjiH9XcXN1mvL03MpWa6DVjz2eLD?=
 =?us-ascii?Q?8sS5Ot83vX7ZzMFzjc9VvMWPHett6icHYZIsdx4ct+rkPHyKTicR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8960e04-5be5-47bb-771f-08df349d2bc9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 02:42:56.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQZ8FtdI1DLT6Qh9qCdzyR+kgYpj3KM68ZSbSkZB9fWX2zf5joqAW22b2+aO+6sp+9vZElT47mZzyutze9Uk+rtB4E54XdH78hvvu9KGVZVgP0usFwEoDPJKT8Ed2ZXM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18530

Hi Mark

I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.
This patch-set moves Card related functions to soc-card.c

x: done
o: This patch-set

[x] move DAI functions
[x] add new DAI functions
[x] move Component functions
[o] move Card functions
[ ] add new Component functions
[ ] rename DAI/Component list
[ ] move Card functions v2
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers
[ ] Capsule DAI/Component/Card

Kuninori Morimoto (15):
  ASoC: soc-core: fixup snd_soc_dai_compress_new() return
  ASoC: soc-card: move snd_soc_add_card_controls()
  ASoC: soc-card: move snd_soc_card_debugfs_xxx()
  ASoC: soc-card: move snd_soc_card_resume_init()
  ASoC: soc-card: move snd_soc_card_fill_dummy_dai()
  ASoC: soc-card: move snd_soc_card_init_pcm_runtime()
  ASoC: soc-card: move snd_soc_card_link_dais_xxx()
  ASoC: soc-card: move snd_soc_card_link_components_xxx()
  ASoC: soc-card: move snd_soc_card_aux_[un]bind()
  ASoC: soc-card: move snd_soc_card_aux_{remove/probe}()
  ASoC: soc-card: move snd_soc_card_set_dmi_name()
  ASoC: soc-card: move snd_soc_card_bind_call()
  ASoC: soc-card: add snd_soc_card_rebind()
  ASoC: soc-card: make unbind_card_list static
  ASoC: soc-internal: remove temporary funciton defines

 include/sound/soc-card.h |   2 +
 include/sound/soc.h      |   3 +-
 sound/soc/soc-card.c     | 890 +++++++++++++++++++++++++++++++++++++-
 sound/soc/soc-core.c     | 900 +--------------------------------------
 sound/soc/soc-internal.h |  13 +
 5 files changed, 919 insertions(+), 889 deletions(-)

-- 
2.53.0

