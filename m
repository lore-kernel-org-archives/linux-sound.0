Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2134361DCB
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128978; cv=none; b=uk1k/LVn52hgc9/nJ3TwLQjAixtZPCclxvMm/sbABCghw2htjQudzUcBNA8+VjZEkGpkAEvc/k5gJnRb7jZ9sT6d3eU0NoqcZOahJ3PrP3KTOT8OJroNs+j/1c5paQ+sq20nMovu7FFNvrsVUXuPf7qLiWz5VgWPPOq5zAznb7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128978; c=relaxed/simple;
	bh=It3ms7EIy4dmxaWQD/Orfr4adYAkDCvqX0LSMJzNLwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5EY/+nLzPsYaGS3HX9gr3M9jCDWQMfx/sCqnpXWvlTVH+DMOG8hFsHHB3jVZaGQwGpH/ET8QvqBl57vGIT6Pk6qF9M+NjGJ0hBm6hSLmIAMVALcNDjkDii/M/+oTQnDjGZqrx5lq17V5i/ocNeRbvifCTGzfcoeht0GLYzbNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFTWXqOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkqHJB9s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFTWXqOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkqHJB9s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EBVJ246501
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wTTtsMPKkibaIuhnYjbzK5Ge
	RXMToz1A0g7v6k/rrDo=; b=nFTWXqOiakvMHVEXUEsri/CEzVXwpKCY+7/nTM40
	fTj36Cb/Y4MH4Bj+N1nEeJZp9nNlR6KCcHllgmhZSWwabdht8HrF5sykJprQtTmS
	tpQ+Bv17umaWGk2fzwZEE3nzgmBK98fFQtOZ73mRaHSSF3j0vkLn9G6rK+WwfDH7
	gb78h6pDiGlq8B9oHTgDYGAt3/E+LT9BMpwOsJA82Q3PxASQBsTOpqL/uVXuNj6u
	PT8MtZYT1MYEO8WGLzilzU7Crx9hZ24Vhnr9gyVD7ov2S6zqs/IsLndsJOgXNvih
	kLtLzNNOdj8XgtCAcXTMjjojdvs3UEWP6yLAC2Jq+LR1yQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801cq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:49:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829ad8a2896so10676543b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128975; x=1773733775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTTtsMPKkibaIuhnYjbzK5GeRXMToz1A0g7v6k/rrDo=;
        b=YkqHJB9sV+SlXCdcRcVRNCTHpyzit7+AC8xOCjPdAorcseCgJZfXoeRRaoN8yFMwow
         43x4T7Wzll0Fo5TKKP6we4cFCi2ENKVNwEP8T0rJLvjhDqNIKuruCnouqkYpDaTN21V7
         ZjFiWZx0cz4rWWCUM4aLD5iiGelIY6PG/Yofgr4SocXHhkJDtckFBAIiLmO6JNHt67At
         MiGhcR3QP0xAB3OmsXLF6ZZ/5Or2ZDW6Z4rM6L/sTk+rsfirQKWZ2mo3k8A+xmflusZx
         AQnZVOACyL6kvwBst4V2EkC3zBhyPNl1OytV5je2L7O+3dVc0dnXBnJyDKtYNYaGDVma
         R2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128975; x=1773733775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTTtsMPKkibaIuhnYjbzK5GeRXMToz1A0g7v6k/rrDo=;
        b=hYSmHoySSa1Tzj/2Z/Cn4qRk/T2yQ/fBl/PMszfhIyQYjA8IuCkZYvSprCWDO9qh8s
         QnbtCsC6rIQrTdWznTpy4gpcNs2E08orEh1OT5Gf5txQphL7zoPtHDqfX3NJK4ypu5CA
         cbhYls9hXDOLNVTtIQoVIKwKvWL4n+mSPMBN4+dgDe7Nt40p7Cv/j1b9wKHOJhUtsbAM
         1pZ4b0c2CslhWVFmU0MBw2JskAPiIyHPuNBtvGcBOl5zLpNcVf5of5GVOHUwrmDGOxqX
         jYS3gaqoWR98mYTL7dQakRU43TaARMpNYq519tVJeWzGCbHYu9nfQ9HfzKLuH2sofC5y
         +mUA==
