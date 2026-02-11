Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412092F83AC
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775892; cv=none; b=AxLTozC6ap2gWCK6MwleFdZLLZk/5gWRHTKV6tXIQNU9rQZqgUJQPzRxKZwBl5rxx8KimweJEdWgKOHoU/6WdUshPGUP3H+LE+3eRsObGK21gejMjiV4FA8lzpHFO2m15lOVb9XAUuiZDwIPujwPeUxlPP8GdOyHotJIVBKiAGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775892; c=relaxed/simple;
	bh=8KmGqu10I2UcckwyPpRC8tNe/8eY+hosqLQUnpOWz2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHNkok4WYz9QLDGlnIudmsG2q6cppb7z/RHbYthmduQGNlOC3R4SMWNanfnYC66NNlQx3xgi/ZoliUWch4kO+cM8HqjlYu5KEqngvh0yPSNmtvFI9izYHO9WRDbMfG017NWr9dodNBcYdcVlSwDxf+/8WoO+6Fio6poWk6gJN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNi4s4HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHgHBjLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNi4s4HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHgHBjLY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AIoZxp4013760
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rwAUFN3fNP8Oixckb9rh2aw5
	H+/4LllRHz6cpH0F5RM=; b=JNi4s4HYu9+2mYBSTf+/RQnDhUPEtIlvSpaxQomj
	QMBZYa+9aVvAGYAA41QxvFj88VYf5JMOT5Nqp0z6OsB12T0DXoh4wOsL3t9ctsWt
	n1ukx9BUdNLsQClg6n42y4XK8ntSFpShdPtQLGOFHgXQTUr38inOufus0hYDuGLb
	2gk30O9O046TDYehLoTZSgey9QsySrjAoY0sX3INtaMvUXftv4Ha95Evo7YL3JIM
	v85zhT6Pwek7Tc7OSgFjaMm7XrpAGmn/JNzamEhGdv9JmNq+Ve0lyfQwJvrmERTs
	QTqtUv6q+I4tbWedmmH3DtZL6RpQ6SyQl8sbbkeQlwj7Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8aad97yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:11:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b6a5821so1492408285a.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770775889; x=1771380689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwAUFN3fNP8Oixckb9rh2aw5H+/4LllRHz6cpH0F5RM=;
        b=eHgHBjLYb4PdT9/kKcLUI1TEPbieVJPutH2oeNcp4eJ17RIfxSAzARUIpo+XMYpg/D
         vBD5h6MyL1WyQM2nnWIhxynRcyJYNCK6Dxvo34BgX4GP3VIfT/wpSGHg/Q/N6mZX4dUE
         anjxyepWKi913F+uFItUc7aU1QaCOFlxaiiDver5E9YsTY5DdHB6nswfKZkCLrqm/IjU
         Z+opL8N2ztc/Y0FGVQCJmT5PbA2uyAaD32iW8IcRptUu140n/oXEEPOBCmgQTp4yurcN
         d9kWD9fchYZQEBgdjey0Ye1KejWG/64j3NI3jDPhjxmiBlWapDiI0O7Lau2WVLbk1ob5
         4cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775889; x=1771380689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwAUFN3fNP8Oixckb9rh2aw5H+/4LllRHz6cpH0F5RM=;
        b=IhprKpRdjBrIP0MHMn2SAChXmLK17sgdHjTqYIers+8ax8c5ccXEwT0Up8WkKuZGva
         GPqpbyBuu3kx3DYvSN7jEWwXP9rR0ICrt4uDdO+syG0QM+gYsy1Q2X3FeV0lymQZ/Hgw
         K0WBi2Otl2NiBcsOJpg+tGJ/c0bjNqr0ITcHzJXIcOKiD/Af8BJuA12Ko7y1o124Ccda
         SVBeahoUvWUimdHaTxHitCAUopjBwpV69QqBCLml5EawtH6jyIK+ee2JCNG7cUkG6ViA
         G3dhLWn0hZE1wQPy8FQvxQavZsNW3Syv3Cqbm2TVXfdIFf85w05S+rjZz5QCjHxUX54/
         NPqw==
