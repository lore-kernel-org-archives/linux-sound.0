Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500611CBA
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757571422; cv=none; b=oi0vvAgwcaAogFz0lc/fRQNtuq9tEAs7XSexils0mlE7ofT2LwKrVT53lOZkeoTk1gX/QeS7Hu3OU2jDLYcaB30tmF42bFCXvBd3Tu3vRz7FCBDDame5uWP7gMwq7y3Tj+PAKSfdGfeI1FlC7ekde9N1/YZrIVuLh2+GxdrbpwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757571422; c=relaxed/simple;
	bh=tp9gIEhkm3nPQ5lAX6WNJ7qKAMdj7t76MyO8kgCsjIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jsm6KlaAaDVLmOkmIvkH55H2LM1Z7zQaW8+Iv0+dqqX3sEVRG8mTVTw2aSuARifaPvidQHTunsxFuWhRRMtC/omTzbAkzCDHp1M120moJhOgDkQQyoDbEXITO4nuZhxN/LZ6iCnyrCQVSzrsmF/Tr1LROrDKVaokP7x1xG5CMFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbUarncB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbUarncB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IYmR032546
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUKV4tzeMZk7PUXMYsNdlnlxveYGyatPAuyxc4rrGtk=; b=cbUarncBVC5HY7uG
	b/p73x8K0vfbV3NpesiEFwEmVMGNc0LwifZ0Jfp/g5n3vq9N/qhlbKElqJtJtmWU
	oCQoRb6RhbZ3S1E4J+ITBx6uUSR/XWwmI/Xrj7fmKXFfCwP2oghmhxsj4JcZE2Tj
	3jwgc6q1gN8ob+QEWJeQmGxdFPBgGejCj/09cNYF0xSTaWPF5HXo2Lg4i674n3Z1
	l8EG7mNl1wtloNpoWbZg4u5mZmlUkIZ1eNZ7hAO3G1v9Ja2swHjEfla/tQjwoX6t
	YmTn7dKqTqDvgF+jX6l8cUK/5VukpUHmaPEkSNX3wcM127/Ao2sboTOPCJPWmC/f
	kNS9oA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb216j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:16:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-76487cdf979so2942156d6.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 23:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757571417; x=1758176217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUKV4tzeMZk7PUXMYsNdlnlxveYGyatPAuyxc4rrGtk=;
        b=LdVSlsrYUhtQVBUuu8XD4180PBLo/rDLwi81J95JodPljILRY+B0Ew2ad4YwYq0iyM
         98xAfj6RQhmSy7kVl8Hu/Nx0u/teQANimD6hchjk59LBg7/ZDVn9hZCLYjnVQvBF4lOJ
         WK8VZNkWcvAHxQnsFv+QxHoOAyvpi18GvulExvezuEte+JVc17r7dee88E7+ab2RihWC
         57RoGdO5O6mWMDp/wRmubDEuNta60P/JlDUSY2tX0WIUH1XXxvFZynkEVscy1+3kuPA5
         PvJR4Natm89T3bWYszb1/KTgFXTlaRP7tgHHcYsP6oNUtHdeEvN5ahX0V9QUiqpfQM6s
         4VYw==
X-Forwarded-Encrypted: i=1; AJvYcCWWiMrIayIiz72XjPRMbRt1v+P7TLRnf5C/MxdPii/CzVIekvMLtALkvV7W76Wi2YCxdf/Qn8mkhkJLug==@vger.kernel.org
X-Gm-Message-State: AOJu0YximNpSLKrJUyphOQ0EnV0/3XGS9/rGF92DvH97r6nZ1+R6RcN7
	S4EbWLZdAz8Cn4q59EUN0yV/p38bgMnkdIhyAVu0qEtFxVJvZmdPBui/LPnTKe/pkrLPUt8Y5bA
	eednqKkSfvRx59vHIK9VOzDF80eoo4c+WGaOda1SqaAiS6Vw1uBmQw5vruOTRBeVykQ==
X-Gm-Gg: ASbGncs1wrcagHaKxnBhRAij1q24vweNwdJIL038eVUuAGmlqoPC2V7D9+NAB9D12dh
	bY9hpdvIyK6Lm2jZk9pDOfVECRY9Et7I69fyhBKcDHjATNJTS/Zd6+wFdGWFkyeYVcWMMtdiNNx
	LxQZtHqGuhxWaTwKzA5199g7yThq3F88Zi/cXTW09sSTDgKMW9J1AUt9N5wlyAA0ZaxaHSFHdNT
	2thuLOF0kazUngbjJo0mPhCbB5kpFAuEv51ufHI2EeF0alwJNVoI6ohqgF+DiURUixolEjeEvnA
	hKSypU4hJRVWTUQ/ah/ul2JpZae+S9d6EzFj7pmgSpNp38F4SYGZnb7c4hTZfOEiGNw=
