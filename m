Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53B427F92;
	Thu, 23 Jul 2026 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800577; cv=fail; b=kE3ucpUegxvaoxubiG6+x1wAqD9J/inbhl6xGa5xfa3siAHJmpqnsvJ14WCgW4cKcX6SzDVVIY6yU7Ka6acoK75w50bDGS/TBXSN3WVUcUGKtaIEovEi1cHk+drg0ppJ0UjRkJGysq5yQCGYiKv0F0D0SY8+zo8VMX0aCSP19+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800577; c=relaxed/simple;
	bh=zr5mJn84ZlwW2v3+qy8m+txEzpK5eAoGR4ExhNFSv9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NB8QEr8GsePDu9E0F9yRKZxs2XktZyry4Kpn87A3pCEM2MSBF09fNL6ZqbmIzf+n0SsPAnlbHQP8aMMxZrU0qtjqLKR8x8KS5NVwNP8G596IRVdJ7scDJMXc6ssyllnFkh0dxPbG6w0uV0J5yMF9R+pvob+RIu4W0B99qmBGQU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ip3m8xM9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xhpCFjFH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ip3m8xM9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xhpCFjFH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N2G8n7107580;
	Thu, 23 Jul 2026 04:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sbpEhMYuQMILWsQjRhfKB79ZftfQ8eyou8nfuhZwcB0=; b=
	Ip3m8xM9ZnUpVPz8qPdDhfI8KPAsBf8bJdc6YkAIDkL/AaR9o4O6JZIftNkP0/Fs
	RXdDX0a4EUZASy1HzwyOMvT4JvOBOt/+D9NzziYXM+J6qw6rl+EZK9v/SQPx2G0J
	CtCTdtSeVEZWGbeEDfEglHwE8gE9zvI4bIyvk+RhXT6ftBBIbDd3FX01DKsbwoUz
	DIUni+hUyHbVtVZrRDaFzhns4dOIRW8tqKB3E3pHryyZTxZgNKOh3PGva3T5QI6v
	47IQYgo1ZtCJdzJxbcOZZbWAikPhZBPcnckz+Z9IGIx+pmFVrun96Zpas3yW9gq+
	55lA4JgEHgA+xZtCiOnrxQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020093.outbound.protection.outlook.com [52.101.56.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff55q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:55:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKmjxZPrGAkIfbElCLPrtjNxPyWVK7MAa6flGbc0TDjq5zTj/dYsL9bDPrmBV14dB20DUy84hwZ/8WYrln77ilU/TMqoR3msnrZoShGVRePj3FgEJRgNhPg1BPux2d+1udzIQf2BOOZ4/Ic71pR48HhiJ29Skvh81ehltvYGpvDBgIp9YZ/6xGYzuz44hDUnXVpxLNkYMgYvYK0jfDJCbFAGxUD0lROVIqCZZ5GL4PtLfMRBqV4WsGH5dx/zRrFVMdtP2+ZYafErHyoM2K5KKKHfAuB7d80B2SGdDdzysAXqm6dxM/dLxQ0yqT1xDcj6t3QI/OyOUYCf+qPrzvMPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbpEhMYuQMILWsQjRhfKB79ZftfQ8eyou8nfuhZwcB0=;
 b=TV5Zd7Fu3Yc7DheWNaXcYr4NmmB3luz7QYH8Emo8DvnujaA3KWDR356qmRsX9LbCFrZO4wuYoBpl04Ilp96f4ZUkwhiVZJu5WtADTFA6s0d6rYPuRxqpNhNj4bAVBimxFKVyQJL13jPfSTLrQmD2C9infwCdnlwddlhd6y6zp+M1Y3AVKjJM36MN6jDBwUNLD5nZ4DycFRnHgRfRvA/aV7EHdW+5VF4/Y2szyZdG7CLIQqjYXHG8URZJrH106r4gXRtamws2n/2sJyp9HzBR+ClTNBgSrCZbu+cCJhT/TAds0Z7j57P7LpBh+zKol2kU6JyfhpMTWZtGB9fZPgiH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbpEhMYuQMILWsQjRhfKB79ZftfQ8eyou8nfuhZwcB0=;
 b=xhpCFjFHMHP1mTv8h56d5F1wVtrzOYn0g+ZheNPxAyps8tiCrqqlaDsedyTrZe2iJLtbvyMZL1mu9xUDt/xGOJs+45veg4d7zQ1jhokSSKnpcG1X2qurzX35PHxF8vvvOzCQh5qgIPT1Cb+AxPRr5u1IKvT7u+dqoPU04jwEhR4=
Received: from SJ0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:a03:2ef::29)
 by PH0PR19MB5209.namprd19.prod.outlook.com (2603:10b6:510:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 09:55:35 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::88) by SJ0PR03CA0204.outlook.office365.com
 (2603:10b6:a03:2ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:55:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 09E94406541;
	Thu, 23 Jul 2026 09:55:33 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F03C982025A;
	Thu, 23 Jul 2026 09:55:32 +0000 (UTC)
Message-ID: <3ca21959-d20b-4343-aa95-ebe5eb0b8ce6@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:55:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] ASoC: codecs: wm8731: Use guard() for mutex locks
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com,
        Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>,
        Chen Ni <nichen@iscas.ac.cn>, Bartosz Golaszewski <brgl@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
 <20260723045327.28260-20-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-20-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|PH0PR19MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1643fc-bb71-4c6d-8bdb-08dee8a08a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|7416014|23010399003|16102099003|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	qZ2JGYg5kUxjuyxpIoIzpF3BjVSg27koUqg4si5il0NJ087BsOlbZPa3P1m+9uUigHf84QI+75bMRXNwVG5i8mT6GwT+3uatLogrKfr1zbHxA9jGf6bp2lYapAkw2MyHLkfiZikKzps5q+SV4qgL8Yd47p9dCosi7G5r18h7Q7bZki3tsJLKU9elaASUNb0aO0xlZGOK3ej2dyYk7BO/nxckrC8zof6xdPmuwYkglTQLavClOxobDb5bwS+eS5vQRIjisVRYk1XbfcIZcmMYmVWuQqsa3bTA2IHACijW/7sA2cPqQsxLGaKTetRXAzeBPRhnTYRQkucTnowXHqc+SUlGUKIUQY1K87FZoEtDHHn6/njbsNEZoVpAvHSEsvJ8jATx2P6A44qjdGWhulRUqprhKGa4xnWFeHXxstxfpYIbBgSpGpxcqs4NtfacrypJ1pEey3915msqeNlqR0i5SNn5ikq/acY0tmABd+3Uu2bB2tOOUWQNTVmNhzkpow9YxQEjip1vUQpy7iMGGA2EU4EC0zRloVP6vmP0g7IeRVz4YjGB32Q7lCs3jyWeaZx/892egcvRmOG/NFA/GSTVXQdvK1vYHsUb9Ihzs/WZNs1byRZ1A6iDZsdN221LyovEkxI7SAdyADhSA2dWGbJKdSDPmKZpmTlz6hEU8Sx//MCiIO9VnRIlPDYoVrwlomhrB9TXsCT/0jmc99llMmi4bA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(7416014)(23010399003)(16102099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cI4q+xWMp291x49jOB8pkSVhl0X+J724snj9qWAkVIeZ1tw5sSGyt3DwuxAuQxakwKO7NdeWytyBvHsb8NnAjCrgZ+RB91UEMeYDWvB+m9kJoiLeYr0n0PEWdlrD942/rYEX3RQKSYu5oC9p9EmsLwER+zHchizeAcOUCaAc67RTF8AK/mAUMO/bTEwSl5c3bRalTDEF2lU8CGX6lhqO0IDZZtRUskFBmnH+wvK9JKNQTArXm9hM5nWkfSw3BawSO80Fk1iwe7GBLUWU0ly5BdbMkrFb74guBoapomtO/ybYMSwlJSOZqzusOxBHnWzG8Pn+KpnG3mgm2ZOMQvnCwT78ZtLILDXXrO1yc9JV5wZbVVeC02pG5KSWEbKfv6qn+DmT6yDDDbaHAVeBMczJpxkvgQVVnhW245n+lq/KWRAO7H8eihhSZS29xDDZYFHW
