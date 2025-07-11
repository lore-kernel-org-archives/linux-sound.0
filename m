Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC83BA33
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 02:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200772; cv=fail; b=FHF9LRDb03gAdf+x3WttsqNrP8ALZI3jYMHz5nMIEmUVVx/lraih2BHgksGYbBjRnZXoyVtIEu00+zA3tWkoadNhArwpyriBIXb89HxTZwjMSS/dgfk9j+Gm9p6PHzvtzZxYkAVSaGUiX65HKZ8RyPv3akC6SaVq0olOEF+oEF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200772; c=relaxed/simple;
	bh=e/dKfUX1KHJi5wvnc92R3qgSlRuPA/huibSgaMKTPG8=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=ahsmt88WZv+L86mwS2vQOfIaaVG0B34ko22UAci+sdvMJwLkz4G84kZ9csqml7uOc0EDrkInGt03F2FHFqmuZ8l7gf8xJ8//Ruj/xGFr9r58Qmsr4ugKq7VRIjuFj1yyclp9nQdw4BndRUekvYH+NOHLCczWSQ6nlll7j5IITNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lRXTKkJf; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lRXTKkJf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV68BzUAo5EZrGFHfbsZlEDUiAbS8mLo0iZE59SKc2p9wKwuw64VNZawGNM9EftwxobJr7gAJAa6hHlek/InPJZEpHPl0e5Kt+2FIVmdtwWdP5E5jdtOQkIiMVUfCbwZe66WHY6gZMF77RS6pQVg8zvZQTR85UHDuALXbUAwBBPNN3Gl0Kqbt2LtpbS40enx+biWyNwxE7tWI5FQ0Ju/acK3e+LzwG1gA1RR3mQY4luSR/y3jlMCq6ofdwOyaOYL+F7bdQ0zWJc+QPaH6YwsCzqKE4xO2BP4watYaZ4Mq+g+fr7K13/cft73PJ2eyQma0UX0qaVlahHOjm8vTqsjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4b+Rjc+1tV9V+WVw5wHPxKLvUTb4SuVHLrrJjdYJ1Y=;
 b=ueaXb+4aZ/pzSmg2LmERlXU2Rcrw0xjmW9vXik1oFRGJXqPc6MyjN7fzPxLeocAje+pPcnU6wCj2SB4OcPgsdYj8A57+O3K+l1kDI/zBKXhcBqWQa0OEGpWKDkTV5uW2FP2VuaRBFVzwsTUdNueI2ZWxDOPem5jqPxpYvmhcyMnjQl50d+yREGsjmby9WrSEB9Piv73tAN0B9Fza+5+nQbrTRQcqAasTKBm1P8ZBxJRz8vft9q1ic9idPzY4Sk0APhbfvRmnqKpd91/M+ay+NhJLJ7o4LUCoAnew0tpSzu2pLOfWlWsQqVyV+WmMQtSftiJw1iamolQL8TbZbrdh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4b+Rjc+1tV9V+WVw5wHPxKLvUTb4SuVHLrrJjdYJ1Y=;
 b=lRXTKkJfu4y7HYzi+XDZNBJms9+UGoXGYGF6bjrHRwNzh05y7exi/XvisMYOW9yTTRNIF1V66XklPGZoyd6XXiFwePPO++7YGFu3I4e7vmiPXGoaCPhd52hW6yZ7CeJFg0PLF+bOeaGgiIfIKdD2bR55MZDBR5T0shQty/GuRgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14933.jpnprd01.prod.outlook.com
 (2603:1096:604:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 02:26:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 02:26:07 +0000
Message-ID: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 0/5] ASoC: set bias_level at if snd_soc_dapm_set_bias_level()
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Jul 2025 02:26:06 +0000
X-ClientProxiedBy: TYCP301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14933:EE_
X-MS-Office365-Filtering-Correlation-Id: b694c411-aae4-43b5-462a-08ddc0224a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B27CVGhry/phJDRN/19O2cNnMu0Fyn7GUmSNLtE6B5l85OfCZuwz3djirj/N?=
 =?us-ascii?Q?jPvbXf3SUrs01Y086Vg9WNh/1iNR9YEdcHPuPc+6yy5+Ep9DMZk36+/SYEdC?=
 =?us-ascii?Q?cEaURh5MiKpOE3Fa1f3QrfA0GFfbejhPYxWgJciDY4oGvH0Kky2TmzBWskjQ?=
 =?us-ascii?Q?FahKSBBjBtSwU2zJ4sHk+sOS1RMFFB6Bo2ICma9RhEALm6MxxVwb5ho50v4q?=
 =?us-ascii?Q?jftwLXyIClrtwIxvd1TmjAa6/QLvXOYgR7PUAON7mNmVPtGHkdGFuPOVWCXe?=
 =?us-ascii?Q?ImUOYX8ZdTFpJBkXqR4zBQqP5XokzoNMhkU1KgNjzeHMEPmjqiJQSkn7bO/C?=
 =?us-ascii?Q?0bJdj2+BpStEb50wATnd1DrXLMHR95NgBe0M4rzt1FybOJViPDIOZSp4X7c+?=
 =?us-ascii?Q?n8dYDz5d5+N2429hZGnwj6h1nfFR9GnXiLzLw4HegX2hJEHr7ylJ+NBTET3Z?=
 =?us-ascii?Q?kAWw8v/kGgQodaz2J2pEhgObjwoQ/bkNkXN/LOZtugn/df5NKrr70x7meMGI?=
 =?us-ascii?Q?4w03PZrLaIps88ytaiW6H28wwJYfMpYyFVXFHB+xeJZqA26JkneixtCpx6PZ?=
 =?us-ascii?Q?sFukLCvRTSK6PphqMDWRRWV/73/X9zam8aV6ULQIld6CA4SbSchgvtaN61Xx?=
 =?us-ascii?Q?jFOyCOKIuxTda8DkGgW1mq0YmxyZethoieulNL8iS7tDgWseqpSQ00Sf1Fws?=
 =?us-ascii?Q?4RFa4u9qWP2gzD5lU2r0NWs1ZSH6GNjakj6G4xcrNop1pGNguU3GIs37WxGt?=
 =?us-ascii?Q?KTu2fapEegGIE/elRSaSc0o9aWD3Usp/hMqxU+xXWK/T+62sEJ/neHxgfxgZ?=
 =?us-ascii?Q?qj+zYvX5rBsuhQq7PWU+XSjgCtSG27jVevZN81Otty813keWR2DWHujoLfLQ?=
 =?us-ascii?Q?dJoKlNxyMpAilvDOVOv7nzTKVQZV6WjQ9ftM1w3RsYEigUaHvr0c/2Q/U6W4?=
 =?us-ascii?Q?5buCb+AcRJBjdw5QgwiDWRD9kgPUI7AA3+ft8DlZQrpP6WCEE/0UBWnKpD2Q?=
 =?us-ascii?Q?ELfTvdri8t7DUqzJeJIqRodZVE1DTydq+IF7O9Q1KflZ8At4aLreudVwVhNo?=
 =?us-ascii?Q?O0am4YbD9MY36ifEsYOArMiC3AMlSDUHVgDaMwsTHWWEZsRyN2QIdbdyAx2w?=
 =?us-ascii?Q?Aalch2ToKMpx7yqgafdqTKQSFEiu7o2L/cFEhQQh3e6T8pHqm25Odg+vLf91?=
 =?us-ascii?Q?UuKlRiOAREy49YxD2X0Jo2UElOjLbwUXI8frBFvLE8hEp2cqB0vFKxMYUTnA?=
 =?us-ascii?Q?8ntr4AyqHFaM89pwOMklHqugcZEhWUUKA6JwNZBcFLW124kRNGwBzniQDTJy?=
 =?us-ascii?Q?DFn6mT6X+h+E22jmteJ15zggCWr4jlHiMOG9MsILvp/HQQ40J2XjWSy0ClNU?=
 =?us-ascii?Q?5qqiLgFOk0Ln/g57TPhx2fksE6gcPIHStVr89v1yo5O9XOGNYgjuTHPuL6V0?=
 =?us-ascii?Q?vw1dbca3CQRAzX2C5iGjZR3JUpo+4fxcAv7hgCVQaObm4gFipIywOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pM/2jFgQXaN5rhrVLo8r1VbYz/Ysx9d/mbkAa2Z1t5kSGIWzWAtYEuB8KuZU?=
 =?us-ascii?Q?0oSc7A1pdaejRSeNxQN+nm6x+UGlAeQrZlxu1zo4qM1jeSjAzq3T0N41A8g+?=
 =?us-ascii?Q?Ze3k2ti2w/yLPuuZcnFXXnaXLPO0e2ctamnjucc/WX7cYEKZ3sajWZv+vQVO?=
 =?us-ascii?Q?wSMwvURKxDmmsSoFXYTd9mDu1Z4vnTdXbFT6HNfwWkc6kNKEjol/RB+HD+v5?=
 =?us-ascii?Q?vdHQlt1O0ahb4Me9gnhvGeyqvcsCqTAwdx14OtG6tH8y3qBf/U7q7nLR+3i8?=
 =?us-ascii?Q?dQD6mXXn+TNxaiH/amxGpjoBLh0qPQobdu9IUmyfOhapQKw5y29l5P+/nRYQ?=
 =?us-ascii?Q?WS0IMez4YhZMaqvFE0UAAzrkH/f/17AQVFcTjaNoOx3BEVe0wSJuVmvAbWml?=
 =?us-ascii?Q?1+0nmvl84hl3+qHulEv2o7+0vwJx8pRAD4+G/a3eMmQQlHlGTLaXGp6V0a29?=
 =?us-ascii?Q?KaauJIaB3a2ikqGRj7lMbHD/DLnxI4V2Sr25517l51bVxvR8my3U3sYnzfQc?=
 =?us-ascii?Q?n2ANkryZ6FFq36Ue85ZV48bNyzZYTh5yz0TVSvzDWfhshIzwsKVQUtFQwpU1?=
 =?us-ascii?Q?kCh4l06EFog5QmNoDV0I/xdUmw8uSoR/hWak/jZl49uKKDMlt0yBHO9w4HIg?=
 =?us-ascii?Q?2Blp2+EE7vvEI5F8jOXA7EySh6+s0hs8FxK5mNvIBw2F1IX/gYxEmhm24F33?=
 =?us-ascii?Q?0P+Ze+/+Mzp0HLREet1ecDByptnBBwjLBCV5nVkc8h2a0CpVkkTA+Sth62yd?=
 =?us-ascii?Q?drRFhIPHC/jHOnMdumW+arh0dwiSI2xShQczeF/MiOxcGzIgokx+lTYjj+ZD?=
 =?us-ascii?Q?XttALnUmsJCMR0QAoQODZ0Ortbfyx5J1oZP7tou7hiI2ClBv8B6kEVWU+/Te?=
 =?us-ascii?Q?uVu/7zsDpOI98RB5AloUEObkOYpMWxY+ocP9BipWcl/upA2/ozFh/sC9SXzO?=
 =?us-ascii?Q?fo/pmkHlG5C3QYjFEom9SPQwaOxtfEKoyr50KBatgg2npHUGYZ9aI5VoodTK?=
 =?us-ascii?Q?qJvQxjmPFSxPuLvk2/7poq60jli64gV9p6pruf1WAjju/cVLvYmPUAqihrud?=
 =?us-ascii?Q?B/UZddmM4HxFl6JrKOjTSGrjnttxN5XbvOg9MqOZEdjclmYV42E8Xuljhz4W?=
 =?us-ascii?Q?+7/395/v9dOVU++VuSCXDi8hSV/7M4/fJoPiAdkq1kE1L5DswENlyUtSapY3?=
 =?us-ascii?Q?q0beGnlkObzCoYMv+YsxSLpDSJ+2rjvfMHZZVEfFzDBMkXBP4y16TzMJHS1p?=
 =?us-ascii?Q?VW6q1rrv1QFJjgX6EpBjez0T7FDrHwsgDNxs1gX5D+TgFjQdTbo+E8b+hHby?=
 =?us-ascii?Q?n2yKEFdqaEgCdP1xCFDZR2c4dEtEv8ZsGkN3NidHjlTTrVnNQXbKUq5ZSbr4?=
 =?us-ascii?Q?/0GTYfdX4yOcEOHeupQmtp8nNBb/bHtTHq+oxxrFfm07IihcW3QB2pXGrX3P?=
 =?us-ascii?Q?eenxUH4Zs7znc12Uf6c6CYkzQ1217HE+p1k57RhTc9scl2NMZ3JTmXWqb69d?=
 =?us-ascii?Q?04Max6X4mTwDoKo+sX4WDhLRNqkc9+0Q/yoS2igR93E6XRVOUNnQD5qI+T7v?=
 =?us-ascii?Q?YLcEkHQBMagPtPp4+B+5/aUhSklVReyIGXcLkOcc3FU9qCRyOm6ZEdEV3yM1?=
 =?us-ascii?Q?wy2K/QdtQlGqVsw2Xb9c2/8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b694c411-aae4-43b5-462a-08ddc0224a86
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 02:26:06.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UryOy/bp5HHnwh8HNF20Mi3odgBQgi9sCSjZYVrrmTyt4sUYGn4Y3QcAxhijuixhJoGA38/RXVkMNUHLfLu61Z+2C2NDq3QVrmUiF0ntCQSEjNsNpJlzFyiEUTOs4zhe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14933


