Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5E224AE7
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416947; cv=none; b=PpRfp5eiwSh9AYfK508dcJ8t0rFORbREEU3PdQc/l/70MPe39Ur/0CPPnIxtW41HQfK0Y7E0rU8DIMBagnjn/Eq4m++UPiSEUiFmaocKOVGELYdxZ8UxMOdjKmER8G2IkxO0/gi27U5hx7yIFky9gncbKeSkiUrEe639eMHmnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416947; c=relaxed/simple;
	bh=YoIne7vvuQzD/krGsNq203kmkbajQ888PwHlJ6Utetw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpOk7qnOfYNfx54biQ+4+vtDeV2iJCfM7b1YYKCnZ4kvwGuLdcQmGfX8MV5ypWgNgzT7X9+ypU0MQouxRGnXFmBZYmp8ZtvAHdJjXsivL8HYDtJt/PNJGMvemKVUHsTrlzTSQKbIEb/azzxTEdWRqfwXoBgMrpnAhG8PiLffjJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KA9M18l2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KA9M18l2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B58JUeq006044
	for <linux-sound@vger.kernel.org>; Thu, 5 Dec 2024 16:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	195rNMnFRFqaI+PV/NYZby6CtC//SxLeu1vnpcp/L1Y=; b=KA9M18l2X392TXKo
	KP/NHacav5XdCb0OeSbwbOpidYjhL5xIwd+DKVpgd17FoJC1D6GCWBo70Sh7Udqe
	fGq0X53A0dvG+VCjmSg0MIdPTwpWw4wV9EaNkS9BjDcrMGMsUQ6phSHom/gtoJJ8
	JRYN8j4IQh0zjP70RhnuyGND/y+W+0RuFXXu3XEQZAohjZ9HwbAJDM2bMtAjrjg7
	TnwJqQi5SRELrd9IOlKDwdeFRxuBioBEZjqIl1NmwvVefWykqWyaC3EhojloLQbz
	+qwK0kFPdvwmRmt3cVpai/V/OiW+mEMJ1z4qYn2/JzovCIWeB7rBfbB9+VI+u/Rg
	2tOj8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3er8b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Dec 2024 16:42:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4667cab5e1bso2817001cf.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Dec 2024 08:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416943; x=1734021743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=195rNMnFRFqaI+PV/NYZby6CtC//SxLeu1vnpcp/L1Y=;
        b=hCy6umar/scwXVuINA9wzGTILnrIPiDmma2zhD2QIB7/eKoOHRvtzUpV2EsySrSdTZ
         nMqPi0B48dMTdd+vAQKU/WLkGE01R1GE3QTjDfWBTdYC+ndcrRgOHeqI3GFDU/7dMPf7
         4T1qrUhzYmKWvtVbgpcHBVqdBDWZXuBt3CA2TMLS6VzZ+kDdY5iQ1dbMasLvZRFWNxoW
         FXfFUJy2Us/Im+6HpzU0z0MwdU7zLW3XjdGyt4lUL1ZUQprq2mr704L0QU5cBg0BGW7g
         zkNZEqkU0A91/94dLs8WWWvSicBmMuBUgwVIeHWcSLhM17h7csEOqCBMjKTL6xdwmJey
         L++g==
X-Forwarded-Encrypted: i=1; AJvYcCVx9ZuTgrwWSMOSCdTsEEMIp1HpMR6plkFZ0CIpT/1+FYNv53U2c5sXtvqcy9oE/KLhxX5aAFp4kxqZAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt93rvA+/BJo5YEL6ODd0FrCMcLfdpZpHTJM+sdrTsdpbm5PCo
	In1+qLfg0HCl1EIVdysQSCd1/ihTZg7FRN13DcJiT0Rwp44lCnZ6OMCxX8XIGpCguR6ouFwozuU
	Ki4UBu8mlrDps8A1E8MitbFIFAq+dSLy9Qw0FE5feyZ9wAPy5+RpgBlfFlvT3og==
X-Gm-Gg: ASbGncshzgTcu/e7npGaaGfMqNkDAP9IrN0vKVL/qA9X5Wv/ejUJDF7406/N0ZV37FB
	IW6oNuALF492DX+fypCKEnViy05Y7jOS9T34Xr3G53fDu0HFmM3Of8JeSBz4DPCdMpbzzkc2nQI
	1dbwM3w2h8EVsauIMZLowLKLtWCwOJ2bbuSwwRiS+hy3XWVVsu6HtDN9xAtvrtXjjmZFsI0N8mA
	/V2gMld8Ew0S5BrJkcYMCJ1mtrbRYOmDCW17j/iYDwhpI2nRy77b1Y9gJ1uiqBPQffwoGO3gIsp
	9jEuXLz2kaEBJyk5gKX0PdqOcncSIJ0=
X-Received: by 2002:ac8:5d05:0:b0:464:9463:7475 with SMTP id d75a77b69052e-4670c0e87femr78657251cf.2.1733416943321;
        Thu, 05 Dec 2024 08:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF6Wp3sPBMj5Y+ZW5+UIOvFWsYeIm7XMQDpvK+k/dFdEkf3tlHHHeo1Dqk42jNKdyMbri7qQ==
X-Received: by 2002:ac8:5d05:0:b0:464:9463:7475 with SMTP id d75a77b69052e-4670c0e87femr78657031cf.2.1733416943000;
        Thu, 05 Dec 2024 08:42:23 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601f4adsm117466466b.128.2024.12.05.08.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:42:22 -0800 (PST)
Message-ID: <cd121bce-77e1-4139-9317-3a43c7e24ca3@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] arm64: dts: qcom: sdm845-starqltechn: add gpio
 keys
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
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
 <20241205-starqltechn_integration_upstream-v7-8-84f9a3547803@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-8-84f9a3547803@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QDldmDrb4YJzENJQ7shwockiNL9_VSdx
X-Proofpoint-ORIG-GUID: QDldmDrb4YJzENJQ7shwockiNL9_VSdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=803
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050121

On 4.12.2024 10:34 PM, Dzmitry Sankouski wrote:
> Add support for phone buttons.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
