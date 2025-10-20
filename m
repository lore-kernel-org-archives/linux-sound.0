Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676E1A239A
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970681; cv=none; b=ZfgA6B7F219u4iJz20BA3zi3VrxRbE+1oPcnLiAuAMSPhAbrwaAUZYVCEsPpqapOdFe6mxEds4jLdD7EPnM3xOohRyPMm2wBcyRIbDFRxUXiXFOcZ7rjqVHnpH+V26lWM8wadM7W0Ry15ZbMlguuBxg0cCG9hBKZMzRjOJM/ou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970681; c=relaxed/simple;
	bh=AWZ5JEQErQEgkIxsRTfnsV0dbvBu3BBNbNNvaGHfU1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ak4z/MApPyRytxhFg32w7UPD0UEHCiFWbjj+8HmCM54maz2k2Kq+XaXgnrQrmP10eYRuWO6dDnr9CgZLIjk71Prub0ARkIi0BiSQXB9/pDRY8wWgzG9rB2SxzoqECNkJNv1xO/qEJqATAXFZLWm0YfW6DTGwNA2vent+KUoVmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlqvTeos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlqvTeos"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCAJRo028205
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WDwzWmcq4AKDGdpNvyveTUSafU4v7snQckB7LNYwDV0=; b=SlqvTeosTjNrJ8Eb
	sO4+qHexPJuy7bWwTF+Ezj/j9GZBx+dQ1f6a0pBbXo/5d7D5JbgcePTZ3iMUJnc7
	44cOs4QlAuJx2EFC8s0D3pwXt/cgbZffLJ3h+yL40mn2OCUOoBcy7gcuqr1P+8Ck
	S8g9juUcJoUjaoanE6I+bUt8x4sbEtUoPjJe1NW/sQehaVJTATCjxWmpY2Tm7eXs
	PYCj7ZWIMRJGW1KmLCR64VSm+NYR8L7K91Po4vrao/Zu2BNyZLDKc6alu5yjnCup
	C2UqdSFVLLoAVp94yhTIS0TSw3D4aWeRrV5dsjWIV0sQjWlMQFIWl1WKu/JWvKlC
	D2D/PQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfd0hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:31:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-81a8065daf4so81897716d6.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970677; x=1761575477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDwzWmcq4AKDGdpNvyveTUSafU4v7snQckB7LNYwDV0=;
        b=LimayWEeRdiyR7Xdaz0SUTN+c3o0w/ughwQwkijKPBLK4r3M5hrvGJitP3E4jEldvz
         Ql0iABdCZlYy69KkkcUmq/iIeHynDm66XGzRu+SCuOUtR3Fip8+yqTWfoiJQMpnWceBf
         8HX/CtUxMQh4ziWkuW80ZLM6ePbTPV8/fd3LjDicazjQihABtezZHVDEu8SVKesAMg12
         W79BPW1kzdoQBeN9M9iXVzxz8CFw6TTVdsiPomwj1fDJdS/TMlagbZRUUrkJn0EA0jz+
         OBNPiEdOA4MmJYE4l7wfmKfxVMuuuCZE+ddC/IPqrw9X2zmG63QYo+ZipnZ63eGS96bs
         AfYw==
X-Forwarded-Encrypted: i=1; AJvYcCVDExmUugLZBKJyPSXloprYT5633kSpwdPA0c2v1V0XVvY42/gIQhz9rf4GrofKBpwZ7pv2h25AN8jRCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiGZiQcjXo2qMXvfSxrTFjsTd7MHV3eTYhvsbStGIT+KbMz9D4
	8h18XfCgao2+HvA3hWX0lznkXhIM7O9Mlk5xPygksE4El369S4nJEMYCipx9cKlVx9KrVr/HBt6
	y/a6Gt7lLxPC77B8oavsZLllhR5UT7SPDVK6SrVISKf07M7cdVcyqdfbrpXiRSDypsw==
