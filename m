Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3041A91F;
	Thu, 23 Jul 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800621; cv=fail; b=luIbX0u+90zIWSs9NkOaFHl+1jCCmYH2X8GRv/kjW63URpo1By8PzyE+QU/1sTyxqobkaRyjGB+/nlM7lGmh7zq8idTHPTpkHdXxr9SZt4QdnwKhZcruwaboAxPX4Xiq+aKd/KpdqmfPMWOfverGU6dK+PfdP9P+rYj92082GqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800621; c=relaxed/simple;
	bh=RbNFpXI8vj5wUxZ2nw3ObCTFG7vBY8EGle413i96D2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChX8YNOZFhl+oulKI6u2Jn5b9dsqd9GIQLWED1zHkRGJHTiD0Zx1FY5B9cLCc7EQKFq1Q94I2zy1gGIOUEeuq5/Nm9VC6AS3d4bjxrpEe0/bsrd1Myp5BIJLqADoJqj2eaJRpMwll+Q3aofLBdaoaOycdIYbdlwdWqkpLA+pqhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aC3l6eRk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VGEVS9MP; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aC3l6eRk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VGEVS9MP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N4UnsP2279487;
	Thu, 23 Jul 2026 04:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Kuo+RnISYQvN5JFEOyBICeTaBIsVFzZ8B1DQj9lXonU=; b=
	aC3l6eRkKkDgoUz8IfJkIKSOo35FS3pDgkKLoGuorWUJUI58AIWVPvFf71KPXQxA
	wT4xNl7T41m1mL+05kSpA9ViI93n1I/6yx5OzgikkKxaOVXgD0hGQF4nQZAwuOiC
	8A6HAnMh8T0+JlbGv5Z4Ze+QI0mUADHxdtSyFBRKGCM+NO5uAym7vgWpteiv8yYq
	NiYdHKjxEZs1fz68JIhdK0DF3O0Se7c6+KBWyF3ReskRXK+ui66V7thqWt5JrgeK
	YjJ3LGJF5vtSE8is7uAfUOmWbKh8LIbLQZ9rj+Ue1ngO2iQXfiC5YAbAX+OfII84
	0upM0SfY4u/SL1i3dxbbGA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023099.outbound.protection.outlook.com [40.93.196.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyq3ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:56:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajscDCS0fvDlAMSO5qJW5mEg6BI+yKYAckkTZGUWS5j6RU1hFTQKuWx8Ynbv5chK66F4KYnTj/otO8f9AaH10vuY1F7sBjB7tIDtu7hRUEfvTfgfxp4Y8wYqH1Scx4SEgMc83Qa8h+J1XPHPthJIKcsiHEZGSPmsvy6XucGDocsyXWv6asFiW2QwIkrXXzEorbOOP3h5h9ZqcA35McXK0Ga5RCy+WW19sqOue6/XYSz3xiUt3BogkdPwHWJd01EzIm6pEzqCWmhxP5iUN2Rur30TMLjAYzhXmvKQ0/7rQsWvuhU1LL7sNjmgG1icP3TnBFr1TTKFUXMNVWP1aa3X2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kuo+RnISYQvN5JFEOyBICeTaBIsVFzZ8B1DQj9lXonU=;
 b=yUKFT/PDOLZQYjkrTsJhmS0ORdOb68NMXt/r4ck4aZ/Nl/EFt/haEqwuiTs9B96xBVV4XcBYO9KJ/RfVyNioZngY96X11noGv1bGhEAiDx1CxSvZnbQFH6uBawgjDQN3SdhZSUHTX0DGw2s80y8+aulo8MUvmLlUD+6r66k8/kxoxlPo3Jr+p3IQoLu0O9Rlgmcj7MIaYOFx4EoQLrnSTG/U8MVrQGTm7NYEaRl18CbBbE29fEuQoKQMmX0opK9RrzkjZMeMjMjgGoV/OO+ihPBk756cvp3gN2hPKu8hrlXzXqciUOGOB1oTP46uUCioonJNXFckvwwpt5Aswi45Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kuo+RnISYQvN5JFEOyBICeTaBIsVFzZ8B1DQj9lXonU=;
 b=VGEVS9MPmaFtj0c+BEPjUsC5h0iD3OTwzx4n4dyQXl60bKr+n46+r2G11DSVQUXrfLrQyIVcvCjU6JoKmr+LPYLEkL2fRxVMSdAS2+5UOk1uS7/AhC/AmzsQOvVHweb89W3OdlIpIGh1iuna9HwxFCHw9OhZ4rTOYYtdn+zlFbE=
Received: from CH2PR07CA0057.namprd07.prod.outlook.com (2603:10b6:610:5b::31)
 by SJ0PR19MB5557.namprd19.prod.outlook.com (2603:10b6:a03:423::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:56:22 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::39) by CH2PR07CA0057.outlook.office365.com
 (2603:10b6:610:5b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:56:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 00B7F406541;
	Thu, 23 Jul 2026 09:56:20 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E25DA82025A;
	Thu, 23 Jul 2026 09:56:19 +0000 (UTC)
Message-ID: <0892a4b7-e71e-404c-942a-7f2ee5a61994@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:56:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/26] ASoC: codecs: wm8903: Use guard() for mutex locks
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
 <20260723045327.28260-21-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-21-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SJ0PR19MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed7f8a6-e227-4e33-cd74-08dee8a0a644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|7416014|61400799027|16102099003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	k7uecmgMPdretG3HNHaXpHoeyo3UrqZ8Wgk4612aEzHEuQNeow5EgB7ZLewOwYkZNRCh30diLAO5TiP3XbGtcC7QDaXFa0J45DqudU4kRK+6in5QaFSn8JVWyH+d2xWBQuf9gq5wCPyb6FhvyUststaCOzj5F7AO43x8FsDfXFJkSn0IbcIvEAhsB9LFW/XHfbNKuS9X5xYQLrX8avQMyfvjYQKICG0G+vRK9GR4uNM1Jgj4YarBTvZ78+GbclUBx52JnfoX3W9N2x2C3W65krj4JuO2k0Vc4wBNKlhifb6eiI3gURt8AYYzW2IW53crfsYw4w0I6RG9ae+opIY31lyWql3BVjKQR1JExRa7v+vyHIdGmndeAGsFuMxj7wxAsNTx4lxGC3MrVbLsk9bidctTPcaXgz+tkvUOLvnbqzBTJMpUfmnbd/GQIxANX7ACU125ERWyjOzzw0T1Vs7NiWhZlTsV38yp/eT1V+nHgDQgrMpn8gRl3fdpMdvcHeefVLLdHj/D5V2UYjFEvtj/OOQFfdveQuIBldbG2Rlid4RIuvRQnTtLP0xQPMzCed/Jys3oOrP+zQj8Cjf1EI6qYLhHIDePoNGGJcV8M45reVxLlUXeNKLxgWRGY1DIWEWraySum1PbNYOt1214Y4opiaKKkQk0Zg+FSnwDHdPyz9+6jVLLK9TnzOTcWdJ5g59HJ4tDlT1NVpcQhPzmwD39mw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(7416014)(61400799027)(16102099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bxKYpxJ+D9RVb7BHMp+6GGUPo69g0tl5GZHtXCajrH16Je9suJd0QPFg6bj5fXxSIEmCNULpZTYI47HEEjeeV/LCaRB0F039IuDKE4P/oXlA88p70a/l0YV8R7O54Y+iJIKvaWEWoSDjBWJl498RR3wkUvOjawiSAMsiJqcfHexzzSWMEYHFGdmCPTOE4qsja7wcXiJ/eERD3YqDvBdaNAoUcfxud2MGSwSfCvDaeAVr4AO74huTheh3WzXbOVGjXeR5ClDvYYvr9stpIk18vK3eAUK9uUKv9tG5jampI/b9vt2fmkvGojKupMer+Rz7H5zAf8hb4gZ2ZYa43G0lISQryYiNbFyIzywF655wGM8bbsdxGFYyHiP/28+cJ35yyaR/5Roh7Xtk1+GSloY1Ajx5u/DTj+wy6hvpiZcBQl4n5kgCIOXw+wWs2ufPSOw+
X-Exchange-RoutingPolicyChecked:
	hLOtWhYjPPfDWbQjqU+/iVrrcuMUV4mnjLqjtTbkfi9T8pc2+4FQLT9eINs9AabxVysNbUbwv3yGTbMVdOrL4IXgiS70WJ5k8/Js12uu4KCAP5QbHJb6EqEgf1u+nt3Y9b06wulJEA+GVdnNWJfRQdSfVLAZ6FbYQuVw67oP5wlIvBFbZY3Unl20OJBpaznVxTZlmJQKOO1Q0qOv1FpJjjkvqWCMk3kx7c9FdrCA7JDpfVnYKD5kuHajFQKYeJU5YMO4rL/2T7b3RGSeJUgs7gjRb5MrG9EKM60UFUz8RJEE6f6KO6zuF38S558aT6Z0TgUS3/9sZEhJa98RENT6Dw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:56:21.2808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed7f8a6-e227-4e33-cd74-08dee8a0a644
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5557
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXx7pMCBopC5g4
 MxiV4VY6vZlW/MRl7K02dMJUMuZTHEq8CPR/wrIT0NdZnS8hpa6ZNxl+UdRBzoLhNWeVjrgKFbr
 MTneuTiFL/Dm3hfFA5a6vUVT8iZzExQ=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a61e54a cx=c_pps
 a=iMozJJ0ZMpdRlXWW5uynUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=YzK0GkagNc5e2jYrGFIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX0onsPfqGoMaP
 daJggkb9NNzsSVu0tjgT3GE7Z+F3vZlYzimfcrA8PKIvpSiiTZw13iqXqA7GfdEIsa7mHelmKsd
 KtA6cePSH83vYb5xiS6pb5msH7O+c+hpvPnQSQ3mQOe/UEBfAbJDEoLj7ldYu73aRWOW4MJljHk
 cKqy3IZFt8bltxg6aqsceNFqiViwj+7pYhYPtSJziE1PZudaYcyfEnVsdPGFw5/UX9Wdpr64xGR
 6lrpUF2KFEPlVeoDz+xfxAqZkK0cYwn1IhnPYnTRtgRaQ5ROIXfpa/Ix1z7rcCGl+st82kHY7c9
 aBA/dMyN1g2ziFg7b8ud8gF+NHMtvS7MbAPKAf32/6QCXYk0p/WePnhXsyVFm1+PI48uMxMuVrj
 4jsOcHWxHyPsGKpPBr7mNXHTergGCI6M+38qjni+ZA9SYKH7ahWTraf9Cwm9M2B5gADe1Wuu0Eq
 zX39ayp3D5xgl2jFXtQ==
X-Proofpoint-ORIG-GUID: m8ND7yfHLZh1y3Il9mqvd_tLl4_hTILW
X-Proofpoint-GUID: m8ND7yfHLZh1y3Il9mqvd_tLl4_hTILW
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm8903.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
> index 320d7737699d..156e1e24a388 100644
> --- a/sound/soc/codecs/wm8903.c
> +++ b/sound/soc/codecs/wm8903.c
> @@ -14,6 +14,7 @@
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/init.h>
> +#include <linux/cleanup.h>
>   #include <linux/completion.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/driver.h>
> @@ -458,22 +459,20 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
>   	unsigned int deemph = ucontrol->value.integer.value[0];
> -	int ret = 0;
>   
>   	if (deemph > 1)
>   		return -EINVAL;
>   
> -	mutex_lock(&wm8903->lock);
> +	guard(mutex)(&wm8903->lock);
>   	if (wm8903->deemph != deemph) {
>   		wm8903->deemph = deemph;
>   
>   		wm8903_set_deemph(component);
>   
> -		ret = 1;
> +		return 1;
>   	}
> -	mutex_unlock(&wm8903->lock);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   /* ALSA can only do steps of .01dB */

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