Hi Mark

ASoC has 2 functions to set bias level.

	(A) snd_soc_dapm_force_bias_level()
	(B) snd_soc_dapm_set_bias_level()

(A) sets dapm->bias_level, but (B) is not.
I think we should set it on both (A) and (B).
I think it is miss or bug, but Samsung is the only vendor that feels a
problem about this.

I think this patch (= [1/5]) is correct approach, but some non-samsung
vendor might get affect from this patch-set, so I added [RFC] on this
patch-set.

Furthermore, (B) cares both Card and Component, (A) cares Component only.
I guess it is the reason why it is called as "force" bias_level function.
(A) is used from each drivers, (B) is used from soc-dapm only.
I'm not 100% sure though, except special cases, each driver should use (B),
I guess ?

Kuninori Morimoto (5):
  ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
  ASoC: samsung: bell: don't set dapm->bias_level directly
  ASoC: samsung: speyside: don't set dapm->bias_level directly
  ASoC: samsung: tobermory: don't set dapm->bias_level directly
  ASoC: samsung: littlemill: don't set dapm->bias_level directly

 sound/soc/samsung/bells.c      | 2 --
 sound/soc/samsung/littlemill.c | 2 --
 sound/soc/samsung/speyside.c   | 2 --
 sound/soc/samsung/tobermory.c  | 2 --
 sound/soc/soc-dapm.c           | 4 ++++
 5 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.43.0

