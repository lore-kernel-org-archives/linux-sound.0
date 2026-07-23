Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151E35C6B7;
	Thu, 23 Jul 2026 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800138; cv=fail; b=RPumhg6LupXL25kzPj/uWhZpPsIv3Cgry5mq4JzprQij6Wyd7/pCLdq1UpXUtcwfVVmiBvSlq7aKy9hdY2CnyEDYlt5EECv/yPiolidpyDii7g4vgK2ddeXWtqcnjg56L5ASoZyil7JAbMJfreFCfYAwhnZ6rvjPPTjxYqlaRaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800138; c=relaxed/simple;
	bh=/wAM2E0Cnp+5eKT5MjYdCuDk6t3gxGbQIPRbQ8DoeqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azgjw7XLdncVX3EzNKEoDimlmjdqxrmqTCpEE1YpQ/gRLYVJXaXUPHqG/E+zPwPrFXdA+I7TfE/yoGprWAr59FzlsZ+DtkTzA0y8GDWleHZ4evzkMR89+0j8q9tlNB8fPYp3o6YhuraI0cQnOFoB2buhFaXQjRTfLXjjN/o+uBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eIk+KWsh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=S877Z2m6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eIk+KWsh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="S877Z2m6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeM1L3530724;
	Thu, 23 Jul 2026 04:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=N+J+7dkGlK/WLKHTQLM9KPyOAgT/Ysjz5ecY3ZHsBYE=; b=
	eIk+KWshkrKkAAlTMdYtrzO38q+cwQkvE+XgZ1BtVOrXSIyv2OP1OXQQrJ5sp5bw
	jB7k8jdKbdwuxWWIsO6bUeET0WXaIV0r2sV5fOnud3fSHu97BS1IgCPQ2OxJhjHi
	FAijX+BYgk49NTh8jBnG1W5R5Qf+BKYd2kMc9LFglU6EFKz4lbZNqdN8trVAfVA6
	POUIwxmnbUd9J22VxAqRDfQt5VTQOmQosuzugePPUHIEIbY/P/IqJLvqq+XhUdOi
	mxlfYnp6SWIFVbtNmohKSFFphNQ0il0GNqEcnSWm7zDFFwM1O9WHymXLIULVmAQR
	iNk6KhA2VkWJ7RN6w5NGTw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020081.outbound.protection.outlook.com [52.101.85.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff4yr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:48:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AL8odIFLtHKcIxzlnEmkKehtZjjmZyb9AHsfyBeHD9w8UY3x1w+A5mh35IHaQlQN4mNGlWxCG19WxviUOBF8fuluLWr249z+OlBS/oQMOCUmuJSaZpspKc64Xa+KD0B0mHCuOZwoz/CnT45eRLb/gFPOvsqziZLh53EzajvFJK1pfYbmgbBXXUDIv5X4i7C4NoCi/39TqXMPMhnnM7AFYDqBNC0tIpdZsCFckjGhzNxAYUpdA9J855fYVJxPl5pdYAulL6/EGdwPRv5o49gNRfNO4HGfDV7jo4XdD89FF7/QI0ipC3PjM5R1QTSlxKS4QAoOIyIShSeKWF+NOUXXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+J+7dkGlK/WLKHTQLM9KPyOAgT/Ysjz5ecY3ZHsBYE=;
 b=plW7c+Zd6dsfAMpU82N5UM6U2Cd2w2MGVs5r/TJxwcV+id6TLJzhzFRcfKP4ZqvD7rb6kq4z8Ayj/b+Qprvvn6/bdm+NsPkrPi+DNrihMEssXiqsFl3/nRTB+X6Kg5X98DOmnv0FecUxsMntwB9AsxgVHxO00HJDWAW0d1oR9JrynTlB/pY+2+Vxx+hv49RsAoD3tUzz2P5ovMyMMKCD8bEb/2ChL54c7AolYfb4goPfGOO36YEgrqW2MvivDGyx+sXPRVYisxx7wzCRXX9gxZ5gVqRX7l3BvrXRSYaJXxopgpt7pDggkMkffGBme1lsecfVsFGfkh59WvrCu0V7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+J+7dkGlK/WLKHTQLM9KPyOAgT/Ysjz5ecY3ZHsBYE=;
 b=S877Z2m6oWmotj/UeN7F7lKAMq73hG6mSZOXwp7cA/Ft5aSZBySW5d4ozCGPMe2QHy7H83f1WFmbKI7X7n94JJI1smjzWiM7kRvDSMyMM1uQz5YOKo8fxg+x2EeFt2Cmktnm4FpUswQGCi18IBVDs99FMVrZNRqFlpBn238fOyo=
Received: from PH8P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::33)
 by LV3PR19MB8317.namprd19.prod.outlook.com (2603:10b6:408:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:48:14 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:510:2d8:cafe::22) by PH8P221CA0020.outlook.office365.com
 (2603:10b6:510:2d8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:48:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7D9A4406541;
	Thu, 23 Jul 2026 09:48:12 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 642C982025A;
	Thu, 23 Jul 2026 09:48:12 +0000 (UTC)
Message-ID: <155ca08d-7591-427c-8db3-5329632d10e3@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:48:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
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
 <20260723045327.28260-24-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-24-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|LV3PR19MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 97889c95-d27c-4b9e-429c-08dee89f839d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|7416014|56012099006|11063799006|10067099003|22082099003|16102099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	mF6hrLyrYcFBcKxc3afXtPUvTxEmzxk3bikwQFJUTRui3rdFCvtBV2sHrAfFB4UZ4ddngYremp/NZuO7zTunkR5ScSLwQ7dIrev4DN4ZEEj2/BF55YODbz46uoklOwbWj/3OFMyO9rk40LbxOgYgJLOD4yzUvL8Wqrig/JU0E8UcCoGBbCLtRq3Kg9ID+ILB/EvsXdIonxwoeEJ58n7qYplY/+VU7EMxzq8W6VpAUIurzh+6v4WydsZNCVCycUpOiRTgJr9VVIflD6iLRFovhLeKk4MxPGchLO4RpigtmkzFcQ4poCULSLwKrSRQWwf+Qm9UBYlCGknis+pS1GWu4MJ5RzzPB58zdkSUazDUWnUVvxIMWNaE/LxVXHuicyjO5ZD6kxcYdbe4L1MPTIjCdY7O2zRariGXNbrQ/dnc/Zkzfiox2g4K2fJ/yJqXbtsLOfsMNCkSH3dtIRnihhs+bCYwnERsyxd0drUFrhM7f00I2mZTCJgi8VIkBYbpakAcQzg/AtVKB4FQD7n0Sl4TsvYLYg6IhBt08eTdwvNS0P+cE1jrd4p73V3DQogF9WIFNMYcdEyPBX9Z/LYMxN0m0FxXQYcLUHNXHxbGRz6PWP4qsYNgolZi24S/gINy/jzImU7cQ4dgMZ1XMVZ1ztEMF+S0LHzDNh9+pJ48rpX8TsqA0TkKzG6vvv8Yd7U1qnYd4MM/CXh2ecRCYaOVTFSGKw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(16102099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w1gZn+yaaen5N/1ChUFYD8OqmED07F5gy+EWSl88t0P/5pyNfcNZf6qqp36muTnFKDCSuW1gyvDKCf2LuWd3yCUnGzFQAHbIggG1L2t8FqPSEFXttrz1R41Ye6KyhKxDouz9dbBsBEPJW8mz8dSDvF1Ap3P2hc5Czrin4neUYSAxrrtDSaRKdUG7r5LihQxrXpWbBosYxdDUYepj2ormwqoC/eIN6bYcHH+0pmB9bW/euh2zqGu5wQaS95mnrFAYHtXb01oX5K+1YwrF/SvowX3ydprDo9wy3kU5xdrRoHDOb3zyn7Pb5zsS5h3cyWJzCeCx8A/T1oi7RtCAVJ2HZbopelsofWrZTHJnf4G8JmliVcbDIiwLxW10s3/z3lO3ZOkJzjTUbu+IZwzvlM4Uemc1kLxO4KhaDHpc8HGQ8iXu9KxLLVSzNDUpqjZaWL1g
X-Exchange-RoutingPolicyChecked:
	Av2pAdXDAWFQQTb+ggUM5w6uQTve1aXI1nZjhABL6Mtu9DDhqBpvzXsZM1A6pSYiSoZWyc17HiHKp+LnreEi6BRZB5NcnXKAhR3LoHH0EG2JHGpcd2MUpCmfRg5dLvdQS7kXvKFDiGlYeNdSha4TNYARwQ1TtmmKDC+vu5flW0I1FjDS/qmc6+8NHd5bd8qG5T1UfPB7jlgTcMT7xdnvdhZTXdj9I9x5YI6SmLot1FBsSSL6cfwg3g9Fexu/Cx8nVu/19olXi6wpOAjkefpGGCtgWntgvyE1S0lAWWAGtPUMjH65C8ow83EfLnJ6fXekMx8ajTRrLmBG8r0g/fjhRA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:48:13.6040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97889c95-d27c-4b9e-429c-08dee89f839d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8317
X-Proofpoint-ORIG-GUID: GQ3HQpi8OLlJEoUbS1s2fnB3wYyI3fIx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX8+zZPz3aoVtz
 jhi6fyp5UP5QWK4deSQyVb8jJtwtCzvAM4qNQ/NoVYNHWIwifXCns+V4k0ZvMkD7I7YsJTFFu5Y
 hkrrormIAAk8iS6k+MEYFs7MxDfxzvs=
X-Proofpoint-GUID: GQ3HQpi8OLlJEoUbS1s2fnB3wYyI3fIx
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61e364 cx=c_pps
 a=PrKk0R3FxLq9+u45pGB2Yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=wggVRkVUAAAA:8 a=w1d2syhTAAAA:8 a=nunpjyl0k-KjwZTe6-gA:9
 a=QEXdDO2ut3YA:10 a=MZpHe7prQc2n3JaO1KVd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfXwpnxxEG2ykMR
 3+k3G2tGVvLUpnOk5Qz5+EWvJSP7kaDwK4FTmTy3lS2tQUEA/2cAlkphZ4gjT1IW7/VcnUUCwAh
 cB4nS0wAxLsGOYTkiGF3EMx9Tg/2lfkwK1gYic5f46cBK2o41eLIp5yFtBJvIa17FySuwefP1bz
 u3dy01anteU7Ud80XXDHFnhujNJTN+pCLTBregajH4xo8SNILp+1I6x9O/SdwPpmKmhyD5jbT7o
 b8BcQIRSGJBsJ1GBiHbnlFJp9e4G+S+zP/8UfhzFSeNF5lzlH1L1B2y3mvWPNFosS5XYHk4rXer
 Kp3iwO4rvDs7ZczFndZJOynrS5YXvCiC42bSmYnWe3cVKK0cF+DltDyn/Md4Bp+FZP7SIyWt5Oh
 /arMe9GoNHxdwCszSkDBqfC9xOgVdL2ncssamVfAlZMcGLj2sw9DH+uYrT+Ie5ptvMs2eZC6HfQ
 h0zi0wesky4AvZ880hg==
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm8994.c | 30 ++++++++----------------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index 1d64c7c42ed1..8bf58a6a8af7 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -7,6 +7,7 @@
>    * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/init.h>
> @@ -766,7 +767,7 @@ static void active_reference(struct snd_soc_component *component)
>   {
>   	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
>   
> -	mutex_lock(&wm8994->accdet_lock);
> +	guard(mutex)(&wm8994->accdet_lock);
>   
>   	wm8994->active_refcount++;
>   
> @@ -775,8 +776,6 @@ static void active_reference(struct snd_soc_component *component)
>   
>   	/* If we're using jack detection go into audio mode */
>   	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
> -
> -	mutex_unlock(&wm8994->accdet_lock);
>   }
>   
>   static void active_dereference(struct snd_soc_component *component)
> @@ -784,7 +783,7 @@ static void active_dereference(struct snd_soc_component *component)
>   	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
>   	u16 mode;
>   
> -	mutex_lock(&wm8994->accdet_lock);
> +	guard(mutex)(&wm8994->accdet_lock);
>   
>   	wm8994->active_refcount--;
>   
> @@ -800,8 +799,6 @@ static void active_dereference(struct snd_soc_component *component)
>   
>   		wm1811_jackdet_set_mode(component, mode);
>   	}
> -
> -	mutex_unlock(&wm8994->accdet_lock);
>   }
>   
>   static int clk_sys_event(struct snd_soc_dapm_widget *w,
> @@ -3704,7 +3701,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
>   						  open_circuit_work.work);
>   	struct device *dev = wm8994->wm8994->dev;
>   
> -	mutex_lock(&wm8994->accdet_lock);
> +	guard(mutex)(&wm8994->accdet_lock);
>   
>   	wm1811_micd_stop(wm8994->hubs.component);
>   
> @@ -3718,8 +3715,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
>   	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
>   			    wm8994->btn_mask |
>   			    SND_JACK_HEADSET);
> -
> -	mutex_unlock(&wm8994->accdet_lock);
>   }
>   
>   static void wm8958_mic_id(void *data, u16 status)
> @@ -3777,7 +3772,7 @@ static void wm1811_mic_work(struct work_struct *work)
>   	struct snd_soc_component *component = wm8994->hubs.component;
>   	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
>   
> -	pm_runtime_get_sync(component->dev);
> +	guard(pm_runtime_active)(component->dev);
>   
>   	/* If required for an external cap force MICBIAS on */
>   	if (control->pdata.jd_ext_cap) {
> @@ -3785,7 +3780,7 @@ static void wm1811_mic_work(struct work_struct *work)
>   		snd_soc_dapm_sync(dapm);
>   	}
>   
> -	mutex_lock(&wm8994->accdet_lock);
> +	guard(mutex)(&wm8994->accdet_lock);
>   
>   	dev_dbg(component->dev, "Starting mic detection\n");
>   
> @@ -3803,10 +3798,6 @@ static void wm1811_mic_work(struct work_struct *work)
>   		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
>   				    WM8958_MICD_ENA, WM8958_MICD_ENA);
>   	}
> -
> -	mutex_unlock(&wm8994->accdet_lock);
> -
> -	pm_runtime_put(component->dev);
>   }
>   
>   static irqreturn_t wm1811_jackdet_irq(int irq, void *data)
> @@ -4026,15 +4017,10 @@ static void wm8958_mic_work(struct work_struct *work)
>   						  mic_complete_work.work);
>   	struct snd_soc_component *component = wm8994->hubs.component;
>   
> -	pm_runtime_get_sync(component->dev);
> -
> -	mutex_lock(&wm8994->accdet_lock);
> +	guard(pm_runtime_active)(component->dev);
> +	guard(mutex)(&wm8994->accdet_lock);
>   
>   	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
> -
> -	mutex_unlock(&wm8994->accdet_lock);
> -
> -	pm_runtime_put(component->dev);
>   }
>   
>   static irqreturn_t wm8958_mic_irq(int irq, void *data)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