X-Forwarded-Encrypted: i=1; AJvYcCXctBN5lBXEOvBhS7f9qsCUo05s/IxtJHHmIkapQjtKfLpElUP43KRrtjHOcy3VdoLHagWg3/ZEt80xGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJ8WHa/gAOqSsEoL2p4giu6lGi10XJwgIhapyTWJwl9mtyHpO
	lVjUMWXJ0SQszCf7eayWBbqhTKED6MQRS+uOzKBH6StMl5Z5QyGXALpsfZTkGg1HwfvhZvYC6n1
	GgX6J1N7+mRuMAG7AcyrQkN5R0XWS7ywH/0SIEqLmzr/2ACA55uNtHm6mGLFaoWKMYg==
X-Gm-Gg: ATEYQzyYriYD4opKRu5QPJbBOPGL04Aoln+UlD8m8yVH1I/C7dD7UtxJGfo0Vi2y/NG
	MvuLeKqQ3A81zOr5bdCS5BnluHugubxTBsRRJFzMht7256X55rge7/fXYoYyjeuZqwQkaEZxoKq
	8GukmqsbOLsaDri+Uig6EfTJ0PtgjwG2/aPMQRiqAYNnb6McQWgwwrkkU9Nc5nsFhR44Uo0MEP5
	r9x+YZo4gj7JLjpw/W5hpV2bRzcb2JSbpHflsXc+L+H8eXuGCpd/S5V/dt8YTYDPU/4VaITJy4w
	0GWyOy2LsHxmr7BySzyy9kElrmZWd6oYqFOT6VEguEhjLEkBvFePzK89DquU6RhwmWxTree0tcm
	itLupx0oftLe+aMGv+ONaAWs9urmvtCjZoTniNFQIa/af/6WS
X-Received: by 2002:a05:6a00:983:b0:829:7e6d:cf20 with SMTP id d2e1a72fcca58-829a30dfcb6mr11809511b3a.58.1773128975377;
        Tue, 10 Mar 2026 00:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:983:b0:829:7e6d:cf20 with SMTP id d2e1a72fcca58-829a30dfcb6mr11809469b3a.58.1773128974611;
        Tue, 10 Mar 2026 00:49:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b702sm12518109b3a.20.2026.03.10.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:49:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:19:28 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Message-ID: <20260310074928.sqqzyw6v7dm3j32c@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-4-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-4-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NSBTYWx0ZWRfX9VS0kDCYmThk
 LMfAIVgsFa3ShXY0BLxNecEDN0Nuetznq8bF0yaORZW63RBAOzTSeTvFtkGn+qHsBTztf1gVuLF
 ot1+Zn1Wz4IgJNWJ6MzfZglXqMZImcxcInSY22ewkvle8cmhfqenEM4fBXDZatIFC9lTuxVtlc7
 0UZwBR2GpLBeoJgWbttRlAssbVY7GMqn9KK5ir90O6XMSjmtqx/5TioWFswYs1rbz+r7YeQBiAj
 /5hNArUxkUQLqIJphxbAjAhKi/EGuVXMi/QATppyC1bpsaTAW43EXsMmo7Wa8nsoOuCb/GMsQGs
 Y/JqfIn/JMb+ZonVO5ugeED+quPjum5W0vktLLFCArGqoyKjEfeSfB/HUtmgzW25yl4U/PP59O/
 EzL1c6x2HOQesK05fu4xwimwsG8Mo97PZqgjd7nCWFWRHrRIr79Z3EQxvkSFolvfhqRniOqUo6U
 wQkq/bv3AEcpovd4mcQ==
X-Proofpoint-GUID: JKhvXsWB-WhCcVth7JeE6vF5Ez1gPqUt
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afcd10 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1m0rO8gg5OcOTR6atC4A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: JKhvXsWB-WhCcVth7JeE6vF5Ez1gPqUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100065

