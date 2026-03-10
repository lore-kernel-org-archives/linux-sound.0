Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D23E8C5E
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128385; cv=none; b=hmJHNoyct/nIpQcYyUL/3XJu6RZsw95voiStdl26emYSHoLdczZUlEJrijKd9n7Bq5hRih2F3Jr+d75RspnzfE/i0pfEXqaHCm9rmFqaeS4zolaAKmJ+0k0meWOeAtjpeNAQV8Gqc5au5EeD1ULIHGVKnosAQOfOocVEEF5VET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128385; c=relaxed/simple;
	bh=Ee95napIswr+YinpVxc5RjeujdrrEruDYBqteyDH2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj262G04esIUNtGiNdysXoN3TaV/eJA+/fsrqCobCAF753cYAgONWCzaIedQFdv0mGyu6hZpumDAbnqp50FJV1EnXDSz5TndnhESoPJi7qc7fU5tjxV8+ewU6IjGi2sK3q7r1PiMXrLBby8e/XqItoaX6hzyvlBtnQw5nNez3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ledlJ3/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfzVHXUH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ledlJ3/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfzVHXUH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQeF2460651
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F80HPQ1/HbI25COFxU2GLyzB
	JFuxorX49mUflnSs+xM=; b=ledlJ3/50dzcUX13OPhxOCE1iB4UfMFQIjLXU/eC
	VBkG9EWww6DHReFXbR99imJIXDQJw9M6ql2RQt67jN4/5e0Ppceup/pGBvknfb71
	dlp6cCfmY5Hr08QZ3sXbEKCftaAjL/m+0SvBUWKOx2RQPG6Jxo9aj9uIwmoTL+CK
	IUdyK7luiD7CwgGH+XpzvhQmLouWqI8TyoNz0kbjiNHUTm+m7B4OmZ0XrJUZx5Mg
	u0FIXUubFRo9KL2KeuBuH7eObwPveUx7Q0Fb813DZXqW4c1vGV6JVLcPoYh/PCYi
	oNi8pkPCyvY9do3mISGFHS32gVF8FZohfunXjBnZCb94UA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1b558-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:39:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73939e0314so2597982a12.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128380; x=1773733180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F80HPQ1/HbI25COFxU2GLyzBJFuxorX49mUflnSs+xM=;
        b=QfzVHXUHMMupM3sMXpNz5jBPe58aXWk33o89QG0bvirABkQfAOdndGnfie/mF07+DY
         9rLwnsrFmq4qzwCLMyPVcCFh3ghnmTYkscUamHQJKGJaX5WaZFfD60Cvcpn1FZ9sq/xN
         o7d6tGXfTNsX5/4845pyted1Nnge35lf7zNReueNPCF5AOWL0zrwcjsDtG6ea3D+PMcA
         RqBmFDUqjVmd3iOT92RJnaZiRL+htDIK35FMeiZHTL6NdvftcNhSxh3KGGEM614zgjJ9
         QnZxhIW/PAjeYbgNWv2kU8ZLW63OHrNC4RbARlzaWosLKwRSZs8EKxtfgE7BuaDVQSkD
         weVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128380; x=1773733180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F80HPQ1/HbI25COFxU2GLyzBJFuxorX49mUflnSs+xM=;
        b=sCdtyju5xqmNQvjT+0sRECAc85UX2ploTtO1tC2HaaBBQ1B4smBf+0z8tBLSWL1+cV
         rikjHehAE8Y8o3KjyrCO6lzXSPHOkjOorD2kSQ6UI4x7XFeMSJHpN+n+UyZVQD5uTu0Z
         o/5L27EfpmpSeDfgIMZCzC1ofKadGNK/r6zqXSFq09Cj30yFfikM0U2ErfKebD9vBPC/
         crF3RD0eU8kyXKKtW+h1LbLNlVjSz6FvNwLnoK8L4p08orG3oxxfOJL/17a5xi4mh0rs
         ruHGBkPpHhmH9c+QhGxmqpAG7ghOUodES14VQNik0ci/oyU13x7Fl0ag0ve3zMvEKf6G
         2Atw==
