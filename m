Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C9A2135BC
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077496; cv=none; b=XOFpjwtDENvWq/TgBXD7vzV46+5zfnxTfZjqfShxNTWHi+h8AikqplzvBHVuUVHZNMFQ4Wg+C45CR6EoKGLM9Tn8/SmKIm02Fn3MbFRubPXgNSmE2/E8inEozxnOpfjM2yqlhs7iuTuQbiYVZZ5CVqQHSNr7IDRZsE9w8M0UaY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077496; c=relaxed/simple;
	bh=tndzETibK6lG7lftjamMebr+8YK7oeeGfPg6dOV7tHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0r1ppgFxy2HPw/Ia3vmohy2U8V3ngj6bpW6j8mFC9e2iZiMcTqbOd8bzXoY8jo+gqpROlMgRLRkgGFjYYTXq5oJO18RmOlLarruDNvX55fQ9lIEfv4rlO1YxSQWiNxnP8krvpTLAEg3KAX1O0t4sQiMduFVz1bWs6KlNUlW53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lr8nhCDb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lr8nhCDb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jVKI011085
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 12:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NE16tS8ju4sejn+fVWcYypEd
	w2R6sqRR//7XNvksEII=; b=Lr8nhCDb9K3dI5Lj0Hc4wVfHCAjYkW/OD2PLwyCd
	FIzbs9AQG8TV1uvzf8zVvjfCBm0A0Ja7bLfu+qRvwyUfE1bE2kssRIDbY7/NwFgX
	Z36YM6SITGT2e56Nq7WnqmBW8Sc51/fbZrGwbwCJlBcS2SG5DcdPpFeBg02g2u5Z
	q76lStojz1HRhNyGA8b4kLOsmzfmd93Rcf0VuP3JV/Ft6kIOlshpiMQvyyR0GJaT
	Mwg2qQuQwozkIUE9J0bhFn/HGJsi6uMq9hqoC49nLc/Qhs7u7YqK6UHKafBYVjsu
	xvs3O8eOvnWYmY1eOmgi7zT+YGKdPp4g1/e2M8yqYnOX0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqh2fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 12:11:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c09f73873fso133037185a.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 05:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077492; x=1743682292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE16tS8ju4sejn+fVWcYypEdw2R6sqRR//7XNvksEII=;
        b=fGnK5v6zpyOmWFwTkFo7ecova9horciSWpntteS3I0pj/Hy3E7IA1b8H0X8Wt2oOBX
         +eytNZc76D/mUWtdQ3LfZaMXxsgGIaVP+GIFAE/vevMUTol/iXGWbsZJ93zIkSpgJzbw
         lX/pbLUSI2040jvrTU0uBc04gPUIHYRauz4iEhCO0l4Hn3kHiLHacFYmlJUubNMhIjq9
         ylxAHmcFtNV6AylLHj1di6RUFLobRdzz9iEST3CHDGLiLEGyI6OsRyyXQO9UA9bYrHGw
         IdYUYxLq/1qauQ4ARwdzc5XqCqK1osD1qO48xc9IfRnqfous1jowH/ZKgvSEKLLSqMWM
         DKvA==
X-Forwarded-Encrypted: i=1; AJvYcCUnKb4hEzNYoZEipI+vUo1X35yNuhe3B34qu9PSPGcNCELl/2GZOMNoTDr+qQs254B5m6D5UunxpfSpOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Uxj0G+qXon9K11cE/w33orIF1B2QxpUD6jkwqhinX4/3ff6J
	OwTwzyJyM5ofrqXbSxSDzlkMbETwyVIIwCnuSjtmj0oD2XBnj7Be3QgfSUDsV/t2ER0kG69iAKR
	RNylSfBhqbYjD3XeYxSlttslQ/BpVVENfL6wSCFcnPNbkq4YbkSJYtB/dMZ0lDQ==
X-Gm-Gg: ASbGncsxSR2dYTyY8oyvRXLu/RgxY4/gTMCUFCfipnz+Y3LpGNURCIxEgeAJ+Ml0WU+
	aogUEpYcZZ7B4+88VEpw6i3XP/z1v8nO9oNbcbWpPA7TwqOrGBLEL4Qt+7p7k7dUQk82nPqjOQc
	CE+jKDbrdwvDUMDjr4BQswD5R4KaYsNATadwVCpN4ZK9+97rIDnxN39ThdAOjfxl73A2EbvzRoZ
	GMJKGBbaHZaJbgcAN6BN3wa9o8RQ89H50zhrkBmCetGwaaVIYCMxCPDZW04mmBTnaPqO9cQTVZn
	ddetZs7mH9nfHLKSlyFiuC0Wj89K9e+BXceHVMxgYegG5R3E7CIuFG/9B+N6NzdslTOrDhjSvBA
	TCwc=
X-Received: by 2002:a05:620a:472c:b0:7c5:5229:2f13 with SMTP id af79cd13be357-7c5eda6705emr595363985a.36.1743077492410;
        Thu, 27 Mar 2025 05:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeMLOF3SRR+/JK1v5WXH3UPoYhZrVQwxUP2TxS6+d0GmaHHh//ffb7X6hJRB1//juZEaqQvA==
X-Received: by 2002:a05:620a:472c:b0:7c5:5229:2f13 with SMTP id af79cd13be357-7c5eda6705emr595356085a.36.1743077491790;
        Thu, 27 Mar 2025 05:11:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbbfasm2110837e87.130.2025.03.27.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:11:29 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v6 3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
Message-ID: <tbio4a5qzflhabnkwj6cezxfcyprrmoocmqevckdo7lt62ylxc@omujge3fs4ng>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-4-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-4-srinivas.kandagatla@linaro.org>
X-Proofpoint-ORIG-GUID: gq8ZAoIm45qC0mNC9MzzDPYbfCjlaZN_
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e54075 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jJOvuocEYViH2poF1hkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gq8ZAoIm45qC0mNC9MzzDPYbfCjlaZN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=476
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270084

On Thu, Mar 27, 2025 at 10:06:30AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Remove confusing and unused argument in swap_gnd_mic api, the second
> argument active is not really used, and always set to true in the mbhc
> drivers.
> 
> The callback itself is used to toggle the gnd_mic lines when a cross
> connection is detected by mbhc circuits, so there is no need of this
> argument.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
>  sound/soc/codecs/wcd-mbhc-v2.h | 2 +-
>  sound/soc/codecs/wcd937x.c     | 2 +-
>  sound/soc/codecs/wcd938x.c     | 2 +-
>  sound/soc/codecs/wcd939x.c     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