On Mon, Mar 09, 2026 at 11:09:05PM -0500, Bjorn Andersson wrote:
> When the remoteproc starts in parallel with the NGD driver being probed,
> or the remoteproc is already up when the PDR lookup is being registered,
> or in the theoretical event that we get an interrupt from the hardware,
> these callbacks will operate on uninitialized data. This result in
> issues to boot the affected boards.
> 
> One such example can be seen in the following fault, where
> qcom_slim_ngd_ssr_pdr_notify() schedules work on the NULL ngd_up_work.
> 
> [   21.858578] ------------[ cut here ]------------
> [   21.858745] WARNING: kernel/workqueue.c:2338 at __queue_work+0x5e0/0x790, CPU#2: kworker/2:2/116
> ...
> [   21.859251] Call trace:
> [   21.859255]  __queue_work+0x5e0/0x790 (P)
> [   21.859265]  queue_work_on+0x6c/0xf0
> [   21.859273]  qcom_slim_ngd_ssr_pdr_notify+0x110/0x150 [slim_qcom_ngd_ctrl]
> [   21.859304]  qcom_slim_ngd_ssr_notify+0x24/0x40 [slim_qcom_ngd_ctrl]
> [   21.859318]  notifier_call_chain+0xa4/0x230
> [   21.859329]  srcu_notifier_call_chain+0x64/0xb8
> [   21.859338]  ssr_notify_start+0x40/0x78 [qcom_common]
> [   21.859355]  rproc_start+0x130/0x230
> [   21.859367]  rproc_boot+0x3d4/0x518
> ...
> 
> Move the three registrations of interrupts, SSR and PDR until after the
> NGD device has been registered.
> 
> This could be further refined by moving initialization to the control
> driver probe and by removing the platform driver model from the picture.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 52 ++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 09ce3299e15c25b1b9cf6b1559850adf4aa20737..76944c515291a62fb9cb192bec5cd5c2caa542f4 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1613,6 +1613,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	struct qcom_slim_ngd_ctrl *ctrl;
>  	int ret;
>  	struct pdr_service *pds;
> +	int irq;
>  
>  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>  	if (!ctrl)
> @@ -1624,19 +1625,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctrl->base))
>  		return PTR_ERR(ctrl->base);
>  
> -	ret = platform_get_irq(pdev, 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
> -			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
> -
> -	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
> -	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
> -	if (IS_ERR(ctrl->notifier))
> -		return PTR_ERR(ctrl->notifier);
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
>  
>  	ctrl->dev = dev;
>  	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
> @@ -1659,24 +1650,41 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	init_completion(&ctrl->qmi_up);
>  
>  	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
> -	if (IS_ERR(ctrl->pdr)) {
> -		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
> -				    "Failed to init PDR handle\n");
> -		goto err_unregister_ssr;
> -	}
> +	if (IS_ERR(ctrl->pdr))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
> +
> +	ret = of_qcom_slim_ngd_register(dev, ctrl);
> +	if (ret)
> +		goto err_pdr_release;
>  
>  	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
>  	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
>  		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
> -		goto err_pdr_release;
> +		goto err_unregister_ngd;
>  	}
>  
> -	return of_qcom_slim_ngd_register(dev, ctrl);
> +	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
> +	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
> +	if (IS_ERR(ctrl->notifier)) {
> +		ret = PTR_ERR(ctrl->notifier);
> +		goto err_unregister_ngd;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, qcom_slim_ngd_interrupt,
> +			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
> +	if (ret) {
> +		ret = dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
> +		goto err_unregister_ssr;
> +	}
> +
> +	return 0;
>  
> -err_pdr_release:
> -	pdr_handle_release(ctrl->pdr);
>  err_unregister_ssr:
>  	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> +err_unregister_ngd:
> +	qcom_slim_ngd_unregister(ctrl);
> +err_pdr_release:
> +	pdr_handle_release(ctrl->pdr);
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
