Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F67340A6A
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137008; cv=none; b=UqVNpXNXzeZHC74vekAwfKSvpR2rkUE96bfNbv3Jr4UNfAXWAD5OFLW2WKJl0dyjtRP3E75ENCCheSbIagPU6CE82VAhrFvtx6qLu5paBWN7E3T+TBrf0TYTC1/yKrQGFKuaV5rd5enNW5HcmVEY8ZAtc0Q0Kwjpp5i1U+Lgi8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137008; c=relaxed/simple;
	bh=o9f/DfHjqtLy+XwGn36m+PNn/X6NRNIVz3RHPScRFiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX8Pfc5DX5C8mBbYm7fLKk4FQw8lfNjSQE9sGKtAz+nc9eM33nhhVf8I9B2P4dlCQrNe99Nw39xIMX29UN62i70LDX3WuGekZcXlWZ2T3gPV/XQf2l1vkBgrL33hVY7+KDT5jNnEiWItUoIVYyfbCuyavXhTuOA2Nj68gOTdah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHVX8tKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXjCmikU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHVX8tKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXjCmikU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8xhS12362950
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 10:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tu7WN51aRJ2MI3GqxMQYy2+U
	xQuZDNaiymrwuxW8PZk=; b=dHVX8tKt26G23kTAY4KFx04HrJFv+LHqWlxPmEAp
	s4FFFTUFnSKQ2POuLOJnrIJ6HArg+nbvpO0lJfBk8VlVaBMDEHx2lZDmN9TZp+7X
	J8gFG5N84PdMjtvbhftr18LxB/d+hM/B+G43Fqp+j2l1OB1ENg2wG74TgjkuJN9e
	dC/7hY0Spk7/kFAK70iAFCE1y2UPJnIyo/AzgNxyzQyMLfQFg10b8ACfNx2+J3we
	lY2qTr6TXMBu6uuGKIYdVcFp6Vm4PP1bDc7kG7FsBprDfop/Kek+Y1eWBHlVTs2M
	Q4sKOb+GmvuQQafiwsKnz3bz7eIqa1KBG7iriXJxuRA5ZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032bnfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 10:03:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35978cbc54aso6608823a91.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137006; x=1773741806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu7WN51aRJ2MI3GqxMQYy2+UxQuZDNaiymrwuxW8PZk=;
        b=SXjCmikUU7Dx2GrC7P0j3B6EnL7fs9KcFpugIPkqG/z0o57TFcxlJfxI6V//6uXSbo
         v6gznRNP3Nsxp9TPIYqhuUE1DRIPX5oqUdDkA2WDSeytrRMcHGLsdQ9hA6jC59mkPx22
         188TiV0UomoncIN4tdJwhNRU4RsZwZepKshuQ8Fdz1Q4jMV8b9WqFPFJzNWUA4ZJaxW8
         zOhIw0OtUuio4v/mIH/0kD002y8B+rIaXDhUuwteLFg3nAat+U6z+g5bi8W+DKjPA4uq
         cPttyoHaMbqw6UkYMGDJyTJ8s5c1bDCfcCaiX5zK519q0Qsnyeptgj++RH1B709+1/UK
         whWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137006; x=1773741806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu7WN51aRJ2MI3GqxMQYy2+UxQuZDNaiymrwuxW8PZk=;
        b=fKuXZUaFNqasTqbg8W4w5i+P0xqSFEs/murO9NgFLJ5+OMY4tqbCStmdzhbICGQAyZ
         xYmPc2xng6y8y2cZyLo41YvboePVuzRUgiS0iAPgJhuBmRQBIZjIaQ9HQgAGAACmCqdc
         B8cDMfn82FJbljaw/KoH9CtHI1LXTX4y1BCC4q5OZeI2g5n1m0LFs8QiyJa6W+ppDzj3
         3QzlHnvqqRA0oRQfWPRU9py2BnUZBRMPuZ4NSQUSfKZyet+jfHlg3NW8Hm3JaQy6tpf6
         vTucJgPxu0lwoydZFeQHz3n+G2XiLhCROsuC1+B942tpLep6Qn6uGxIIvnFRPZZB750s
         +D+A==
