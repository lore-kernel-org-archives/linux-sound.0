Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42722E2EFC
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366976; cv=none; b=AQlUumJjzX1L1/5+PqHchU0rh4KLx7pOY15SPLqgz7LmX+mj0xxERBB8B1q5u3uoXEo9ItwWgLZwhuhyZ6fTI+1uDJ2K1fZjcLLdqiuDvgu4qiiNPzvFJV6gPRV+HadVtUd18IzNN95aTCKv5FpWY2CSUHaKTjD60l/RVCfslNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366976; c=relaxed/simple;
	bh=1x33KPEWr8P0rzqhURp9ysVQkhvrTi4Fminesw/AZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXgTfYd/Lwzc9tIHaPdrsseaGFx9sAKxWOcJ7yItNHupDcpBQI2W/1EleM/MsGssYx0YpUP7V7Bxjebtjf/3V4Zgx9PdJy8z59ZBm3D/Snl3AQh8Nl23scXNxTOjzhu0cTVTWiKQ2weFHQOvkX/S0migjwjApzSCX+ewBbu2smk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTQlTXti; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTQlTXti"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9i2bp028529
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FrqC3/J/0jX5Djcxj6BpkANa
	qeAZVYVDIG1wzxTG5QQ=; b=BTQlTXtiws+5aEIPPgDYv+c7XG42ityBA64UI/cD
	XEn87j8pSrLhoYu3p6TkfPR9VKA31zpjiPoigJmIm7K7mN15PC5mpQQy8EzaZk5p
	qYdm3jiGKFtqur0tgYzDJzul9yfxuD0PleSeUy8crSJ+2OtVaCmj/J+m1tlBwnnX
	YLbvEF/Td/GWIWWTMkWNRpsYAwqR43+wx+t7jfx352gZiUMT6GX3kZAKjKtuU8w3
	V07b0VtF6TISk0VlhhhocfvDnRbuO6ohXRflnlRtleBZSS873KdugljOdYNsUS0m
	HqelNn7PGtyWac5TJl/ineNc2eP+1pB/mDKBPsVd/kwkJQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1gbhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:22:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-87edf585bf9so888489241.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 07:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366973; x=1753971773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrqC3/J/0jX5Djcxj6BpkANaqeAZVYVDIG1wzxTG5QQ=;
        b=FNTPsVJkf0DS/UeElgFICNjl8LY2beV7DACzQgxk0SwV0VhW21hrgrZPuWN/fCEC37
         pzTwnhQOHbUxAYYq5WAYmzbV2CfXx1s/Q1Ft/lvWaYa0i+AdkXO3xdPy4QvItgD3GLmD
         7y6/2Ix5QMbAwx9zic4qItssjXAING3c7byremEa+ZMgm5w6w5pNtC3Ve4aLom5SK+3S
         U55R6ianHmf9R6bjzFjMD88+b6Q2X/OLnqwTrDguKBZUoLG9oRt26YMvIvpbBt0GFSWF
         vlrbsfsGLFJsh2kS2BxL4lG/pmFYa5qPIdTjopJQxpMdbK6yC4pSJHkrW8FPuAgZBV73
         RtWw==
X-Forwarded-Encrypted: i=1; AJvYcCU9NeqNt5uygwWCu4a0uRe+9hUhx+8xj0Jh1dpYiaVrm9YpqUgkAlHMsUboJCFn1n6CRLUIzeRCSZIPRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVILPZUr6QKMNAUbjnw+cjai8rn9nISGlKyKAdfUqE8Z+Axgt
	4/hmX2tcQG8HOGFkuHfwDUjlxf8vXZHPGqWZtVg28TK5N/tWuYQeT7AMTQyLIV7mNwfY1LWiOB2
	Hfv3n3vCDeP+lQdYfvChQZR3Tx9ACiD0Vv5kGuJRb12XM55SO5bg6dMnHDxpGLWHW2w==
X-Gm-Gg: ASbGncumR89yCQgYBqU5vbam/yFmK6e51Lasx8RSejJubMdAskRBoB9+SRnyM5Y0kN3
	vt+Itn12bHVZEOjQKXUXw4J3Qx2Ozge3zrkgzZoYyDXMDX7rFcyDMGbfGSPa8bTTOBocX4yxoGj
	C0WUux9i+7RWGPDaudJS8SFccGNQxWDSYhrzFWuMFzJtBV4Jl6rhSnf0DlLOVqjs6PhzTqCggnK
	gOYxKTnUpZyzqdT7gBC+qawYWf+qBsqL93D3d1yPWhIcCICSJR//9fCBUe1pYi72f+mj8ZZifdQ
	jrxbdTeE9LXLdboI+xgv3D2wzN26Mgh8Djf6UxQlf144T3xaqvaRxMcxSZg3EwTWjsNtdHPXWBD
	7hsqjAdNRB54NZAmyinTvvak7l4P9+F3fdPEuBT91qoy+VJwdNdnp
X-Received: by 2002:a05:6102:32cd:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fa1505cf0emr3376565137.9.1753366972959;
        Thu, 24 Jul 2025 07:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJRpdPWtOGNZPazY3KH9hmRCknrLNOq5//Alq4jYTQJIKkqY+VBmq1ZeiOKV8obh1Keq8aFQ==
X-Received: by 2002:a05:6102:32cd:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fa1505cf0emr3376473137.9.1753366972140;
        Thu, 24 Jul 2025 07:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e0913b38sm3202801fa.79.2025.07.24.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:22:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used
 include
Message-ID: <crqc4pklbvykswdza7favsjszl5zqhfw5obee3pnfakwzzqot6@iuxugh6illx7>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: dIdDvrXUwIjapennR-WKjg0_0P2VV_7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfXzYb0ADhaO0fM
 1zdZB8Isqz6VlezRyHg+AN9iP9HzQP113bF147EYAcAjRtO5jI7ORD4kzZB7nhf5QuXnlo/iKsQ
 asSPC33sMXZYa4U/KkvODZw9rYN1Iz0YZ4KTCx2lNhE/cDymBA6mTim5iFV0eQtPgJ0tWk/shj8
 YVjgTNqgqm03YHD0V7kV9SMMuwZC0DKKzSXgyPkwroY5VFLlA4afTOD3Y5B1rVw7la5Tn/66BXt
 FCnfxr5ls7UN7F8zjJzyN+/Iye5pImhPaiyE3HBQj/o7ruwkeU9l4uwc2p3iyxPw1WY8UrCv1G6
 iIYb1X+ijGapo/cJJUVWD34WMHjHa2JPW97SIN09DDIaSYIJrLEPHOHdJszpOcJqPdxc5VGKYMb
 GDm282d+mKU6AKh8EyAgCPpWZdDJzHz37uvRlOREt1FuBh10Hl0qCjb58FL6rXaopAoUPxdW
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=688241bd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ShgW1BdH4RjToGz97RkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: dIdDvrXUwIjapennR-WKjg0_0P2VV_7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=783 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:42:28PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
> removes it, this also enables us to cleanup some of the dead code in
> kernel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
