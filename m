Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AFE3C3F69
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183710; cv=none; b=HuzfL3HARHbKVmFeE20fxTYR5GeA1WUy1YWir3pTet5dhca4UD534HMjiDt6GT8+XTPXA9R/gNL7/KUwLQ9BOWsyJJzb2pUEvK5+FEWQatn226rhkb0TY8XUB3jwjV+PPMiSI19wwcSIUfzTZDsA1Bd9thuwOW8qtNmJ+4gUgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183710; c=relaxed/simple;
	bh=7/GIjI+OhCTsFchnZELFwMMPgRUq/Deydu6BTUDf7ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGNh625gAOq/iFEsZBMtl8/944KnMyDDHG8Ds+99Sc297T32qzvHNvLXTZ0FK4tX4esHQiy9hbO9JohKlzDhvCmx+b0uS0vLAkkIswBBQOzsjts2GCCQkQCrRYMzgK5vrvtuXtfS6ivujQxvVFvwMgC/rdKnsIC7TkC0/n0rVBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djq/ScPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWGbc3XS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djq/ScPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWGbc3XS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICBu2531401
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 20:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1k7UGAU0dhgCC3X+aLHm8h5/tGBNO+q8wVuLsivqm+k=; b=djq/ScPyR1Uva56m
	C5U4u1qATqVI9ZvdCIjfxGLknC95jivY2HZZRh9g1a2TVGU9qEghFYbNokfcqMIt
	VyFiezZOnr8tNQO0N/w9vEbzH79HsTe4cKQF7MvvBHHZKBeJUY8as/KdZjLI71ta
	lkU2hf0dCRlI2nwHPbHdFOjg21HfbV1LDLOQOeExP5PhgK61BscTQoV6mOwiVQof
	ZG2kAVs04sPu92aRQLqiArSMgfhdt3dkpRi1GTCCaPa1ZL4HiH7Unrb9vNdokMVV
	b6IschqcH3r8EiPfaXVv6PeyymyOkeyqfJhBg7xkbgdVkmPPCS96iz7hRXGJZ/Yl
	0xggkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrtsxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 20:21:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so43966655ad.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785183707; x=1785788507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k7UGAU0dhgCC3X+aLHm8h5/tGBNO+q8wVuLsivqm+k=;
        b=LWGbc3XSZyB/oqroIogGolnte6KsShrJ0Ke1jHngpHuRUACBP6jljZdJXF6ENXgnjE
         118XztVsHFxAQSuu0+/7q48fZlHFZg9sUNSdegMF5oBqMEydxN5itysgartwl8tmYDvc
         D/ZTSECs0LC6+1+9UY7de5ue0dBf6wDHYw3dl8BC4Iy7rzzGGu536CMoq6BbuvQ3HlqG
         O3wyE3yMRbSqxkkr5WIzhJ9Dyvd7q3tpMUrebsqt9I9WS7zYmWDxk3b+pktHXepRDZQ5
         gLItx6tbOAVJoP3gf5Jf1x3sGbZeC4ucVY8WCC53p27w8aqYTP1scilocVnid+R2P8cN
         B/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183707; x=1785788507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1k7UGAU0dhgCC3X+aLHm8h5/tGBNO+q8wVuLsivqm+k=;
        b=UszdfMCgcHi3Dp9pjyV0hk5EY2GiTHbuP6MJWUos9Awh5PYOvYuWyX2EQ99knCYN8C
         TpcshsGn6q9WQK+izdJHf9p0LmbcwjQsZt7tLZ6ruiJLInwRsgeJUEvAPD4g+4U2UoY4
         krWRwzdubXG5fqptCgE2a8YnCOAKFHihmIVZ81D4tCOBKqi5z/JlXneqKSQGororn2X1
         ZQnC7LQ9KQz/iv9Mr7GZW3nDbAsYROwIm/ozWFIiANs2xGXBynEyE7kVdKWFF2GQlty8
         4Vmau1cDwSv5nifRZFo3lT7IYyrPr/JUzVOWQ0j0kl4QSmtPcwk63yz7WDxo3nkBFvW4
         2s3w==
X-Forwarded-Encrypted: i=1; AHgh+RqrVVHC9cMOpfN8RD7hFsd4oJdK1l6+s1CFASCVunaUyDEEK3KsvDJKQfMv5Z109JtyMWfM7XMaOERIzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNEH2ZKmZEr8ertYVrjBgXa6oDdS6dqHSNLmRHaqiCDnWYlOUH
	j5edkw15HEQDbf11XFOfuAfJTRnfi7ah2Jg1WYlq6OMrDFHYuI/pGoOEr0pkwqJOuAb3ddX0mDZ
	+6/hDwvfeEqDRGunpKbRkVh+2AWvWLH1Xwm6LzKxQBT6F2qm5Tuj2Od+wMdpKq/LLxLioFpS39g
	==
