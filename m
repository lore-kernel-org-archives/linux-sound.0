Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6493A3827;
	Fri,  1 May 2026 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638591; cv=fail; b=Z9ERXXtl2C45cr82dky6G+Op++Ogp3mBLF9s1jPbRbrcu3HpX5AuSi1D0tjK6eTZ5x39LcmyICpfmAZ8190+nCogTSyA5hQe6KfTMMp7HEKtgH9NrQ4pPhYbtZ4ueLvbDKP3rQvwla5t0KzLtl0tUCm2SIzFu6Yl8Z2khd4yzHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638591; c=relaxed/simple;
	bh=ZRyQsX4py8zm7EdrxMmBKD5P1JxzeQKWWl2JF9pzGUs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YGt6N/oOKPbPDt1Qe0i6taC/ICkcilFB2N6SyeaTlBeAYi8hcFgHxkZMoL4j70n3GTe20GKaLvwbp8+7+gXGjxwPGBj5xB89fG4M1JpjV4KZC4i+YvLdMCyPbgCpO5rsEvFAiAwa7f59nEan21kIWSJSyYn5c0KOgsUzbgA2ows=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QmjzA/mp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pqlWSFK1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QmjzA/mp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pqlWSFK1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6418QxDU1282799;
	Fri, 1 May 2026 07:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7AVpFzZfcKdv20jfPZPNB0NONPr76DCJmx7LMOfY1UQ=; b=
	QmjzA/mpqhrdo1obKutjpUPCoxJZ48u3g5W2x7R4fDqghG+Uyw6wTB6/tdb3j9Rc
	EmlH7WsGpciLeFB6SqnwYEmZAPpcZGfV8FI9YUskZOkFrOEoLzxdjbm6uad5WNOt
	dcx9A2o439IxcU2sYWaZJvQ2kh7ppVzLW2Gj4oM5Zzc+aNg3mdI2+PdmHh5WUWCC
	lWrFiBQtCslcEtLQIxmCAZDHSPzk9bX38Hz5gAg1VCXtWt7lHE1vaaE9EBDz5ZpE
	cVHEvHezAcHjTmTI299mvffblL8YqsJUPISg3OzuxpkBIcNYW2ZnzCr2A8x9YCI9
	mZ1ic2dpPgYxV9mnOSfmOA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022085.outbound.protection.outlook.com [52.101.48.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10g04b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 01 May 2026 07:29:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU5IO8NQWtmJ7h+HxHoljriUdxlXW1X5BAyOJy/TWGnQiLdYpjZ7az2hJ7yVk0F4tQFpivuWHwr77DaThBZFZj6623sZDHqfG3JzSCw1JEnxYB9ysbSVlbAmtDD5RNUuemjy4TJDuiRguUoFmhzK46JAY92TIbe+EPu/obNOKdIsZIeOfAUCBCoWtJDehmnuGGdAKyXVSa3goNk7U7TndU1nU9lmuB8/KgJUxPPiWYQxej6G0JydfCNxxeatr+iA1FTpvX7cSHG84K/X6tFdn8HFoqK+pE0Ejg4g7+90wmWTppRijt+ZB2mfd2fd1/30lR5/Hrr7ZFXxmGMl7DNFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AVpFzZfcKdv20jfPZPNB0NONPr76DCJmx7LMOfY1UQ=;
 b=XGeAGiEpiH9NjumBCPjtcLdO/5n0TMGoXBtMxC/2PooWyar5ZRPmVEJTNKDP6lZhGGq0z6GxWyPOuuAHgNPSv1CNcJYAnXLuOBmCUxnxv/QoyPPQbKnGxEJNvQGcn54Suu5/NUFlenBixd5gf+alGPqnIKpWQkrmK6SrJVFiUhP7oOVEgIDqI+JX+5ThQ8qJIVvOvI6mHqmqUqYcCUj2ESDm9u05zR64Go9QmQJlDi8BdvevhuyUzHdz4C4X7SiAfx4HvpThsv9Nh3HGFN9Z5DmGSUVac4rnRmWBJQDiQ0P/vzdiklr8kHK0Z377oaiEjTSDuiQoKkxzDcq615bjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AVpFzZfcKdv20jfPZPNB0NONPr76DCJmx7LMOfY1UQ=;
 b=pqlWSFK1NIS/Gt0EwMC8YY2i0+mr9LSSjHaWYeHLucXx7483CVzg9gn91Zn83BKXCLd6hX0Qyr7oP5ywwXmIwvCXTsFXG8E3D1rgUKHyMsA77FISMssnwMvXweTuwEI3CSnfS2uQdGoF9oNO7ohNK1BDJcXW2o7zzki5R9FtVFQ=
Received: from BLAPR05CA0033.namprd05.prod.outlook.com (2603:10b6:208:335::14)
 by BL3PR19MB6443.namprd19.prod.outlook.com (2603:10b6:208:3b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 12:29:41 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::17) by BLAPR05CA0033.outlook.office365.com
 (2603:10b6:208:335::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via Frontend Transport; Fri, 1
 May 2026 12:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 1 May 2026 12:29:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D5AA740654A;
	Fri,  1 May 2026 12:29:39 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F756822546;
	Fri,  1 May 2026 12:29:39 +0000 (UTC)
Message-ID: <5890dd8f-eaa8-456a-ba77-0baa11ccfc71@opensource.cirrus.com>
Date: Fri, 1 May 2026 13:29:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Destroy workqueue in probe error path
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260501103002.2843735-1-rf@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20260501103002.2843735-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|BL3PR19MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: dd31958e-1a36-4d24-2fc2-08dea77d51a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	97oSjfPSD30Xo+GwJS91SBWVHptcjA/xLEPYCrDCnFpp1bqqrbsGj/kgmufu2WNJafQvS5cd1ThnwhYWySV2zrFVQbPL/DvfJdNCqi89SYMia46NSPaIjk2AAKAIqRjy6bRrvxBCFmxS2/UaFJwdf3Eax2Scr38Bu3qWhTRd57r2jPs8ZzbdxG3AfIZa1/sr0GDnHrDL5vG7PdEL3HKhsT4rAF9xMY3+uHHzt/UII/wEvJJtU9UAtqR9EMa9LN2RHG3swmb0ucwq2/mIuygM1Qs5WuELWg5Gux7Z9nkcQb9Gmq/YKhpTmEIIQmgRtxwqCSc1LFN8QQBWIHZtIh2r2cSX2l5+xaMGGPcnl1WF/7kqTQ7A25zetQruUZLTn8MgjNWPNf/bnO9eXbgxFItG5AMgah2zDk8iVwpWVlbPONJ2HCI6nNO3c73nJfEevrZ9oDZnoS/OwdoUV5tcU/q0GZJYmWoy6RfgVscvTxnNsfi0EfjiLXRlEDG2FD1ijTL/Omm7wONWyhgg/qrOOcOCUl1he7QFONasmHw6lRFMdK5X+OqwlDBEGPsRkc+eZsF5IDyiUSRdbdgVXuYUWT0u1t2+Pz0RY6Tofyxq+JnjzXGNJvob5EuWZ4tRFvfCpsjkAqaenz9gy2/laef4M3VzisKIi2YPQDogqY6f3qtCuvnH6i31gLkD6fS8hYMPDKFj+qoSeld+RG2gnNHvNXc0m/qzLIGjYrs1lujGd5A6Mz0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TQ65Usw4hDhq1d4XQMyShIFKGYRTb4GcNhUJmDZRn1O+qeo7XdP27oaTmpRRbyIsfImKgCfT4kCgdh9WJgW4ANzm6rICW/ypmAcBSmBeJLn3a4nhBUcIM37M2tP0DeH9DmS97xFbQMXAviDuKKv27nfGB6M/aLzNBT0sS0dVTJGoIHB7cVv1CbiowS9PBC4u36zgSf/GqrXmkC3zLiufHb76+ZUa5NR0Pm7MNRi6fu1Ut0u86bYrA57Bu7MVSIlAYhfGZv4MNhJHDqfi2VxRoDXySuOVvxBEAr08Dzz6gz89Jgl2qBm/+drVd3vKXxJzfgams+y0wZL2MpaMDD3Jnwza/kKnWkvD6hNIq8iWmYrs9+aAIqmTa/BLo42ObVbs1lLYGJGy07LsMSJhr6q87XPZLvT3LrxiilOwXmYG/GMlBlFWKqU7zeWBTbUm1bP6
X-Exchange-RoutingPolicyChecked:
	jpSGFmxd9HAdJcMBAEiRVHoFdx3C/A3ypHYbipmIaB6Xy3NMclI4Acth6Fab0rpqfne5TKCnqVIJoIwoU4aoc8Xi4xb5m5NQ1ygeyZ9FPNtLTDBQkwCvtfb41xHwDnmEBBSbb49JAAeZiBdJberMsVZj2CfpH72zUwLmQn3wJoVxKS8SQNgWPBQVYs7b50yPSyuqU09vm47Sg0cRLiovDBceajXe5eIuaPRRRPYMjjCkn/3lQqm2uNL+NuGnDotTcJ7aBR6fA/kaMFdglTqAzKcsy5k+wk40hC2cJjxulsxplpZSyHHiu8b25VG34V5MtUFrhhqb301zF+YKEjxXFw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 12:29:41.3530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd31958e-1a36-4d24-2fc2-08dea77d51a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6443
X-Proofpoint-ORIG-GUID: 0ZgPt_OJRlL-9zdtXbgtriMSo8i995vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDEyMCBTYWx0ZWRfX4E2FtAYCg5bQ
 TxQwbTVR2g1id9DHy95Gx9UKi+hH6Wc6a6dhNzrVDgatAzq1hnXIoLjqoMsBPBHCUO+8HDuD6Mb
 1+zQ38NnQo1Arj+eJhS6YWRAl+pBiIOqwNRLUFJvIX2tuJqX0zoR09vogAtveZNnTVbdqyaklpM
 Vp1iKkqT4RTeIFESkd/WCmRdbKGONZuAbi6xIR7MaPDLiY/yad8sKozQqQqhwfBPup/baGKYmZU
 5Fvi3JsEjXRGBVonsyx/YCAJFkvIOzYpix4LdKRMSgFdymXs8H+ll3UHcuozSOS3fZbk1QxctIn
 YlfNj58nbwKjYl1xX0w3vxV5DFWNpjZ8QWgH15+f7JlIAb+r78g9rIkrrVGQkakMIEnWv+E0Uzf
 rqaDa0o9Yt0SjNPNNzyysTVSneAhFYJ+arLhNghAz1oyIGp0CVhvefxdfaIcTt9TeoKQxH7Nijt
 7SkoFqPVuqT55APCx7Q==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f49cba cx=c_pps
 a=k/qEcsOZaAb73X0OMcDaoA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=SEjBpzHyPH_AOb8OoSgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0ZgPt_OJRlL-9zdtXbgtriMSo8i995vq
X-Proofpoint-Spam-Reason: safe

On 1/5/26 11:30, Richard Fitzgerald wrote:
> The error path in cs35l56_common_probe() should call destroy_workqueue()
> on the workqueue that was created by cs35l56_dsp_init().
> 
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs35l56.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index 378017fcea10..401a41b648f5 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -1970,6 +1970,9 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
>   	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
>   	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
>   
> +	if (cs35l56->dsp_wq)
> +		destroy_workqueue(cs35l56->dsp_wq);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(cs35l56_common_probe, "SND_SOC_CS35L56_CORE");

On second thoughts, it would be better to change the queue creation to
use the new devm-managed functions. I'll do a V2 to fix it that way.
