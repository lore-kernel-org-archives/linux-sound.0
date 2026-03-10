Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57164298CA5
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128000; cv=none; b=ZTVMe8IwG+V4CYoJCrr0/pcYPq+XOh04zHeTTE8oNhUEhoKC9fTCd2h6XQJWVn7bx8SlIGfdQkPr+RpTY0VGcVbvbby4qvzNEJOnEJ/j4QMji8ceU+lghTUK1oaOFvsZ8KJZ669tRTWoHpGhBhvyLdZnMO56ZYof5MrKLEps4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128000; c=relaxed/simple;
	bh=SiNGQ275y2rqtx8AWmX/tbCGzRIsl7L+AqIntr6B+Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFRsi2ZNLRfKc2mkzv0MKr2eRopdLUiz38CR30hmd1dMS8C0rHpXPlv58NSqul3jwHoNREw5Aj2w8LFyUwv2awantfsW++DuBRdWbx9+wDkE0rp+oGGRUG4UK1y2jxP7UvBhiF1heX2sUjLY0ia06+usF3KetVxjMWekmjtQOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMICNFGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMkwswHB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMICNFGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMkwswHB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EPjl2817521
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CjqfLXn+ke9/lyzwQiVi5EYP
	l7mKCaQVtaOChOHp13I=; b=fMICNFGGG0KrNemM4+GR/t64pBcUAFoFxtlwmlVH
	/rHr9OjkhAAmX2zMwucVyisASdECOLGwOOh3ZYXaGVq5YtcCjcCHNxnhHhchscHY
	L13ucLozGzQJQBxEjwL9PtRwZ2g7cpu0fJrMhDrq88/A1N3ZYIgtlUXUIR1FVCBz
	YlAUQcyA2eRV3Xni3W8+xkkXiNIF9kyqhmCVbRGpDGofgMtBKNOwkVMHBy/cE61L
	778nZGRBjIFRJp4jaHnFG0KVYL6HofZQoo/lEDxpacPMTZMKzcNS3nx/m49i+S28
	tbHqFHTEJUKpI+xvMN/Dx4dUGcE23Pj5d4/rkRr4/5MZKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr431gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 07:33:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3597b55adebso6494146a91.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127996; x=1773732796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjqfLXn+ke9/lyzwQiVi5EYPl7mKCaQVtaOChOHp13I=;
        b=kMkwswHBfhqKJ6onQzb0VFyCZdz0TKYi2PpxwYaPUzlFfLJDVpQ6xiyEoGIW4sI5+o
         qQRg6Lwl3XF3MxW8JstRPfmoL+vgQB0S9s68xnCbgvlk99WQgAh2zTsNAWMWdT/qky9n
         RpyuOE651jJmzajXBtRpbvQoqX+sYlV4D+272AO2bSCd7l6tY6gl0NqBBM93nHKNco2+
         Sf7tZcmsWZ7WtIIgm+XN72lDg6LcFSlBAQmKHz0UFYfn0H1SHvWJbIN3fTCbxsQJ1m/i
         6yWSVRk47q5eJhdnfIk9LJyY7wnf3HcjWj9TxeYc0x0FvuAF5JiZC2LwB11LDVfaJg6w
         2dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127996; x=1773732796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjqfLXn+ke9/lyzwQiVi5EYPl7mKCaQVtaOChOHp13I=;
        b=PvTovLiMHmx1Za8eeoVQSOfjl6DhkFx37FmBz8D1gNkWFQbqht/itKK3cIR6ijx2OU
         9jKHUkPytpwkw5FIuLkNGYqgraX4jd3LlK+vMHg6nK+V8DZq+XaORzSPntG0FYNSp6a8
         2g8xqsBNtIwualpVZ2rq7IU5KQMPXXXISV8wYX1V0zONggwW+QcFXAptOuxlL8DXo+Hn
         lO9khpCXmzVXLzlBgyoO78Lrdgjc3oU6NjB8Rxrx6MskWB3wYbN50NlpD8jTiDDxG+AX
         ypC3tJn82uPZfKs6skNmRK7w7KA3LPqaJ1QzMy4XIur+2vpBDyMIf89x3BzH7yC1AU6V
         UzYg==
X-Forwarded-Encrypted: i=1; AJvYcCVnLo7ycoa/486lW16iPjSpM+aBUUecGauEPzi0jqYabKHgu8H9IIcBtrx6Tyqby49lHemyD/TfVj3sPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvOTvJGiQeP4fVdFEpHhUdQG7GwjK4QBXWuxwkqeAdKJIln6S
	2iq6Ve9cZUrjMu/CTNjHgfIB6glrDtseo2JZgElSNi8INNg/9vTKgMJ7ct1AJeoaAFYSqhmS7Xr
	W49Vf5uCp41tqoPI2LKfVpz80ksc+E5iWYz0pcK1s6kiiAabRpSOKWLsIpZ/VyxzVnueJ1+4Bjg
	==
