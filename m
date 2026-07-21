Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A553FE351
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598348; cv=fail; b=VA33MXhec1kVUTz5fAoRI7AHGjsl1CGWYOruBs4tcsa2kkaKyow9Qw53IInmxZu24EIQYFMgQxUIo2dXfrc6H86qw7wXVGV9wVgMPtZ3SpuYHqLb3klnxUreD+smI8zybaVBWXWFw5wVjNjg9FMmiFGFdn082CWAUgtLkZrUhpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598348; c=relaxed/simple;
	bh=+cPedzNYig1+k5xNi/LRMCoeNzVtmlxQZ4HksBtMVVE=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=dFzpdRZYy5d43ZcYxsIS8EWJ6gMYQz1HR0gkh2VAciVkPG9KX7+Xq1OxSiGtU/5xY4YLQrDdd2HmoRz/Da1og88OAYilyQ8ZEI3upxIWJncmHUy39LvuX6OAD3HfMBTWQJbXB5FA0JJJPieJs8Iq9x5ltl2GwaFIPwA1MeS6oPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DFfPvaXT; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DFfPvaXT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chxDfRTo8ji2pQSmCtL7pLDTSjFRBnUWxdub69jOd9tVckghBhWDIL/ccU076hOwNo4/jGVUwSdNRjYjbK8IyLTrLcWVZSs6ydQ/5ge/bzD6juSBUyUEAcUJ+x5j5z6VgXPJO+PVW8TnEPziw4IsdU/VxBfJvqYFDLuD+b0STi7ZShAWqOzs8cG+aNfgl8v7fq5RckZZZ/KXLz7EMb9whyNTcnTCgQLJ5J8pgTZjBoU98ZmjxJHsftmoyfe6hPo7ZoEzW+Xwf55kM7XP+V0seOsfGrRYxJNuLm5YxqFWRcib2m721gZZkLY+STJbhBaiQXidTGhx0HnUavRZCvEw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vc93Hmrssz767clydlbaB091YZbL5zPlFmOXUxwPdw8=;
 b=lCfyXt2tLK77JegG79jt61h+xuE3Nv1NqlK/21e2Q5o2oadRvfELWTm+gzyjuSe0GH3ZUPLkvFj3gL1/lsHchNiNKtPfEnaRvQC4M7kmVSY2kbB3lntu+Kgxecf+OXndAJYk6ZTlB/qssukulV9bRK4qg0ypiPKbNNtnsLwDO90uCZtJ7RgrGWCg9SkWt+Hb+iIGMzMTG+HAHEiiJcTtP9whiGNXCCtrDIAWvVTJY2p9JFtFx3LEqD0qc9ZoMfpu/fFYbHd+B97nTe2dd1+l0UIUE4XOP81iOpFp96ngEPumPS1j4H39PeSorMJp5fMTdIXdxnk37tdzXZDgt5Gw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vc93Hmrssz767clydlbaB091YZbL5zPlFmOXUxwPdw8=;
 b=DFfPvaXTaz620/WJRjEyZN3d+Lu3mHg4VZSyQJVXnEokXLcsbZi9MSD2v3iEED93GzRZLNdgjrsCpSC6ermX23vJm2yv1B7ZLsupj1d84X82qpqQbsZL2mWaBlFCoyA6ZbouuizHVqgpqfdawym1aWB5bqMPHzF4g9RV8asmkSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7707.jpnprd01.prod.outlook.com (2603:1096:604:17a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:45:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:45:44 +0000
Message-ID: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: ux500: preparation for Card capsuling
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:45:44 +0000
X-ClientProxiedBy: TY4P286CA0053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fce6a98-c74a-49be-5995-08dee6c9c77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|52116014|56012099006|11063799006|10067099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	t3Ki5gcfkTTqTo19dcQioWVD33t3GXPolOoYeHZzNhC1phj8xwhco00we8cE5eQ++F3HW49T3XemMi/tJBvw0uptAC9KLgZ3gBdd5oxcliPeFOjjBxbt2F54N77/BF/8+XNBKvPsSaFUruBG8Pz2+IRkSi34tHnex4OcpsW7UCnQD9rVGrKgo1X6E/+dZkL8aQhEDfYCAhNx09xSMtJMlZ+D+SYteYsVNxNaPpC/4bh4UGzTgBulMg8uJOgeAbHEJB9ntxYWpW8e/zbV+bG6GBZfhZqpmQCEP08Tk4+ePyHmuKkUR44JJBbxEqiwrucU0tfKcqFpBfxSEaO0S5T6pKx2i+ebQRzvUOyoN63vs5/GNOHucPv53yynKTdM4r2rBahNK5+wCadJGjvWkhF4u6jYukLy/pB8gksnsZ4y6UI8Qu57kAKRybRkCSBNEhqGhmmmmlW2vs+EFaQhGijtM6BMugeF/kMiuMVpqr48gVqPH2EhnCZP2TiZ0FSD5Xd5gwvGOPHLjkWGLZyi2qKYQpQ1I6r0DNJlGjV9355Y9Zs3dE56dWKESUEl/qEuqQg/4pzvJKRXWJ/S1nG9KTUOdcpGyd4SMCqiMK8zs1iiydDF22NRvn5L6w3rNkoYi2RLRaaDXok/SbrL9KSrzygRuTE8VKgUW6uwOnOumy5WHRFyB3rGYfLxhvqMgeiLhYbn2Xeo7J7MnPyZdWt/YMtlJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(52116014)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EiKuOh9oyLMOr03Z5LGTaI2HSYzaTboO+I06mcBmtYJYZIMGj+Ks3TAMIZnQ?=
 =?us-ascii?Q?/IPksLTUE1AIlLjVkgFOm9QPsVG3PGpwVHMSddYwviF0GhRaiWV6KfSLZaY/?=
 =?us-ascii?Q?v/wDFTwsnl06dAJs6UecnRlcNjRAKaXMdfMtadAaK6K3V9xq4QhlUx8E9vTT?=
 =?us-ascii?Q?dJkl1s7fquu1F05c1Ep4i1hFWqGZ5cxPuNtQEGero5NcQuqrGBOBy6P0TKnj?=
 =?us-ascii?Q?ylD7Tk4OJRrk0pYZr0Kogqba447XQ68/5wDTAslkykWQBxbxFFfgZQA8d5oq?=
 =?us-ascii?Q?pLRKssLfps+/sEftDjWSFFJjvi6tCLx2zLqtvONLTRW6wJtVcoAfM72vVqR4?=
 =?us-ascii?Q?hkIfXMzB5+lJuBbUgsnW23es+8oHP1EcF9kZZchLh8Tc3nnQz3T83vRWTIyc?=
 =?us-ascii?Q?3syvg9I7+3AnPruBg5eqdGNJI+l0ru0uOkl4NIYPRwOjl+Md8Bicl8kct1GI?=
 =?us-ascii?Q?Hsc9Gpcl+hHFknlHii6+T2FQr1Z1PTFQYhpQI6lcf4oy/Bd+HU5BgXCA+X91?=
 =?us-ascii?Q?MhNij983uEeTIoiZBCN5cxa0c8x746HPjSedk6/9SMt4oUUuMgoETOpB7mU9?=
 =?us-ascii?Q?Pi8LvFygBuxncaLbCjj0ck8lshrClMPVSmlMaOb3Zu3c3l7MOO54jTRSezc3?=
 =?us-ascii?Q?/l8X5A7JeONhvnjoxKHgvpRNYyp44j7jcAxN/Z6NrveN1eSODRPwnS5h51ys?=
 =?us-ascii?Q?kWlIQebzkhSLkQXgEh3V3xGZEIAIqJtjUKduyn5x4hhAd7FE4QE1JuuMkuCA?=
 =?us-ascii?Q?3EYaqGu5I3YaiFduddVXR4xHOCuwTfrxk6vllICvECGxiCmGCmta0F6KHQ8r?=
 =?us-ascii?Q?3d1I9Uq48dr6FPZRnHOtjF+cVMtPtmJ94hmtzhVRiFeEgBfj50WrrUbo3TXl?=
 =?us-ascii?Q?nBZLMo0fSTZQvJA3kw6EUuY/2gEgXL9pUpo05sZVvzYoQJCdvprpzu5HepGc?=
 =?us-ascii?Q?dBvosYBt+4g1evCL4R+urbhIzib7hzqpxu/FQWiTzAzsvYqge59RGscAg+Ip?=
 =?us-ascii?Q?Wt5xwvmfXr8jZzti0WYJVOEUYpWaOZYJffse2D3CcyBUq6Kk6uhWWguHDtvF?=
 =?us-ascii?Q?8Hm7Y8Gu3Qm9BszjWlT8drlliD3XProFsqLyti9fYsLGJRZOgftLgTljWPdv?=
 =?us-ascii?Q?OKNR0nSpczX4CVxJZ1OGpVZQgMMtG44ffeqP4Ge4FDYR8wWqQIuZV6Nvo2GA?=
 =?us-ascii?Q?NHxELALP3jl1efiLOq2zFpD55QDI+xFpwEPyeuD5ORwWm1k88SWY9Xd8aJsd?=
 =?us-ascii?Q?a4T2JrLcHWFQhtx5wmawSyzM/QfBZzvxKN8WGm9JooqbRZMvINyTiOkYU9Ql?=
 =?us-ascii?Q?qA20lFyX0swlvRMdMTAZ+PcTduif8QDGf/3vtF7Qc0uYBdS/GHpmJMETlEG5?=
 =?us-ascii?Q?ns0b/f7fNJzB79AJEyGa9cuAPdiLKRMRY66+8rpQXG7uh//fhE+ZLFtBI2Ew?=
 =?us-ascii?Q?qi416gowprpsN89nJMngx6qq+JfdZ1w8eR1fdNNpfO3OrJfPbWBqrsNoDKaj?=
 =?us-ascii?Q?xE8YrcHzmycpXj/BROukwlKavlfnoAHegIr0CcLnPNgoqM6FvGX83E9oJc6/?=
 =?us-ascii?Q?Iis0DR5Lci8EzEBFN/LmsHtJJsyYVeplkfmuqwhRfmXs9iKmDg6mTtI/o2RC?=
 =?us-ascii?Q?o3zcfs07v1ktmj1GOICGqjJXABuHNXrROR6G7IX1ntxX6a813Z+J3sUCswGF?=
 =?us-ascii?Q?ImY3pPyQRhKqGmL6OgOBOdXrcUuYzm6ZRgDlxyoqak/VLIHMdGOCZuBhb5Di?=
 =?us-ascii?Q?szOggvVd/TQBmBijVuid57tP2FY8F8v0/l8tu5l6wwIdzLlbi6e3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fce6a98-c74a-49be-5995-08dee6c9c77e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:45:44.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nM9E38Jb8mpUp0+yaDdLtBZe8yHoSs1iOseFqDZNA6+ZX7wVWCK5n1xPvYeDvR28J6mIR1nlbcwXmjx9HK7Db1ENH9f32Gk3nN2bDsEcPjCXj2h5C0jPgufVvc7fQKp6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7707


Hi ux500 developers

I will post Card capsuling patch.
To makes its review easy, tidyup its drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.


Kuninori Morimoto (2):
  ASoC: ux500: mop500: tidyup mop500_of_probe() parameter
  ASoC: ux500: mop500_ab8500: tidyup mop500_ab8500_remove()

 sound/soc/ux500/mop500.c        | 12 ++++++------
 sound/soc/ux500/mop500_ab8500.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.53.0

