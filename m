Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F281A00F8
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544881; cv=none; b=cOPIW9I7Q/iH8KvPoG7oaGOit3nGaqRuwKDIwkbhdxDNBINVY6ishqL7D2X8CuS0LZOhfTokzDtlJBkT03zZRU218BjUr9IDgmzzvQmqGkHx9DJZi8TIFVMiseVVg2gLogD1qd/P9rDqIMtRfLSkaPLBF9CAyYo9lfx3VMQLypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544881; c=relaxed/simple;
	bh=NxTRFXEOSM97xS6sYUrK3OZV1E+9Shcf60A8QqXUvPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DE8cdH9LJxI7urqeZ5QmXzJpNiZHb4Xka4yFgsHCH7RtKN+NOWlwm18BTppumYhlHpkqHAD4ujYnpV2IYg08q+pz/6IfHg28kYuQegzh0EowU+l63jalkDZns09X/yAYlIWZlX664Cgc3GJsKUfIicL1syjvl3tjQxAO5TWy+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4UhgkLL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4UhgkLL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Aptxa025936
	for <linux-sound@vger.kernel.org>; Thu, 3 Jul 2025 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=; b=g4UhgkLLr1VlwHfN
	wVL7Bj3Q5Nn7x1YdMiQ8oMgKdzy6ldIZ6NRpj2gkV+iNalwLwG7i9fdK4T7vngAn
	wACxt2VbL9ruvTNdep6qvs+C0Y2RwbjWgzrQ6AiDC2aWbgIZgsybjlq5ghkSwJ5D
	ncPDMQpGvB4pn4WB59CTmF7PVflGFuFnyRI7ZvwLMOAb40j3D7WkFBl1+G29gKFD
	F+zBuhoCfuiIioBvCay5n1p9XXk0tRBjKx5We1kWHZLsS5E3pZfoGhqackEMXGYB
	qfTtkbeSZ9DUUKJcdqlTzPmpX9a/b4hg+ZFQjUcGMg6cqePIirVa9NYOa0qqHBJh
	KJ4iMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64wg90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 12:14:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so202886085a.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544877; x=1752149677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=;
        b=P28mP8vvgvmkzEHT9HZq+E5U8UCw8LdU+iCsdcZGZq5tnMXVdFZup++eWV3EMxkna9
         o0YMGwg7OR1UGaxp6fNnUiaf3RquE6B/8Jz/pxrWJ7KomTzplq9PjJ/D8BmGrDukBcjN
         K6ry+VhESaCR0a58QY+jFyenkNw9tD2ScMsW0bfBpkqiHrcU3UC+pvhT/Jd7JNytzIr9
         T93KCEYYIhSmKOXyoRqU8aDC02nTLlGHuWcAPilXwwMRPvJAoe5eC0lu2TZkA7ui+Rdj
         zas5WdRs/L7t7l3zNAOHvpUbJdjo7QF2KRKY50nG1J2TaSlK/872ooc4TL2IaQjbc0gS
         r3zw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Gweibgf1X/GWZ7uxrJNHJ39DRN46n4eQk+izG5DeRyGX2OYy+DjRCYerBhCvEvG7M7n7uost+0FMwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HxzX8nFVkYiDfdG3JQntrrvjeZAARhmUA5viEZUlxpoYunvr
	km8gTLAIYI3iycSsU7aalTq1MtLIGKlV1x64TiRWid9LBD5M1/5IofK0CjeGN9cHLmE0KsZ3kHu
	t73eGWNkdOxQwHJRdcwZ8J+ulnTTAQdvUl33KE8EZ3OV4UY6DFUMisjaLFJEdDm3DWQ==
X-Gm-Gg: ASbGncssMqNnrEG5Lt36AiYqQoBYfbXuLXC9R8kUHf1svhmCISwxSVcfuo+8EDLh6EP
	fDrpEQpKe97q18XUPRrVvqaEFcXbhjdy7NJ5kn2cM2Snq+EJYZ4MI53paW3H4V2C76RYmteqXCf
	G0rt6KkiYKKZ6IKnhSeWE1/++Ob+zFssFXceHcWPJe/u0VDr6ko7/WXeAY5LXJriJ1IBO+dVxGD
	boFOTioFJ1Wc44IvtuemSVyoNGTO+1FC5TTx5IwavVlb30QtFShHa9qQuNzmQJcISYfLzsPsYow
	JinkAH8tGUU5IoPqxmOz7gaTHN/srcyZb0CwTPb097bDDE9tj2HB2d8Nyep04KXF2aKPPeywnE2
	X/VR17AWU
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99411785a.12.1751544876880;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMv5CgId/QhgXJ5gc0O6c/YrTGP1GxnRv/PEaNbJnkJ4hBNjdFtHUDliUBepNzEy+MEM5IEw==
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99409185a.12.1751544876461;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c013b7sm1244061366b.80.2025.07.03.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:14:35 -0700 (PDT)
Message-ID: <9217c52e-f0c0-4e7e-a2c2-bfb580c7cb17@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6866742d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ZTnHXLMoH8r4M2ZBRPgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfX0o+wRoTpoZAC
 C76hzplr8J68xhWj5bUzcFvoTYgVfXgf8L9OlrCryryvSMh1txbCmqRJzaLX9oqjKZ/FB7skvTi
 EUY838Jc26vgDiVqmsHPNJcsU0PqMp2BfxcTVaOaP2PU3mzD+cCQf6ngcH1WP8LQYYJcl/TLemC
 3sxAKqifp2m/G3kHh9QF9DAD7r+rqHqdscBMgQ4WM5IpJxUraB7zNZGtq/5K+4yF5FJtAg4M8ve
 zkq4UNncOhmix9uJPbhGRFnzmyTVmh4lylv5Qbj9dnCaXeijjfv619WAaudpxNiJCgNuEfspWhP
 ExjkcX4LvgGNY1HhuSF95TU182CZQVjVG0JRJWE5vwUyfKsONBlReDESRaC41Btnv2UtHSFo2AG
 Zj1u/cUscDeA1uVH0p389wL/do6oDAsoYnBuvIcvXT+i4Q7IBfxvmVr0+T5gEAVvqEGBf8wb
X-Proofpoint-GUID: VGfSl-ofrn9t56GBvJym203qWpNY8iLP
X-Proofpoint-ORIG-GUID: VGfSl-ofrn9t56GBvJym203qWpNY8iLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  6 ++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 6d3a9e171066..078936237e20 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -58,6 +58,12 @@ &lpass_va_macro {
>  	clock-names = "mclk",
>  		      "macro",
>  		      "dcodec";
> +
> +	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
> +		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
> +	pinctrl-names = "default";

This can be moved to sc7280.dtsi (and removed from IDP
and chromebook DTs as it's always assigned when VA macro is
enabled - they also make the same changes to the pinmux
properties that you make here) - perhaps in a separate
commit to keep things clear

otherwise, I this looks good as far as I'm concerned

Konrad
