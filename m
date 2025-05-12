Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C63195
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 02:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017386; cv=fail; b=nE7qS3IDoszyz6fVr4WFRaZg8QAQ8OIoLuENITdKdjSmUW2C8W4synIeeXskRouhDFKESYjqSR0XNDqreWDfYpPnu3oPLhLEfbS4DvSGrvG/71yC4jTgIfvHK/75bwAW0o/kIhIdFMEJVwIPgi6Mr0s1svp7fuereO0+mtY3qYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017386; c=relaxed/simple;
	bh=xAIBXgXK+4GjL2al2uSTbjgr5SoLzFhKvUiZ4re2LFc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iBxOkWFxPxDKYNMeZ8yqIWr30alxHhla8Cwqlx6PTi7+yZOrqX6/dNxSb2YujeExgbttQjMy1XFbGr5mPT4SINieIKwzIuX3CB93jCzzDmr7DsGczjINb6Q05f+gNt74rVsobEKYmbs3HlErQISj8HimwDTQH8/gpdsuRByyzYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OYiMqqM5; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OYiMqqM5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdgiUW0WA/kWN5yAuebLsshMaK7VWlhaDRIkKpJgor3MOfmpc3fgPnx1i0+ljMpQcjuz4SwkCb4ZviTkV5Zh2Fsft0gwAOcGONgmxJqOdvdygiS86ARSV9CATRjGxsiprDid3b+piVNHa1vjGWzEznhefNYXFc52ar8QFmrEXQ+mlBdZ9xAn/HhMXoRTl2/0ZE5ZX1jYUxBdmD1mDPvB08u2Au1WlijKkwsLeGTjE6vQ49eTxOdeSE9PDTaNoUtJA8CxCME0b6XpdfxwMznSG62geVo975mIO+iWyZNlzf5TxJWEWqkhGIU+LPutZCN0ErUpTpkaGcp1dYFEu/dR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2f9YlRel2/DPwHAj0/pyyFUbkHFXQ1h8GbSkpXah6M=;
 b=HP1Z23UGxtNuHWIbmUSChs12AnldbUAaV9W4FGa/OJwZU1QVWdhyFZzPlUhFOpWfA1En8F3ayPGHhHcdnC0UzmB6yG02r7729sQ4lPMe3cjYenNKshzUC+MeMeWFDIDUbrO23NLIpf1CFu0vp21Yvb1eNdEfZecgUanRTKP2BWjbdemICWUiHbl087QwTl+pIazJmZNlvVqPS3IBIt1uRTrGup1Nr7/+U9jrIFGBZIakxvbcH31FyVLuXDPgpO+I/lH1fAICRRUexZCJ143KAkSvu7NV+m5CH5akWM092QG0trEeBI54tvyCL6q/rdXhMeVZ10oma8PR0cAWzzNztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2f9YlRel2/DPwHAj0/pyyFUbkHFXQ1h8GbSkpXah6M=;
 b=OYiMqqM5a1FYd4gQp9bLmhi16EsmE9vNJ+HzzZZJQUa47L+r1i5gIl2vvNZv6DINJwH4AC4w1wk4KCJnNDlTf+jQZq2tLZZy2kk4VietU+O6BvRPqGMSfIEP7GFoXPsVah6aGeblwsSaFbR8Qmkw4P1RjsIMmN87MYZHwXHXZOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8802.jpnprd01.prod.outlook.com
 (2603:1096:400:10f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 02:36:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:36:22 +0000
Message-ID: <87cycey2qi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: audio-graph-card2: add missing {hp/mic}-det-gpios
In-Reply-To: <87frhay2va.wl-kuninori.morimoto.gx@renesas.com>
References: <87frhay2va.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 02:36:22 +0000
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fb7849-4c63-4468-2e1b-08dd90fdc871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gVMmQwAmC1QUKu/ZkY6LCvoczOh+CBlG0gMrKH9xUL6w29tYpivGJyjr22kt?=
 =?us-ascii?Q?P5Q8mIA0uin9mwzqNMRdcca73oOQ33CScaLwLtg9YyaK78erAfaptfJHzo8n?=
 =?us-ascii?Q?T8p4U+PCwGuGQUnlacHOhcfO+oDrZAVHGpkaebU4rhwvnAB+tHlFY0shRz1t?=
 =?us-ascii?Q?rkJELGNPpQqHW2EzZEjreX800ejUMKRJ9XpmU2M3H2qPs1+ln9+UpaNahaAo?=
 =?us-ascii?Q?nMLbRAKSEC/e5wmx+V94yWIwNTRP+V+CVvKrk8cIwax5mtAph2WUlG1iO7SD?=
 =?us-ascii?Q?/K/pr719OuGylgx4e61unu57AMNEtotDb+1fcg6uO9b2VxoFGE7vuVsN2exT?=
 =?us-ascii?Q?lv0TMA0Bz90+jXlc/O7sC89YVGH+dzYUrpSYE1m2WR8vg7pGIui4xmHl/dLG?=
 =?us-ascii?Q?ZPUzxgZpTl3x+cpponu8enpayCAlpCyB5C4FBhS0FBmKEyIxK+RqjRaHvl1K?=
 =?us-ascii?Q?Z839w5tBRQKo5aQwFIO9mtBh5U+fyczCkkJEewk543ppDbtIT99vZyBgeztK?=
 =?us-ascii?Q?RiNbCnIA2CMhKBBWfYJelccnggtylVFNbdqTRKDfi1QpBiB0wFd4ulcgIhBC?=
 =?us-ascii?Q?sT5CuW9Bxps/IP03X0mLYHOOXoxnGRi88dVV1mYjuLALK9Tr2ls3Z6oV0+au?=
 =?us-ascii?Q?JV35u7ZKxTMEYcuK++gavPXsqPBy9yKXmjdiYPFOvMmfpzHKvRIfZTyPi6qR?=
 =?us-ascii?Q?J6SNDqnFj8+BGD4ODC9O3bIJ7AAacO/GzahaXmIHYmXVbuswXFHcigcVi97d?=
 =?us-ascii?Q?YIvOnVVdyyfVfc/S4mvx52i8wBgcS2xmA/WmODl0AOCTvYEalbcMNqEJxRPM?=
 =?us-ascii?Q?g6TXd8HtMWsaPdYBZh2HRsd6E9rNdSxHSIO1ib45YMBuNHzplwyyTNZPyKMP?=
 =?us-ascii?Q?NCDldM5VacGhnwuuLRmORobUtPlyhohzKWFbswK0+OaoyKv9C1zoESKwWYhv?=
 =?us-ascii?Q?dS+cE2rH68lrvTVrkNCN+B0uP0EFru5QkR6pjtrtb6EksuzOEjm/jHlKUW07?=
 =?us-ascii?Q?gayWxaq8O5Ji/ngGjfX7CtZ4TKzqPOQB+QndZegOhqNeI+/R8wnfvYsPA/JD?=
 =?us-ascii?Q?RJQYIBlB5bySNuNR9HEHfadvr47alBvPjxx90kvvE//Zumn8fHlJj5Lt0VGe?=
 =?us-ascii?Q?zoluSWZ3WhXlJ5c7aKlzOqglUzHHCBu1OfGoXR2nn4aogMp1jwnhLzKhym0l?=
 =?us-ascii?Q?3A2E+Gak81H3JEuIIAr4f9MvvsTxZs5lsz85JTwXj30QHPdbKHFUXOQXbQS5?=
 =?us-ascii?Q?j4V7+uQGZItOAVeDQTr/elGFNQZ3AplKTpBjTDYMJq/5GamxRfVl+da26urz?=
 =?us-ascii?Q?AeS7j4vmKH/5+VkMJEGtCWWEEH1XsQ3Tt2CP3qTA4br6ROGMgj22kkS2zGyf?=
 =?us-ascii?Q?3k+osGsEwJlJ09t+rjVeKreHjxuZ2SEx+Wbndm5YzH5lISG8RPzktgbp6PEM?=
 =?us-ascii?Q?VNeCXRhmDwrnE0Mfuwxmd6jrOHXWFO2XSObgJHx6tWbZHJ3ERK3CXA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uWyv8qdnxjnOA3rbF+y15T+vo7KFyFxaxYCo2XrRFmdNEowPg18a82CIaKRj?=
 =?us-ascii?Q?lOrM8Nhn64u+dyv83kZob0QViUZg6Cu7MRrIn7GCeFtPxR2Gn9DfNsn5opFt?=
 =?us-ascii?Q?e2t6h1OUWrMo6U/sYYpiaOaO3IZjgAVmfy86mWSpUg6Id5JNLJaaLI5GicMu?=
 =?us-ascii?Q?hnfezvbnRK1Slzfzs6n7RHh1vStTXs5Hz6vr3ZUWqIr6pbrbaz/cP2IQF4Ev?=
 =?us-ascii?Q?nk51QAgcLWvpp5fThoemfswSmvGGIKX6wqhRpREHFhetuGmECOuaZIBBpQ3B?=
 =?us-ascii?Q?h8NiQs7hjdBToTfsY1OvT8tsKYTV1eLwUmCD41Bp5ea7Jeuw1ToB22IzJezV?=
 =?us-ascii?Q?WZN66G9xBf8JfXWaZQFViokWdmPR9fQkB2RlRQeVTy7fubGdOpfFKTWpO28Q?=
 =?us-ascii?Q?23V4oJs7GPsWSi7HgBAdyGCgJnkrDJTD2MesIweN5UNbYTQToN80j+t8LTB9?=
 =?us-ascii?Q?M10vZrbo2RgQuReOZCpIBlTRyG8OmV7oWDPvG1BipOuGmy4aMBlLkovvk9f4?=
 =?us-ascii?Q?9KZ4vbvECtjOFxkGHv/WsQ7qT6zQEQv9VxVQSYRNEgihqZm0sHYUsl/8bwaD?=
 =?us-ascii?Q?fnHGiezE+QeFFvc6Cjwh5gSZcKW85saU+dHwZoVogPV+ais+MoRXcXlHfTMO?=
 =?us-ascii?Q?B1HRL5HiLoteqDkEuLMvURyB6b+ogScYb8Ddxsx/uKGeotZYkMLXL6P6aMYN?=
 =?us-ascii?Q?XkDn8+s8u/BQujix8kV+MDqwjB8keFWnhY4jD6yuyf/ixVly5ZesaPoZSQs6?=
 =?us-ascii?Q?uBde2y/oLJ6CAH8vXxJYHIW5ZCtxkEmp1HGYd3nfY2fyfY6WszkzT+uwhvdi?=
 =?us-ascii?Q?8FRWFmzRAnSVcNw0fBG7Wb221bN2pU8QkwVguNOFaDGoa8CkUCPtvwSr+Jcu?=
 =?us-ascii?Q?ui3brarFh7khMb9dobB/tZuR1XtlDE/AFR5jUtDNwyeaVcLoZP8/7auoMLeL?=
 =?us-ascii?Q?lnAmdOwuMreVNKWP0MAA/345Wia5wjn/rCS/7ChfntURaasXwq6uI4N0nXus?=
 =?us-ascii?Q?kxphDD9pRqDw52Be8gX5kC+7U6hFi6zftlKA8JKjxrN8tlz7cQafVREhbMVr?=
 =?us-ascii?Q?jb9jbXmjqybvGdCnm3hzXZlzaGbBxvDZ1+PgkdTo0dGCm2AhrSobAYNsjwh7?=
 =?us-ascii?Q?b2cO9zMonU5Uz3GUZHMya4/dcGuGU7Owht3afQaLw5ArOptFekW/3SZCGf3J?=
 =?us-ascii?Q?2S+bMANsYh876gefxdYFZ9M9PPaE3dFsDeFjgFig+FJUKe9Kgah4hgsopvDr?=
 =?us-ascii?Q?DBT3zhezalO5YpFiVu8LU7mgZqI4aoi5QZZj9/Q/ET5+khZJhGiUGxe2mNMU?=
 =?us-ascii?Q?xsLTshb6VNwg7v85UCmQ3ntQAid6LLW17Rj2Ky+tFbWSIV1ogeFTz0wBVgap?=
 =?us-ascii?Q?F86nwyUFK6oR4NSgH98SJtDNEzqGTLYiLFMR87dWwC8kgT0Wf6c0NLkMzg0j?=
 =?us-ascii?Q?BLsHL9LzZFtvbGAbw127NjkkGBO8djtrUH6CA96HKQtmi/mKVPJ0BDfu1uF4?=
 =?us-ascii?Q?1AZiFFY5WRE4KXtKsZ4iOXkPnq2RJXNrwPNrxQ59Ho0fp+e2XDk1tuVn5FfJ?=
 =?us-ascii?Q?/zQOcjXyZ2afQ+pmUJwkVT6oEZV43fuUAyeBB+b5bKFt9xgZMcc+v6Scvu/C?=
 =?us-ascii?Q?VBNIOsWpy0qBFReCaC4Lv5U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fb7849-4c63-4468-2e1b-08dd90fdc871
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:36:22.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+7jgZmLio4YpiakY2wjB2OQvRS02qqyR8pLmWYrRedHl0VFYb3aCVBySy1XBS8wBF4FX7he5ayULik0l1a/iNL/Dv4skX2r0Yg/dQRzO3o6fkeiHFVPabTyRWMQ/gCh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8802


Hi Mark

> The yaml has "hp-det-gpios" property, but Audio-Graph-Card2 can handle
> "hp-det-gpio", "mic-det-gpios", "mic-det-gpio" too.
> Add these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

I have missed to add DT members on To/Cc.
Please drop it. Will re-post.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
