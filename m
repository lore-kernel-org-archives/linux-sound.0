Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC464209F45
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065589; cv=fail; b=gE2k+V0Bd2+RoORtL3TdCtTX0prqbvIIknI8bcrAZ0EKrtqnlXS0DbFCS+a4FHXTjcSLFNYEj7buI7KehTuyqObZBT24SlrBo7SuP/Wr9nNWV7bTnOfiMJ8zj6/+Gu3+4eQVeFf0ZuVDRCOpUlpC/Rg7f/nqrEnO0hSsOP/9TWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065589; c=relaxed/simple;
	bh=yVvtl1NQElUldODUMrIILIhrjgNICtpGrcFXsfyN1zk=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=u7+u0RGDvu1R5jc7qkS4iENHVXmvsDJsXDrmSnWdCT9oT78OCbsWWjRixIKR6yfsRi4L3pSF9ckBczNu0je3Vlxmca5vhzMPJEg4+yHWlv4wtNVc7THtO6NBkIDQHcEsWscflvIGpG3mBLdq7/XLPwUBDdPZD3nDogQMTWbVCyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BQbf7l4g; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BQbf7l4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nko/cbUlkKXJ++oB9vyjQYJ/QmNqrvlSmrZlaM6IcG2wvMcnJgWd6/AwAMj9ucFxzcmxHqeELpNyngnHVRiMx23/h4OpPufCm0jae+7YO7GUFNuk/ZkFnWalkSuc8Das0bLacu4WSB4TnG4D9TtRiJKj0PeXEuWNo3VoVp55E344IWIV2Nkbe0kRn2ZJHL25LPvTs00Gz80hqA3r16ZR0B0Inc3tG4+m0FLxU+hvZUo6GYoFtbiL+LTHCOir93erVK8yzLERmGaR3RI4bezAfdUiy2Hn/IerpovmwvAIhUf3OW7QZLTBzfoWZUnrsULgp56s+hmoXQPz/1Wkvisqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6wrLjh/S1gub2uu0C3EzCmGSTPAp0A4wxHBxgzYuqo=;
 b=TOXqvYBoPWKM09zwiCIZdu2i9vvHg+h6z5sYPoJ6Sdsals65u7zWn9PfeMAoFaziTCF+XAeDIbf+3gbLrBtAvFzoyXRvb9aKyFA+/OLvzLqjX3Si/PwnMh9tgAshK4GEWPkZ27WUnRbusFWpgfNECZg+zrm84QjNB1shAWvjS5vPVCBYlj8jRnwizAtWhtYV+jXVLvklWQapSZX05cVDbN1vz47YL2CyFKQhrAZ0L4nndPziw+x8CorNtVKRaTpYh39WQVlOxv9Xniw/8x7/0+n74OOR3iOXVnGzuRVapGnlDBOlVPsG9l0MNMkvqFtOGgiRFSo8VUSBcuKenmrvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6wrLjh/S1gub2uu0C3EzCmGSTPAp0A4wxHBxgzYuqo=;
 b=BQbf7l4gexHt/7DPl6ZmBFBDl77mJubh1J15z5KHGkyexzUiBc1WrPa8f3vTuUMcy5F8VAqY2z0eEJytPhZ5fXZ4ejUHhuLmuUyPuVszpp6y/RnoLJuSuC5UxAEob1rP6zwrpgukYr3zfgzStnuQYnn2Lg4m5JewSZC/eBgsZlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15246.jpnprd01.prod.outlook.com
 (2603:1096:604:3bb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 22:39:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:39:39 +0000
Message-ID: <87a58roatw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-sound@vger.kernel.org, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Subject: [PATCH v2] ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 7 Apr 2025 22:39:39 +0000
X-ClientProxiedBy: TY2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:404:e2::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15246:EE_
X-MS-Office365-Filtering-Correlation-Id: cde610db-9698-44a7-3e43-08dd76251508
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?I24dUpxro5SR2I3MH8QYQ09jBzDYa3mM9/Ar2JL+wmPYhLR8Gc0ZE9pcJCVb?=
 =?us-ascii?Q?4Q8KLHfWN5kYU0X91XR/WUGZ1eojBODAIV1WtwU3TaRPJl8x8lBj3zLRMhq2?=
 =?us-ascii?Q?ODo4JUmV9QhRu8Tz/c0Q+inL0y+PzkdRdn2t0wHCQH1LRsiEyknO81n7Egq0?=
 =?us-ascii?Q?pIdlTSC8IzNcvZ9IfNblXupouIxJvBO9UDaBfi3kUmZSFsKHPmWr72mvnk6B?=
 =?us-ascii?Q?pv2Py39E3iqG+3l986vFM+w7GdV9FQ31ejlWqi2uqyqWGcIYXBzf5eW5L2/Z?=
 =?us-ascii?Q?LlWCriXpRoXdX7BBstIS6jnKa0D9/NeLhiYvEWfxq3yAtn7SbJYhOvUpMSL/?=
 =?us-ascii?Q?UdGfGMpF1t3PvcTNQYvOci3HQfjwM73Eofbzwrbmzas2UWTFC6LymTHJXArq?=
 =?us-ascii?Q?6q5FPdJtij1fJ5H6hUiodNJFfF78mBnuNjagzXIL8z1KZ5nkVHH79fDIfcLP?=
 =?us-ascii?Q?Kn5docR+43z375pIGP9krPxIQUY7zUBp4h3Fx4ZMkCXH440t6w2BPM7Amm7F?=
 =?us-ascii?Q?90derE0eEby+TYkLbgvin97WdkwuYpGSoWvpVUULtw4zfSbpIRlb68TZO0IH?=
 =?us-ascii?Q?bVUnjN/DulHQLVsAUpvqPSykSFzmqHpByhmj1yTDphHO0Maxejk4zHYTtW72?=
 =?us-ascii?Q?VIvCc74iBAHK056afS/Kj3iNooes64WxWJtA8EWna2fBJIfoFKQsMKRYur0i?=
 =?us-ascii?Q?ouxCaWc+JNnniUXuNofiv7DyGbIlJmzSoL+k8RT61rV+Z++3jJjqBTPrs9oB?=
 =?us-ascii?Q?3LrdTTYr/b9hk7+MxkTcfNMEKJUEIKjJKi/f+A5GGQGksbe68FAGA/T1TbBb?=
 =?us-ascii?Q?gcLV9dIj1hUXBNy29QzcSVDGLwAV1Bg1OdmpEgAhOOtsVDRHr1V7BO1C45X5?=
 =?us-ascii?Q?8A6CTON7/AaLzOHS5n8fWSzxcL55PpwQ8wtWh99Nxs2znkea2mE4CLO81Hre?=
 =?us-ascii?Q?j5trvllsZQfFsdomumYsxrs3wckG4XfR9xl7C7Cfx45ZmTNIU65EbAKxC0CZ?=
 =?us-ascii?Q?og3pqvDjUj5BFLkK1AYsgjnvzAFPf4D7mxbRLlVN4KtE6QZmNPpj4siBZmCd?=
 =?us-ascii?Q?jR4pxg2C+pBaxVukow4kmQV2uAdkaJaMhRgix1th2I+vYGizTJUBhTcJLy8m?=
 =?us-ascii?Q?HF16veUuOCqNtVTWXdIlfIo9Qlpq4SOt09H2tD+ilY7kPQzqyEG0BJsdXzfJ?=
 =?us-ascii?Q?0b+7gyIZZcNSlTuai7eo79u1GkLUTvnt7sMO/NVBFqFjbNoNBsOAtNcCdDGR?=
 =?us-ascii?Q?HqR9L5kBqPh7if2TGTccakxzDLpenRrbXLhSFCT4kh3oPWbe33XuaSCJKG6G?=
 =?us-ascii?Q?lvgigW82gT29h3ZNbqui9mhDWEZCCXB+P1A7jrIuPDZDf9sDKZqsDteXcDas?=
 =?us-ascii?Q?OlMdLoVZ16FBlJOBzwV2MNo8pWTDCK+S7KVRfnBd2JqioFCDZ+ObNZS8RRwn?=
 =?us-ascii?Q?HCg42UYSjgd5gBnT0l8AN6MoCoxGajBX/qRhUvuwzZax+asFCl4SXA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5cBQvGIqsRABIiRH/XHHXB+8/JtC2wkT01MqyCZWQJ9H8J5fx5Aioekk14XF?=
 =?us-ascii?Q?T3l2H271RhzJc7Q3V9nZyVP6ZJlAiIQGn4NYGqpQcfAhN4HhE+GYhDdG6+px?=
 =?us-ascii?Q?9wy3sRPmeH+ICQjQKGmSX7wbAPOc+DDpZ8BBBa4Ie38Vr73XxPkiQvX4lKCW?=
 =?us-ascii?Q?onB1/OJpLsK4nnPoKib9ihABTfs7s/dNdR+7+ljKZuie6ogaz+Ol9EyapuH0?=
 =?us-ascii?Q?o8VL1p7zuZQJvMYwSrk+b+I1fpHkZ37o8hCJysEBg74K7TwKs5QZlQvqIvZy?=
 =?us-ascii?Q?GJcfcoofJZ/VVOZfwLya/TolQpUy/ORflooI+8+cW7COOZEc8if7Z/cxHUAJ?=
 =?us-ascii?Q?eu93xBOVh9IE90+De/p9BGMpPoVchZ3l98B4Ns3U83O7Bk2Hxd8UyP7gcIhO?=
 =?us-ascii?Q?TQyJCAxxp0DMBPdU7Dz5WWf4yW/rz4x+g4/dusIH9fzFYKjpNXwoV4+5UwMU?=
 =?us-ascii?Q?Eql+ptPnS6e1O6TeMRA9Tkg/22xT7S27wcuETO+xsJt/j+CYK0jB9kmTYYqS?=
 =?us-ascii?Q?/NzZlHQZq6Okh3n0zZkXmrxzZlbwdUnu97EXytBtavIhTGGdufuKTNCNlmU8?=
 =?us-ascii?Q?3jIuYr8WlLVSyrDM9XApJSNOXaoPXJ04fvAK/Ud0jt40UPMtMVX3fj1gwvWQ?=
 =?us-ascii?Q?MvtORrHKkSAzItdT9/TpqJrukFwx4UXqe8xZi1TRvOWwYPhPf6ehBbNrYHGN?=
 =?us-ascii?Q?4pxs7b4ELi9oplsxj5pNr3UaLmE/5fJW05zOpTqHS5LsHlnKwPKF3BhTgkmF?=
 =?us-ascii?Q?8gEEBUdIw2PxwmQ3yQJ/UfICfWRu+oNXSde0OHFQDBEAI1LmxKCwWT4Rc15W?=
 =?us-ascii?Q?LntTNh4eib8U3uNLIj1OnsjapIsLcw7I+uh0yPyo239sO1zFWT0hmMIpzVgA?=
 =?us-ascii?Q?kz/Ko2WVjhBmZJfRyTILbe00NYvePUpa9+8L6wkfD2f9D1NPrA93nl7SOIon?=
 =?us-ascii?Q?z+ZhMAk52BzDrinUma3XnPvEmv3q+Ks+F7qSFPIoJNlql8Omh9CO5niAx7aL?=
 =?us-ascii?Q?fLUjM9AaXUpQbUBwrXT7xLi4vYH2VVBuOKf+FN6EEhNUwldHgsPlwm/Ru0Vf?=
 =?us-ascii?Q?nqQJoG1b+S7imxvt23hj9Wnd4LS2X45aFgfa0ng6L3pwoS8SAklHJPRrgSVC?=
 =?us-ascii?Q?Pa35iQsTOYmztB6gmVA/YS0uPvVeA20zD28hEz+XFYeIz1t2NaEUws3llkvw?=
 =?us-ascii?Q?GwxLMM8NZTphp2YQmsEXfW4p1B/GuEzw5PHThMd4dSkkPaZ1+XBKBtn4aIUF?=
 =?us-ascii?Q?xRahmcj50mgDYW8ol3VKGVT8XBwt03bhPNx50Mz95r67tBLzvhHmhx/hVxpi?=
 =?us-ascii?Q?oHkpQ9/OzV0mfr1gV7JDJfffhwPoU3+DfQXF4vSM8h/OaJ3eQXO/Y32/r92G?=
 =?us-ascii?Q?qOC0zeoHydj+3Gmnutzisp+r1vmqN5Sz1n6wmgyxr4feQiB0rWGVb5MSCs9R?=
 =?us-ascii?Q?tMiRRNS48SMby+3yRrPW0+WoPrhe5+5rDmDo0N6DtvueBPxMP1geyRBnYe1b?=
 =?us-ascii?Q?/K+SUeXIKy6sy/+yHMUXjParXsq3UQWXMc5PClygUhadnLS6g1AVK0Q2hlnD?=
 =?us-ascii?Q?k9X1IfxSBQlSEFG+5E/b+8TPJZfHO6sKgD1shaWVb6nYLScak+Z4x7+xW6hk?=
 =?us-ascii?Q?fgc1Ib7NEC2rPf0UQPeDqHY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde610db-9698-44a7-3e43-08dd76251508
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 22:39:39.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmqTRfoliXp61lx7GhN3XH0ch2sT5FGXiCVK7iq4Sqw/ot2kPlpV/AJDEg7krUdWQFEBh/CI7gXB0LmK6c1m48xDqDMFTunLL2ckbdAtIHBcYKx+b5SYQ0+8yx+Ig3LV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15246

commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
"eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
have duplicate DAI ID on same Sound Card. In such case, we will get below
error. To avoid duplicate entry name, use RTD ID instead of DAI ID.

	proc_dir_entry 'card0/eld#0' already registered
	WARNING: CPU: 3 PID: 74 at fs/proc/generic.c:377 proc_register+0x11c/0x1a4
	Modules linked in:
	CPU: 3 UID: 0 PID: 74 Comm: kworker/u33:5 Not tainted 6.14.0-rc1-next-20250206-arm64-renesas #174
	Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
	Workqueue: events_unbound deferred_probe_work_func
	pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : proc_register+0x11c/0x1a4
	ata1: SATA link down (SStatus 0 SControl 300)
	lr : proc_register+0x11c/0x1a4
	sp : ffff8000847db880
	x29: ffff8000847db880 x28: 0000000000000000 x27: ffff0004c3403c98
	x26: 0000000000000005 x25: ffff0004c14b03e4 x24: 0000000000000005
	x23: ffff0004c361adb8 x22: ffff800082f24860 x21: ffff0004c361ad00
	x20: ffff0004c14b0300 x19: ffff0004c14b02c0 x18: 00000000ffffffff
	x17: 0000000000000000 x16: 00400034b5503510 x15: ffff8001047db447
	x14: 0000000000000000 x13: 6465726574736967 x12: ffff800082e66d30
	x11: 000000000000028e x10: ffff800082e66d30 x9 : 00000000ffffefff
	x8 : ffff800082ebed30 x7 : 0000000000017fe8 x6 : 0000000000000000
	x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
	x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004c15b3600
	Call trace:
	 proc_register+0x11c/0x1a4 (P)
	 proc_create_data+0x3c/0x60
	 snd_info_register+0xd0/0x130
	 snd_info_register+0x30/0x130
	 snd_info_card_register+0x1c/0xbc
	 snd_card_register+0x194/0x1ec
	 snd_soc_bind_card+0x7f8/0xad0
	 snd_soc_register_card+0xe8/0xfc
	 devm_snd_soc_register_card+0x48/0x98
	 audio_graph_parse_of+0x1c4/0x1f8
	 graph_probe+0x6c/0x80
	...

Fixes: 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs")
Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdmi-codec.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 17019b1d680b7..bc01ff65bd6f4 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -842,12 +842,28 @@ static void print_eld_info(struct snd_info_entry *entry,
 static int hdmi_dai_proc_new(struct hdmi_codec_priv *hcp,
 			     struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = dai->component;
+	struct snd_soc_card *card = component->card;
+	struct snd_soc_dai *d;
+	struct snd_soc_pcm_runtime *rtd;
 	struct snd_info_entry *entry;
 	char name[32];
-	int err;
+	int err, i, id = 0;
 
-	snprintf(name, sizeof(name), "eld#%d", dai->id);
-	err = snd_card_proc_new(dai->component->card->snd_card, name, &entry);
+	/*
+	 * To avoid duplicate proc entry, find its rtd and use rtd->id
+	 * instead of dai->id
+	 */
+	for_each_card_rtds(card, rtd) {
+		for_each_rtd_dais(rtd, i, d)
+			if (d == dai) {
+				id = rtd->id;
+				goto found;
+			}
+	}
+found:
+	snprintf(name, sizeof(name), "eld#%d", id);
+	err = snd_card_proc_new(card->snd_card, name, &entry);
 	if (err < 0)
 		return err;
 
-- 
2.43.0

