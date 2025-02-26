Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8318DB25
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533538; cv=fail; b=klUTqLlFZJiidFObWt5ONOKQfOXadnXRFwy34fFtJJ5vbSBrJlNSNBLQQioKvxQi2fEVSV7idRGcxYITsRdSRsMlzqmVDWRczPMdwqd6PNw0INdlhuLlxCAa6Q2hmg+38MBLaD4j/6qe00K0djM5j6KRMFYTveU3RivA1KbvZts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533538; c=relaxed/simple;
	bh=fc8smPaqH8fkHr6g8DxPwz/6SkBk343NYxFuAWmZIjY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Zm7Dak8qMwOqxF4y8ThfQe9QdiV/hNd6qxaKpy+iaiDzQNi/3GdH3QDmnCs7ue0a7ludqn1WtPLg1E0ZAsK7L+l6DDsRWw5xn7Vvz66agq+dBAFcfsn7eF40+jXSq6qEBlJUqbSO/ENJkKbB6SqA4BvYK31AdihpxctwMGwbgcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SEkUfRUP; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SEkUfRUP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcgSMwYmdQND7hogpGPMjYc7XLlKWP3GAUBvC8HXOZggr+3Txaw4kBqT+y0cfRi+gN8k4GW5PaJlMirAg/0App+T5yhjKoZmZ2wghIlafK5Nyih3tbnnOMwl7etFZHvTXzjpG/N606v0AIHjsNNKIErXLCIQw2q8jnep62kxgNWwO0sOi7orgw2ogYqxZmssbn3yQB3QrUpLCPfXXpIiTCUheHnzIcMj0mewKjDsuZGCzx+uDUsOKDqMdGFr7VEQm0hTR8vUKb7DOLJGTNhIza3l+aGXUgwL3gQ+vlnxToEIe8+RKW0+oULb1uWST/cGsnUwxET1kKPBERox+qd+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVOoxTSEtJa+kURk0gO4SWhWL3VPYuMp9tdJWVuU7VM=;
 b=eEVpg881foMlcYtrSndvd4sHIGS8YP6nEvwUJPaSylCFCCtUyPreR1ypC34wu+omrnezC3SA5tfCzzREf1AMOzJ2VaZZLA16AqMXXZHEDH2DQATImljHKXBZQL1+KRLvvXkkh0k9P8KBYG4ggOY+NsShUmBn6EgMXIc18hwSfuXCKzUqFEWaNuRzCxXdV8OLj00qc67iUbxNSrUJaQOKRt/T4rmA2qfoYvRmnNA4i3G+LQlf5Wv3rl0j+i2bJyDOYpFmMHzjuT9VHGVm2fdWppBjYWRrysQDZr9/zEkhMCoW3ut3EZ4b9BDrn1a4ybptawb86aOg7GzrBT6arnC/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVOoxTSEtJa+kURk0gO4SWhWL3VPYuMp9tdJWVuU7VM=;
 b=SEkUfRUPMJtCSImPlsQar3FeuKktIJZAxwdr5mk9dPc47bqMsr7pq3YubTYJ5QO/AuiqSbF+sbIeTk+dDDUTX7iLDrkLx3TeaRib/da66xV7SskJ6PlF4EHuBVgIyWXC89a73641a7nCN2ED+z5yT9TDrUOg9Hfl50oYiiuiH/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:12 +0000
