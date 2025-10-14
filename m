Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4B304BBD
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415561; cv=fail; b=dnMnoZiDys6tQhYYYQhIILYpWMYsqKHIHVIKY0WRKpIjjJdwnkcL86ve3fF4jmHGen8s2aIZaerP6jW4NRixKRbMk6NxFxtEkPtVS5abAgVgZoJas4zKXy2xncjQ5QBeybcsiGuE8INs/CM3ckOFGAujsdcS1tbO3CaLT5edzwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415561; c=relaxed/simple;
	bh=5F/Yck5E+DUi6T1sPJrBapj1F1gDSWX/0E6c9dBB1WM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=a4c44KBaoGcNKp0FZ+V5UfeN2mD4qFU8q5paoM4rnX1G6h7jXF0mDerMcVc1AH+xNU78Tg1/EwSj27+krf2f4xYHLkN7AxjAb6nKMkuHcQMeeRxeIbyhjvD1BMXE1GU2n7jUI3pQ8jvatSo3hHVwO3kLVAflVqzh5QkPxu0oIdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kpSxvaqA; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kpSxvaqA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4T+J3ZWNfND6ud05hwJYWk+Gw0FT0uzdZH10omw96NIHWTQ9ThZu+wQ2fALh2yJjZoH3Yk8x2iWAhEjh25CC87ucwdmU6xb9O2f80hBHTf5MCASSxtHAS23W1Uf5M/xllTa0H+6pqxzMlnh2jFuQ5btgQrAez8hdRbU0IaEQ8fNZ+CaypiMfSqj0zaZy9BAxLMdX6uMLBc30uGDczScF9rWCyklTTBLmQq7qIaRAtOyyYkP3F4NA9KzUf0tu1Po1o0sGIotNeoV6L7EJM275xpy1SV5xw/QBIbeWmz09reuVLmpUeAGVSLHvGl81IA6D7UIh226g/G73lMHaWyhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ganTyskII/j21fzGPcb67QA6RrQ6m6ssorTB3Yb8f0=;
 b=j2eHndxUDmozwYC/agP5OlpFenupaSoI4yVp+/pPVDbshpYMV45w2ePXq9jiBmDFpzEuyXTSv1wZA4cMZfj5bmoynBcf9/9jNJskcBMXDfY/jsZZXY86j9sfwFchdSzhO+RLurFZI0xj5cqhCN//dEIaAoRy/jAk0LRlbMzFEM3xPIMugIYneqpTIzX9oTuX1e1Pi8ziIUGsfrEOr1LUTkIUneAyCCUAnlshWBNRC+hV0egJy9bVn18C8bAlMLkCg8zjzVXj/OCV+VZIglI4b6ySWqw+7kzeTKj/8hnEKckV/A+FgAx6l6R5H2K1OqizOsXuu1nIFwy7YXQ/KjgHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ganTyskII/j21fzGPcb67QA6RrQ6m6ssorTB3Yb8f0=;
 b=kpSxvaqAYQIhpEOjNkS46W/P5v8HHHac5AsuOStFZCzmsfuxrXOYxQ3VWuU4cBhYfNuzSWl2AtqSnClaGO3X4H8AUY5F4k7XVp9GSQLC9k9xczFtzoCW6+T8GchMUCR1iZoH8LfY7g3DidFwIkdTPf4uDSMQXr1v0pxQp9FhCi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:10 +0000
