Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AC269CF1
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759257899; cv=none; b=q+i6ZzorJ2/RDmPHAS9zkpok7ni5sjv6J8a/5MBn4K0PcVeEK/eUQmjKadYjXCa1RSXJBr8XIiPh2wnR+RRQq3hPsLaK/V8gcs2nByPqHcfwrSjbbkJfdzROoGm4g/+I/JuMNzzieALxQD7b6ChystNw62Jj5ZtfDb3Icz4/hwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759257899; c=relaxed/simple;
	bh=/kJNYSwQMAZ38J9dFYUh6Inn7/mpzEQ53xIVlALX/eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcmlKdn5oM8zn1hifFE9nzt+PhkRuAh6BAuUydYdpSCCuumL384qL1CeUilUXdW6l8IZwK5oM26lau/+uyEFpooiS9EDHHeU3e+iMms1aP2lLBAnjfM1KmYrlbrW4j/GgvyfyjPfLImMqIV54WscLUBRp5jI4EadMRPHBRtQWlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qexfm9CN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qexfm9CN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UIieZC017597
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 18:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vdPz24lEqI15VZidTfg+KW7P
	hm2QZaEnE7PxX62VRgE=; b=Qexfm9CNhDTByomimEo4RPl0L7IN+owpiz+S+5p1
	hZgQu06YNHXfxbhkSOJ3XGzEd/GePMTwweVbvaJFdAZ5AMgUJCUTUeQBqJcBMCBk
	XfimV37aTep51Mptw4xCIoWIXRcCwcUbrSqyDh6yVZePjnqxfMrzm02w4U2P1aX6
	Kud8viTxB+4VMf2Dprnj8zjpomRTp6aKGO5e0xbrnhsj+q0fHeWA8+UVLUuCYTOt
	1+INMAfN9SLb0QjP5GbVGWHz+4Eg6m+PEQ7yFtxHFPdQteArm1bVdKOBxRJUgXB/
	okVVlEr0RIJkzWb2/8Zh3Po1n6sW5u2P8M+m5qSINVPWew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tt8vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 18:44:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfc05dec2fso110933151cf.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 11:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759257895; x=1759862695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdPz24lEqI15VZidTfg+KW7Phm2QZaEnE7PxX62VRgE=;
        b=VjQw0+qhDMMlEUGKL1Waq75IDtP4J23mJk//GdGO8SEBZrbzY1vSpJ7en0mUfTc6gz
         +UMzVDpx6f2oi/el9r9WlaoyjKos/JLI887z3dE414MlLa06f3ZYvNYuQLeP7M37g8Sn
         9/smjwLFoFnSuxKPVXnuSjC4AsljW+QwgVGwFT/wAHrDIm4hNEDKCG7SW5KtHMyYtAq+
         vY/kNcC36P06Y0wepECjAFgRwnO1xegznh1X1EsiM8Ui/B/8/rVtlwM5Xi33SX+fnwvr
         NgjsTZbfz8TwR8YrNkp868HZb6CB7TvGkAkG36oipG7mP5xTAyXj5f3rBdtJgUMq0pVM
         2Aog==
X-Forwarded-Encrypted: i=1; AJvYcCVrwJQEJpsEfNN2ufsX1/fibr3UbQ9HxyudpXqDZAG0SDA13KihQq6azUOKUDmFfYcwgRd3zxIBIiVFzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQH4vSJxbooVvXafJrU6pYasCHlkiq2m1H60hIYusquPy0WpF
	Y94iQS7qDY1Pavji6ZFJTSmkiKua4OQzO8MmZCaadioKXw5Qtkvnh3oAUAweDrM8JDUUI36WhPd
	LyJp8KuOqgGK42ZnrHcUqC4OBWpkx22CHisAQGxq1qTBlOrRUITuxg1b6ISneg7oS6Q==
X-Gm-Gg: ASbGnctHLxXtosD1pizhxvWvF4Qj4LPwTnGlo6cd1aWchYrndHviucNPH3Lgd1JgxqH
	3Gwc6Dfo5zo1fn5Ej7/SRbkuMe70ZpBeVad0SvMOcXtxDJRQv/U2D7IuGPRlRCEQquCVMFk1mAs
	86ujRIla/8R6u2OTY8D/L9QD74Z01n2TNLLMPlQHV/HmaCOTMhELfnm/NmqYt0mWKd5NcJ5X7qK
	Xb+vu1j5B9B5SDLgJyvd/MkbhEKSXSzLIVuWWNd16x5xKfUSCSqEvh0TiTxjzoSx6ksevkQ76TU
	IL0Bnl/36pMdYqnGwiU0Z2RgHfiVJXmZBZXDxHcn7ttINglNeCQ7lgGgY/iTqY6eo72pPnuzZUv
	iugQATAcWJWdz7P1E7gDPTgnHxKiCieGZJwMgHjzaa8i8jui+h5XSF61UNw==
