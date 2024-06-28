Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279417C2;
	Fri, 28 Jun 2024 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719533895; cv=fail; b=BpEjdbkq9ccDi3SEaNHoh8aHoO3n8JwH+HsIzp+AGc3iBUlBdS+mhDpkJQzEJoVBZXr3nVd4cB0IlTHemhEBCzekqOf1jHcGBY0KEU47d8Vt8Cln7re79lAguC6/45s3YAml3NW5QLZT+QrMlLuY4vX6Ty7A8nRSlb3KpA9VUBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719533895; c=relaxed/simple;
	bh=3mMZMreOBK1v3gCv41XeZMMSN0wGR62KcHCKByxHwl8=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gXZIu2uCfSKB8e6XCwjuoV8iaTfsSgv6SZt1g+N6BfdjkS6dI+807i8rOX2YLo122Ei8D+I1mfELqmLA0mBEAtTFBfKWlEnLYBVwOHRVmURIGaANwJThSBvrsK55pQg8QsIaJ8zPE9EW2S94oDhH2o2aBAtCoCgd59YdQWMIUsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RzRSUe+N; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RzRSUe+N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFTCgcDKH/6SUOMtDgJ7EmhuJepbqfLYeg6cMXbJWb+oBkoKGgZqyC2qVwCTx5Yb8qh83qyFSCXiLuC5S8O8ikr/AnLM1AJmHYbSCjn6DjdxHc/+lunHxuGgJSiQh2gKpIhGSj9CmmoNFFWpVyXWSgwoE8kAumkNd7IBlt4OheUz9L3PLjh9wO0sRsOajGOYnCu+BQDyu4ykv38Phm9ZyekBrKatkZaLoqgT44ELQFriw+a6eFU1amWQSIndjv9iDuu3q63AzktSnMqVHnwGOX3s1ecehCGOMvtmYWjh5OXlSMPk1tZPv2t68pCvWdPpghmLid/MvyNKMkfNvcCp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB1HpjY7gyy1kufxC1y8GbNtb/kFxn6uPI5+T853Tzw=;
 b=Bf9Bter1WOEUh6dIa1VbRQAFsCdis8c5hTiCsAIDXohi17e00LofY0NVlHycWfeHpZmniQ3+1Z5mMuS5oMrEnVNeZPwVSJtAGxmduFaclFO9aMLxMFmHiXPvq3DVN+oNTccC7ppU59+9c40c/S/owLiwZj/TN4KYvfNv0Lgwvx6Qx7BcWr/qJU0oIOIHrU5FpsKL42GH37hGGvBv/OmO/ZSteJrk9QNsk6qRbi97wZnpqGWSLQoLCCzbYuU1kh/Hga9w+SoZEW3kbBlUk3Ykp9OTfB9ZaFmP7D7oEnwsAB/7+ssbBEiZ7vHzoFeqm2lUPnDs7VPXqEWVafWlTUX/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB1HpjY7gyy1kufxC1y8GbNtb/kFxn6uPI5+T853Tzw=;
 b=RzRSUe+NgaE6PCxy8ubVi9m6y4PpRTqDNlNLycrlUfdP1zb0fW9/ZRWHLceQCSBMRBseo44pLTcNAu3Hr+tMfnh+Hhm4DG+Eh7GEH01iO1R7ion2Oenw03DE179AMiqNnAVbC66tE2GTa5xdZ00VGS8qBTWAPWAKgptNJqscvqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 (2603:1096:400:e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:18:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:18:10 +0000
Message-ID: <87o77lapj1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
In-Reply-To: <87pls1apqb.wl-kuninori.morimoto.gx@renesas.com>
References: <87sewxapr5.wl-kuninori.morimoto.gx@renesas.com>
	<87pls1apqb.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:18:10 +0000
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 92888567-6f69-4f94-33ae-08dc9707cb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4I2UzCbZvnawR8y1nWoGHdcYvSZ+rU1+I4jCsHSVTxJlJUvOm2vz4jMejuK6?=
 =?us-ascii?Q?r0yqc0ynWJb8Z6ilWA2V4u/p9r6te8HMdgM2wVsY8ThJxGRfj/a7muPx5F8Z?=
 =?us-ascii?Q?Kznl27GXnMKMynRikUqHA+mluPBKnRfZNqRopp7FNgddp5ZORaZfwBNKnsQO?=
 =?us-ascii?Q?Dm38Nh++ETuLykCAy5706P2xNopyf9IhFoBLgyd33MaCKwcU2SNCQ7u6NxL7?=
 =?us-ascii?Q?JqZUrrixaq0lkyxpYbkPd1vjBivzAqQcNFqfrUR8mSSXjkM7sHH4YlGhLBVw?=
 =?us-ascii?Q?tKZV69eRxMFNNEF3Qfhx9hVpb4sEjuRo8ktHo4CiILl0/d8cYUiQt+iytdxm?=
 =?us-ascii?Q?Xm56+DgsQ+6GqSWIZdOFN9UIR6E928yUGIyQNQbsOSWcQ+vxtopRCVgalLxW?=
 =?us-ascii?Q?MF3pwaKMT+HCo6Fy2+LBqUv+xZb9+r8rlCp+bI1SJy+WK9Z3r/i7sDflWLee?=
 =?us-ascii?Q?BxC/JPioWBXejiRIHr8xVex+xx+ak69OL/MoztHLX2IK0CIG6i7Fd0Bvra48?=
 =?us-ascii?Q?wEN7il5VBR5lgb8MX4nZ4cpzgAiGJQtBoDknAelQOpEVFnimGRh82ZbSFFqq?=
 =?us-ascii?Q?NJEv3GseO2rFaXrkJuW4KX/VSiNo5lvDtJEXDZ0VvcT29xJXsJ1VnvTPrcDB?=
 =?us-ascii?Q?W6I/YFkgTeRshiPExd4shum41VGLDBzIEOwPjY9Y/26JzeHi+S8tJd1iDt86?=
 =?us-ascii?Q?EtXxJTfhupd9AcMm5o84bOY2S91Mim68Do0ponrHnF4GpNQ8Ke2LcNxF5Am8?=
 =?us-ascii?Q?3/efKb2sZ/lhCBcprMpRRCt461MGCW7PKK4tspKlP4hgNdnuookThHjDvu90?=
 =?us-ascii?Q?pAElh64nWUQrJNtcORpZ434Et7tavpXYWVRbfRZunYt+PHXWK53/nm6cJzA3?=
 =?us-ascii?Q?V05Opydhakpq8FdKu6g4bzymWQYK0Rib8e8F1MV3i65kGIiQ9Kf+PuS8L5x9?=
 =?us-ascii?Q?2gtnEq00NGiNZlfiNW3HMBmpETOBg+TQU7qJU7gtvw96HcJ6jvQmHg5doZRl?=
 =?us-ascii?Q?JFr6IkTnTNdZs5R2w6VEgdyitYvexv8smegK2HuzzFGPD6Oa19o2kSs8N3XY?=
 =?us-ascii?Q?JvBLhY2Snjso/sZAPw1v2a0oEz+hjnDtCEgrDyjO2RekKf0u3+MyxKqtJdPj?=
 =?us-ascii?Q?zjSCjokSOH1Tvyst0IWDGa7JMm5y5YOELU8opKtfKPPN26imFTq3WyJLhikw?=
 =?us-ascii?Q?8MAKVxtrI9ShGB3jboEtBUfm0w+bUp22O7j5TmEjCymk/bmmO/s8hNpY03gV?=
 =?us-ascii?Q?d694h4Wp83L5UovCvhjZMeyPqzFWE+GCfHf2Dz1adtuy7hLrXfLHArx3qnBn?=
 =?us-ascii?Q?BlmzjtiD6BhRvaKA06ByCXGWdKFEgwVxUPHrbD/OKcTV3q8irnE1wLVSvLlC?=
 =?us-ascii?Q?D8dJhqC9ImPlGLV3gq3b7u+yjmk1d0Yo8tNRI9ruRcEleCryY4gt8a6Yrgo3?=
 =?us-ascii?Q?V3tjv6LJdTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LmsQpJTPV3wxuxj66fYGfMQqXx/pID2oAnjOzgsKRDBG+dggzP0mfwG+Frgv?=
 =?us-ascii?Q?eZ1x3t6iiwsTyaePu/cF1ClQrOLIoA80nWsrg1LKJd0a9NsK/OCGxGX+yery?=
 =?us-ascii?Q?LsKg1kQN5nH/C2XXLrdDCnw3Pm2X3GXpWnXa+5npe66vLQFizJeTp3mt+yPc?=
 =?us-ascii?Q?rfEi5X0qjZCmIWivs5ZluejMiD0AaJyxXaDTazDmSc1TzTgygj/oLPjH2L2I?=
 =?us-ascii?Q?Jbm9rOMmBWCkF7UFGXSk+/C2FDTv8RM9IICgKsCy/GlrAHwYpVC8oRqnbXY+?=
 =?us-ascii?Q?0RLD34kzo3hIDhgY5zynotPehG6bz8P0EYxYv++1eODUUThZ58JUcfA3wa0v?=
 =?us-ascii?Q?yn6QIoELmozncnZ+VJrEu4QTz9CqpPxvSAjiObp6n9ZXFV5SkxqMXncDo0H8?=
 =?us-ascii?Q?GVmT045di+VE2Iwc2ZUEQimTZoK4oH9GeN3QD3IlyGwAEdlQC6TY/NKB84XX?=
 =?us-ascii?Q?bN4iQ2KPhsdyOy/Jp8H8CKtUfZA/bgfFYv/M4+2cjgZ6FOtDNaJiVculzO38?=
 =?us-ascii?Q?bSC4+iBbYxikaOfjssksrsyaQkERip9bEgMQ1tgBgTY2JIxby6ShgvP8XzNN?=
 =?us-ascii?Q?V7sbGwZ7Zuj0dnIXlYUhTkg7pwlvuXUvKmJ22wov9IjWc80DkHgVm4hQPx8T?=
 =?us-ascii?Q?ASEnL5Rj7k5ZnFDM7mk5rXYpyQRL/EeEyUlp8s0Bts411kNgX25do5UgMsMO?=
 =?us-ascii?Q?2+y4sGwygDaWMUw+Cxt5+Uw62nlsJlNx5ziOLijRLtlQFUzQqukh7YyYZ0fX?=
 =?us-ascii?Q?cn3TghZBtRRqaJ+ggZdZ1CTiyK8Ee8KtggtbZXzbK7jYUuJiS1XhncHDKwlH?=
 =?us-ascii?Q?/k0PkDcgiA1pOS1dj44UgzyIQTOyeUj0OtISQN3vwGVOlpBPwHSN2SQGwsx8?=
 =?us-ascii?Q?MGoyaYBkZCh8UiCvYwVlC9YHDRHBjm/Rh737Cks0f0b0i/ZVuFyT8rsQKvAb?=
 =?us-ascii?Q?vLWxt3hniRxpkVSvMzh/aR4EDK5JhupolEXTilKvvjZZp8H2ZmYj8em7dv7Y?=
 =?us-ascii?Q?tk48oYsuw2Ved83fVEWMSXx2ACKBubwDzUb/Noou8YmJ0z7DXteitb+/6Z4v?=
 =?us-ascii?Q?wB6+z3Jp5WdB1gEQjkwmWApyRClZB8ej02lI5abv8d/uq3Hu61DRRkpjFaaO?=
 =?us-ascii?Q?7lTDY+FscS+PH+t47U5YXe0zTOvpYiHW59WsgEclOC6fMNd7H/JkgXD6EniE?=
 =?us-ascii?Q?YM/ko+8VGdiQSuM9IdjMSzq9nujuSveoLx97d98YBL55nMj//pfSusXyXI8t?=
 =?us-ascii?Q?0sNUi6zU1S9iTxf2rJvnGY0Tm+vY/N9DJTjkXxJ55GwzwBnaQGl4nY8slR2Q?=
 =?us-ascii?Q?IXXcdDlWZ98uqBYydPd379COw+JXAe2NjDSMn24SHI7Yz6gI4jtozNY8pu+M?=
 =?us-ascii?Q?0xguHHGehZhb+oe9YKBVDtTZcjHbiaZffLCtU9++6sX7tRapFQv7dgRBHm3T?=
 =?us-ascii?Q?v8N+s/i8PHY5j/hVamV38vby9IkBFnEOsKBm1qO+VNSSKWRDih43lzaxnOMX?=
 =?us-ascii?Q?MXp9txw3nsTx0DaCcLI5Lwnr5a/WHaBmRXpJjtrkml8V91rnOdZL8KMSa+G8?=
 =?us-ascii?Q?IB/zf/azBNu+iYQ3LttCKCZqjgxo5z2NoqCFkWOfutpcLKPXcEL9GdFEW1q8?=
 =?us-ascii?Q?gdt7ydkTkXj5efD300sd4L0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92888567-6f69-4f94-33ae-08dc9707cb11
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:18:10.8020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+m4nO+aSyrlOO6tE6E4Nn7J9zCGeW1EzizR5VUjNaEvXZWPfx/mlTVSKEYr7/Q0AYk2aeLRet0skclIgRsAHHGkAXS0juubp/WFbrY96omWpwe9tve+rtVBUDViDfUZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6603


Hi Mark

> simple-audio-mux is designed to be used generally, thus "Input 1" or
> "Input 2" are used to selecting MUX input. This numbered inputs would
> work, but might be not user friendly in some case, for example in case
> of system hardware design has some clear labels.
> Adds new "state-labels" property and enable to select MUX by own state
> names.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry to bother you, but I missed that Krzysztof requests extend examples.
Will post v3 patch.





Thank you for your help !!

Best regards
---
Kuninori Morimoto
