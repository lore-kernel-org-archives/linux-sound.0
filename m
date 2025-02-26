Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C408198E6D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533926; cv=fail; b=UidMDBBbfx5cce1++yJ5od8aln4bO7ECV+LB1Ke/kW5c8lR3UWZpZhelyzBoKYqSfXtuL+KkbSv19DYkGC71oVj5vVAlVmy5VpH1Oj+02RQafWPwmQSLT9vlOOWL6BXyN8y/rA1giZEekL4tFR9DMvUwUD3hUlfPppBoazYGN9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533926; c=relaxed/simple;
	bh=rmyntRfwd8zxnuNSX2Y9JmhVqhjmG1oGmn50zo7iRZ8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MOmoNvwaWZEryWoub1BwivSQWCZV5g2OB5ncpaeShtOLE3s+oRF8ez4xMziTEmBSWwPkeDfTggzdiB2mnQYTKIuCtyCoBq4yvnEoARJeXTOPOwycsiMojKIKLCvldNwtLsRT8UIyitLLM/mdZM0NOwqLYgeBAWAV/l8hkWVg37k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KvpMzOXH; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KvpMzOXH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5sYFygmUh/kGLI/R+1sYCmHS1K7oQOTXoHTwYcgF0GZBcqhRcXX6Ann7FYGVE6BGLHaoYOKAOsRdewP9wqYJfKhPQJSg9uujfgLoSaDVfMAyI7qbHd8wGf0KSjsoM8DRvdoEjQFPBOdraWJl4RWJZyJsyEpTO7NiJjaeSGyWpMLNDcO1Md8N6X1sAiUSZRaKTUSjeXD0IhKUBjn8stDoDt/moP3/Kb9opEJCh6WqY17SLs++RkaWn7pOdkc8Z5/HLtKnxc3NuJvUBOhbRrEUiZG9m4D6abwy0ptC1nb3DdrcKJlC6KcA06vThHwCjQTMC09nT7t2ouR0SgcJAHnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYDsXg2WEzrvOO993Lcz5P3YqtmHq9A28Sfnrl0dU54=;
 b=J379SMCR29isxrKImJ/ZWXK8CZ6G5Kp5sUlJ0sNdveDW9kzysY3gSjQCZ6kWSW5Lh3k1xTiH7vQN30YniWaOOtqvTo4XMo3GkA2J9vm5SsY2blWfCxuPs4qktipjJKsC0OdcmYVYX6IVTrJgvZp4DXzW3S37b830AVNET7RPty2cl5hSEQsvB3jK/nn4WP+TL2yqdQHitLKfGEkntL4TX4Sq1djIjtkkU8b9zOe91rQkaRfSG0WjYzu2a5+WZp5MaW34D7Hiz/oEV16zSPuvtgXsXvIFsL3UBAShF+a4zSbW8wKAVUUKt/iKgmFk7xo+13Yq/T+iLWwKpQlBmckJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYDsXg2WEzrvOO993Lcz5P3YqtmHq9A28Sfnrl0dU54=;
 b=KvpMzOXH8HNwwKFQfwq0bnmEIFhfK0rEKu9H1AdbWm0bHdRQLDjxk32HaFCTCGuKTPD6B6gx6vFDuxBZLdY7+ljoIhExoWj2Gz80a7I6EPXau2WaZ3Vqcbi3NNGDX8JmwfH0utYlITPIoK0qrm55A2K3P5CnhM/7eH/vvSDu+14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:43 +0000
