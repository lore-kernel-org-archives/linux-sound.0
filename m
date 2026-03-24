Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487BE2248A5
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 00:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311875; cv=none; b=D9y6OQqYRbtKp0A8hcaTfi6MRju14bMxG6rP7Ot5duo+fmsH/ftCacrmjL+0hUIM6/+5RWX1rUIRlxkFyg8gLAsy7QNAla1ircDD/9Ma1kQd5zCaotPkALLI0EQ3VyN98SR2g3R/cv524Lwjo9Vamo+Wwc9bINhP4QugWOmR+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311875; c=relaxed/simple;
	bh=YK5TERRY/+6D57JFkiBOR0WLZXHTALD8xXQfc9Im0nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O55ps+YCh4mq6tHKb3toMxjnoOpDAQTAD+09hl3VyGhdgL0Bzu4qynVpHRYk4jojMMyRFVSPP8Id3zHaJ/vqnIVzhmOHi4PNlpGuO7rP0OrwEYpfzeLydylwyiL8ULgHpM7GV+vaorgcAl8aLbpPAZBplGg9Ni8ER5iSDmVofs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3rYBy64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1AEn4w7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3rYBy64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1AEn4w7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZCf362526
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 00:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wdOq8v7gZj+Ol/lCA+UFTS9F
	QjpcXEmDJN9gqTOKAck=; b=a3rYBy64Vr8kYgpwtrvml2XWCy0dQtQF5Te+uFGO
	BNy+2ulYf4oG0521V8UIEm+sBUoCf5QaVpQf/coDwvmmCsYNR+osn40mHey9yGOg
	v0InnNngBsSMZ0hbZmYaDonAzGUot4sK79eloWBGGiZL/Ag6T+Lyxr/WnoMPb+MU
	Igc5hs1H0xZBu7mpw+71xkyUThpWAjY+yJBwBbQJA9MBWE4kjXtL0AEk0jEu6ChI
	XHgh8sAg9EYW3kDn5s8IYhZwG6G+pFpkFPKRqhDocHH4BdK/6jfW9hSq6K82nhSI
	B0Mkjus8Bw2rx3xiQ19trQzkNmuLfECJZwrXS4eDHEpiWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32q11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 00:24:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso300016851cf.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 17:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311873; x=1774916673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdOq8v7gZj+Ol/lCA+UFTS9FQjpcXEmDJN9gqTOKAck=;
        b=d1AEn4w7xyvgwvUgPqAlTtGzXOWDGn5RUSjwg3fNrv6jfRWJJFgRn44Wt8sCub636O
         9rgFKvwjnzHeKZdHC1dMZpY+FW3Yueo+qtkFb0bSr4Hy4fuMzPG8IOU+vR7cq2o+UXKV
         V83PinWFkqEJhoM88rqc7GhHSarXbYIU5oWkvQFTdOOrTdvYd6twCntMsLs5JgqRnVT+
         K1FSWKRuydI4uqpFdQbfpGwsNlFTu/owvc5WP0Vygxa+fpcuBQf9DinmHyWYXlvRXPyg
         wxSwsUPkW7pAh3Xwrrtcca7mou18sGDmMs3fzNe5vfX7z5NeEeOF5vjk7aNi9+P8raTA
         +BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311873; x=1774916673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdOq8v7gZj+Ol/lCA+UFTS9FQjpcXEmDJN9gqTOKAck=;
        b=b3F76uEgkSy5khpI/2CQRfa4Hkau3f76BmbSyqwQ/6Z+EJL9S2CISOE8fMBgZSKIWR
         l31g56C1F91lrrhzeCTQwMYP+FnY7fwdL5fylx7wxA0s4cDYbmaJqo8BgM8A9nHoauAz
         rKfAkkCzPqEuNqgSsDAmraittecqbfVSXDCkWkJsnMicON0J1N+enSzbirdX9EHCYDY8
         g8CGMcRhqEjn4gPoHg1j8qlDPHXfcFcGE+bHOl9SZAm239S8D99bwt+gg3EhgSYmKNNQ
         mkVUFhCBkctffk+BTxV/17S7AM2V/Og3GbwWsTiKgaX9fftVwCbFY3K1ZQ7pwVbv7b9I
         nw7g==
X-Forwarded-Encrypted: i=1; AJvYcCWgsqvcEe1Q+kAVcE+7bIW9nccVAj+i/RhXZQyvRdqNm4J9NrsQiWlPhxYk6AYLf9oOYoY3x1mtXW3M5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywadt+A+VW7f7fegSKT/q3e6pl239m+CzyDDImLRk5MwF0BgUpI
	HhgFrq1LzQfnextfKYSk6prmQHH4PrC4C3xIdhv1jqLDke/bZs1718Qm12+BlsI/V6TQpBz2FNC
	5qrlrbfj0Rex4D8uXyWNrUY7vaHvwWpOxjz06/QeL3z95OA1d88rxLsdWCKc8I+5OIQ==
