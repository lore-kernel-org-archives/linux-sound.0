Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966F201103
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205018; cv=none; b=KmElz6K3Jx3yNOPMUi7q+FD9N71XwsgLvrcpJa1FDjDvbtPViKE8/co2PZ0LKC17t465ezcHzG6xv1Pm/QeltzJd0tJQndE7fc6X/Kb27Ck0AGzHhGoh9s6GX7Ls36OYrS5JM9DWr7W5REOJfabcaU8NXarLkZ1Wt56I8944p0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205018; c=relaxed/simple;
	bh=t6oieiC6PkmHUBT5J/m/ariSEMtMKZPl7YTPtb1Qy+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgnEffVTmKbZ3+g5K383olWghujs1jDjem+qkj3pJeSc91+fXE1rSuLorzHOUgFw2f58tqACSQiYoaK2/Bst0fgi1Ro3nv9/ibj/xTOMdy6howwrVblbzu79f2ZyvAgBd9xLgi9VgwTxt63lI1ngCWeBUCRErFf+f7ebNjCS9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODUBxBGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODUBxBGC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1uJfl000839
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=; b=ODUBxBGC3ip4iDDR
	qArtlQ7am/X45/1LBoNrBWnK6VRqXHKfPncnRFigXBAG6d4mfQJaTMHu09duID8C
	qNFrL0A0+n28pd5X3ynfKJIVjOaJ7z3m5yrEloSiUecOrm3otoBJuSVQS2S2wyTD
	E5DSypKc3cxiGgWB2DNOrNYYVE+zPpHLkocgDKadNoc290V+JFExWLGjOnES8FRt
	Yeu0y+mQoGjmcEgLesJdOAov1Hl5ki6SKEDa2Td7T03w6V2ltAwA8HBxIW53k4Sh
	Ndlv8176VxptKF1xb5cnLe57g3qXX93y/ECF02ewYMWYVqWcxRwHWvqES91pnsme
	t5C5iQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr9nss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 06:43:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so2114787685a.3
        for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205014; x=1747809814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=;
        b=iFBSmDnDXIozWk05DIOhm+pdB5oXowPp9iWSHX0/jpalodF3N0zfloJVV/rrBWF8XB
         eW0wtUHpJfW9rRjS9chAyFH79g1SHHjz+e/WTwJH1rlW3QNBn37zAAuFveZbmywTcQhJ
         P8Ie6i9YlZ6xB23ohW0BhYj3i/dmbH2kayLcvicVKCN8w1T5aaRe7harYX9Qhykvs+ew
         JjubGI/8mooEyZlqmxPnKMQLW/MchBdtKqs7xhETOG3JOrh0VqggXMI7TmZ8ju+JZJ+w
         yPsVdIvCAroDh/gxkjQ0z7RUfhZqRsIefDw7nCOuKpNOxj+nYEbXWXzdQTq0Wiwpupfh
         pFvA==
X-Forwarded-Encrypted: i=1; AJvYcCU+xDil7Nf33FoRH1CwkZCy51fZSXtREjhMsHJEELALy0vjIIKhC5/tSxUcqW/xVie6rF0aL8Lj0ZedxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJTqhZeH9yZEG727b9/vMH50yzbWG6nm8W9IX8F/pxK5KBGgc
	kgU8enUnh+eKnO3OJx1zrdmrA0+8mZSJKgu/5x5U/uu6OQEtJEE60X1zBYuc/zu+RiioqTK/GTI
	Cz0ZS740c6gXffxerv/Hwr77S+KMF5s9q9Gk9NH3hfvjFrwocz3e8ktjvJcl8Rw==
X-Gm-Gg: ASbGncs4ypKpvuMiAnBMQv7XY8ssxeoL28D/9Ju9XL7+DwX4Ju/V+CmSyscq/FSEI6M
	5TLdzgwFgdPQSkBfwff3/2SHoHHxlfRueMR2YI2npw0XHYquJiQx03GZUwX7WS5kLGTqTxVBqff
	zyEFK328tJIp+qoz4WeW6UVXOxaIHMq8Hvszt7iK0qQipvGSpLv1wMmnkS8GotNOGhnR7CtbVHw
	9vYJp8Yewt5w/7xGkm6kYItiEsg5+Ve0bp3EL158sArJaR6Hq/aeNjj265kJC+D1X6XcLkSNLuA
	jWwjh7z0ZT7yBSTn3Dejuex1jXY7ZET80nzNPUKNn9np9bNlk/SUdcDuOj1qJQ==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287542385a.29.1747205014585;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCYe0F7XxHWYbhu7NVkdrepacB2uWQjdlsK87LfnyU0uT99TRX1IkmjHkIXO+a5nsoJ1a2jw==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287539785a.29.1747205014272;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm18334688f8f.5.2025.05.13.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:43:33 -0700 (PDT)
Message-ID: <bd36e7e3-480a-4876-98b9-73af8298ff50@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:43:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iSZe_O5VDZ3rnDT4zcqx-IR3lkgrGMF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX9siMNmE82aWj
 VHs9n4/NmdeC6ux8NU2UiyuGpRfvnnNFQs37M1jpe+R++h2Z2Gxg5DlFdU9sIAoMIYcaTx29dWN
 09qQNWjIeJ/avBiu5ejzDSf1asu5xKT9knH1NateBH782zBprNapmuSZ7F8ccrFHh9by6/w7akZ
 2uIC7dtO9/7hYOlJJl5OBkyxpPgkXxd6ReRQcFrrj3ATQWwE5WXGwjnGBpKlX5zDaNv1MJ03ltu
 yOgZSBZj4yFgDbyw+axkpva3v3qtGEJnA+Kf5UTIRxA7I9rTeFGivF2HR0tx1bY5P3ik6t8t4By
 n4FGkTJFwY7E41Vn4AX5kn2Po9BWhrnZmkXQ5k82dsLU17eShxtNPVGESKZ4G97Aaj6KlZ4ZBej
 7H/WmghHmH2vNV3rYkWtQB45tI6R5xLqTkE3kEJ9LrjOVPnhsYxlz7n/M6zPQsEAw+V0Trpu
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68243b97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=uaetQlgIYQjjGCg3SJwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: iSZe_O5VDZ3rnDT4zcqx-IR3lkgrGMF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
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
> @@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	int ret;
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
> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +	}
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 

