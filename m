Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E623EB10B
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287826; cv=none; b=Q3b9f4BoXbdysrRGujIBTN2RuASisBQk9XYWvLlDy1qykSmEtnOztPVwniXMYbdZZunM8rJJtIXmlU1oy9HZoAzAHCl6mUzbMZpgN4An3iPoY6KbagfTp6p90g1f9PqdaZZnrZUHY5bodushWwBc7NNVYfLyUJUA8I7XkWNcInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287826; c=relaxed/simple;
	bh=ctsqA8eW2YgTkr/ZrLNiW+2zgf1ef27dlLiIERHimeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3Ru2mbmRGK22f1+iLQB8uuTyV5CIHD8Epon7gWSOji3DlElvJegynFfwrd83aIK46bRVp7/9Ozepmgo+BYVuZaX6tNph0Hx3od3xYv57jooCd0riLw0gXLrZPw5epdvuvLYsfR0Ma2vZZfsNyDQNL/pxeL5zYjB0nZW2mHpqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfM0zDci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tjyvex+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfM0zDci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tjyvex+x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASm2R2634682
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 11:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=; b=RfM0zDci2hpk45J9
	/lmwj59IZ+OVyCnkHZnTUoB5jCtjDfnJkpLgQopZ6HpbxFkdInxHWvOOgJUeR8on
	wTVwJmWW6wdRW1HiEGJaSKdgONwv4fSFyDMp/VP6Q1XnwVg2CJ8thON5ad/WEeFn
	DFbD4/L91Bg7SgVI2L9lwmO8N3FFpbVFnIYjzxn9ArXU4H8ffxruUq2coy4I5g1H
	6A8f2Xywn4/OtPQV4/aDkrHpvpHPvtnblFtBOFQePlynJqrvs8Q8po3kgBUWyaVC
	SJeyszAxdtoacbPDMjRebhjFDuuzve9h30IIjzE1ybfvbcnysNRlrtkloyfHvhOt
	YgjClQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6kfrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 11:30:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so11562831cf.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287823; x=1784892623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=;
        b=Tjyvex+xRYcR0RJws4X0Q2ke8rneXWbBwQwcllu51MiWRBvMXTs48uQ0+BwP+s7itE
         4nEk/DYm6QkIVRN2mVYekACQU65HFbzwRoaAQpYpo09iDxW0a3arUIV+rVLk3aruoun/
         7nlNbMu7D2StvtiksFaRcx/3al+M2GCQ6VPMAT2CLJOQ6vnXtk8ap3wI+dUm4PX/c3G5
         JwHume9nPF/EUHomoaC4jv76QgcDanSerRDBUX+RwBzNozXpmvnNdVfHxMS0k4ByL3kK
         bOleCnAgrZj75lzn7li0ktGICw74L0Pw25a7wrD2U+wR/rM/vKH7HRvbtugeSVtXj1pf
         xQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287823; x=1784892623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=;
        b=NrYTQR2gKoJP15JHtMxMTA6neHEWD7ZpG9/9fa0VjdMz+uUmYmewQYtU/ZeJ+5445p
         LEllYybAQi2oTIR5PDbrM67AvDb7SZMTe/gQn/UxL6U7Wp03MMFPvW1GDBCtn6IXPsDb
         lV3SURkL9PiDAayL4FhnOqusNIIRAW2+yY0AGh8k3Gl4akRdXGGYQCTMPJC2VJhSoOEq
         WrZNyNEIlJvD/rsF25Y6FmdTUFESrCutpt93fnj/a4VI+wjcZlb5i7K/HypT7+pV0p++
         Cx4SsNm7YeS/JL8P8ShKACeTjJH3SBCTV8LOTIm2b8vkowatK/436Gf5eXs4G1i6rzs7
         Ay2w==
X-Forwarded-Encrypted: i=1; AHgh+RqfGPG1C9Gw23Op3Ld9fu6qohPqd/+17jc1ubU9z0R2EM9zZmWZinrltqhxS+QA2DMZ/XdiX2CXHmFUSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNInwRIKY3oMvm09M+m2z/Ai5N45v6FTkxHZk/L74ersdpkK4
	7w0aze/uCPbJ8GIzZcvuNPlaiW50WG8DKT8S+EtKAqK/7JOgxWTvbIfRvSlIp5hIInXu2XpXBFd
	8MFn8pggQXaOpq8qZ7jbUPlprJLi/WmEyRx6+3zrscCwmf+726xL+1a0sdRkmNiMZEw==
