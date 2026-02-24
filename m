Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D556376BCA
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927967; cv=none; b=XSzrL0ctJCgPJdmgW4L1+YzLL42zC7ps/9UvjKvlrjaLG91SP4Hf9KrB58CM/Ddak9COO7E67yBZAU2zbm5jjlza5mJyogHN8Qu9bzW6Wit1HZ+jeqYfi4sXwGSSHLPuQNleziq3V0zllR8IM0tV0oIwhYFVsywA/p+GzHId3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927967; c=relaxed/simple;
	bh=FCMRXZR8SAuy+rR/oG39tLfH/1KCNmdkdQtzyJsu8Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1RnI+j5OpcBl4VF2KFxGwSehMNGpBDh0ttZpaozo4VnRuyLqU5d5v5Y+HaXEbBEZPKyXc/kde78kEv9qFa9IfYrXWC+Vi07oCSgyC2EZKpPEy7n5tZ5tvAfM82mYo9YYjyaSFlMkFpHOvR09GO0GxlzmfTXq7nGCcKWL17wQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMsXfLAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgzXG40l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMsXfLAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgzXG40l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sewa2727329
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 10:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zUFJH/jB3soteowiXuTedDU0sM6XkQn3T2X92OyF00=; b=MMsXfLAZE5ynACpp
	FWhZxfOch8YxVJDeYcSsHfthQw5oo/DhMEoqBTJwY99Pk8tMduRE+meYw5fTfkgo
	2w+Giycozlkcg1CeqPpjcBSqsNUlGHK4z/5as6cG3Z4CRgPKJ4KKK4h1Hs7qnRs9
	W+w358ncbTbBZnmstNNc7CzuqJ5i/jwrhgOEBwstJ0VETln0wmTIOEFY2N9+0CH4
	PvGUNYt12JFPTyIJKGVCR2tHeO3spDyFNDULWJNH/dQwl5cT44LMWpwCCcGqPTq0
	rfx9UFwvIB0MXJ04okXrCc4LEzvvNue20bY02TjRHE8lrszsfM2/eUvmhZVLJUvL
	trqH1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69k9tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 10:12:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89545f12461so51341656d6.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927964; x=1772532764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zUFJH/jB3soteowiXuTedDU0sM6XkQn3T2X92OyF00=;
        b=bgzXG40lX6xeziXyfMHgZdN46GtdVH9ZN5Mg5PVZqS73VWneANFw5/Wa7JXOEhpeYP
         Gmz1XZ+omAC5IRqv51shOD782oRS/BPUxu2BCUq7unUO3/X6v//P7Vl9jQTyjh5UB4wY
         yrsxET4W3uIjqR2MUp3XW3C0igeD8BNie1kq1UigJZqfFRaiGoKS/oJcfveK7iVxEgZk
         ZQyiTgdNf85wMnf+rXpt6RbXA7kkdNSWswCNTvtxEl4ITF7tRucINBe07uCbma0BgAaf
         Uj7010GUBRTTQ2O/P1+5vqyw4M0oVN5eJuB2V4BTFyaMFRhVQm7HkwbgE+TqInPc1RuT
         uZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927964; x=1772532764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zUFJH/jB3soteowiXuTedDU0sM6XkQn3T2X92OyF00=;
        b=QMOkCKYnw1aGp9LyLEyjQRjq7zB1SJ7+qEaatk8IHFXxpw/JIWw+aFElyNQQroYEbA
         3zJxvs6t1oQFnWIv2WWry3iYKSl9JqPJtCr+RsRWVUQWuHMbSA9r3q9SJXfdfxjyL9wb
         imeBtWgRm2/Vb6bUqv23StcHYsBQ7lU0sW/7XqyydGYMJ63AZ3zdixieXyjpQWXxcUbO
         MXKCTf9Qljtr1T2ZD98lh7U4n19H2q8xCLzoBOVl17Vxy0ehsZCMfLkdkujQQnv4wDjl
         tJtJxBhqKamCwHbRi4DVjGquA7sssPGA+xVzT5qxe+Un3K3n7VRT0ioOMEV/7LQoxOaI
         gS9A==
