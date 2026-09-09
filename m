Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A6577E4B
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965710; cv=none; b=Ry05sq+fmhby5sO958mqJYlejO4kWa17fhKOcokkEGscPyFReGKEDlSyyetPLHwr0UeznvrTGXuF5n+H6F59LCIMMV+NUobJ6s6P0FIE+T9caJiOwKnBktibaqhw1m5/fUwCaPYNqNSTaVx8MOUjbPea5DmUreauuT1GkQOIW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965710; c=relaxed/simple;
	bh=BTc0Cp8Dso1c7YlVq7HUrCHive/vuDQehrCWv7Nl9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLBQlsz88/5rcjMjtPqnmFYmDcIUK6GfqLgWkQec2lgY3qHQt6nN1LrfsDN1W97SXVwytEj3DUyzutTJbRwLlHgCKi+nNt4Wp1JgZy/yeyZf/CF6FXIi0yERjhhmCX6yasttr5YMZc+NrI5N5JoyG3Y3ulB+kLxjqq8hrsJsvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8YAQBn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GU6K0TdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8YAQBn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GU6K0TdW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUF9a2171930
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 14:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asWMQq8NhdYswK4MkiaQeCqT
	pdZ0Hx/tpKkyEs/A5J4=; b=i8YAQBn9BKsroQ5k6a3O08jmYpR7a3+yMiaByjf3
	YD4EdWjbv1iFVTXYm4u/fU10kSUbb47CzZJRUn3qzpwW8Mo8AyntOxZw70moZNtP
	6A8ANYZtrpxojW6XfwOVDn3VGW5yLcuo6Vn05QwROBdmOex/qh/OaC9/ePh9p7ut
	9rRWj5AUna21160jWbg8ug9iosDTeXk4YDr/GgLbTlWnuB5vRczQByTuIn87rhQ8
	2/m2PTHmObEy/JNQdOFVEMqTKszy7lZt6SjYExJfDI/8caXYd9BlPsz/aitIJw2Q
	glvpdFeFdJUwo9jwn/ALLbRfK8jg8/GLDEO7UJzGbvXI5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgh2aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 14:55:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485d853b08so8022571b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965706; x=1789570506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asWMQq8NhdYswK4MkiaQeCqTpdZ0Hx/tpKkyEs/A5J4=;
        b=GU6K0TdWX73d22hk+B1CB1dNxRDUDls3l/XZwqM5JbZYwEzr4GuSjxjhiWG0/Q7Epy
         cfJQH50dEGih2t6WoAPnlXxq7zERMwo3YmVMNRPQd8vUpvXuJWKwlxVJweOmpFB2f263
         X1PJogjcW3miVTRIDV3/z0bgNwFSe5oZJ2J3kd2ypFe/EJmh9pZkXFEgZfl/sDzTiwIz
         RT9dTdAFXwZr0EmPr/SuR9h/Z3RJk0b5RZkBJCUngd6O/NAv4Jhavw5/RIy9fP/r7OgI
         GQxQOAv93sEEt9UV8W/pfxBddBi71MwPEGMef6R3whgLbAMzbP0AuMCFfO5qdCsnGjDo
         E7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965706; x=1789570506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWMQq8NhdYswK4MkiaQeCqTpdZ0Hx/tpKkyEs/A5J4=;
        b=d6gStQiT9oi9sEIzA4NeyRqoDBxZFN/D124tWzukNMKccWPVa2ckwb9EIsatcVVFmX
         csoSWlTn7MBoPknZGHNr3bh8nwkl35reZmhOUrQY92m9ZZZEAkEqyYVim7cG6q/rl/Ke
         ijO8301GU3epDV46SJDv9jmdyjWpAdnbsZU8hZRF5yRZZ2FZiR6k0iDGKFjBn2iKgFEB
         fqBQkEoh606NuWIiiGcGxiBolnRo212Ca7jYM0GfIJBcIBzjrC2KeTcjKj2a84aLKAmP
         zh1HXgk5WYSxiPowQIT7kymS1pOvWywFt5WkF5mPlcX7h4w8vOQD4kCWiiNFjcocx7H3
         ucgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLS7cX6HrEt89jVTQCwJD91MDq+o+XToWxE/VSOM1hS1OzTxxI2m3PvpV9Uf3zOziw9P7rr3L4Ej8RJg==@vger.kernel.org
