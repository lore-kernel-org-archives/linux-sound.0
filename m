Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A335AC2B
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699689; cv=none; b=QH0fk9CbsHLacYp25Wv+W0czu+gH4SdDcX81ubsenZOoSxYXLsiNTQgrwY8XiBVszO1uqMzKf2USdp4yoBmxC/fj3EKTQ3TcmCSQOnMzCVI60xD05i4AS0gdUQOxnCT2wyh7sGLa7m6VOiwLCVRtIg3IbAto9yNS8PmESRITId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699689; c=relaxed/simple;
	bh=4W+AG+ac+JQIDWNhwfeu0QfLCRda4qkicwneics0M3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1Z/LGZwFxq6Y5+8RhXZRzGHHZkDpw4w/6slqUtLvGyd8MpfIE/lB5XAgukmI27utcaRrd887+8PMde8Dyu4vEETC7hxZRVk/0W8uI/gXuHSW4ad3KvnVSghSSE4ipdpTC6vI9BT8DPSoGnsnKgopRbYFjwNCR/nxWoTjbXB6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzAT0BoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=By75dVCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzAT0BoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="By75dVCx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L1hrw3712896
	for <linux-sound@vger.kernel.org>; Thu, 9 Apr 2026 01:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc
	0hkFIJuYP5uJVGYzRYw=; b=JzAT0BoW/EgwHiHxCtVfjHO+33h9PR2fTv/pQp1R
	c/SaFEe5SOdxDPYfrqcCcgD+F9ORmJQPtqkDUKrM+YCYbNo3SkcARZvMXGmT9Mxh
	Y6OTQS0PnB4thm/Z7PbJdlY8ftvAZ74F62qnKuP+tP/q2q6ZCKPECIWZhZ5RdKWZ
	EugPZkYSfcCFli6XsqKkQSTQmij8Z5+y0+OMd+oq5rt0WqJc31Iff9BZFC1M3dAg
	NLjiPeXbE73ALff6Tti/oPAhoz2NzPI7IMZRhCVua2GK1ydZRPYJNw4LqD2N3/z6
	yLIS1KPIin1xO9JBbY0RnaDipT7v91zqf08/LD7Nr/Ac0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt749ukw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 01:54:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd8b56114so10482376d6.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 18:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699685; x=1776304485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc0hkFIJuYP5uJVGYzRYw=;
        b=By75dVCx29qoY7dsfXp3PydGAU6qpv38kTmdqwYWx7OpPIVG6j+cKmiYG0uUlfzw2F
         vxu94R8Qd/bMtWwDANOrQFTGVejYqxqp7GIPXPKuWBcqRXT9rz6h/ilKZ2zjH5AeDvMJ
         0suwyYP9JC8NEiiNlivQ9gGVm8njj0xStmy3izNKO9WK+Y2ckXwwW5beao09Cr98gV0O
         Iw2ICR3QtqgXY3mZPV/V67CEri1fV5OMYcBBnob4U/smHhLMh9gQoBmO7qGhDg1cSN9M
         S8p/d9mVFK0owuBbn+b6hksLJ9Q0XNLRYDUcG5RV9i5Z20tU3j+aJEPawel6GBB/J7Ss
         tu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699685; x=1776304485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc0hkFIJuYP5uJVGYzRYw=;
        b=McGeOkIYBEF8lVg17vc4LP5PKxxOqyGvhkeDe0Uc9VKZM8XJ7hldRnszfkInygaMCn
         n6EG4PpChUHD35ZRfBvNpMvCH3MN3KgHI6L928KWqfFw2360iIYEW4/KEVluGPgPRFK3
         +7/DxlVKoZrMU63q8TfOV5xtxH+z8Snvp7UGvHvtWMPiWl+yvSiqrHie+CI28Ux/guxC
         iLxqSopRA2IO5zes4h9A2H3HnFezbRCsgyha7NpVQUCr47tKy4MmtRXDB8JRjHAFb87L
         jRShBsuybShz0HN6Y/5z5iY4DJIG0U/pY/nGaNX20JS8ATma7iLRHHoyvKdiYxWIVusV
         9alQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJmnIIPUi7j2670nNzU243HlNu/IQV4cwnMLiTxpPV+dy/TjE1KMBbEmpf3Qot3Sr8j2STvYvBdvMCFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywKNpjgnp46yMmiOBpF2dSzUQ6T7x/HgGV3l3HqpD5VxiM03x+
	Tq0VGxCKjuhGirlZFTbxAeas3xsPpI2LQOeJWdkbymXlniGxaeIv2gLysms/XDk97NsVlOzXEti
	6VHYV3H0lSQlF4/avjxLr1WDdBleMjduBlkWmDMMtmFWsTdeIByvYbddEXrnjIRMdPA==
