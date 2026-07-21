Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB73FDBF8
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598168; cv=fail; b=B4G3+998tF+MoaXInLEskgZpaEV+rgTj4ThoXvThR5BGflTRREAi8ILvkfhlC2/c5qQwjQwxcagClxJu52fcGvPSr9jzNBDHCAwgqspUvWE9iu8cTh5Zt+xO4lFgLJSBnyM25ZfdgoJTnqnDQcRjmV+TdwcMZV7d0oVZ+Ra2bfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598168; c=relaxed/simple;
	bh=dUSSBY38/y2aO+0OOdRjhP/zxgHxV/J5VaEqvECje4s=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=dYEU+YTrMLtUa0+OTfhOq9pPFyp38jwzQNnLrGajdBiUtHB9a9zfKXzsoYbgepHDttsY+R1xAETbN88pKaBz6/ch6hwSbV+MYwnxkt/TuJJ45TGKR26WLxm1xPyqqcCFnXHcE6AgD7yIP5AbpnOHaIFdFKwVe0WQQGJFFzXhV94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gJzJo0sJ; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gJzJo0sJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKwS7Ucpeq9jE3mMgNNwv82s5z5c9MKKSUUkA7vcgDlkqA9hlYhPZugW1fNcj4992piUt/ERBmumM3WIGmCCQV6nZec9e29KAYl3Cp8twuE+qdtTmIUf7wSw+w+gT9kgUkP0QKDe1d4TEcyI689mQaY3uus5ysn3PIwZ5aUgjfrjuZGnYr8B6z5Dswg1A7P2WQ7de2WvnVIs2u3OyJiYFFKmoGusMTQCCAzkDP/YkXk2XdPAgcyOBBeJ4W0dNWpQwMxxV9JWb2cwoYclltWnAaCG4NUVITaU9NqMra7ucBiMx2hN5ihcLC8kG0T8evtNSq5d3njvglkpTamYuRf7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEDAs7yI710IaPjk5O2s62vzldG1AmLZavd7syfB6IU=;
 b=JyWW6zLR1WSqu1TfjhprZTYWd07gVV1aX6LL+B9Ekj2HgRKN46+sCnkwvUrehTlK3rJYi8uf7TbfcDmoukUJt1fbRNvsZzMWyHAyeQ/lcZI+oW+OwQeEFBgncEUncZzURXCKxIi3iib3TVz3dcf0Bf+ddNALRZ71NUqIcyXWcFpwam7inCBpB4rCLpL9bEJyzK1SYNIQTrAbqMz6Jzba84DnYSFllMkMkbwZPGdIFGV0Gt9fmYu+Pek5YN5stYdbMKcGGKAjNi4R3XB8j4soHgnLscvAe2a2ix/GR/H94ihkhu+8c1yxLFFI17LZaxMFLoPfNeTC7YvjE3PlfMJNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEDAs7yI710IaPjk5O2s62vzldG1AmLZavd7syfB6IU=;
 b=gJzJo0sJ1gsGSC6PjlzNT4CBM7pQ4XSKRstbGgJJvL84zd+XolssJOaTRU7ZeHOXyXjGwqC5FanzXCM9C4IXoMPbO/EJl4s/OR8dCzQov1KSd/rQKjPtCxwUqGC/FL1B/jGIiHeyjNWn6bismyfpVuubuHJwCCkxY37WB/p4gBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:42:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:42:44 +0000
