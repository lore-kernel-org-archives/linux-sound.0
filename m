Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B52AE74
	for <linux-sound@vger.kernel.org>; Fri,  8 Aug 2025 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644541; cv=none; b=rRF7vZk0wUdRs9hCFwO7bfCb7jQ+PlUjGNVQZyWBchD8i4IiCTLs9wj8PWZJBqG/hjLhoJaxPLGAzZbdvrlT+c9c0V7PJPHcAuWFO61mKWCZY3oww4UrYtIYyzaGo68Sv1vuy8XALfiKvIc1pCG5LFtTToi5yrjc28XdRI54d4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644541; c=relaxed/simple;
	bh=bcB9tpsziJnAd8Z5RsgzutbjTzohLRjuG9QBGduuU9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dpyy+g2MFCGMixher11aG+vL4NBijqr8VL4xucPNmWNDsEtC3CCDymrLOQIjzGq/LdeysRVMqSPzklqgUuaZFNdHL7e3g0pUiKbgDrH3vGlXLwDXQDmoHZjlqccQHeEbG4AgbDr/owkGzrruuneeYd8ymHCLQOJJ5/iXAKOi9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrvHbZqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrvHbZqd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5786sPgi018061
	for <linux-sound@vger.kernel.org>; Fri, 8 Aug 2025 09:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMDS7aD4EfSvU8EK/J3yiOfJ4VZYy3Dm1qZFyL4wKEg=; b=DrvHbZqd928p+NQm
	Gpad0WKzkCjVMPa+12yXfJqLnHhPp3KFFac69VrvBnrstDVayPbP2nLE9F3Y5t3a
	+3dPBpXmqKEs/Mnf7Ib6I+oHQWhLqRYQLtLJyuTYbHGvZPEGIqUt9u2GnbSa6Wmf
	cbtX+pxH2Ktsuoeay22EYX6zN5vA5L1SU/cxHyN+Db2ofkIb597rp8plyLMe/qBM
	31W/z7fdpDymqmitqhydc/R2+8kN0zVyd3/bTvO2iVZXUPyJ1AztR24oQ1YWCN47
	K9U0D2GLJYOmBVteNIXjimjHWKc8ICrLGQImhwviR2oXfspvIQyVJg5kAb5jBpk0
	dJqPbw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586f2dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 Aug 2025 09:15:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b42218e4a59so1456267a12.0
        for <linux-sound@vger.kernel.org>; Fri, 08 Aug 2025 02:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644537; x=1755249337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMDS7aD4EfSvU8EK/J3yiOfJ4VZYy3Dm1qZFyL4wKEg=;
        b=qwVTnFGRIgvgO6zMbpg80Q3L+waR7KHxfM6hSgk/hHeWEY+Uq6dNHB0zjB51R5U9Er
         PUGaE1f2pXlWPv93f13mFcqP9HoDozXWdiI8ODQ8D1CBdHwZjM7hbAuqvoKUa88HxxgU
         JVIF3/H1LnL5hJ+JR7WrunatvR2ifQ40zZioaHqOSy61wqIWeiz57HiriKUfNmIdPndj
         oVK6SJQhPZ1i5XcQ9cqe/U0lJrg/QNwVFnjt9gHawR38Z2Xt/nvMeblwk2FE0ul4zSye
         RAuN1+G7q+HLuAara78Q/tswhQ4plXhIUOCCr19yxYsGd2Z+rlhu07n+Ty/GhpHvVWYG
         I8fQ==
X-Gm-Message-State: AOJu0Yw1vN0ix16/4XqA8iZE6vv4wR4rc2oNWLTjkcmyrERirTjE7RbI
	w7WPJY4y+R8XaDYn1YBJWWvbsAfD5AfYXCOYSX2lJQXZt2rvf+CKZEixduscd7KmTnaWOcRKWHn
	M404HFEIlgAvsvcT0129IcnZYhvCeLyIRAWCiOTLyueK7rls+FIwxlfOQuSamLEjXbg==
