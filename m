Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090B192D98
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533768; cv=fail; b=ljhOnwribfU2XwVcI4VYUm1nXPEaelB7QXxeLOKaF5xX892T54nA/6ZBPGjLAfk/AcPIZveTA7AFTFbYYGMitQ0Su0H43BANdGCnk7NRinQ6dESkkbXWCftN8KYAdWLdpZ4DjM0ULgmIM4p2BV1Y76wSk/XW3cFnby6TU7fVIww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533768; c=relaxed/simple;
	bh=BG1OTM/6Q9ins7A4KK6eOdpcM7MWONM+AMBBQTOgDi4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sH1+qkRN0wnJNelJFgjlyw/1TmH5hSpiW5rxDx7ziMaSzvhocqZFUuC9sA/aNu0EUUjrojnvx3bO3sR77rWGpA1ySYfjzltipoe/pbu0f3gMz/Fx3QACf8qhWA7ZnLoY20LCsUelvkIkozUZRwfVV5UoJ7HBM23hCZU8XfDc39A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pwy4iq9k; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pwy4iq9k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du4NVs6FTqOsIWJrNiaT609UG+87Q2EXQKyN88EQgDFbAH7a2l7y9cQq2+648JbqW4wyemUg1HCkLvFpbfub7ZNFQ4hiIGcKCzZFSeiB8QYafks6vmCmNqXxFy3SrjMXG9QvVYp2fGO5kh/RPKbqVKPxDC0C6Hr5LDQR9Po0XN1dvvncYtOfSK6ASqUef51dZZ8H21KzyRXnZtLZIBsXgQ2nc77ZkqnhuNV0/2kE+RDWea/FD2mWcdqk6MVzaCXZBoN5GVyLBAAgdurI8Su1hj6TsoiQpQKDid0VHtHleOiwPbLdxI4z9uVGpoik073m+8swVA6foHsBTqaMzGa1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ry4x/+xGfh2qftWqNR4M5bIKquN5xzZ/oevsJrt3Q8=;
 b=b1q3/pIHpZET7v7mV4X/avoKGIwPHGCAAtj9gSdHNsWHPlERoJ7USXXmGcr+WWnM/NWBS10YRRREJrEcqFg1smjOHGozGjqOr91VIV+bJu7T65Y+g3TVDtvZ00Lm5jGHkdB2dLuUjn0WqiuC1c/fyp8dckp4JNwIeubYJkIiVzEw2gNORzZaKZEpD9xmzUdBx9VKhBQEU6vnvwa3nm+Vbf+hGLjtUxvqknE+aIInBDLP8mSUpv5ps9hOZkMIqm4Z2l1gw6iHz4ZKQBjkeqz14tuTgzs+Bt7dWGZCq5nsmdcFuiroDcvpR9A7p4FgUw+DpYnhAd73qdGVdwpTiug+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ry4x/+xGfh2qftWqNR4M5bIKquN5xzZ/oevsJrt3Q8=;
 b=Pwy4iq9ktsM4pasxAQvgdJxQnAW6AhbrHUtEZPYLvc3SivTIq1MiqiAl3rnVp14mzVyO18lqtwY1KjrLuQKskbJG5c735ypcsqN1UPXrR1wi2Wdig6L8txJBNP/3xxB+L6JY2JeureoCmZXgXXP+ufTbzLbcq22OR1Lq09I5UHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:04 +0000