Message-ID: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 000/139] ASoC: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:10 +0000
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f00a4ac-5aae-435e-d0b6-08de0ad8d346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T1gnxpDvqR4sNIBRtAFes1ujekcMIwG/8kGvCi4HNP3IVYd2xxpnuHjSYFkM?=
 =?us-ascii?Q?Xo8IO4CSskxzVsOmAlycYM/3yenlbb/KpbU64/RhHIrsT5eiTA9UKWROAzlB?=
 =?us-ascii?Q?er2UiTUEGdaoBYqg8c4SjtMqR556j5Mo0u8Bi3A9c5Fe+yFnukRSPXTiZElq?=
 =?us-ascii?Q?l5XEvCdndcotyjQMnC+qafKxXYOlvV7AtnrYAhC8/Gtj14DN7a37TdpfvH9n?=
 =?us-ascii?Q?rdmX4Kkg47RDyZXA3r1NB5sjdWz59FyjSpjJ5lb8Amd8y6WnCkAiDnnzHuV6?=
 =?us-ascii?Q?dEOq7KbragdTNATqlPSG66qq9cX/dmLNuXavTyJzJ69Rk0abomPeh0lasVvl?=
 =?us-ascii?Q?BmOpMXunbWB3GO8dhQYzgAomKGDbqkGmaKyOz/TLrGA52EZfQ20XVclD4djn?=
 =?us-ascii?Q?FkFKgpwXSxgi+EL5jaJu/WcNeaFPVKwdPAGw72kwEkaOW/h9Tpk1JEcgpxxf?=
 =?us-ascii?Q?hQDokqZSk76n2IBAZgh0GKlFELMBNJgVyV7HzihgKImU5KPmmqVp86aUpXjW?=
 =?us-ascii?Q?H66/vhrsOsXJPQmR7OqajS5wdARY8rGzAHIHHpuc8wnCxV4DYLmXmTWhvgMJ?=
 =?us-ascii?Q?kOe6XecK3+rbqENpg1lQCWWAHpim2uVJCKL6qC/8El7DF9uxGA0Uw4Y9qeHa?=
 =?us-ascii?Q?FmxAyVwX+qKQ8gZE4L4ZiPELgaku8L7/Bw9XC6DhAxrsrFeON5BAY+AIGDwt?=
 =?us-ascii?Q?SRwS3SHWRBQx8lH5pFNBO+eGm5fuw7gGumfNpOGXUU1e26SssaL7Ik+4iYlf?=
 =?us-ascii?Q?Is3LoOIei2wiGF2snnBZVsK9afXtHERjvezNH7gSM3zyB6JuaKyj/U8uYZab?=
 =?us-ascii?Q?PF8Xr5A9v0HgFI2BDq+4mX1UqYAxGtWxn7xk2GGLT0BiFEVM/zTxdrB/sSHw?=
 =?us-ascii?Q?HXWIq/5xCkXIXgno++dv47ZAu9x8lj+XIhD0bU90mdiyMc0FQ89BgoS5Hs/c?=
 =?us-ascii?Q?yogsf/v1xtAwS/9M4XxtUhFEX7Ikr3DxvPHm5Ip9IxDFMnDpy76M1nMJXrOc?=
 =?us-ascii?Q?07Wrr1RCVbW8XJL8OQFLeEpd5aIumQAkq5RXnV8wDRmAnauVKLErrpuC3O4E?=
 =?us-ascii?Q?wIQajY2RWUCSXdgp7JhlX2rArl7xARuP22JEus/GGLRaXO6DHKyotkfJf1GL?=
 =?us-ascii?Q?MipU+GHVWmozhoUwdqUrV5T6Q7nbvKTTHdGgiA2QE2xr4q0a8Q+UM1KtJIls?=
 =?us-ascii?Q?nNiSi7CI0r53a5+2fjpHIZUBLEvw5zrAvyhOULI3OjJgv2MoznBfIUQsIy+T?=
 =?us-ascii?Q?SSRD1vCKeDKH0EAlFmRJTix1ETGuUqJ2PTQUkeR9M09tkq6Cs6B8Nl8Su88j?=
 =?us-ascii?Q?ENVgLhkSZXV1U5FT/6bHG2kZ1+XCBp1jS+BVWClrfqZeqvZ3t2khK6jvSYm9?=
 =?us-ascii?Q?fooLAI5aoHTGBC0cDDDQflWPdP8PU6ttlRnOm5y27KvP15wqx6bSImLPKC2Q?=
 =?us-ascii?Q?xFzaXulxVkaPNneqXiMIvrbw6y6cUS/64oI6L24LhpP5V+wf6o50IpI14Cbx?=
 =?us-ascii?Q?fdYDqPcUY8kwx6Z2X7EZUcfOdWusxrqY8rJC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kzJOp6Z1P7jIlYW3Ci3PKI1iMkGS3GmGl2PDlY4Yaegfi6wp3TZko67K8fah?=
 =?us-ascii?Q?+1fyIUO4NcSadp9HqUNvQZ1AbHeCG0QOJ5KpH4BUzoqjgJncjKzJAKJpnwKC?=
 =?us-ascii?Q?dBGt4Y8zs95sjCbUYhJnK7Dux/1yZbCA1gAgj8h8XQjZqrd6hn9+BzmBq9l8?=
 =?us-ascii?Q?g1sAL6zI+olGXmj/numfBDeHTV/K7/uskmwaNJHxKjEGobRT3XXDHB4p0UGF?=
 =?us-ascii?Q?yD2AALxw5XnLtO3Qm4/Wogsdc321G+BzUbmrx56gZKu/3X29ZuFT/Eb06OUU?=
 =?us-ascii?Q?lpYrL3JGemN7AHleJ/hssLC3MaV18PRGihcA/YM2Z0ii1NZ8KnkCruu3tPHW?=
 =?us-ascii?Q?xXjwcPB987IDdIwIC9Q7mx4Q/0mO6oUuKjRgLCMlk+l6f82b+0/8YpJ8muJi?=
 =?us-ascii?Q?TRPPWERECQPB4K3m/PJUSKn0hAVf4cFRj+6gItWiAK3A1in8H31sUIhTjDFY?=
 =?us-ascii?Q?cAyL5CJQ/JKSeGNNlMmFTaOACQJUXSvI0spasp2llQ6Og/ThhyZYk4p7ynbQ?=
 =?us-ascii?Q?UCbKI7fa5rlC5RwR29CTb3oa6Rcga+KZyd1h4ku0WvwnXrk1AOzcBA7Sdxy0?=
 =?us-ascii?Q?l7ofxzMqN41oCpk1Ry8HUzttHnBVcfClcqzbi6XjLXP0vH6XKwoNYPk3pvKj?=
 =?us-ascii?Q?7g+tplaGKYLBXcvt/jT0qrszNdt/A2SyBQYuPB2gfNDUFhhSf/yOStVOwHhr?=
 =?us-ascii?Q?CJCGn6Dqa9ybNYVgQA2L2l709GaVLjYoBTaAePcEORV7vTdE7qcz9OaE3Aj3?=
 =?us-ascii?Q?8z9Mpi6PJCFvWuNaVP3HjPZiagW2gF/mLmJoveJnt6g1pv9f95AK780RB/CN?=
 =?us-ascii?Q?hpGeJW6wN4vihtuZ6a3aRr6VSx1mq65G2pNOSgwh3shXh5TBa+CqQzvGWT99?=
 =?us-ascii?Q?IAPwS7v0TYtmLx19dB+qPtb6h1Uwnu9MoVFgF+H82KODkZ2RAWHcOJFRNoVX?=
 =?us-ascii?Q?egUmRQGj0vh0mAkW2NKDl6kfJfTPrLxllKKDMuRZydgX/ZGPnA5hGj8v3Mwz?=
 =?us-ascii?Q?Rn44Bj6wdGW3S18Mxh6vae6gELy4Mb3kYIJLL3LnD0Y2jQ/yJeOfkNOHxgO9?=
 =?us-ascii?Q?ax82+QwAilljMnw+DjEyVp0ZaDO6mKbEGa3uLEMGBu1c6JL0pzekk88AxiG4?=
 =?us-ascii?Q?j7QiMWG7Q3sHDLBDa1Zrgcu1OkRh9sTD6br64RDcmW/U5BGgyMG/+JrltYWi?=
 =?us-ascii?Q?gnTrpDU0lKR9G6OM39GSk68OJJHuyKtr5YUJkqEGQpxonWP+aKkBeNVgbAkL?=
 =?us-ascii?Q?89qDirRaec+fezoQCSRqgROAyCHBjNFRDHgn80eghSQBbsC+dF3zJ79zLTcD?=
 =?us-ascii?Q?VfjqMebA8z9BY9cLZQxHGeLT10Q9OWojwVmvINf2qO/c8xKNSlqK+YzipKCy?=
 =?us-ascii?Q?hIQ8+HCNMBMHL6ZkM/skERSv9foBKapTCPepfDXRWQQND8Lklm5WqqNxlFqL?=
 =?us-ascii?Q?uuRiusjgv4Fa+peezOY+ig3uhNOEsYLh24w1Lc/TRTQQpVOg+2Z9EOgzZ5Zp?=
 =?us-ascii?Q?k1KsgdBnLzVJVEcM4M8GX5WuDMihnZ9PAFx1jpWhAFMcXGHByvDxTP+GfRoY?=
 =?us-ascii?Q?ejRa2oPuOe8QSN2E6y6oau/QosOj/xOyuzSTotCeirNCNA+1eo7QCOER+jsd?=
 =?us-ascii?Q?P64RElSJMXebtoER78ZQr7c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f00a4ac-5aae-435e-d0b6-08de0ad8d346
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:10.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVj04Z8SONt1HgmDZThxhKgrn8syigmVi88CE/5vRxfgGVJmMiY1Mi7QmLABIkearPZlpKRe80Ym26GJLvueDM1oqD0LpeReJtkkkGpDPG7r6p9MHMUYjpvnYf6XwPGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995


