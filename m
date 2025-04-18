Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD1253F0D
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019537; cv=none; b=scJ8U/lXjkl/o8gQDs9lwoImveA7JnPE6P1SyJeWOBJ6md1+1LxFQieN3RTdpOr1/1rHues1KIW7Sm4Pt7bpgrv5PSsryEkq/+i0q6Sp0gTMiLLfKwN9QuN/4COtPVWQWg0OoKQxURpzicRCc+OD3RVJwWAnRBXFdCs1ldRSdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019537; c=relaxed/simple;
	bh=I5j5xYO17jbmnQ0gR/BBkN5Uvu4UyzKV4HR73HhO6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdSbL/MMcWOUg4r4FBL+GRARPAC+zY3yZy1F2gCyaU2quemk82ajaLec5lk30i0QPwulhlOO3EhPmLNb0iGBjB+Pb47k/+ZKVBNxFprvCT2P1cTdD2TuWvRBf+TNg+RABF8dIsJhN4A7+rxpmlYm7GKkkVBLK4MpqKcr5ltmY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4EZ2wFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4EZ2wFJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IEqOoP013264
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wciFWuvgtL4Ulh5qb6h1BUFo
	x4HsWcmuuAzBT3oTGdA=; b=U4EZ2wFJ/IXOp+G2rtht3inGFgKv6wKZC5AfTqE8
	5TAmJt23VA1aLKjPO9Cxg60HbdKRw4rZzAT2QkFYtUmZknMxpx2BT+BnFJew/uVX
	raJ/d8nSin0+XfGlcqA/N1pwXpqCLCaiedf7R0ryMrSpK+ehK9GhjjPquYA/ywei
	XTtHA2AmVt/iAbtYetCbYbDto/I0kyTcgKhUpADVBwMOQced3j+d8Co7d15VZwUK
	LI00nAEDolKGe0HGyVkUwzMv1nYRT8IE6coKtiB9fwBJjML1MsmLtj5T04SDsGly
	tVE3I91/ty6CSbVvAVbzdoH5Llo6c5vAYokZrwtnXWa1nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvgfqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:38:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so199444185a.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 16:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019534; x=1745624334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wciFWuvgtL4Ulh5qb6h1BUFox4HsWcmuuAzBT3oTGdA=;
        b=nWIHaFZ22hzMUazVEytgN3b0dlzDlLHxpigIa96lRpm3gYjWwbkdSqaRoUTQdghJ7N
         TD3+7MtMtfHx8HTzN09e21KTCGkDSODVLD15clVIfbbNXa50z/shUL6Hj4ETgcj2dGix
         WcGia1k7XRbODX2Ipbn3vNEY7VlCahEGuKq1OAIHWr4Z7bg+QdoVfWLVT3PaJM05RkVc
         XdytQ7U4kK7FN3uXeMNA5NORPJTYhZPqpkztYEiWC40+cH/dM89RdQj2ku1aIs+eNqC2
         8rfDEukWvOtpDx5rCQy7E26bsDY3lgAj35Af46JBTG9KvytZD5KMW0teGpp5RdFuoSd7
         YhMw==
X-Forwarded-Encrypted: i=1; AJvYcCWqlhfYZQMjwbTA3pTNM5Amee2/mtAjsuqXfULfXEgKDtqLTwa3hMqyEdZFUmjL1nWsMcUntu2aTjbVGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPnv70JF2VxzdSiQRUBJnmDRfp0TpINsI71z29J9WdKVuhFqWo
	7zA3kZKGf0B8JzUFho3Lk1WKgvSINJemV7UfoNEsiWABLZPiU1Vlce5HjCr4zGLNvnxf0PUL96G
	xNT87caE+1t5bzx52yl0OXsbN97TmZni8mis43Yzm975U1AhA4ZJjF7moHVpxng==
X-Gm-Gg: ASbGncsvjUM4SI11yFKsm3/IipVhYpddoozs8eKK7CfNc37Z7mDAbE9x50kxFns1qS5
	podAmYv699LlAk5gegu0qEJIFbJnFJpKmP/E5SGlpzacADdGoIZJO2xu2aHmKjhPLKrPFdN/ZFU
	zngILXVceYBQnBbgTf6v18R2FOmCHS59jGE3NGHM+0HItw8Lf1CPVotwDTYsAAOjvFVluuwAEzQ
	uR9IQLYb8sQurt5U62Jq1z2D4nTrywI7gYI1KJr+NJ9CDtSJ9jr4ghAu2e07PTUmltzkzLWqfNl
	AdFEuTHH1uS5tt7xXPvWILDLmBJp331MmwYqlWaV9snZM2PxZcZcZ0Q20f1PLZGJ3A1WSuG0yg8
	=
X-Received: by 2002:a05:620a:171e:b0:7c5:592c:c27 with SMTP id af79cd13be357-7c927f780bfmr692143385a.21.1745019533972;
        Fri, 18 Apr 2025 16:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVrgxKsOjmu1LVyJH3BudONVoaeTL2rmWdYsEbRaxd23kHJQKLzttBmbHYfAyg7UYVaiWlyQ==
X-Received: by 2002:a05:620a:171e:b0:7c5:592c:c27 with SMTP id af79cd13be357-7c927f780bfmr692140485a.21.1745019533677;
        Fri, 18 Apr 2025 16:38:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e52482esm299915e87.1.2025.04.18.16.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:38:52 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:38:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <qtoavcwi5eloa53y5qfaasy45yv46keqcgy45d75rcgll5u5bb@2nwpdobcry26>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
X-Proofpoint-ORIG-GUID: U1sBbziNkZ5Tix1ho8PtHMLdIduuzEsZ
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802e28f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=3PxokYgOTNhXVQtrWI0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: U1sBbziNkZ5Tix1ho8PtHMLdIduuzEsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:44PM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index e920b413b762c803cfcc4049f35deba828275478..aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -25,6 +25,7 @@ struct sm8250_snd_data {
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
>  	bool usb_offload_jack_setup;
> +	struct snd_soc_jack dp_jack;
>  	bool jack_setup;
>  };
>  
> @@ -34,12 +35,17 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	int ret;
>  
> -	if (cpu_dai->id == USB_RX)
> -		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> -						      &data->usb_offload_jack_setup);
> -	else
> -		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> -	return ret;
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX:
> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
> +	case USB_RX:
> +		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> +						       &data->usb_offload_jack_setup);
> +	default:
> +		break;

I'd say, just move return qcom_snd_wcd_jack_setup here.

> +	}
> +
> +	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