X-Gm-Gg: ASbGncsovYselIdb2lHutVGNLccZRxKGUW9WAO5EoIfAPoUWpBkESsyVLZZn28QkAkE
	MH1dqnulT338nJMSgGanz+Zl7UXH0KlxjCrE+BiAtxDlkop+qXEE+of0FsIjmTFo1uJBDPZM2K9
	EWaVC3shJH3hlLiYcFvjFHf5UCr7d89FYyJpW8iBupLxkS91+uJtT1y0HmK4ha9IVgkMw+H7z+y
	pvcyYQxHcvbc7wf8ID5EKkrbGF/B+C3VyMhoDCW2qHhoCq9H3zyWUsDkMeBZuGsQs6EQNArIFpk
	qvrrkMtP5BvI9DMQUfRFzC/U+RumUpBkVNAMNLVzSZBZikHFlkCeAfpiSbO5DOJhg61QUXcUQPJ
	Bgg==
X-Received: by 2002:a05:6a20:9147:b0:23d:ded5:12b9 with SMTP id adf61e73a8af0-240551a4ea0mr3443751637.32.1754644537198;
        Fri, 08 Aug 2025 02:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpKEjpx5US9jFpxWamPfNIopdhgz+RisNsrMCz6kl2jFUJBupKqUB+LZ0BiPnNSOjPs6qdzA==
X-Received: by 2002:a05:6a20:9147:b0:23d:ded5:12b9 with SMTP id adf61e73a8af0-240551a4ea0mr3443711637.32.1754644536740;
        Fri, 08 Aug 2025 02:15:36 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c3f85c720sm2630514b3a.27.2025.08.08.02.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:15:36 -0700 (PDT)
Message-ID: <c2ff39b3-b7dc-4fc5-83e9-381b8f55fd60@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 14:45:31 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add lemans-evk and
 monaco-evk sound card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250808052939.1130505-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <14019ad9-0dd3-49f5-948e-5d0330b764c2@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <14019ad9-0dd3-49f5-948e-5d0330b764c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OyEXpuTOGSw8_9UBkKzh-IHRoeEpww6v
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6895c03a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=63-x6vtTAcyCGrGXyLsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: OyEXpuTOGSw8_9UBkKzh-IHRoeEpww6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX9O8lGhNpGovP
 B112dXblEqSGf8lFgBwrPYwC8lCKZiz/MD1sfMyzpJ8jnTKzZNkesxmNfxjjkOqTjdecAFYMa5z
 cOsi7grsgngmP+/O3nxLU6z7zXTrMyNVKPa11E8EuCmls6ZFfwFSL3K129rWvx05V8DU8DmF5R1
 I2TdrHapCoinwCNcW3VXN3UBi+0ozehD1El/xX3BElyrNdhBmPXQt3D8VtNHA5pFwnC278gVtXt
 73UbbJtVWCrq+JnzMHgvc2lariDBok75WD3mZ6YFM6AXB0yxot2K9Em9umB/TZGv8nSINvGiaTf
 L0zE3Ah3Iryf4uJUBWDjhX8UzOfSfhDU3MIDN2LUS5fUrzYPR9xiRKJ9QxuTtzqe+8lBqMEXGF4
 mQODe9D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064



On 8/8/2025 11:44 AM, Krzysztof Kozlowski wrote:
> On 08/08/2025 07:29, Mohammad Rafi Shaik wrote:
>> Document the bindings for the Qualcomm LEMANS-EVK and MONACO-EVK
>> board specific sound card.
>>
>> The bindings are the same as for other newer Qualcomm ADSP sound cards,
>> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
>> is separate.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 5d3dbb6cb1ae..c63bfe031b57 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -31,6 +31,8 @@ properties:
>>             - fairphone,fp4-sndcard
>>             - fairphone,fp5-sndcard
>>             - qcom,apq8096-sndcard
>> +          - qcom,lemans-evk-sndcard
> 
> 
> Lemans is already there under one of the QCS cards. I was told it is the
> same, so you do not get a new compatible.
> 
> Monaco maybe as well.
> 
> We also name standard cards per SoC, not per board, so evk should be
> dropped or commit msg should explain why this is different.
> 

Ack,

will remove the EVK and keep the soc compatible.

For Lemans will re-use the qcs9100-sndcard compatible and

for monaco will add the new soc compatible (qcs8300-sndcard) in the same 
series with updated cover-letter and drop the Lemans related change.

Thanks & regards,
Rafi.

> 
> Best regards,
> Krzysztof