X-Exchange-RoutingPolicyChecked:
	sz2I/SYD7EaaMeYtdZC+V4hIi7kFDIsFABUKW6XAr1i3u04Y5rsWDtd+ikWCkT5S/KrDykdUUp573w8AmsiD0zSRQmQK6/zGr8EYrU1bJ0nSs+6ysNrA+T9lQdE5dL4RP4QpmA4muOWIfjSb9NJv6FVLZvyrJyRowFYITIjdI2ikG8fb9RWfYI3FU1/STERaj4MQMU7wo+xuxlC5urZSgZBCHqO3HWMeJCIf+bD9ff9isp4muZgjhZby3TMG50FY6rEJtYAfIeRLPauphCTv0Aq/9YhS7kfdhKnrpqWxUA7Vmo4caKVmKQGbzWfH+4oEbi+64pRd8JIdaf/Ynij/mQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:55:34.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1643fc-bb71-4c6d-8bdb-08dee8a08a68
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5209
X-Proofpoint-ORIG-GUID: 6nDh9eHggb6duKKhLJXYH1x4rQinDUg9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX/yITg5D0naXX
 yIdaVHNo+lp5aEgIeg6Oz/YA4oTpI3XsiSD2DgRWWr/cghzhrQ9wbOu/gBDcOxZH7YZ9DkMzFyX
 /53LRSy5AUWIk2kHd7UwT+hLayCW8YQ=
