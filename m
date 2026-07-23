Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF381495538
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813527; cv=none; b=i7dRVBx70SmeF2B008bGG9t2fThRlq2iw+omXd+GJzDnVAD4UlYHo6SDarGqjdKFdy35GFa6hTy3lbEu2oSBPJp0kS8/yDTfSL443/vm0xQZG93LprP0A8JQxQIEhoF6ao/EdodyN3u/3WPZ3YmonWriA/f7eTVeiE+tQrAOocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813527; c=relaxed/simple;
	bh=8Ryi5rxkmLYm0Rpkhz905fjJXX7sMk2QZABkWrXs2Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzQp9cZD07f5VqQZvkF7Enq/wajjOjFeoAq24iQNE8QRWEYAglk9WfMLe72wxU0/Jp7yCtCN7Plhi6IHhMOsPdVFwfYW2NnxL/qv+w12/+6P4NCZ/oGIv73bfhMrbNh6vBO7JX9MpFwaz/jDgnVxlPvGNXvXgExTy+8EQS63Fnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdEJuSoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3AdbNtp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdEJuSoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3AdbNtp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvGSM3951224
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=; b=GdEJuSoXLgSjwEdq
	1M1+MluDFSaOWCzWCZMNipoITgmFV7CwnFljpM8fC07Wq7URywRTBW6BPsgeulEG
	5HabiRU/jUUURqGJOfL1ib5uQ12Nj7DzoAOdQOBQWWy+rc9JmPVx/PyujEtlt93y
	6f0p8WwtNNmjmJvXe2vKH7kt7pHmzeok8bMzZom81REYIpMl4dLpwaL6UAOOWQeu
	oIA7OTqIOKUBO661hzhegjU/bwrQkBlgmHdGPcItwcfjoSGVximP7sy9XJZP6MWn
	rQxTaAPLxQjUfHFSpKVgWRQbfs2hgaI1d9l1g08ugdTSiZkEaRkp9HpHg/OPwSXC
	1LMW2g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu8bvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:32:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso29948137.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813523; x=1785418323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=;
        b=I3AdbNtpTpfCrUVfEz4VLKz+NSVbtYrwbjQUGX4df1XRy3BmFop7wEYVv/H0GXpwg8
         /DbEo0mk0iDGUVHYCn8EejsTZ3XKy4/wgZp4V/cPk2roy+J9W9FMdNTwhFb0CY2AZk2l
         xNF8CmDffIih3efKMLfi3HT11pFqu8aYP//fXffJ3LOjZ0XfZmUKT9pFa0IuvnnGM9Qo
         /CjTE5p4x2UmtiLywlUhr/As/EFCbVbURIPQdpLtlTm7P9twFNv9amYjVvNnLqeqdyBi
         pzkdlyoQTQ/nZ+UzvOWaD6Vf+zHpJwaJctDmlfHpi+74s+3C6UKNdsQDRA/ag9kiwLMr
         mA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813523; x=1785418323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=;
        b=VGaHL2/AHbk/tal8Wg/Dp0iKVYdH9A7Cg6yPXUM6eu3vFbpC3T578+nnQo9fEiELV/
         llcQ1JzQK0s+vmt1sjgvF/UgnlW2lFdJopNpIaUgC6Wl5AZSzajAG3Wa6vYhseI77KS2
         /nfe38km1ZefUvgDN+HXOP7htwMtPM868Q37OYU53gDwZAz6rDT00MF1zRD1YBCOLDZM
         Dlm++vZmSqbVu4TANPeCvMcH5GDFlY8SoCFKG3cgYtfWOq/Raj1eWVTRc4JO/sFk0WGG
         URZioZjHF8nMFJRnEPT02qvTIjMjK32G++MDSZzxXKpX5X1yi6Px9E8Pzfj+c6GIGEXr
         28NA==
X-Forwarded-Encrypted: i=1; AHgh+RqSfuA1L3Kz2bxcr6qngMEs3sQD1YUdN2lzMCYgXdpWSuNMJiMHAyCWemj/xZRIxR5AZTg2weSk3AxOtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9+d0/XsQGxvPFtgXmFaM+EQuQuF7WR9XyAeGqz1c48QB4Ixa
	w4Ix80yYBXbmeJcxA0F/csNxcUNiq2jj++vev812pAGcFihEqdCilxvHU+PXnZ50tfHYXmanMUT
	w3gHTJH4kktYsdt5ra/0/j8CiHG82+SRbxwZcODFAZcW6+bP74AMmJYmvlKkSx/Kg1Q==
