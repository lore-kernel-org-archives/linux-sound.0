Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343C12DE710
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367023; cv=none; b=jlOFto6NTPplvh3JXElbtknpuEucxb1gZ7BzHXDRAN3Mhs9Bwmbinx2Fu2fdltRT2LldVfj4rRNWsip1HW/B+sNMMUBxfkjQjCN9PtivB5ElYLoFmMexZMubHGlJRgbNhxxTpn5fYfx4cHG51gSxbpo7ItiDVGsA9dsAvgxocRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367023; c=relaxed/simple;
	bh=WvyN6qjNgv1yPDJutX/kmce+hYMmWcbroxxMeW2zB98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mazyvgyHvlcyr3WjcEW1ORux6nqsm8vXPNzIJLPX8UE9Jbxwsqxpo1wEUgte2qrcAQXtPgiqy/NH06pNIsnIyc09UvwxL2pyN1jrbWZ8iTq6C3uZBMpbF1gBX4ZXKOqVMSchtlrZGZ8W5HLXfdinxd6IHojhTvI1mhYLjbke8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILfxjR15; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILfxjR15"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9MGmh016006
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFOidjaJx90ia2Zk8m3/+Y4Z
	rTzQKZq9KqbiuEHtDDI=; b=ILfxjR15jwCUi3M1R+fDS5ml1CNV83noBUt0MZs5
	byh6gmEMOeSC8koxy+Byaev3OxYkJHmvxHaM1o2oEAp4SgxJW3susPClH6bPs/I5
	63KPEE9thB/uFCitK0IJ0e8Bv7yxwgtsNiYDnlaYRFYTI/UHuG/WtbfuP7UD3YEX
	CdvA2Qzn3ozZ0xZW3DWNDM+NLp8rdAVwYhWqTvOf8B9Y/KnsUy3uzbHzNjijDZDr
	1iyq41DeRXfaraNaAkJOGWJqIVVeINHRJsOVnr4MBNzcK/dc0o1yvum2RRtIIBn+
	n/JntZnMc0rM+73i6qVLMwhZNLgFVSn9bn7kAmNE5bgI6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379u5vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-87f21c86defso62882241.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 07:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367020; x=1753971820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFOidjaJx90ia2Zk8m3/+Y4ZrTzQKZq9KqbiuEHtDDI=;
        b=t2647vkk5Ytld4E8httczHp8kPCvjJ11MaFlj4EeJB4MBsAOwB8A6MMzjeBSqi+DtM
         r4WoKdcjHV+NW/nkhIOEuJ8jx6E9N8aE0wzc/mF7OQvGryMYcRop5OJHUXIyTC3AOMWd
         AJgvSF3dyeE3yuS6LYyB9hbPfVjXrLmoGPy1Sc71OyktlgbLcHbj5bAwCToKduzq2Bza
         d+ghVTCSUI8jJiS+gjRE82BaOAJxY03H4PRCmwO3xZ5EeexRUAt1rD0RCnpobCcWa3TB
         nSvzxAEINb+F8BNMA248TvJPBQZcEb7JgU6aNXf5hNU+cUs6Ech6qKyQc9MARodQSKWw
         Sp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtMjxuocrL0sfNFArqTNZbrpGx/7rv5xzW5/1ba7mwGDD5zdTyBKKKh6/j1NYqE4jVEo8E/xAsLndClQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF80NYBIuEqtpidkjsOiAXFcUSvoGn5VgScV6zfprDmyENGOrW
	PgQQTJeuMcuGlFGbOcrp5SlsWr7lKiCSpwGjpG4t46EGq0NmFwS62ZjoBuxcPKCLJrnf0Y66g9z
	i0tjs00jgXTTGohet7dp1b688AGLPGwqbzif1YN0QthDIxeyP+B18eLP8DPTtp8+AsQ==
X-Gm-Gg: ASbGnctICEM1vOaichJ8khc3/1NqqIUw8HxCXhBeMPMnvFpkdKpC3/Lg48TuCKH6nlF
	JXyHDg1SGAgd9w0mOSZwbKsJBzThXkrSy2mLCCfoCoULoizQ4rffmJj0t3nZufPa7m41lW/9Iro
	6Y1+C0BuaGH7rLG0unr66rJlY3TSmYV06JmPDQLuH4RmgBqnYRil/lwLIK7d65NOZGkYp+Ox7fl
	EETdXdPLtkmT2imqEUfq3t8f3kaH7vywmbYCzF5vM/PLYKKgytAEvWbEg1ZFhesHYFyGTGv6m3v
	+qtIYurZ75WHjhq+yp1DKm182UoQOb2uT9dBzZjqYfxJjtNG817Zj4Qxo/677N/j+dm+8gOiq/C
	jLZ4YK0D2EjZqZQvdM9pJD/2/KhjPLMoWUztf6XHV6Fg/SJunfAMz
X-Received: by 2002:a05:6102:50a0:b0:4ec:285:72e1 with SMTP id ada2fe7eead31-4fa14f8c61cmr3317730137.6.1753367019454;
        Thu, 24 Jul 2025 07:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrZKK7zJvgusO6fy75bTCT4/4c02uD5wEiU3AAJ6v0c53WXnZcDPmknMIWu2XnG0USllhMnA==
X-Received: by 2002:a05:6102:50a0:b0:4ec:285:72e1 with SMTP id ada2fe7eead31-4fa14f8c61cmr3317642137.6.1753367018745;
        Thu, 24 Jul 2025 07:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b35cbfsm383014e87.70.2025.07.24.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:23:38 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm
 driver
Message-ID: <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: vpwV77v4pFAOfqOU38xz_v69zSnjwSgZ
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688241ed cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=U1RUb5vHvPbtf-jDBY0A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX3grl8IpXEaTV
 Fxheg/btWVw8zmb2/QTayo5cH5shH41bKIuHik/ImC3LrCzZqGoqM9GKJ1mAFhdszTK9As2LWjA
 aNlp4a9uk0RKwly9Su6apg9TbEyd+FlZAV6Z8lezDTzvSksdYhRks36ii+G5f5cywejN4FzxG2V
 9x1HQeKKZ9j2ph24rF0CcOhazs0LO6hoktJ5y06WJiK+EUfRZn15qfbaIwxn3PnxF8t7eGeB16Y
 BAldMsqEkuoz5Vt82Vvrrxan0ZCzwYGnvyLP375Lequs1HTGDjiGV3nSgN9CuXZIyL+bleAmkYR
 /g/Gs1T50SLSr9aBOS+9nXtE7SN60HGylNnOT1F2msDmlvoffuX2jdJM7fEenZMOokbsZOwIBni
 vV7Z5HTWmS2F9pc/ulpl6BUCuiIfoKUDCq2vFWaUPl2bBGxzg8DZRlvzRwOqsc1Xqw/WyoWZ
X-Proofpoint-ORIG-GUID: vpwV77v4pFAOfqOU38xz_v69zSnjwSgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=829 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:42:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I think this should still be @linaro.org, especially looking at your SoB
chain.

> 
> GFM mux driver for sm8250 is totally dead and unused, there is no point
> in keeping this driver without any users. This patch removes the driver
> and the dt-bindings and headers associated with this driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>  drivers/clk/qcom/Kconfig                      |   7 -
>  drivers/clk/qcom/Makefile                     |   1 -
>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>  7 files changed, 472 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> 

-- 
With best wishes
Dmitry
