Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38937199924
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533887; cv=fail; b=I3qYJ9//kyrF8pXpFw9EdoTUhuKlCXEuuB+MmzVvyMCWJe3ZRDHSJpLWg3YXXg9T85a/tQojErvdZKBafRUPp8VNYF4U9gVlkCPzoNc/ghTQ4cATtbboulb+EcWjvrEHgy9S9y+tYunJLhTgNyWDmzuS/dZ31lh/YEWjo7VDY+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533887; c=relaxed/simple;
	bh=Rfw0tvDIOzEiIY5n/QbHqLotFUgnbMNROKtupeuH8WI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kUtneL4veHzYBJ8q+ijuUHnGMJL6AUvJLavSIpUIjT8/4rqQ7LI4H96xmL7VYTte46tY3Woaed4IIwPcawEjedFEAjvBheFEdsslCbAn2w6e6Bg9iL33x6Lw5ImNj1r5qfTZNeP4z/Lw7248SPwoIfC3hSAnR3Xx3qtBMFxYNEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mr3kQmsB; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mr3kQmsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLPypZdvpMyjkKjug7Z2S+mKkWSVsfw3Irwysh4S26hUrClCfmvypC6C1rGiRDpxiXR+rDOVEtGYbih0DQfBZ9GXn7b6OhkFsbrwKqd90BxMf/GzFBto2nvgTgOanet6NlfZ6An8tz094JO8i1JTFz8wBFLAWZzSL18BChZRC67/NHUr5QcIjfm6IdI0MI5HnFTE+kmk4Nx5u8zlyqU6XC6WN9SgVzMjf9J5dhjGbYHrZ3+JAkExmmKbUkzxZM6fd1rfJ1wqE1QcwhT58qxCGD6knuXlKl3sSUAMvtIktWkVQXttOrB2mTKJf/TtNfGLXik3Rl/SKvMrGGB5nLUadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1bHLMVpsYYJoUxb0U39MUByRi8LV6nwfT+JmHl/TKA=;
 b=IZYf4zHPp4Vx6wJrPJMW6xLG3nb52G09QX30sn9nfJuvk6jRp12AHWRCoCiOHddyFBTLJvJYhtpZrlwNdbotRDWtcz8DuywO8/Ss+3ztAZHs14Ng6IFgodn6k20kcvpgI+sB0KzinEPqqVN5STDuFDqzjbZ2ANyjZdDYGi0dkXU5fc/pLJ+INqjF29uulcCuAa6w4glgeb2ooNhEhG/TdjZ2PfvAhD/zpKZiGbxotXef/Lzl14mUlnw1SpoSbXPAQjjOD0p8f4hNunDJ+LqJFqBdjfYBEfhdHidxW0AXcSfdiUJ+YEsVlQX4+cC/FRe9b8ak8O+odpDxpn7hmKqVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1bHLMVpsYYJoUxb0U39MUByRi8LV6nwfT+JmHl/TKA=;
 b=mr3kQmsBzNogOnPVJia2MDAPPUFhAllKQgwLaEG4Ku69Lez6mttEp6Cyuc5ETRG+UsfwFHfbSLGCDhYTCvahXbrzqYj0mF+JLh2YbEsweqW0wJGHKbl2++htWhAuKNulOvEg0AD1oBGGirkYpo0+Cezrh/SChIEwGtEZcazciow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:04 +0000
