Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880F366067
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497766; cv=none; b=Abw9yZvG4OoawMG2oaqrKgOio2ihM036cBTLNgua/znWi08C4WgaazJ/iV1po9+O9Ukz//7ylCNw3tyQCyUAVjIbrNBbkDGOmMGu9JSgkdlZspxxCj5R5JLWnOOkG1KxPNaudDxf20AjvlIoQS6EHgmzCOtQaJ1UMXXTFKPHX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497766; c=relaxed/simple;
	bh=gOv4VS9EHIe5Sct/b+gWWTKyyPS+y/BthjK69RALP7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz9oFfR7jYYcWAt5kxwTI7wIoIA3zaf9HNlGe6YYeQ1tu/bt0F0PgqH8BE8etzMkNrjJVslzclAR9yd/xYrT0aKOKY8bRz8uc5l8LTjqkIs+9YWBgG++W1tOdvuAFatbuFcDfSIv4m027VvwSCq65emBbsPpMRqihBAy0BkP3Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9MyGdCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=da3+72vf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9MyGdCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="da3+72vf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9QqJM653394
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 11:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRZj92zBfiyurJF9ODq+hm/ajRFs+7hJHoO01ZvOsXo=; b=N9MyGdCGrrGAkv6n
	DEd5SfJY6wQ15YPRRyG6oBN43VHYzet71ts9n8JbYetOS+OQmDMroGArPtWGXbDK
	mOi6YCHirjhIyyjP1jsE6QPCY6k6m5wtX9ETUTTas4vtZpqGtE48t5jkG44nff6y
	Ptc482kB5XR+H2D+LgFbsDiXmZAXUG5uxPAiBSoWh+R3z2vQrRszN6e7irBFpDbv
	GjEFBqSoTO59ZeS2e34Q004k2XsaAU5+3tZ44Ucr9ZYty9a4R2J2rWDoL2RxaZlm
	l8pEQLbFPOMHMFnQXUHz2BhlNdEkpQ8OatVdBan7/d7MDjoZJHKzwFHjevE+t0wd
	N0EzvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9dxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 11:09:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb0b93e90so8571531cf.3
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497763; x=1779102563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRZj92zBfiyurJF9ODq+hm/ajRFs+7hJHoO01ZvOsXo=;
        b=da3+72vfYPGVci3lPucIaV2i4Krs6T/MF/Gyjgjsh8/2roo6jQ+kKAS5u9X1s8XVaW
         7miCka2cjpKnYuqhAeeX74PmqLo4760vCiwi2gytggpAskiCJHLa6tdUaJn6SCuJNFij
         a+gnXxxGzrJh4O9GJjD28aYisoB+R6awtw4FAobs7iOqUeHTJ3s1VgkHG9IdlF7lezd7
         PkBkPC8QLUn3Jil5+N7Lp/lfybScRDok1x6c3eHYKQgsi+jWMgBYFJJOA8CJUJsvMQ+0
         7cJK3Hj3GJbFCNpYFG6Jjzo6BrX/4en29AlCiL1xH207zq3lnudVfKQBJxfYWbdzm9fg
         O8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497763; x=1779102563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRZj92zBfiyurJF9ODq+hm/ajRFs+7hJHoO01ZvOsXo=;
        b=NPSsGeCMkjJ8rfIzyXiDHdIFqcx01v5T7W+NFmk9XjdgueokeHNOVD4ASx37gP8EsY
         PacFgdZ0tRvr24mF4olSjQcEHclr+UwLxQE3Ff0AqeQBbcHUA+ioReGyEGgTSkjpUzd4
         D14dFF+x0AUW4KHUCxi/80BXgVH1ORXBPGYhtfTSX56Mb+vP6bsTwcRe43E3cO4KutlV
         /cTcUcpMCCc6NY4jliqQCelpnVsM9d5yEuUs3Bnvgco3c0upaConVJ+Oegrht7wRIYAY
         5r/T+L79TARAAJxraJGvQuXEyHy1YrXKQVF3nP1zh4NMdatWo07mv8ynvx2Y5wTSpVyA
         ZZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ/5QFcCmovFWMxwjOccgxGeykIrCTuQJAYjEzKGXqYtrkTD4jTTUck7H1aLxCkHKQ3ZQbbg5RSCobVnhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84VGMUIaTg8jlZksfbgobDnwNwtR5vdR3U/NpD3fE1cxW2Ng3
	dAlqyfDFL769j4tNXnymuUGLzjLQR3qMJek6fp1gKZdjy71W4EOv02Mxa7dIOYMY6U3PCfaRzv9
	VA1TnQXiK4mQ8pmC0karLah8QiKqfrKvB+ftWw93BF//gi8sjllWxxdP3nt+//FDGVQ==
