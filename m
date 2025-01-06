Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4CF17C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142527; cv=fail; b=tyzmyxMhr0C+98CLLNvNFDrRgJkYO9Y7VY5V79gywLZOYa887PCkuuSg5NHXHNMJYe7hLYmFhr2E/0nCgRNKA7U0uoVGqop8Yo7pXZzKrSh2zjk+kEgAd1FIP9WBcG5NyjHTj3RmvwaaPBdRwuvJNueFFKAI1xQD0n3ctRntb74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142527; c=relaxed/simple;
	bh=uTLaaK2MvnUPqrtxGihwmyRsb59XeWulQ3wQFfLQ3h8=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=K4Wx9U+mXLq7OlmGTiyn6z5haOW4K+9BPkklugkiD94/gXnWPcWXOThwA3ex8e2j7SoQRHoL44u7kNz69ShHIDWkvwjZwCF9r2mKEZpHO0ybnBx3O5v5TRtbN2qnuOTkmpqNEz2hc00a7txEmCc9MrQkxXQbRvQV7ECkRmbNTFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EJcuNYlq; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EJcuNYlq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAtL2HT9VApJi6ysYTPG29oP+XLTd39ENDuoKJhROcxz11OmBhKClnTi3PrILeMfUr6QeoclgRcXIMHu3D/uR6ilmRcv1apPggRg3NwxCvmZ9yHqzN8uyUUTsA0xwEcjbwDdLIdJi+2cfYBLzjPiW4vnOn75tB0LfahcS2Cz0LHedDgcDOp//kanfekqvt0IYu6XdbVLoAqp18otZFqo4S63ZdBTcZI+fh1fmip7KGArveoAy3wdcLSF/xM6cgPmLKDHG5Kh3ZU+n3FcmfLuntz1+cTbwoTUUlCrmE7eabFpIPjrwJ/NDgbwaU2l1Aj7YY2b3i7Ky9QBz45TOP+ICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rhh1w5rPRjbNuEUP6bMap87e45D5xz5MbsWKNEEhcMo=;
 b=TGnaLeKAqEGlxICdl2/E2sC3WNISspa8OIJP9yzQuj1Aq/73FLhjEVCDGS3iI37AdZtrt9D6N0bueAp3Yo9kLxUBaTY8hpzrI0VRsV2J/wnk8n8CzGySusgcOLlI6H9F8Q6xOl68XAEnZWYQJs1pdpqimJaHb+B/IJM4yhERsMXH6+itqWJL8t9pfHBh4kQdDkXopD/nwh9kRB2qHqwSvw6a5Cbxf5dETc5xJYMJ/mvmFizge+aVzTYjGN77mc10qcEeBKpnKLhaC2Jq8HplbQjHcDFFj5Tuuh5UJc7g4QYIgIaNzJmjL+RoObxzs3qYIr7C+LgXR76+eQ5lBEcJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rhh1w5rPRjbNuEUP6bMap87e45D5xz5MbsWKNEEhcMo=;
 b=EJcuNYlq44EDNWhnfKygQfMN7PsFrYQZlJw1NlE/EC6vmUo+oi0sbIuLuV9D+JChxuV4WSihqvUa7SfrSm2YKBapbTOzM3DG9doPKe4cL+mpxjMSWL1QNdsLmcWmVtse2e2Sp1YA6ezuT/d3oyHkUprgSZR1TqEnGN8mb3h8w0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:48:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:48:42 +0000