Message-ID: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: ti: preparation for Card capsuling
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:42:43 +0000
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ffa9f5-7f4b-419d-4cee-08dee6c95beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b7yXYgCtbIMtLhB1e5PBjzSnmIhbJCjcTBJXNqM9ZsoAalTZ3K0KpB+lciPPrhZArtdSuYOkAxv87NbhAXHl4zhf7d0nJWAgCA5Kncsk6QWjqf4WCOz++zLfJcKJNP5f7EIYECuX4LSrWiL1Bp1InuNZ9xw029Of04IuWh9gZNYNghLMtj2jDjYpq54LQZkz4jkb/nXKC+gOUNQXsKGJRcFet1jnvSzKy4BRlekkpIrPKQv2OEgF5Yig0J2GkT3haP5O/0XfBU9a9o8q1K/tU/ELzQ8tP8PUL52LLT4Ai6xANUvuMYZ3My7px6w8RWQ8j2fS30eehLO8BI+Wx5GM5tOPSZudqQySySJ5qooAGgiuNy4T6ZOZjpscryX/ty9sz9AYzDexkstnRYHHAnWCun/f4LzKFkDNy5Zz6Nguo5OsGSFvxQsAY1Usf0KTDxdF0PTrkQO1jaG0w+M9A+yHRDYVGq3QCGtiUaxaYCbYKPwCFEbqbVVCcxV99KVonBo7oYoNeDfRbulxNkG2+zHWd6oUTQNGRY34vzVq0yse2xpAIt3XBoptKJAk2ICmTMv7wM4O5iWbpSck3DYTfY7HGAm8antFp2+E8/lJ2tY8FwVxrUVPVDT4Gz7moPWaDXmBQBdgydtBbkxsCFv+yGObmeCUTQqMqm4O8Ru9BIZCemGMNIrku8wvs0kKjUWELpcpkJ2PQbWJ6wlq3eiuCgN8wVpmFUDrTPgmKmP8xryJYdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?puswZh0F59CdSAt4gekOu0c0jlduksAqlTAEGX+7GBwczXuBc5dVTf04D88x?=
 =?us-ascii?Q?HGyLotTMrNxOQKI0tD1A6jGvcOdyhDm6wzPjy9APEwlQwccMsBdwSpatKx2U?=
 =?us-ascii?Q?Ngej4tO+kVccbJepk3KsZzPfz5ThQ754P+FKBMg0IXwhpDDSwE7AlGvItP8N?=
 =?us-ascii?Q?4vwEEBXd/lihXTBcBmUfdG2Gq0iLDuQGlUJqDtOJUVSjQrbh1m1J+Rb9ZxxE?=
 =?us-ascii?Q?FFRpkAyGgwcbUyZ61BzuKWA+Vd4S2QwXH/Tr9vIp1W8+dYnViuB9AXnkj4d5?=
 =?us-ascii?Q?MRUPPS77O1E/IX2OHXbX+EZBU3AFlCFBfR0yATzsvY7vBGciqvhMqh/HGD4Z?=
 =?us-ascii?Q?kYAiTnHGwM9WuOslDzLw1XcUo92tlHLPT5uvzSceyzjiDMID8cR6fnROYnRf?=
 =?us-ascii?Q?WcsyqP9GXL8X3AS1k3vrNPpdIoGDsnhN/wXL7RTR/Q6IEUxGtNNJXBKXXp2P?=
 =?us-ascii?Q?cQ04E3g63EIXCsXmjka1q/fgpkpWCguuMpF9CBxHdc5bVXJoQQFS05fAW03G?=
 =?us-ascii?Q?E/dDJpsCIloqWah7oDgs0oERZ4sZvgbP7be+XBbs/gCEYOUhrcnmSpM9+A8X?=
 =?us-ascii?Q?Whs7yFwjqZ0beXLlL8BhfnAlyaeMfU8MHpK+RkBiwB2h8w1vBOdIJ6V8Jw/z?=
 =?us-ascii?Q?BdfDbOjFHQeekLTyDZD/70AH3n2YJ30IxU6JfvILgx54rfxZJlcsFT0He3SW?=
 =?us-ascii?Q?qWBrrLapBMZHzFY6zBW3rC2NX3dC0PQ2wZ3018QPIL/pDAtUe4kpakDOuDr6?=
 =?us-ascii?Q?a3WrTUv5jFwVeP5Atdq56qpw2SJIm2zT3EUwt3w+P2PnMGaDHdleadK/XBFo?=
 =?us-ascii?Q?T34nucV2xYi5hDqn3GsY73B3vrgtBS4BszNQ8OtnUhzBv0EbFd7/1zGA3A6D?=
 =?us-ascii?Q?c/ofPOYvmiObEQFCX4yrmrCG8wLa4UJ42xymBFRPimN+yWkLIYscW6MNNOyg?=
 =?us-ascii?Q?nm0Y32fV/eRnpuoIfIJ9Lf5Wrj6Qy0Cb+8QF1w3zPwL7vGh/YFpb3313CGE/?=
 =?us-ascii?Q?NFBxBc8z/qAfS+6KIr3qn+eLghCWl9X/Vz9sw13rUYOoXCNKSwzJ7Q4gLg78?=
 =?us-ascii?Q?XiPuEqWvgCBs8nzPoPFOKCSDi/WmsxLADIpvA/HSlgAnquaE+QBDEkZHoMMR?=
 =?us-ascii?Q?TZprMFv4xvZV5ipoLpNTWprDZWkIaH8AmVLiU+Uteq2gNoCgL9/kT7pQW2vF?=
 =?us-ascii?Q?sbr6MXMani7XR/kFPf/t3flQYVsoGgfLaO2Oz+6L71V/f1Ow70jtWjM0IoWA?=
 =?us-ascii?Q?WA4UeOSo3Blw5ou0VlWa9ydlJgNplNzW2DGJuQcJQ45YhbcqrBw+9fEtCNRQ?=
 =?us-ascii?Q?NX/H8BP2vEfG7Tn3WSuGNOdYzp5ZTPK/VtSOdIobnllKlT3U3d4WbbwbQRwO?=
 =?us-ascii?Q?Jm3+LDou3F4KF54NF3ZEW7FnLKgn19jTVi5VZv+lmdpnAnMj9Bwr0CVLpXf1?=
 =?us-ascii?Q?ZRR8bMt/fTBKI3YBZZUb+j088HoJDVs9Y+rKZ2JkIGZVihgoaCipzN1JKmXV?=
 =?us-ascii?Q?iqm7rhdrkiLkZFWMoJhAZxJwmqCSzqyZtXOFtAnrU3v9MBDMbjCftXsGIHi6?=
 =?us-ascii?Q?e4oGWv5iCnGBp9LQL3eqPlxu2WMbS6YUf83SFyE3qf4t8GDgjDGvaAM1+d7d?=
 =?us-ascii?Q?EykqYHLKo9o/FYQNVdpuNjqSRjB+t6Gqrz2YkB2J6kJjLtuCPfLUrA7dfcQt?=
 =?us-ascii?Q?lBSHuNgKf3tj1iuVqgnROq/G69TqfclvQpvXOxD1BD50oDKLUVzS486EbJiJ?=
 =?us-ascii?Q?zgc7XqKm2ZPMdPwjbJLKS0Qo24IYoQMUQYdb7iZkU571Ssa4vdSS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ffa9f5-7f4b-419d-4cee-08dee6c95beb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:42:43.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgxXYUnGeBZmFS5iC0bZ9Sax2HYjgV43xUs8nQLG9Mmeo8YBv/HJTOkTo5Qv8TATadluM1FP5naN39aaMbUkI38ObZlnoxBVJvr0aBySTQ/llx4CJPSw6H5cODcPqWzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531


Hi TI developers

I will post Card capsuling patch.
To makes its review easy, tidyup its drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.


Kuninori Morimoto (3):
  ASoC: ti: omap-hdmi: remove unused *card
  ASoC: ti: tidyup not to use *card on rx51_soc_probe()
  ASoC: ti: ams-delta: use &pdev->dev instead of card->dev

 sound/soc/ti/ams-delta.c |  4 ++--
 sound/soc/ti/omap-hdmi.c |  3 ---
 sound/soc/ti/rx51.c      | 31 ++++++++++++++++---------------
 3 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.53.0