X-Gm-Gg: Acq92OEuZIjTZ7zRu85rTiPHKVM3h/Fp66bdIhWjgtRyNzx0W+diqiEK/xXvFh/eNU/
	Fs0gv1/VP9NLxAI15z8i9thJJoTacyr71jgQNnkczAAefZGF+ysVYz3Kua13nz0Yi0TmhUI2CSH
	6XBHW1LDq31SAzYfFGVFZ8YXvTlI5rkjr3/cNo/UDMd6szk7NnKlebLOHnb4c68SsNCfY70VfV1
	TZcM2oDi0/stobmA8+JHaelC/IOJq4eJMRqEBwcGTO4tsfvNuQppxMfTIUMMyGTrW/fEyb7CwhU
	YHW2XwjKPsxFcb1KOoa7ru+ckv3wfZ5bDD6tditBTaxBmxBkUT+1EG3HdFVuWDgcVVbkf/YUN4F
	o+P0trJKjdB74Vf36NQloi0ALdNTJXD8PTQstRSDbCerTSeIgnsjmDIkWVO3n2AlHbaZrXaMAjj
	Iw+pJ479DI/jGI6w==
X-Received: by 2002:a05:622a:903:b0:50d:a92e:fead with SMTP id d75a77b69052e-51464ab1f81mr224515481cf.3.1778497763327;
        Mon, 11 May 2026 04:09:23 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:50d:a92e:fead with SMTP id d75a77b69052e-51464ab1f81mr224515081cf.3.1778497762875;
        Mon, 11 May 2026 04:09:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0a6fb24sm3574996a12.0.2026.05.11.04.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:09:22 -0700 (PDT)
Message-ID: <096361a6-0a23-49e4-aa01-9ec92d845e54@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
 <20260508113503.3550647-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508113503.3550647-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01b8e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=weikHDwYOGaAN1ZrU1wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMyBTYWx0ZWRfX7685+PbeMD+j
 d/oklSA+J6iB8N12wWrG4GsdCKcVO0YaM2HEXQoEc/+ZnZbWhWF6Xq9wgE8jbQn1j9HC1cUnADf
 skwkKsXZdlSZddyh+gV8njL04I60El4h/h1yN7xLEoeqO8ADVoo8i6z1gel+ZgDQsNAAHWGOC+1
 oujm5JgRIojO+yS66zzKV0r0yD2E1IhZ6L0zhlptbUElz8S/TgV9qpmiOzNn5LhAQF4X6j+F0F5
 jGt2P1EqdD27+8Ew0pByax51Tu9AcIa0cx+xhX+eqvJvyMVcFO5EtDpxetQuO/wIsht0JGTQQIB
 kX5aKxXwPazgEiJRh2pIW4I7SE6ToaHi0HkEed7DMTNO6csx+64xe7i+vCoXDkIyFXBFH13rq2Q
 7nigTVwwA0M1HRcO82iwpb9/zOfFsEM0iqu7VMOTtJ9zMpX+8Hor9WkuWDITj95cTbmCGj1uCtl
 PzfoETq5Ea/7DnjDC+A==
X-Proofpoint-ORIG-GUID: PMARprntG5m8B67Gvg6g2RhN_Gx3SLQc
X-Proofpoint-GUID: PMARprntG5m8B67Gvg6g2RhN_Gx3SLQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110123

On 5/8/26 1:35 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.
> 
> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.
> 
> This ensures clocks are enabled only when the WSA macro is active,
> improves power efficiency on LPASS platforms supporting LPI/island
> modes, and aligns the driver with common ASoC runtime PM patterns used
> across Qualcomm LPASS codec drivers.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);

Please use devm_pm_runtime_enable(), this will let you drop cleanup
calls to pm_runtime_disable() in this functgion and in .remove()

>  
> -	ret = clk_prepare_enable(wsa->npl);
> -	if (ret)
> -		goto err_npl;
>  
> -	ret = clk_prepare_enable(wsa->fsgen);
> -	if (ret)
> -		goto err_fsgen;
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		goto err_rpm_disable;
> +	}

no need for curly braces for a one-line conditional

Konrad
