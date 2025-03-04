Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F082777EE
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106929; cv=none; b=hZuKgu0tVYL+qX1v5nxpHiy6a5qQnbT+qLUtsmLsThlPICe5hxDJlm8YoghFaYqzyB9L9LkdR9lh2DaUWTPiEO4bih5NLkgmDuogvNmWMc2rfqHjTD9tYKrVgpEa0rgMbtyHHO9zh+32ucgqMqNk27+CGORx9teHMgRlPtJwKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106929; c=relaxed/simple;
	bh=sd3DB5QAo14h5zLM+vWzziyxgeu9gXug/Wqkl/V836M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pL4JShcuWLJ5nYsBAniroXPZQnhkUjwO5TWgcsKPm1yY8fZlmTxd8w/h1zyWBZrXm5vMiCwUu1byf8TRnZ4ESyQ04wSncHvx/2o2W6Bn34nGA8hlyewucFxJWJhsk/XVkftcJlRqkmX6L4eNoOHCwE7gd52baU42BdFAajg7cTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jubrd4tS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jubrd4tS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AHuVm000840
	for <linux-sound@vger.kernel.org>; Tue, 4 Mar 2025 16:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gg8kGpZ3MAusVn1q3n6ecqBdb3hu6mGJUnWrCE8von4=; b=jubrd4tSj4b+OvuB
	4ALyGT4PlRgXWsHH3zIyTkDb0nwIQ0FuYEK4sqXErixAInEsqm45ln4HbWYyVX7E
	rRaEEwQ2GIAFPnpVMWpgnx6rrRgIHXENQnH5C3/9Fc1nTcj3d/Gq5aFMj/5pdcG5
	wWc4ZU20DaePo/yBPC3lg/aIPSvEkJ+hZ6G/MKjb8MO+rZWm+e1yZv0p6PlXPkvL
	vMzDNBHsGi/dcKiejlRwZoGRWoBQbC18AUst82ZJN7DGL2qGLS5WjqnBGWZzOtZy
	/E2ifAqV+XpycXaCYaYURXmwP1HFVXvKz9IckqXtvg4fh2xp4PEAn+OoXi2OSBtf
	o9KOxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vjjfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 16:48:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c51d8c1cso33970685a.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 08:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106925; x=1741711725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg8kGpZ3MAusVn1q3n6ecqBdb3hu6mGJUnWrCE8von4=;
        b=q6wqw6eyZb1ywCyeAFZYieO6WfVp0gG5zCUzZJC9mFWXf65W6TjhQ2a1ac3tZJC275
         B52TFw2Xulg1kvyzXFLreMbLUj44g19fGI8BVvoeCCZMn53LTm4/ib31N1fh/CpcRY4k
         oBqnJWLFgd18PqV4pZwag6+mOaeo9MZx35IWP4dX9DWyuDvK/CqMIfoFqJxIefhJyDeU
         ofMprmAXfifA1CMdlIqklfPcvAMYQP2vYlBU+FaCVOe2ybcAyeGULDXUYpZdE4PXPZuY
         kGudUfniLfLRuus8+ls+/9Nogn656ed5BgY/R30n8IgAQRRYHTNx3O9IDwODv0E642P3
         N4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlSM5CmoeIOUhC19uH3iacoU7xZIe0QW8WRcBgOO9lSgJBumopXZKytA89QAgER05A5LmLbfCZ9+iG0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/catHh13Nv5rPU2HSI89pEz9kxL5MhR8JpAJMh2JK1tNFMV4
	LAZ0DqAOB54t5682mhls9hgHc8vauxE0RfIwTLrIbXnQ7YGMKE1xhV615LYolkvxpVXYavdMIYh
	bj75iVIimOj3NQRb9prVHFSnGPKl9M50xyn+5FvFKWV+WwDSO7zULKS0t7VhFrg==
X-Gm-Gg: ASbGncs3T0noC+VxOo9f7bDc/GQLplpjOjnBRQjVad+oVUCtHTORD6KuUTVKWEvJ/vE
	ox7reafsvWNojc4WaOeEB1UC2NW4Sh2jLlGUjkGJfz9msN7ktEzaJElOXYdip5Trl4Aj3bjDOIu
	2Ftb0CE4cpGgK0sCW4HObqBS7dbs6OdAgtkjwS7YULonC1u57cjeJelnKfQ3v9p0pHy+0O/DR13
	UZDoJEjkhp3XVHzgUd2MxuEREph0zBNIiDjOyfuPw19ttWPzPSQe4LjHSg5YaR+ZTbyklJxy7SM
	U/wwhjuLZlwwCIZfc05mxFlAEugyvQ9XgKZTI7Q3Kd11Q0S22wjncZ2Y0i6etoj0XRkVCg==
X-Received: by 2002:a05:620a:1a18:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c3cd61c237mr169167685a.7.1741106925402;
        Tue, 04 Mar 2025 08:48:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQvuQvClwiwFMie4FZTFPdTyWvzcou0+abmlXxIUtcYhhNTelNl/VTqgUaWtUDHiiQfW/r8g==
X-Received: by 2002:a05:620a:1a18:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c3cd61c237mr169165385a.7.1741106925089;
        Tue, 04 Mar 2025 08:48:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e152fdd4sm256004166b.176.2025.03.04.08.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:48:44 -0800 (PST)
Message-ID: <9cb0c042-759c-48bd-9776-0b2dbae928ea@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:48:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qcm2290: add apr and its services
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JOiib508AfqvskaDV-d6pjhR8kvochYQ
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c72eee cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4ckOxxuvsnspfostOZcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JOiib508AfqvskaDV-d6pjhR8kvochYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=499 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040135

On 2.03.2025 3:49 AM, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB2210 RB1 board.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