Message-ID: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Stephen Gordon <gordoste@iinet.net.au>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v3 0/6] ASoC: extra format on each DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:48:41 +0000
X-ClientProxiedBy: TY2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:404:42::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1674fb53-5572-49dc-f598-08dd2e15c6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qTTq6skWiOC8MGZEARy1RPQBW2O2rMUDlM17fnb31qQjCCU1pS98T3jetIpL?=
 =?us-ascii?Q?VYigEmI225tTQPCH6VxLz4OIpVY88z1SKyWp4dINP9He5BYw4i5AxcvIC3Nz?=
 =?us-ascii?Q?4lk/NCJYGfzQqFOWPtm4ccY2P03Ollb02No0W4utZ6fcSgUU9fDJyy7oWLlC?=
 =?us-ascii?Q?Yxz/lzv7fA/z+z+ySstHEUBeTbbbeHjJmGZmqzDgG0ff/89KYvIqNUBUR5Pn?=
 =?us-ascii?Q?a5WL3eUP7gI+0H13hENCCNtC27BJN9hdH3mHSeg0D7Zs4sUyYnj3MvWan4hu?=
 =?us-ascii?Q?qDYDCwrcJ0GWi5fkZYqfzfrZ1DrXAIg7mJ8vEfcqoFOvfMVKpBE14fMc6GVR?=
 =?us-ascii?Q?VPGIsglzhzuITue/IJ39EGa9e+i9ZvTO+3PKLiWvNKk2sSwmAalmDSRkQEg1?=
 =?us-ascii?Q?aGHJ3KdSrKp/bIFbKoLmyg17SfamzHd/XWgt5K3jocigwQ0xZJEsI/tHSIXi?=
 =?us-ascii?Q?zmcF5FpM8+fJFSIDi8K8PFs8/ZGfZumrECZgja6f9fS4o33BN88N9OrtPRA0?=
 =?us-ascii?Q?uyInXhB9tAJNPTMISoQq4Omm2FTZGccSWcKy2+22GNfnkWp4S9QU2XfU7zyf?=
 =?us-ascii?Q?SPZb2a/6m5upgKFJdCZG/2LVGup0JA5LT3B0Dkq4a5x4j+2gWAUaWUvEs+xX?=
 =?us-ascii?Q?lW0LvNhqPkMBBogAYKnX5N89Y5Vsc953qoyiMg6M0uHNS4revOLBSd5/YZmi?=
 =?us-ascii?Q?X/CsG8GvW/vNS+f3JgBhZTI1IiR8TQdn8XVmPVXjGtLdlhCU+iypCkp8t6Ei?=
 =?us-ascii?Q?2adLENXyWHxPxXkImXqu01wB/MfMCGrjD3UVVS6MvwLfr7k8p6RtATKsHHP3?=
 =?us-ascii?Q?iRLtx9d2nVtf/paXbOMdc3tbuU9VezYgmudxaHWk1KBcfLYpVHH828XJb/Oj?=
 =?us-ascii?Q?uwJvmLu23gSzqwQqGpMCiSTidskdKUo3ShKs/YaB8Q+Bs9Rk58a4PNi6l8Iv?=
 =?us-ascii?Q?BsVZcUDPJAMZI2GZ+KaTbW7jZQLSMezi28dY7KSh+geqz7aQpqadIgZ0UZRi?=
 =?us-ascii?Q?lqEOdBakhwxb+nfimYRVHaCvlcGAH3tKqInLKhrY619W2T65cw7TolLdYlCG?=
 =?us-ascii?Q?B71XypE0OZZEGPpNIoca88BHDDKrBzebsISnjrpuee/6fLX5CsN8vwl5Uoym?=
 =?us-ascii?Q?HN4jInB5yfaYeHgzjHrG7HmtiR82bwAA5bL3pSdoRgK5IssoUrJS8SKnJ2+C?=
 =?us-ascii?Q?P+7+Mpvar0By3rvi6Hbl7d7bAWsCK/l3/sscCTVGP3KF2HlJyelJx+PqPZmK?=
 =?us-ascii?Q?FBuMLg8sFrQXZN2PpkvQv6cqek2fVJzqEKtkP9XPryBxZ0ZMVqxnUcEhUrrW?=
 =?us-ascii?Q?S2j5zWeXS6YiNn9HxzGsIeMJgiO1QkNwI+dLFYB3FJJeCweJH9UaudKd4YyB?=
 =?us-ascii?Q?WjXjTbItfJT8p3EFbqh4uDbxfKVFqdfJiIQ9bmY59XbWL4/WTkzDzopbJ/QI?=
 =?us-ascii?Q?L4kYOYe7yCSjQoJGAkxszWhc46reK/3r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?an7UHHIFeC57BPdhtSpXTB039apHByx9mYMPdKeEFjyv1B+NXExDe8qEAieT?=
 =?us-ascii?Q?vyz3UKOHDG5aVMImnB3qkQZtLTQkqur5BwL/j2BEGhvIwPIbW3h8bO+zSA0Q?=
 =?us-ascii?Q?HSiFsTX/WPaIvMQCgFqzlFPhDUtSXDfNSWjVjHREhGMFURV3EH9FRmxJFCH+?=
 =?us-ascii?Q?bM8HOa7dTPH8oH7nlCKzkK9efoIF5YxmxiPpm5qgSCTbB/EEXQJW1xRNH0ll?=
 =?us-ascii?Q?OFXEkpJdZYlWEr5fvM9iLgPCM209xsolXJirG/5dY/4mUEK/CBP/qKfZN2aD?=
 =?us-ascii?Q?rijalD0lhgrD59kJ5jzcX77RL7A+7umY0a/SWn+LJCDYHX9xdPXeLuBlB6aS?=
 =?us-ascii?Q?qqh14yE0QQ3YulbkH8qj+nfTev9hmA8yWUQmJbMwCExvs7nLc2QEKkUs/nek?=
 =?us-ascii?Q?QLdpLpO53CfbqDMYOr/tTYYCS/1K0KlPotWEQ/fhzNf9ra1DDq29BgzclIoI?=
 =?us-ascii?Q?SeC/FL6aw/76R12xDmw/Ya92qttZCr098inn7NCqB5GeezSeNFH4XPvzvFm3?=
 =?us-ascii?Q?xIe1ALcI78zksp+Rw+XmEZqfyyDHDY79Sz2qbqFYkTTg3v38VyjdMe2cDXS3?=
 =?us-ascii?Q?E9ma13lYX1QRgVmiYoSrez/Kam0A3GvLLowDHTbyLWuthmwoWO+o5YM8RMq8?=
 =?us-ascii?Q?d8Tl3sMwx1iNgXCnGjVPvL5lagEcD4mXhHut2G9l3PxRoiXIIBHwAcu2Vdol?=
 =?us-ascii?Q?GCMxnXXdLiyK6pJrmAu6HxNwKbq2IKy/P5ySN2b7xB5O2eSSEVePEnAMuPTB?=
 =?us-ascii?Q?CdJxf4/QX4Ia7fSTFhG0mEyMMmI6Cv5Svy+IKS6CYRFQZRzcw2JDibgTuw2L?=
 =?us-ascii?Q?9nogoOs/6yuRkoEFhPvICZQLunAgA1wfjUjCSxWZHznUkkyEsPg6X8z/glh0?=
 =?us-ascii?Q?dMZVgSOxlg47V/l44B/NFtaeuJoy9VTZnJsp+E3KxYfNfUGBUqDB8twoW2mx?=
 =?us-ascii?Q?QykXhb2Qz9UhIXdSG2s6xKyeFcu8wKGAi8OEtLiDNbdxYmYstX/5bVOkI4dY?=
 =?us-ascii?Q?tizWD1Nyek8FBvG8vfUKJMARsSQJyoDeOkYWEzmZe6lPLp+hZiSIIY73tXk7?=
 =?us-ascii?Q?b9IQTgcsEzFSaxbaXuDnh802xxncPcpan/KlAbf4vlAanR9OoMUINc9Qpy04?=
 =?us-ascii?Q?5XbPQdU252y3aflTVt49zfXBT1lcPmUzM2wjdySIkvmc5r9QQwBiSkQjVkOp?=
 =?us-ascii?Q?OiZ8CLUZIQ6yfEMp0vTqi5C33j/JDr3DihiZ1kM6h7Qvs15Q4VPBb4S33knr?=
 =?us-ascii?Q?t9IVEfkznRrDw43/KKMozzZrqtkrsFRg2LFgBo6HMBJrFBeg6igdJzWqkQpS?=
 =?us-ascii?Q?UieBSnPI7GmV9n0JGCQMAudMKNlNY6Q8FVB4xDd8iW4s9q1m/DdIz9Yf5dgt?=
 =?us-ascii?Q?JFvmROhDHos/cUPJQengHjtLkRpoex5DbXPES1EnQcCBPFwZZwjBm8a+FA0f?=
 =?us-ascii?Q?58dTnSYIpgZzBUqqDUCatcNTBNXL9ElEhDmpH1RuVA2u4uHY2G9poVytbF9D?=
 =?us-ascii?Q?wGe/XI5ctyOwL2OxXQgZo/JwT25ANumN4Zv7IeZexemYlv1PZX1c9/r1b0wi?=
 =?us-ascii?Q?G4cLkgbETqBC58ntzj1g6CMnoEq4YhQjY7SMrIbqOJIsniYxFt9Rupcq5xly?=
 =?us-ascii?Q?Xc8Dk/G70HKcrWYXA17h7bM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1674fb53-5572-49dc-f598-08dd2e15c6ba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:48:42.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0WBmCDukrmZQ5qZhOeRG8ypwTuyxgHHvI223L/VycyyHOM9p6791GqrX4xanEZeAxom0k62mNuHTpN2pfLEI6TAQ0Rd4NABkroIZHQ1nP5NrpGv4QOgRIT72b3uvN6k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247


