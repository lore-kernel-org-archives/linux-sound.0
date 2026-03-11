Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6736DA1B
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193038; cv=none; b=g0vtCUKboiG/GQ9k4RB8FJXuiUI3R5DTN5iXR8ENHI0bAbpTwd1V0+QukW54T29J+L1QcQVF8/+gr+KONRYz+7Flnz7OfhVBB65/bbrP24EWqJKWpHAlZX2G4RpVOFFacIQMTF422zWCY28iKwDJjhZjT1FBgw3Q3HGO4Qy82n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193038; c=relaxed/simple;
	bh=sY4VrqF9ohYtCj6dkipnxOwbA4CLc+4Y+UVOTFVVRy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNs2d0XXF5T6QcK8C6mppW3hvOsSQoGTgH/TDwyMjhB1R+5oovZv/DwSuRj0KW0Qs/6CaU0FSB2zCTo3UUPwbP1X0odY2zKY0BOuiOKKuhwDH1MSwiKtb/rbepYACaA7QdCokALza3N505gbX3WdJhlzoIasWga8Q+SJNG27q7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDRn8tRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WH2IQP8r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDRn8tRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WH2IQP8r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIeJ4b3759617
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcSQWdzB0re7FA2BhCO5FeuR
	05PyZU31s8Lle7bw8c8=; b=PDRn8tRUePtAKL42DAP8O3BQnzPR77oGDljViZes
	yld1CInidI1Mo6d5MwPm5/oXAVRqKvFvhRw8GHZUgCA2jETar5G8id5/6osNScOk
	a0FzdY1PTYERk/UGqEn7Hg1rPRbPCZX4ehZnYbLpup2OW0Mr6sRg4NDzf0bAxA92
	wXpiK+Gz+KC3ml/G56xCYZWKzTh7qmd642+8efNSpWaXAkuGbNVd6AUTwGQqPYMd
	C6FS7tgm2IUZAxDu8BlLRsLTA633Tj7r/n6X0Qc1sbEqMr3umVrdSjotemGexfR0
	o5lOKCw9JqCE7peVAXRUcre63NM27seGjCQH89YZXBOC8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujq7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:37:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so240005791cf.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193035; x=1773797835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcSQWdzB0re7FA2BhCO5FeuR05PyZU31s8Lle7bw8c8=;
        b=WH2IQP8rd3f/+8Yd5jNXvxakIVV/e9YUZqn1zufITQf74sYzn9Ck5l6QybchytBBIl
         yTdesW9m4t62n7fsfE1H5HmEoRJ3QEWNukXV7nVfJ+r+TXw2dOcWeFYw1uBz4yp+ZEY2
         AfthL8idNF9CiiE+ReGvmpaeCBIgiFVz2/AKkxGsf+hXIuR+190A6f0nBraVaOjYW6HT
         LYd8irbulxN/0tRfO2Wsn5PAJ4tesLvtw9WZDWLDoQX88rcHWmbsZ8vFroPO/5TmuggK
         5teQzLU1FtGF/GamsZ2zicTOMBBmtL/faBAqi5wDYZeRZ967vnTaoerVnzpx9S6Nqr6/
         x5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193035; x=1773797835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcSQWdzB0re7FA2BhCO5FeuR05PyZU31s8Lle7bw8c8=;
        b=MzGkgGSWlpwDD5yjlJNBPZh0ynatmsS7xHgEKWZ0R/RvYx6XyKC5Su7G0BbWrQXwO5
         UF2ycGysjE8OfHbRLHs3cSFX2co61c8tDvAO0pN8o83qYK581YdQiSNQNGhof2+hyGYx
         rNyocRthOWnKG71zKbVU9rmTEa+jvTDapH7GiVLATuD6qUvI/u1lSFJa9s4G39hsD21k
         /6IHeMVdI3/XqAq/YkbZVQ4ilPwq/0LTCoRSzK1FG0fqJYY1pvRqpiyav4rbCPClBFSS
         rHq6fExV8DElH54ZjUeOl7TE0XLx/oMdiR2e0QnR6kSQYfpegBBzAqy7GnxtGb5sM11v
         88cg==
X-Forwarded-Encrypted: i=1; AJvYcCXfb2b7KQPZUXoiMyhDklHVsoypZzkYwxjS4Qlt97seyPUWRhRgUzI65tfhvtV0oQlN6lQ8u1+0WylxoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEyNglcLp/7W07+Z79UceK+I8+DNYyqzpvXos8NUkB+GhLErg
	X06bSThfC/+WdxDQm3Tyab7ygnXN+haNLVkmUXgR+pN62uKLga5K4bVeXnRcho21T5shhlACgmW
	FQtDTK75DdDAnW/CFwCcGquowsSHuHx2aWzZl49Otjsly/N3oRVJ4XK+YZpwDp3R5yw==