X-Gm-Message-State: AFuF++nbb0WVCd00zr4eZgz+GBx7pkdu4DXK5akHD9BFehpqrmvNo0M9
	LFvre39DHR/f1Zhpv7oU0h5xyVmq7+k5aXT3sammQgmb91ncmEdmp4oc1gRWunsZdLYYiTMhPo+
	Svctle58ynRlozTo6r5uRtB8R5U8EHQFIf+G8IOz4YwsZXvq9qC8o05gspimAEXQCcQ==
X-Gm-Gg: AYBFou2bY0sj592RNl5JKwzo+I+BxI04Cg443p/z+cD4PvyI+jyFPoVzVg2ddUOnQ/8
	0TYEHZ9iY27JVqm0MVA0rbotNQksckkKYAR0zw1hqi0pGkd4xFOzde6fJ0M2uez5r0v1XnvH4OU
	40EG+bm/xUUrVYKFN/fyihRIGiK5eQuQrxw0iG2cgfJFuY17i+r/2S8dBIzArmlhvSgzcr/4Fbh
	D28ArJV2FIpY9obUMhYPitow9S9SMmt1kMZA8Y9pdXEoOQTEhCpd0Kj7smV8Bi0Vk+PD574gZq3
	SZ0YFqz7eKDirLP5srXTIOjTXF7UtqEXTMh0RqZqmuEUHETzPyAlL6pGotmq+QZXbbnVUtbdAHE
	k6KxbbrI0KxwL9YzObWd4Jw0Hvlxh+sMbkYERj7e4zXQ=
X-Received: by 2002:a05:6a00:3391:b0:852:355b:2430 with SMTP id d2e1a72fcca58-86946542bcdmr2560667b3a.10.1788965705553;
        Wed, 09 Sep 2026 07:55:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:852:355b:2430 with SMTP id d2e1a72fcca58-86946542bcdmr2560577b3a.10.1788965704982;
        Wed, 09 Sep 2026 07:55:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f74sm7195955b3a.10.2026.09.09.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:55:04 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:54:55 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
Message-ID: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NiBTYWx0ZWRfX4P7rwkkMTo/l
 kZdPdhDKnaP2D9eDBYL+83gk3yLY7G+H13hYEzvpec/TQBvzjpQELwhsFrV7eWoL4xqM3vdpAWF
 0/o0Vuj9GaBjigAr626orBclnatjvRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NiBTYWx0ZWRfX35dSDwYoyjKp
 C86jTO1rZIFo1cNvPp6HsSxf2lYLsZjk9FpVrZ5t6BxDFmGOM9T5jkegMZOGqPwLu33MZ5J0pPh
 PUbc4bg7x384zszmZ3G9kExTXsDFYuSoLyz/8kMRPPBbDP40VZ+NAGWBg+VsSgrGxETF+zCI5Qs
 Z4KDlM0IFuCCxGivi6RAnFC/+X9Dn2sgXvZOhZCcWz+BeBJn7+ftTVW6HKGYdBo6s4ppwXre5pW
 ins9T6l6+EGG39P5zazMYQ60dLbDFlS4xiGEsWrDeCl2/y3W99WZKZgR/010VqEEA/GF5Z0lJfT
 UkV7HjAWQtlbbklSOF7vMLcrGugcWNWHMf3LC3qku77tylvlnYnLCfKlHEZAelwi8+YIKjOqIca
 fGCCa8sNMFNV9R7EEeSw3HOs2H58Cq6vn+zH+dq37WhbjP2h0LzWD5fqYEFX9q9njK76vQbCS0Q
 BlIbZlOsF762wyGWRhA==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa1734a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Wwyz3RtZpYwf1FArlg8A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: qKl4H5JKGVlvjaO-xkdGVdeuFc2dWEJO
X-Proofpoint-ORIG-GUID: qKl4H5JKGVlvjaO-xkdGVdeuFc2dWEJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090166

On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
> Document the bindings for the Qualcomm Nord Ride board
> specific sound card.
> 
> The bindings are the same as for other newer Qualcomm ADSP
> sound cards, thus keep them in existing qcom,sm8250.yaml file.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..bdbaa8c822fc 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -38,6 +38,7 @@ properties:
>            - fairphone,fp5-sndcard
>            - qcom,apq8096-sndcard
>            - qcom,glymur-sndcard
> +          - qcom,nord-ride-sndcard

I wonder whether we can make it SoC specific like qcom,nord-sndcard,
so that it servers both Ride and RRD reference boards.

Shawn

>            - qcom,qcm6490-idp-sndcard
>            - qcom,qcs615-sndcard
>            - qcom,qcs6490-rb3gen2-sndcard
> 
> -- 
> 2.34.1
> 
> 
