Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BA1F2C40
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134283; cv=none; b=Y7IwbS6fGIUflRDIDybt2vbONEs2rf80X2EPqMCSaXs1ph9toLAbOlfwjVL5s1vMMsNYv/mnzyxI2sucsl9ldg8ZBgAU8CmQB0pHsIkeSc2tqu+EuIZxY9SMtzKKM3e+q6DRQ5zzaIXUE1tm6ltcJKwAvXdcQS85CAKQF5anfwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134283; c=relaxed/simple;
	bh=pDRIr3V4Ke+1ZHSEkU0Oe5jdjCVIe9x38Ah/rOfZMZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzsEfQBPT6kBmPtdE4SN9sckM2w3hBz9fFbGlhPOFUgCcOxG9A40zw1SkFN2YY34aP3aiZtSmNst4UfGP/tJv0wSYeB3jVpdnM+Q05JFENxtlY3FKOqtHwPS7xAQdY6IcR6/3wmFehUjmb5YHv5NyamtWaeMjtAiMSlKrFrtQ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFR9NtIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFR9NtIE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDJdrhG024728
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgJEpjhUpjinZzXlipmWXNty3sU1HuvMHZaSJG8B6Fw=; b=PFR9NtIEoxfANhHk
	tfYO6r/pVLkvkT73l8ANCIrlgBFzY2R/A21ZXmsP/LXk4rF5Bo3qnJXwkL1kthpf
	DOlUQ9WWquEHIfdFJMwnCjTWOqOgfhRSXT7ZS/bd6HDxOB1KXlHo2E7fzSqqcpTk
	TerEjNrU865ISQ63rPxAdSRPLwyLOSHxZcVtQAb7y1yRvFr+LEv7lW0boFMUDt7t
	GivRtqnRRo7GfEGj+ytpfYlC+dorZGC8XFZw43PBC5mT10GsL4G4l2it5c5x2pf9
	UH6rLSv3y8Iz6H87tih0UwfGSJEr4oy28iC3w8yW02oLh7AydJFhs+fdOejTPO6D
	ITq0pw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wnbw87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:58:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679af4d6b7so4180041cf.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 15:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134280; x=1734739080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgJEpjhUpjinZzXlipmWXNty3sU1HuvMHZaSJG8B6Fw=;
        b=ZK4E1FCBE2qSxVftfPdUvGJvcB4YeWvK5XjNWhb34F+bZmEu5bIzj51SaUv6Y3ujLL
         nlrAL+qNuRARPHSnWdTq8ZL31Tl25pOSdDq11SJR2ol9+EcF5gNVfRXDvdbHlvf+5xe8
         9PqaueGQRQ1siuWL8XvLvMKU88Z0cSuN3Dm+dDoBJ/WiAVIq8utA8OXCQCLBaDLO3b4U
         S3LAcbhklHZqor+mLSanA+OdcpfcamJ/bK0EPa9z85E1sDVx99yXL8CY1AyAsp+TPBu9
         Yf+GmP0ndPccVwTRpwSUWJWUsLhpZOWrlqeHFWZ8FbzwuG/t+o3Y6qjqb89pUCnsfTKR
         c3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY+a3+Bhwf8GTaOmUzcGpNNaIRCEarWEuQm40wcuvmkb/1YS68FolQ1mye8OGmrtQG4Q/VzVab3Y+uQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx0SgokXI1fVBRMFoH/Vlyo5GVIdWA+BifJXY7ArHnFZf42jDB
	9wtmKsW7tv6A/wjd0lMYB73f+scwmlNK9IqMxSvi00u8VXdGaapLSLPrNgEmjxtBVzDAZ/bs4T8
	vzGCFZmdLdwJ3s8XVspCBanMIBk/GELaLJH+yZwscYibCbBv6GduuLiwHziL/FA==
X-Gm-Gg: ASbGncuZhor7CNBiNDwmY/V0O/sKwH1pVBKmpJAsROY3cukPEmHIJWGyASNZIVGZWgM
	0S0+B0ugEiBbIaqbk/oj9xE92KTdEvXoIlVDtCiyYGe84q68//IF80O/2SoHHLqQITjenENSZ8k
	fLHO8BHxNZslttgchejqwyo1nswiiwQdSqiXOXttkwFyAQCBTK1Ahtq8EAWsV0zxtZqBCINwTwY
	S9Uzm50+BpTmYmkiVHE53mtvs+OuQztZHa+zZRdTi3IhwZxEmXPMBvZiCvwSj+Rti75qQYVurNq
	HSnrRT69WsejSRNZsOOPVv3Aix4sIN7ZzfY=
X-Received: by 2002:a05:622a:48f:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-467a575541bmr33495551cf.6.1734134279985;
        Fri, 13 Dec 2024 15:57:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcInsrM80zY2XXRjWCmn/lWTNWUgTvmx+vLeVynOrPi+3UZMdf494lm9kqjgSOZLAPl8XB7w==
X-Received: by 2002:a05:622a:48f:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-467a575541bmr33495301cf.6.1734134279626;
        Fri, 13 Dec 2024 15:57:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96005f17sm26656566b.17.2024.12.13.15.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:57:58 -0800 (PST)
Message-ID: <abda0d4c-9094-43ee-a6f3-7eb4659d734f@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:57:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] arm64: dts: qcom: sdm845-starqltechn: add
 graphics support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-13-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-13-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rNOO0HQt_KtBe7fsl4KWvpw2el5xFGzt
X-Proofpoint-GUID: rNOO0HQt_KtBe7fsl4KWvpw2el5xFGzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=803 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130171

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for gpu and panel.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
