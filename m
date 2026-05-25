Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BCD23E325;
	Mon, 25 May 2026 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702574; cv=fail; b=Js9TSPHCT7JRDMBSsFDYv8kJvXzI++SB3usmc3k5j3sQibGoxfpO+SpEIs7COTY5BIlsp7oUgsyzcYRRg+TlTHiSzE45dq+2g14IkC7WVmLbZIgPtuCHdW5IoHzjFEqbfgvpU11lyJTcZpTI3LOzm1I4wemMhVaPvXj7Rh3dzVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702574; c=relaxed/simple;
	bh=9ruzOVvXkSFXdVAeRcnh0F9HmEW908gow3hfODe/AHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pa0EIbuF7AP1kR+v23w7uI3H3JnJ8FDon+T4C+PYx+AeytKkKhN9RFopRotnyl+SsfUTyGLrSrn2/g/tIdUjd7/EJuAl8A8SQFW8h9pT7WXr5KsabxCLipMdkJnRK+6rw2FQF7E8w9tLQy+ilPo97GbTI9KoMszsULnkkgLQzG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h99jxpJt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=btvBMSTA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h99jxpJt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="btvBMSTA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P4twhk472627;
	Mon, 25 May 2026 04:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wrm9q4ZyzcgApHuqH5UBekXcYOCdlVUPaYGVW4lq+fo=; b=
	h99jxpJtyhaoOM5wLOiYCC6b5JYOc6bYRh5d74B47N4gY9qs1pLpKk/4UiTTvaJy
	3NTmhY+Vnvbx3w1jo23yNDRBNdHp5/jswPjDEwLqnG2icJ8+fnCn7p1IKJrav3F4
	k8jQ8ZAsymXLz4ojVeSJgoe+vseg6ZfrmAyV6m4WbbdLSIg8w7cASdYYlz0uAbXP
	IMb8JyJ5Y7VkE0he5VywO/hCV8wlhtGDclj43aFLcOH3xTR2nh7QeepTP/5OQOoZ
	ym0KUXOGS2UJYHyylcRN0TG1QaVbIsAVcRTfO3YHoqvytf9Utb/JbafOKGswxQ9t
	7vri0Wnwd1PjYT7T8sKidw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022118.outbound.protection.outlook.com [52.101.53.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4eb8ng1wya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 04:49:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLwyhETi73dsRvbwMaK6/cKB7ifVFGhYTv5RJbvzZyojpRnMq8lQcb1MYLxpzRPHAfuFDf2/P/79zNpDNvV8Rhe4QCwmq2AU9MRstVQdaAU8hqC/eCBHTiJWmA1WBGllxK9QMjE4W58wW0bF8ogf3qKcRku7QTY677U6/qWT2oh7UDdIpa89OKYOFazMJGC6RgXgpJ0z3Gp1gsMu3eiNt/wqgJVFDkT8QOoiJCKfzQLU1kZmZsra5zhk+9scwjDJtE1IJWmSTMduQpJkROcpwoup4wXjHc+JWH9nn268pur3QvlGH98Sh5vygytR29AhGI4T/IE+L6Vln90luHB8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrm9q4ZyzcgApHuqH5UBekXcYOCdlVUPaYGVW4lq+fo=;
 b=eKwlYg7FBCyYqzvEZAXU5I2errR+2dE3ERQB40Q3nZwA3cVwR8fJONbO1qvUQe9io9Xnjpl3BPg+SRrgMe2hRWWgWDUodoDW+VW9oyFPX0zTQOcCW5PUX51pTEE+SuByR6Tk+3M/C+DjH23MtFgoZCHaWlx8HSB4bgbupFGxcnr96uZzjOvqHHmey5iwsKshi1Mzxv8jucFL98BO+oqh9krE0VLqhAfxxwXlkZZbeSNBkrj40Uw8W28777bdsUssdIPO9UmYpsib4mDv9O9Ro11IJwbyzEv8+PVD6dDDUW7JPBcx0Ulo9At83WrmbBi3Mjf2/ZNrgmaTpeUL3L6C4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrm9q4ZyzcgApHuqH5UBekXcYOCdlVUPaYGVW4lq+fo=;
 b=btvBMSTAdIwVumIVrQo6a4i+EhOVZRBXyECtLDSZmhbbOFTK99JVlDODhG82Jyt103YCXI5WF7rDSb9xiKJkMFL0A8T/vZeTNE7fWSXdxsZjqqZVKlTeiJqMTnW/BlCmC3J2Gv6yfRcKUBvpKeZi5eu0Fg83x3+NG0mjPkTOKao=
Received: from SN7PR04CA0164.namprd04.prod.outlook.com (2603:10b6:806:125::19)
 by CH8PR19MB9167.namprd19.prod.outlook.com (2603:10b6:610:2b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:49:06 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::6a) by SN7PR04CA0164.outlook.office365.com
 (2603:10b6:806:125::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Mon, 25
 May 2026 09:49:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Mon, 25 May 2026 09:49:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CAB4C406544;
	Mon, 25 May 2026 09:49:03 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B91E4820244;
	Mon, 25 May 2026 09:49:03 +0000 (UTC)
Message-ID: <c0252afa-ad78-4e36-9a7d-8a8afb04e1d8@opensource.cirrus.com>
Date: Mon, 25 May 2026 10:49:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56-shared-test: Fix possible null pointer
 dereference
To: Ethan Tidmore <ethantidmore06@gmail.com>, Mark Brown
 <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523211522.522616-1-ethantidmore06@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260523211522.522616-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CH8PR19MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d652cb-132f-45f3-533b-08deba42dbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|16102099003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	W0coJFHuHt43/F2D+2gZs9o8LoRlpAtVqYCSap49DCQqFDSclqb7oHQ5kN44eG7CAfZQHGDGA7KoyMieP7NBZ1RnO7oE036F7k1YonADLzr8R9v6P/Gxgv+O1w5B7r6Hv1ZQML18y+OboFctHUtGAY/S2xH7P/rTEKWwlCNKW1k1ZldoHfZ+YmU/aK4VZg1wcztBjXBci3qQvDCqjzyiXCYjm6mPvkG/3rQYNIOeAzc2W9dBraKsucfpy9lMqsRt21k3xEJxNht4QZjsBG1pySEsC7scCKophYpqx8GzR7+GHYQGknImtxb0Bgf5QQ1Xu8SL7GKkhmOOnV8Bqv3fiCupIQo4gCRLeWQAYz0N9H+kmlaTNTp6ngwP4n9FeeuzoQ+BaYwWd5IGkxE6JgH1JsmqwgCDIK4XjRg7rkKfvjJVu/i26OAV+aX08bMDyWq/bTC5RBRUn57eKgO8/HZIkv1+JqO97Mt7D1UxLPVs68LQ4p1O2Xdbr7/RTkhXqkKyRTJpWajX4dHapY2FYKqgvkJTKEgz17H7cFyXaT4/8jA2fF3UY3eIrklENC6u5/350cJN9bjGQ6MU9t24Sc2Euz6DD5m1x/EV9JCUOs2wSaAQ/5isGfEEqdGSZ4T4E1fzFo8bden1gbqH+3ms5oRzJ94rhpHmc1a5hMxEuZnUJ8Tq3nrNc7LfRBCG+Ydnj+oZLQtE4DCp4EGhi+meA16yhWhobakMd16IfCS8gn+LTNw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(16102099003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1qTj3DK/LL9XHJQ3TtkyNc4iFz8WORhvbWu/vGV50QntmDbtSNiH0uwsMZ7wWYze4HMVrjST2hD1f4NlBR4rMsNiPrJBBr1ibLIFj5Nqqolfzlb2BMeqs2j4geKsquk9xXpg2kDgo8wM4AaF5pt6Mz3b6Nd8KmzEf1qyur64OuA7u/RPzKbh237I5cuwAKAo9RzuSspUopN6Gf4Eq4WzI0VccKkQCW448aLasrZFZgiPfixqYePtC8D/gVrtIXskJQmyTRrSxH9l02vdZ2IttsHFoFfPGZI0F4jAw/K0keYwWvo9ZQ1Sn/Em2fXrGCalgtLoghVg13vaTQN+DV8gLD8pZkyerX5WdoDlu+0M41Wqj0tnzllGxOAnfIimITnUdHG9FUx5iIFIQcVuMW4hLu+vVlTh6tOEOU7owfGESj1L0woK2jT3mKcKqjFslO/z
X-Exchange-RoutingPolicyChecked:
	Ie8NYfiiHOzfcn+5LzjCmvS4PUWI5XHXM82p13nFSmZJtwOPbXFQzSNLFBtfllOvm2V0vm20ZXy+KZlPhQ5HaniR2B4MNMY9pqZf/pkhRIuu8FOFK38bkotoEyHEscTiI7R5OEIYmK4V7mSSUYd7eH+L99AuBnkNiOP6QWdto6KRQF0yrz+ZxTNUugmhMgA0dKVlTNT0/B5ugBRj0LJwAkDAMvAXW90clKaY/EtBnOZm04p/1Ircb9ijqapep7Hj9qgCsuVZrOIkbocObWJYQlI6e/rcirGyO1Yj/Dz8KODQ4XPK29xu3CjsapZIllLJpQPS8jZYdRKfElrnLANDQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:49:04.9775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d652cb-132f-45f3-533b-08deba42dbdd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9167
X-Proofpoint-ORIG-GUID: 5nNEo-f1S9YhIniaLCMH8iKN_SpK5aju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMCBTYWx0ZWRfX+TN6qUJviBdK
 ZCslljhtQcEk7Kv7GhMt1hjEEZje/fzFVXM+4cQMHb4ZdMR1ytC6UBSjFV1YhWjl7ymZyxi86RG
 2cfXM0zIKqfcrDSwfLoCQFhGxDyXOWgS2J4hib5zM0+E9GcvAryeZDq8rkEaYDSaNFVqLeIZZY+
 44/OYjl8WR7av2FpLo1PXypd/O4Rm7n3CXL3nBPYpAIxbX5Ag2Yy4xYasKxGfd0sY3gmlit5a72
 oxXO70o4QEhxzMpYN0lcqTWAdTzEcp7jKJ30VFFgrtjx2kXT61ROwCDpGP90mpLYc8zqTccLPel
 DiCO6DhXpz+ErDOxYG83O1rFZQFHVpSgrmMuGJP3x7wkJXpbAQR0ydEGQwxU2NtxTpst87PaAh0
 BV6nCkXmJW+QFhAcliQAUWYimfWJ0zoqr2jGAFNr3n6PN5DB8dAmuQENmUqY5f1hket1zBQc7zo
 4q4so4pDTOANUNqlj6w==
X-Proofpoint-GUID: 5nNEo-f1S9YhIniaLCMH8iKN_SpK5aju
X-Authority-Analysis: v=2.4 cv=V9pNF+ni c=1 sm=1 tr=0 ts=6a141b16 cx=c_pps
 a=dEWqTTejV84EJJvpR54jlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=XFGjUVncJBaRm8JB0ccA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 23/05/2026 10:15 pm, Ethan Tidmore wrote:
> The struct regmap_config is dereferenced before its check. Also, after
> it is checked priv->reg_offset is assigned to regmap_config->reg_base,
> making the removed line redundant.
> 
> Detected by Smatch:
> sound/soc/codecs/cs35l56-shared-test.c:681 cs35l56_shared_test_case_base_init()
> warn: variable dereferenced before check 'regmap_config' (see line 665)
> 
> Fixes: a6f7c21accb5f ("ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap")

If you apply this change on top of commit a6f7c21accb5f it would break
the test because it removes the line instead of moving it to a different
place.

Something weird has happened here. I already fixed this in V4 of the
patch series. It turns out that V3 was already merged, but I didn't
receive a merge notificiation. V4 has then been merged on top so Mark's
for-7.2 and for-next contain the combination of V3 and V4 but this
fix commit doesn't make sense for either version, only the final
composite result.

Mark:
There isn't actually a bug here. regmap_config is always a valid
pointer in the current code. The later NULL check is currently
redundant.

I suggest (to avoid the confusion of which Fixes: SHA it
should reference) this is just added to for-next as a cleanup (not a
Fixes), since there's no bug.

> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>   sound/soc/codecs/cs35l56-shared-test.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
> index 5b2b915559a9..4f52c8a192e5 100644
> --- a/sound/soc/codecs/cs35l56-shared-test.c
> +++ b/sound/soc/codecs/cs35l56-shared-test.c
> @@ -662,7 +662,6 @@ static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 re
>   
>   	test->priv = priv;
>   	priv->test = test;
> -	priv->reg_offset = regmap_config->reg_base;
>   
>   	/* Create dummy amp driver dev */
>   	priv->amp_dev = faux_device_create("cs35l56_shared_test_drv", NULL, NULL);

