Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49D62264AD
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752017710; cv=fail; b=hT9fllsrFyglcORoOFbIoGHysqlixEQrW+BN6FYyU+dYIzcvvKbuorxpREK2au7mHmrLEgu1KwT20wGs8yilRS5NN7PNzUCZaPHOBp4uziTvC+Gk+eHzcoSzakfzTldY8ywSUwp1XrK8+itNvSZ1x4rTFD5jri+FTAtF0LBq4AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752017710; c=relaxed/simple;
	bh=pmwHGfJwaXhSNn2r0iS9AYPilYYNf1ZfSbUITXcKNYQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nsjKwv/7JBgcoyL6p+FA4B209jXlFET5bFQhFdBtRYB6RHDVGbi3zbbKiFa6BNjtc2W7W9x4VbF65dvYtOguLGpGFJWHItYieiNPcu6Sz+8ghDfpOkPeKPiwccKDqUJKRvkqQkh1hMXqOUUE1KhdFYgeQirf7hJa+jNud6sF4g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lMAKhzj4; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lMAKhzj4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9tGRW9fgL0jSVHcL8i8v9aZBnvYqWN59mSSSM0ySG4Id/kDdb86yGkbIRyza87Vnf5rpqy/mm2n8T3EdCNZck7FFJWIJqmBa98OIMTMHgZzaE3ZppQ+uJBNYP8njXcwUwAvBuQcTwazoTCaGsTtEMF8S7+k8LgwrxOGVCKrTvqBYml63waKsF4vQTNGXn0IuNK/KH6K+h2Oc/0ce/iAoVVkx7hWMzOdFjqV89MGidzP8VlD2Yky3aBF0ip7J/IYVF3MTCRAeCOFGNbrWRuhuCt/r6f77lcXH1h796l+7hF9uqUoii2R6xic5Y9RwHBz852KhjGTFG5LG2f4fJAT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js+Q64u/TveBTleTAqxC4cUC5lLREwXQsFAfPW5JTf0=;
 b=UWSnxebTImaFADzmyiPmSe+kVVZofRLy6415VZJcHDbq34jXp85s0ODt5OqRNpDm7JaG5emn71pkSK3FZpXAVnrJjGblrcIqb/B5L/zVuHXPgg8r6ZENxeEoIPZN8qqx9syZ++9xx+gvVLqz7Xob021KkGcw4hIVkJ/EaCh6SQ6i9Q3XVA6jK4F6OlZyLvnoiZ5KuZPUQ4Ewxt/XggceEFmxvtMxuxecWQmuNX3HqANPcFqKxK7lil32w5UaDw8uAXsekHWu2qWle6YINT09fcYUyzbFFSeh2IzLBAekRA7h+v60Z2+Bjb2PjfFouEFQYo/Deef4rkMCe9KEfv5XEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js+Q64u/TveBTleTAqxC4cUC5lLREwXQsFAfPW5JTf0=;
 b=lMAKhzj4n0yIB0/DK9ObDirjPUpAXplC9NJVh/J5roQF8aoT9chEdMsxCI0NvFemcY5AzVk6ixZJ87E58bdZFI5TmLzD5Hn2w4BkuniR+Bx4RnCz/PcDN0YKY8FFM1LgH8JuudSrj0FdDN+EvF0EViQrxVqg3lMbGPxhuH7CKXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8132.jpnprd01.prod.outlook.com
 (2603:1096:604:173::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 23:35:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 23:34:57 +0000
Message-ID: <87zfdefe8x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Subject: Re: Question: how dapm should looks like ?
In-Reply-To: <aG0la8cJJ3mEVUXX@finisterre.sirena.org.uk>
References: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
	<aG0la8cJJ3mEVUXX@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Jul 2025 23:34:57 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 60358ccf-3d47-4b37-3e18-08ddbe780c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bWZTAQiZhGw8deqTAqSA2Qvas45deyOsZ+AdDFvqYfrRy80BdB2pRKuR8mOS?=
 =?us-ascii?Q?IcxBUr90+doSdGZXr7IZiyI4IzE9MHBmG8UK4cK79jRUu/AlhcBUcV8wklpU?=
 =?us-ascii?Q?3E1vph9ZJvpL1uHxXtZoN6qSrHfB2GJ7rKipAJYgaUjUMbvOQfIsdfZBpLXx?=
 =?us-ascii?Q?9oarLc4fCgcQGyANoTwv+uAL+MYujgrpkGxou7OSZ8Rnaigp90w9alnf3IKN?=
 =?us-ascii?Q?vS6Myjej/p59cbBIWi320QmJIQeSjWQbuVdgtk7vZDZ229qH/UHT6LdE9+3n?=
 =?us-ascii?Q?B7Flk1HVg9mAPhqIsaEazoInx3FqIf8uKh163cQaxenhr3HHjFUqKRPhh0nL?=
 =?us-ascii?Q?1uv2wNzizuO77QF4LSVdg5wW1Lzm8rhyYgES/XECxRH0vvDzoeWy1veZ77jR?=
 =?us-ascii?Q?c+XWD+O4XlaKr1fmbdc6v15039ld/2P3ymd/L1Y2GR2/1aa9nkN+4q5QFxS+?=
 =?us-ascii?Q?YFFgB32mIJjlIk2pHK9mDvy+EtPbRdk+KW5rubj5FJKCkfZpFnJjodfvZP/e?=
 =?us-ascii?Q?MGyy5dBEqhZPpPgbAjU1KR0NaBR8CES9LtkhfpmAQhJOc135Ra8dFJ27Y79B?=
 =?us-ascii?Q?Bv2y3bq5/E7sxLDQ96xqdxOLnRyLYD2gNiMGQHB+4KkVOZT4xCcET0WUT10T?=
 =?us-ascii?Q?yTpyS+jcGh3riXWeFJDTSFVmEni60imlFupxp9CxsYahWBD/xrj14h+jOrfh?=
 =?us-ascii?Q?L89qYaR/pd/CX3DkWItEJlttWPK1+9hVYoLGafjMiF5B5CjRCA2oIZOVkxl5?=
 =?us-ascii?Q?Ke1xcRz2ZnEwWKjfC5CO7Sgy/w8acxLUkdXkLi+InPRGcsGk8xU01skEMWUH?=
 =?us-ascii?Q?vEerx7dp0cFruPIvmtiB4XsOyCB61m0YKsjnW5Tx7e7RtiA2TQolNFEVI2fd?=
 =?us-ascii?Q?URVh50DVcgcC4f71/qTRdzah+QLT7VPsddwAmANfvTV4CRi7d1dc50qXtRiu?=
 =?us-ascii?Q?uyjRRnEjXbUUhR0+N5zerIRaOogSdYu/RylulEYcPwPrnBDtBK3Ta5aYdFk+?=
 =?us-ascii?Q?hJFAw9N3Ws3Gu3Ye6SXi+UT9aYTcGFWZXB7hL8GNd31sdK9xiSo+LXMAMpyY?=
 =?us-ascii?Q?7KNHrHZxUT1Mzxba8etncIqFiCM6wMfnWAWmzKcKiyP0xr6Nhqh7UAPtXP1g?=
 =?us-ascii?Q?5xlWzSabOodxOxcTjxG/d0J1iqBwod3OXwRfWPRzwnU+NCrLKyghJo09MGRj?=
 =?us-ascii?Q?zVutJEkD5g91DTLGrh9EwWBjGPu832vH4GTsb4mwOWEisay4ZSvftZ7RD1Ij?=
 =?us-ascii?Q?HJpMpatF+qEfJSz5c++duJvhGwE7NzgDSWXqCs4j4FDpBeWw9Kt5lMYJT+9L?=
 =?us-ascii?Q?UGYnROa6KdIP7UTuN8vaqZMOFqwOQj8kM5DA4B7EaC5H61GGlZFHiS1qB3Hy?=
 =?us-ascii?Q?l4v3LnreDtx8xuyvO0l1wB4GXliypjaXBUw727TAY5fEitf1K3Azu+C/5h+Q?=
 =?us-ascii?Q?DKadjNJC7qgDqXkwmLZzaJvuI6OpFk3QvcKc+FfZuCeyKDVYpCMZrLdEAJS0?=
 =?us-ascii?Q?88hiV+L4oxjzaOg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IeJ6qkPBWd6uJ0p5kckMrLC9oAwqnm6Xdu7NJ/+IMCrO7M/9l8YMvzEvekZI?=
 =?us-ascii?Q?DYSVvk+cR7m7fnPXXDCVerqPpHxp8668JdMs4xlChuhFQ+k2Alxmy7aUrJKN?=
 =?us-ascii?Q?xuIvzIxCQPwlpm4cQM4q2S3l1/UiL9NIjlws35bAS1fHEaCLXaFaaiwrv0be?=
 =?us-ascii?Q?T2aZUUTtsYo1U/AJ+4ROL7tJS6IeDhLP5e+1e0N5oVbi8TFszU/a9+RMhXoZ?=
 =?us-ascii?Q?UKLIqSVsM/qRaL61/1iZmgEWHaKP3zlXfTFdH7rdGkDiVpIC4bdYTDgs1VPA?=
 =?us-ascii?Q?Av289xEhz7QoZeXCczE8rtJBCICWRy9BwbsjXOW/kY/IXrrKkAk9b8+BDyhO?=
 =?us-ascii?Q?OeD4Jh/yR0vOQErHaTimTFC8iE+NeiMJd/XtErKigRe+XvHCRJNluZuJtifY?=
 =?us-ascii?Q?7HJA2FdwH2wzm3vTbYpTJ1mv70NgWhAodoHf74RS4AZgprUDG5EZynuj/5X5?=
 =?us-ascii?Q?2lExXS9TPQfpaDVDvkSP4OMJXYCOjUjIwt127JwdDfHBHRzZb6Q5R1Zmrmu/?=
 =?us-ascii?Q?p48D+W6fQABvCorgdBSa7XkZhB8Ug+ELqS/5/tMRhGtNOcNsN/Oi06F8BWuZ?=
 =?us-ascii?Q?pBUWdpW1hZakXhzVNaLRznWdV0Q5eP43W6zUZJFaM1Rs6gHHDvb8wXt45E9l?=
 =?us-ascii?Q?bhARjJg82Q1UjSclH41pVzl34l6YJSORKqLoCpMq9LU0g3ODAecGcTDItMOE?=
 =?us-ascii?Q?M7o4QHlOTvOKFpHNxPiAIxCivh4DWI9aIQmizvPuHUHZx6Wh+1cmps2penyE?=
 =?us-ascii?Q?fMHqZq2tGSIHFrQ0vToEDgtup2ojJ+hCZ/3Bfp518jw9ShVw1mEvWiSto0tg?=
 =?us-ascii?Q?sAhepyc8bP4OTDgzdaOodYt41L2JA8Pc5VwZIBMhr+IMOh0/LdL8N1opfBdk?=
 =?us-ascii?Q?K3pRXf+/W98rRY5U6HVaU1r6heRfWnupc49RWlBHR7e1aJxfSPRSzEUcMZLo?=
 =?us-ascii?Q?+Snol3dNbMn4DLtjvaNInejVsUaptyoKLUPYw6sCLrDq0x+oGba3UQikGp08?=
 =?us-ascii?Q?4l7T1lCCq5Wsl2t+2s7Y478kYaK/CO/7wsnV+mBrAlpa3eBhKmLIzn0UZXwQ?=
 =?us-ascii?Q?OBRD+LTI6DSxg4RzVTb32k8Kxjs5Zm2ralDOT4cbQFSn6I9NSjc3IVDaIQjW?=
 =?us-ascii?Q?3hTtDx+10qS8VpYNMhCTjNW+LlJW1pJFTWYNq0Djnb/TBPZ7c5OngN4YYn4+?=
 =?us-ascii?Q?EQkviyX9m702UUAbxwepOwgZxS2TzFdtjGnQRxbyIFE/NqlVUSHEBQLRHZPq?=
 =?us-ascii?Q?R+e2uP37u5bgE+03Lt1PoIQNv16XVpAmRIg20/becGFG5aYFloTXvB5hEzEU?=
 =?us-ascii?Q?xQ/XrIUxesxJH9t41R4Cq9NkQEMN6lLVu+1wA1XHqphbpIBb5vXGRiMj4zSH?=
 =?us-ascii?Q?EzDRxUL7kyijfEhTz+zrsMGzKS8jezGGTfrp7MYoFGQeUSAwcyWnDpcwPhLj?=
 =?us-ascii?Q?VrpfngZUKrcfkKvm/LvF0u/qVkhvnlns+D8HhNoLRxqbDikBLFnYYcgaGgJe?=
 =?us-ascii?Q?GuwW2OWWVFgrzxTI1fHuZqhDAXNiDVywLcEix2ToIKonX69NbLMr9kvJAAVy?=
 =?us-ascii?Q?Is+bJIwLT9hPkOMHmG9iz5GxS/PjeTvUPZmTeXOn6OYA6ZbI87EsTDwPrf3W?=
 =?us-ascii?Q?PfR6lxbnVgGW49X4PDiFuNk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60358ccf-3d47-4b37-3e18-08ddbe780c6d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 23:34:57.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyUTt7Hp4HS4WQe7Rmp+PvM7CFoBY8gaZYgBfvyWQD7CDZNKM4HyvB47AOFmwWMcQGADJybeKOkbEB2cAhNQbPZVKOxec+ukXmvtu8RPKlJRa9bm//nzlt8amny4dK9K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8132


Hi Mark

Thank you for your feedback

> It should just be cards and components I think, I can't think of an
> example where you'd want a DAPM independently of those.
(snip)
> > I think we've got cases where you want to do things directly, the most
> > common is updating pin states based on something and then needing to
> > trigger a resync based on the new states.
(snip)
> It's probably easier to use A than to have two sets of identical wrapper
> functions I think, less effort and a bit more direct.

Thanks a lot !!
OK. So, I don't need big hack again, if Pattern-A was acceptable in
community :)

I'm now posting small patches, and will post similar patch-set again.
After that, I will start to post DAPM cleanup (hide) patch in order.
The plan is like below

Step1
	Move DAPM functions that can be easily moved to soc-dapm.c in order.
	Add compatible macro in header for a while, which will be removed.
	User driver should have no affect, because of compatible macro.

Step2
	Update some DAPM code. Current some code/variable is very hackish,
	we want to have more clean code. Both framework and its related user
	driver will be updated. Other user driver should have no affect.
	
Step3
	Replace to use new DAPM functions. All user driver will be updated.
	One note is that I want to use 2 Steps here to abvoid unknown bug
	and/or confusions.

	Below 2 functions will be replaced, but these looks very similar.
	To avoid confusion (for me, for community), change only (A) first.
	(B) will be replaced at the same time as other functions.

		(A) snd_soc_kcontrol_component()
		(B) snd_soc_dapm_kcontrol_component()

Step4
	Move all remain DAPM functions to soc-dapm.c. And clean up details.

Best regards
---
Kuninori Morimoto