X-Received: by 2002:a05:622a:11:b0:4df:498e:9221 with SMTP id d75a77b69052e-4e41de7245amr7868071cf.60.1759257895302;
        Tue, 30 Sep 2025 11:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAm+3EqdOMSwzSrhnauxOEEVUoJNPfTyIOWUwiTcJoJpdYgzpAU0fJTYtBH1fFc3IBkxb8Rw==
X-Received: by 2002:a05:622a:11:b0:4df:498e:9221 with SMTP id d75a77b69052e-4e41de7245amr7867701cf.60.1759257894847;
        Tue, 30 Sep 2025 11:44:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343130asm5211788e87.1.2025.09.30.11.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:44:53 -0700 (PDT)
Date: Tue, 30 Sep 2025 21:44:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        srini@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: sound: qcom,sm8250: add RB1 (QCM2290)
 soundcard
Message-ID: <zat4n5izoh2qok4vojbgnofpy3q4wxdaw34ekniznlpzlb4zli@wsupvkcxmnol>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>
 <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>
 <DD69D3NF9QWG.3NJDD1L5EQFMF@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD69D3NF9QWG.3NJDD1L5EQFMF@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX7p23wyNlOlEV
 etxwIS5+MRrt3K02x4eAYpQVPMNFwmvWxVRmNaHbisozBvmsF1IB0xK+fvWUyaaWBt+9Ll24/hc
 maOz2OG1IoUjXOBxPYIj4iBS+jhP6UA0vbCvdKKSe8TWxpM7aBRK67kfjzN4GP287S9719OvEiT
 ZlBl+ieT13o8C7mVLZp8W4S/PpH1V6pPmV555pYfFbmD4kZp0+Oh/J0u1zkX1QtfqhE9MhDGuZ4
 JhhuzFDPe5Tb61F+9q+5zQGm8F019L2Dks6Ysz+JfPK4kjj+PsQR/OOV4jDOXt6uWvqbm0OpHgz
 SWmGR3qgygtdZlhmopfDLdn837JNbYqZu5FHEjgqZ3Q17Ln29P6WWFiwFUA3aMf/yQCBRm+QMBA
 TyY0Y6sfoZYlfe4gW+0FSw4Pf3ENoQ==
X-Proofpoint-GUID: S3Hbb1S2nEjqFpvpAEp3hN8swNB0qnQ6
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc2528 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=xJt_Tp5n_Jr9EY1zxnYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: S3Hbb1S2nEjqFpvpAEp3hN8swNB0qnQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Tue, Sep 30, 2025 at 04:59:46PM +0100, Alexey Klimov wrote:
> (update emails, drop old ones)
> 
> On Sun Mar 2, 2025 at 8:20 AM GMT, Dmitry Baryshkov wrote:
> > On Sun, Mar 02, 2025 at 02:49:52AM +0000, Alexey Klimov wrote:
> >> Add soundcard compatible for the soundcard on QRB2210 RB1 platform,
> >> which at this point seems to be compatible with soundcard on
> >> QRB4210 RB2 platform.
> >
> > Is it? The RB1 uses PM4125 for audio output, while RB2 uses WCD codec.
> 
> That's correct. I also managed to enable hdmi audio, vamacro dmic and
> pm4125 line out output keeping it all compatible with qrb4210-rb2-sndcard.
> 
> Things are mostly the same between RB1 and RB2 apart from last stage
> in the output and analog inputs (non-HDMI and not dmics). The diff can
> be described in board-specific device tree, amixer's control commands
> and model property.
> 
> Is it still need new separate compatible "qcom,qrb2210-rb1-sndcard"?

If I were to follow other examples in this file, it should be
"qcom,qrb2210-rb1-sndcard", "qcom,qrb2210-sndcard".

> 
> Thanks,
> Alexey
> 
> >> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> index b9e33a7429b0c063dc5f5b806925cd541e546cf6..2493ed99268bf2ff8343020150c2c9aca4262514 100644
> >> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> @@ -21,6 +21,10 @@ properties:
> >>                - lenovo,yoga-c630-sndcard
> >>                - qcom,db845c-sndcard
> >>            - const: qcom,sdm845-sndcard
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qrb2210-rb1-sndcard
> >> +          - const: qcom,qrb4210-rb2-sndcard
> >>        - items:
> >>            - enum:
> >>                - qcom,sm8550-sndcard
> >> 
> >> -- 
> >> 2.47.2
> >> 
> 

-- 
With best wishes
Dmitry
