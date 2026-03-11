Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3C36DA09
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193254; cv=none; b=ofBotHLiNaN5msupXVDPZoDg0zV1lvPe3EqxPfFbVX8uTXmxHk01vQ9hqZAooA0jlBnWV13K26XMti+g6h6+HAr44mNRHgIegCHkTR6QnsKB4r330uCou2KY/CeUtcZgyQs/aWJCzztXIabhK/3238l8mkMB1aVNAoePvaT38FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193254; c=relaxed/simple;
	bh=vCiAKWhCgsidC7oek9Ay9QTc4sCKED8hU7eeL5sj4jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hq6zKkf08lr/UqqGY027IUCRcqMLv0wwQKwcWhGFMJB2PDVNtE2AZyUVL5Q4kFi3Mq8FMbOGqcQgySFpiBfktsTngG12aW2fMHy7cdBoVQnCrOyI+rse5F9qDbCEztXyZ7hYEeRhOeQURlJ6hF+Y0cy9SdOR7lHg84lVDDFghHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkAkIWNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJaYViwR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkAkIWNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJaYViwR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIv8pQ3892673
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Udn45LWFERaEd0YZfIKTTQo5
	P/rO0L2SyvgS5xb5cQk=; b=RkAkIWNHggzFlCsmUHBWOtt0Fg5XOY8XPhTqjKQn
	TCfnuInl1Dqk1FOxv77nzqCcyXKdlNbvDbynoOVOjGpkTO0KEUScG5AkjiAMIuHr
	MIxKE5Qf4ldLo3p1k5p6xFmy/Rk5EPLTMjKz4pK4OFYxGXfvvxeteY6MaS39GQ9t
	XoA0LccKZYAl9p2hqJoLtvecrV9o1qJyQlqST6dNqLaAIYn3aEbYzPNmpzoUaBjs
	/hEXnJ0FnT6XnrhIaS0IunDfkT7wYTudN7wNPh1zjuQ9E9EbsvDl+UXHGA6L8Hjh
	J3YYTMwC2AGY2l+Ynp1taxOLUJ8TE7zZrPSst+x8VqoxnQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmytkxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:40:53 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so144314833241.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193252; x=1773798052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Udn45LWFERaEd0YZfIKTTQo5P/rO0L2SyvgS5xb5cQk=;
        b=QJaYViwR2jWpBak0+cMybVGtjU2viiplTApMwRMJj0eX+WAv81JYgQmzbzb3muvKH7
         7pR2oGNZVMv/Ll23reZKOKFgw+XyUUEDHEalI2fb+k56Dzmm3QaxUN8Iadtw/8wj7CRt
         FqZdUSNd7Cqe52ssnh2+gYSvVp22VXzLQMeGLFuvhmhiRSubbW4m31pSy2sryNG+VWE1
         DNqrFcqf1IAG/Zqfm/hj+6/awjBqfazJKnk4l1YqBdN+3C9ApBJWO6MKZsn8KicfMNYm
         +rb0HQgzCqbG4Q3uGqJwEcbha3s4cXFAvEzfqEQ6zW9z5196o7ogcFBXj72ql2RQrgcT
         Q63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193252; x=1773798052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Udn45LWFERaEd0YZfIKTTQo5P/rO0L2SyvgS5xb5cQk=;
        b=a02yAb49jsHAU2e04XE6cAJRu4Q38CGlOiymBo2Qqe+n19MO9u13fGJlNOcryyXID8
         0J4ZSRNEXFGZBJr+Xy5Tlg9kwM3sTxZegeBY6Jpt/HeP4GkoQG7B3qFCNU6jv1hCMiqe
         AIIoJJf/Rp9H+RQHXu7CJCqqE/A8/28urjkkCy7TOMCzi+1nlyWa7nOSQxJAOKXjm8pI
         pWZSc9OvHYuBKmMz/FnwOQwfzR2yQNjbnv86hReCiDHPsaIYAFR5Yq4a2N30vK6U1U94
         /HT679Hq/MN69amngEEzNgEkGqep2QQLPKqJGyTDFhmZIH1pWbsOT1ta9zzE4yX4SO7y
         6kHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWlUh7cBf5eub4YPABezOXBOAuY0L/gnJIXQSM/1eH6szcDICAPRSS6d7RyRki/5Z2pHEtBaC2aZ/TQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8gLgVrknRHCq9s/0f1rijd3ZmgKMDwb/5BkmHGzxBHyvT0ql
	Aa5gZ1u/SRVNxs9vnOgqTrRKdhsFPVISCvRKrhxIhTEmh+rTI3tDOJYVTXF3aLLFnbGn5eXRpJ5
	EUxK32lwfpVlAArkpn53JrYS9LeRrEOK1pUPTHr5Q538ZxqKydmFECNcixcIlbJlmEg==
