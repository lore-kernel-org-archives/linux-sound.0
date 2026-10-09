Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079A3EEAD2
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535070; cv=none; b=jtqqP401dRVlTsrIeTuwkfw1Cy0WP7S2J+HSuu2wcMC/YFZjqNgL+BalhRDxRU/MXJitozUi2eUgWH3UtWKAwWaGrI7bAUkYJ8oxGHzWHi9dyP0S22SuB8OcQculn+eq/S+X3pLpqFRDPF4M9IJbSKHXBcmROP6tqkbAOMeCQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535070; c=relaxed/simple;
	bh=5Jtyb218J9uNCVPPo6/wn8QjFKez0rjaiV5J1tSMCS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMgSCh09Kl4ejzPHRwvNO5umlt8VRjwHo+aW2gPpios9a+d3EmLTh2Zt62VBlDUoF5Bl6f0rDsvRIOUMjJrvUiRaUTIrAHcJvWtGXxY5u132IJsbsaOalxLu4mQwC5mFVWtbA84LiL7N7CCr+GQH4zpW0zPMynj3BMHA1F0SKfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKz2DaLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IysYcaEV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKz2DaLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IysYcaEV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KILW404366
	for <linux-sound@vger.kernel.org>; Fri, 9 Oct 2026 08:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LRKj7tA84IgXB2wIqvKtuni5
	woyD8XbtZsRtSMWRtIE=; b=HKz2DaLfVmmc7FjtZ15ozFaqMoblkqM7A8lm3Tlw
	bF62Ci5RNH7qFQpZCQbNkhsipcI4KFZ20/JFlzZfPd48tEaW7b9+x+p3pm6QCIrw
	I+gWLMi/k+4yKOngEfBHw7N9ia8si5/vYtQco+UjrEUlk827gU+PzSmVGLsFVUEs
	01v12SA4S0JFTtv+mq3tRosLGye9zlVyMtA0dpsSLgEpBQH0Ivjq4PoE7h+jNToO
	a6yvxCXx3wOOGoEEbOqdJ+EyaXGvfMurCoyK5TauqDhxNxs/DlbaYnDevZgXPrK1
	rfMJ4op/NojDCdcTvAMuqXNCFDVqsnPCFRaIou/eRCSqjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2qkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 08:37:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dea1b6c89so1110820785a.2
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535068; x=1792139868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRKj7tA84IgXB2wIqvKtuni5woyD8XbtZsRtSMWRtIE=;
        b=IysYcaEV9t9nuBwJxkRg6birF1RaM5V9CcnpQa2gK6ce//k/GKqzJC4aobKhgZNYN2
         TMMImUwxFFpTa63TX8LgZr0sjXZoWbFu8MbjkXUfDoBIGE8s0L1pbWE76i1QHL9Xt/mn
         VEZPQ0RTXa21jSWriaHkkSmIoeJfnqdqYiW/S7pjR8SqZxdusj3TrMyBq77Ytuejl6uw
         OaZb5OUwQQ6/UYsiLD4Lml9CxiuEgodZZEjHKUHMqDlHLLCVDTyhT/pgAjIJ3qA3jmuL
         /qv7GPvi2AFsQT72hpGIdn4pEj/TNRnPmpIfMW/5uF2Tsb+eeNx389/EBqlb3OX8ydqT
         IDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535068; x=1792139868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRKj7tA84IgXB2wIqvKtuni5woyD8XbtZsRtSMWRtIE=;
        b=UHM6fszJYpgJIoICnS4072wYe+cKjtY7CYO935TnQKW1rDfn/xYLHj54tzSBCLe7Hs
         9tI98wKyEP3paeMYFbpbmFSIpROuCHvTB/LELBX+PkAmmJHE+LjTrkRJBsNUkX4Rd/FU
         4YMqywPLc9TgL6GZvCSD9QlvGTeO4ptdOik4kAeVax3DNBIvsh7sHerTGWWiw3B+3Tbs
         9+lHHCy9IFfiHtCs+d7i+efAQQScJf5Clx3dzqzylHNU9BGkMbB0CIQi0QUrh9g3BqqE
         oMZRbAxwdHzTrPvB7HqL6jAsGXfRR+hkIfCjgvmP6oiRM9Vj5ijFTr3Lwk89ojva5F9b
         sM/g==
X-Forwarded-Encrypted: i=1; AKwUvBwdlG/0A1gSNL1S1NPlllVcwIq55Uk5HhTCJTYl9jJEpqLTnslZxJBgFAQ7xLP5FVBUy/mT+Z7kb5OiZw==@vger.kernel.org
X-Gm-Message-State: AFuF++mKC2DJARl+pWf4uGU1ORRB16r6nqdFG30cXRmayO17N0OzwUr9
	BMuCOCEBmwUKh9Osg+mB288ojphMgCyiOC7h2g/E+brubkJJag5pfmqBYYaoNY1Dl1yoh422pif
	Uk6ybnDwKRLlw66+ePwu4IBoamtH7UsGupwuv1PYmNVc978BUOc7llFkl3nwksWDrrQ==
