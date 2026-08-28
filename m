Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EE43CEED
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920678; cv=none; b=c3a+ZxIZKSIWBarvZTw+1wVnb8TcxlGi2L9s2xwPoBCrDp2UL3A5Y3F0Fqe8mZqbh7jH/3+BA7Ge+j70KjNsTvv/3tu/f5KRyS2EYwxflIefthsvH7XDbJ49k+CbWmBT3svTceG/V/bRCJwK9hmDV6cSDY6CjH637eLjtwH26ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920678; c=relaxed/simple;
	bh=xNHLosBmH0XiPfdIaRXd6JhnDcpZkYxuucgrupLtItA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiMTeBYk+PqR2t4SD8oY1r/ZtNG/MghDjTLX56svgkB6d84c37q60SF2w+CEPt2Kzj7EO0UqUEKWWjXTvdOOuvwaxGaRKt/i6KMsI/xKZ2u+Pl/MOZ2NL0ush3EgxpghBwPeu/ay/hLKw3hyepqv63ySEjObivEa921qnfQXeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu4t0v3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzfgK0EP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu4t0v3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YzfgK0EP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7nD53306719
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 12:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=; b=pu4t0v3wCfoosE9g
	dXq2hXl7rqTokh70/S9oWaNHqcyT9htAUIagX+Jxg0eotImdPdpDr5czgi3m2yfP
	iTXVBZMG/2uW54FGGSdbgq3EShkLNbJIZfoLOuKPv6dUWRxiJDbSpRlJt5QiVkmj
	XHC4OtdSBLwylx+7UO389Q/gz4DKCzZcmdj87VuQ3B5YGgrT3D+INrloYYFT4OQl
	oGjrX3bfRFXH30g0q5wBNjuB6avveEfAUqfQyRQZO+eyJoQpvXFfGuaLXkOMJErc
	Y5wG8T9rzp3Afw9DUiu7YxnxxahEL6UIbFNHU5ZVQh0nVADplY/0FWfd9vFamk6w
	WNI+/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9kuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 12:37:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fb8f67601so12179171cf.3
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 05:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920663; x=1788525463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=;
        b=YzfgK0EPDvjc+HsJbNt/84XJgBuDddavgyoqUIKyBGKlQLBE58MP/b0tHPv4DxtmsH
         8SGLwslKtHNpHVVbUqV8E2RUu+iPeilWW0TeMBeOIuIxMwQNHXoNKP6MQ68i45Nryn4o
         7CARiQsPdnuTqNuf3ABIXOQzkp+YlGiANi4+Rr9BsjGdvDuDZo8B/paxC1Fw2pdBUNpV
         Q1H9/DRO3YHnQF41zPE1rOCgkQzK0FV6L/UB8mps/gw8HUB7N57wH5bqn64wjSDG0ksq
         iTxfARow75haAMuheDQw6dlSRd1+0XNCNoNTKLPKc8w+hJFOr7ahFNX1VP9VVHBuIXn/
         WrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920663; x=1788525463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=;
        b=YQVgX2cKfWDzRNhJR0xOSBvs7TbWivD9VHDtVHzwVcAM3yv0b8YswdCqFXbCPUCp28
         PjGXn9QyEkhp18O7eFh6PCIzrH4TJboWDTMiqz9tCMTphJGuYsBWLHWAPNyauA33aN9n
         1+NsKNDah4r3EXmsA22Sm/LqVq9FefEarbul2Nw0FpQDKP0j7do7HXrxnBVrnzB2UTpL
         kZeutOqR+PDkNu4moaRdL144+mheRS1QO6LlHEAdI11ubl7SAvdaEiAvsYrln2SPIPkm
         4kJDhlk4E6Hft2ZQutE6kuV3kyLjeJ6UGGN5X34eVcX72t1xU08DUS/Cgw6lna5LbPYL
         45zg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4HoPNHok3vCWhHxdnhGayD24BiFPy5xbraHj+KInMPl+yJhCXGPkaNZqA42kPb01q6x0QMsNl0QIkiA==@vger.kernel.org
X-Gm-Message-State: AFuF++m6dK8irn7KlpxaWX0mGNzBnwboB+OJKnSBxosl/1HJeDWPkY89
	1Ote7/sg0A219exWSf5PYrX6gQ30QNOSGxqBjHnzrw0NK7keQNf8Ud0Dx3rtPXNi/iurfxVEJcz
	dbxsJTxXHpBkZ8vWPHgPQkYI2dp4qsDUViBVSGja1qz4BorRf60YNi98/NcG1pGc0xg==