X-Gm-Gg: AR+sD11ZoWnVvXICl9r9ikWY8FsLDf51DZ1aMy5RECVMl8EQmQ06WLAqXD2KCBn/C6R
	y+Cy4Z5pIDHx5al8E/ACRRqo6qI78S5QP2UUI0nbxQY9Vwev65/cUN16qVHigCp+GqBCK51vrx1
	Veh3H1abDj8cuRa2ImxaDuqm19Vtt/bNgTaod7ltFXg87xZHzJfXzwxRsJHC8FYJtjt1aN7yqwU
	AEVuw2eWhDhot2hHPDLNJUcCLy0eiomAv+8lXrUIo8qkDTvXZ9ZxN1yaYcsqQ/Q12DDgajui3o2
	VnRPLqgltR4Yyy9XTUq/rd+aixqlnsoBIGAHn/XGOQ0NkHL4N5Wrxtp8R48deeyKBNZ3+1U5RJc
	vVbCZ80cyNeeqv4wG8aFS/mQR9lvxHA==
X-Received: by 2002:a17:902:da86:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d00f3e3878mr7261065ad.22.1785183706762;
        Mon, 27 Jul 2026 13:21:46 -0700 (PDT)
X-Received: by 2002:a17:902:da86:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d00f3e3878mr7260855ad.22.1785183706354;
        Mon, 27 Jul 2026 13:21:46 -0700 (PDT)
Received: from [192.168.1.3] ([106.212.244.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e3e0asm40132515ad.29.2026.07.27.13.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:21:45 -0700 (PDT)
Message-ID: <d4d85975-6588-4f66-af99-518aee5e51d0@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 01:51:38 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>
 <20260727-hospitable-chestnut-caterpillar-3c27f5@quoll>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260727-hospitable-chestnut-caterpillar-3c27f5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MiBTYWx0ZWRfX6OFg6+MT6nrP
 zHv/JRmjQuxytZsdNEvAsztvgcUa7dhn5ADRI/O9yRpXb7a1kWA4+ykxfk4Aa7V5XYLDrXUammy
 dvBicdNlOys74M3wJoE8zQgsbUcF+aw=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67bddb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=yelsqLKVWbcqNe5dfEYUXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PAIWl8Xa6EgOu36E66UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: H-cyA6s4W3B6WbJQoE834Xlg1w7t9CeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MiBTYWx0ZWRfXyMh2DadOqeG5
 PllSwsBwVr0gtC496L0EEqEsKC+vwH7VRrkDRQsE4a50aU7MrN2i7fGB0IB/P3opNHy+gCd2xdd
 OaoikbsWzrsqdqgFCR0HUmMW+1R7Kgg3GO8H1zZZhOJwuuMQT8d69/UClFAfI1HmS2inmgvMNRE
 GpAmmogGltnWuYsRplEntV1WOVx4oVrHmbquKPf1Yfklc5IxiBKdObn3AC/DD418Z7bDNqF+ylZ
 sJ1ZAnAhw/QptylDlIsFTT51mzsutgARupqKtGm+t1gKhY8aRfIxk5nnr7tlixEAu5PfEdLRg7L
 cc7XwfV46PnKLMmq7y1ng/BUdAMaVJzvT2hA+SPkLnwAIAicCgnCNRke9oUp1RCUKzljEC/bz1g
 Zx7aOVZhG5WBhBn84YF1Tlt68oFojQcl3mxlP7Nmb0ynbjNmrRMtM8Oe/IZ3kaUNZHLHopSjhop
 RWXWH4mvojn4Sq6PNEg==
X-Proofpoint-ORIG-GUID: H-cyA6s4W3B6WbJQoE834Xlg1w7t9CeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270182



On 7/28/2026 1:39 AM, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 08:57:52PM +0530, Ajay Kumar Nandam wrote:
>>
>>
>> On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>> describe Digital Audio Interface (DAI) child nodes.
>>>
>>> Add #address-cells and #size-cells to allow representation of multiple
>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>> per-DAI properties such as the interface ID and associated clocks.
>>>
>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>> their clocks. For these designs, clock line enablement must be driven
>>> from the platform side, and this series provides the necessary support
>>> for that.
>>>
>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>> introduces the required device tree binding support to represent and
>>> vote for these clocks from the kernel.
>>>
>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ---
>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
>>>    1 file changed, 50 insertions(+)
>>>
>>
>> Thanks for the patch.
>>
>> Tested on Shikra-IQS. No issues observed.
>>
>> Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> 
> No, please drop. You could not test this patch on Shikra-IQS. It's
> impossible.
> 
> Otherwise please provide steps which execute this code on the target
> device.

Hi Krzysztof,

You are right. The Tested-by tag was added here by mistake. I validated 
the complete series on Shikra-IQS and later provided the Tested-by on 
the cover letter instead.

Please drop my Tested-by tag from this patch.

Thanks for the correction.

Best regards,
Ajay kumar Nandam

> 
> Best regards,
> Krzysztof
> 