X-Gm-Gg: AYBFou2kyJVQVz8A7wFZjKqxmM0lmmPKyomh8/yiZmZkr5AfWD7uC+69FQI5+51cCoa
	ORU/F51k7JHQB5x/it4+qzL28b/LpX3Rf0NZziNd1llqXZXytMSOoG8J6iagRlf43t6aeIP9QGP
	XMS3Y5rnCMoKPASSPL9mMSkLKEw7O/CQB2WMuIJ3m+vQ3lbOfP1xQQwrgVl37d5ZeD/eU5T4UQL
	fPxzNRw967ifjfdKGG408PWTizSh01K+/6JH9ShyKJrQIiy5XHyaZJOFqBX8dV28ixn+mbt2AQP
	hEPgGkFe2jrrtKbZCQCdHJguTNvnE63zcVEgOSUO2OlVfFzPZkJFy80/UQ0fgK4LOR7Gd50mZGD
	lScuvCnt46PP27WPYopKyFAwz0m/BpYJay11DUD2HvECDO0ie5+uEe/CHKGRwksV8KdD5Zpz76t
	Kh3kzRchcrakR2
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr163498585a.31.1791535067829;
        Fri, 09 Oct 2026 01:37:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr163495885a.31.1791535067265;
        Fri, 09 Oct 2026 01:37:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea8285sm445173e87.58.2026.10.09.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:37:46 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:37:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soundwire: qcom: disable the interrupt before gating
 the clock
Message-ID: <fknrzbywqicj42txdulku56uita2kygkiygkecafmdc56mbjjc@bshxko7l7sfe>
References: <20261007193332.5270-1-okerixx@gmail.com>
 <20261009082639.22662-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009082639.22662-1-okerixx@gmail.com>
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8a7dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vLDq-jQ7ZZ5jrEvYukEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: n_b6rSKKbqTA8_l8gSHe5spKjRO3cQ9d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX7uAWMNc9gtPX
 FFQP9pT7Yr3VvmiMYtI0S2gk4BqgDIGBEpfloUZI1//4UgoM5wOt0a8HTio58Cdzk9Oy5xHhMZX
 24FYIT8Ec0gpPqhvMSrljEZNh6M/L50=
X-Proofpoint-ORIG-GUID: n_b6rSKKbqTA8_l8gSHe5spKjRO3cQ9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX6OGqsbZi9Kg0
 W3JvJKOLBQfaDkCmI3RcB0vZVYIkhjNCf78vE1NLea6ONM2AwiWK3+j1jaXXNCHy2nJrRP1hP1Y
 scPfQn6U0tWtb68qie9ARFk3r05b1rd8LUNyq1qp3po3dBDEAXlrxLriNcUYr7eRykRPFXHBkFN
 hSUQsDaTS0gKzyU6jI8toefuZygk0ifFheldg2TQdYaXYZ0EySn8BhIB0YH1FkHATCi/6eF/ROR
 7Srx3KQVikk4AD4n6PIk4WnoJ3JGLmHLOHdhVAygnLorDweV0oXRiw0C9N95WLOovfovtzm4pRn
 te4ayMK7rUMDmmabFiQU1WGfH1kfLmPtQ/q1zwj4Uik0WIrKMV1ka767g7UKHxg9xB1b2nklNdB
 FEIWLm4zaXu1MWpuP3ztkjUBjP3SafzLIRgMv9dU4jt9RtNmuU8G8yUXv2c/UR6bvkaPaJaHt1v
 GXcnXkVIbv6sZkfmbpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090034

On Fri, Oct 09, 2026 at 10:26:39AM +0200, Oleg Keri wrote:
> swrm_runtime_suspend() gates hclk straight after the ClockStopNow
> broadcast, while the interrupt thread that completed it is still
> clearing the status and CLK_STOP_FINISHED is about to fire. Both touch
> registers with the clock going away; on x1e80100 and glymur hclk is the
> SoundWire clock itself. The next clock-stop exit then fails at random
> (bus clash, parity errors, AUTO_ENUM_FAILED) and one side of the
> speakers stays detached until reboot.
> 
> Disable the interrupt before gating the clock and enable it again once
> the clock is back.
> 
> Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
> v2: disable_irq() instead of synchronize_irq(), which left a window for
> CLK_STOP_FINISHED; about one boot in four still hit it.
> 
>  drivers/soundwire/qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