Message-ID: <87v7sx8oyl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 139/157] ASoC: mediatek: mt7986-wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:42 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 781e7382-b205-4cd1-5b90-08dd56064dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pI6J7cE3yjlyEUlzr2AjEk3mAIOwMAnbhaXzAdaQvgEsq8OFGu3ybdnRVWM0?=
 =?us-ascii?Q?y2pC+/ov0IKU701lj+dcm9YjRIJCDVC8cH2Yaq2B+d+YquudA89rF8RJS8Ok?=
 =?us-ascii?Q?LZBrFmhr9qSwtFXwU7cKWWnkzC25Dc71TJZAd4f28BxtJDYkVVX2JOPRwmrt?=
 =?us-ascii?Q?nHmopmukOHhJIuJtpqbvk8ebaSQkw9NmucB/6vBxgtytdRZM1ttQeIq642Nv?=
 =?us-ascii?Q?Y391kmz0Owz8I0bfmC+w3bidpQpaDD9YsZ5x2QkU4zxUhd577gdFmtUEzF0P?=
 =?us-ascii?Q?HDaDkJrs9+3gph3itoOrG9w9onUOcET4mkmNC+BF+1B9L/mE133EbwLOPlBg?=
 =?us-ascii?Q?xD1YJuQq1VAWaMU1ybtLPKoFvg4Z58lFQmRo89hn3/fiQ1bVSPYxGKYTxyfy?=
 =?us-ascii?Q?iNtH3lCy9K45+ABdD+LJ9Go+ZOymIsDVUfZn6ZfYh/RHPgzJSjzpvUhX4N6+?=
 =?us-ascii?Q?dSJcjayaPPbhlqfHCMav5VYXa3p+FT3h+xn3/iBn+9MSGDLzyT1E3jXIKY2Q?=
 =?us-ascii?Q?81nb+MMTWMqNB7jNpDw2oK2g30vP1/hDpFpQ3GwAHe7FkOnV+93IsaFZJ2/u?=
 =?us-ascii?Q?aIq2FWqLlnbtuaGvQcMGsMAEWOdFBO3NntMXMtR/MKJXv7g9J1zoC96He9bz?=
 =?us-ascii?Q?tj6e+FrtAlNULV915bgxVvJ1W9s7qFocT0ZvZbGacawyLbZms+/xqL0UHTgP?=
 =?us-ascii?Q?tzw2tXLSoxu2OmBPnX7e/AWjGLg3ZRbIbIfraeQdXa1wFqa4qQf2Oa5mFfg3?=
 =?us-ascii?Q?x2WSs8pWom+UkMKGTzNrXfSKoLvj8jTOkAvPP2Sk36nAgG6BUiQSDQp9NsVb?=
 =?us-ascii?Q?B5EUlZR7mHul2IHdtKycDXn58FG2YF4GICn0XFYpV/yAoacR3XZ01Bfhxsy7?=
 =?us-ascii?Q?Uc//N/4k7OqHpT0Xc2Wdo1kK0a0j+S05p+rD5vxwPNX3KDcZBkgdDgKWb5LP?=
 =?us-ascii?Q?+kZ991mQNXo9266UBmJAZgAuo/JQ+NCCOqnuMmCm/wtzYsWQMdS9LYfY5PnC?=
 =?us-ascii?Q?N6s2tlow4jWFd3jEEX31YdB0KiHqGYa6LxNoPtawYwsmTURnRtnipj4YymJc?=
 =?us-ascii?Q?wsdSSTnDsPOaNGV+L6b6LNAya8otI1fqluBQ6qSrPycl0HJrVd1crRRcmfrv?=
 =?us-ascii?Q?m01hTfdNoMo0P5AeW8OsSu97c0+QTZq9f+cFmHJyl5JbPMI8CeRh7dFMdaCD?=
 =?us-ascii?Q?uJQBsPMr0XK8eTMFNhTQxcqvAJ1KYlLdri31Lppqe84H1H5cYkAIofKrjBQZ?=
 =?us-ascii?Q?5137+c3WL90urUQDxxXhO0lcKqnJDM1jOkB8mkByyrAgsKHK0510snqaRMqd?=
 =?us-ascii?Q?heNsPVeNkdip4heTht6BSxAbrmItm10CdWM7KDZ7OboWA/KqwEocQi1auVaM?=
 =?us-ascii?Q?/Oqx1BQgans3RwkARlALJVLLX84CSaOnoULdE76Qzxczx1v7y9oa81EHZUJX?=
 =?us-ascii?Q?hEWn53r0Z9uGA+fP/TSTwFs7gKo48JXG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n/B0wlnQbTfJCw5sQNEupLhhRJcvslqqmKmTrnKCOThJEPQf+dZmDLtpGUsN?=
 =?us-ascii?Q?dzwizbnGqMJBeYRiiOHEvDhn7HMcR67Mb1WMPAlURXzqaP3iIYTNNfM3mMbc?=
 =?us-ascii?Q?jnrbYVy7UoWd3cXAW6LHzWnfYZpywnLbe0h8sYsskwOgXQrbmJKW4UX2kx62?=
 =?us-ascii?Q?ZTE3o/xJrFa/pgp8j/+aMGxa2xWmq8jidNmJZ/kNqlOQwNr6zgMnpDPTmZC9?=
 =?us-ascii?Q?lXGwsHYexmN3O6je+yQ2i5fJQ3Mt6cng2yAFxWjmWfz4If6TN8QkCYyE2aDs?=
 =?us-ascii?Q?2geBlha4s/1APMht4WpPgQzsjQhCTp2bOcAujl79z8bApsUyKTEFuCluEMdu?=
 =?us-ascii?Q?d4zxPniNz18a75V72hW9zH2YOnM9A/8dt05XzqmYvKdbJkB6/zJsHJOdEm9n?=
 =?us-ascii?Q?++gDosslqCDwglDYaBO5F8k+ff2M89jAEpqFNZtCr7fe6XaQJmhutfQW+Iue?=
 =?us-ascii?Q?Vv3cCDGDGk8BH+0y/lUTNdewwiIEFQ1B4aaMsUJl/OlfJvWTBIgFOOHTvpQZ?=
 =?us-ascii?Q?v91tOi4YO8D1FZZYpSA1KhajaNP0UXtPxaYPa78oX9fPjiX+lOqMT0RoXf06?=
 =?us-ascii?Q?fdIOM4lEnLboG1D84dFXV9P8O/8XIKRxqyP9q4yvygDaUwTMZDjGh3iCZYf+?=
 =?us-ascii?Q?q7Q0Gcd/rvshlOvyZh2K51WMGMhHPGwTwSfeI02nIugdCbNoKTBLWWk2Hxf3?=
 =?us-ascii?Q?caPf1ARZbWteeTaAMo42yotWvuElM+DDQqUcgucFGsaXysE18wetDl8Rt3KV?=
 =?us-ascii?Q?EWZ/M9bGZnP6C7D+cF/4mTdtJmaMkbnpzgUpGxapJCS8fapElEhMusop5I50?=
 =?us-ascii?Q?ujK1fc3EO/+hXD5QTzCWknOi9YKwOmUWkuIIGhKjPfrKUwmXGnGADF0JXiL2?=
 =?us-ascii?Q?/VpokNg6RpvKBKsh0XETk4n18fElUcJqSmhA+3PoB7O4iEQKD8Pubdw3dUb3?=
 =?us-ascii?Q?jar7mUVhHCFA+m9yUmeAmG51KRywfgXpB0Q93IxFiuNVFsbWGLrDVIDhxNK5?=
 =?us-ascii?Q?lUS/a6bFO2J6+syoKSA8Z++3NbF083t0kXWE1RTLBHSi66yNgLxa7Tq2Ou0k?=
 =?us-ascii?Q?K/E4+2cd3rEA0cSgcySpIzc25EKoY8vypF9D9USTng4SI9YMBfxxN5Tjgw2A?=
 =?us-ascii?Q?GWkMlJ+Lg4esa28oSoFjy50XLyCL6yylOaL3JhZ0xdV5x0srhj0WC98Wx0xJ?=
 =?us-ascii?Q?q8TEl5VlFKe9LXQ5gmPfCk7QOXZ0xIa0qYOPPWs5+DH57HNN3TQULBKL1YFv?=
 =?us-ascii?Q?9tIUM6mHv4y7wIULj1fw/Ff3s/nqAYgH/HxLZ5ELWcpZDcyo6birvq/OQijY?=
 =?us-ascii?Q?fKiU93pS7Lb5q2uI5gVYPdpupBlMcyT9/PXnT8E5RohGRAZSOra/y1VSGaUY?=
 =?us-ascii?Q?u175nXCj6g87vRcrl79UMaM2QrZ9YsFBpHgCa+zWF5mXMfdaZB+GEHE8Srar?=
 =?us-ascii?Q?uhAX6K2GoasCvlOtOEN6+CPoziZzhwAXinzKxYpDTseW6bWx8nlNFCRsZOdU?=
 =?us-ascii?Q?rqlftBLM2LWhcBUkJ22U/JoAWHHRhm9PoIQqqV2DJ1DM1mGPN4cbw1d9DQ5a?=
 =?us-ascii?Q?p41bZVZf7o60/0WCat6BlFdjXJ4cxPjbU2i8apOmBAZDebbJtOc5NOR65qgY?=
 =?us-ascii?Q?5W1Jmr70YoDuNhodXfZsIUk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781e7382-b205-4cd1-5b90-08dd56064dba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:43.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvfC08fkmH8aJcx0qayDStgKnfApuN+R65bCgGEyB+vvHJdcBhhv+wkQBQ0tRVTvFRD6YffBsHyy9FQZwBpElabwm1WNuI3mo4HZA9xiyVG6aevzPNrhdj6l9S5+g+Tu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index c3d1e2eeb0e5..f1dc18222be7 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -63,7 +63,7 @@ static struct snd_soc_dai_link mt7986_wm8960_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS |
+			SND_SOC_DAIFMT_CBC_CFC |
 			SND_SOC_DAIFMT_GATED,
 		SND_SOC_DAILINK_REG(codec),
 	},
-- 
2.43.0