Hi Mark
Cc Stephen

Current clock provider/consumer setting is set by dai_link->dai_fmt, and it
is Codec base on Sound Card driver (= SND_SOC_DAIFMT_CBx_CFx).

Current CPU/Codec drivers are already based on its own base
(= SND_SOC_DAIFMT_Bx_Fx). So, Codec clock setting uses dai_link->dai_fmt
as-is, and CPU side clock setting is created from Codec base setting by
flipping. Because of this, we can't set both CPU/Codec clock consumer for
example.

To solve this issue, this patch-set adds new ext_fmt on each DAI.
It can keep compatible with legacy style.

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

	dai_fmt : dai_link->dai_fmt = common settings
	ext_fmt : each DAI settings
    
Legacy
	dai_fmt  includes 1, 2, 3, 4
    
New style
	dai_fmt  includes 1, 2, 3
	ext_fmt  includes 4

Audio-Graph-Card2 will use this new style by this patch-set.
By this patch, Card2 default behavior (= no "clock-master / frame-master"
settings on DT) will be changed, but no drivers are using it.

In case of no DAI has "clock-master / frame-master" property on DT,
it will be...

Legacy
	CPU  : provider (because flipped from Codec)
	Codec: consumer

New style
	CPU  : consumer
	Codec: consumer

One note is that Simple-Card, Audio-Graph-Card don't implement
this new style to keep compatiblily.

In Overlay case, port order can be random, so we shouldn't use get_next()
function to get next port.

[1/7] - [4/7] are just cleanup before new feature.
[5/7]         adjust to overlay
[6/7] - [7/7] adds new daifmt

This patch-set needs Stephen's Tested-by

v2 -> v3
	- use of_graph_get_port_by_id() instead of of_graph_get_next_port()

v1 -> v2
	- based on asoc/for-next to avoid conflict issue.
	- Needs Stephen's Tested-by

Link: https://lore.kernel.org/r/87r064cxym.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/8734innkpy.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (7):
      ASoC: audio-graph-card2: use __free(device_node) for device node
      ASoC: audio-graph-card: use __free(device_node) for device node
      ASoC: simple-card: use __free(device_node) for device node
      ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
      ASoC: audio-graph-card2: use of_graph_get_port_by_id() at graph_get_next_multi_ep()
      ASoC: soc-core: Enable to use extra format on each DAI
      ASoC: audio-graph-card2: Use extra format on each DAI

-- 
2.43.0