Message-ID: <87ldttbi7v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 096/157] ASoC: codec: wm8990: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:04 +0000
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b7913b-30ba-420b-94bd-08dd5605ef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Y3qy1YzOskbJmYcnnx2Inprmmg5q5yimc4HWrup/wG38/UJcAUqpq3eeuxK?=
 =?us-ascii?Q?wdQdyn9RejZNjmUWru6A3D9Hh1aAfc8OUlmvnbb3birZl0D3fzyZviNkbz0a?=
 =?us-ascii?Q?Di9MTRBOD+ado8tMKQUb2gGpr3v+XbgfnB3TA+0G3OyZ2RjpXdeO4VfnngbJ?=
 =?us-ascii?Q?3cDzFW0TaKPRvQZ6ouTte0XxB80udZr7pZSvr6LZW3xUGCMsnHs41HgOG+fo?=
 =?us-ascii?Q?YpkzX6khNZ2immpuKoOb5Hi5mRYaV7rdYBQ/1Powd67RXpoq2RZUt6f/+fmh?=
 =?us-ascii?Q?viqWZ34Onm60IUJMXiidA/apQtSLHOOT5x7g2fMMiBvcYc7usr3X4SHm/KIL?=
 =?us-ascii?Q?YQTdDWBJclEk4ui2BET+QorrSAOh+sIOTW3EkMgpXCA6vlqC6Qm9LHKX042v?=
 =?us-ascii?Q?HcZnWKZpaHDjMog5ES0JQT7/wSQam5o2jbpO8tRSvw82MeecO38/XaZWQKOs?=
 =?us-ascii?Q?fwaFfKDSQTlekwttB4dIBohunDZFf/0rZQ1eniJ6tDl3P6slUiN+uQuK418T?=
 =?us-ascii?Q?yN2IL9dszz0EUq14/UErxMqO76vlKqN09Dbfl/6KrxMGmLsW86BC7yftdR1M?=
 =?us-ascii?Q?V0gpmdPYpadnFysINg9TJnwuJdGzH5jnG1bMSmYnn5aj1ncDIlFzDmcDdCXv?=
 =?us-ascii?Q?1eWtLW+4v25y+mVKsujWjRdsO2zrSL/87DlGA4TBhShwVWx3xdpTXWph7qLU?=
 =?us-ascii?Q?wwCa9wHMxyO1PJXAa0GAmNeYrgxq/v9TymlVM0ZlK1JaTOR75flHYNj1Dnh7?=
 =?us-ascii?Q?OHhObBTFXfPtpBpox4/d3u/YkUB5FcYFC9uqFAu2HudsGqzgIZliT8Dl7HyK?=
 =?us-ascii?Q?FC1aDm03L2Hh9MkhjLVrcSN2h3Dzj/WBK5FjIt1MkzbFbJBJkB/yZxb46m5U?=
 =?us-ascii?Q?n00JCouhb9jYVMEji8/Ru1e22iSdIwi1eIPZqWSt3zvwmmaSMpYJDouVN+Yb?=
 =?us-ascii?Q?ts2fmW+4cUk1a2PY5dAGnglsOVdir4jdv+2MWWbGn4O/lfLrIDY6jXQVd7Du?=
 =?us-ascii?Q?lcStxBAvwy3iGkUxfYIlsyVP5A4WRfZZU/ifpWXsAXw0C0Kw90x3PZexh4Vm?=
 =?us-ascii?Q?XG15/pTj3rG7JojZvAyVEmM01DweKOq2OKLQqykXOLe8srkIB6khlyFpnEKg?=
 =?us-ascii?Q?lXKb7Ckm8mPqwidVL5K5lQfIgkCXyBKA0wCIjSjiKcN3wd2HMGy6kuyKhWKU?=
 =?us-ascii?Q?AKJAIPHckO3oRKK+FSSnjXSIXMzbGqtCmfGoUzdbzQ6JEh1yr7HINQE1J4pv?=
 =?us-ascii?Q?Oadn/jxXskQnSy0bjxW5iGE/DV5bhaG5+5dWHJN0D3JCQq2AyWMv+QQFyD4D?=
 =?us-ascii?Q?G2caGr4OE6t/XW2iLPmhAq/ZWOG13KzFsnnx6EM6Jq1cdNABh3tZFNYF7vGZ?=
 =?us-ascii?Q?RpNdU5zez0WpVSKHw7T6sjH2pDAXOLrjdRhV48FFteRh3CPNB0/hiMm5ToGm?=
 =?us-ascii?Q?aywCdUE9sr/4QUxi0tmCP0i4hJMJ2pyb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zp56dAZTktr3h/VKSAvkOYLYgC5QZV2fAQN5B+XM7lvo1NlojXP/dPNo+RYH?=
 =?us-ascii?Q?kJHbrrkqEbpArL59+vUYRx8Uo9zm7C5cnH1BF+nFb/bSNwhkwkR9vIBEBDeL?=
 =?us-ascii?Q?MkyI8iZ8QhDsWzNfdxPz/HLdE4zU8D4qhlBdnRkswiFudZjvi2MylIC8o9ea?=
 =?us-ascii?Q?39W628Gu3rIp8j38QCHrKSwJMDqWx0GodiC1L1sgsAJAwTqRtgQxqic+REGp?=
 =?us-ascii?Q?3xPC3QXawswrP0DGr6BLpF+6jm9v0Rsbm79NFGOVsNhIMOjnj4d8GfIOyB8U?=
 =?us-ascii?Q?vDgkXU8OUADXeFXPnH9/DYcg07oRRqBiwHRAewEz3CxvqEj/1e32M3/67HLh?=
 =?us-ascii?Q?xJr233X2htny360yVmLjvLGoAKp5hS0wxpuScDZFyVcOeN7MQvYAuTt6XPUP?=
 =?us-ascii?Q?/SywiNsjoX85C059wctpn/snZwGdAnC4edTQarwP2kdd7OWBQZAy88LtGe3Q?=
 =?us-ascii?Q?tfFRtGGY2pZ6QS1QVdSC/XYiQRl9BUa0fdR2+xG959oUEmjKCQ9bM6gS7+Su?=
 =?us-ascii?Q?dsS7+fONjasz/UZMDM9TPGXlwEPurVqp2ZUSu02NzYVeXtGjXcDz1XZmAJte?=
 =?us-ascii?Q?NUrBSTkH+abjTXa53uEFReIcYYB/5jznUoMlmrTdif2jzo98BVROaeIEfcZm?=
 =?us-ascii?Q?mViIOqs+BoFGtnX13oO789uV8YfQQ9v0vIW6GqD2bkIVzzvZ+QcQUaaJmCv/?=
 =?us-ascii?Q?EPH+lEBRM+qWkOYk7mnSwUAtnBsfM2xuM48UYSOmnUTrp8Ms1TfSzoj6uRUa?=
 =?us-ascii?Q?IZuNWwmXEuRw7W5se1oxYWZF7PXGXbbX2OjKk4Ja2aP8nchLHdevreDWAs4d?=
 =?us-ascii?Q?1kn+0n4Gixms1Q3WHpTKZKRqmHBc9fzeXHjCHRIVoyvBYkVfGUQtrTyRCitp?=
 =?us-ascii?Q?KAyjdT//ufDVo/HzvKP+AGvRJSfelILyZlW6sdEvcFb+rHd4QkGbj1v7nyUQ?=
 =?us-ascii?Q?Vjdn3eZ5K1MY8F98lFRFS2eiNPIs33caeG/38HmFZ0xVEukPNPXSIvf+5G51?=
 =?us-ascii?Q?eGGtJl+VSaxGL2JYLnqXj5XvPfHk5FzVbOhKep5l1RMtzoBv12865p6cdwxn?=
 =?us-ascii?Q?G8/lGZjwB3ae095Iue+lAxrikD+F80J1lc1vLGDtneQtqhD++tgZKOuQEEzA?=
 =?us-ascii?Q?u64d+ub1uX6hLN/3tG1wak6KSJCujlN+hmyThVGAGzYWkH0Fwh+ZVMkNjpmk?=
 =?us-ascii?Q?1URwdZnvaTj5N4DKlbBHIZNbqiew0r6q6PArmCpcZXbuN//jhM2nHwOuuMaQ?=
 =?us-ascii?Q?gVG2OKa3aTI7kYX5Ucjr41Bjv+bsPOcusrW7bmsmaXsIJDAh5M3itHXKpJsv?=
 =?us-ascii?Q?hAJW/+0nxHbWW4Simya9O17TwuFsUgSrQ30RyJ3/ziDqvtP6gjy/wcivfaIB?=
 =?us-ascii?Q?NhUzWu9phHZ33VYRaiJp3AnMTVQXbuKILSIgeV4qgumzwlf6BytPZFpP1Ks7?=
 =?us-ascii?Q?oK5B3sS04aLPhOfKex/BY5FgcvPnbU03YJjOlXIlwS6sz5ayHar2MaN5eJ8m?=
 =?us-ascii?Q?srEh2bYAQ/pLwHf6j8jpcdKCrNXwq2rbuUn9lNonyObRiqroFayw/YR5W6CU?=
 =?us-ascii?Q?OIQRwwkn//MHqBhXyeYHyi1oXwk/9vFIRgohdfeJE58yTDwBr0dMLh+h1Pa/?=
 =?us-ascii?Q?beSD2qQoYQavlQbdENIG8Vc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b7913b-30ba-420b-94bd-08dd5605ef63
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:04.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsdcHCjqnCKfVyrfOBd3HiV5XDdzLB6Crv2u50Z+tLecW0DwMBJvBTbfCs1NMHhrH5w41Ti3I+ninHRf+OMZ9WUXbEMQEk4jknFc+YyemaaD0OBABuPdURe8aaM5Q8kg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8990.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 573bd3d487ba..89df406bf552 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -897,10 +897,10 @@ static int wm8990_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		audio3 &= ~WM8990_AIF_MSTR1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		audio3 |= WM8990_AIF_MSTR1;
 		break;
 	default:
-- 
2.43.0

