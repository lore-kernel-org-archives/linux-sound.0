Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2D13DDA4
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193532; cv=none; b=dlvcr+HS3QpozwdHSFUfN5ttz0JNoGlLPjIfbxmNULzGkmAYNr+JvExz9qtCLav0mPYC0lVPXX+D4vVGjuMiwPIyVgApz1nHOtKYPJLhWQoRVoH//BXgueWQhar98BdDokUU/Q0FoLpTpZPmgsmBnyzwKXRj6y8xMHv2U2Xzwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193532; c=relaxed/simple;
	bh=5YtUYEmAFTe9h0/m9ByxK+bX3xsmB1lIBbTonuwpxL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXzFBW/RTWvgvbeF3tnfqKkeplgc6PSGyOwLAExXjwEUQsA7wtnbQLM9ytcV/iANOnebe8JCnl1/cDZzdDffa1de1UP6Glm+ViONvz1FmCWCHXzFCv0Cu4YRmRhPf8mfSQzLL8gpVTlORgxomGOnmxymqTNEMt5LMZkToeAqPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClVhRmEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffjZc9XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClVhRmEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffjZc9XN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHClCi1572929
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnvYoQz83uuHbndV1q5nJmq+
	tn2JTM91TDSnDm7YcUk=; b=ClVhRmEdykA/wzekWq7Ui6cVkrYWn5qU4rGioJoH
	ZCBDRTCEirktT37AFltIBA+AuUWtM2vm4XG5BtD2ctSJQtZ7jNFQidtijVdOxyPA
	WiEbrqB+TGW5UDz0fi1KdmAuFJm1h7YCAYCPlHf49xtZwrfn94yYzAGH63bGOXeA
	zNmqgOWRwkbhSqiOeEY3vueBQe1DUT/oL1yfui4j2InrRPr6hbtl3bIGb/UxG76w
	c9AaHmhVfj71vPsS1SA0y3pjJc9Rpsrajx4pCGGcadxSQ8T1yO3asQv7ESu7hYx0
	bTYu6fuXE/vI8iHcNZ9NGCj06THoRvLEitYXMUnGS9drwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9fja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:45:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b19111fso19128481cf.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193529; x=1773798329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnvYoQz83uuHbndV1q5nJmq+tn2JTM91TDSnDm7YcUk=;
        b=ffjZc9XNnC3iTGt9sAYTjR5oFxXs0ff9XMoCtnay1UCNPmaOuj2rqe815syF5Jqcdu
         zocDcLzIee+DYZbRB75T5qBFICSa1MdRtN7Phs2tLwFX4CRPtUA1ezaSiYEvHCb3XkTR
         1O+OmVroAdH3vhGsCsYaky6Iv2BTleNCmULvyl9Pi5SVFp+suPGAhU5Vyrfed8AuxVI1
         kfS/PNIxSsrrnJNZkT3PjEKCmSZORT+d7L6E6ljSdaYPeBYKIgmsE78aioHJZphgrkrn
         pGe6hE8k8Qi0378QnLrMopPIhIPnJdxls4Cyunba361Uw/ME4VvEIQDffrrD4/l6yp9W
         gr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193529; x=1773798329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnvYoQz83uuHbndV1q5nJmq+tn2JTM91TDSnDm7YcUk=;
        b=XKbRDR93AkAC17N2hprepJZYTFzA3SCl/R9Vt7H4S7xeKutnyxVuyJpRA/vFzsegzd
         SSVzxegESB0ABm0S7w7dQhQ3ATBO92ZBNG20HufgKp3+YZaehitRlc38Mr75fUHPlniu
         C8m2pOTwzpOLsJkTHMISdee1n7/RhIKTANpYYZ39WMvBaaX64gos658qoacptzFEs3Xm
         aNJwoexJ0dboggem+qaKEOhUmiEVVZI6e5GWKVfmFlN1T7rZZlK9UZJBsbUKDGyXQire
         /T5UKtKHyYyem/kXOSy69xToIlwVh/+SZU7t9IpXCwT1z7FGpkS0QZRz4ky3QZvYWdBD
         8/5A==