X-Gm-Gg: ATEYQzyEfT+HpV4Yq3U7K8lfRe1bmuB6en6vHWa8BkVQSdNJYbuU1cChaUyQ/tH19Dz
	ZkufSDxnUn2rlwjpUMhJBwRJLAhQCzvkv9okPsH5vvG4IpSnaLPKnCcQT5ZpXI5b/JL/xkmtVKm
	mkElrNiOnpsKc4e+W2IPHIrz+Dokf88HPmgbrMalTZaI9v+g2mWQDNMOJIfZnW7v5wcel7lpagw
	bPcocCShgbdh7q7ZSqlz+4nUwPZb9k+IXD2fPHwUnjWQ9b7j972TuE0z8R3skORdH4Z5O5iqPA3
	F8JzPY1KM/hCELFL8oMCpNR7C7gozf/tTh0OJvdrK1WXbe+dWqyq5pDMwHOj2wHS3d5mTwQHx6A
	EXRwjAmGOhkSj9dhcSMV7fZfT6w1dQvwDK9QtvWnuDC5p94mCIm7/twXGm/yR28kpPB/hF26TeJ
	+EX2GAQi0H568+Q0HpKrj5RDpsjGYJE6xrOPg=
X-Received: by 2002:a05:6102:5113:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-601def30c8bmr363075137.25.1773193251732;
        Tue, 10 Mar 2026 18:40:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5113:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-601def30c8bmr363067137.25.1773193251329;
        Tue, 10 Mar 2026 18:40:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm1001861fa.22.2026.03.10.18.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:40:49 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] slimbus: qcom-ngd-ctrl: Fix some race conditions and
 deadlocks
Message-ID: <noodhyin3en2l5xravmt5l6dslcz74na5akin24zod2zhmsevo@pqtxi5ydbidx>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0c825 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yjtLm6vEFEQHtkmbwRkA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: BcUtRqtHnh0D8U-Nx8T6ilidhf5Ew83i
X-Proofpoint-ORIG-GUID: BcUtRqtHnh0D8U-Nx8T6ilidhf5Ew83i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMiBTYWx0ZWRfX1vBLtc+uIkOu
 iAvLI3e5FOdlMnoz0Mfhqlnu5GEJ/fvAPgBROit8Er8Ka0+2d47oEovnlqBqhyzC+26hBrOl+2s
 /A4+HoGBZJFKVtxfNPx2yaO+hvfGPEwDDqBf9aWuqkM0sKyD324xb+upYLhUul6wMLhd7Fbg6Fn
 8O/23bRXTXBC+HzyqeS9fqwc/exmy1igmHXcBMv/QE+ofcwY/PR/AwtyMebtrqsRmG6jtMAmrzN
 16i/sbceeSSrFlsqHyWAhcKcpU6JcKyUFR/bhAa7Wq5sWBFJw9xtJp1MzoLdip9NpZm+d0kF/8g
 f17q3bHv5Fd/EmGdg/ZVoBR3UH0Mc+K4gy3ukqyg+F2Au5dNttjpsP59cnae93PmY8v6i+NkViY
 p58UwaaCbs+CIJ3YZbN9SDpNF5dSIZGtsJOdmBuEAwCYLuOqsyOg2qU1dVHQM0g8oOY7IKE01hC
 j8LJzjxDRyMkeO6nVGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110012

On Mon, Mar 09, 2026 at 11:09:01PM -0500, Bjorn Andersson wrote:
> When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
> SSR notifier will fire immediately, which results in
> qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
> unitialized work_struct.
> 
> The concrete result of this is that my db845c/RB3 now fails to boot 100%
> of the time.
> 
> In reviewing the problematic code, a few other problems where
> discovered, such that platform_driver_unregister() is used to unregister
> the child device.
> 
> Lastly, with the db845c booting, it was determined that attempting to
> stop the ADSP remoteproc causes the slimbus driver to deadlock.
> 
> Note that while this solves the problems described above, and unblock
> boot as well as restart of the remoteproc, this stack needs more love.
> 
> Upon tearing down the slimbus controller (when the ADSP goes down), the
> slimbus devices attempts to access their slimbus devices - which is
> prevented by the controller being runtime suspended. This results in a
> wall of errors in the log, about failing transactions.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Bjorn Andersson (7):
>       slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
>       slimbus: qcom-ngd-ctrl: Fix probe error path ordering
>       slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
>       slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
>       slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
>       slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
>       slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock
> 
>  drivers/slimbus/qcom-ngd-ctrl.c | 127 +++++++++++++++++++++++++---------------
>  1 file changed, 80 insertions(+), 47 deletions(-)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260211-slim-ngd-dev-74166f29f035
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Bjorn,

While you are at it, it looks like there is another possible issue:
ngd->base is set after platform_device_add(), possibly letting NGD
driver to use uninitialized base.

-- 
With best wishes
Dmitry