X-Gm-Gg: ATEYQzyvsy/r0JU6XBjyagOCPcu82zKiCnCipIm71/4X1MUDsfbZLkarErgXZRXyyMt
	tMT1mALcikzHpcRzUlcYQtZ7kkqnJa32YbymNZQxckZUkS1Fnx5J0sx2kMqdr8FV+upXDUBRMOP
	EYlhlS76MTxcP3owPAaJGhfXclckodyrgZDL8kk5I/DMNzYeTInxKCpn3ErMMuZbiXDYQEJpPrI
	kKIizfYEaIrc51VzmtiFQ7sTiIQCmralU69Bc81z/B4QzZQr3ug6Hk6DSvJ10Q68OP7NZgJIUzg
	Ky+Vu9Wz1XwD8lIm78EUn7Dim67ZdNZJ4pVa0ji4Cd3cSSM2GHTY3fii+6xK/UbcabupUaFmnMB
	et41JMQx9Y82OwbWaUP0uMu5umzK0B3pQh59ie6s19Ivth/1a
X-Received: by 2002:a17:90a:d40f:b0:359:d54:846f with SMTP id 98e67ed59e1d1-359be27c33amr12321992a91.7.1773127996156;
        Tue, 10 Mar 2026 00:33:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d40f:b0:359:d54:846f with SMTP id 98e67ed59e1d1-359be27c33amr12321972a91.7.1773127995557;
        Tue, 10 Mar 2026 00:33:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f7993sm1990924a91.5.2026.03.10.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:33:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:03:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Message-ID: <20260310073309.djxq5zsyudhjob73@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfXwgC1JYea/Xk/
 5joxYQgm4Ybdie9Dn5QxtfOUjTBCnMlUN9PKnx5WUiOB0cOVd64gyJARkFEt1LmuehrbOqvSpyz
 bJJcNm5WWitwG/XBDhVsqgz+Fyk4FFaz+PSP0Oc/fB2/eag7s9Aoh27WjKGE9jyFsQDVyqVtx9h
 aY6SxsxUhDeLrbHC/5hhUlpr4xNQRBr/GBR5wSF4JPYDdLwntsQBhOB4yh7MlH4tY/AgmZtHhJL
 4LtaTzw3kRAdQvQNpuR/ax1j1fyh/sy+kD+dMp4N2l/ogf8Rvky03yR/upDZ+f7L6iLyDK2Wn3E
 aDH2S9Gh2N7Gu/pNSj5AmGnfV0ym/xSJ/+hQoCFhhVu1pcEsiXKaJ1iSBfCQhXzrxNRJQ9Il1+u
 FI8qtfI0q91Lat/bgKhJqNKQ3izkyH3G3eHz4k/YqjzEqtT3oN2FtPFesYeAzAHpUbTvm33efiG
 0Q+tb271Xh6nNdNrX1w==
X-Proofpoint-GUID: EOqd-ZQ3zc1dc0701KAKaM5YpVNhdUqL
X-Proofpoint-ORIG-GUID: EOqd-ZQ3zc1dc0701KAKaM5YpVNhdUqL
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69afc93d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tp8SaPNMS71W1gbXFkIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062

On Mon, Mar 09, 2026 at 11:09:02PM -0500, Bjorn Andersson wrote:
> Device drivers should not invoke platform_driver_register()/unregister()
> in their probe and remove paths. They should further not rely on
> platform_driver_unregister() as their only means of "deleting" their
> child devices.
> 
> Introduce a helper to unregister the child device and move the
> platform_driver_register()/unregister() to module_init()/exit().
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 9aa7218b4e8d2b350835626839371ed6e19860e2..c69656a0ef1766d5a9df40bdf37bae8f64789fab 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1562,6 +1562,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>  	return -ENODEV;
>  }
>  
> +static void qcom_slim_ngd_unregister(struct qcom_slim_ngd_ctrl *ctrl)
> +{
> +	struct qcom_slim_ngd *ngd = ctrl->ngd;
> +
> +	platform_device_del(ngd->pdev);

First, it surprised me why only once, then I saw there is return 0 in
for_each_available_child_of_node_scoped() loop..

> +}
> +
>  static int qcom_slim_ngd_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1664,7 +1671,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  		goto err_pdr_lookup;
>  	}
>  
> -	platform_driver_register(&qcom_slim_ngd_driver);
>  	return of_qcom_slim_ngd_register(dev, ctrl);
>  
>  err_pdr_alloc:
> @@ -1678,7 +1684,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  
>  static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
>  {
> -	platform_driver_unregister(&qcom_slim_ngd_driver);
> +	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> +
> +	qcom_slim_ngd_unregister(ctrl);
>  }
>  
>  static void qcom_slim_ngd_remove(struct platform_device *pdev)
> @@ -1754,6 +1762,28 @@ static struct platform_driver qcom_slim_ngd_driver = {
>  	},
>  };
>  
> -module_platform_driver(qcom_slim_ngd_ctrl_driver);
> +static int qcom_slim_ngd_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&qcom_slim_ngd_ctrl_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&qcom_slim_ngd_driver);
> +	if (ret)
> +		platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
> +
> +	return ret;
> +}
> +
> +static void qcom_slim_ngd_exit(void)
> +{
> +	platform_driver_unregister(&qcom_slim_ngd_driver);
> +	platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
> +}
> +
> +module_init(qcom_slim_ngd_init);
> +module_exit(qcom_slim_ngd_exit);
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Qualcomm SLIMBus NGD controller");
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