X-Gm-Gg: AeBDietS0apzl0opsUzu/lMlfqOHo0Zf81bYR87xhtoEi4Nap1QlhYRt5TK+SnRYxA2
	VW2UBq+RkRPInGKzVmvAN7tptC8HWjJWQgk7eEn0KXK/6VLmmtLqC+ToX7HXxrzZ8r8PnavQAst
	iY+k3QW9n5wK28G5bZGfLtsptnnajGtT3NVY+wgp7pYt+a/eJOJjzjzBDvtauzRMpLQD5DQi5pb
	NJkTAo77yAzDcidEjuZZ5hWyO0ia3CQ+Sv2xVpHuyI27W+aMiPux4uQiZKTEBM22WBqouGZGBuB
	F91/+PXgLZPvJyP6wA0YYMR/eVgL4AIIoomLFg59jcwvcM6PnRH7KCdFyj3wuFhsLqLCpttmOHJ
	W0ItE9gBf+DgLgk+KFHdNIjIApQjO8gE+i4hE+b2Iblgur5aYOj/lhYKJjmnn+dz0ZvlAS/cd3h
	h0mVs/U4eYKKSLpW9/RO1KsvmEX05WVGTBPfM=
X-Received: by 2002:a05:622a:204:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50d844f4107mr253617381cf.51.1775699685272;
        Wed, 08 Apr 2026 18:54:45 -0700 (PDT)
X-Received: by 2002:a05:622a:204:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50d844f4107mr253617151cf.51.1775699684772;
        Wed, 08 Apr 2026 18:54:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm5067355e87.9.2026.04.08.18.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:54:42 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/12] firmware: qcom: scm: Allow QSEECOM for Radxa
 Dragon Q6A
Message-ID: <wj52tzstbprop7emg3t4vjuhzq5mf6o3qddzqx3hdzz6acdtop@jrqzgjmdpabi>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d706e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=eLdiqSQfWnTWMVjn2-MA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: AbBVGBVrmdgcdcE0meKVDVl3VUI1jQod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNSBTYWx0ZWRfXwG/iiDiByJOB
 dyxM5Y55zai+ZaP33PtMokjbfXAW22jwhIoT08kLFfoaWvs3KItYRcUXepBvxTqL5i+ZHbHjSRW
 gCe/smebHfy7UYZ1zEcTS0LYzaG2K3+1+3UPqq8AagiUsZmvEPqVmDAmJ9lpX+VvOjBfUobcrLi
 e0U28bmebZXBGmR5x1bTAgzscwFcDRvWvgYg7uUXDQ96U5+rGW0HNaEa+sLV2d0NA5UBEZuvoLC
 JQBsAguJTBiSZ8PPUXaS6OdzkAGUe1JfH1G8jY2Oa4Egs4n8iauF74SXDpfvwKgTHmMhEr2TkV3
 6ZqqHH78bZdTzdWCDfBjKzLs5l/wf4jI3bIow7JtwgUHbc9P0PAVM7a9i3p3+/orEtWn3gpX4nF
 gr3zh4vUz2oh2d8dEcxqRD9+Zz7o+YPP//+ib9eSZwZq2JE4a6GUVAEn73e4ThOCp1ZzigH/Fm1
 vbzGo1dQustRj/C4XjQ==
X-Proofpoint-GUID: AbBVGBVrmdgcdcE0meKVDVl3VUI1jQod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090015

On Tue, Apr 07, 2026 at 11:19:53PM +0800, Xilin Wu wrote:
> add "radxa,dragon-q6a" as compatible device for QSEECOM
> 
> This is required to get access to efivars and uefi boot loader support.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