X-Forwarded-Encrypted: i=1; AJvYcCWWn80umqPO7GE6lR7NBYrbz1K9ogaYHAaPA2UEFvwDTNlNRPxJny+rQfnUpGK/89PDylHFZ4IlzuQ6mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyk+S8tTPl8btbOFbjNieu+2cRUq/n13nUOQDj7hs7zezBfPV7
	/nNRu6TvxRia6aaPa5dY0vKEFQAALiFC0D6kSd4XAJ7auWaE5fWqECXzttjsILBRYuNcLuk453q
	VpW5tpopV1zHNDLLOObp4Hr/luxkNnxojYwYmPZ0Q9cnOlwtt3NJ0gtUXm5Wmql0Ang==
X-Gm-Gg: ATEYQzzSVlPOq7ng7UVWau27sP31/7e6oGpqjawFqqxjCtfPSdsPi2TKvv6efoxoPFy
	tQ5/siKwqINxBlv7KLG/Y/bwLU5CYtKQyn5U9no7nUBwY1qIt9HFHT1pe3x0vg/QOMDZ8lyGGfg
	TZkC6AISlRG4Jhm5mEizLnuUw2XUxKi8MtDRvtDAPXcw9gTp/vqHqvvtQLa+KsW61daxutFyEZ5
	oCA+gELhnQjgvlNXXpvj5+W7DgAJkmC0yFtz5cv0krbeqtkQRSiVjp/noMkSv80dmGWul7gehHH
	x8r1Rz5R0hpa92DZ/4RTqDTRg36llZxRkb9CoOflHNM5pdjDJH59Hl5cCALOZU3/rHjyk+U8VHf
	Y4uqK1c+yTi4ZDURIzalaL/thnxjlnoyF17WXzM3JT1qXIdRg/PNOHxZ1zfNSBslnsKG9UHOQHH
	2MPLlKhl3yo9yJN4edB+RIhn6CKWxtq7faT18=
X-Received: by 2002:a05:622a:180c:b0:509:379b:d48 with SMTP id d75a77b69052e-50939f530camr11693091cf.9.1773193528712;
        Tue, 10 Mar 2026 18:45:28 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:509:379b:d48 with SMTP id d75a77b69052e-50939f530camr11692941cf.9.1773193528307;
        Tue, 10 Mar 2026 18:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm132524e87.7.2026.03.10.18.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:45:27 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Message-ID: <auuvpevzpawojqo2girimhfaudtueukbgibklfzwiseslpswmg@qto5chpsermz>
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
X-Proofpoint-GUID: STR8M932ME3u7_7y0CBEqQwTI5mJgz8E
X-Proofpoint-ORIG-GUID: STR8M932ME3u7_7y0CBEqQwTI5mJgz8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMyBTYWx0ZWRfX4AKCcIHOiVSF
 oLVmcu3mzNkTUfP4905zxRNtICaQ6W08kmY9F/BpK9MJZVVOIStSW2C71cPLSZeB83epxMz+GeK
 4GOtC0pcvTGhlUyzzGJlP89qDuXmumfgWp5NhGtTbbkSEf6VYW7Aj9G2yEDUZZWRCM2ReA57uqv
 ylTkWtXz+Fx0eREc8GI74a6utcbUDGCNXwpwGLPiSI1YRzo5fMDCJakzOwQQvG8kkS7AGiDa5h5
 wtu1V2h1afjUTlVQJjLgMMHpEB0Ac5uFgl/dzsUfvewAKvnOjquioUzMvs0IshcsS9AHybHFhkp
 Em9QPDpBfI1Sc2irUc4xmTuvrofH9XyrCde7BEtAujTRDh6IUguok2yovfwxd0IiHoGBdoBoNZo
 5qpgn2z704GhrrqMnjdYE1oJ83sFnuIER5SgNzu3YdPxOjdtxpnTngFBH5qepOidplrEW0DKoKY
 R0TzgGtv7Nk2tGlNAPQ==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0c939 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1m0rO8gg5OcOTR6atC4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110013

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

This should be still called here, with the IRQF_NO_AUTOEN flag and then
manually enabled after registering the subdevice.

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
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
