Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E71DE8AB
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019454; cv=none; b=YJnBGdqNvUyiFgt5meXFtjnAoW/GSyIbQvLambocC+OhFkBvExl+ZTqcQdxMwSu+BWgqFUr7ovNRtgmdbrtDIanD7Wu+H6h58n6jETBhyc1lqZPsUtzuU5l8ah03uqVuzHzUvCielguXfs0vtYShcz9xJLtCm8teO/WDrhGUTmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019454; c=relaxed/simple;
	bh=ANmOQK44ikGowZWvDLPDAtsBlWAQRjP2uX3Tmv4yg/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDG3QMoixacJ3hL5kUxyLj2eEDjoLZJ4TRmi+HYNS0SclUxR4Eb/Xj/WSt6ZluVaWfc5tNMi+j0PZr+hnh30iCYttzVXKCEE9p6A9z9PnYSK1SThIx+vqnITqVp5kL4MF6MjJV4zlji9UJSxFrERloYESewtJ1nO4bZ6bcipn8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6WQwBj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6WQwBj2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53INNiXI032650
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eKUA3bj8EeSG2nYcgbu3ywuH
	9VSFY2PDx0okj4dv5ZE=; b=o6WQwBj2OW4RvwBxJ6XuGJtVbtwHDQD0U7r6EXQj
	gjtv28QpyFBHU2oGavA+D8r0KLVVDg6nKry9llAZDAWxMfGLS9uRGaI8+Y4kWSM0
	2uxCGwb2Sth5IknOLn2T1Wc0kujKx3NQi8EmM+yHu6lJbTVwnOUtcsDFbGy86nTx
	2O/be/BbA7oqsXn+amyuHZ70x59n1ApJiwwSYW8hYCX5IzsJZOvv++7gTueViZZ1
	jDuvgokt/nPm/EdA3LPaxJog1PlnL352QwbEbMKR9A39RZG5KyQ/rmsi4QLTcYe7
	4ktIRz2EFNEbjT/ksOjXMDRPhlvavByHvQ584JhzbP3bgw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvgfp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so46423506d6.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 16:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019451; x=1745624251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKUA3bj8EeSG2nYcgbu3ywuH9VSFY2PDx0okj4dv5ZE=;
        b=gPBuQ0BhCNFekffHBz3GvERQ0oHonMDlfjpe9eJfU3pjOS38DzQDbLUuWTn0EmXxjx
         kCYWCjfCJVlEJTWiHVnPs15IxeSADFRUaxttPV/QRpFL+YEnGPVInlRl+wnizRTSwF+6
         APWs3LxFl6bVyPgS89aCiV4NO3o2G2r1jpV3A92AlmP1O1c3431lqyPgxdTh574m4Vu+
         4CmJib9+AAcW5ed4axPhqKy+LdpiIqz6UyiblO6RUu9CClha/rqSNYz55xarbP8RDJtb
         OjmRwhUNVcvWSYKpzhAxeH2WdlcAj20bAt6CgIvCXoi+SIwFGSKs6EGigrrXrXtJV5pV
         xUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtHHrBnuBXFz78mxoVD8YR7MI1feWlr0WP/rnT0gzvFNrAhhMCxoha/TZtZXh31L2bXlCwMcZtPb6Iiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUt/Ztq70xWVCAzC3QfWTlPehOyTTtwZARSYXs5dyiOzoTZP5
	vN94SqVt2yhKC1uC6zFkk0dOZk60/Dfg8/nQu97pif9rFgnICBCWrAtBETqYw7g8KkOlu4HNSzc
	hDXQa7+NM0e2ZJoDplSv4XT3AAXbfpNBC1H/u3Dkz97g5CQTQKbbA8+Fr68W62w==
X-Gm-Gg: ASbGncsQVt0vibVizdOuWV4Gms1etAWpEubXd/YncEyvR2dbbop6suJGOPaXP9Roy+F
	SGtr2zd5eXwCK3o5JRn077lGtllHu6W7eo8c00NUtRSyQp9cx/etwWvv399CQugi84PgpxLBPKC
	n3uNKcRYhUvU/Za3DF6cBCxkKHXX7107f8afPYjonIbGr1Frj5VSjs5BqplRbGcx8wt9b+NMNwG
	GOb/tKv2xdFaI0RwGUrA6K6i2gacxZLeJxgNZk3M3lPytvoK63PgtHwWEzqSUuFgel25QVmzo78
	YTE9GfPlPyyoaBTgwn4UJ8JrWZGQjaFO4Y4mxHsvynSin6iscMCFGCgjH+R1bMIs9Ye66tHG6sE
	=
X-Received: by 2002:a05:6214:5005:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2c450b587mr75957996d6.3.1745019450712;
        Fri, 18 Apr 2025 16:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrnZTHVGZqFXPA5Puw+FySMHQJHQ46VuEitEwFPJTF/qNvZ1Q9C6NJS/pbT3++86Ymlzp+LA==
X-Received: by 2002:a05:6214:5005:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2c450b587mr75957586d6.3.1745019450379;
        Fri, 18 Apr 2025 16:37:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f5fe8sm292796e87.232.2025.04.18.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:37:29 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:37:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <zo2oc37adjjryesewvsnlk5gw25bol46zqqkshfi7yzwbr2rot@jocwv3ff4afj>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
X-Proofpoint-ORIG-GUID: dw_lPy7ZZqQrv4HZPQMEu4g07JAAL-Vo
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802e23c cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jUvTS9cEMoV-Kbj9yZgA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: dw_lPy7ZZqQrv4HZPQMEu4g07JAAL-Vo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=957
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:43PM +0200, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
