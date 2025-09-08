Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6922E7F3A
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317392; cv=none; b=JdWH0GOlhEBB4dOiZzhIFDH1+C9KVZplPP3mmcxp7iHe04wj2U9mSsUj39+SDR5tlg/V7z5R4r54nODql0dZcgLw5ZxZ5RAhjl0Mq4qiSi9gxL34mxu5JOeHQoM4S0eV/2b9cHeIA40YQrs6tsaNmFHxgxsrSkmpuxwb6k4ruJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317392; c=relaxed/simple;
	bh=WYg45bgT0XRN0euq4QCobxp8IotvXOVZG3lh3FUmcVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhxM5GgLVQ6h8PZEIJuDelH1PNxeeWvjaiFBipX/UlZdmdjY0tNK822jeeX+1zd2o5BlgTdIzOtrWuri4uszZ1kf6jfcbUS9b91OeJjZUcUN0FftVEAXi0hNg+gQsx+3Mk2cAgT4aEBhd+hISf4lEVgyUu/9YJPEGMKcMSkPMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azhN1hsC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azhN1hsC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NOo87018353
	for <linux-sound@vger.kernel.org>; Mon, 8 Sep 2025 07:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1grmPgipKFGWJ92VbKgO7RBjzC/AoySVCE8pyMqTBpA=; b=azhN1hsCVGW3xN9R
	qqm2DukADn+E924Sqz/YT4jdrwM1TmQWOMC5Ve3I9HKQUqnt4uZznMwbqIp9GEWC
	A7ztNMDfXG2aR667ua+FQoVHEfwQ7TCwfalb85O3/KuGazvZXarDkIBXirZdMYw6
	EhBpVPTY0+cemuOTQxwBgPNYm8x9TXwK9dARAbaw2dGO/DHjPpbUv7w6vK1GGsvw
	ydQcZK8sgatnDoX1yCqNLOc0IjTMirkh2P8jjEp7ppwW2yS7L/ORf0GinaRrRFH7
	it0nG1ontF3vliJnH68uU8TFtmWbxiUwzCxok5kR6QrScto3geAbvjxHC7X46p5K
	GOXOTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8bph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 07:43:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7507804a7f7so4725006d6.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 00:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317387; x=1757922187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1grmPgipKFGWJ92VbKgO7RBjzC/AoySVCE8pyMqTBpA=;
        b=d140ACdddK7CYhskxrH/WbMzUE68LqW/ED/nHxi4J3FMIfZ1YTy+cLy2nM5IdAEImM
         7PsAOZhybw15EvmeI4Jme37jjp1GkLe+e5IObicIwKoluYSSkttRofWOkVK5IVgZXh//
         O/LyNPxeL5Un8DW1x05od+Ay8Zzxxbak/EomFnKEtOTh9TwoaXfJQ70WMwO1XT0uorDZ
         P9Cu/ZQneEFCoQSUlBl7R71a6rvwYjeEmaCpyQIjwEPxB0wzBKEx7Rvjm8uQeZ/eG4Xq
         r+AQmyy/B9Yn24z4eGJX1TwJ9Di9hRUp46E8duzIbLpJUnuVRGtCsCDQqKNHv5en5Viz
         B7ow==
X-Forwarded-Encrypted: i=1; AJvYcCVIkPcFUWf7FStpNOG+0X2tu+Ql73AjBJf4yf3ZrQht3WucU9UFndUPRwwlopvubutFzmVSA1UF0YlebA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdwgjfY6rpihJGHY9GSuwU4nEoObqxwY7OYckOVyMdUOxdM91Z
	ciy/QgLEkW9d19D2yyuQjNZWJh6oI6Uk/VMmuRsJuQ1TLxYP2eat4pCP32PSb2Gar6PXDPXKMJk
	cLEg453IytrfbejoYdbmU09Yo1YyOKcAfMT9hmpfMcUR07YEi/feM8fUcQAE69dtyow==
X-Gm-Gg: ASbGncv3AiQrFwKEnb/h9wmWSjJ6raaMe8CB91fiJ1TkcBP3uyyAF/PBvFBwVK8uH6G
	Pjf7tqfcWd5dIFqsxIebBKy00nFTihcHC1rp0PEKqHq7Ci5uTjvRCw+STuhz0Fy6SEATwYuvAR6
	fUwzpjQnH1xYRbIwaJTAmD5csqBC3hsKNGparUjHMMTUVrw+DEHBT8FmAXcxVfzRt+tZ4hEDe5u
	zbDXeRKuHL+RnLm88jrm+NdGByJ9dK2cA4kgK3lT2DhTQzyp8fqF5BXgUhDUjA3onoEfJGRYqso
	xSil6Xyrux19WRh5kKzwoogObZ1kx1OUxyqxp8BbpFPZpCF0f+YUTGt3pO11j7OKjmU=
X-Received: by 2002:a05:6214:ca6:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-72bbdcead63mr126284886d6.1.1757317387170;
        Mon, 08 Sep 2025 00:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgAcdbDq5zNfyipOZBWdCcXswZ41a9jDEPvBfo2g42KlKJ6RgThA5OuAMoeYELmzFt39Z6Gg==
X-Received: by 2002:a05:6214:ca6:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-72bbdcead63mr126284616d6.1.1757317386708;
        Mon, 08 Sep 2025 00:43:06 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45cb61377a7sm225190345e9.13.2025.09.08.00.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:43:06 -0700 (PDT)
Message-ID: <9842b149-0c39-4114-88dd-2fbd4423d077@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 08:43:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add support for QCS8300
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905142647.2566951-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905142647.2566951-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX0SvpN79rKtaF
 g/PD7IxrZikpCd1Q7YGHo93ROl37VCwwLmQQkuEILumK+EdEYqR5X/DEGTN58zjcWjXWC7E7qNI
 lxDj0A0tlM+GO+cNAMi3+TejW6N3FuojcqssrKsVo3zaonSaMPxaFFnJB/2H93pUl0AX795H8Uz
 ESk3CioGEAitabA6d0h0HfCwg2TDyJiX5W7WAO1awZLeO3ILx1/VHnRX6P6fw0fWuQYg1PDI2Bl
 l9i009cZsFiILVCYVvOt3obtu4kHb6cKyMSwykyrs5wTv3Xm6CHHGSNl7RyudUAdhRf2fq2kPTo
 Kaiu7eIJmTNSqvlbBLB/4rNURsQdAyPoT0Dck++7L1ghMKaURFGsSgc1d5WwBX1Onf6VXhdPPTX
 bULIsSqp
X-Proofpoint-ORIG-GUID: tvgZMCXswBxQOLIbI7EkH1s9k2D-fmYb
X-Proofpoint-GUID: tvgZMCXswBxQOLIbI7EkH1s9k2D-fmYb
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be890c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NPwD-xthdEbpHelLTGYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/5/25 3:26 PM, Mohammad Rafi Shaik wrote:
> Add compatible for sound card on Qualcomm QCS8300 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
>  sound/soc/qcom/sc8280xp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..c6aa62b1f66f 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -187,6 +187,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
>  	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
> +	{.compatible = "qcom,qcs8300-sndcard", "qcs8300"},
>  	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
>  	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},

