Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A62F6937
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455951; cv=none; b=qVnDkRrNacoN88aLBYTlLktZNyAyGbdI6v5xBhrxtR3vbowCXIdadUrXc7rCbGJ+oOc3opvFBic2k6UbTFBzEZOlD/gmrR6qGKCDsn5ToHYCVks/onFR2tF+Mfx3io1jVbopP7sc79PHHjH5ET5qI2bcDZ3htdZ68vOxIYhLapg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455951; c=relaxed/simple;
	bh=DDF7P37GUvWF77NFQmoJPtnpWBxrXc6+qGMn0YAvKlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+CJsW2YUAN8ssnAHgoORYWtez1W+bHvc6JdgTDpzC6RaIqdjzkELwuI+0MTHWVZXXVfpe5WU3AICe+OsCHflWI7RoKlkfkeqPP0//mLrnH/0nti+FVUlfeTQxIut5D6VfApJRpxB5/MguR5Z6mmlxqv+pppHNyUJaImj0MeR6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJboHJmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imx9Y3Sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJboHJmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imx9Y3Sc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174SG4o2232103
	for <linux-sound@vger.kernel.org>; Sat, 7 Feb 2026 09:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YUonyW6a557wLmzLM1XA/ZQe
	RIm/x19FFkubBMJmca8=; b=KJboHJmwQtyQem8OlCKj0BQmLrJHRo9p0va/kWW/
	ZASWELckndJ+kYDeJPW5cUvHxCW5cq6XT6YtwSkD5NloQbYn6G+WlkZRYjeGp/eM
	5meIpeGjnDIzuwJixApOUhqMyn+W7lhfrGqUV20WthaL8ltavGQVzbrLCHBJLZon
	0hRv1TeIut628eTkHKt3rwrcgT/LeHEXlbo6KVjbOgxLAhLIev1tY8og3GFJ2WXJ
	K1vosSaPpw2X6YbKnGSynAijkMct67mt6Izal4N+d3+muvtuAN6HyXlum7ywZjT3
	dwyaKuZbOuBZQZdMeGMuTKZkp8qwtUU6CIZAaG2YbrI1bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xd0re5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 09:19:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so843362885a.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455949; x=1771060749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUonyW6a557wLmzLM1XA/ZQeRIm/x19FFkubBMJmca8=;
        b=imx9Y3ScYXGraYXX0zVE4wUSJXO58Sxf452RhoXtODZzfTcvsCQSNRuELMAQCuirDX
         ok99HV2NJhNIF5u7xE2RuwMCqaT7XPLHnpk29yGU013KeZfNellKuIPGohGeXoB48ZfY
         3a/L6L/BLY7yjL3Ol9WSyzNH+MJfeUvwPRjob7cQC9b7PCW+rbFbkQb/F7KtIDSNHh6T
         sQ7W+f32FzMw959FRQLyLKBD/cTdFXuuySDbPdxtuFjy4gFpGBZ0Kb9EuWBKEMSfGN/W
         a51W138qCmNZGcPZs2lYWbi4X7K+2yLX102P7Cjh+Z/D0f+MN2l5e2V5/DTrCrSt22pe
         +sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455949; x=1771060749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUonyW6a557wLmzLM1XA/ZQeRIm/x19FFkubBMJmca8=;
        b=UuT9zyHNO4NMDZlNx262xnbvpS5Y+/soNY09+v7tmAdDKemWLO0NDQ70pxKhDaWGvm
         vdN/YBk71opu7G5sp6zSbWLiXrL4umNdQDn2KpGr2VWsAj6X+TfwnArSAtr0xZGHevhg
         Rt4U5Q1SvR9ezyldsh1Xc7cfyf8T2RO20G5ENDUtjgrwjgig4F7Gaa65G8Qos8+h0zrj
         BMiNppUwsZH1uD723T1oc/kMBYMOtb9Pa/LyMw97PE8V+fcwdoaytOqdt3un5COxsria
         ybVnGVIMarmwUQBUslEfJE9SXNv7+/62qcn535mueQvCg8fNGZ9CvG95r0g/MkHJy7LZ
         tudQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEZ/lfQ4ffsXchRtbWX8zNlyLZ0lIHwlryPElHNRSsniLCOJYyMT2rhFAeB8/vv97EpRpfw1JQ0ehgDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/vxMMWF1vWj5nnHhBhdI0FX9dMp5NzEfccWfDrgAi88QN5qG
	IWGkjkXSaBlonQ5adTzxbuTYTlVa3fPX8lMJky8px4kxkODfvbHmaMEpkI+80Yk/ucAzGY96Hv3
	fWGFtO06m7SqCETHqJyZHIysCj5oKaPfb1vFloMMmGd8BVySeHcDMfCn4l5Be+Tpfkw==
