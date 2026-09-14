Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B52D5408
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350188; cv=fail; b=CuC7Xuj2pz+XhCTFWymS6a6eiCJc1skkh6y3nUkAZ+XDrIrqgATw2RyPnzXO2w8OLARBjxgHU01c56hVpCn4y/8IcELzLueor35c0igDfoCWr0rLPyadFXX7rQrpuVYz7M6fQBORupSF86DhTxYYWqXUCXHTxrQZVJCLCWpJfO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350188; c=relaxed/simple;
	bh=yPDUCELXuQm1SBM/OoqDbjm73TbY0Qe77++0Xrf2N+k=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=lm1op1vw21Q/ApVXrvZKTH+lvFPx5mWVF98gbK0GZdyyiQpoYk4F7Rf81B+3eMJa0EuTRS3uZ6cgMeUd1WuR4P5JEmOLvD4sX+qK6wDJw2zwkz9bDuqLzgW2TMzeRyxBkvPaPehN4a+/zr6aZfC8P36btSHobFqGlibq+k+ekjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aE29nWB0; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aE29nWB0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw7Rc+Qf31S+fpfhpVyJq5nEJbnNeMQA5V/0mIA4Dj6VqIOk9TomTxwzj3wM32bJJ2hi48SCH2+ntm9ywevw1cMnzN0TPgpqr1BaQVdO8dDBOFC49OAuEyV89LE3hnx/QZ4lnObZnGh/lV3+dKWqPvr0Cn7tvDXQwXm1KQZmxCLPPzdHuTPf2jIlieGVyxl8NJDiJ2+gen7bycatOnQtzwgVpBFYicX63KmdKO9rsk9eLZLzP8PtW3toHQYtKSrJ23rG2csh6QcQS2egErs+eivbaI+Rxn5DqxVZC+6o2IhR92TzonhG436YXZ4E270eqzJk4fZ0km4KKhcvKehwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7RMqovFvCQw811fYBO70NiTvKRU7Escbc/+xaf46gI=;
 b=v+zHebBZBYkrT+AuT9tlhUOhPAEf5x6qr2zreG8amMiCy531Sq1/RJjhtJ4UKXytaph7q97YdyslVZ4ewhgVIMrF4l1x+EwukJPHi6siL+v7mlM5Gf0RwCt3ZQQ15hwYc2VlJ6B9W79x86XOSibcQRVDJlbqI36MjtgxgVNXXhUxbzvg2U6Bx0EMXvLLpdvefVLS1139Pk3cJz680HiQvjHxtUjvJtJTaGaSr8Dmfz9ss3r15+uSXFlJv+Jf+ueTox+LFRI0yhAvaO+5Hd/q0nzsV5nIsQgbgF2C37YtsLT9/izHTLTWR/2DoKxtDqKPglOQyt57dnW9ylf8Vs7Www==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7RMqovFvCQw811fYBO70NiTvKRU7Escbc/+xaf46gI=;
 b=aE29nWB0z2/Ktr9M0SzE2NzPmEfR+oxbz6flqYZCglO3z5h78TEH0OWeJhxheNxiKt4m39BbpIeWZ2h1piX6akoPNOQaoaBSJibuulgNfNwRZ5DPbK4P5n/UJLeNaCG08skAo6fl39DW8kkARh229Sz25JOfg2jz4dCsfxr/xic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS9PR01MB14112.jpnprd01.prod.outlook.com
 (2603:1096:604:366::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:43:02 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:43:01 +0000
Message-ID: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/10] ASoC: add new DAI functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:43:01 +0000
X-ClientProxiedBy: TY6P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::17) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS9PR01MB14112:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d78557-6363-4e9d-fef7-08df120182f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	VA5MsrfodoXgxFL5do7pN4O0V6kNMzD1ZC8xDEUyXVr3KVA9vOmiKr6MaOAc12g08/eGNpk92aNUxwo7LFokET+2ac9MVc5MaRnDUN0snRqZwHpbUAf7YunogSNB2YIZsHQNKjiwAJsfp0wxTQ/kCIqDAqHpAYkllElMCT+rSmrisT/iuM7VnqEA3lTgrrHDvkHHfmL4hpxuTfVi2uYFeGd/Qow9wF4U/b2IFbzo6DvReqjDqJSqZsUrMqDEBwyDQ0bq+2bZ2nhMW7YzAl6WSreK6BODO7GHI6hPvth4CoqjsJjtWjiFY4Fc4FyMxAG3qsApMALsV0FbmMKvx1zSX2IeHwWpFxqC8nWmidJNuBznIw0NpYQEt4+q8F1vYq6bPVFwHhGOf3dgUNpGx0yJc2I7VT58IOsycCd7clGAq527fqWFoShD+TsjaguiAUtghZ5Hht+zOWEJeSCuWKSdZCu0kUAtejSs8F0wUwcQc0mIkJq0ZQk3qpFCZx8thZHZU7JZNAtQZJCaYvk+qJM5jFoUqvKvE6E01LPlSNNceIxdDdkwRzlnDU/SRCuYOqkS/hvXIk/Y+aXza7qUiTPprr6GXKfgC9SZADyUyJ+92XtiX/PimwEqUQlakmeIw57dNgL4D5rwP/tu7nPrAb2fX5n9rPD6IVcxJiAu9z6vrSK7ZdDhCyuMGmTHReLSwFT5BWbaNuIZheBM4xO3b7iPRH/pyf272hwGGsA/Tbpejgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xAAsCAE6NxO28FFSKnzjCrTqbJqnwJpTa74WI61J/aJ02VfhEyhdLjvgQ2HE?=
 =?us-ascii?Q?7WRuk5oT6y/R11FAIRzANtgmhU7RVlGbQ56O3NhFeaOiHTEp56fGhtSdo6V9?=
 =?us-ascii?Q?fQVdpRjOVt7aqRvUo3hqAwia7RWovLZVgBeblLRuCcibM1zc4+cg+347tW0C?=
 =?us-ascii?Q?t4NfXHfOaZMuyzKftzdCNP8LHB0aWNGy+HGgDEv7CE+ms0eOYebbxbEnHkpD?=
 =?us-ascii?Q?zTbjfw5KmoaZulqE6DUXNpNNcy2QZY5tTJQ0u29uyl8BvTWaI+zPqYxmkmQe?=
 =?us-ascii?Q?2yoESljJmhcYIn0rNEqjdhboCV+7yu39S9XrhmdGKQnX59XEFDpVLY8b+nGE?=
 =?us-ascii?Q?0L8SSS6EqTClWnXNPVu+ZXugV+kv1ws2kMxbVplN2CCOrU1rup81Ymftnirs?=
 =?us-ascii?Q?IOwVIeMAgnUblKGU35OahHOz+TMvo/A3NMLIor6crQg7YaFpKjE18y8tg7lZ?=
 =?us-ascii?Q?8URnGHI1EbG3SrFZRpOc2Kmb39AUuOM2A3W2ZFrkJXmreEhMP/g3kQvn1PtO?=
 =?us-ascii?Q?kdIE9VqsZB2YiPiXtv/yvDtuX1GrHktlrF0FRe0l/Lwu+Qk3ySj2aRRR4HbZ?=
 =?us-ascii?Q?xc3DQxBgm/greVVEbdG+dXIdZoinMuL2OfLI4ORCgpsvTD6yidAYPnFKj2RC?=
 =?us-ascii?Q?6ZMeZwSRtw2myKk1q4/3Uf6A7B92DdbHe288mL1dTxPMuUDlXMb2RjCcDNGC?=
 =?us-ascii?Q?+VVWpAZ0TfCsOu4WfCMgWWdz7FkjA/QkQA97r82SqMV/QmmJiiwVprIoAJtM?=
 =?us-ascii?Q?WI8lwOc6BAPII9QpvS2EAy5sehM6wuYLMQFjhl3ArY4MWYaFGzroxpEJNaql?=
 =?us-ascii?Q?q8TkzH3zVqAhRADZIsNEbSremnJ2WrNHmamp66JitJxdnLlw9Qo5qZfnlJDZ?=
 =?us-ascii?Q?LZXjVVT44bxvg+CVi84VukiAKAcDsGg+cA0OZYvIe/afIIPN4KECdG5vcvD0?=
 =?us-ascii?Q?4XNxOV3u3wPLQ75N35p7N9+DCGwGScZRq8ABj6HwibrTT62dV/L12sk8u1oY?=
 =?us-ascii?Q?THP/uBMdtsLRffqbazai4Yuc1DbI3lP8NvIOGCzB0pnMO64nWVI9De3V9o2B?=
 =?us-ascii?Q?V2/UZeBNX82MDGDOvuX34mt02hZ1hSG5UKM6wt+ZnLf4malfm0MiNOpxx/ma?=
 =?us-ascii?Q?Vbtf2IVY/rVrwH7EZOmziL4WW5QzUhFYAzTBkbuf3HNX1obJcZc+LbNOTEnn?=
 =?us-ascii?Q?NQCIXBhyrgGPGNYbTaECyzvzk6oT6q5Y82veIufw/kFZ9ZG4WZmJJh85KdFm?=
 =?us-ascii?Q?S7f7NvJ0+7k0I8KqfaVSauM9sIz09aXnacPYZeCtau7yfLpqzI5Rtagn8iPj?=
 =?us-ascii?Q?umc3SQZ2Ab7mgFy3zeWfSzQ6m6Ixr4HC50xEkVGKWMb52YdkyKarEEeOfRCR?=
 =?us-ascii?Q?rf2C3LR1vXNcI6vQnSXMOkdxqq+B0lnUvZJSxBm+hQOSGfWRa1eM2MC/es9o?=
 =?us-ascii?Q?XuSv7hRyV6SigI7ixgWzBeXauCl42n8myiEglRl27pbdbQV5GpqYf7wkPlpd?=
 =?us-ascii?Q?MRaXREk+nWG5Q9kJmuqgqR/E0EMQygAD8rgIz0yL82TYeva9JqJfSpPDtBgc?=
 =?us-ascii?Q?4evF1sYPmz1QBoQkhNhbI8/UcvliGQhAWgn/OYPKV9qPKHmJWxdDbuXriuBy?=
 =?us-ascii?Q?/G2lBjWeLPdTd7tA9es7wuHk55hr1eSMur6lRzAQ6WUuy8dtcM2yDBDxFzB/?=
 =?us-ascii?Q?SpPZS0fp7FxzFRzfS+yY1autdMJH/kBwwCe8hPuR1dQREeVVQgCqJC5LUZQU?=
 =?us-ascii?Q?8dEknxZJMIXDMkMsQiALmCbSWb0BhZ8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d78557-6363-4e9d-fef7-08df120182f0
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:43:01.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oet4HhPj5S4JYFhcVuhIlAywNhBWpAGyvG9e76pR5RmwnNqY8jTbw9SyYiYNAtWb3pJKHFv9JTML7J7e2F2RD4gumayI3klLIcI+hibYgWTf2wqYJHL8kn+Y9nzqft3p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14112


