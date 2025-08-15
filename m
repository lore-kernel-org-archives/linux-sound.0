Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8C28689A
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 05:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755235984; cv=none; b=DE5TXe+17+O7utY+q7cI4HVkCO/U3ksm//96WbeI7Hc9Mz6rYzbSXH4Q/BNaeLiHYk40vBWm7mfcB4p8WzoAxQ9yKCsOjDbzYioBj6uRYbR1jrw0V2rL7cq8cyKhqYzZsMyhXVAOa6OIPswad9thhjzz3v4P7Nv86T5oLqrIcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755235984; c=relaxed/simple;
	bh=URdpp/WxyhUfI/Ae6q8F7A21mqxWZYGH4gH7+ePLRoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHbU6BCBSHocI6MFbjMoClG4zy/Z6/bFlreK7I4KRS0FfE/KRJ1NurjxmM3BeNweEhdxOJ7CPw0WLSDoUfj4yHwfdwNyk4n0NeORubDW/xVaicMce6UOQhfMFdCORgduefJ1H6fQUYV2D6LBdNfBZyxu6iVoc8+WJdWEN9CM4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2uQ4AlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2uQ4AlC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F10j2i010132
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 05:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovqL3ACv+kUZfn7O+wK3v6Lc3iCZ+BawVyVb9IBebzo=; b=b2uQ4AlCYcKxl4lY
	zTEMrPcXuNqswTaxa89jZcOvtvEzi1+asa5ZPT1z8Y3TYlnWxnVqpMI8ozzqVbR3
	ayEY9QMAHQRZOcyzvXpMnTj9O3PGswsNZ64VN/ylRiZCmyLTFqCHvwe4qOW8yDsF
	KOOgCJPlED5sajWGkoupvW77S/mqEbEYvgyFRscuazYbRb0xU8xWPItKyrUm4GtD
	EoMItrk+OGhgFi1eE4TDQKU9SVQUtBVqbkJS1HWemvxoij5Y7acT7/G2UazGwXFv
	3MhfJaMO1pNX+sEyQsoQuoG6zzksNpXNkPbFNFZRtFY5mhVe6STW3jcD69zC1cDF
	1lT03A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjwwqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 05:33:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a928dc378so35513176d6.2
        for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 22:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235980; x=1755840780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovqL3ACv+kUZfn7O+wK3v6Lc3iCZ+BawVyVb9IBebzo=;
        b=A+QuSZ2DGWK+fjoOk+CaBkkXr2b+vK2wythhQxPaeIHkwAfOg7LOimvVdvAHS1T94H
         zFMeLuV4Ftvd7yDVkzaGLwZIV8+LK+Q9JBAktKxHJkxGFGDyJVrF2fan2TaA/tOHcsxZ
         pqca7DpXaEERI13L+xjaTEKV2gPNpQCvg6bbQNCdbqUcW+O5t6KRJ8BfaAovupzGqoFR
         IHY+arQyCmtNQQGXKZpkI0qvBRBtvx2udulHJ1SDNyzvmXsN74yg51drG3zMjOGwMxHg
         VP/JbwjFtMmmfOzAZkMcYexTWGhnKbwX3c8xNiwirrKZlo/JqPxdqNjyfgz2VXf28grg
         b7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgUM1uveQlU98CaGKO5MqOVYiU7iCkCdPjYTpFTKslJml+mNYjpWQlW8ueAtfulIlPDmWcvOUSMBJRxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzth/Zg6H9fEhtkAJxHGOrcDeO9Ev9GTCJkaNu4uj+K6wtJcEv3
	E0Gr5SocJgLeR5cXVrV679yD0YpioFxwsqwQbewtOGJJCNMcRe/vzxTfBu4lhdvI8UY5ECtCyPe
	yxpGVMSGttMsyoWreX44rQElM42aX5bokNmPEtIgCjIhfciq8Nx2YciJgKO51YarbZA==