X-Gm-Gg: ASbGncsZxWIPC8wk2Bilj5y6RPGT5p5/Zu1FMhgWKkmK73v4SCnsKD6CtQsFoxLuxN5
	SYQSrELcxQwc/pan240CcnNz/pXPwsw7JgnKJ55H3HAvFl5lY+VgKS03Y7eM1wgh8Kj3i5ELFlz
	cfGaT95+KG8wvuJD2hMZ4enr12jfuCXsVllLuilKMmgQgIv1RDhuWAChxKuWRTS3CPnRs5VKHqw
	yDUrkEPv/hlBpTBC188aLgNUaivVA3VcAQsl7iEJv0KY7UxIpYzKZA48CyGHfvcd2YdrNibbdBc
	B5e452VQq6s39wKWf9jeCVlDHUPXUQDqYJDK9wO39hw2Qojqz2rM/2cBSsTQjEPr2f/srCcWkmY
	xhULz+j3nQkApOThxarzkslvJAw==
X-Received: by 2002:a05:622a:110e:b0:4e8:a9a2:4d50 with SMTP id d75a77b69052e-4e8a9a25039mr160564871cf.41.1760970677215;
        Mon, 20 Oct 2025 07:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEos+8Az1kXkegLkZkoK78dfEsCGhaPacnWf31fm6ldL4T9xO4u7snVWYRJLwJrJQGi8f6MRg==
X-Received: by 2002:a05:622a:110e:b0:4e8:a9a2:4d50 with SMTP id d75a77b69052e-4e8a9a25039mr160564271cf.41.1760970676602;
        Mon, 20 Oct 2025 07:31:16 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-471553f8a3asm171487535e9.16.2025.10.20.07.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:31:16 -0700 (PDT)
Message-ID: <4f394672-c7dc-4fdc-b70a-27fa8e20dd74@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:31:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: sdw: fix memory leak for
 sdw_stream_runtime
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stable@vger.kernel.org
References: <20251020131208.22734-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251020131208.22734-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251020131208.22734-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1jIPf33bLRxIIpkI0414QZAhsmjLq9Sv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX2LpXSF37Tzqx
 W9eG29eTZiEEUEjdSwdTd7cH20GmoBPXNqcX8j5c1eYIcDlWR+BXbLnXnB7rB8cpoLuvj7UzcHC
 CcIG8PsFm8N12EjfpiCkruNiElHuN1lus2qO2xkdmcQckGpSfmeqf6pNdiG32G9kR0HGFWniAXt
 vSuqn+9iGmg6kPXS2JoOyJI6YDJpF9/IZ7wF8SWgRtj7gOckAnp6TVTz96sVTMdZYChZLt4GbLa
 b8NmuQTnf6MYH21lAdOlG9mUVx/MpeXJ9Tz0DoElGCNtezB/wsXl5z0HA8rJrcAbmU5tqkiqz8z
 ZxMH4mtKVI2sIqaOIo8firzjwG2rpfOdytyMid69wMIGehEjtx9eg6vgZT0sMThgLSAlNgzvZYA
 LvkpbRekM0MaMvnVMoiRYjtjd/MOpg==
X-Proofpoint-GUID: 1jIPf33bLRxIIpkI0414QZAhsmjLq9Sv
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f647b6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-57JWHKmnLzaxYqXpKAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027



On 10/20/25 2:12 PM, Srinivas Kandagatla wrote:
> {
> + switch (id) {
> + case WSA_CODEC_DMA_RX_0:
> + case WSA_CODEC_DMA_TX_0:
> + case WSA_CODEC_DMA_RX_1:
> + case WSA_CODEC_DMA_TX_1:
> + case WSA_CODEC_DMA_TX_2:
> + case RX_CODEC_DMA_RX_0:
> + case TX_CODEC_DMA_TX_0:
> + case RX_CODEC_DMA_RX_1:
> + case TX_CODEC_DMA_TX_1:
> + case RX_CODEC_DMA_RX_2:
> + case TX_CODEC_DMA_TX_2:
> + case RX_CODEC_DMA_RX_3:
> + case TX_CODEC_DMA_TX_3:
> + case RX_CODEC_DMA_RX_4:
> + case TX_CODEC_DMA_TX_4:
> + case RX_CODEC_DMA_RX_5:
> + case TX_CODEC_DMA_TX_5:
> + case RX_CODEC_DMA_RX_6:
> + case RX_CODEC_DMA_RX_7:

Looks like we need one more entry here for RB3.
      case SLIMBUS_0_RX...SLIMBUS_6_TX:

Hmm RB3 also has memory leaks for very long time, good that this list is
able to clean up some of that inconsistent handling of dai ids for
soundwire stream.

--srini

> + return true;
> + default:
> + break;
> + }
> +
> + return false;
> +}