X-Forwarded-Encrypted: i=1; AJvYcCWCkHRbewOd7DdnWrWoDsMqbMciJfNSVFIn9Kdvyy8OYBANNTTFkHf2hx3sy5xuUU8cFfrqFoZLLvr5Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHvurAU6e12k3jy197dCgpyy9SM9cZlA5ZSRyp3xSg4jOK/i3
	kE0N7i3VpbZe9EJMD+hhTjMwOd/fyFPZaJNZ1FqC7KVe+bUN06m9laufj+Ve6a06fURmuGHFv6c
	8Kvv1i4bQUizULLFmyI4IwPheedZQoYKQ1EXmrGtOGSKNSj1ndw+ahWVwktGw9mDrGw==
X-Gm-Gg: AZuq6aJ1aCzhx29DoXI+TjbixX/ziyIiFumhhiEUnksbW3CQdHHeBISx44bJxT1uW3k
	J7Bmm+3r73BInjt3M3fnvNLaoiZzhz67v6pxwOVWgTu4VC035zVlJ6RprTtgwyjWtGMgE7ew0nU
	AofYd60aT/9uDlggxy1ePj8+kw2vIUpPku5j1MJbPa1a+LpxxVUqToULBE7LBRAyORQM8yRnaxf
	q4E2THLFFFvaIO+BnHcgZy6ht8QVfTrxPIJUmNzndlsxAV+ta2p/qder9QVvIywdo154sRWB73x
	QlrUhRD7LqC5niQuzRqbCvxEPGRHhq6BUXx6WDNiCVmFGtOWzBdiX4U6QZBnEjEAlsw0wNTzdmx
	QzGn4DQHlMeBPr+hXkrz+s2qHNMVr0N48dnKNypOf6Yd9PGwRxKamJYkE5XNs7k+dqWI/g1xoST
	s1ssBEeh6H3cjIg8KDOwk5E4749Qy5eWBCu88=
X-Received: by 2002:a05:620a:190d:b0:8cb:104b:bef with SMTP id af79cd13be357-8cb2ad54a5amr28601985a.88.1770775888574;
        Tue, 10 Feb 2026 18:11:28 -0800 (PST)
X-Received: by 2002:a05:620a:190d:b0:8cb:104b:bef with SMTP id af79cd13be357-8cb2ad54a5amr28598285a.88.1770775888057;
        Tue, 10 Feb 2026 18:11:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5f35sm565761fa.22.2026.02.10.18.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:11:27 -0800 (PST)
Date: Wed, 11 Feb 2026 04:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211020302.2674-2-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: buREgOot-k-6rfhb13qHZ_e74iZo80zR
X-Proofpoint-GUID: buREgOot-k-6rfhb13qHZ_e74iZo80zR
X-Authority-Analysis: v=2.4 cv=OoVCCi/t c=1 sm=1 tr=0 ts=698be551 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=OuZLqq7tAAAA:8
 a=pGLkceISAAAA:8 a=Nn-6Z7DYh3BI_mgflx0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNyBTYWx0ZWRfX8wgjxo0IggtZ
 oRIDOe83aJ7nhlKNLzhLHdZYzox9+JOpGOvQGygXzh8xU1xKVAg4/FHvBVdGq/BaT3JA9F5XpJH
 YFy9JhGWVN+N25tuEGo/UGIjjCxDBdIJ2IZeqjuFDga4qROsEH8W59EgkXjPukqE5yZeIuNG60L
 5VoKVhhje1r8518TVz8zVAg3zDdws5+v5/KwYF0FjwQFvGIcaggpMuITYgoLeGg+mWBKdpX7Fv4
 HKEsFx8suPWcBrx1RgZn98bE0gjnAqy0g4sWJHAu4TjUI/7E5Du9rCi+gfrqaBQY2nYOpSCaqDd
 E5j5bARSsNbliN8GLSkWDt/eWkHCTtoAoDOI2mv41uFxp/j1iIJpIJa2ZJYy8JbBSAmLv3HOu2x
 HGYx6F3UkW+tS6nxW1Ws9rtH+6FEkV4rCsa4+55eiY8pu4ijnv2mBmKcc3fFiDtS4afRxY+QSL7
 S3tT2hK8qFZHv6oatvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110017

On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> From: Nickolay Goppen <setotau@mainlining.org>
> 
> Add compatibles for sdm660-internal based soundcards.

Why is it called "internal"?

> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..ad5add422c4d 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -44,6 +44,7 @@ properties:
>            - qcom,qrb5165-rb5-sndcard
>            - qcom,sc7180-qdsp6-sndcard
>            - qcom,sc8280xp-sndcard
> +          - qcom,sdm660-internal-sndcard
>            - qcom,sdm845-sndcard
>            - qcom,sm8250-sndcard
>            - qcom,sm8450-sndcard
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