X-Gm-Gg: AZuq6aLBB2RlTe6X2n0kv52oZ2wTdOS5e1UhbiIYv57SjfqyJ9WSrPdyyyBmqirCxbX
	GNBk3IjPBjlIsu1Ytif8j/C7sY63g6hJRxKcmq/o+iq/5JkzNX2dXrxVJHI2BeEfwxRLf5/rJtR
	u6pX4VuDIXPUtRxdC/fzZ2Z9tgYWrlZAqKdimgezGcHmi76tN0U3RllZV33FDRjZtUi8Jd35P24
	LJQzHy0v4rlCOXkP2ro5ZfDO7TN8QgiI0vgg3Jz2rFCotG4s9x1fsxYdXi8GBN6D/JH011PdmZn
	LH0kQHAjDyJn4s3OkepwMhHQy/gphiudDJjUH4HVlep2n6SP7RBe1P8mnA2awCcxQffu0emoU2h
	LzjW8CPly9SLDVPzSParOwtKfKfgx+8jR5rHV6avlZwK0BtIsdtAvzCsdR+I0npS8IxL0SsE1cF
	j5nkdEer4RqYSTfDQwi/0xMdU=
X-Received: by 2002:a05:620a:2982:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8caf15efe18mr649693085a.74.1770455949101;
        Sat, 07 Feb 2026 01:19:09 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8caf15efe18mr649691585a.74.1770455948662;
        Sat, 07 Feb 2026 01:19:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6e8fsm1179017e87.9.2026.02.07.01.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:19:08 -0800 (PST)
Date: Sat, 7 Feb 2026 11:19:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
Message-ID: <jloqgua3e2lub2daplqlie6fhrsxntwepfwoa5csxdababstib@lp7b2uy3jqos>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: h19NpPv4s95pGduYY5hQOwu54Xar1A7G
X-Proofpoint-ORIG-GUID: h19NpPv4s95pGduYY5hQOwu54Xar1A7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MiBTYWx0ZWRfX0XY+oXo4Xovx
 gv7jBSjLVBq3K1yeV2YcXYaHO2QMk4ozMnM5dEvKk3cRjsOszYGRYtH4xyZiloT3rA5ucCyj3Sh
 HXMSqsAmdXtQcwD4ioi/5ExXSaToWVTtEBLtZBoQjpND4A78dCZRMng373PQ0FiHFWzAGEuNUuG
 xgrI5AV7bTIprpT6ncSLq8eZEb/VKgbOPkzSYjqk1B3ir5dkYs66qRpQeE66LvyzOZCukPF1tJm
 On4omDYVMd/XkaFya0udsar56tnL9t93Q9nVJjjk9LBctzZbhVz5bJZFO5RhFiE+XG4N37EiKPn
 BR373RHchwif7jB7+xDvFRzkPFuo7UTBNc8D0VskJbpTBIAbxBtTIUZqx+FNODzTtKBAtVzSRhQ
 kLkLQH6J0PKpZMFkyvJhV1u31I082nyAlx20zNwYRon1GdKQeR89HpLlHwWLIGP2+7GtPChKxDl
 zg9xKlzx8lNDIkKbt+g==
X-Authority-Analysis: v=2.4 cv=F+Zat6hN c=1 sm=1 tr=0 ts=6987038d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=h-dCiIZhG8S0YCyILTQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070072

On Thu, Feb 05, 2026 at 12:14:07PM -0500, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Qualcomm platforms support the Senary MI2S interface for audio playback

What is Senary MI2S?

> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
> which are required for boards that utilize the Senary MI2S interface
> for audio routing.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 0febc641f351..715bcf1bccdd 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -150,7 +150,9 @@
>  #define	LPI_MI2S_TX_3		144
>  #define	LPI_MI2S_RX_4		145
>  #define	LPI_MI2S_TX_4		146
> -#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
> +#define	SENARY_MI2S_RX		147
> +#define	SENARY_MI2S_TX		148
> +#define	LPASS_MAX_PORT		(SENARY_MI2S_TX + 1)
>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>  #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