X-Proofpoint-GUID: 6nDh9eHggb6duKKhLJXYH1x4rQinDUg9
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61e51b cx=c_pps
 a=BVZXAR9urkJIT3zY0dPXyQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=YzK0GkagNc5e2jYrGFIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX8F/OU4QAu649
 cD5iVvGNcUEk97Qz9hGt1+AYa/E+sO1sDfz+U5qgYFPIAejzlpywxleDxA6xeUUDexxTtZZajKV
 corFUQ01VaSLTOehHSvGhKhRVRChHuDG9xUcUzHtAm5xDKwJONOOgym0neTZbGG2i1nsAbNd47K
 bQj8HzcGa5exZOdrxE9pgBJO7BxV0q3r8cyNuoeNpeTm3lBmIz5RMP/ZajjzbFB7XcAceM8edE3
 X5FVYECbYFPtM4yk4lF0Qi+g/o3tnGD82EWrmJJDkeNvWT42TSB968HHRE77LhlXrquzC6wOU4A
 oi/wBnC5XWw5JeaMlBZRUn973DoB+VcenBfhsohIVPqSsGYycywyQSGlA1o6V+JtNhseMzjYHdR
 1FmgEKk8lq8oTLhjVxvN7DwRsFq+T3K0v5vEeGIrxnT0gu3eW/37hY0db7eW0UYZVM0yR/zqdgV
 RxI65+u5QCyy3eYSc+Q==
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm8731.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
> index a2f0e2f5c407..ce87280d590d 100644
> --- a/sound/soc/codecs/wm8731.c
> +++ b/sound/soc/codecs/wm8731.c
> @@ -10,6 +10,7 @@
>    * Based on wm8753.c by Liam Girdwood
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/init.h>
> @@ -110,22 +111,20 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
>   	unsigned int deemph = ucontrol->value.integer.value[0];
> -	int ret = 0;
>   
>   	if (deemph > 1)
>   		return -EINVAL;
>   
> -	mutex_lock(&wm8731->lock);
> +	guard(mutex)(&wm8731->lock);
>   	if (wm8731->deemph != deemph) {
>   		wm8731->deemph = deemph;
>   
>   		wm8731_set_deemph(component);
>   
> -		ret = 1;
> +		return 1;
>   	}
> -	mutex_unlock(&wm8731->lock);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static const DECLARE_TLV_DB_SCALE(in_tlv, -3450, 150, 0);

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