X-Forwarded-Encrypted: i=1; AJvYcCXwcLR+H90AnHE16Mtli0k9v9uSkJ9ziFEnswZUoEaY4NGFCyxB68ska2uLvb9ad1iJnvTzEh7UGJfa/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwVpW1fzGJryjWLIaIzhP35XZHuOmmQbEbhPEFAk44Z1CEPQd
	9r8QFEeERd5p5n3hSq12LTk0wQJu+3+tEffBja5GGxVyPVoPy5l7TtclhIHsw1woKX7OAxXYJrl
	vEAE1X35G3kXPMbi8WZ35lE/aJHuSHZX+PDCvBo7S3LFeNNsSW2kNk/u1DSbj+sII3w==
X-Gm-Gg: ATEYQzyQEzKyxe0f0SYZ3vytuottjAhxgcjaCG2P8APTcg6FV8M6nn6KrG7fpYbX3Oh
	u+1ctSHZtb6x7a9Y1L0fEzMP512iw/MzGvBhis6Ga984iczArJIbbtZxVyTHCJ2Cu14D/qO0/1p
	fw1Jd90s1iNG+XEkVqapswomtWdIKEhUA5LLDC0jyabQ/IZsY15bjp9xEy9SyGphAOmtrMGx+Gt
	/fnNe/PLdRe0A26clQ74UWeOrSRINtMxDouT+ixDIj9FiBY6L6hVrWArNm3NwrRaSTXE6/GzqQx
	Z5Er0xk//NW/AK+s+tDdE0UehjDoYkPrbWvOrAShJ8mhXLJFfkBOPuIv0+J3BXGevFjL+7Nby3A
	mdfc0HA+f/TF2cqZEvx4pwlH13CTjXvH9EIfuY1RU2Pu7d/YV
X-Received: by 2002:a17:90b:52c8:b0:356:21e9:73ff with SMTP id 98e67ed59e1d1-359f039ada6mr2344269a91.11.1773137005729;
        Tue, 10 Mar 2026 03:03:25 -0700 (PDT)
X-Received: by 2002:a17:90b:52c8:b0:356:21e9:73ff with SMTP id 98e67ed59e1d1-359f039ada6mr2344248a91.11.1773137005091;
        Tue, 10 Mar 2026 03:03:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee152sm3365248a91.2.2026.03.10.03.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:24 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:33:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Message-ID: <20260310100319.fzucrw7do4bxvghv@hu-mojha-hyd.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX2mpKbrTeyPp9
 /AAka1GbkC1wBbCF+TT6nfrHdftn90h8ARHplSKizOrjy/SKP7F4lFEbO8bMbTodwQN4WFy7kP9
 bpST5/qe5Absh/pMYHLgybg3+NUWPT66CHh2qkuy8wDdj9eRug3duc7oQw/JJNNt9lLjqRuNuOT
 HbB0OlaMwUNbUOJ898OorGPOEZDqosVFDeEtqX45XxFliTOT+5E8c1JADzLhhll9QIS/rptV6Hb
 x2tqK0iUUSA8oAtoAWSamaZdnhlXZ0ZjrdDcgX16++b9lF8DTjeozahiYDiTuJ06rfwxwSbE5gG
 E7XmIbdRqJC5vUGkhkcLNJpZV6GpXR9sebaAGmsUVdZq97U44toQOiVqJQp4lLZTXvLCeM/wY01
 GWYy3pQf/4tXlNCRDM3clhflMEU+9zpvEiANAGRbEf0/NetoO8Ysnq40rfZHfpXkKG5vSJOzGIa
 j5/0YwSXThREa6XvDGg==
X-Proofpoint-ORIG-GUID: _fp8VpjENSQYsUGN2-33lNg4nvEytDF7
X-Proofpoint-GUID: _fp8VpjENSQYsUGN2-33lNg4nvEytDF7
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afec6e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hSI2FgT3CeMcK4FCQxQA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086

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
>  			qcom_slim_ngd_down(ctrl);
>  			qcom_slim_ngd_exit_dma(ctrl);
>  		}
> -		mutex_unlock(&ctrl->tx_lock);


is it not much more safer, to put this tx_lock around qcom_slim_ngd_exit_dma() ?


>  		break;
>  	case QCOM_SSR_AFTER_POWERUP:
>  	case SERVREG_SERVICE_STATE_UP:
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
