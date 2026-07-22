Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5E288AD
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724578; cv=none; b=ujmtZ8SRLnXqh7Tn8X5gVAbbi1vxq1hBf5dHlvmXYH2TNnHPWjbB5Li9vXYGTOGVJCVMmmcBI+IL6DJM1hQN0u0+1KU0bEiULgAYFKNvGg1Sw8XLgQGZUFiy1KBC+CnOn2+FVsd6d/YUppg4y2ZAM5IuJDNitabtL7OJAGXOpXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724578; c=relaxed/simple;
	bh=ftl7lQgZVXSeePeURz6F58RiBLIMbdzJLlREmRjgVic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdfhFpR1SXagaaLiEQYAUCW3Uxss61fwr3YwIN9R2R49OrAf/qW8Vo8Fh+HmZwfjO/IxGYXUjiEuNy4WvL77mKe35FeSRYHzc3LyNgACNesd+TVj/DsZC0kpa+6C0dh4bo7Gxyrtq4nbYto5uFn1VZ6Q4IHmfDBD5nbXd5YulZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGMavzPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bv3w1YUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGMavzPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bv3w1YUs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xeF8123896
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SvpfFh8meIdG+fVyQZge0oBf
	XwOwRl7s2AXihdnNzLk=; b=mGMavzPgc0wmIRd3o+bWadn4O4COHBv64ukLrSVU
	9EF8RB051wNBpvSGO1/5XCORDMoAb5v+HJsr/1dB74ehCoJGsuTiTmzfsR6GizS9
	75DPWLmxCGaaa7sbrGXbNtq4buCkE9Z92FecosUdM//DcvCpMgjR7y0MvVbiz/mi
	wm04LV3nDYsD2HB965u2XMKzkSrBFqIiPRz7B6whDbz+6IZYVNSHUciv3LKsJivJ
	Dtlvn1Rqb4kCcFytxGodARVhsWrbL5DUJjGc8Ecx1nUDztrJDiyBmZ92Do0msR8V
	DLji7A1b+09igrbN2rHq2GI81b2Xi3Ic4e25dh8oqtzBbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4t5dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 12:49:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so199653431cf.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784724576; x=1785329376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvpfFh8meIdG+fVyQZge0oBfXwOwRl7s2AXihdnNzLk=;
        b=Bv3w1YUsEYDEoXciljbdZVGjTC6hDlAdrbREcGD8dVXlRsj65Gwhk3iPsX075F1H3Y
         wwI8CD41uu8M3LZzAiyARPULB5MBHwfdDFpLjLR7dSOOindAxedKFDM2VhtEN1BhjysB
         EmhqbtQnEp8FehHcV21eLUYwX53FcSKZYFW8XoH1Fn0j+q4YG4AqqyF1JRXQdsyn7l+0
         Blw3CG+OlVRj0OvWWws/Rs7eIqq3TfITVEjVYxcbeCfFMiGy8IMUJte715F84Aqgjy+n
         394JiMYl/yQE7QVCoUBci7nqxEi3IAc+vpfg0CZMC+BUxTiKNC3xlr5KtPI9sK+VSysB
         JeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724576; x=1785329376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvpfFh8meIdG+fVyQZge0oBfXwOwRl7s2AXihdnNzLk=;
        b=q/1xlAPZWkmk1LosJmHNg3OAbDESvJgrKNlCWH3qmefj9KJFm4VLcy51GR+QFCuX8J
         NiT4t7ZI9awu4knUEvME3v7+hWyB1E5pjoEk0RFiVuMdYr9axZ9N4qSc9rdtp9COdWyo
         ZAA1VThSZcljAJi1VrJrCQr/Bn8OZ/Or2xw/MKg8IUpCI3JWvKjUbyOm04+xquoTUdfv
         GQ3kJtUrsufRsH7N0yUzfXFiBQh2ss1gaDzC7Cp7qM2EhhhjhJmX9/t3XBxMjrs9ulAs
         pG7lHTiWyqFvilF+9RoWkns7PG9EKO+YGLGphHWuqXC6P4Xs49/rNfe1krKn7dqA9Kq5
         bNbw==