X-Gm-Gg: AR+sD11D5VPyMkNKyFmU4LZKJVr+TBerP1u2ASHBY+ylXDKosPH0c6cIWuT1D4UkuJu
	o5jJBQ+UTspXef/3kyKNE5IS7b5a/6XK6VZ9uSkOWdVn+ZvKQX7qkYKssyueOxRVyaK/amQEEVz
	oeNyoTXqfd55yLE4tatiSzi7YCAg0ITq6bvJx0rdIBPcIBY89XU6JZp+f5tlotqB9R9pw6bP6H+
	96Ee6fnghVM3IpW3HCIkkhnsEUSUuAWJcr50fZp87FQYlT4UUdNY65vLEuRs18yH84kv0le90aj
	04Q757EeBAK1K8ICoXrQPC2TJLCRWajI6CDg/p1iuT3UY+Q5ohFjwC628yaszHjWrLUFu4BvExa
	jshHGupc09DRnTazrzePKNEhPLR4=
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr81965901cf.34.1787920658470;
        Fri, 28 Aug 2026 05:37:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr81957671cf.34.1787920653235;
        Fri, 28 Aug 2026 05:37:33 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm66837655e9.12.2026.08.28.05.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:37:32 -0700 (PDT)
Message-ID: <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
 <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9EKw3x-yNDrdAJEtUm_6Wl9p1-9qdtDm
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a918118 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=bIOyMTNkgNfJq1KbeLIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 9EKw3x-yNDrdAJEtUm_6Wl9p1-9qdtDm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX1XMv4iY7LfdY
 6baHf2Dwubl5t/Lov6R4W72rIzVchZ9TQT9+jYBM2luBsXdB6ql9Fpr92jB6zFWmkQku8T8ZMY3
 xdzsFN1KpPnpV2QgPAs1szwB5UJGJW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXwQKAXfASgdk1
 VguKw+82JIoJ8qdsyPA2oZUM/VM34clhIlSGWt7DrWUkARRSZeMhwTNhLTRxaGUjaSlD6bPshv7
 KjHLUcwcmW8DG35YUVV4uYu8yXSSo3IoD89ZIDDTrS+eSKPNlxHNZbPdS/ZE1aVCXxzMnzKQsM7
 JPyF04DS0i6liENZWrfAyav1UiGpPNm4BRhBlDm36i0D9RPL445EzTxl9BY8o5BCy3X4kThEy9f
 3KfNWGZWsEqtEgXm3Cq2Z6MUUHLed2S9JOJg/MV/sQu/NclRn86dC68W8wwNVxAHlMKq9cYkWMj
 DGMD9Rf/U/m/CcC+NruN2oUs81XAfUvA95SoWboTbqAsSOS2RricNsljbdxNAK0PjioimDu9LNU
 vfUdClblsJq2Cnf7/soX5W/+dDzXgFB2eYeOPxyji+bFOn071dJVxoOZ7lVu5eNbeMFuwpIL8bX
 93R1b3WxhRa1zp6CnKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

On 8/28/26 9:58 AM, Harendra Gautam wrote:
>>>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>>>> +
>>>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>>>> card registration to fail.
>>>>>>
>>>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>>>> beyond the supported LPASS port range.
>>>>>>
>>>>>> Best Regards,
>>>>>> Rafi.
>>>>> Thanks for pointing this out. We can either add the range check for
>>>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>>>> platforms.
>>>>
>>>> You should add these ids to
>>>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>>>> conflicts with common code.
>>>>
>>>> --srini
>>> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
>>> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
>>> Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>>
>> These are IDs that will be reused across both dsp and non-dsp solution.
>> So it makes more sense to keep it in one single place to allow the
>> hardware description (DT) unchanged across different software solutions.
>>
>>
>>> would it be better to update the range check in common.c/common.h to
>>> accommodate both LPASS and QAIF DAI ID ranges instead?
>> No, that does not make sense because these numbering might conflicting
>> with other ports in future.
>>
>> --srini
> Srini, could you please confirm if adding QAIF DAIs to
> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other

BTW, the dai ids are already added by Prasad
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240


You should use them.

to your question about increase in size, yes, this is know issue, i have
some changes to send which will remove the need of this static array
which should fix the concerns.

But for now all the hardware dai ids for qualcomm SoCs should be in a
single place irrespective of dsp or non dsp solution.


--srini
> drivers eg below
> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
> -Harendra

