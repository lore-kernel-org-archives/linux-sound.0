Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A72FF157
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817899; cv=none; b=qyN9LcetmfX86gPzvirc/9WIGQXPY05rIn4R/CySlGE433uciWAXD7KyUrzdFmocIGfyTA1441WxWfNv+KMhJ6fRPf5dIWHLh6EYWGEmuOaQFxSDQ4id7JZFl+442+x/OKu8vzo6iQZRfKrf6YVJFrMsYBIl8ZQEBoVDz6hvmsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817899; c=relaxed/simple;
	bh=3r+3aP9oEXGjarOxz+gcoeAHKeXuUgWKYwDy/xBY4E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ag5dAaFoL4tA3ii5MXVn2zCxuz+x7PlwOGvKV3lVDgm1gMLQ8N28KeA3JWJ/uaBl8QPHtIzB0YSVLcvXC1ReWbaRdBjpHE4NZiuw6xtjCN2ziFQ/sgPfCuRMbT9d6Hva+OIPI2grcxipPJjfn0KhSvcM8hW5TnQImpws0pqfPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAdgjWr2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAdgjWr2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AehmH030176
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv4hoRlbFBP5N7Upej1+05+LU+4LqfFdEDRxkF1OiEY=; b=YAdgjWr22TSmLYIj
	RYpu73v04tebNgf3SCDlDDdNgb8eP+wTz6lf1FCPytzZ9+iE+1LtnVF4v5i2Srna
	ZwyvDbVGjn9/e/Gnj3lyMc1nn0Ex46w6UoyLbW/fdwomP9R3KPJkOt19j0evxYEg
	0xgWrLRr2v8ZbNxIBbajnZeNOKRfUcuugLII/CtgD/Tg3m5an1N1SJi64tiewzto
	nwOs0h9nD1Jg9L3SdvuUj/ZxquwhM5lXp1UFkgwubG2ji03FbszQ5SRddjL2PVCV
	GFC6UvbklwKUD2boOzCjMPvTRvwoc6OyiZHT9QKTxxwV054nzfVBp0JLQd5XI1M6
	DnIdpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3nud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 12:58:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b33d08f681so4234531cf.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 05:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817895; x=1757422695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fv4hoRlbFBP5N7Upej1+05+LU+4LqfFdEDRxkF1OiEY=;
        b=ZoGvTEqxsyBza+WoCA9/++bhsBmFOGWdtSEoXkiu/8V3KwSS58k6tEkR199nT7sP5u
         9h7Dn/LjIwVeCYUNtviF8iUFS8hhryU0eaxa/bF7j0pZHVAiDBDZBdfFBilsDLRaHwZy
         hQbfENzs9MzrH+8O+EG/r5ct0bgYL5G1tasvhjrfCkvx+1oJelYgxfSfedeoU0TriE8V
         XJtaSWrycdLCqVyuG6kdZFAVUGif9hJfmCN5ra0etE/qodX9Pc/G6yxvRGBRTJVRVip6
         nDv0ibtdVcgci96owjgMXaeQuN+F4vHbPWBU7u6TK0SCgxjrvG+G0k3S+xVOAxafNjU+
         l9NQ==
X-Gm-Message-State: AOJu0YxeFQ5G9l07vzpDkZj08D7+RU9MLVR7LraiPeTofYHYqGpscBhy
	GWObCVnl2HXbBCljx6/jzMFoTA0E2468M5UuEQ3Ak77oRUw9NIY62TurxoS8TnvMfJz8M6TdK1J
	fi5Wb2lJDa93/SyAjDWkkyNEaEbVt/vLVa8CVXflRX9sh2lvmSG1FWS8Mpr7AP6x0MZ8IGE8C7A
	==
X-Gm-Gg: ASbGncumGLEWXhRIiJ+WPeCMpa28B+gQqYME1SFL28zeR+dRO7wHFIPzNvxqYCf0gUI
	du9S6HtENffXG9qPYlcg6l2QLD7m7C1m8R44mcBIlh+2dZ/bxuLKk9W7Zvrbqvc68yWIdnkr4+S
	DWaWK92fN3PZoSJPH1C3r8c88ulqDkExZZ9WWJvElgTXsnPyv/LGklW1DTzao2KPCitM4gDOgRn
	W7CwA6ZVYvUoP3gypf8YFq490s8sZTp0OuRBxnJP3ut3TsXPlQ2Exwa7esnTCzk7JX8EfCTE6wP
	9GxArIx3GTCS1speOBsjfIlJPZlB6KUySXFfOlyy6qF00j9ge+DNAELAv4w4nakSNED+st66Nai
	LrpzQw23buvsYTFfOs2Myjw==
X-Received: by 2002:ac8:5e06:0:b0:4b2:f5a8:21da with SMTP id d75a77b69052e-4b313e1a3c7mr117777861cf.5.1756817894930;
        Tue, 02 Sep 2025 05:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1r9Mg5tkUeoabmgdiEQYNKoD9WnuOlezMqzB73RvDFLxn/HEh6CHqvJYTSGP7PrdZTdhTMg==
X-Received: by 2002:ac8:5e06:0:b0:4b2:f5a8:21da with SMTP id d75a77b69052e-4b313e1a3c7mr117777571cf.5.1756817894336;
        Tue, 02 Sep 2025 05:58:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b044703f412sm245602866b.56.2025.09.02.05.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:58:13 -0700 (PDT)
Message-ID: <708dc6e4-1566-4c72-9f3a-a34f935ac247@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel map
 mixer control
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
References: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6e9e8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XdHql1rsSa6mdbwAZY4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sp7qX91kqM8T5e6yicWNmErLy8yLCC8w
X-Proofpoint-ORIG-GUID: sp7qX91kqM8T5e6yicWNmErLy8yLCC8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxwNWJ98B8lTf
 lcrqGkD2nnTDz90waGTps0vslmJ8BmZMc+YoQjVm3yBdmboP/Pcc3rylY5T48XPupYeb/Rs60XB
 JmsAjLmNM6TMH8dwr1vB8pRD50xFM9IbphR7K0B28Yaf6wbKabX/3GkYIEZ0cDj3CrwAucKX9CZ
 dM/OnvyT0/t6vhkhH0V7fICesHMGyhkxIzZgp0p9dJCqweMrcSPz/WTXmvPFIhs3dcuyO2P90QI
 CwAORW7U1B5EbVnIgeqZO/kbeCV68OuDn0gmA3FASj2WaUtKkR+DUcLSzKFx+1gz5Sw1cm7tuXM
 fV331lopFbAm3UjJCncuPyb6TYGjZAr02tR/KSNjHdO2bVyeQqY2cJizXHdg8DyyMOlCi1z9si4
 F6kUiu/E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/2/25 8:23 AM, Mohammad Rafi Shaik wrote:
> Introduce the channel map mixer control support for LPASS macro
> codec Digital Audio Interfaces (DAIs). The channel map mixer controls
> are required by APPS to configure usecase-specific audio routing and
> channel mapping.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]

> +int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
> +			       struct snd_soc_dai *dai, int dir)
> +{
> +	struct snd_pcm_chmap *info;
> +	int ret;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, dir, NULL,

double space after '='

Konrad