X-Forwarded-Encrypted: i=1; AHgh+RpFNnj10k96Qj1oB9iJYEMz0uSozTrn6Czga3OrwGlKX8b1cf3MneFEf+t9Cj2NbGwDvJMLaTVJQQMNcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqri+zb/H+rTE1VFOoXl0+t5twfMtfeIwZpjxlxJe8wbNv+Jnw
	eSTsHo/0xImValZnJpY7ey8RWWrsTjEZOXr50VXWzh2PoppsydD5f0ENSpG6D4u0O7j+2GhXoui
	6/85pLv8+TsW304Y4SxgFhYnOrcVDuLFUCPOeri/VF9GusCBNS2efXGWFaNuUHq14j2aY5RFR0g
	==
X-Gm-Gg: AR+sD11XdJjEAZu4uAyo7DI1SJySxH1k8myuBfgXkkqAPUX5Cbbc56SEYZYOQXc0Cu3
	f8uko1KUUm+Ga9a3C+GdB021YJLWFjWZZAcKOuaryu8awh5pbO50K5OGiV9XabOY9yCPXi2CRGx
	ty/R7i3HI2NqnMjAbTUnvhuk14ujr9IKauLjHg7ntkKE0wJd/StbhtEGI2Bn4xMf2tkEa2iz+e3
	Td+qvlG1CeL0C42GaVkZWfW+N9m+ZH4HocdPxKdQqlfqC8Mcl2r36zZOYgB3eNW+YZADHTec/Ia
	WMUf95XfuxFBc7oR7e0TzCD1K0B3M1lNOhyfgLEWO6c5Y+STHOga9C3G6xq+sy3cRpqY8Q2+BFk
	4QNPUqhXEecFgIyuGBaSvpWm94sn/c9WQNYWTgYipHfwma9demRBiLLlMu08OdywYSMyKAqqMvs
	DxsEb/zOibYIjPXQ==
X-Received: by 2002:a05:622a:a952:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5276d0bb519mr42601151cf.68.1784724575782;
        Wed, 22 Jul 2026 05:49:35 -0700 (PDT)
X-Received: by 2002:a05:622a:a952:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5276d0bb519mr42600811cf.68.1784724575282;
        Wed, 22 Jul 2026 05:49:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d5458csm4128091fa.29.2026.07.22.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:49:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:49:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID define
Message-ID: <flb5lfpxvh72yyajck3uspn5tb5gdyqqbwyhci6vstzep32fau@tk7qmxjbx7ok>
References: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
X-Proofpoint-GUID: G0jGDhsLYNv8Is4Mzh7YomYkP8vxxz0F
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60bc60 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2qMAu7doLNGE-PBth6wA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyNSBTYWx0ZWRfXwInnZhVTbh7p
 sFu8APDmb/+Yybrq30Nr18NyHtkKlQ5iJsDeuULmA6KbBPrMZrbmU8HMxWSlUgeDaagx26O5AxP
 mLHxdomOItocUROzuVALlFAhWpuFK3/uLRC8gm72fkvjXX7znzEGXTEHwcbm4Ro0VtrboCI3KRC
 n5WL1eiBSv+uKoiX4a+a+I678SYCnc8MKClZdXS/Gd7Ooy8XKZgxXdSnCXw7tnByO7RmJUM3V1J
 omlgtEAZsZGClPcyjZiu1/HoFRB3vY5mnAdh0XHE3GqLuxjTP9Vksw1k4T5TFw4npP9leXsZjLx
 3Cz6Z9xEq6iQ7acWzcHn+G+t04xXMzF0xAw+eaM0jYnHNk42His3eCFdv0KRD+A8OpxqemRiInV
 /4wnzak4A+6CwJnqxPxIOav5+St6Nizcebra3Sz8GF2nAR0+2eCb9sEl26WyADKQchp7iJ6Dwi2
 iJStowNeQRz5A9bgZkw==
X-Proofpoint-ORIG-GUID: G0jGDhsLYNv8Is4Mzh7YomYkP8vxxz0F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyNSBTYWx0ZWRfX78xEnNol3VI5
 sxsidxwitRaRYAnUGRvFBEFEHVnqIiVfq7yDhBJb1RfPOnDh0UW3CYSjHDQTNxMAwH08eI+QBw/
 tyLQKg7cFKmwKf6wNaxagocLpjN8JDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220125

On Wed, Jul 22, 2026 at 04:46:55PM +0530, Prasad Kumpatla wrote:
> Q6AFE_MAX_CLK_ID is not used anywhere. Remove the unused define.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
