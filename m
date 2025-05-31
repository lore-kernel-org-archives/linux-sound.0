Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915A19994F
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716062; cv=none; b=EEWWeFYTLp9StKJCNuz+q3WmiW4JHf3zIwoFNF/hVMcuIoEi5o3a1ofSNqvUDjPd1OYQyytS2vWAJZx4uNgTAr1zvq8hat9pNt/CmdUGK4NWEmTJGNkL3H2/r3oi01Gu0J7Jk9b3Ta0kFA4gk6bmhdwAkafG3Sg3QJwHUuB3zfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716062; c=relaxed/simple;
	bh=QVyTy39kGa7O/ePiyt+9nmFnLXJK/m+e+8pa1txDyEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8ZPHvVgIXkFuHTo5TMyucGMZqQRLipZHIfzo94lPxmpIXjF4s4KOZmjZ2Q+GrCDrGOD4jD7YqM2bY9G4IYKklNzsUjW5HHuzXocI/KMKLGYnsPMS8nbkdjzWf/6aQHj1U2N1HTjxkSEBgEL78nfaTgbWegN0ALc8tQ+lxR2e4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOt1W4ok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOt1W4ok"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VF9Teu032210
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 18:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=; b=LOt1W4okxakbYLOA
	+Wk4LRUaEH5afMT2rxrcAR0ehLnk0BQmTiKh3x3YqPwgqnsXSToeEzfR9wHASoHp
	KUgabv5mkXnIK/LodEMYUssWg/PgXv7ceS9crjh/KoeMdFFCIZ9UcA7YL6tjUoU6
	92YSDS76VRgKVeUlgZ1CPNtd8z/EUGR4lWACPptAgMZb5L75eJsRw13FI7GhaRyx
	oz8kITxX6ysSpQPFfXBnRra0rXELn3rs3ia53CKwu03mo1QxEMSAf8OfkmqIpMzc
	DyTWrnfQUGOOgIXDlXX3uIZPmEpaj54KaGnxUB0OPuDyc2R+/R/aYVFON+8zAO6+
	9mBQKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw16x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 18:27:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a43228ba19so9352391cf.2
        for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 11:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716059; x=1749320859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=;
        b=nNuspbQKkWZ2BGWT3Tn9D6RK8bXzjh2XqojLqeCqQ7MCIw6O0QBIh5yD9tcG/C0IQ2
         hVzCB2MV3Fld6+Z+Ot2BSLkT+I7NmvQmM1FFYReo+fmND2vK0IE+P/0oOBYzlWSzGCrp
         i1vZNIVM3MzKMcD9lUW2A4CJRHquXLXCvjrKHw5V7BPNDnW5CHWmmE6nQ0pEv3xqV5vU
         rQaBwztd9pdxc+LZtvo4euww41hS2NHgN0JMMAB/a3Zm/3G8kMjkS7Tns+QB/CHTIccL
         QVRNIFhdUUEWKqKBcSKuPaRm26J/688FW5IW3B/z7jZ/o4nJdbMx+ABBAMpaJfiA39ug
         MwTg==
X-Forwarded-Encrypted: i=1; AJvYcCW4pOH5tMfIW3waAPsYnEgeukLizADjM0zQqoMX5kTuZBTHcwrMFRHY5eNN3v5kmdUiCSFPqPquCGYS3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5F6YPefNApvLIjMey5h++nnTlW6Vo+IUiuERH4kR2keDqV/q
	JUZ3TnzAou5AtJ/GNXrpn56KpcQKuuQk3kIG5hLafQBNqSCzXCGmndZDtXomikcbAzesDPzdR+s
	tqhgngOoxCoiNInFsl3SM69fuev3V0QFuYGfqoM4voNBSZJ3JG8WZyPE9Z+cv7+ZWBQ==
X-Gm-Gg: ASbGncsOn108vNKGnEs2lXDimvem7kw7aiOyYwVziyoCm3AnApIMRVWdUu8XRoLwMRI
	6pNokUkI1PUeosUacWIrijNeWNY0ct5IDVVo8ueF3hgDn1Yvi4Yi+N3ZttpXmN5nk4ZKlRsGv9K
	PNLG7x+E3JC1VtcGgFzJjAYQu4ha3Kf/Z59V44LRkjPzn9h/7caSjdmHs/QeI0c4k8PrYSLS7S+
	GooCZIdpVW+4aKqfDmJjHzn45xIJ1KWcxE9iOoO0cTKErtmPZ/d+53DPTHBDqj1lR/BbfVigx4T
	80nIMnoRRAqYuNAvXMt3lUgXkkpizIBl+8Do5nwGwA5IQn2IGIZy/csQnrtFaEHr7g==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413429185a.2.1748716059006;
        Sat, 31 May 2025 11:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4okjwDO7D+IbmXbi6WJ92L36mIWN1ZbbjDie9mCBjaikBKTLN4+hEu+tJwMEbwza5FLtwWA==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413428085a.2.1748716058574;
        Sat, 31 May 2025 11:27:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef7dsm530456866b.6.2025.05.31.11.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:27:37 -0700 (PDT)
Message-ID: <d3ee0492-afca-471f-9dc3-456a94bfa355@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
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
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AEXzepoxmnQaDyOGWa7S6qpQvMcY8CwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OCBTYWx0ZWRfX8v2SJmdolVlJ
 glXXZ64kH772U+IVo9uzRsvYEFmJK2ySssswMzq9e9j/InkyhKf7pVL7NBd3g7fkui0fjrMro0+
 uB3V2NsvDRw59HmeFYbZNT4Xe1+8oRVyZkQIviQc9PFXagvUhOZRJZpPpDDzib0gUCvY3v57mej
 BDaOZCJbksGpd04ZdEwIrCHDFpt6U0Ucg4fWQcHFdyuye1bSYaJJFUcy6UKU0waU9vr6ZRBNuTl
 WNELOGgGqXM+U2nyOxUv0s6r46P5MMiRPx/ohY+HTk/BwS2ZDE615pY0UqjLJ36PMlyplMOSrDY
 RynBM0ERG/Wxk4TxWrfWwEXesHA5bsb7HOxXpv69zYX/Vded17BtJ5VoBdvrsYKz8oYLwFuLMWy
 MTZxbyYVfHjQXk05lnU3sqHfdrc2tVcI/kEVWY7kseVwOHr5+HPI0mzmWLVmMDfb56W501yX
X-Authority-Analysis: v=2.4 cv=WI1/XmsR c=1 sm=1 tr=0 ts=683b4a1c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=IZQIRLw8iM99TnyeTF4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AEXzepoxmnQaDyOGWa7S6qpQvMcY8CwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=878 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310168

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
> Unlike dedicated core clocks. Core TX clk is used for both RX and
> WSA as per DSP recommendations.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
