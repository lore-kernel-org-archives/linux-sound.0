Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A472D28FFF6
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128195; cv=none; b=FLWaxGcyRSNyX1gNEtY0d7ALOuyKt80FJmYqBFpV3uhmB8xTAQiEIDp7RJ3lSFkbfTfKCZlQdPPn0PNt0SmynzVvE1x0efS9c3FDJTExP0eo1dIrYtgJLXH3R/J+HUwLqZ3lbriVI+Ty3RMGyqywwDIaRmovNQ/93s0Ri87ILf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128195; c=relaxed/simple;
	bh=evPPlA3o8/RHmcQ5jBRYKEHN7vySVMUhhyZM9RQ1IYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOwmK0kTMl5imGQAUHFavMuwo6L8cb8bRh6nCfs9wLoA0KvuIVE+HHhN4DJO8NU+7er2hSUDYaNl3Kp8tFVQGF6SYrqsnHO9AVQNpaVtFowpz/cu42xCRFPa34ib+enl0exB10iVLmm7YEQp0lw/0+HFu5hm8zOJTOlIqzy/laU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b95/m8Ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOeSt5yI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b95/m8Ge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOeSt5yI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Em7O3087574
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hrpBkcjZ0X2R4bvpnhheb3vH
	Wc/nYCiUqWYNqIv9sLU=; b=b95/m8GeprC3+GwB48btZUoWm/0hQtxu0n6Mfppn
	E+p/2iV2+5gJtmr84Ea5jX8y7OqYE8JYqLJPfX8wv2eDdeEFo4uAjiCQ5KMgKBmt
	dxmGQp+Evc5YUx53s4xDHqglj8uuAdGcHv/43fOAyuM5ZUq13ZuY5Z5uAHKN0DKa
	Ub6mzZKujaicaDPpptxNRob6hNTpdlVY1ba27ShQMjKzYRa5PM/B2ltOz0VjDYne
	HNK/D7AiOrim2qgRYx2kkm9x0hJG2HtDMOMjHObIHrbignHDCuoTZqhOhyzR7gxv
	sSss3wPW8nKSvFJht58vV+81DzEwNtxQIsnuHETJW2WvFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy83atc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:36:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec175so462725905ad.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128192; x=1773732992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrpBkcjZ0X2R4bvpnhheb3vHWc/nYCiUqWYNqIv9sLU=;
        b=WOeSt5yIfp7GT62jJI2h0FDtBDKuyVq/HEWB0F+XbwF2QkaFFiYWnil2BFyaW/1rpk
         4Yfk6B5AkVLUjBEa/PzFrTLiTtpnXj1mCVmarYBMv+FWEuPHTKkNuuH/rvFcfjf8bEKU
         XhmtX6/fF12mqfI3AZamsM+Vv26gUDhMzoEYlfN2nMtS2I4NzZhoNZAA+Es5TXY9RoV2
         MzWiYRiHCJW3LhzIfFmfrHSagRTzm+3Dt0Ta73iVnVcTJG0wRRLR/UeQHs/eJSfO2ZGX
         HZWaPpnA1rF4BNScBwk+E0GylIZ/y7pEufxoqlSyhdeI/ouX02lqx/UtRSy29cMGo4ER
         3QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128192; x=1773732992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrpBkcjZ0X2R4bvpnhheb3vHWc/nYCiUqWYNqIv9sLU=;
        b=dtadOBEJMroXRDzKrWZMt93fR95mJCzQGSHMJar/JqcOkQA3IM3h9595jpT/7xyorB
         tGhQzzAZdUG6OI7egOzzdBHe0IsYmApQgeZqrSH+f70B8/K49rSriIEEefO2P8IxZymb
         4mQ7vyOQXrzgLett9YWY81DCZQQvF4nAlGW0O1r0ScSUcTKJjX5mXzttDq/YcTztyDzj
         unH4g9PbHX16LMrutsC9TGXiSSbbl5+8u1KPu8Tq25unl063NFkLCf8pjTJBy8YWnIB4
         Z5DgYBUT/2kgVwWkuih74RPhoG2pxQWd44qm/5VNk3lC0wg5Ka3zqp4XfGQILjcP5pD5
         rBhg==
X-Forwarded-Encrypted: i=1; AJvYcCUI3YAlxkrR7cr8gB/04gLIFaRwqrAGBHl8I0tjrViSQlr4V7zux2LCZnzhDJCMVDU4CRJOcNnyD15urw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYgWEhjMfOjUysBCCK6n2fZg8+VnHB/s1+RMAxPjQEb1QaF6q4
	UJFTrcWI3K0ynXd+7CLe+FMju0WMdX00TZL+xWV1cNGRFR1Teemr1sp3FukLsS3IBrNIGOAgnVn
	KvauwxH0zLy0xu5EX/v9j+xLWdoDU+FtnS38Gdm9hUPz/XD2mULvUmpJr6vY7l3SHqQ==