X-Forwarded-Encrypted: i=1; AJvYcCVM+IyMOv/k1kA4HEGAUy5aCWfRqNEUXC94XrbEuqECYb9+BQ9AY7RCbWSjVvVJ8E0UF8JDD7E6EEitTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJG2kLNf2DHIS2PD5ya9GrF0GJZaUxbAzh1qwpT4eo0XmI/L1u
	QwmAOPRoIcy3XoqRkFGT7Ic12Mf4vaES34dXaMY20N8v8ClSJB4xramwOEahnIG8slk3czLN8Kn
	ZONmxikMXNtL8pT8j5jmAiwWKmPCRuVi7Ll5jDFOKKwaC8yJAmyxx7zzDmuaVGy99cQ==
X-Gm-Gg: ATEYQzzkmhAEaLEQ4ARYPIBN2uSZB7mrAJk4aIFhJ6OeTvp/l3FN2+z+XfE8MZpzPUG
	S2llqoaMhMpzNNC0jYmoYCawmLU3peDlIOA4xFW0gpCxewYNGwm9y5uP0c2BBvUuVV00k0Hrb2N
	oQ0JbLf+0tCUD/TFmjIS1F4s0Oe/VcmNyNnAZIfvM/sfQoSS6JCjjZBdXT9rmkTREEAtEuvIrJu
	/OTd3VVWABZkEZG+kfBGdc4/l3f3z0sIHcU5vTCwxEKB60bXby5gmMGo/a9UoDatOCfyqbI1+uT
	OqC6E+bf3McTi3VXVwyCrfLAR24fnP5/aRbLNZu8qged6gczYZOzuh1aUZ1Md82FnxhBRxc6ebx
	hQb31Zy1DQf9CMqHCKU5tszjv4x3Dtb96/U35o/HHV15hikKJ
X-Received: by 2002:a17:902:e748:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2ae82519bc2mr150496565ad.38.1773128380206;
        Tue, 10 Mar 2026 00:39:40 -0700 (PDT)
X-Received: by 2002:a17:902:e748:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2ae82519bc2mr150496235ad.38.1773128379608;
        Tue, 10 Mar 2026 00:39:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f78370sm145364995ad.43.2026.03.10.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:39:39 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:09:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Message-ID: <20260310073933.ttble7algoiy7rwq@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-GUID: -Lk6ZDliWVl63rjOOP5UMJjEijKvrv6Q
X-Proofpoint-ORIG-GUID: -Lk6ZDliWVl63rjOOP5UMJjEijKvrv6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MyBTYWx0ZWRfX8o4tXQ0/LTst
 hdBddoDAKm/yQoI8yHt2RMfJihIL1cy/p/n4dXdybfWxUoX/tdkjzuS0CA/ox5To8yuFAC2KKEb
 BcKBM1O+yue08twu3g2T2I/gReRelnBYTRBt4SBr4NkEMu+3wOJsiMMwtm/NgM02LawD9+G938U
 nuispOZnCickQYE5kDZDzZjDXWgAlNFvSGKJmJiENLW22x8nQWapDXRfUEscncZTU5Ann1k/lpc
 KKOrTa8h2cgJJ9rgt+l1i5faxLuONXPKx754YI65fwj7eOkB0G+rbLXiCt4Jp0VGdCQV+PRgwce
 OPED/KwoZsbo4qAsxlNx8EJgJVnujS5fG+KrE3Ud0uLYXKf8XCBUA+xesqdhjWPfAQgxoTX9sLG
 VNhdSoIZbsO+U6AN6TRw0b7/tmv/qhkaWTEqwm7mpfVgI5mHY5ZkSxZyxBpwje/B1EYdZz6DUWF
 xshW0XmFA6EHa2A6t1g==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afcabd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rba0rGCAh4Qlar_hUqYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100063

On Mon, Mar 09, 2026 at 11:09:04PM -0500, Bjorn Andersson wrote:
> PDR and SSR callbacks are registred from the controller probe function,
> but currently released from the child device's remove function.
> 
> In the next commit the controller probe function will be modified such
> that the error path will unregister the child device, resulting in a
> double free of these resources.

Change is fine, Could this not be accommodated in the next commit?

> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index b34e727bab086c95dc7e760bf1141baac9ccf6a7..09ce3299e15c25b1b9cf6b1559850adf4aa20737 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1685,6 +1685,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
>  {
>  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
>  
> +	pdr_handle_release(ctrl->pdr);
> +	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> +
>  	qcom_slim_ngd_unregister(ctrl);
>  }
>  
> @@ -1693,8 +1696,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
>  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -	pdr_handle_release(ctrl->pdr);
> -	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
>  	qcom_slim_ngd_enable(ctrl, false);
>  	qcom_slim_ngd_exit_dma(ctrl);
>  	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