Message-ID: <874j0hfq3n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 033/157] ASoC: codec: da7218: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:12 +0000
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 2140c185-2d04-426b-affd-08dd560564f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S8pB1GRTonjaib4zimsQ52oLshQ9Ik56+URoc7J+8m2x0nka6aIx2MRM357l?=
 =?us-ascii?Q?UyN98+NgQPsSUbQzqsqfw54H2+ZMSHumIHyyT4NJJzoABVw4+BgtWmuTlOqF?=
 =?us-ascii?Q?95LeLQ7K51npjmpWVhUgRDj3YrqZjKI0ittLHdHZi5ulJj1KD7j4of3QbAlC?=
 =?us-ascii?Q?Xs6ITqKQbWZJTHfLZ3yEjMsbgy5j6SwLCIwB393MrUF+Z/Bij6vE6hIlOT7u?=
 =?us-ascii?Q?v+AQSUAXNQsZy+TYRbS9v7IDcu6PvJbkpbirPQubEJpgn/LVAPkcJILPeo4b?=
 =?us-ascii?Q?HsrajXalbBEEyM2KuzclAMUcfwGYLQEuQuExaTklDwxToW9Il9XrnIXUayqh?=
 =?us-ascii?Q?FfqftMYsCQ0RXVK5J77htS6TfUizuB/npl8rqhEhfFQrmaQydLd7NXndkzxg?=
 =?us-ascii?Q?gkOP/YXx98F60/ibVRbOSigVNHoTO9vPDCBvx4xNDRQrKOXueeu0RL413Elg?=
 =?us-ascii?Q?5Tftn2jHap4TGoyifx0QP7hd2ylxqoaGGN3KniUEV3p+j8CnG4sPM5Jzw7Fo?=
 =?us-ascii?Q?SJCHPl9bcE6VNo4D3YBE2cA2s+1kGGbVAsi3/ckbeyRRLWFLzxAPQJFJkSGg?=
 =?us-ascii?Q?aQsU0RI06LakFqLZ/ai4alNxGQHM4Tu9HcHxzFeX69C/biuBET2tC4e3HfTh?=
 =?us-ascii?Q?6ouFvjv/KKVZsubDMROWMMRoVR744gg5lOcQ7SqnWZF2aqs0p4pGxGCF23A0?=
 =?us-ascii?Q?GUGpR5LDOE+3q7Ti21bGWR5rAcocp1yA/HOXrodYjWw/XA/mgQ5WwFOETkmk?=
 =?us-ascii?Q?oSYdZ0NjFf1zNccCKlYU6vWItCK7g0+7E9QgiyxFDTtMMMf+joKslgbpvsXg?=
 =?us-ascii?Q?sKNg8LsxI2FzpJdYOF7Rw/jZrGhkaqg1HxyW1lkPpT47Vcp7JeAXeFLh/K9S?=
 =?us-ascii?Q?5rWL3SqkWULyI9eJyrOIr8EVKGvy1JwgAFeW4+nGK+R4bHh7SnRGrEdMEp07?=
 =?us-ascii?Q?xLRCZ77WIx1QtgewgLksiQDJBjS4ng4GRLG5KEZ+sg1eTqQKVAMlrL2J4TYE?=
 =?us-ascii?Q?iR0IXBoRvCH/BNQeVISl1W3maJs9p8pktffM42apO8iDpnRs6gt/blDcWgkX?=
 =?us-ascii?Q?IbkpHxK6+1pug65uUpOkRg2hBAPUnWR7DdNhWr3n7+/ecFBHHL0mYwAn0IZE?=
 =?us-ascii?Q?2yIVd48DRiizYbpd1BKq1PdQ1KX1I802IlDQmrzhmYrhQfNbhKvqihrSl+XB?=
 =?us-ascii?Q?3sQsbyKbi6VNhk3bm3fk18l2sq4z8UeKP/Hfwlr/tZwPCc1c75ybd6qrLshE?=
 =?us-ascii?Q?+1TBcavupiWfpyoXZxwZZYU8jzRBOCD6oylRdQCS/hPffBiY5hUe7JszqZHy?=
 =?us-ascii?Q?dGgEUHfWJevMnzjxm/yMaPAotTlzDnXoiwSv3BF3ugw6U++2nOBaYFGXLW3A?=
 =?us-ascii?Q?8PtN6if9+OriuYdghcl08LMNHkOwNO4CYC/V1JNJHMTkhs+pNzFwxrPmuyo1?=
 =?us-ascii?Q?4oXfNXmyg1Gom5GqGp7b297zQL+T1Oup?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PfQpP7/bQF0qQCRXh9zSyxk8QxeK93OMKtPaLrtdjcM5oxe1CAvkLhob+2i/?=
 =?us-ascii?Q?0Vlf0Rh4khwsGiJ1ftZQ8xRH5mfhn+lqhu5lZw2L23+1GXSGyFIA4qPeK3jA?=
 =?us-ascii?Q?Oq1CnbP6nXlMxboALBglh6KYWmUOIoLrbz7JAzBJFNF9hrk+vxJcwi0aDzw9?=
 =?us-ascii?Q?zLrwwxZny/3RRuDD0x8ur///T+cwOYETuzj9EIeZ13Fneo33Yzao5Q5nEmni?=
 =?us-ascii?Q?cz+QtioPcKJtQnN0S6zpxVN+/g4S4kgb6AV8tOyC2ECl14Rk88DadfbAHBHk?=
 =?us-ascii?Q?VhakmH67zJcCX90s8yKPJZCNl+x02+FvPQ6G0rBsGpZN3NH1e2Rph6ddtxDd?=
 =?us-ascii?Q?Ttv9Ua/UzZ+tkRBrDfqwcEPUUXDnuM2X7Slsxl0p2n8qBhbD+8iBVjZhhN5F?=
 =?us-ascii?Q?NF2y7tWW9j9pWCzGLhV12EyCiErK1dhsxZRtWoIm0D97QKazTRn+7Hl98Sn3?=
 =?us-ascii?Q?mABqxSuKJCX07ctVrtX6umyBXxpCxaVCJxM7phdfKpeG0eMfzwd2iQ0siQ97?=
 =?us-ascii?Q?bY7wBZFpMVC8CrZ0WQOeKD7Nw6FCETCc0WwJ47tocQiPjo+B7SHUapAvv/2Q?=
 =?us-ascii?Q?aYbitRwk1dFq5j0MlVvr1VYJPRw9ySORPom19KvpjAZbznOfYm5uoJYTlP4E?=
 =?us-ascii?Q?DVfWMrHxk3BgCDXhUkM/J+Rk7Sue4/OTQutvZJf0b3+hYKdLg4GGMfjfr4Qf?=
 =?us-ascii?Q?4/kOV2h1aBiQntsA7IM4jvuPW8n8AQsPHvwbyjgoJt5vSMysDU5ns/Iynueg?=
 =?us-ascii?Q?ZWgdl9E9DpRGT8/B7y7DA2Wt2fbQGQq+WLxEBCeetyIeaPzJoxrIbsJLbUTf?=
 =?us-ascii?Q?kZcq5zPBpQhZmN7ksFmr2ATAYImJG7izJe/X/GKQ8Da/bRH8iq+U30kgFbWH?=
 =?us-ascii?Q?J8flbEmzQKCPpBzg7mTh5M+2Lv3ahNIlTFB1vxgptp3icsqSrwt4+LDDUNTg?=
 =?us-ascii?Q?QvC6fDSjLM4isx2iTVks4JtBxaC794nqG7rsZ9WTODBZUIsFOIhxxAKjguIU?=
 =?us-ascii?Q?xcEYdNNUQsPtX5tnQrKp7wENO9oWIQXYbNZO1Mk7mGbGZQqkA9orZ5B0+6Gy?=
 =?us-ascii?Q?oOsi7jN18n7c0j95GOsPzrcLiYuDDVJh1dMP0krYAWsxvjQki8iJR35vNGly?=
 =?us-ascii?Q?DJZU1U7hBXDaNWetk65MM7kN3VB0TgtgPUgoTPLtI43X2ECnwOefI0S9AVOi?=
 =?us-ascii?Q?lZhGqKpLl+wzjLWSh6Ysv9rdhLDk2zXYSaSJ+uOfF3UE2PW4fYzuW/YW+kGw?=
 =?us-ascii?Q?DFQu578mWS66AqzWQ0BzqTwxUvrl3HZ2+1h34GBaGuP7tX8kxLqcozG7dkin?=
 =?us-ascii?Q?1eRD66yA7XimGvYJplBzAFVBpOGePl3vrPfP3d4QwaBWR3LnNeK6xcv6jI1W?=
 =?us-ascii?Q?k7qLje51RQfADuX4yBMX6a0Q7LM8ABhIsyUxW/jegkyA5caL4bOGCCthzjcX?=
 =?us-ascii?Q?xo0ZsXsUYE3RpINP1vQJgvMb/avpvZ4zPhQaw4h9WzNJrTIpjpHGNeS2srbr?=
 =?us-ascii?Q?AVKf28o8FaC3kUxuNr53Swpp7cadQ0WjElF6YULc3FA9suzhTFVJMqTV9Iv9?=
 =?us-ascii?Q?3W2uzccTKZhaiHXYrHj8xThVGmQavffLJu1rj02f8Yh+bzVYosaSQc3z769o?=
 =?us-ascii?Q?jKRu4EMEqoxvRud6gPYFE+0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2140c185-2d04-426b-affd-08dd560564f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:12.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWY8yNNE/LvhFFyp4d2QXl6CTAjGVNhsZ/hr8jqD8ZN4VNxwBMbyctJCIBpnL5vat68IxhYHIL8m5yeNbtMUBGVmPP2nFH1xwPMStnVlQqrp5Ksd7GlF60ToA333CC2j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7218.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 8aacd7350798..5f2f67e3bd29 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -1935,10 +1935,10 @@ static int da7218_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u8 dai_clk_mode = 0, dai_ctrl = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		da7218->master = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		da7218->master = false;
 		break;
 	default:
-- 
2.43.0

