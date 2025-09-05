Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29D3112C7
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069211; cv=none; b=nojjZDnEAKEoxwpoPxFqBNgI4OhUIq1dZAfLs4FOLXTKhNpAydyqMPZnoppSSBvgWh50tm2kUDcwcvE33O8p3rVraApoSC30jGlfwalICEzDNfy+kRgjlbCJnfUHKZEaQadO7XdG1Vhcpl51W2xZd1b24K77yHBVfQkKoWO4zcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069211; c=relaxed/simple;
	bh=c69T0jgOkThTayMwwmAnD70UzymF4qdce1OqRpAydq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNecmAUVP735XH2rA4EUSeV4dSNnFEMnb/az5nDkjvkSrGJhME36Xto5GdAjY0YaQE0A0SDGScv0Z3PWwfy0fTx5iZjNlZN56NMUcMfMByN0T1EzhKWVeR8Ar6U1xS4NHGx5nNR6s5ZvYwgXrD2Z0hBmWKmPNjF0T0UMw2lPs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilQru3P+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilQru3P+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856iIwp022151
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBBHXfngENXI8mT61mc0Kv/t7nDhmuKG6UQNq3EaiCM=; b=ilQru3P+OYSzvG62
	9iH6ynLngfOSL60vYuKJ/LGgeVZvIoJ7QVUwQ6RUQnNBsxOiFJBlgMpp/M0gie2P
	TKVd665l3KcU4B6PRc+/fvs6e4Jkgyfm3rg8dh7mz2QcGr3aoGp5ck7mtaI9P768
	Mut43Zkyr7tLDvxqjdSsGMFN+Lfm4BFwDKJYKESs+Cr9CT8Dq20UxSgiGaItZuOj
	p4UOmz0QTRy4f6UHqXofmyUXo9KMrD0xK3HJomAlX6eFaSGB1+L7f0T7H43agNhS
	28PNKUR9vUC2iVVWydQ2iN+Titn4VSJbta+32o8ixnR5MhkXskrIvXSU2k07Ybbo
	VXcGAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9apxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:46:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b34c87dad0so44164541cf.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069207; x=1757674007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBBHXfngENXI8mT61mc0Kv/t7nDhmuKG6UQNq3EaiCM=;
        b=bPd96jQGtClRuX4w6S7yZjLqtkI4CLTNqVmQtlu6nbeVIuue559bYEsd1peOjXSH7y
         jMzuyrsKKkT1wTKO7ZuwYJ+EjAzxLEnfdGuXNSpuOZX4Q9h76FwdJpt0/pcX4KnD3nSV
         nK658hncAR5QkChMic5vQIDMSDJwXXZVAlUytU/rlKQ/J6nSGB5uCm7ZNcwHBSJR3bBJ
         Y2CumjvSsbumgOnkU47D1+bIKVGHwV4ii6PSsI49eloRNEL/422VW5ir4+LeSVZtqrIW
         fLr2AeLjxY3tu/Fr1NbsNs79NG0gK5ExEWSISKvweFvxm99mCTPSfaWyFSJslR7VeA1Z
         IubQ==
X-Gm-Message-State: AOJu0Yzxii5HT2X58FTVnXC6OVXQcK1TlWQp9a8Wer0odgsauz77NcHp
	gUs44lHS15VG+8WgPzP9tkoA0utjoDpgd/ckL91dH4hchhAjqmDoJzVjh/DQMwi0BQTKZ/mPFD3
	L2ZlGEtMeNxMbBtmK6jWk9yx4BWKGsYT8rK7pTC1IkcRHI60qTtp8cuW1qUjL8m3TjQ==
X-Gm-Gg: ASbGncsYhS0Z70JZptZOIQVBDsacfmiXmr8x+sXW4HYHqrEkQoUpM4Hgl1ROQAed/Cg
	lAi8lxfpFcbJTwuacIT+tIcq1uDdg+NFJTIZj920gu2E2v1O1qfLkLlplTPl27w5tMWj3n64Ca6
	echk3x6uOrnmYT5L4yFpTHvuAsrTrhfokOg8v7Ecy9FV2bVJpqXAawQPBN/jvduY13VuI8faZrZ
	oqxkjzblf6KbysHfMnTuW9zM/ZaTmKkYHZRW5uXkFWBsTVh8DWoLlenVBEZZb5pk/jFF3a5wBkQ
	muEhYhDmMPcBoBnghC0MDZsD2XpDeKZ8Q947v71MjwYietroi8GTjoOCRav0w/zTqK4=
X-Received: by 2002:a05:622a:1984:b0:4b4:95f9:ada3 with SMTP id d75a77b69052e-4b49608f3a5mr86730851cf.60.1757069207450;
        Fri, 05 Sep 2025 03:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQqj6dB7alP5gAR2caFRsDZXzAkiYd+2/yrt4ytCgTJNhHVzYvVg/u/9CJtN/0NcPaN0ITOg==
X-Received: by 2002:a05:622a:1984:b0:4b4:95f9:ada3 with SMTP id d75a77b69052e-4b49608f3a5mr86730591cf.60.1757069206953;
        Fri, 05 Sep 2025 03:46:46 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm359312055e9.5.2025.09.05.03.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:46:46 -0700 (PDT)
Message-ID: <a9eae2e3-0e75-4ffb-9de1-3b8a9bce86a6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: qcom: audioreach: Fix lpaif_type
 configuration for the I2S interface
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1ddU_a9zxLjbK_Octe4wU9VCmy1dse1_
X-Proofpoint-ORIG-GUID: 1ddU_a9zxLjbK_Octe4wU9VCmy1dse1_
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68babf98 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mFzK8rC3iHN2mybPfuwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX/ps2CN3hVZMB
 y0sej8qINMv71pAx6ZyVpCFUZp2vNV+aYvPoQ197l0avABa2Y6Juy/0YQ0huSy8Edj9o1stZbhk
 OTlEXJd25IDIQE/4ERDvzqEsGW3zdqFGnGduFi/ZwAKvbX9NQY2yZZEfwrc4QRBKr5y2z2dLiFY
 SbdEO5oGUUJZZ1gzpWRpRgK+/kEG2H2ypnYlJ6XiuvXjkT2KQd0v/5+3v9/TbJOgxzb3EIWVUiH
 Kai40JjAWevbWX7/8w7V3RJTCtqkJQEARIymHWOAJXgtQDR4FPeWvBK/OgAExFv3MP2zusN5ASK
 mY9hEmmVgn+XnkdKs+ZWc+KR4PTEhYywk3+ssaCOgytBkMu63RVwRyj6oVuvF64rSxeOhPQ9kwf
 Jh3PHmM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
> Fix missing lpaif_type configuration for the I2S interface.
> The proper lpaif interface type required to allow DSP to vote
> appropriate clock setting for I2S interface.
> 
> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")

CC stable tag is missing.

--srini
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index bbfd51db8797..be21d5f6af8a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>  	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>  	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>  
> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>  	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>  	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>  