Hi Mark

I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.

x: done
o: This patch-set

[x] move DAI functions
[o] add new DAI functions
[ ] move Component functions
[ ] move Card functions
[ ] add new Component functions
[ ] rename DAI/Component list
[ ] move Card functions
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers  -- (A)
[ ] Capsule DAI/Component/Card

This patch-set adds new DAI functions to get dai->xxx, because each
driver will not be access to them directly when capsuling has done.
This patch-set just adds new functions, but no user for now.
All user will use them at (A) timing.

Kuninori Morimoto (10):
  ASoC: soc-dai: add snd_soc_dai_id()
  ASoC: soc-dai: add snd_soc_dai_to_component()
  ASoC: soc-dai: add snd_soc_dai_to_driver()
  ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
  ASoC: soc-dai: add snd_soc_dai_symmetric_get_params()
  ASoC: soc-dai: add snd_soc_dai_priv_{set/get}()
  ASoC: soc-dai: rename snd_soc_dai_stream_active()
  ASoC: soc-dai: rename snd_soc_dai_action()
  ASoC: soc-dai: move snd_soc_dai_active_action() to soc-internal.h
  ASoC: soc-dai: add snd_soc_dai_get_bclk()

 include/sound/soc-component.h               | 14 +++-
 include/sound/soc-dai.h                     | 28 +++----
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  5 +-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  5 +-
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 10 ++-
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  4 +-
 sound/soc/sdca/sdca_asoc.c                  |  4 +-
 sound/soc/soc-dai.c                         | 84 ++++++++++++++++++---
 sound/soc/soc-dapm.c                        |  9 ++-
 sound/soc/soc-internal.h                    |  2 +
 sound/soc/soc-pcm.c                         | 30 ++++++--
 11 files changed, 146 insertions(+), 49 deletions(-)

-- 
2.53.0

