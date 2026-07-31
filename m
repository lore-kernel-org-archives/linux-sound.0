Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E1A3368A4
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479954; cv=none; b=sxV/xwElh20J9D2GVt5rK1OIUXJC/TJMNIfNxOSgDyZFfgdtRvDcEnG1a67OpL3EsoxREMQ/OBh5ye3Gn5g8mHu5JtyBsiy7wCD56kMgdOMWHEc9AFwxgjRZ6W42CPlxYN9r4YuCJFAj7Q+/oRtg7YOIx3PN1Qeruq/+uegDjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479954; c=relaxed/simple;
	bh=dzXPuigJKDq05vtZ6kmB6aNM71ADmAHU+SfKcGsdBS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDLHF+BSNPgS65dCC1ApX4DUHUGzknDJ3gM4YTXCrngC0wbYlXQqS7N4idu/De21VTgBebcqQsTurlsuQzvsHP8N76c8pBoMPsWh24jVYiDHxYN7gwvIVbFHnPrv7XvpCPd4+2gljTao1+6zjukP5d3RdIiwwl6RUlgdkzUfyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVAe25SX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bf5Xd7Wz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVAe25SX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bf5Xd7Wz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67COp144284
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXeqp7Fs4lSWqrJZAhIc8E6VRew/LQY1P+vEekrjqfM=; b=VVAe25SX7C+EqKvy
	YfRCAKLbkk3ENsM8KkwjNGBA6KIb0xabL/GJf3Nw+RcJTbvNxiv6wBcK9iqSqQn5
	Fl+jAv/ZZxucMpYIyLgFAfKztDsssKfK5a2PDVnIZfhss2RZUYgJso/1d559rWYf
	csMQXnRYqMhYIz5dWy6r886+xCVyW8KBkp+/VGIeIXBftVGEhnGmmCrPIR4txSPY
	UUp+VmcuJWHjUYbXbqzM4nXcP5bdK0h4YDFgfGq7dN8BzTIl0TAMnx4Mrfnjwzcd
	TdbVxFByZwofvaaX3d1ROsrk/08ObzSYRAmolBJ53Z4v3+UQnhkf65rSHX8wwayd
	5dDY3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5k03tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:39:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so10987281cf.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785479951; x=1786084751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXeqp7Fs4lSWqrJZAhIc8E6VRew/LQY1P+vEekrjqfM=;
        b=Bf5Xd7Wz8MExErMw60JpPZrbKyWRIC6QvgUo4akpiOhY+AeOBzZhxiS9cg+mA+Z0Le
         +fjd9H0faKCr3LMuctUvYT5gdRDgRXz3AmEYXRhz3dpC0K2lIKJv4lHUWLNS0miUMApH
         9tY01fLQCAfu7RZpBYKqOe2ZAwxmiCp9iMDWGZT2Ww04TS/3c8MkfmKlJoG9ouxs2p8N
         GED+k7wgAMMcD3ldVJBs2f3Gj/IJOapBx+s8KDgKCg72n8xovgFNztTHZtfjTf33Q8A9
         rHthhoJf79PiNr6qoDn4l97LVaHaOZ+wolk2tNhzB+2xbN8Icnv0R14uAjyZFaati7RQ
         Ejiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479951; x=1786084751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXeqp7Fs4lSWqrJZAhIc8E6VRew/LQY1P+vEekrjqfM=;
        b=YSFzvLq2A6WScbyVuhP2NAV14sd7GUrPxB4JFsi1SBk0YXwJT7+ygJZUBdxq+rbnFF
         kj63ohQcPKkn+HkE/HFh0WGu91wW4xRBi1LjFv1pYPrDw+BXH4WTcTtTpgdCi4cjIOsD
         ppXhO2O/oX4Ouo616EZGpD6FjRvxsq3LQs3bGBcent9t1HMuHS+pfJUjLYYV4d+8a3Lm
         s4HpyM2Q4bs7Wzdq2FntGtqOOBGFCsGXqUq89/6riPNXXqX+TmoyWcDG76+IlT1uiCfV
         O03HxKesi8p3swy8AtRomLsogJBN41rB/UboRF5qP1OmAyb9+9Cc/FBb+oRrnsndkwe4
         Cvcw==