X-Gm-Gg: ATEYQzxxopXDdac9JnGnl7oInH28QlySwfc/C2Lqxou/VS7lJvDxxzHJtXFOdMsAPAc
	taMYhiKkxyGMphktYOD0PwwxsP5SqkqtdYXHuRf7D4NMvYuDzCz9GDUyeNQ5GjO8/tdJzzUbpjC
	WmkgvQtVXGzuyo8q5FzSYsLzpY+cqfsGra3rmjWrJH5gYDcrzywYjAo88oibO1rq3rUXIii/8jU
	kC9RyWKVuUBT5kdA6z/L46C9CWzIZ6sgqbN9hFz02K64rV0nnSirD11676GfnEc8ZbPwnPzzIp0
	GXwXX+eUfMCIt8NR6x7v9B0ytTWhwAk2RR9VkXQcCvTLXHtetE6G+Sh7k66D5yqRUOiCvSxI1nM
	OaKLjkrqtGEbDSEgigo0txPEBYrg/Ra77c3AqZ36aRfNU8ptd
X-Received: by 2002:a17:902:db0f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae8238bc3dmr156453205ad.19.1773128192139;
        Tue, 10 Mar 2026 00:36:32 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae8238bc3dmr156452885ad.19.1773128191506;
        Tue, 10 Mar 2026 00:36:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad74asm192662105ad.78.2026.03.10.00.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:36:31 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:06:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] slimbus: qcom-ngd-ctrl: Fix probe error path ordering
Message-ID: <20260310073625.dyqkkaasd6khgmzj@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afca00 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hgJ7biYs1z6SSqIWfREA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yz4OSQGoyqZQz2tEcRFvkCXTnOURcG0a
X-Proofpoint-ORIG-GUID: yz4OSQGoyqZQz2tEcRFvkCXTnOURcG0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfX3WM/5QfyDzQL
 KCFIY/zZG12Az/XPhyNOANzKEs3/sffyG9SXBbYstAORV5ANh19fhGpMbRkHPjoAESI+cMa8xc9
 /UaJhIYDNFLBV5p3jI25gnvYXfuaUtSSaU6XG+0rRY6lBxivQDzOvbowYqFkAgxF2DOhlInVFOy
 xMUSCqiBvvmPmCRyRm6vFdEIeZvPJjVCZiTCFuFiMOOvCE6r2rn/myGy+3vA7CqvUqNR/jEnuMS
 M69u7Q1WRA4NLFjpb6SnA0EBsz0tyVEf0pO+Ye3acD6FUauQ9jJ/6PPt+QYzF0XaIoc0o3K8x0Z
 OgieVfYGakSBLriUsGE1qmxfOI5yqalRJl1v3lZZ/i9hG5rni2gkjfRn6y8njw4SQkk5ZVPzDRi
 o0ldL1Y5BtJHQNpPKoylebINPti8dx6T2YWgH5ate0klChce9+ni6xtEnRCI3RCY/yqhPNtWelz
 ZmuomOwpmUEoyomwiaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062

On Mon, Mar 09, 2026 at 11:09:03PM -0500, Bjorn Andersson wrote:
> qcom_slim_ngd_ctrl_probe() first registers the SSR callback then
> allocates the PDR context, as such the error path needs to come in
> opposite order to allow us to unroll each step.
> 
> Fixes: 16f14551d0df ("slimbus: qcom-ngd: cleanup in probe error path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index c69656a0ef1766d5a9df40bdf37bae8f64789fab..b34e727bab086c95dc7e760bf1141baac9ccf6a7 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1662,22 +1662,21 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctrl->pdr)) {
>  		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
>  				    "Failed to init PDR handle\n");
> -		goto err_pdr_alloc;
> +		goto err_unregister_ssr;
>  	}
>  
>  	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
>  	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
>  		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
> -		goto err_pdr_lookup;
> +		goto err_pdr_release;
>  	}
>  
>  	return of_qcom_slim_ngd_register(dev, ctrl);
>  
> -err_pdr_alloc:
> -	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> -
> -err_pdr_lookup:
> +err_pdr_release:
>  	pdr_handle_release(ctrl->pdr);
> +err_unregister_ssr:
> +	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
>  
>  	return ret;
>  }

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
