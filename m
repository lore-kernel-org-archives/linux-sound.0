Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4E70801
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 01:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733709545; cv=fail; b=Rs6pMoAxYWoAckzQMLElA6+g7fhUjR0FN7o+1/JNVu/tmgA/aggH2h17GGsr2Nt6GgKIuMFzHiDMCbNAa4vDFcgB5TsZlw+vBtTZDhI2/lK1bQc8ZBZowy02EuxLxxZvkrmJpgTGdOeUIiDM90qt1Fhwq9LzDydGxW4S0VamPPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733709545; c=relaxed/simple;
	bh=d2j+QeMGsGy8DBjoG3+wqPmrAvmEIgA2y/cOy7YnE9w=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PUNdzJ3n/NtXH9tZTAlcqTVXauRGJv4uHFnhVU+NR2ePZFdolBZw+gnzZVKG9hVccrZfInIvqh51SDvatW8PxLTd1o4cGLky2Oa8BUbwax+Lge/TfaqfFRzkrDHm+EzCFfBVxlf9Y1Qv7rQfMSkC4gGiIHaBxnRzKueM2CuG01Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jylUEm8U; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jylUEm8U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SELlNz5g0WjIUAAYJL1MHZIPb21sGHnw4S3oVM1ziTnXZ5xTL9A0YVO93Qj3eSTDRP5KyvcehzMUztnPH2QVpd6UWWEcvTiXN29LY6Fy1Pl1KxHVzSnOS7/OTpFzO3ZvHGiE6lOUO6FNX+0z59BES6F29p4JcMUZ24YBw+yW8dT3XLaoHwHLgM/jVvJ4NfMZqLWO16HWH/Hqi4H1iJZKJ+pFqUhnyd7xcvHCtvUUDu8YZEYDFGDdzH78rrzGBsXQfk13Ws0tZo+mqIXEE+NUlM5NrCW25zfo78ldIXCusm4uYPtCiPiNLgx1GzRaQ+X1dsBMIxL8D445fnRxKOaG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDXjMqSbP3sXNB8i1lm/h8mzywlhpK0/XaQg1UYHWig=;
 b=Q06N7XFyxFmu1z6Ze8Y+Nw/6tJkEwRv7h47geumyKwYJXi91MLPefrlqxiZnO0ALxbJj77r/yGHdJOYkquU779AE/Y0tm6FMK3aLopoFMMguOl1GUwaYGBrD62woZnBXrEGJO0hGxIEGHWiByCexfYgS3mIE0FUW4buQo3kppTWfCgxOF6evbvgylZflUOhiyS5rZl7kMcsWJr8LWXlll4ObZJsf4SIeLenAH72pO9td37Mht5r1PcCREZGOJ8NCTNMiC1sWmjl5WsaKNWJj+0QCQXVzAyF0l+OQOCSP/z1WBn5Fbnn9evz6wJagStuejDax+BDh8DNPVkGJb6n7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDXjMqSbP3sXNB8i1lm/h8mzywlhpK0/XaQg1UYHWig=;
 b=jylUEm8UmX4efttjHxVXIb3OLimOG98XI4ZHYZoUz1Gy/gaG28c4CB4iB7rZEf8bMAr4yeu/dc35Wq+v7sJTDzAKQ1A4GU5JoW2uObXpEGO0n13hmnb/BhbSBHFOvdTl0VBnfBJXYBZYmLehpsPe/MOviyXG2UZ+CcNhj2e5cXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10495.jpnprd01.prod.outlook.com
 (2603:1096:400:307::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 01:59:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 01:59:00 +0000
Message-ID: <878qspobvg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Mark Brown <broonie@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun
 Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
In-Reply-To: <20241207125222.7aeedbf6@rpi5>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
	<5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
	<cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
	<c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
	<3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
	<20241207125222.7aeedbf6@rpi5>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 01:58:59 +0000
X-ClientProxiedBy: TYAPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:404:28::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10495:EE_
X-MS-Office365-Filtering-Correlation-Id: adf30f68-998a-4382-80d7-08dd17f50c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D8B9/+RGBMsZzzPmSN7Hmbi0CcMAG/n9eQY3NrrAqixFU8znLC/T57K0Sm2A?=
 =?us-ascii?Q?YaU2x8Gt61w0CbvmVrzc5Bkbm07v6fAg6MvEpAi6PePcVTruzOEekW1izfh+?=
 =?us-ascii?Q?WvRyR/V4oh7scs/g++0s828k3/G4vz08eMYoRLxYyq+b5V1ZSUlJC9UQoLFK?=
 =?us-ascii?Q?QCL4Sv1UM/635fQ3DnLQSxIdoJALGt8jHX7XZ6HghyiaAgLqVTY4BW1ZJbDa?=
 =?us-ascii?Q?H61O9C/j6E759AJiCWM/4xWMIjRvCVMeflhRa0ewi6d9V86ZdrcnXMBd0RLy?=
 =?us-ascii?Q?+/3gTUE0atCoplED5/Gf3VgiKfIjnlgrIBPLo/6TRa8W5PTZiG4va+huT9gZ?=
 =?us-ascii?Q?wvsfm/1oqsiONN9Qj6mfIUrKHg3Hse5R+MT50B8Mrlq+BJlVX/A3oYJ0iV+5?=
 =?us-ascii?Q?ksFsoJFi2YX+CherjuYBtJDkYnk4h5Aucz7oRWPHJJHrHkmB9xs1AebrilXO?=
 =?us-ascii?Q?DwRzd3QS7wkiPI0MEz+EhdfSjbWX0Yyuv3jqbUqUUQxskCDBOXzdmBiy4TRH?=
 =?us-ascii?Q?3obrm4xFQeOySdcoPEVPcK9LVM9/KzeK6XwvJ+3Q/H0o+qDKkOswEiG1zDCK?=
 =?us-ascii?Q?IUoR4AunZujohPYe+cWjK7nIdFlo+y8HstlfhDCmnfm9ZT4yt6sD/ihKBYUT?=
 =?us-ascii?Q?4+/VaE4japNvJA0DdKl7Man2JTRzuT7hLvHnmhkIDj/AuOdRH7EyU0y+L9fk?=
 =?us-ascii?Q?0w4sG5c4bAFuK9mjmqk0LcGn/WTldRbpSj5aZEDlBl/r+fXm85KdF93aQU/q?=
 =?us-ascii?Q?Dh/FhwP2tIfhz0qXTZ+fecJ4+XkQjEZN/dQa6Z8vugjzk2v/T5GhQ4SYxPWG?=
 =?us-ascii?Q?YBbH6XHjIQw2MMCyf08fRvX38OkGb9q+LDmY+OR6D3sz5gNqczsBjiqXMJnu?=
 =?us-ascii?Q?2y3l13uA1f4adY7r2ztmgSQf/jpUmSEvhVL2ATsn3ShICQqX70zOrqOHKQPX?=
 =?us-ascii?Q?EYZqbGM7UNh2iHeLmZZAM09pW2HXUsmak6DQEh4gDWugt7sS6u1NNp4eb8Mx?=
 =?us-ascii?Q?SwZ0+Ff/CitqmbY0LBi6zhqEnN8tGMpkb/kBQCLQ87j1YFQJJl+n8pA5sqfA?=
 =?us-ascii?Q?UyIMwIynBQAk47UMthGbLhzP2AviyuM0N0Og2zpqpagT3Up8Pl3+NN6tyApj?=
 =?us-ascii?Q?uyfBn3gLC9S+lL4bKXJD4uEk723dkjZFSzEYzZ4l7/l8IbAC55DkLLPey7Pv?=
 =?us-ascii?Q?sBJszrsmA5HJErsxJ6iw8tLlbcQK1YeQZfo5lRk13FZ6ONQzUg1INYPTCdUL?=
 =?us-ascii?Q?p8A04x7G1OlnxMt/8/Eu/45pFENMN8tKrIyQBrKI0rG9QyoIaxIt/QQDrJeg?=
 =?us-ascii?Q?Y5C9hoJF0FW5/tv+n/26Q/gN0+BLlRr4G9tvnKOyZXS4K3RaGf1arzdatcEP?=
 =?us-ascii?Q?lltcyTo3SF5ocJgZKHWWQgBgpxFgwiaYptOuEOuosgO9pT0r4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VeliewyfEh2VWcJkvZoIWhgZgZI04HuvokCnE/7R53ruPLWQvl41orXkjOsH?=
 =?us-ascii?Q?mropq32RdH99fLrI/vtY1c0sHTuoDNgQFC+D1yyWwBzwdI0O3E19N52sym7u?=
 =?us-ascii?Q?ccWMfUnVEFc65r/bI3f1Qo++zlzMRF9Bqg4rMjD/v4JJ2+Wu0L1aOJq/OzBf?=
 =?us-ascii?Q?kyx3lfSuszqSAug/mK9ZDjuBKCAzBsMWwD6T6OMoyhJsrOhtfMUbnXo0UyYL?=
 =?us-ascii?Q?4nVXmvUX5FXlfFN0YTpsPjyCrxLxmOSidTGkPL/SBRO8drXy/I4csDdjKIhp?=
 =?us-ascii?Q?cI+NuWZn4AoekB5vk+TlcCGtcatY096FYK84xrXS6yiwvB6SFRDOwE+XI+YV?=
 =?us-ascii?Q?d5p65fK2acE9alibP5kjK/xwKOegCzOv6kjL82eTi4+2kjtCl89mG90yr/Nv?=
 =?us-ascii?Q?W7WmzWQnk3MTxcfOdLRUzjiANmVNfk/8mN5D7aH7YLgy9bVT3NvQC8h53HP2?=
 =?us-ascii?Q?bodczB5PftoA5IBDlvATRDnfht+LFBJQ6tgrGk+Vs+gmuYV3NwAlVvzHkhjI?=
 =?us-ascii?Q?mZ3Dlz0NaHEo+93Ho6B4rYkDiGI+9zEktc9ro/vV1/CKLAhDeM9/2DWg5IOt?=
 =?us-ascii?Q?LMZ8jReBDXbPPCMidsusC5ry3u4jh7vQvaoUD8rgKg/k1AfH1H6KaccmUp+l?=
 =?us-ascii?Q?gRTS2Fn/phOV5y02SP2aggSGH5MK8C/NSe26AGezHeYGfV1ci2m+oafzelgi?=
 =?us-ascii?Q?ADcG7ue4mvYlrnrRJf2lb7+EecKxItbcLY4QVIJiyUxvaIruV6GHhZ5EQktQ?=
 =?us-ascii?Q?9Udn+vam9Sw+J56RQVNkU/cbGt8oqBdpYphVQ1Lr2ruIz9XtYWtost2P1Vhc?=
 =?us-ascii?Q?ObiGEbYDUJfFNYEi2dUh9lOsdJPSGb97orrcNsJdBgmheqXhpnF9bhj3hXfm?=
 =?us-ascii?Q?M1eOpRLDcYjPGZGDgkdiSgsfonqdnW/a4K6WbAMEdLADC3y7+Op+cylokNZ5?=
 =?us-ascii?Q?07aTWmptPEGHQjW/hZVS5TPSFXbCd4gjsMcIUfAFHggOCeA9594RoDAhIw56?=
 =?us-ascii?Q?HNdTPliwMoaBD9L7y6KZmO+eLaFQ9Mu00rEa6FOmoy8U/o+zS05KonYYSRo9?=
 =?us-ascii?Q?8ms/bY2C2WX7ko4OGQPrnBUGqt4yYJK7w/zaFZ/JyerbSlWGtNDxTvino+lQ?=
 =?us-ascii?Q?Qpezlsv75DVKVCsAaxjlWWnS+ENjs60yR1HDtLIhOMu0aVnd74oPpJD80u4D?=
 =?us-ascii?Q?UAt0R8+3BpSMtkyRdeVNchq/3zCgFWcKyHHh6DU77Tlkac2RcEx8isMM+GyN?=
 =?us-ascii?Q?1tGm5ZblP+Ug8LoJplhq16Ozx+vk5y4m2BLoplJmoJMk586Ys9ucmX+n8MQt?=
 =?us-ascii?Q?VKg+gqCzhL7uFHH4OrPRGesaR0Ay/N5poF9kaXGqIxG6eQqj+DPLhTHHpc6P?=
 =?us-ascii?Q?EkuntBuLNTf4ZXzfwgtrRUrObBTWzjmqsyqBltB2FPbtFSn+YU7liV6P3r5+?=
 =?us-ascii?Q?ttqtF3AcNqmU/f2zQreSxfqS6MToksDbwS9WHwd6LMEuJISfm3WJb5qUB0T+?=
 =?us-ascii?Q?CeaqgS0RlUfhZMS0vZfiUtWMXIpM0P/PSIdCLCjErrKbzYglqnRaGk/zsq4T?=
 =?us-ascii?Q?TQDVeknMkWZV00FUvV7TJ7mJyLzlyu9eeXZS/mRZ0bRlwA+QNx7NPcilG28Z?=
 =?us-ascii?Q?OluUfvoWZHNLDJC9NYjBcTY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf30f68-998a-4382-80d7-08dd17f50c57
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 01:58:59.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxOU4NAeUwTnJdmMIvakMv0RwKCHN4Qg0YPpCzpuj8jaCEx/o8hE2R2lAMTKD0fR1uIO4TetuTDlBLF22Y6H78tYtv2qcoQDTAfyLR9Ho1meTkZZfGxAeIfSxe162a4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10495


Hi Stephen

> > You should use one of the audio-graph-card bindings for anything new.

Using audio-graph-card is good idea, but all
simple_card/audio-graph-card/audio-graph-card2 are using same logic around here.
So, you will have same issue on audio-graph-card too.

> > > Basically, simple_card appears to set the CPU as producer if you
> > > don't specify a producer. I am not sure whether this is a bug.  
> > 
> > Well, if nothing is configured it's got to pick a default?

If my understand was correct, your issue can be solved...

	dailink_out_master: simple-audio-card,dai-link@0 {
		...
=>		pcm3168_playback: codec {
			...
		};
	};
	dailink_in_slave: simple-audio-card,dai-link@1 {
=>		bitclock-master = <&pcm3168_playback>;
=>		frame-master    = <&pcm3168_playback>;
		...
	};

asoc_simple_parse_daifmt() is just checking where the node was codec node
or not. So, if bitclock-master/frame-master were produced, but was not codec,
both CPU/Codec can be consumer ?

# Clock producer/consumer settings is very confusable, because it was
# Codec base, and has flip, etc...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
