Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20C37B41F
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251042; cv=none; b=rW/VbG34OzcfccC4DGd88vqbrgbXNKHy3gZOGXd67i3J1sLl+XgVV5YhzaWHLEwCrYP2iBwVV2xxj0sra2mld+PoQP07Hk3uGzzfht3bhGHCgfGNmEVMYZYl3rTtTdf1pJOo/glrKq5SmZ77liaXnvCJnshlUXhRF8t7ef2+4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251042; c=relaxed/simple;
	bh=r178vsKwvgyqUHd4xJpDzrxyGb4ZvsUOAqi6mLxfCRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzkV9xadTLYF9ufc1aLSXuQamZaIWrYQh9yWEiHkhTUdE3Bp3M54mv3iFhJOF8yunjR8Bey5HBeOlnhdC2nrOZxxwrTWQZ/ZpHJe3YKU/6K0fU1yfuSOcjXEs7pU9VqwWqIigIY9zVV5FYZTXm34hqh4XOwpDT1Ukjx48sbTrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=keyxsWPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ir8+80M3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="keyxsWPI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ir8+80M3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BpII2401891
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 07:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jOQo7atp0PkKhTHTvYjSenGu
	Cfs6kxtscFTLtljYI+U=; b=keyxsWPIEkauKEmZPfLb2SNcuo/U9LQqi18ufS66
	zSqtUZL0btXBrdAVlBeJxPIaek+bFswen3fvqHRmTXIEsCwe+9eMrFj02/EpNwe6
	ldtWQI+FfyF1ZHQognU8BJ7X8p6RPL2NUhbkFxCzsJTpmF5/OT5btFwnl06Cior/
	T60YA+gBRgYFpqNS5OAJLv6fqjc4VyZzu+92X4jp/A6kNaxqjRufhcqOoBUyf2L9
	y3/fBpE7p1nOQEWlyqKewSB7iXvnPOUF2/q/TOx+EWBZfWO1207E1HdasTPQcJrB
	ezyj/MyJ53W2c3PO76f9k4RnUmYXeUxsHTKAIXro/j2/9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30ga3ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 07:57:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517c65e497eso12479491cf.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251038; x=1781855838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOQo7atp0PkKhTHTvYjSenGuCfs6kxtscFTLtljYI+U=;
        b=Ir8+80M3trkpHPTaOeED2hvQva5PbrgaUDr/rxpHF64mWrbCA2sS3NwaA6guNjHY07
         bNYJu87zohmqnrdXNw00rd0ivQaPbB/4HJqhXPOXEXN5UEnOOqmXGysCCrFMniIYgg/I
         IGDZkIlpeSl/SHlfLuhiHYDPa/Gmw4fXjewwnw+hYfH1XjE070AO8kZ2iI2Y6pAVU5Sp
         iBcuv2L3RdmovGkWlaU1AF9gfALW+eHR6LRHrDWdfld/aqQ78BgXaeO6GSgOQ0MFzHmw
         e78GTuuzOJ+DdKXyd3JURSRWqXpvyWsRBGNxjPwZNfWOI8DjzMOwfG+VehD/4JmuQHzI
         2auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251038; x=1781855838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOQo7atp0PkKhTHTvYjSenGuCfs6kxtscFTLtljYI+U=;
        b=lHrDtifDTJReaX9WO8ifwLHxz5m/ao5qH8IxVSpUsJrXPUdMx2f9+lCX3V90/BVEs+
         IeGvZBvdKdDY4jLCloERDeLzJYZgqwItErGwSNbX+l3guT0T0lNMl3o56Dhf+jBZbXcK
         ZaMFlX/3qMPdIbmziAWpWlzMjjva7KJ5WGWGRIh4/mPuJFSo+orgNBiYmt0+GVuq4sGQ
         FJhAU8dCvKbeKW+KJtYx53XZJBIBXDCTAaGoq8yFpIpKIrOIVVvbTUUyw1Pj1Nds136e
         Z9hbhWWE6/M/M8D+4VSh+leYw47VkCz40dshvW8ADOj/iYuxIWiFFlEZuZHvwGUPBPyR
         A2kA==