X-Received: by 2002:a05:6214:485:b0:712:8b65:d37a with SMTP id 6a1803df08f44-7393d42bbcbmr202002696d6.43.1757571417142;
        Wed, 10 Sep 2025 23:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHSNw8Su7OR12obsrdfm5Y2WPxrkPUqoNEP+Q/mONDJZD/GLYsP/1z0hTN+IDLz+fH4C089w==
X-Received: by 2002:a05:6214:485:b0:712:8b65:d37a with SMTP id 6a1803df08f44-7393d42bbcbmr202002486d6.43.1757571416658;
        Wed, 10 Sep 2025 23:16:56 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037b922csm10587475e9.15.2025.09.10.23.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 23:16:56 -0700 (PDT)
Message-ID: <b7a637d1-8868-40f3-8f82-8f5ab0684d52@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 07:16:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
 <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfX9TRTzEEXB6Cs
 fO0B/KLmz21E8HgP2QzbHCyMlZTQPOjnNpmXOWyIHK58haZvxnkBMFAZXvfHj2T3+y5KhcWiSY+
 O44vR57YRda18b0TEkQ4EbtOTZtORYdctkW1xwdsyjuOt8/B4BYRVBRdUAAk755ncWMDrPadYx2
 OqwTFOAsS3E0nQkuqU3PywRQzU+ffzYAsofv0noKqp/sAQ55CKg0eVhbbChBWZB3n6vKRHMdxn0
 TEmsSnGcFgj69QmhWSSFiKsLUctZs1xUWOl1etHtGB7bfnJstlq80jnHk4dd7IwfMVhiZ+cYcjn
 AJRoeZD0xqTYrSGmfK/PyspM4rpgOMIb/1pvyENUSbbUYJ9OP1NTdw1BC0PClOJszh+zvh9DtPU
 9+n2cPGg
X-Proofpoint-ORIG-GUID: LuZTV9PvdgtBG-hP9fs9IcMj4w-soYpB
X-Proofpoint-GUID: LuZTV9PvdgtBG-hP9fs9IcMj4w-soYpB
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c2695a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ctXafwwC4ABjd9pVO5wA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150

Thanks Alexey,

On 9/11/25 1:52 AM, Alexey Klimov wrote:
> On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
>> This patch series adds support for Qualcomm Soundwire Controller
>> version v3.1.0.
>> As part for adding this support, a new macro of_property_read_u8_index()
>> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
>> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
>> the register offsets, new entries are added to the variant data.
>>
>> Tested this patchset on X14s and Glymur reference platform.
> 
> Well, I don't have any Glymur devices and no idea what is
> x14s (I guess some laptop), but I picked the series locally to test
> on sm8550, it seems there are some generic changes, and
> qcom-soundwire probe failed:
> 
>  remoteproc remoteproc1: powering up adsp
>  remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
>  remoteproc remoteproc1: remote processor adsp is now up
>  qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FASTRPC
>  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 12
>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 13
>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
>  PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 14
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 15
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 16
>  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>  platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 17
>  va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
>  qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed with error -75
>  sched: DL replenish lagged too much
>  platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec dai not found
> 
> Are there any dependencies I am missing?

Can you pl try this change an see if it helps,

---------------------->cut<----------------------------------
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a7b6d9ecc3ba..622cc6c31264 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1426,6 +1426,26 @@ static int qcom_swrm_get_port_config(struct
qcom_swrm_ctrl *ctrl)
        ctrl->num_dout_ports =
FIELD_GET(SWRM_COMP_PARAMS_DOUT_PORTS_MASK, val);
        ctrl->num_din_ports = FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK,
val);

+       ret = of_property_read_u32(np, "qcom,din-ports", &val);
+       if (!ret) { /* only if present */
+               if (val != ctrl->num_din_ports) {
+                       dev_err(ctrl->dev, "din-ports (%d) miss match
with controller (%d)",
+                               val, ctrl->num_din_ports);
+               }
+
+               ctrl->num_din_ports = val;
+       }
+
+       ret = of_property_read_u32(np, "qcom,dout-ports", &val);
+       if (!ret) { /* only if present */
+               if (val != ctrl->num_dout_ports) {
+                       dev_err(ctrl->dev, "dout-ports (%d) miss match
with controller (%d)",
+                               val, ctrl->num_dout_ports);
+               }
+
+               ctrl->num_dout_ports = val;
+       }
+
        ctrl->nports = ctrl->num_dout_ports + ctrl->num_din_ports;

        ctrl->pconfig = devm_kcalloc(ctrl->dev, ctrl->nports + 1,


---------------------->cut<----------------------------------

--srini
> 
> When I reverted the series the audio started to work again.
> 
> Best regards,
> Alexey