X-Gm-Gg: ATEYQzwNeRJIgFIxsd/l0NBTVyntIEDiQZ2J92BKOnOcu+xFIjbz+DKwh58bWXfrJjA
	SU5mxXG9fQE1TpMdTkrpi+kUs3Fmkudm/v6w4913+6EtdOEkShKuAgT/NUn4elot67jvmCUR4Y0
	7NF/HsoFSqkODDYvcnz0IiZHxZSOkyT78eoaLAdURAKM7fQUtwldk70A/KtrajyHpVOAFdfCmZJ
	cTUOESPqTfPUMmYEwVN1Z/sRr/CiR+AB7GrJ+reW6M6wNb2IC0XfMHGPZlL+mDhmel+3I/xNMsb
	lU0B0CCyQZtu3vKLCVK3BfZmczWNlNAadbpSKW/nYFUZ/o3hzMxBbR2xrCw4mENn6thfYwI4Znu
	51ZxVs8axYsWva5Bsxi7BVOZoHf9+5bdCf836InNZ6358UWA+yDhd5O/JICas0fOnNOOHDwB9Hy
	muNLPAE8ovuaqPwlVBY+arEKsHDED4dvVSiO4=
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr218509861cf.71.1774311872741;
        Mon, 23 Mar 2026 17:24:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr218509601cf.71.1774311872295;
        Mon, 23 Mar 2026 17:24:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm2576503e87.14.2026.03.23.17.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:24:29 -0700 (PDT)
Date: Tue, 24 Mar 2026 02:24:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: srini@kernel.org, gregkh@linuxfoundation.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom-ngd: fix NULL pointer dereference in
 qcom_slim_ngd_xfer_msg()
Message-ID: <5cen2dct54ghqzijo7xlrw7zgdwjjihou2jion2mld7k5kxvnq@xp6723adi4ik>
References: <20260322124647.4246-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322124647.4246-1-mohd.abd.6602@gmail.com>
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1d9c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=3qz8hwSWqZ05hJhTaTIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMSBTYWx0ZWRfX4zE2F5bRrIYW
 n9RuCvbQLjVBWGNCZCkNAMdojsn8frGK9qnHvJBS9Dvim5yoXv2ITvCYFlPABzP4VFNjg34BcA9
 b81S/jxgfqvlDMQ/7BAY9wH+yO/8bGBJSvKD2z2cKv9z9j8JR82ucUA2ieOhin/1sdD4p0gc2Iw
 NFZxsIRVjEgAM6fCi0+ZTG1DWcvqd+VORztZLHnq0JusHt9l5VNUyqDabr09Opuakg/1LmnCs7I
 vZxNH7KX4myYC39nsC7Ym0RihuYQ56r+ch1bEcD+94zaSubqt9eGxc8YzxY+E8CL0lR53+4TVkT
 jIlPX3TYlpR2/fxE883X7WHTa3EazDL9/fTcQGDDzj+NG/XXT2dlgWWPpVuZXSuh47V4DP0njHB
 zO3XpErYRuigqoXBvYklkz57EVHhCH6OQd/X1TIWgVGSSAEbQbVRyM4DrPdhWYGbjFWNSdEI3xa
 gua2yTOeIbMbbUMXrwA==
X-Proofpoint-GUID: yH1YcFTl14HSKMrqgQC5ErKMaP26wKUm
X-Proofpoint-ORIG-GUID: yH1YcFTl14HSKMrqgQC5ErKMaP26wKUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240001

On Sun, Mar 22, 2026 at 12:46:47PM +0000, Anas Iqbal wrote:
> txn->msg is dereferenced without a prior NULL check in
> qcom_slim_ngd_xfer_msg(), which may lead to a NULL pointer
> dereference.
> 
> Although current callers initialize txn->msg, add a defensive
> check to prevent potential crashes if a NULL pointer is passed.

Defensive coding is generally not appreciated in the kernel. 

> 
> Fixes: 917809e2280bb ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 9aa7218b4e8d..241f5e08b582 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -805,6 +805,9 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
>  	if (txn->dt == SLIM_MSG_DEST_ENUMADDR)
>  		return -EPROTONOSUPPORT;
>  
> +	if (!txn->msg)
> +		return -EINVAL;
> +
>  	if (txn->msg->num_bytes > SLIM_MSGQ_BUF_LEN ||
>  			txn->rl > SLIM_MSGQ_BUF_LEN) {
>  		dev_err(ctrl->dev, "msg exceeds HW limit\n");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