X-Gm-Gg: ASbGncs2Ymc/EtekdDkkqw9hmnvidaqq/T6NgE5U7107HE+DfAkUBvaKuxzWHYmUJk2
	viAUX8XswAskBivJkyTHOmlssUu9Wd6UIqpTi+nMcBsTV6Ti4Q62zUva+zKs9Jp/in5YfopdE4a
	Inl1S9S6jPc94gJapLlXtyKTcQ+inUGdoD595W84sNdKg4DiKV/Po0eYqCLAhi/2mBNz/739DXI
	c/HLsMowkf2kqxx1MBIbqC+Avv0GfJV60ViOmi0W5y3srYXrR9reBcgsIkYpS25lhswPTc9hcYE
	bfSfkVsVEExjOr037/FxBBt8oXI9rx8bII1CA3oco/hq7X9SJghoIwvKBgJXs7aGqTo=
X-Received: by 2002:a05:6214:2465:b0:709:f4f6:7efc with SMTP id 6a1803df08f44-70ba7c0d99emr5540386d6.29.1755235980550;
        Thu, 14 Aug 2025 22:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxfir1wXxaU83tmZ/aq1nahL0CTNuUHTP9k/Q8uSYSN41izFNRaLdK4c1petYIvpY4X2AnhA==
X-Received: by 2002:a05:6214:2465:b0:709:f4f6:7efc with SMTP id 6a1803df08f44-70ba7c0d99emr5540206d6.29.1755235980122;
        Thu, 14 Aug 2025 22:33:00 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3bb652f90casm635115f8f.26.2025.08.14.22.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 22:32:59 -0700 (PDT)
Message-ID: <19494b00-a5b9-4490-bddb-48f48e73b0ac@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:32:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX+U2lvAm6GwTF
 ubjy1ZyjN5gDqHnjoJTNE9qq4ZxQKf5UKPKXkpAVwDWMCoseOF5SUiULYNCgJUnaBA1G4MK6MD4
 q1GN8zYihR/h1yyW/87fNIwsJRS6IBI8g7dn2u39o11uC1v16HO1sR3ZIZiEhOPGuBUcdMGpMXm
 1YBalzYZ8fCign8lDTBhLoSxiwUWH02Mm4S+ixnRE5I5YghEtWcU2Uera8ni+RL3WdIPEbJhs4Y
 ypKYjTVThhvAXCclpmY+YqS4PZpEyAiisN0aMKFQKXikTS1ZQ4BbxZYU43s+tXrA0+6IfYTaFvJ
 JIpZkmjKQ6KSx1BIOjMmGrn3zchsIdbgAWwzq3+bBS96zDoyEprixQj9xN/UT4pjHtUgxnhCFnV
 dnIK+rTc
X-Proofpoint-GUID: vgVQ5s5ZLk9QwusqIP42c5f7QS8Gqq19
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689ec68d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=me_V05VD0Eq9TF5rt4AA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: vgVQ5s5ZLk9QwusqIP42c5f7QS8Gqq19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Hi Vinod,
On 7/4/25 1:12 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> All these 3 codecs have been duplicating two of the soundwire
> functions. Noticed another new driver starting to do the same, its time
> to make some helpers so that we do not duplicate these functions.
> 
> I have added two helpers of_sdw_find_device_by_node() and
> sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.
> 
> Changes since v1:
> 	- updated sdw_slave_get_current_bank do error checks on read
> 
> Srinivas Kandagatla (4):
>   soundwire: bus: add of_sdw_find_device_by_node helper
>   soundwire: bus: add sdw_slave_get_current_bank helper


Do you have any comments these two soundwire patches in this series?

--srini

>   ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
>   ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
> 
>  drivers/soundwire/bus.c        | 12 ++++++++++++
>  drivers/soundwire/slave.c      |  6 ++++++
>  include/linux/soundwire/sdw.h  | 17 +++++++++++++++++
>  sound/soc/codecs/wcd937x-sdw.c |  6 ------
>  sound/soc/codecs/wcd937x.c     |  4 ++--
>  sound/soc/codecs/wcd937x.h     |  2 --
>  sound/soc/codecs/wcd938x-sdw.c | 17 -----------------
>  sound/soc/codecs/wcd938x.c     |  7 +++----
>  sound/soc/codecs/wcd938x.h     | 13 -------------
>  sound/soc/codecs/wcd939x-sdw.c | 13 -------------
>  sound/soc/codecs/wcd939x.c     |  6 +++---
>  sound/soc/codecs/wcd939x.h     | 13 -------------
>  12 files changed, 43 insertions(+), 73 deletions(-)
> 