X-Forwarded-Encrypted: i=1; AJvYcCVZuOARCN2RrytAixGWzAncowXc4gV99hOGqrh8TAlK9qKQWbwm/NM/uyAXwWpOThwvjGXqHCzruuSwJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2+U4POXjWFRr44Tb+Tw4IIS3VMGFvFzkYHDAYWeKY5K75BEDx
	SYYhiIJBF8LJRm6g8FZ9+o1x9CVNXx+y1qb3y7DGLlgP0eCHdwAWnFerPX6Nd07pmCjb2TK9S/8
	OufgWFyKcWuBtU3f6CJXuWY3hfqqnQFJ2tEWUIzjE5hi+8SOLfytiWjK0o2cyO3awAw==
X-Gm-Gg: ATEYQzxoPFXfDBy4Cb9ryESBxOTNhKSe07PFUm1pZ270RLDh5iu8ueuL4/jBEYO4tXq
	X8ntV6YlEKgUQN3mJcHxGp8Z/M7o0QZ7ndEDPIYDC8W+pKXfRpVZucxVT6nXFvfT4bhOIMAHgXU
	PaqR+WNSDg+Cft6FYgTeUkqa0vBqzEGH2E18/3oMQK17wdB+66H7j/8BW4XXHkfnqJlNZEGDxgj
	AWd5NXRWTPbzQ3an/R9D//CEV/RHA2Sbq0nPHjZVjnHPhVHt+UZ29Tqi8C4csJoDMCBYOL9f79/
	D0Ebf4GV0KrOwJBDZjpZVRnUbc0WGkIgQEJpUSbX25wSgeZSEW5CsOUI0yrzhfn2rZgRgRAJ8rY
	x0vI+1tQ1BqxcPcBYPBBY0XnI5WlRPsQ1m1OP20nDuRKce3QIiHKxiSm2DC3bAy8fYWwl//CZ+b
	suPXg=
X-Received: by 2002:a05:6214:8095:b0:895:4919:f536 with SMTP id 6a1803df08f44-89979dbc49bmr120768146d6.3.1771927963619;
        Tue, 24 Feb 2026 02:12:43 -0800 (PST)
X-Received: by 2002:a05:6214:8095:b0:895:4919:f536 with SMTP id 6a1803df08f44-89979dbc49bmr120767896d6.3.1771927963147;
        Tue, 24 Feb 2026 02:12:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4be53sm411811166b.31.2026.02.24.02.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 02:12:42 -0800 (PST)
Message-ID: <c6ceab84-899d-476a-b2d8-e57028cc91dd@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error
 message
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d799c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gJfCF8_cG8V4FlLix1QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: X78QRaJV1mRtzLHepZkKMa-yn1Ze588S
X-Proofpoint-GUID: X78QRaJV1mRtzLHepZkKMa-yn1Ze588S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NCBTYWx0ZWRfX4NnzR1xWcBmk
 vCWuFai1lrktBkRkLt5kiPeMuyOP+cwOk5wWsUFQ3PEZhcJxkpJXt9hp1B+VzQoD+5koqBdcHKJ
 Ws6s8oF6IRyII5RaFmsCEvjvl5GR5d+EiG4PRHN5Ylfm8WtFZZytYegkVRWAvTcSSsR4tiWIyPQ
 3bBtvv+whXfZU6/dmS45LWlG8ktQhJtk8ZZ44Ma410y2bBjC4VRHt+LNdMbf0tbhtfTpQv61pd9
 B+Hz9D1EFu0FK2uLh6YkoD5xLGvgpSS5lsGIY4qVirACjkbH2m5KvaTA4UNdo/79xFIDcYzuW7z
 zgvnYmxm55zE0B3nMgic6XpObnSvDt2tcQONmLG7upS0IqiZVDRJfuV3bMIASgYtdymn19cqu3Y
 blZ/h26VtpyptaGoHd7MgenZ/HkJcqbyFdSjcF/QaB5KDWxeyy0MJF6QXeezz0oxzDKqmFFvZgl
 0GQMLve00M7o0GgVbZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240084

On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
> Fix the error message to reflect the actual graph stop error
> instead of graph close error.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index f68d4b4974f3..fc246485e326 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
>  		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
>  		dai_data->is_port_started[dai->id] = false;
>  		if (rc < 0)
> -			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
> +			dev_err(dai->dev, "fail to stop APM port (%d)\n", rc);

Might also make it "failed" while at it?

Konrad