X-Gm-Gg: ATEYQzyB+3qPtgT1GZ0q8aGe7ApE6iTPW3+FKTVjEubyYemZ+t3RQ03jvt1VbxV1mDQ
	MLl22QvKp+c5uBWMLC7GQkWqdVeXh29c1wJHOITAqIrn+0q9Oom1i1e2vflEr7HmPw6C9QkffjB
	6lpErVvki7+4VJ7xboVnbanhPmWYyJwpDrw4VYa0ezbYZftr8TgKH6vRdkrIq7eSKM7aC3XrPCc
	olZhwP+jH1y+ajx/qbf+QdL+Sq+oe6DAsHqCCG1VQdtyKdgR1kJQAAYhLLN//Yj+n7j1ivMP0cM
	4iXDcdeiPuM6zz4K4OZ7Jv4hayCptYMd3uNbE+HaiSBWtsCq4ni1J/u6qbXOoHPEOjG5J7HXNHj
	lUNfeJTo98v7ft4XdAYvx+ZBQEL6l1bqjGhhOPDj916wYqLWqpfGwGYCPGsTlxeRzh19TT7vCst
	GG4LYyYeegs5K3f0uSpHGlp8+7/Ll9rHp11A8=
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cda1936e12mr126921085a.5.1773193034941;
        Tue, 10 Mar 2026 18:37:14 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cda1936e12mr126919685a.5.1773193034394;
        Tue, 10 Mar 2026 18:37:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm131098e87.76.2026.03.10.18.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:37:12 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:37:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Message-ID: <eyitss5zwougawqadgpfb2xa3tv6nbqtlte3iou5aut2neuptw@ehktjxi66a33>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0_HfxUrjUIYrcA6wEL2Xuy3Gw2e0TtFy
X-Proofpoint-GUID: 0_HfxUrjUIYrcA6wEL2Xuy3Gw2e0TtFy
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0c74c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hSI2FgT3CeMcK4FCQxQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMiBTYWx0ZWRfX/FCOEbPlHZCt
 f/B1TqBm/1X/mC2Nm2PLcL5ytiggUnTtSdbaZUBUeMqUXIxQWEQMh9ybLvM0jtTTFxg+DK6pG28
 emFsH+2fH+q98VQ8X17o7vW2+TTn8r7Oo6FC0P3uAwvGXUhUgrZM0i6MKImZgfH4SDmlEvJmYMx
 w/3DF33z8iLpTCKkjUlI45HEds6nNYL5faNsPBoJr/DNT5f1KQIcMY41F1eLRRaMunsTo0cYPCO
 pCYe178NiATojbXxO/KTCh6ObJ+csBcSqr5535y3EQIsh0y2aW9D927RqXJh5l3RED1Q7G3k9Wv
 4g7IsxFiDHPAxUlxwubcOtYBy78y5q7ZqltUmiQrq6qG27att4if52zMBA7rsTU9EF807YVxBBO
 PvL//wyaEbX8EObDgCbQ1tG6re4GHF2YxxHkiTksNUo+igjTpWKkkzfyA/qNtJuWGbH3PEkpuBa
 F+vDF7FuPXEtLuS335Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110012

On Mon, Mar 09, 2026 at 11:09:08PM -0500, Bjorn Andersson wrote:
> During the SSR/PDR down notification the tx_lock is taken with the
> intent to provide synchronization with active DMA transfers.
> 
> But during this period qcom_slim_ngd_down() is invoked, which ends up in
> slim_report_absent(), which takes the slim_controller lock. In multiple
> other codepaths these two locks are taken in the opposite order (i.e.
> slim_controller then tx_lock).
> 
> The result is a lockdep splat, and a possible deadlock:
> 
>   rprocctl/449 is trying to acquire lock:
>   ffff00009793e620 (&ctrl->lock){+.+.}-{4:4}, at: slim_report_absent (drivers/slimbus/core.c:322) slimbus
> 
>   but task is already holding lock:
>   ffff00009793fb50 (&ctrl->tx_lock){+.+.}-{4:4}, at: qcom_slim_ngd_ssr_pdr_notify (drivers/slimbus/qcom-ngd-ctrl.c:1475) slim_qcom_ngd_ctrl
> 
>   which lock already depends on the new lock.
> 
>   Possible unsafe locking scenario:
> 
>         CPU0                    CPU1
>         ----                    ----
>    lock(&ctrl->tx_lock);
>                                 lock(&ctrl->lock);
>                                 lock(&ctrl->tx_lock);
>    lock(&ctrl->lock);
> 
> The assumption is that the comment refers to the desire to not call
> qcom_slim_ngd_exit_dma() while we have an ongoing DMA TX transaction.
> But any such transaction is initiated and completed within a single
> qcom_slim_ngd_xfer_msg().
> 
> Prior to calling qcom_slim_ngd_exit_dma() the slim_controller is torn
> down, all child devices are notified that the slimbus is gone and the
> child devices are removed.
> 
> Stop taking the tx_lock in qcom_slim_ngd_ssr_pdr_notify() to avoid the
> deadlock.
> 
> Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 54a4c6ee1e71fe55794f09575979826d9aa5be9f..75d70de0909a8d17e2410d30f7811f32d5eebea3 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1471,15 +1471,12 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
>  	switch (action) {
>  	case QCOM_SSR_BEFORE_SHUTDOWN:
>  	case SERVREG_SERVICE_STATE_DOWN:
> -		/* Make sure the last dma xfer is finished */
> -		mutex_lock(&ctrl->tx_lock);
>  		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
>  			pm_runtime_get_noresume(ctrl->ctrl.dev);
>  			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;

What will protect ctrl->state from the possible concurrent modification?

>  			qcom_slim_ngd_down(ctrl);
>  			qcom_slim_ngd_exit_dma(ctrl);
>  		}
> -		mutex_unlock(&ctrl->tx_lock);
>  		break;
>  	case QCOM_SSR_AFTER_POWERUP:
>  	case SERVREG_SERVICE_STATE_UP:
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