X-Gm-Gg: AfdE7ck9cdVR2VUbTeKUwdlnV9bYINIJh4vcuXdCsMuYpX5QYXyTX9eFBnrtvooJJyt
	fl3bstt1l6eoQ1YmGGQbwoK/gOnEbDxjL5IAjU+vmjeNj/VUQffWuJIg/oRvYgNbjruMC7C9tJ9
	nEIyiqIZTXchmRWjclHWa6qmOMi47PeW6QO6PuDlUi+FXJETeRe+FxoBwovMKleUZpumXlcJatM
	eBEXWQVtLQyonEwbYizQdkqTTMAJfhEdWCjmXk1nlACUNspLCaGDRERYk/SLg2Pe4V28H2LQ3Dr
	5YVv8CjPOuGvsr3fAa4oRkhVlvMKgNw2zV+q+vlNTl4BYB1VAPqlCnu5lkDOz98JdckcOqz8957
	h8w1DM1jJqIFZW+mMK+X4jIJY
X-Received: by 2002:a05:622a:11c5:b0:51c:1744:edf0 with SMTP id d75a77b69052e-5214034ea39mr14545691cf.9.1784287823441;
        Fri, 17 Jul 2026 04:30:23 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:51c:1744:edf0 with SMTP id d75a77b69052e-5214034ea39mr14545191cf.9.1784287822904;
        Fri, 17 Jul 2026 04:30:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1735f20279sm58707166b.53.2026.07.17.04.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:30:22 -0700 (PDT)
Message-ID: <43944722-3eeb-4e02-b3a6-6251d5fc78af@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
 <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX6HE7Hn+GkPM1
 ECBa5PjF+hcN0P7rvLmM8yhyq/HxbvUvwuw6YOUaXz9XwztJqnEYYN39JurdSDll71k5D2RLRG/
 1fCwbd1hMg6hyxHcUnxEwVcBMl2MUfYdaiZvYStAJD18JqN1cg7r+n03zvbyKkGWYrYIhadqEEb
 SB5IEINATMROpJCNhOFvalYGuFKx4E9upnjm5K0pFzjAYKD6x7ivNPp2SXVP4WwLpmnCfVVWPYh
 UADg+wLGjva3fMu/9hrEDyJDMNr22+9fqgW43DA5174kL29r3ZKx8E/AA8QRLFQnaxnVVNsIxXP
 KTg/7Ri7D7cXC8x/gEC3nrU78YkZfV8MRhpEej0QAwl81ztC+u7Y34/kdXbh1sKo/14/nR8b2EM
 a54B15rZNv+jnSMk6UrEEvsLzDpSQ1z7v8yMIfaYG7lmitlv/uLnP3czZHRE6wjDefDgBzloebq
 jl6yTdZumPIHTKcqc8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX1PexbcUR9Lbf
 MTLU9jh9vTbGOlqov6+QoLcl+Y54KrjCN86Izh2/UXpofvpWvWkx0/1qpIpVMOSmxcbMk67smxI
 PDAg9VRslGreQ/Rvtb7XLaUVEepVrcI=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5a1250 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=-lbNPa_U-NigBoBspYsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CLjEPJS99UbgatBNrSheE2-o95j09sMv
X-Proofpoint-ORIG-GUID: CLjEPJS99UbgatBNrSheE2-o95j09sMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170116

On 7/15/26 4:02 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. The primary MI2S interface connects to an ES8316 codec for
> headset playback and capture, while the quaternary MI2S interface feeds
> the LT9611 HDMI bridge.

[...]

> +	vreg_es8316_3v3: regulator-es8316-3v3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_es8316_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&es8316_power_on>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Does it need to be always-on? Is it really on at boot time?

[...]

> +	mi2s-playback-dai-link {

mi2s-'c'apture < mi2s-'p'layback

Konrad