Message-ID: <87bjupa3k3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 128/157] ASoC: samsung: lowland: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:04 +0000
X-ClientProxiedBy: TYAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:404:15::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e36f44-3fe4-4372-6c7c-08dd560636af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5hwCo91fZiiQgh1OJLZDKgEsi+Zjh5lid8GOu5WX0evB7PXOxOC29XfgnRjh?=
 =?us-ascii?Q?bVqB5bRJIr1KHnKUiY3yJzZX/0K+XvYQqmCwSb0rxu44QgHS3WwCBZVZyLD9?=
 =?us-ascii?Q?Dd33wXkGu5/iDYgu6pmpu8rbwI4sIOZ8lR8dDAyYpjPrgjGMJFgMKKs18Fq1?=
 =?us-ascii?Q?hkWSv4/PX7aYFFu2ufx9AjIr36iH+3sDVfnDXdRObDX6B7e6INKGVHfD6I1j?=
 =?us-ascii?Q?QS557SiEPRpRTOKYPoWQZicjNNAjWb5FMmpB+LWpnJu+sHWWHzUvY2go4+b0?=
 =?us-ascii?Q?1EWMgclZZ+pgDZhRXpn8dIhLOPSVZXvXGLp5u9oXSj4RdIJNeEKN1CiMzjuT?=
 =?us-ascii?Q?BDXRvUW2gsG7bEkr+ZKlPUcFtaRRBSKb3wiYCTxgGnbwm/WojJGN+TQBzn3b?=
 =?us-ascii?Q?CKo9mZWt9iQQugbeVfyDd7wsmFba3zC4OEgDuXrTtCzIsjlr2UjWBu9Z/0n/?=
 =?us-ascii?Q?QEmv2xgVkVu/tbdYrdFli2LDLGh6TeVS2j9y3aeyqI2fP8h7VZMn8J3zjkPY?=
 =?us-ascii?Q?hKWksEYNfkCupbUo0FSmAbqXWJrikXM+ixccpQxU2iqU257+zQTEekGxWVVT?=
 =?us-ascii?Q?8KMvA5K0MLhzeQvxI4W2Q8o2hDLpUJYncpgjSsoXgh7l+OR9J7zRYYsxdbzq?=
 =?us-ascii?Q?kiA734kY8TQ5WfD3DwALqzDQKpGyTUn7iyrqSL896iiJYpi6b1svhDu3oBED?=
 =?us-ascii?Q?a2hK8Ws3pwVCDF6+pnXwtrsluQ6lvXmHIMOHcxIt0UylCubn8dXsoW/DKL2y?=
 =?us-ascii?Q?EUg2ccWhGXTchwexCOnPT4qtei9DGrmG0hMR3ak4iAas+pXHG0uchtzlm8vU?=
 =?us-ascii?Q?QmGu+3NX8XftsKpsW61gSR3byli9lDn+yBJJAcd4s5t4KS4FCQ5i3+b6xNZ6?=
 =?us-ascii?Q?oFCL5kucE0dfEdbhZqWDYBtCDzcGeaxucY79pp1gcPnDzgDM06+Q+PHN43QA?=
 =?us-ascii?Q?PI7nXeSKkyDEyNiYB0QRZyF5ULC5MCDezmaIYD0PXm2prIJXy9SN8SlsNVPR?=
 =?us-ascii?Q?sIRifdm2I+8LnSBq73JygGZar3T7xLxqp0XRkQG0ofKf0i2dEu+rDe3tmRQO?=
 =?us-ascii?Q?ZT9PC42dz8XkY75syGv+UT/T03h3S6CndMod2QdifjiWtlYZNFdIx2jQ2NJk?=
 =?us-ascii?Q?nIa9dwXv1Z0N0noVLb/VYyanff4n64s2I15Vnil7k6TTFKyy94fs2RIv1Zxz?=
 =?us-ascii?Q?fJUPGz/yf8zw11iejvd6PZaMBEkhMK9pL7tS3OWXaWCPIGFAF+D3xpxgdDje?=
 =?us-ascii?Q?qTXCsPncOGBYXCgz+56pV4MqMhFPtA6QGAUMbXzIz6oYHArK6aotPAorwDYv?=
 =?us-ascii?Q?QOZp4Rx8bKbCjS6OLLDt+be7NewMUqKjolNrefuK/s+HML+lAOQb+wab/SNB?=
 =?us-ascii?Q?iRqCgeDx0595hGOOEa7GPWwNVbl0IEVdEcnbNogSqPGWOlUGa2wo3nBJEadj?=
 =?us-ascii?Q?+I2sBmsjeJdDoMHwldCaKakBjAex+eNA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tLQIZI6UOw7htqAbb2l88+cfkMjtqCoNsgXUXmDPsFJ7d3uCozLZJz4uLs/y?=
 =?us-ascii?Q?kM5DZ0baWUi9s882E1sldSo2WBn/z2vy/msPdj+u+BIbMwOLnWMcfw9OFPz7?=
 =?us-ascii?Q?2QAgxGSb6bnLdb25CEU6frEpGlUUCleEvXl6DouNaZJC3nQEwTnT2dF+LY2M?=
 =?us-ascii?Q?oV+8muz7dJ7ZeVS2A54TjVSAEkWzNaTBn6s3m1SP/tncNxepCoccEnkUkiXo?=
 =?us-ascii?Q?XnhBbMyYMO6YAB/0Ruke4p960JYl1ybFiYGtcIrXGhiJYdw8awT+EQUIRnYb?=
 =?us-ascii?Q?/sO7HWKW0rjbuGGalv86KaxsyvGNpU6/WoAQ5bA6L6xbpqeCANgBKsdxo5+8?=
 =?us-ascii?Q?rJDeW9pL2rJGl51kLxwkfrxhe22n0y67m7sameOE0TqZnfw60r32rSs1wb1s?=
 =?us-ascii?Q?fq9zAcEysLs6LWns26rxZjTErqOGFRnR5pLuUHKkk0CSxj84raxQVmiH16Iu?=
 =?us-ascii?Q?Uomg8Ogxsm+HJGZsKQl+2hoZJExka7ReslDhg2Vhwf93PqLao2sILlSw+cZH?=
 =?us-ascii?Q?td+zqa9Gm7aDjuiTETJ69GCQLI8pAk87uCnfdkMkULPTna5y2E/P2QwCQahK?=
 =?us-ascii?Q?kedqP0CyOHgmk3BM0InLuBvOXXxiX9saVEQ0IpsGNKZ/Nig8eYPconNZh8t6?=
 =?us-ascii?Q?Y9uET1f07VUewbSCtP/eJFT+SOfdPaFnw4k7Q4vauMyiEYVankn0lDeVAK74?=
 =?us-ascii?Q?7eVhMCGkakY9F4RBZS7YkAzkd3pduHh4bFtUL7ujo6DSELHBal89A/7AtSIF?=
 =?us-ascii?Q?3rHb5xUEF+zboIhK9SNgQeQfVqjCDbAN9nHn6i+7aA9FGG4T4Nma4/hDM/tu?=
 =?us-ascii?Q?e0yr+FAf8zhTQbZRZsQ4kWuCdiv68+uB/nDyu5VBzhm0dXCWY7wuPkpLV6gY?=
 =?us-ascii?Q?OwqnH768kLgXUItcf3Vf+reaXBBQ51W9/voyANFRU6PUWfS1hD5bZV9jynlS?=
 =?us-ascii?Q?j103cWaj4yv8J4R63CSQBXOfrcf2VtNyquH8AY07zlz2fREy/QUJ3Dq30OOh?=
 =?us-ascii?Q?LVKAWDr4ihtZgLb+7No3ZhiTN3luIOowS8D01g8ybDfMCUuRETRu7McXLy9W?=
 =?us-ascii?Q?PtJYmurfTkrTGhI8ZT6iHgsea8unmhJONYw1+7WnHgdKjLuh8F1b9TPk7wx0?=
 =?us-ascii?Q?FXSnbhxtX1XdbpIQNTfjqjeFbAvnHEdPUVcr0k93f4UJMwaVCdpKK3XvMMF5?=
 =?us-ascii?Q?vro4QDK/e5+oh0x5GcUUdQLrmmqca0y6vPWEshh5w83ohpAMjv41Qu9J29LG?=
 =?us-ascii?Q?oh6jaoYfBZo3VYXOK57BiPXqSfwfo+FoIfN+0v3H0r4BdbuH42n3oK8bWVC+?=
 =?us-ascii?Q?gv/JQNIUimfV/IsuTyaRpC/D5j6irmQ+7f42rDs3T9KikPkbM7SzEHYoF+sV?=
 =?us-ascii?Q?micWWe84WsIlQYB2LAuOLDlBrz5lL77/6lkSTUjX0QaCAcn4WUkECaco1C0U?=
 =?us-ascii?Q?oTHogRkkjqJ3ieou0J/YHetfxSJk7cHem9OcmvRjaaY+i0k8Y+7B/RuGdnFH?=
 =?us-ascii?Q?yvD370HP0EV/mimsbIX7virHvElFn3rqG3y4u01aSjb5dvaYfvHB2nFG+sZR?=
 =?us-ascii?Q?oqa9OfSeCLEBb9q2C0SWBqUJcwGETWIRELxeBzvLrvw37SwBgq4Ox8nkb7Nh?=
 =?us-ascii?Q?EN/JihyWfDHqZjG2Ax1mIdg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e36f44-3fe4-4372-6c7c-08dd560636af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:04.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDXtOVHmT7M57bvmfQ9/zwuD09C2lWw9CMT/HDJTus7pR34MnhBDSdKlTJEp5BWFhm7IdVimeKCsYLbavDCCi6w5ZrufyyHKsmboNH39WoGt5G/shs2F9EUacSJn8huv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/lowland.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 702cb4cc1ce9..2cb19f4b9dad 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -105,7 +105,7 @@ static struct snd_soc_dai_link lowland_dai[] = {
 		.name = "CPU",
 		.stream_name = "CPU",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				SND_SOC_DAIFMT_CBM_CFM,
+				SND_SOC_DAIFMT_CBP_CFP,
 		.init = lowland_wm5100_init,
 		SND_SOC_DAILINK_REG(cpu),
 	},
@@ -113,7 +113,7 @@ static struct snd_soc_dai_link lowland_dai[] = {
 		.name = "Baseband",
 		.stream_name = "Baseband",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				SND_SOC_DAIFMT_CBM_CFM,
+				SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
@@ -121,7 +121,7 @@ static struct snd_soc_dai_link lowland_dai[] = {
 		.name = "Sub Speaker",
 		.stream_name = "Sub Speaker",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				SND_SOC_DAIFMT_CBM_CFM,
+				SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		.c2c_params = &sub_params,
 		.num_c2c_params = 1,
-- 
2.43.0