X-Forwarded-Encrypted: i=1; AHgh+RpUQdixH15ts2CNNQgrmRkkyoZvQLseDtXsar509oIbqXGcKxN+6wmihewMX7epyTDNLFUVhnMd+wwrVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mrZBGVGDMsycGENyoUvTyVxfdt3hsfSo5Fm/je7t0niSCtnw
	wzLDmnVcAl2ZLPsrQ1wgI60VNc1gpHQ3HcnfaBWD1SYUO7tx5hi+dKDRSmmEZq1OS9nnBACxTVl
	jQBmUqUNe9kBwxWmecAgrq/LceghWvQ8PwY7LeDA4HtMSQoo5aVRjWfSkT/sRR/cmOQ==
X-Gm-Gg: AR+sD13e7cDRIIrTmq7xcdD9snrQ6ISD7nPBMzkY50MwYpaOIKfwNnarfoJugojxB7k
	lFEqcKQV2L+S8kM4gdKhk8KLQTQNTYhz9RLh3tLnWPIPjbcXe2SxMXZiySffv1Pf+8jo1pgI1do
	TKpqN63Ot2VVBL+JydqpK1fdSORaSVqoh9IWu4Rfwgxk1uR5OOhgYjs/weKNPxSaAVci+cSsVDe
	W+LZPpIEY9f3edjECqONwVcXbXzG6aWiWNPDDdYA42tfqPmFLCTg33uHJg+iCbudjmoMdhFlgFo
	yfo/NjknYmIplwalZGOZt4N0u1SBXW1+UhoI8el0nijt7Yh8cPBhyaiXEQwo09z2JORG74dCbnG
	LKsiQFZQHgfeCYQaDQW+k3ZhautI=
X-Received: by 2002:a05:622a:14d:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b4afd3c8bmr9146451cf.36.1785479951441;
        Thu, 30 Jul 2026 23:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b4afd3c8bmr9146141cf.36.1785479951008;
        Thu, 30 Jul 2026 23:39:11 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fd44ebf2esm29163866b.44.2026.07.30.23.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:39:09 -0700 (PDT)
Message-ID: <e3b71718-e671-4762-b9df-58edb73d6184@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:39:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/15] ASoC: qdsp6: common: support headphone jacks
 connected to lpi mi2s
To: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-11-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260730174353.108023-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L7stheT8 c=1 sm=1 tr=0 ts=6a6c4310 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dOMXe4oPGlYktJp97LwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 2wEB-9D_uvyqkhJiHnBTQ_lSBeONbUuT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXwRfG8IvqJuyu
 G0/LpzpB93c1F3kzt6X+SUP1ao2kGtDUbqfNwNMTeJgYSpwplkVabdeupjPE+uRD5TKRAu4anZm
 y2qPRKAXmozwZLwpEmO0djnTzz6nu+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX5+CfZmHokjbU
 Y27v2wXgpwJ47wgJpehtEuImWqNOL0Sqvc2M1ZngNGS0bny1UOpAtuGVuivbjgjaAmY80WjFbCY
 qtebEiuUXSEgZSZhIZL+jqWsHTBlm7ARZgL7+Q0haxDs5XJ0igUilZDbApMLb9SpyuR9VNYH+jh
 zrMKcQwXICmMoLmm/6B1+RQyeYfguxp9QGClI5UAh7vDVhtbI01Len5XO+y31kBHCi7bjtKM4lW
 so8v9R/UzRkepWtjIt1xRMxijYX1fO2RWiUp+L0urZaBfa/QW0dlyR7+r+pR+dw3pQREDRWukWG
 Iu8YDfNjdXlVBzxU8WB59GiEJWlWWAwoslKuLtt/bC5qFXERfFrxNGrNQvsbnKW3pRzuXH4OLZL
 rGIKcBHuzARUhl8kcuSEUjiZU2ofcMaCCMZGxvJ/jC4cud/ndGxquelCkgsbDiaWPUV1+Q4T9yj
 aykfgqVpttx/rFaX0aQ==
X-Proofpoint-ORIG-GUID: 2wEB-9D_uvyqkhJiHnBTQ_lSBeONbUuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045



On 7/30/26 6:43 PM, Richard Acayan wrote:
> On SDM660, LPI MI2S ports can be connected to a WCD codec which may
> support headphones. Register the headphone jack on codecs connected to
> the playback port, LPI_MI2S_RX_0.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
>  sound/soc/qcom/common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index edc4611691f7..b570d81583f2 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -215,6 +215,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  	}
>  
>  	switch (cpu_dai->id) {
> +	case LPI_MI2S_RX_0:
>  	case TX_CODEC_DMA_TX_0:
>  	case TX_CODEC_DMA_TX_1:
>  	case TX_CODEC_DMA_TX_2:

