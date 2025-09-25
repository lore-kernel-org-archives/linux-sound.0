Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8982E6CA2
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 02:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769173; cv=none; b=rLRU9ve1fgB/jsJ4hxTps2og+t2GunwGFyUWhLKYoY7c3YS/oW0Es8CrcPc1fsJQOIpsQa2O0XK9ZO1+dIhZgpNV9mmSnqTfdOBovSoXhFnrQkUY8tDRXoY6bKWOYbKY4iC5+FvXxdjZY5n3ZB5jVYpl3km9SasLpCj93raVMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769173; c=relaxed/simple;
	bh=gWp+RwukaHXXQOdYQ68gcT6pxRzuW8r0v6Od5sh551w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjiomiM5aL+j39yotwEjLR2Vx4wQbfxL9InTD/5DNxGtMGH95HG9avemNv57nwEEbeqEqFBVcellIC7vPsWYojFHYJiQ3qY1zai7dG9rQ8l5IPa6eNlAMoPUbGjlL19D/WS1GhCeplEJ3ELynY66eK+3nPhSJsuDEMsNI4oVWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYh8zZdb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYh8zZdb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONanqm027774
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 02:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KUkSZrEB+7wwDzk+xOPFFNAq
	wUcknZyQi2qYnntju00=; b=hYh8zZdbVDFXMYczFtJMbxYdsxLlUZcdvGF3pBgJ
	VR7KtARJOu4YQOfC6VikKMumYVzwdIQfAXqIrYakbSc0jkCWNRJojipltMVyPgTg
	osG/2z9n+wRlyhQetruurCd0mnSf2WQT0YTjZvJpa7AONpZKshCZAaGQICt6W3uX
	EhTgbjHo8rAaQ9iTzAqJSVRM84W5A4hhM+o3Zx/QMD0ko7uKGMwu3PSUgerlJi63
	WWqr6dMDDXP1ngLH6LL8KYVX4mkJ5PSTbUiZqt7/0veMGuYl7HHDYIDdU+ImTlsu
	T7PDZmOaymH96DLUmfUGpWhAhymH6W+soaoU4BdFsVf7uQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxv9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 02:59:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78eb8a9d229so7368246d6.1
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 19:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769170; x=1759373970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUkSZrEB+7wwDzk+xOPFFNAqwUcknZyQi2qYnntju00=;
        b=oXrg5PXycKAU+wcaJl/jQx1/VV0ywYY9C71Do7Hf2uYvLfFcfW/muU8PIDK4tzhlrL
         a6BTUYJnphYxWCYSrA59yXrakmUZXpO2q39G0MUH53btvRYlrDrOgqfTvzPIC4BlirIy
         kSSnVfPt1spHIpYjG7LHlHxSQOK0ZxFwfn/PrODC+2KenbsLI6pCupxR9mG3MrFlkjhs
         RArc2uZV9eedppofIk9O3zEaVEp76CvqghNLe3bwFV88lZ/MbZGjkLBVfBW1lB0O9GOe
         aP6rqus4/6x2FBL0D5QIgQdJQ4Hvl9ekFJWbxOuufgqewgnlEaL2SxZzBZWWyPwXxdtZ
         XYfw==
X-Forwarded-Encrypted: i=1; AJvYcCXZM8pZ+KBZJksvdGueJJCq9Yixsn3b8ijzu/TTczwHrSjz3KpgEDGkwK2hJs+y8rsWrvxmsgI6jtbxbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEBnOqnrKOigu1XtGp/3otQAs45FnwNNPJdgQZgyj8ivsUJJ3
	DYzn0yfgKKLBuZGd2Fa9qlLx1iTpWvwNQeYeNzsuF6RFDuTuD+VJpMhOZx7QAiYrRmYVCz0qNw9
	Ssfu93E0eQK3YXkijt5oPW3Nu3V8g3ODTp/U6H+edlbzMhYeGFGHw/Q4gvbwQhD67kQ==
X-Gm-Gg: ASbGncs1DDtvZv4gnID7+uNrwnDg/F6ldSZtMFlrwX7bWzhevqqN9ByR6j3DU6svJrZ
	Sf0mpdflfxL9gzcT1WJvyw7T9oLTWYNmPpqwPIv3fDBSjN+LxwoYXyDi36PtTGOlqAHwGTPbjMr
	i+eirn6cM83oK/gZ1eMRWfcwZJ5F1XC/o+ZsBYhfpSxi1fJz03KeLGPAYF+actS556jiS3au+8d
	OND+RQw1GEvfi00fSHxOwG+fM9P80Mo0gQVbZ/GL0iV5EiZJR1hd1Zw2xOoOk9Jr5miwXAp8ad4
	RiDTC91sZ/+RAk9tDctSFhOVWbvxx1639AMdQhyuWVmz50oiErzXEJcWFe3Kw6GSQcg7Nw0awkc
	k0+ReBqYeh5ztxwCRwK1vdF1mjxIbXTlg5kAlK7zZAtIeVVSM8vn/
X-Received: by 2002:ac8:57c9:0:b0:4b5:de80:10f0 with SMTP id d75a77b69052e-4da4dcc498dmr26475061cf.69.1758769169494;
        Wed, 24 Sep 2025 19:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU2tPJev/yLAjKJPRsx1oGdBDYTwvY4oft/2UNElSiRbI6I5eMzUIs0+rpDewl6Pepf+DcQ==
X-Received: by 2002:ac8:57c9:0:b0:4b5:de80:10f0 with SMTP id d75a77b69052e-4da4dcc498dmr26474761cf.69.1758769169048;
        Wed, 24 Sep 2025 19:59:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561a9sm263826e87.74.2025.09.24.19.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:59:28 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:59:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
Message-ID: <ru7km6vtbxwnoqtt2zf24si5envayqh7qy45mc5molevrgt5pv@g32atkcwqyan>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
 <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4b012 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4OgBFdbP32ImLjEHi4sA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: tEsP1SQF1t-lD1OrZTTYLnsFR8Gep_mH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX2Pg+WUecZj8Q
 RXwc4wmJcRO3grHsmQ1Rboj1Vq+z9HmnPwr1V/T2dUKkL7chPq9LYJKBob8ZbTaa0oDZDL4rHXV
 mHud0qKw8XC7V8KoYWRifzz6E5whstBzyBSQJmgTizsh401dJ+r/drEjGQV+as4BU5JKkEhWcjt
 qn0AI2htTWaw4M98Mj76gNhyLw5HQhL2/cm/9utGxFNFlvWpjg605ko1YMBhaj1/kDCN37U9Ysp
 upobDGAp7L7AJFX9Q4+x2Lut91+ZaPuoDuVlXMZJ71XFkNYy3EUjEGg2Lk0hiveorMAYcgolhxq
 WlCK7fWxQJmSfxxjvIfEeRVwLPP6jhjjs/XBBV2o2z+TXzltUzdbJUCK7iTgt25FGKcvgaZCkdR
 cO7YTpwv
X-Proofpoint-GUID: tEsP1SQF1t-lD1OrZTTYLnsFR8Gep_mH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Wed, Sep 24, 2025 at 05:01:17PM -0700, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add compatible for sound card on Qualcomm Kaanapali boards.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 288ccd7f8866..e231112175d9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -198,6 +198,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
>  	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
>  	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
> +	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},

sorting

>  	{}
>  };
>  
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
