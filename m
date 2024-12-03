Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578A6219E4
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733191811; cv=fail; b=dCLXEZDz2Y8eJzGCaEUPmbsJ8pZcV8FQUgpPNMVu5ISDrhZ7XzU+DiTA/E7P+OVSvW3YjznpmxV6vCVwiMwxtz/qNEaODHYOseca30AV+l75RjYvL6+JhopPpJUjI+hdrxPcSVZdr7viXVOkuCyp/teAwO9N+ohBH8WcTwtGs4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733191811; c=relaxed/simple;
	bh=GhDoEPWEy7sRXkrkBIIs/OqL5DudS2xk/Kkdbux96vM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=GE9MT1dP2K/TDuj2C8KP1OIxTz8R/CdAN/aLpdCFN0S/OyXyc1lDEh89glb1Vcc21WoaQ22YsZ9RMkVW2Arr3StV7egVnL3cwS85xiEbeXqAsWnB57S+A8nNUFQNcueF6JTpMXsjOUC5o1JiTdJAd+nyhFCgQfn6SC2KxjJNkMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eBjtxqlF; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eBjtxqlF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox2MYmdfzJ+3n1JZbtQJY+nly/xcsLow/x6/YJ/vCJMUg62KTihxhywhPziNgxKbUh4WAobJ4u8abVcuD0o/9SUKB/NzrgCtinoifvayW8BebBAlo+7wSYtUGv1nuwGgtDJgrT0JntiRvbdBfnRsM+BKp6KILho0f4LBn3aTgf/kDdA+D5jJTBgCjXJCbcxoDtQvKdOKizqM8AKummFkuShJfyGe5PXxjnXAxUHe/zi/OmshYogWHT4gZDgQbn4wX3cnfBBBQcSAHDmCB4xgsfXh6XmVQYtWhXevanFGBLpQonbRnIEVHASxnvy4QTm9+5ji0YwAB6KWQegGCMkjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W78vukm9+UMPL7fmppch/VBX6hfDr3LmLAdV+BNOaKA=;
 b=TfTV4JIfcWmqdvxVaJVnSkNtxkL8aW8/MtLjt/dVJpmiIHpvAhR2vfm/tbZ5EfAzgphYv9ScJCz0Rd5NxeFN3Oe1Kj8BNS3sf5xXPqslwJl+VW2FIbJ0xnpyAJeBKpPpflmrqcNTMU63/8DIztk6mnl11I/eb+147Edn+ejDnDIUNcTTu0Bt7G8M9EkrVrvP5ct7ifFy+VJnPnIJCaB1jmFcPLCpbyK3Kjx73rbqaUkQgHC5F3+RfVWwSe+Z34jNzTkjXrLksTI+hDwLGL8ovGM1j2T6ShpErPtUeIsdhA28wEBlekMq7HHVbiOVz6aOj8x/yrSiSJwP2GsoLKZ6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W78vukm9+UMPL7fmppch/VBX6hfDr3LmLAdV+BNOaKA=;
 b=eBjtxqlFbg+1BSlSIJngL4wlukSrL8JmDkk9c7DDyLqiNiTvocceuvowk8uap2065d7ACd7mqkWgAJlXA4pXNuSE6hyCSW5fjyBdeEwkSEUaEeZAwd07PW6jW3FvQKqAsikRnE++iuJHikFsNiOdv80+2f0wpd9yWcJHcgUBF5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10407.jpnprd01.prod.outlook.com
 (2603:1096:604:1ff::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Tue, 3 Dec
 2024 02:10:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:10:06 +0000
Message-ID: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: simple-card-utils: tidyup for Multi connection
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Dec 2024 02:10:06 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10407:EE_
X-MS-Office365-Filtering-Correlation-Id: 973a335d-30ac-40fd-61c0-08dd133f9b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aDfpYagxNStWxcLE+e2iocETlVRSXyHe9DzxzXEJg+MhCGxR4617WTh3JllD?=
 =?us-ascii?Q?pHEcFWOBxlePjsyRCVRYDXFFqq1r7rK6j4pnptpqszbxsKH9NYt2gPx8HmRG?=
 =?us-ascii?Q?fIXXPVTNVKKd1k7IG0g8i4A656yc5CbhfpzdVBr0EO/6IIrm810vDjR+vDtH?=
 =?us-ascii?Q?0Usq4jjN5LvzfUQH9vATlv/f1P0Z3PG7xmiphuZvQMyh0g7Bm6CAKQhRgUBa?=
 =?us-ascii?Q?3SLf7FQ7o18KVAnhfWSgsXjofvKQS4PJvVnmvDQOAElNY2+VTz+TR4UgL6Cn?=
 =?us-ascii?Q?XGRDvyaavqfGWWHlk+RSC9BLV+lhApu7cXsU4g0b9MKQyIUwkS5OyaWqICXV?=
 =?us-ascii?Q?rweuRvrIDoCbNWNiDV00pIk3Vy5orB5vpIFUUeHx3fgGAyLF9QQVKa3ziFMP?=
 =?us-ascii?Q?qSFuCX20pd/PQgBvlnQsS/IbegE9Wtripugqx5KE2PamZkMnuOMZDlqQKjOR?=
 =?us-ascii?Q?GPUpkHkhaUn1y3RsvJU1EHJG2Ate1dAW4AWcpt9ucMPLL7dlj3OEiEmeSPrf?=
 =?us-ascii?Q?LmNC+KtFWItCrCMdg8zXsRIgK3pNzOtk8lea8lg3ylQQz6iGRv1r3B+gcYzo?=
 =?us-ascii?Q?qnVRYqrLo//FLa2ZsR8bwqRcj4PGDblm89vJWgPkkUBUaPsryAOkJ848RQnX?=
 =?us-ascii?Q?VUP+mKaIR9XCEPEcslCrIB5J47UPYy2YLDIBZh9daj2pO6bJqnvE/hrDoZTw?=
 =?us-ascii?Q?a7ZmX6jZBMDhbaloSt/ICrSKiufA97wG6KMlwKkkroGTOIcn+UCVXmEcvOxW?=
 =?us-ascii?Q?yzQcLnhwJnJTiKrjPdxAtmf4zxt2Guz8g0RiXJgbXA7QPyHsMN6QKhRq/pgT?=
 =?us-ascii?Q?F/VpYxY4GYZyV5C9kPSDxbVz/n5+TXTkCdhtLe6LdrZ3P7s7FFfGkuaiwsQ8?=
 =?us-ascii?Q?JdTlYr93rxTxiHpDl7jO5VL8eQ8UPI38moTHW+q0ybyKvw536VoK3ZJ8w7iM?=
 =?us-ascii?Q?V1Q+pvWjiPBtCOtmBn1aKl2FQPD7I61z1lzBGQFOwlGZOD2pGnDcpFjiy3Hm?=
 =?us-ascii?Q?pxBVxtRfqyzOVMhMtbG9RMz3lf4Jd0AKFCk4n6PnxrA0sMLQAwYTirn8d+oC?=
 =?us-ascii?Q?cK+i8dNmlbEFOmVjvlTMOzcUVh5XeRF3j97i8jKetbJQDGR8Zy4ASFM1A3MC?=
 =?us-ascii?Q?ggUCqRqDQfdXfpgK3068efPOtGT7MQmkLc1IS90D/OcSxJ3QHmem418EGDxi?=
 =?us-ascii?Q?CptCnD612cdbi8E73w+orWayDPz3B3kw2H22RC7VuNYeDalsgB50KSEYOrGt?=
 =?us-ascii?Q?aC3udBON/sRjSOaO82jCLJk1Va1qvDhMPq0HWXDcTH+FQDCMzdDDvg/W6nI7?=
 =?us-ascii?Q?ynPp+KJkuksyS2CZtq+0BUtwGwGCi+9SjKfKxRT/251X2RJuU+JkddF6+fIV?=
 =?us-ascii?Q?1RvMsnRibr0fViYmR6adasRTj+msWMJgZcfrJzhJlnToalwgrg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Eg7sdPAgKUacfconMWySl9IdRFjUkxDgN/oovoKVyxbO7njBXdEFYpXUcly?=
 =?us-ascii?Q?rjYbQIAIHHVLAGklHgWQGxeBVki34HTEP8OWXcUrFMkKkd9i5VD2VkilYkHA?=
 =?us-ascii?Q?ye2Y25NtaKdALCTy1qbI2eo9wAqGtc0BMeozGOwVN6D5cB9oDTVB+F8YSMUE?=
 =?us-ascii?Q?fguDDKGjf7ybaF1XwqhOjNHGbVtQvQmd1mTawCbX7blxgEO7ahbPRi74Qo2j?=
 =?us-ascii?Q?0qAktZyhLV/NdCJl7sAHk9AWCxmnn7+wVjaqTyd3prgjhGeew9BbG/VlBwlL?=
 =?us-ascii?Q?XEGww2OApxHjM8OxTGW/ViVV6q8CVGmjjJbO/PmpS0SVigyKqsiLuRcjtPe1?=
 =?us-ascii?Q?28M4iqGNb2AYdDzn1tjC3yWsDS5SNDcEeJC2isuXQ91TgRaeTt/Q8a95V76L?=
 =?us-ascii?Q?1Eqf0lYP3uwsw86deNu78BYxcjSdbqGm8Zn1iLe3vKFIVbq3Cy/CmJ2Q4Q1r?=
 =?us-ascii?Q?FvnuIoDvPOtdIHNq4pXZgeOTZ4XH10TeVl8PhJSfDHSek61PGKkt4a2bkanN?=
 =?us-ascii?Q?hirQiVByRg/UT5Gr8ueOxoMwXAEP/9ZG3V4a3JRiaKhLqv8HRqgTtjn4/Nrx?=
 =?us-ascii?Q?6sbw78+LWUh0iasdm3oeAqWvWCyv1ZdLS82pg4PHPlbgEN8UCEdIjVNsffOu?=
 =?us-ascii?Q?0PU5DLY5Zc1+p1/l43W/MlTwID3xr2vldD72FLLTdATXq68Ljm2iH2TNcNx+?=
 =?us-ascii?Q?ddMGJ/5yB1MX7ou//6dhM5GSaSpMIbciNrvCb0QfLNifZYsDhMu2GhwEyAeH?=
 =?us-ascii?Q?M7WhW24e+mdzcCSfpUXvgOEA8Cl6an7s7/9RynNLO64U2ptjlBeIf2FH/i1o?=
 =?us-ascii?Q?cshRa3p5+XtpT3PndqviSDAB7B/D6oQy/t+c+tBNDN+l+kgP7QixgX2IdFLx?=
 =?us-ascii?Q?VXJna8mY9VT53wROWT7lGMgApXjliKNFBxQXOu4QjxEM8RrWhSSFILxN/k4/?=
 =?us-ascii?Q?3lzJ86LAiXp5oDYy3WBXtfq81ds0/EZN+hmy9dvvmOqZ7Na5MlqKQjZnnU4Q?=
 =?us-ascii?Q?NAOlZWFZ3wFFScpUJ3YovNVIzyd35k9hYB9TnaOtfcEDtNVi99mwhNrYKKB1?=
 =?us-ascii?Q?K7nMOE1LWRm1H0D/nhlWzA3Wi0XwXFWlA2qSPImgoXD/U1faxMkT2uwVo1fK?=
 =?us-ascii?Q?BgKMRjJMKO/z+EixqQbeja+huq4i8iggPTfYJC5eKLmxSN/ydqvHfkQokcJ3?=
 =?us-ascii?Q?zQCcr1JoqWz7On8/t6QnXC70UqRpm5YYd+V6uGlCgREd4R0TvidXCFjHneJ6?=
 =?us-ascii?Q?ayDAXfxXQ81Of5C3+TsJN79Qj/sCsUycYJoJcjqYXsprLFvUVX0n9Aidb3Al?=
 =?us-ascii?Q?yBGdbm2dDq5nZoplw6H1Y3Zenp+YuETQoaw+zJ9Ik8opZP0/iClMOgP95NOO?=
 =?us-ascii?Q?qDBMsoWWdnADgwJbgV814n7R84kN5n/0SyC6pkscSUPuqRBYpH0JOnR+RD23?=
 =?us-ascii?Q?Vr4tfrmcp5lqvrqhkZNJPalXM/IRdXo0Wlbqby4FARdToLmlvqjyWttR5r+G?=
 =?us-ascii?Q?2+IsobVGriF/N0jurOPfX8wwBUP12O1fjYYmO1VbYMv/V+Fvr/vSp4NaRlyp?=
 =?us-ascii?Q?46ZcD3rs+eME1BZwQ+fl3dG7m1mFHPPBrRBRWpJgT9x0WDlJJWk33saKh+/w?=
 =?us-ascii?Q?el5eu4qoITiQn+Z97VnHYNA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973a335d-30ac-40fd-61c0-08dd133f9b40
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:10:06.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bp6VoMYgIjBXkrJNTUXmhZ/8dQ2cKBfYHSxyyUIegWGHrLsGRBc6wABCwBCWVTKCgHTX2BaOfM6m7oqtLuKpqbDEfkYBaHnIunxOLaoJJ9/WPT9AZ2SxcqiXYY9Os2Cg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10407


Hi Mark

These patches tidyup simple-card-utils for Multi connection of
Audio Graph Card, Because of DT node parsing, it should check port
1st instead of endpoint. Otherwise, it can't handle DAI correctly.

Kuninori Morimoto (3):
  ASoC: simple-card-utils: use __free(device_node) for device node
  ASoC: simple-card-utils: check port reg first on graph_get_dai_id()
  ASoC: simple-card-utils: use for_each_of_graph_port() on graph_get_dai_id()

 sound/soc/generic/simple-card-utils.c | 58 +++++++++++----------------
 1 file changed, 23 insertions(+), 35 deletions(-)

-- 
2.43.0

