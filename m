Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928A3EFFB4;
	Mon,  6 Jul 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327091; cv=fail; b=Cy2SHRfbAPiSgh1K3N51dD7nRnToDH988ci6F/pjRXEu7zERJnHJfh1HjqrpcO+0JeFzY4z/9BsWmD0aeBl0s8k8YkiGey7uuzmBQ5V+Ec2s0qKDSAUt0BwY70Hph9CmOtdu4SEkBfLhYVkmYCukFjZNwn26UQSB2P+gj2GXx74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327091; c=relaxed/simple;
	bh=kT6x3RrHjQiE1aBUzKKy0qsrQqIxFWK3TQzSI5HTYNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YtrcQWBhOvEjEa+dfYs6zYDqd62S0QiVzP9y3x0GwwyVGE5G7yEtHcE4MKI8NO2MOoA3lrMPbq6Zyxu5b+DGMxBtr2Nn3JNyaq6RSSaYvfrr80jL1bke+bDPNvLiP6k5QgTQAE9ITMttT/7A18ukbt+zex6DCD9OE65hXKq85qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pgZiUP/M; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IRjbfXKS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pgZiUP/M";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IRjbfXKS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664tcJH949871;
	Mon, 6 Jul 2026 03:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=W3B3ooPXCR6MnWo9CJ3FSWmGwvcc2bmAwZqEOOGjhFA=; b=
	pgZiUP/M4akEnuqBJm9R1qvMQvXmyqY4ZTUoP3oRTWW8SNkwYb3IQt6h295zqg45
	WOn4KgDAI2uF3ORh6qj7ZrxrTcrZrD8ra5keUqZ3pWIn4p6iUqAGpZaGEm6NPwlU
	+Di2yywmg1iiaDc12kX8jAnV8VXoImIpuhRhqo26E9UKUvG//pPXC0siBDVmSrkX
	8AudJ7QWO9lx+YshD3O/D+kOJ3gD4yfvegGGwxhf1H/o/oiSqDD4txki+ZLnAnnm
	SFc8daKKITGoixRwmT7JQBjyNhtV/Kn7APgJJ9P3Q8IzuilTo00Cd48SzLUXO6jv
	5ysxVnWNrwQdTxPS/LLkMw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021079.outbound.protection.outlook.com [52.101.62.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj29b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 03:37:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk7DZu/+whPTzXMt4wrHpXgdW2WuI4HsAakcFFUo8wmI/ldYLE7JEzhJqhZ8aMd8Xu6tFC+YtX4W9D1b1MXWpo56kgfFXwUDEhyMkm+FQyqTISvLklisdWPoYlBRPYCepdm9PAf6TU/jtzjgrJNpWkfbS6/BcRM8Ept5Dqm9nUhU2ZVclNjEF05cS8G6cS2ljw3TYDcyRsNCWbw81uaL+q3hn6XJGf3O3JREKi+njlwJXN/aVdsCRe/a4Fqg+QCzwf9kk0Ieya+OoUTmsM/TUXN9FKUIOj4qXZKRvljmfczlBskmmORdPkNdkeJ/p9VmrTrddAIW8Mf3NC8lXRC3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3B3ooPXCR6MnWo9CJ3FSWmGwvcc2bmAwZqEOOGjhFA=;
 b=YpcgjmxBQ2Cnje5ZwgTUX8fMuLLhAcHJDcBA1hoXO9uxxESedGg/yknEz/Q1Z318nyjy3VDPYPbTvQHNJawOsuNiAg7FZr2gxKdCzgl/dVbcz52ehXObSRhUgUttiI64KLqyAUT9NbUD9UFgHLS+a8MGZgRAeE+CpDL6CW8ToRHfVVg4EQQNizTnO1ijP7uqaNcvM3O5hbcNPrnY4XN1/u1kgL8N8MIfAZqW8bUAb7llbwbSkGJOAxpx/YjU8+Ba82gUqEwLgTbbB8wSGOx48QgbpTEVy0HXkpYYTXwrIAFMafpMwApm/4mfn7hDdE8JYxBxurhnhCfBTj3TPlO6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3B3ooPXCR6MnWo9CJ3FSWmGwvcc2bmAwZqEOOGjhFA=;
 b=IRjbfXKSKuhfRl0oe8vu4hq3MqdwiRPrS9Ar4Pi/YgzdjShDcqq5HGbbIS4VQ4LfGnzZxckVU0usLS6TGpHyPAIbln6FODH56pq8YLhIiY7cfYZmvVn8IaWiBivN1zpRVmxxPkplwtkJK0MSeHt2JvJnt+UGaKyEFioRdqRixp8=
Received: from SJ2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:a03:505::10)
 by SA1PR19MB5571.namprd19.prod.outlook.com (2603:10b6:806:237::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 08:37:42 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::ad) by SJ2PR07CA0004.outlook.office365.com
 (2603:10b6:a03:505::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 08:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 08:37:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DED48406541;
	Mon,  6 Jul 2026 08:37:39 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CFC66820244;
	Mon,  6 Jul 2026 08:37:39 +0000 (UTC)
Message-ID: <fdec406d-d9fe-4717-ab57-0c2bf510d1c2@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 09:37:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: cs42l42-sdw: Propagate regcache_sync()
 errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260704072712.91035-1-pengpeng@iscas.ac.cn>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260704072712.91035-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|SA1PR19MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cadb6a4-8364-4df8-8097-08dedb39d842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|23010399003|376014|36860700016|22082099003|56012099006|18002099003|11063799006|16102099003;
X-Microsoft-Antispam-Message-Info:
	NGujWcSwnsZqEN51lkAxylqBfAtwaB12diNhwr3FfgVdmWPLDPfu+BhCUdzX7QODWJThHhyCsKHEc51pf9P1pFUnlA6YhLXjcXaiyfrvgIWOrbPzwbcWSYYZSj/iNezVeG68BCWbkQngWWb6kQaduJIuwnITn2ovZitNLBGvfgIiegT4nqPEffN7aokIB33ftwqiU1AF+JKqhtZGj8WAeOtd+J0sp8wCqfAsbUwOIPF2ipRP47mTaIcKzfOj/fZ/++qquKAuNamWNGY1nn9arNAlPFLxv8qOP2NiGWZ4bQReEeW50uTk7iNuZ91jpVafmAs6aO3A5A6QwmNRAW3f9Yp1Z7UNKalLY/jKXra1iiS1LBBIGWeUi62nE8I9oW+VV1hYqVTSzefDHl0/JQ7a/Cqpkcv9ooheQxwQbXzgnsEk7yl0ruPJKHN/+aUgi70TyLznNHdBb44cvZcneUZMKNTgeHHylSyTtnUBt8kEbS0VhATxZPQw5I2mZfIq5DbtbMHFvORoVT6mDIIRXtngRXkTrd7bwvxNIz5D2/h2UZZK5j7iqDbz91NiVv1q/OYI+u1qUtYlRnyyyiNwDnIAAaC3KEH6iq79EenioEZi1P1mYbJE1PYMllZmsVPnsu9oQ9zF3eZd7aYWfO4vE8VRGl83K8/pZNFXRKf+kXanaN+zHGGmYXCDZJ8v/KFBdsa4TrGHOSpN3TTcFvJtuTNeIg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(23010399003)(376014)(36860700016)(22082099003)(56012099006)(18002099003)(11063799006)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xTxqA3cVu8XgPHCldI3p78KnafnY/5JNPSLbHcozkFU423E2gKVtVarPCIILPe3oz/w93sK8iqYHwrAELG7GX/anVpMikuxPHzR8SocGMDvN8M1fQZaumvjCZeal5Wi5+jLXVznKWol6rThLLSjrsOcHjjQ4mDP9Nmhob1lC3Xfh0gR+fZNwnJHtT/IXM41YiassPP0Wk+gtBBkRZq7PyvzjFgRsIoLtL0wDIEI3DHzPpxH1pXnMc6ga2UI13d6eva2bae3hUKOZHs6X63J3DsMIPqAVKIsNULdpNNYoGK+5rglhsLVaPLFQZ5GuZ6Yd5/r1NlqKwJvgl6X9jnyhWLvcAb9zH7yyo3NzReKVXyhcbLLrqyRI2v7Oz11u3peGVCyuyz/FnAFSIPQ+/rZ7K1Lnwjq15ZgDeuCfjEGfhdptc3X5lmYxws5r3Dvm3jpY
X-Exchange-RoutingPolicyChecked:
	jkSW5G6FYBE0okiihWQp5Tlc5r+5MCvFjXwlRUWXzPManW2KZ1CNWKTFlEG6SRhwVVhA6JB0Z8D18de70qKf2pUVovEvc8wENLMzrntci0pPOncsOgTsZYVSqSlfb/vx16vEoGvhoLikCgKl8L/qo8SeJjfUeFmUqjp0koAxE7BAKkHfSnnCejLNc+H7dkOrVnzUenFN7/7ySzMavj4Hpt3vTJF4gOAM1glZMrqoN+KwXJCljH9kefJ7kGmDK1DVOAw75yZFHiuRjQqoEKekw0S5TS8dl5S9DP9mMxC9G1DceD7G7qep5qkmqP8KqcxsEEC3UZkFZX2l4jrPfmeqkA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:37:41.7821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cadb6a4-8364-4df8-8097-08dedb39d842
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5571
X-Proofpoint-ORIG-GUID: EETht3DZgEbwlE6AqxiDrCGcWjoTryHI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX20MbiNznaG0q
 rvWZYN6jABBfevdIADoNuaYFO0r/7q3deyBy2ok5cfloRqnNhqTY1wWNnbpOhOCvSqFF14jb30k
 QiY3dq5k8T4a9uayv1j9FsS/7E3ZUaQ=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b695b cx=c_pps
 a=pfd1m+JhmiCErHYdEUHeAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=tEzwIWhQztiIJv3rSOkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX8O0rh97g3LwQ
 lALS9EAOoprJuRGWOxKMuFJu6vkA+6DFvc+cIzCrji0QTOHH06aaSB49ftCl/HnR/KHaqNkVFvA
 qWVxDQIb/obuG7laedxknsoopU2GpGMJZNIj7n4espLgX7Dz5ROfLa0qShWXab8hnZGhLTraTFP
 2nOOwFYuwyd/tPGxHmD1BdapsWYbCSL4Fs10iq3mARbb5GNxjX6/l32cTuuXR6IFiaGLpOhaCyP
 +FxoryjoznEgL66rqCcaryYwQcRD4OWOMvbGRIO0KdmpahXhQ8HKRuUE3nsLs37ykKqUBa8vxnJ
 /4IFrXmjBk4pHf5KRJd4Y8z5lh/tvztodQ07gGVNN+Jt7pXak2mFfVRAyJEFEcZGRXnzSQNVuJJ
 ivnAsNkJVdWnclII8UjsTrRfLM01C/evUuUD3hlENAxRu67BAi/9DySGQjtetVqKeQyWeVUeiSk
 2YyHhBJzSCBZmGI9nrw==
X-Proofpoint-GUID: EETht3DZgEbwlE6AqxiDrCGcWjoTryHI
X-Proofpoint-Spam-Reason: safe

On 04/07/2026 8:27 am, Pengpeng Hou wrote:
> cs42l42_sdw_runtime_resume() first syncs LATCH_TO_VP and then syncs the
> full regmap, but currently ignores both return values and can report
> success after a failed replay.
> 
> Check both sync operations, return the first error, and restore cache-
> only/dirty state on failure.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   sound/soc/codecs/cs42l42-sdw.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
> index ad1256910a18..b61ca74dcf0b 100644
> --- a/sound/soc/codecs/cs42l42-sdw.c
> +++ b/sound/soc/codecs/cs42l42-sdw.c
> @@ -481,10 +481,20 @@ static int cs42l42_sdw_runtime_resume(struct device *dev)
>   	regcache_cache_only(cs42l42->regmap, false);
>   
>   	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
> -	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
> -	regcache_sync(cs42l42->regmap);
> +	ret = regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
> +	if (ret)
> +		goto err_sync;
> +
> +	ret = regcache_sync(cs42l42->regmap);
> +	if (ret)
> +		goto err_sync;
>   
>   	return 0;
> +
> +err_sync:
> +	regcache_cache_only(cs42l42->regmap, true);
> +	regcache_mark_dirty(cs42l42->regmap);
> +	return ret;
>   }
>   
>   static int cs42l42_sdw_resume(struct device *dev)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
