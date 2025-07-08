Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4340188006
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 02:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942807; cv=fail; b=sr5tQLjKxOCEtxVlMjBGmNOYQy5PTzQlCd++KY6tGeDMaox/q+RoXDX6uhunwdS/iD5r5lz5RUHkiSmCPEvxKv8G4ybNeENukWlO5MfBT5WhFW9/rk119XaLa3WXEaEBHjZQHjMx7F8yIxSNZmQ4EZ0c7wP1KhgtM7sQWjkXhos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942807; c=relaxed/simple;
	bh=3mvdFG7LHgGoyAd78jcKPB2S1yGcfCc6bSNHKKPcbXM=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R3yk1MEKuTaySNbOvo3YGSlKP8wekiTzglJRdYMPDY0qwn0v4KSRFFr8f5gLpSYkTDIT6HSnjoq4ZLrs63CJamYdVqMDixclaZKBHvTLVd9RqlecUksTc87G0wYXjFy/71J5IC92tyK3pSyRIihMBmwupyi5X8/pWpMZcHICvfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kNqytYeV; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kNqytYeV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BblcJGcGes3/9rf/++L5cDFS5eZ23wtr7b8MkNz9FkA+IGlwLO1o1UF2t41StHVOJpsuJ79mgt+9hV/gPTRG3Z6GT/x3rqp6GuBKZs4m/xWFeZ/YWIP2jCKwcfupVz8a6IloJDE1WBxLHgl7nMX4Z0OYxfkkxsy9rWjKle8zGpA7Nwex7JcU4uUj7ivOv2kWkHCT60AfJxseiJJ93ogbVOUT5LlB0CPHwPZEuj5MS6fScBS0r7WVe4rzH4IF4dgeKFzflf3waTRlTwYKtsJD46m/VJEAGzQAIqUkhiWGe2rfktgfpNQPDJWKOYelIt/chm8o02i7G1hNwQ5MvdNW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfURrGBTf5tseWiV6qrSI3FVrYiGbjjc4zRWgMeQIwk=;
 b=w6iJS+78r+Qmg9hEnjTRPh+yECiR8WwQj91UAAif/qXj/hhn961mYDPmYXvReDwSkjGWdNm0YTed4eUuOHd+NgP9ei1I3bt1iWP4L3y79zOPqAloa0X4VIzvXjynAocy3v+Rplbon0Myx0IAWaZkNUSJ5dkVnXdPpk8bzVdTJhg8LVvR0wXUSGy/00CenE9Bb2oeA0/XnE0y/vUV8mbAN/xXlnFm2PFupt2EMeEgfWS5ijBMlP76Hlipvsx+fWKwTSHtdttEvyj2PXhjKtIqQvUy4L5UKU4FT2ttW0pTusXXZcw0PDrqTG9JXGXJyGgAVRPXT1p7l2GV4Nq+/CKxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfURrGBTf5tseWiV6qrSI3FVrYiGbjjc4zRWgMeQIwk=;
 b=kNqytYeVkyixTBYxsErm2nXUqA/XKLEaxAD45xqzqcbN3NBeKjnT8npOg6y6yrf90wBEFA+xXuPLwQ1B76yAPz8sadWOpWg1UPqNf4kb8fHEonZd3PSHPHkjn/j993MJKQrexxgd78KKxwMxHOOf++Op8ntmP8Jx53dQFGgkfao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12162.jpnprd01.prod.outlook.com
 (2603:1096:405:f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 02:46:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 02:46:42 +0000
Message-ID: <87qzyrmmb2.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: rt700: don't set dapm->bias_level
In-Reply-To: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Jul 2025 02:46:42 +0000
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12162:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d4d19b-2be0-4bde-c8c0-08ddbdc9ab8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIQmfqKUXbYxlFGmk+Nj9d5BE3p6Wnn60TNvQ0RDuKpWk4z0ExztiRGxzL0x?=
 =?us-ascii?Q?ju9jJ06sQQFqT/HO0mstAw3RIjDAiePEyeWZVBUw1SXnpIrK8wyLphOg3d32?=
 =?us-ascii?Q?dOmWAq0gbKqcG5Kz9dsyiy0BISSHrYJlVSsfwChDAC/ErslQHdELIutr7hpC?=
 =?us-ascii?Q?bVpfg+1mYXoruseg2jMChiIpcKIUHz6SlZtYDCeau8JbfHR72mmpZMxISBDx?=
 =?us-ascii?Q?bf4e8nf3HfimlZGh31L8LitGiWO8MijhzCPpsrh+RC6dCqSN+JcMnt4fRDq5?=
 =?us-ascii?Q?FUA/h/J20Ze78AkxErOyt7T+PZZpGcYO7TJ9YAk2nxu929WxXHQHNJTS+XSa?=
 =?us-ascii?Q?7xspZARVO77TyxygTk5uLVbrQ9e1w2hWIS4t8f9PtDCSR3J9Durh98shCByU?=
 =?us-ascii?Q?vvN8xsptpz9mvVsC9tiHbXrJeudexFkSnjvCqqWb3j+fqc2SM6UEGFOZZGCC?=
 =?us-ascii?Q?5pvYTDVGhC4bZ4Q0rsqVGyGznIHXNsbcyn5gqe5zqs6RrqRGur0UPHnOzPrz?=
 =?us-ascii?Q?Z9zSERmER8Rd3/Ss36vc5w4VtcOB6kMvEhuF+U+U4znhgBlEdzG15nrORq3i?=
 =?us-ascii?Q?6LKAZuCYTpZwxswljCut6urR3/OVhQi1DX2TpdkHnTGm6gDZXyVsNtlxuL9p?=
 =?us-ascii?Q?Ujya7P4Lm4wRdkfJQZNUcXtHE+EUteUfemO4uIna/9W4k7FsZ9NqrlnEtuNS?=
 =?us-ascii?Q?/RxpMm2zfVhRGBHwaqkdfHe/PsrNbpZUaWfVRVQwGvxFNVaBHUncUB2kF/5q?=
 =?us-ascii?Q?iWiH94Lnx4/v8H1WcFHtLUWoI6KMkpPcH8b+IJV/GN6Tg83gsvA6lHNjUsT0?=
 =?us-ascii?Q?H1JeFXDe+V3AAtPLnx60tJDGzWnCb6Vkmfa4le5HR+bKs1iQ3ypvJyCmTIXo?=
 =?us-ascii?Q?8HmNYiNJA8iQqK7KKnXJfHdVoqKyWmSoD+Z1w25gAeonVy+EvRzaw7RjJ9cW?=
 =?us-ascii?Q?4JwSQlx941hyy8xYzHnfTB4W5yRcfr6CJ0jPwT/0NM22BuLU7WTODw861MxU?=
 =?us-ascii?Q?ZBrOYAOLNsPB0cUHUs1rOsdwknLrXabaihjjnfD+rO2jreqUEuupdFq6Cpdn?=
 =?us-ascii?Q?m5rZ6MCayTHEmTOMUHYdFHVdkFuAoeoSvO/cGYjhqeaaolTdz4+KAv4ZjMqh?=
 =?us-ascii?Q?fTU5gV/m22zRPLMkayFuESzamDJC7HwhEJCE/wHnCFiwNy+UVRoxeAJxXXmh?=
 =?us-ascii?Q?jp8Hhn4sjVrgM6+H0lanu7rPa9REZwYty92IkqB4wvZzMP3144SGs9XdNaz+?=
 =?us-ascii?Q?qq1MThrQBHu+2H2la+0ZOM1O2w3atuVuPRS9GIPjiTBnvEhV5LEQvHknwIqP?=
 =?us-ascii?Q?nLhuSpwe6TtaKQib0VD8Y4vlyHA/tpTyp0W7WthqY7bjGNPZa7InBAbEcuYS?=
 =?us-ascii?Q?NEOwepFHvbpmlVOn/N+uIcFzw024TOykPx/dmBYjfz7EzW9x9KP0wZ+V/1ry?=
 =?us-ascii?Q?6pO6tDVebBGPXi4X+xDAEB3nXdmd0KLgyQYXWhu1N3xPOcGtyak9L4B+gjSR?=
 =?us-ascii?Q?adZmujNGd/j74es=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y5lGHG+TmQG7ykB+3U5jZf3OfPnWGnFtB42d2Tq4w76pto8/+Njm4WqVdj+S?=
 =?us-ascii?Q?TkQ6SWn6YzN2YFJBadjtqfabIcueZVnsx60/ng8LN495F8r11MeN8pBVJQ06?=
 =?us-ascii?Q?u5nUhRTZGy3yZPQNhQHu122PXL1geK/C8KklKLQHsb4o6YRHEb55WcIJi5Lo?=
 =?us-ascii?Q?6HjBqBfdC1EZPdLoVIt2WOt/USogXpaboWnzM60s3vjeTFdwsdxepVcEjWDq?=
 =?us-ascii?Q?dofps2EHEyppB0dwqr2rzBEVqKazpTYA//A6oKC60ReJH3rK149+cLhO4b5i?=
 =?us-ascii?Q?dznWl24d/HRIKoTmfpGagBmZE1/xKugDF0MWzPOGI9+lcKCFtmKnGeIx1rbC?=
 =?us-ascii?Q?pIDqH0s1Gd6LLBXU+hJXaeKd/0qpZk0gH4B73GjpzLoNKm075+gpjIUtecSP?=
 =?us-ascii?Q?5hrz+YbLhPydDCjS3uzn0AgpGz5szNJpx1lwHMxRBewaxPuBobSienaVo/EM?=
 =?us-ascii?Q?vn+EgeWCvWj3y+HitBndDCQ/yIOXnWhKXWSfmjrbGjP3L0Y5121zYmUiDi9E?=
 =?us-ascii?Q?IMtxi8K8z2ynGwosflpwh9bk97jiEXeWT4QHN0MWE01jddjKsN0adIbL80uy?=
 =?us-ascii?Q?datPWoD457n2fZPvOY9jSYwIAr02jSwia19ZRb+iiLgpVNr1OHF9xKfwBZna?=
 =?us-ascii?Q?ebLYF1WFo9hgSgnObTehciqKEqvjDsThG6MkZifL/jsSx2yfigrcthnxeQl+?=
 =?us-ascii?Q?VdnQX5aHiK4tUpTNX7GpEQvXk7Xz/yCswqM94u7GIicf03NObRFNy+Iw1lI2?=
 =?us-ascii?Q?x0RGDUWvwN2bLpmjRZWmAW3BG72xcasjF3/CX0GWGPAUbODl3dITq6L4rykv?=
 =?us-ascii?Q?RN3R4UIWAHr6UBe+dcCDe/9120dWNKNuJpamSh93EVYoNPLEbJcS9x4RnxkC?=
 =?us-ascii?Q?LNwcelHfd45MgJ9bfVyTJs6JmisUPEpqDaXaTnW3f+Blsh5UbjLkyNpOouDA?=
 =?us-ascii?Q?QQVj1c6UcdrkRgMgHFeOt8rtiQDygx9X7b2r/QuHM/WSC3QVKpdGEw1qWS2F?=
 =?us-ascii?Q?gIXS8JxZdnWm4H+Q+mb0vqatGsAMsWqagVYkDwK3wU5WMUJC5IGE98SomxpJ?=
 =?us-ascii?Q?fCPT9ogh/henftyFVmIK32tmuVUmo4Fa/hCp3yZHvZzYuCjsHNwOYqlzhWZd?=
 =?us-ascii?Q?CSMqryXEjbD+elKt3ENb8i4LNn10bmZOPXHuDDg8D/f43Ji46/gfE+ifswMV?=
 =?us-ascii?Q?G7xoaUKhRy64SqriPtOmOmAC9pw49WjT/Yx0YlR2DhzosMpq3umI2LPZZiJ9?=
 =?us-ascii?Q?xr5KJHoJhFkNHKDgHjo3Bnr9uJwX3K2vw1++EYYiHiaJ2jd1Npbi4Y1ckfp4?=
 =?us-ascii?Q?Y9GwtXLE7zCCNOSINU4cU4igEbohNbsVgN2T7ROTTFnAZSd4/EQiUN5Vmpua?=
 =?us-ascii?Q?2MrtLIpAOt+m6jIlLCq4Dvg/QNFbrwXox54m4rXsj3ui/P4EWMl1JYyA3sCH?=
 =?us-ascii?Q?5cUdWXTdpWOitw4uolomhG5UpaLWeIVCuZEeHqubagOjS9XCaDYlB0RAOJNC?=
 =?us-ascii?Q?9ZZNJPNuNIeJ9UclGnoPpZgN+A3r4TWaH81nVq+1L1zDOWbUZQnM1BwyFIvY?=
 =?us-ascii?Q?p4Wq+7qC9BMSQLS/XH/RzyF5UUzmpK3nUPYzb9xUhJvaPPZDpquh0QWr9H2v?=
 =?us-ascii?Q?e+TmbxkAIhgo1KQJJUNVt40=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d4d19b-2be0-4bde-c8c0-08ddbdc9ab8f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 02:46:42.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSSHH67QJuq21wkhG4s2p0x7/w+79lI4XES8OZX/xOBxyV0f9FjCffolDUMCD9gbCUmPGqeAQzEYYWxKh94SM2hzckk3npfLvXji/3zEBVqsiXQmTPkPxvkTbStGaBMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12162

snd_soc_component_set_bias_level() (A) which will call .set_bias_level()
callback (B) will be called from snd_soc_dapm_force_bias_level() (C) only,
and it sets dapm->bias_level (D) inside. No need to set it by each driver.
Remove it.

(A)	int snd_soc_component_set_bias_level(...)
	{
		...
		if (component->driver->set_bias_level)
(B)			ret = component->driver->set_bias_level(...);
		...
	}

(C)	int snd_soc_dapm_force_bias_level(...)
	{
		...
		if (dapm->component)
(A)			ret = snd_soc_component_set_bias_level(...);

		if (ret == 0)
(D)			dapm->bias_level = level;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 8f6d569c8f25d..816117c13aeae 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -861,7 +861,7 @@ static int rt700_set_bias_level(struct snd_soc_component *component,
 	default:
 		break;
 	}
-	dapm->bias_level = level;
+
 	return 0;
 }
 
-- 
2.43.0