X-Forwarded-Encrypted: i=1; AFNElJ/R2VKISeuRWLUhQHqVzkNVUJCMHgtolsb/5v9S7fjlWH5Z/B645wpPc1lgmCbdDhaVGMxnJIEItRdBkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70IRPtFyLqNkHF/Ghm1i3/YXpxRRpiP9OJJitze1dosv0MYyN
	H2iebGfTZ9blZY4uyQyP64bdguB9IkYgf6W3Ifj0RJXLSEw0qg60i0Q6ZQmZS2ZMLc4Ktkm6gwN
	DwUaEKH2BJOX9T/ka6ykafrpk81S0w39a7XhQmctmJOrhKDkPrOnPUzxplUbzU1lH2g==
X-Gm-Gg: Acq92OHcVYtFCLRmPtU9OuUQEGmf9ivI0llgm1MpJ4rEH+JiH/cpt9Ly6MrCD9tveoY
	BDcHO2cEcN6/0D6C6uI4M3urM+7mgo2hIOe0Jr1ZotFpJDHLHKtBEEi1b1/579PVCKm3EDP8GM+
	YUO4LotkukILF5StsoKfsjAvQlYuUb1c2d/kroi13Bpai7Jhv1LeLnrFk3z7KKBwyUh56tSfPSQ
	zGY+ikpbRvwTmcp0+ti6W2BgDVLQc6xArRmP63Am4jD3ThQPaJKtgYHDn2zQ7C8gFbHabrp/QMU
	CkTKhtOeAyctOByq848LNYYbINYD8xxlnPEbywY34UIPpbnZT1uYebd9PiksddmagAVUbBVNio3
	obYSqUohS7MI3odcwTN4V+slSIBwBPjW7zCRWXjEQR1r5I6gMEJ2Vh7DzwToiv+GJ5tt955OUe6
	S7Zv+OYuzSNe9z+Gpv/RzscCSsybxsbXlc4s4=
X-Received: by 2002:a05:622a:164f:b0:516:e39a:8540 with SMTP id d75a77b69052e-517fe53afb6mr21287121cf.48.1781251038451;
        Fri, 12 Jun 2026 00:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:516:e39a:8540 with SMTP id d75a77b69052e-517fe53afb6mr21286871cf.48.1781251037972;
        Fri, 12 Jun 2026 00:57:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f52sm321429e87.6.2026.06.12.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:57:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfXwWmza43u5nMj
 77CANLFEGepZvgt6gBtATnLwqJOAEz41Dk5G+nzICM3JnWBl7SmsiOSRZVcvRSqrxWl64DTo/xB
 eVDP0MeNCXXtgqvRDvmthPZLOUkcJ+s=
X-Proofpoint-GUID: Xk1I6ooJUBqmYIhHRDbuMCwB7qJzmsSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfXzWJBoV+xohMr
 FX7Sb/hjxDaRCWyTluDvcEsChh8IcpOTM9ufmmDHV/uOdnjVyxdw6NOYoVzDrSNdnKZ3DulQl0m
 cx/WfS5LVAU0OOBVbBRYv/6LrjHhtFagzkvMIlX3bvejjJFGkiQTZbyHEDr3Cxjg/pTY+iXrVg2
 jVbYAbe8txKn5+ci0ye40IGAaOKsHTi6i1caLoLoqpqMi4h9lH2g+YBfJfOBbwVxSnkD9U9dVJv
 8QrbPy0wp7i6ZVnCFbfuWw1quztGgRVi8iQmz9UmgWRkToWuN+GMAqQhLTT155ehnmelr8JH81S
 bqHa3SsT4ofhONQBALgrIU0B9YUaepDNdO7K1Qmyj7lRiVfDzplZlobKJ6eHJhGMfRiP/1vTzZ/
 ayK5zlC6pD9UqsEzX57zBVnDv0JedB5o4LpcLJ0HaCEunnNWTz88pD7fHjIFuNQlUGK/VQZ0Po7
 ldBwXYIDF8T6purhmNg==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bbbdf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=f_qOLs0Lkya9IhinK5kA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Xk1I6ooJUBqmYIhHRDbuMCwB7qJzmsSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070

On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
> is incompatible with the default SM8650 generic sound card.

Incompatible, how?

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..508d1445bf21 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  	};
>  
>  	sound {
> -		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
> +		compatible = "ayaneo,pocket-s2-sndcard";
>  		model = "SM8650-APS2";
>  		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>  				"SpkrRight IN", "WSA_SPK2 OUT",
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
