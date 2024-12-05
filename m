Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A522144F
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416925; cv=none; b=bIP9OkzEQl4dGLsawr/3fLBS7pEoPVjiOc6zl7XjREqB5TR2s4dEz3pWhPC+rpSf0otG91VxgyFMSuMLspY2YH6Rz0Z+RkostrVgsaJOkVQCRuYMPCenwFAYtiKW3Nx2yWiFJCLDZoxud2bnJ1arDfR0QGLhmevfK9ZYYXGSVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416925; c=relaxed/simple;
	bh=jFEMWbR0VhaeTPkf5GJbzyeCa7aECzmYDLLXPPu74Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFsHWcLnCayE+zXsSwyUauR9n92u9HmXiJ//64d5m4ZxVyKQZy4E6YBWCYXiLt372FXLKTY+MMVIkFN+3tXDatFj1Pdm138LCcs4MiQ2wYFXvy/ey7tSc2ilIh1LHjRzC/u4tQPBI45X+WsfK8/HXg9hAACg0aT6QP4Kp4N/prU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTv9MVdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTv9MVdt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57415n010556
	for <linux-sound@vger.kernel.org>; Thu, 5 Dec 2024 16:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go+snB4FH6pFEZCnjdkBfOyMv+1g0HKMFcvMCjUYGfo=; b=JTv9MVdttvaQVmrD
	JMX7FLwLipdKJvDwMWvd89CnYL6Ogjtal2GPGOBv4CkdCI3D+xQ8G4ZIQdEdJ4Fi
	nvNxabMb/GUlLej4Nt+cE9i4mJhx/n1BTBIPmYQjrTWRE89L85LA6XJpCYmuKkIH
	VafpGfilJsNoeDVbFobjfYC6V0MGrYc237emc81sRQgnEC43EU8g4q3w59adLRhX
	qKq6XpCvZnhIaTMErgSZy6WE+y/SgXABgb8Ghg0T8b1vlrv4MkkTCdOa/F3z38NK
	Dr8b46lZHoYnbfgzi40nlVfsCI8JSDyVULinfYad6+DH1MLuH3iBJqHPEWB7WOPU
	C5KxwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v800cxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Dec 2024 16:42:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4668f2d0e50so2538221cf.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Dec 2024 08:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416921; x=1734021721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Go+snB4FH6pFEZCnjdkBfOyMv+1g0HKMFcvMCjUYGfo=;
        b=LX0ESp+2ZK3n/5xZ/cEt6zsktkgyLTD+oVcV6mqPNlFn2tin6yqc24PlxJ+AETXYVo
         KAEj3lCZXv3v9HIccwV8wMzlg3YyKVcJUxSC6ZQvR4COoF9JtIASAWJBNi0qvzlgc1tl
         2mrmdRtu3WK6WSv1JKpl4p0pHSqlOuI5019aduPfyBE+vn7Vit0vWEwy5ZumffQ8m120
         uSrZtqOOF5P9rIpakRhAGxsWdm2139q+M2e7z/n0YvUQK3HH3F13ZxP3YrdKbpPhYvSS
         J7iZkh2jT557upy0VoIIKpOeOF3/q/CwFV8KgmI/pR132oi6BHLXZSMLshGU8rzdcSuo
         3LTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBuv1162M8JQBF4fLzzJF6lRQuyX7+GTBF+wPDhOFiBUrrJiTFuRy1pkS4eUJd8twMe0wIufAJRE5k+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdPcLyVuB4odNhwloOzHygWnlDfMRjanOtYTNQuSlt1jSFCNr
	WuYwLHryBe3nyEZwfLqzOoV2uara+yZCBJrdKKk6HtANz7OgWnOLYYKUZKqNoOl5gFFjVTkfF7C
	XojwkX78yzVdG2cZ5IxmNpq2pBRYwNgS+Xbl+ZqGPVqAHhjIV0IMF1Ms48yHEVw==
X-Gm-Gg: ASbGnctqTpMULa7uaiLN7SxfuRn19Old4d54RnxUE2SATsBazN0FP6MY2cPvJo2U0h/
	c0Gzwpmhk0q77GeS1vc+5FGjmaDf/IkvSaDWCCQM5zt0PNpcnvtGtqYS4NS7JMIMl13ZpwRYKQa
	ikgBPlGoYI/NNenMOfB2HKR+zGCj757k/7wMph3Mg9swOp4kyACdYd0q8K3iSVrO/QUSMy2wp+J
	Qc99yQOQpiRCwAbn4+/T4NhBxjc4q9H4lIdKC0ImYWiwfEMuhbcMLUAIKe1Y3clbxAKUxn4K0xK
	RGzv+LQd/E0hAKM+beWi9nLTo0RjJUg=
X-Received: by 2002:ac8:5a11:0:b0:460:fe2a:2311 with SMTP id d75a77b69052e-4670c372ba9mr71128631cf.7.1733416921287;
        Thu, 05 Dec 2024 08:42:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV7SRkAtz3D9vcQvS/ksz/bMCqXlEy7cy7fYGtzD2n6lH/UZBtIGm4GJI6vdwH4FYNiyJTMg==
X-Received: by 2002:ac8:5a11:0:b0:460:fe2a:2311 with SMTP id d75a77b69052e-4670c372ba9mr71128411cf.7.1733416920949;
        Thu, 05 Dec 2024 08:42:00 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa3besm984232a12.75.2024.12.05.08.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:42:00 -0800 (PST)
Message-ID: <0aee7d2e-37b3-4130-a090-a40773638871@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:41:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/14] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
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
 <20241205-starqltechn_integration_upstream-v7-5-84f9a3547803@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-5-84f9a3547803@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oH8wAwjpIrzmNmRnkC18HgTbZTyoNv1e
X-Proofpoint-GUID: oH8wAwjpIrzmNmRnkC18HgTbZTyoNv1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=600 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050121

On 4.12.2024 10:34 PM, Dzmitry Sankouski wrote:
> Usb regulator was wrongly pointed to vreg_l1a_0p875.
> However, on starqltechn it's powered from vreg_l5a_0p8.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