Hi Mark

We would like to hide struct snd_soc_dapm_context from driver. So we need
cleanup code first. Current ASoC have very similar functions (A)(B).

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.

This patch-set doesn't merge patches for each vender etc, because it makes
backport difficult.

Kuninori Morimoto (139):
  ASoC: greybus: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: atmel: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: 88pm860x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: ab8500: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: adav80x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: ak4458: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: ak4619: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: ak4641: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: arizona: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: aw87390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: aw88081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: aw88166: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: aw88261: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: aw88395: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: aw88399: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: bd28623: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cros_ec: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs35l36: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs35l45: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs4234: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs4270: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs4271: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs42l42: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs42l43: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs42l51: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs42l84: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs43130: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs47l15: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs48l32: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: cs530x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: da7210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: da7213: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: da7218: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: da7219: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: da732x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: da9055: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: es8328: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: fs210x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: idt821034: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: lpass-rx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: lpass-tx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: lpass-va-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: lpass-wsa-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: madera: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max9759: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max9768: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max98088: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max98090: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max98095: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max98390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max9867: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: max98925: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: msm8916-wcd-digital: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: mt6358: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: mt6359: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: mt6660: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: nau8810: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: nau8822: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: ntp8835: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: pcm1681: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: pcm512x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: pcm6240: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: peb2466: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: pm4125: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt1011: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt1015: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt1318: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt5631: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt5659: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt5665: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt5670: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt711-sdca: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: rt9123: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: sgtl5000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: sma1303: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: sma1307: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: sta32x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: sta350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tas2562: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tas2781: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tas5086: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tas571x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tas5720: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tas5805m: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tfa989x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tlv320adc3xxx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tlv320adcx140: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tlv320aic23: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tlv320dac33: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tscs42xx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: tscs454: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: twl4030: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: twl6040: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: uda1334: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wcd9335: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wcd934x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wcd937x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wcd938x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wcd939x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm2000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm5102: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm5110: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8400: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8580: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8731: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8753: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8903: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8904: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8955: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8958: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8960: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8962: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8983: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8985: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8990: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8991: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8994: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm8996: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm9081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm_adsp: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wm_hubs: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wsa881x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wsa883x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: codecs: wsa884x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: fsl: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: intel: atom: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: intel: catpt: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: mediatek: common: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: mediatek: mt8183: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: mediatek: mt8186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: mediatek: mt8188: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: mediatek: mt8192: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: mediatek: mt8195: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: rockchip: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: tegra: tegra186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: tegra: tegra210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: uniphier: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
  ASoC: soc.h: remove snd_soc_kcontrol_component() 

 drivers/staging/greybus/audio_topology.c      | 10 +--
 include/sound/soc.h                           | 16 -----
 sound/soc/atmel/atmel-pdmic.c                 |  4 +-
 sound/soc/codecs/88pm860x-codec.c             |  8 +--
 sound/soc/codecs/ab8500-codec.c               | 12 ++--
 sound/soc/codecs/adav80x.c                    |  4 +-
 sound/soc/codecs/ak4458.c                     |  4 +-
 sound/soc/codecs/ak4619.c                     |  4 +-
 sound/soc/codecs/ak4641.c                     |  4 +-
 sound/soc/codecs/arizona.c                    |  4 +-
 sound/soc/codecs/aw87390.c                    |  6 +-
 sound/soc/codecs/aw88081.c                    | 22 +++---
 sound/soc/codecs/aw88166.c                    | 26 +++----
 sound/soc/codecs/aw88261.c                    | 22 +++---
 sound/soc/codecs/aw88395/aw88395.c            | 26 +++----
 sound/soc/codecs/aw88399.c                    | 32 ++++-----
 sound/soc/codecs/bd28623.c                    |  6 +-
 sound/soc/codecs/cros_ec_codec.c              | 10 ++-
 sound/soc/codecs/cs35l36.c                    |  6 +-
 sound/soc/codecs/cs35l45.c                    |  6 +-
 sound/soc/codecs/cs4234.c                     |  2 +-
 sound/soc/codecs/cs4270.c                     |  2 +-
 sound/soc/codecs/cs4271.c                     |  4 +-
 sound/soc/codecs/cs42l42.c                    |  2 +-
 sound/soc/codecs/cs42l43-jack.c               |  4 +-
 sound/soc/codecs/cs42l43.c                    | 18 ++---
 sound/soc/codecs/cs42l51.c                    |  4 +-
 sound/soc/codecs/cs42l84.c                    |  4 +-
 sound/soc/codecs/cs43130.c                    |  2 +-
 sound/soc/codecs/cs47l15.c                    |  6 +-
 sound/soc/codecs/cs48l32.c                    | 22 +++---
 sound/soc/codecs/cs530x.c                     |  2 +-
 sound/soc/codecs/da7210.c                     |  4 +-
 sound/soc/codecs/da7213.c                     | 16 ++---
 sound/soc/codecs/da7218.c                     | 16 ++---
 sound/soc/codecs/da7219.c                     | 16 ++---
 sound/soc/codecs/da732x.c                     |  4 +-
 sound/soc/codecs/da9055.c                     |  2 +-
 sound/soc/codecs/es8328.c                     |  4 +-
 sound/soc/codecs/fs210x.c                     |  2 +-
 sound/soc/codecs/idt821034.c                  |  8 +--
 sound/soc/codecs/lpass-rx-macro.c             | 31 ++++-----
 sound/soc/codecs/lpass-tx-macro.c             |  8 +--
 sound/soc/codecs/lpass-va-macro.c             |  4 +-
 sound/soc/codecs/lpass-wsa-macro.c            | 16 ++---
 sound/soc/codecs/madera.c                     | 21 ++----
 sound/soc/codecs/max9759.c                    |  8 +--
 sound/soc/codecs/max9768.c                    |  4 +-
 sound/soc/codecs/max98088.c                   | 12 ++--
 sound/soc/codecs/max98090.c                   |  4 +-
 sound/soc/codecs/max98095.c                   | 16 ++---
 sound/soc/codecs/max98390.c                   | 20 ++----
 sound/soc/codecs/max9867.c                    |  4 +-
 sound/soc/codecs/max98925.c                   |  2 +-
 sound/soc/codecs/msm8916-wcd-digital.c        |  6 +-
 sound/soc/codecs/mt6358.c                     | 11 ++-
 sound/soc/codecs/mt6359.c                     |  6 +-
 sound/soc/codecs/mt6660.c                     |  3 +-
 sound/soc/codecs/nau8810.c                    |  4 +-
 sound/soc/codecs/nau8822.c                    |  6 +-
 sound/soc/codecs/ntp8835.c                    |  4 +-
 sound/soc/codecs/pcm1681.c                    |  4 +-
 sound/soc/codecs/pcm512x.c                    | 16 ++---
 sound/soc/codecs/pcm6240.c                    |  9 +--
 sound/soc/codecs/peb2466.c                    |  6 +-
 sound/soc/codecs/pm4125.c                     |  8 +--
 sound/soc/codecs/rt1011.c                     | 18 ++---
 sound/soc/codecs/rt1015.c                     | 12 ++--
 sound/soc/codecs/rt1318.c                     |  4 +-
 sound/soc/codecs/rt5631.c                     |  4 +-
 sound/soc/codecs/rt5659.c                     |  2 +-
 sound/soc/codecs/rt5665.c                     |  4 +-
 sound/soc/codecs/rt5670.c                     |  4 +-
 sound/soc/codecs/rt711-sdca.c                 |  4 +-
 sound/soc/codecs/rt9123.c                     |  6 +-
 sound/soc/codecs/sgtl5000.c                   |  8 +--
 sound/soc/codecs/sma1303.c                    | 24 +++----
 sound/soc/codecs/sma1307.c                    | 36 ++++------
 sound/soc/codecs/sta32x.c                     |  4 +-
 sound/soc/codecs/sta350.c                     |  4 +-
 sound/soc/codecs/tas2562.c                    |  4 +-
 sound/soc/codecs/tas2781-i2c.c                | 67 +++++++++----------
 sound/soc/codecs/tas5086.c                    |  4 +-
 sound/soc/codecs/tas571x.c                    |  4 +-
 sound/soc/codecs/tas5720.c                    |  4 +-
 sound/soc/codecs/tas5805m.c                   |  6 +-
 sound/soc/codecs/tfa989x.c                    |  2 +-
 sound/soc/codecs/tlv320adc3xxx.c              |  4 +-
 sound/soc/codecs/tlv320adcx140.c              |  6 +-
 sound/soc/codecs/tlv320aic23.c                |  4 +-
 sound/soc/codecs/tlv320dac33.c                |  4 +-
 sound/soc/codecs/tscs42xx.c                   |  6 +-
 sound/soc/codecs/tscs454.c                    |  6 +-
 sound/soc/codecs/twl4030.c                    | 10 +--
 sound/soc/codecs/twl6040.c                    |  8 +--
 sound/soc/codecs/uda1334.c                    |  4 +-
 sound/soc/codecs/wcd9335.c                    |  8 +--
 sound/soc/codecs/wcd934x.c                    | 18 +++--
 sound/soc/codecs/wcd937x.c                    | 18 +++--
 sound/soc/codecs/wcd938x.c                    | 27 ++++----
 sound/soc/codecs/wcd939x.c                    | 24 +++----
 sound/soc/codecs/wm2000.c                     |  8 +--
 sound/soc/codecs/wm5102.c                     |  8 +--
 sound/soc/codecs/wm5110.c                     |  6 +-
 sound/soc/codecs/wm8350.c                     |  4 +-
 sound/soc/codecs/wm8400.c                     |  2 +-
 sound/soc/codecs/wm8580.c                     |  2 +-
 sound/soc/codecs/wm8731.c                     |  4 +-
 sound/soc/codecs/wm8753.c                     |  4 +-
 sound/soc/codecs/wm8903.c                     |  4 +-
 sound/soc/codecs/wm8904.c                     | 14 ++--
 sound/soc/codecs/wm8955.c                     |  4 +-
 sound/soc/codecs/wm8958-dsp2.c                | 32 ++++-----
 sound/soc/codecs/wm8960.c                     |  4 +-
 sound/soc/codecs/wm8962.c                     |  8 +--
 sound/soc/codecs/wm8983.c                     |  4 +-
 sound/soc/codecs/wm8985.c                     |  4 +-
 sound/soc/codecs/wm8990.c                     |  2 +-
 sound/soc/codecs/wm8991.c                     |  2 +-
 sound/soc/codecs/wm8994.c                     | 10 +--
 sound/soc/codecs/wm8996.c                     |  4 +-
 sound/soc/codecs/wm9081.c                     |  4 +-
 sound/soc/codecs/wm_adsp.c                    |  8 +--
 sound/soc/codecs/wm_hubs.c                    |  2 +-
 sound/soc/codecs/wsa881x.c                    |  6 +-
 sound/soc/codecs/wsa883x.c                    | 12 ++--
 sound/soc/codecs/wsa884x.c                    |  8 +--
 sound/soc/fsl/fsl_micfil.c                    |  4 +-
 sound/soc/intel/atom/sst-atom-controls.c      |  6 +-
 sound/soc/intel/catpt/pcm.c                   | 15 ++---
 sound/soc/mediatek/common/mtk-btcvsd.c        | 24 +++----
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c   |  4 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c    |  4 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 12 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  4 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    |  4 +-
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c    |  4 +-
 .../soc/mediatek/mt8186/mt8186-misc-control.c | 12 ++--
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 10 ++-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  4 +-
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c   |  2 +-
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c   |  3 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   | 12 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    |  4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  6 +-
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   |  8 +--
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c   |  3 +-
 sound/soc/rockchip/rockchip_sai.c             |  8 +--
 sound/soc/tegra/tegra186_asrc.c               | 24 +++----
 sound/soc/tegra/tegra186_dspk.c               | 24 +++----
 sound/soc/tegra/tegra210_admaif.c             | 16 ++---
 sound/soc/tegra/tegra210_adx.c                |  4 +-
 sound/soc/tegra/tegra210_amx.c                |  4 +-
 sound/soc/tegra/tegra210_dmic.c               | 24 +++----
 sound/soc/tegra/tegra210_i2s.c                | 32 ++++-----
 sound/soc/tegra/tegra210_mbdrc.c              | 24 +++----
 sound/soc/tegra/tegra210_mixer.c              |  4 +-
 sound/soc/tegra/tegra210_mvc.c                | 12 ++--
 sound/soc/tegra/tegra210_ope.c                |  4 +-
 sound/soc/tegra/tegra210_peq.c                |  8 +--
 sound/soc/tegra/tegra210_sfc.c                | 16 ++---
 sound/soc/uniphier/aio-cpu.c                  |  4 +-
 sound/soc/uniphier/evea.c                     | 12 ++--
 163 files changed, 703 insertions(+), 813 deletions(-)

-- 
2.43.0