X-Gm-Gg: AR+sD13XN20iJPDKhO9CFJgEvDyFA65rbYSOeoV7mNGiW9vrNcLNkrD9a/flOiQUtJv
	F6zaJL8mvGQ9/GEtrWQeCrBABgDHMY0rMB2JFnxTQGZtdYCoT6vWuJ2E/fZD0qGrt5eyM7N/rD7
	5YUx/D5CC7a9LgCTSLuea8uWCRYi9jr2GEnwwmIotzf/VOkY7tlnYhZmzmLB2jkzkGOHNu14MC2
	bXmPx57DXR/pO4vxeFLrLLme2NTARoP7Ew7YzW8ddIilLfG10j4yHw+l7qEJIqOghuvVzXEnFMf
	kv2NBSgg79kckEhzytzz6AUH/g9DHAFD/n9PBs4xz8Z8HFJ5X18y5SpsTpU+0HKQRSAhBkQx18G
	CvnO00dBJu087XBVUumZHtsDb
X-Received: by 2002:a05:6102:f12:b0:631:4d32:a86 with SMTP id ada2fe7eead31-74e4cb505famr74929137.7.1784813523076;
        Thu, 23 Jul 2026 06:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:631:4d32:a86 with SMTP id ada2fe7eead31-74e4cb505famr74923137.7.1784813522708;
        Thu, 23 Jul 2026 06:32:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90788sm232087066b.40.2026.07.23.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:32:01 -0700 (PDT)
Message-ID: <0c8979c9-6d3e-4bc0-a324-e36d4f0a6a37@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:31:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
 <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wLGKZ9Yv71jiOC0Lg0fy1AFOp98tXUmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX0pvrLKDqO1zm
 gC58hpklbynSTdWvzQlqsO+8U+Z5JjqtoEObSUfFaU8ngQpqk5anTrvqgZbfhnuJBeS9QMl1zO/
 CgBmN+1ebxFvF7w5TTpI7JxAPXicm71JkK9jfv1cw8wf4jfMTV1oGxED58hbgXo4+GncJ5Q8jDq
 D0UjsbNXH/zat+iuLLYxy16gMbbM4nJMoh2wNxb1ZaMdY2RWHX9JcwrzNEAcdAzCXCG581I2qXB
 wUvhfS+N1W4HrIgxRfWO5G79vwE6NKF1VUgrkJDBoedToNTkU0axvjd+rB/Lde28uRN2liKXv/j
 uF1q8yKftX4Sq1yPsYnm5evG2wukQ60Jk5PY9bsfwZVz4FIUpQLANDg8jVr/edN+CsbXsifEdzD
 bT4ksm4PiwzWOoTMZeeXWxJmeeDFF02uKB+yW/smdXQU5cm9OMOdyFCafK2goCvq1TceVr8bOvq
 4zXQYTo70a4EsctlwKA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a6217d4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mSxn-Q1uSbZy4lC67FIA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX2IEt2ECKPTA9
 3dbOrX018jPJKJo3dVZDTJiNKrWHWkfhq4htZV0MudjfujPi/7ft3JsJPcfmenVjq9lpzdqkdph
 exxt4R1cnYwngEOH7H2pOH6pM1sdO0g=
X-Proofpoint-GUID: wLGKZ9Yv71jiOC0Lg0fy1AFOp98tXUmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230133

On 7/23/26 3:28 PM, Srinivas Kandagatla wrote:
> On 7/23/26 10:14 AM, Konrad Dybcio wrote:
>> On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>
>>> WCD9378 codec can be wired up in 2 different modes.
>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>> each of which has dedicated control and data lines.
>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>> single standard MIPI SDCA class device.
>>
>> Does this require a different hardware wiring, or is that just a
>> difference for the driver? If the latter, can we choose whichever
>> mode we want (i.e. use compute mode on the Fairphone or use mobile
>> mode on a laptop, depending on what the OS supports)?
> 
> AFAIU, Its not possible to change it because its fused and this also
> brings in some physical bus level changes to soundwire aswell.
> Ex: on compute we have one control lane for 2 soundwire masters driving
> 4 data lanes. on mobile every soundwire master has dedicated control and
> data lanes.. Bottom line is its not possible.

Ah, sad. Thanks for explaining

Konrad

> However w.r.t to driver given that is same IP, I wanted to explore if we
> can have a single driver for both.

