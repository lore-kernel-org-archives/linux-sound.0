Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0934EEE2
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 23:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755175; cv=fail; b=Hf3NrBE7PWI5oJQQi6kZLSJPDTUgCmFm+5GQ1NU/hiGI1O4YacGoqF451QOmZghJYIOncxUXo+kDvQkHFNP5VQFzY0qSiT651Rdh+hm5mNcySboIT4f7piBYCna6rLfXkOT2cR0bhvGZzddIOX2L8wswX0oCksqMi5Brm+8MXEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755175; c=relaxed/simple;
	bh=6JhBESKvd7NWWvdXmQ7zr6zD63p5dXAYkvhMvWuFP4c=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tcDjY735xLOHdVE2czajW4V1aXBGUT8EYQtI3+wrttZ2axGZQA5qth2VeR5HyhriaKeuSREBKsjf7xlzbU46Qj9MXxv/jDkROa4Yuj4mcsERBrgVhYYSOaJOZMBxA20CTWdB9wfcb+y9lrpVJc3Gs/WNf4NOepWMG7GlWJ6DI2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O+zRpPmR; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O+zRpPmR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtZcKQo+/rsWcLtyuDMh3r4SMDyv+AR4EwCuowbkvNhBa16o4isy1zl2mjaVsCsaCLTb+ljYSi7ZR5ibi5tymsp9uoF0JiSPZhBW2wwH+dRqP87AN7W6EgCCjmeJCni7GS5vwNOwHlP3mGQDZezuoI1TIwYPIdxjCZAUcvo/Zxv0p2ROWPyJs2XYQ9aD81ezkFr+wIgyz9YbsH7ZKkkAIRTUVdFgXunf2y7btYkHxuIHTt9cvTxXnG7J39n39kRU6VgVEynUpcC4kC2D6YkMDCmIRU/E11dA6kz85RzZD0E569wpPXwF3JWyFMRNmLVxZokPY+N4DNrwNkA84Gcv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVscoxlGVrlg6zl8plBFMBruf35zDN8ZtP5zWVqWYWk=;
 b=N1FKHPAsGIi8B4Kw48JO8e6BKKH4c1nwP+PRmjNGnBij3FsF5x5UvLqCGJkLDXoqCJG/jpQHd0HCUbSmnNQfNsMeOLtoF5vLiSqgNME2KF0Wt7EkuZF6J6Dg6DcXIuXmuPun8F5su4inEOnLMNJ2mENy3viurMu6JsrFABMjeIsVQ3lNqdE2DiRYgaMv4BDZAbJjFS3ompxd29f/rWIkeslY7Q1JKVk31JlHF9V2eLEydZPJtFwc8b1w16U9XUqg18KbjgEPIXRRZUegpkHeaI/mrY65vhtiw7TiuYgfLKgvCF08nQQzj3La1aIDKVKMz2/05GCvyWwWu6+keeZS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVscoxlGVrlg6zl8plBFMBruf35zDN8ZtP5zWVqWYWk=;
 b=O+zRpPmRysBaAtgB/lVN9rT+OhIJX8Cvyn7eSMkJ0ZwkfkserFCQiwWuOW2LosWT2vkpsEHQ0MivbKxt4vjUEA4YOMBvXn7Q7hS6IznFJ6cse5mVSrJwWpWO4HMZ4/tTdf3SohPtiXfwPRaSj3MRbpBtNt4GVJeHljU4QiuP4jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB11144.jpnprd01.prod.outlook.com (2603:1096:400:3f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Thu, 5 Mar
 2026 23:59:29 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 23:59:29 +0000
Message-ID: <871phxu8tb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: don't use dev_{set/get}_drvdata() on DAI
In-Reply-To: <aamGgjYd4ySf/4fW@opensource.cirrus.com>
References: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
	<aamBtfjzkM7onEfp@opensource.cirrus.com>
	<aamGgjYd4ySf/4fW@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Mar 2026 23:59:28 +0000
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB11144:EE_
X-MS-Office365-Filtering-Correlation-Id: 960251d2-2e90-4031-2b6d-08de7b133cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	EqwgIlyazF048vc/uc8e8WqJoijU3fFDM1bDc2IWmC+dN19Ulkd43xH6wXJyVMC2ueeMeSAVIKIumaFY9RIKQTFU1WLTd0CHe5WvhxJTbp56sKOUvrqWfNuFGwh0tAxMVUrD8PWq4HPQoIyVc67rN54uKY5ttS7HbRXMh/bW/oRIUfAAIK/bJN/lYDYWPLvINs/Q6iwdGqK8gHlAUJslo1CMmi2V5FLBESpP5DkHXhK89P6YDzcWjnlzx4pXC46oiIsU6Os9yuQjjXCSGHhGOIq4KtA4sNSlLbm7MCBhJiNYoezFemUZ64sS5iScbHgzTCYoDGeASl8y2r6QCi3RuG57CYJdAry6bnrMWBioOpXhGAq4B8DJCr+4kMLTH/eRIb/Cn4ihRMMAT/GmQfr2AGVFVjxnA33z0WTs2TW692olUqLSQC0dw/aTwAiS7kAKF7SLSxP18VkcWb2CyLSN1DJuXWMuSPXvqrh+2xF6o2PFUzsOoKYWdE7QfxWTVssIkvdo7EKTO3UR939Ys6YgfRgXd/XL6qJMap2NQ5hpseooz+YgoQI7bi6tJE27H2vnCbb2GX86sjyotqkUuzBTS8OsBymvhpHq1Y5YNiaCgUE5UVd9DW/1d3I+rfdPgRkbo/sVS5LZH7mLJJZ/IAEGuLnTKz6CojfohDufkHHt4/yjB2wRFPW4aFzfLtlTb3CZD3TZWak7XxrSbUi3KD1WXP1jbqwsArTTim1BCWWiVnqPfWoAKQE+h9VUbivrQF+HOgwpGXZcYncPJxBpeAvahKLHrQc20PHVyvGijZgwuLk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lzYHI0ufd8pbX+4QM/g8pf4/gFtLGvHhyHjdDV7CURyYk2iB9IFIAWM6D8sq?=
 =?us-ascii?Q?mw+hctRHZb+34ZOtp9XbZfqn/NHrd5xRLVNiDu6iOGm3UKjDMor3gvtUg0QF?=
 =?us-ascii?Q?QSfCk8doLdecItpVqC40Q3p8MEIG6QpzSWGcWzv9Nfht+GojlCYxnRu2Oj7I?=
 =?us-ascii?Q?D2NiOb1eCOXIrlhWo3wwRJBYQJBEtP6lcmTax/9Mza3KtWX6XEp+6Mt9E2La?=
 =?us-ascii?Q?i1EBtz3lEmzfSLH4LZz1zNkZp2Via8kisRZDymX4Y+rvpT2l/17Fnr1OlK+e?=
 =?us-ascii?Q?S9S7V4P7f5iu8uFfEqBw+m1Ze/J/g23LwwEsKIfiW4I3M0lAEEiuiXkvZz3W?=
 =?us-ascii?Q?nbekvxRkvAWcMDNZ6ibPQyXRkwazKCKwk0LLZYz289E4NV6HDyXX55Nikf14?=
 =?us-ascii?Q?+bpKc+w1J/UUO6my2bjTpkxqSLDYDNnJigW3515bxTcZwphQQj7jC/f5Caro?=
 =?us-ascii?Q?LgiS1npdxV4PKBVLNuxTSQs23Tv0pKRK8Sv5jx3Ra++NlW6tbRGWJqT69b1b?=
 =?us-ascii?Q?Z/GEaG/0h+tAC29AA3KE3PBMgUU2UdgYgAKyAQXA8G1sqgaUs/8oIn+uRKBc?=
 =?us-ascii?Q?OH3QOImSUWCPetAKr9a3zxitenizo2OS62bX3U4Uwv0NX0jKzsTm0CaCQxDZ?=
 =?us-ascii?Q?IFQikZ/BLNomNQkzDPoAd4xCezql7o++t5culHog/gRvlNdaI9kwBaqdyyJe?=
 =?us-ascii?Q?n+gjKAnlCOioY0IXRvsfGvaHete1nA2T/p8zq8SxyIW2oq4eevWwPeQ570HO?=
 =?us-ascii?Q?52uGZghRW5AFiIazdIu0k0R0qTX7FPtjaQzBt7s8a+XdVCn4i97NKve6Cabi?=
 =?us-ascii?Q?SnHEuRBaQcUoh4AVdRr/OEKEb4VlomcyxwqMGIk8i1zdtr/O2bF/g44WadsR?=
 =?us-ascii?Q?7uab+dWRvKNtyAG+lC+kt2HQhGb7EC7H5TVMR4TqVW7TuYmFwBO8exoB6nln?=
 =?us-ascii?Q?sQlhV4UMYGHW+Qv4fr3BMPQ/toHlaHcYtL82DBhVDHQjg3vUGq01qDTbnvpW?=
 =?us-ascii?Q?qi7NPWln6bSU+r3qLwIxAdDBIPIouuzL9JSuwSWdHN/JgwUv9n2o4Uh5xgss?=
 =?us-ascii?Q?IzJ8bDinzWQNHTbFrOhzgr+DwaXcD4D6hEgvSaVv1+aasBoBuDfViyQ4DoFw?=
 =?us-ascii?Q?EBb3A+3MC4BYNG7fUWYNNA16AUlDjaDaQa7a/+Ni24yafKkqamrF1iDQIaGO?=
 =?us-ascii?Q?AqdDADEdospkwMFNCXIiu5Nu1UMv72vKJcb4WBWU1rMJuxf+dV9xq5Q48/P5?=
 =?us-ascii?Q?u3Kd42C3BpHDgenbia71AKLBPAf9E1tHsDwUVR54sQpN2B+zfT7SSFb3E+2o?=
 =?us-ascii?Q?tTerzVsFsWiJ1BgI5tEhTfeQZRZJwkAyTCa2HjCCIj7bkUXjaK3v0zAuVQdO?=
 =?us-ascii?Q?PFRMERubhia32AKysVPTz5RpEDz+1ktGVkzfUEhcvKzjqBDUbZg3JlnUDTDK?=
 =?us-ascii?Q?wm+gUnXR6exGamqRT5WA5o+uJNCy73KwltzYwrKC+KtLMa2d0X9E+pb8TOy4?=
 =?us-ascii?Q?v/ITI88VsNNRKFNDeiQbprKLcc2ajUkHZomhjPeD2l+hTAtRLn3JRdG3grBn?=
 =?us-ascii?Q?t/7sTcBJ3LIeSMs2mBp+/Osm0HyNBsIxb9oFLRlECFLJPNf5Q5vKbSZlC+ey?=
 =?us-ascii?Q?4yWFGiLoI1Dx2lWuxVw8RtSBE8NsQHHC74ixZn4Xk4opaReQWAlnrNoOY/ON?=
 =?us-ascii?Q?vJimJ/cckFGMEk/MoleNYWtflQp8ia0suuhnn6auHlMij8SJHSKz6M/WTlx9?=
 =?us-ascii?Q?JqrssWF3FfTl7lHSaD2NX02ybbVCiU5Ml1TSaywQo8I6Qc0j4jA+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960251d2-2e90-4031-2b6d-08de7b133cdd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:59:28.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7e4kjybBPP56PIWqYQco+VhLkFicj3O+XMsg/ORuLKw1aB7yXbuSwQMQK7hb5Kxz1YfP+qNXEOn2ARR14SCH2Uq4xSZgMvTNtRlkcjOhgBVuOFLHdmXXqX8HT0al92+q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11144


Hi Charles
Cc Mark

Thank you for testing

> Ah ok yeah looking a little further it seems an awful lot of
> machine drivers use snd_soc_dai_get_drvdata but very few use
> snd_soc_dai_set_drvdata, so I think a large amount of the world
> is relying on these two functions accessing the same stuff.

Grr.. indeed...

Actually, I'm thinking this drvdata (= using dev_set_drvdata()) will be
issue in the future.
For example, below code *looks* very normal. It looks set each private
data to each struct. But all are setting private data to same dev.
It is difficult to notice.

	static int probe(struct platform_device *pdev)
	{
		...
		// set priv to pdev->dev;
		dev_set_drvdata(pdev->dev, priv);

		...

		// set component data to component
		for (...)
			snd_soc_component_set_drvdata(component + i, component_data + i);

		// set dai data to dai
		for (...)
			snd_soc_dai_set_drvdata(dai + i, dai_data + i);

	}

And now, we are already using unbalanced set/get...

	dev_set_drvdata(dai->dev, data);
	...
	data = snd_soc_dai_get_drvdata(dai);

I think it would be better to remove
snd_soc_{dai/component}_{set/get}_drvdata() ?
At least we can regain the balance.

	dev_set_drvdata(dai->dev, data);
	...
-	data = snd_soc_dai_get_drvdata(dai);
+	data = dev_get_drvdata(dai->dev);

But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
