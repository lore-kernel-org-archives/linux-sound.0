Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F2416DEB1
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 06:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455237; cv=fail; b=Bhq43wUeYE/QVWGLspbFOMlMwK+oYEl3URGde3TjyqqqRaMxGGk0gteDhttZ475rCqvPA4LlibmGze4o8kZVclJ7WQaL+L/XpkbJX1WR7U2kOgmKbidnyGeKd/cf7E//SDlaKiGHnRQzaImyRCn+J5EoOituv4gUpHSVAbE1H64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455237; c=relaxed/simple;
	bh=CTvjMRRc2gR4tgMFOBM4PcmMCjQezcvu/88lu7PlPFs=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=d9qOrfLP5vWyGlv17GEO4KlGYUHVr/25j4nRPFX34F5nueLOnMAHx/DdgcCpIi50fryptSYIdeNTQBNVPBQz00UjMDRJLpu5L8xWcoIpnQ1G0Y9UCLQJNbYs/8yzU7slX8mY49Aexgr2atZwy3Xg6kHYmb529cmSS2h/iN4Szpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QNO3afhV; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QNO3afhV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXlNp/9LQTdS9XZEw+zHiCwrnBzN5+asZdYuzLMNOGpvTsDUSctSetsvK/FalR5FWdSc4SY9aMbWso/RcI1d276mZHSSnITTWsN4nQGdCDucThhBAFzyU7G+moxg4L+5YEPqTw2QI9UfI2LKwZZZ/F5kL9px9zsqEoXbX2FnFfLvL1L/Mn4bFMPoNFeNY7KTmLdwU5qq78zqsWSA7HT8KjR3Z8ZXToJ5lIz4yRGmpg+VmAR590Ar8ckH4Etgmp4yuTbNlWzlmkhbagV+bhtZi7TN9SKtuzehtuZHEYBcg/lTX+6yA6ZPYKbF8CXk3EcYqHGo3g2k0mdj7vHTs0BsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrPvVscOqZa5PiGYjBiyvjWXUY+0+8EydG+/Ljh31Cw=;
 b=m3BymjAAW8yqsTtsUUxQ3KJM+2RTUcfz7iYwWVwuzD18cDSD6J5m+pLx3LbWHzd46VqddpU30CA8/v3MV+h5OfRtRYXBeKC+j3mY4oIhbyp65ELoIvq5SnF3oqCmBSByyVxe0S3nnI5A8p7J63yngu2zgJtCojIljdP9O+8MQbCx3QQnaIvQ7jLFiv6QfPIOpFNRjRAeQmXxYtEcDq9MRwHGQlV2zF6ENK5Q3aPPUAmit9N9VAPJQO+kRdIC1tnA6QQE3HmJ72LDc9NcZ0S6U6Yd1dPM2TMVsjP6NB49V2dd2kYKMq0DFBHi16goYVuXkEh5msv7bFhalu41EBZOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrPvVscOqZa5PiGYjBiyvjWXUY+0+8EydG+/Ljh31Cw=;
 b=QNO3afhVgipTlDXhgrxFdbxtjUpoj1SxskGLiV03e0tiZ54sGN8So67Yx09YdOZa3ckxemc9gcF8/lh11xjdLBuAej/tl/CrRMlRCuQAWfQGD3RT6GheWbwahAK8JhReU7nKz+Rgjc9ESIrDCtYRXF3XUwfZQ6L/FT1rfJRuR9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB12719.jpnprd01.prod.outlook.com (2603:1096:405:1e9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 06:00:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 06:00:33 +0000
Message-ID: <87cy0ctypr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: soc.h: remove unused card->pmdown_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Apr 2026 06:00:33 +0000
X-ClientProxiedBy: TY4PR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB12719:EE_
X-MS-Office365-Filtering-Correlation-Id: e21ffad4-217a-4946-7647-08de93a1d0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	DuPAssU0hU7Qh86480Y5xYOWvhzXN7TKKYrYLMkP9okR4F6VW9vrMqCyV/1m1vWIHs5HL2G1ZO2VBAKDtOrBRZyLgITkr+CnbgzGGDKF+Qhh1Nj/1AUrQqxl/adlgqYnDEbtJ49OlQACEghzhIFNKmUvINHC8r4RHUyORLp5PfWBHScvImbcpK/TmO0jfQBvaea0n90SKx1g/Z4opN90xjb/mMQwWBTmvZwNSEOYwyDvDJL5FSrWRswj2PqdIgGIHMvtT5sSuzwhAH6W6/IcEtCzf3TZGTZTk3YcbfE4zqLKXEw95/sxy34uddG8Dv+/XXzcGsOu33JjZbCoPtHub5tGvYVE3eTHZAf8aubccRzhbw63aH2FIDKo7ECD14AK8UntuWNaedLSH8rKAxEGy7e/jgwYhC//R2p3tlIDszWiCZHQ5U+K0IACxZk2DrAJx7dZqBbKoR0i0PwPt8ii/n24o7Dn9G1xvvklSSKUtoJGiv+jkI5mpG1SH9wZ50pV5qhul+d9cAj02KnwVr8htTQtp+cHhN1CH5FsE5v0M5IQJvdfNm0AiGDlHkuZkhQksf2W64A9cnFUzge0u9iEsDfh/Ok2iodSVygHR4ipVOXVh5AdREBZrIr00or0IMTUB1AXEYHkZZOBtEn1leo2QDpWPOYjxZYWrL2TAIBDPjHWvkfFin5sKCISjqQbMNZ6OORXhUoajmcLO1UO/s/7u++AObjeU84s0CSWHb265x2W8XP09dNzu6NrxtxU7D/pwC6QJEPscmSjssP9BlY6dEZR57BSFnsdWazz9gKGDI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gh+LgBU8AAzQU/RgZMUiAMCz3lr4jxOEjmvBG/8eI0MsuCqNPFYeM7h89T/k?=
 =?us-ascii?Q?ekk/1Xkodcu+mC8GS6/e/1ott30bnu8Z/kLMplwn5NkYGJz0kk0cWvTGcGBc?=
 =?us-ascii?Q?zuN+qQgt6f7SZ1Xp+Fy5Qos/T/jBY/j5iMGL/vOv7aBORCVj3Fe9Tyb5jZmV?=
 =?us-ascii?Q?oWi86o6V6iOfR8v/BCwkOxqUdQ5gEIwKkad5Tf14thj1ZCbGHJYKfajeWNPe?=
 =?us-ascii?Q?/5rKFODphCV5HMljW4A9Mu/ZWQpWz2coBKU1h3Aa4z/As4/Wx++uR8+nRE95?=
 =?us-ascii?Q?I9S0rKOS1Y4y0omcjPF2dGdpHXhpy8cA/z4PwoxINdEcz9Zyvzu2sDilFXpx?=
 =?us-ascii?Q?sgGy6YEEu4bUFYJLbs/RqZ2Uj//jfpdoYKflkl1hrT63eiLXIPPDqgLuvlDj?=
 =?us-ascii?Q?S872jJthCFGxUU+m6OMj+rKHClBU7SDPQrkdcWNLwC7rPldgePtX2xJXNqT2?=
 =?us-ascii?Q?POQvUTPsfUGgu2zqOfq8DhpVC3J84PYYUu4ukFnd3UU+i7xLHY/8io1R7cGU?=
 =?us-ascii?Q?MJ3Ntk6qx7crZp5hVouqoPZMXeWflpec6CVdorCogN+Dau0zafvdZegEx4Kv?=
 =?us-ascii?Q?Ew9NwixL80TXb44IevvM5jZHfqP4Kj1DSqd2vMxJulghFwgyZUPi7NMTePtS?=
 =?us-ascii?Q?BC94iBdxJL+hrn+UYKWBi9QTVZL0EQYrS4OeVxMUzdHOBnEXEjJqQsk5Jj89?=
 =?us-ascii?Q?Fdp1JiWlUVg8AAA2hYEsDuMYc5NpYfcvdZ0YRuCIAz91PqzV5kIqqF2rqfu8?=
 =?us-ascii?Q?2kp9eGEo7/S3H+cLluq9NZZyNqHinnv9rnTXvSCOLpK3L+0aV87AEQ5P3a3V?=
 =?us-ascii?Q?rGsz9mRbh5AIczPhiVS3fWPQ8B16o8F3sDN+rWMTVUkdH5wKRe6I8MxtDSMK?=
 =?us-ascii?Q?ltk7bII5FF6Zb0ZgQNu4AGzkJALPOIq30iPIC9SFw+x7w17nAyPjT2u7y2wQ?=
 =?us-ascii?Q?IFqgo1llTj8ZIPYwEto14eCWhBupAPWy7WdevBo9LJV+bqQArpFl0FByrSDE?=
 =?us-ascii?Q?WxNRKfK5BxRfOUiiYHuYt2PUYBPDUrdyC1V8sgKaYrtEPJjvu/AA5zaZfkGS?=
 =?us-ascii?Q?X7ezYuCyLss/AXoJhAwKztjiAG7T1IGM21Bj/Eg7o5N6Vto9KLVZoeqXbjhi?=
 =?us-ascii?Q?fOcZZwUxOURBVTbLZxu63NB5AQx8yqLB6o2BErzHyXj7S+nqQbUCk79hGhWz?=
 =?us-ascii?Q?O34tKlvszr/NFN/16jbZuklIZYKA0Dxy6iRfHTR5qH0Ba6Q9+GhLUuEIiIE+?=
 =?us-ascii?Q?g+xPUAFjsXzuXEt0ckqhUhFqGwUU2i7ID3724sZuGG3X54dtx+S741bgUFHE?=
 =?us-ascii?Q?qYmgDIiH9Zy+3Ig6UFm34I68/d4a/28SIJMhFon3XrP+NEprKCOZHVzKs80e?=
 =?us-ascii?Q?3qr4BFi9rqRw5j57JdFg3+laGwVfyT+U+KcV39hgN2LljmK+PufCw+eUwL1e?=
 =?us-ascii?Q?m9GXE0k3tbwtO1GDmLVBtQu/am9Zg7NIKsyfp1M4cwJwHDtzJf0GeES6xfOJ?=
 =?us-ascii?Q?xg4+r48S3aatnO0uu6+tVCRpJsNO3MvHJpUzpcSckDh4eLtCz5OAae1qrzTO?=
 =?us-ascii?Q?tbP9MXJp0+qKCrXvRDx4jhNN7MihuRIqB2F1y9csiefxsfFRwqPOLkq1aj9t?=
 =?us-ascii?Q?hUSe2Lq/VPTl2GYOTr4n3WTXMnqcHcVysM5KX22CjALUVxnuS0t0cekHQ1m7?=
 =?us-ascii?Q?lSpC8UezXhntJi4F5UWagVDwsJuuoobmW0jxe6wVjpuLeponHpqjpnn2VxkG?=
 =?us-ascii?Q?V4PbyJ1H3tACGMhyBVUUKPXliwrkPI+AU06CbduKkU5fyVyzGAFv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21ffad4-217a-4946-7647-08de93a1d0a5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:00:33.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QAj32GsIj6Y+cRc0y/MtxQtdhoi1uyL0Ar/U9/D1Cj86scc1X7BhTDsA4raDJjQbDjWvcRCpe1wjbSQv5Uge2Zyi4/tNwmfjyByArc5Q8OVqYD1lF6uwNMtch4tUFqO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12719

commit f0fba2ad1b6b ("ASoC: multi-component - ASoC Multi-Component
Support") has replaced "card->pmdown_time" to "rtd->pmdown_time".
card->pmdown_time has been not used this 15 years. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f70edd9c23b27..5e3eb617d8323 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1027,8 +1027,6 @@ struct snd_soc_card {
 	void (*remove_dai_link)(struct snd_soc_card *,
 			    struct snd_soc_dai_link *link);
 
-	long pmdown_time;
-
 	/* CPU <--> Codec DAI links  */
 	struct snd_soc_dai_link *dai_link;  /* predefined links only */
 	int num_links;  /* predefined links only */
-- 
2.43.0

