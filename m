Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048D2550AF
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591504; cv=none; b=NsDGqRPEwXcSfEm4nw7n5ZnhpsO3wadf9Zr3/p7HV/uVu9UFxZMvfFjKND5yNiN3WLFVmWLNS3Lipq2W4585Tl6ElZoQdpcN/MqudzH5dQ5G1pIxPVPY6wA4SS1oqaygXlHbjNmm4qbu8ahSnVsV3omaNL5CapYmkcJCrHTtFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591504; c=relaxed/simple;
	bh=AAYaNa4GQ8Ez3/aLfbHSgfhXobH7Rm4Rp7YXEtlVYUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhlRdZaaTceBFPWoUX+iF8Y7mrxI+XDgYMKOe4itn2U71OOioiRMle5Br93mu20pxixuCQSZGvPTCvJOoPIfH8+Q8ANprXLzQQmTMwQo/p2b3ujJAN8eOyciDVhIz52syL3bh9klwz2oJBDQj8OADsUZ1qb0hKRp2Oti7f9sg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfgBPhBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLHIKI7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfgBPhBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLHIKI7J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19MCb43361802
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 12:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7x/5lDJpG9MLNGER0uMlUs9xddlh9rKN8rkCt8nLcU=; b=HfgBPhBCXNALgN5S
	LYVVrg3Q0krv4BCSbaviNJodIg6xNfQHXUCrSbT1t9dIzem5uK9UDw2399Oche+g
	2tWUrI7cIZkP7D2x9bpY/6ar8wGTXiSkN0bDdDn/VYu4pFOoCj04ftoJsq0/HK8w
	CsUDy6Qpe1NE09nTxhjSn/SEW+noIAaJshmecVwipW3gAWj92awSGb+701hS8Y/s
	mNwF4G1H/tZ0sbPnb14Qf1CyrOxJ582ZHSsAegv7lDCFhOj2nD9iKCrMUzOHy1Ar
	CIsFBL9w8KfhOkol39ytotuF0Zbr+kCltbk3+OgEleQdd4w9p3NQle65+PgqbBL3
	ywnCmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b00g2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 12:18:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51396f3efso601861385a.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 04:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764591501; x=1765196301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7x/5lDJpG9MLNGER0uMlUs9xddlh9rKN8rkCt8nLcU=;
        b=fLHIKI7JgxfapgLTxNDbd+ajrJkbcrWi4Op2Rsu0fg+1QbMKIn3RK0h+qpBbPeAIsu
         t3EN3CT/W7bPhcbNj88PanxS/Hppm1xLcib8+pgtehW1ZeS1Q5NvH/5dk4h7efe7bhC2
         RTCHwX6Q2bQDc3eiaZrDHNNaD6diK28e2n0nmmYU1Wm/D5TFN/OTnvPsoA0nkZiVeJON
         i4FeEHUDduvlooj8gLkx5nWKUh13svDyr3ie5Ojy+GOobkpPRw4mJ4URxq47K8odEBP6
         ez16yOp2bIdevQmb+tdCb5hkGxhkWuSRSz1WfAD4zGyb8tH/Nb+ACRUNRWpqBrZMnJO9
         5clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591501; x=1765196301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7x/5lDJpG9MLNGER0uMlUs9xddlh9rKN8rkCt8nLcU=;
        b=Gy8cYl5dw7zoP53Ie7iAUi4vfPMT8HOf29qCHQgxMPYdRSitgbwiqcb8507Mmwvb3/
         3sVqDCxFi4D1jvCbWFp4wHx+9Vxk5X4TSmkJPfY2hLTAr5gPZHZLNK1lbkRppMMHf3FJ
         2AL90HTWd1womTp7S4QXHjjTiOPqNR7YFzJOdQj8QWrTyTLyoK3BctJw91oTvBugaAUZ
         BLjZIAupV8OSjj/aXdDwIK3wIS06IUvuZ8guNPVle62Kjsv4Lon0xq3RNwl/0D5QSRUc
         YMCS9706+LGa37NAcfKgB++d8eg9I8ZSb0NLV3hPmHaGJO3/WHwJOI1znFG7qNN2ASjo
         65qw==
X-Forwarded-Encrypted: i=1; AJvYcCWoaNFTMby5U5FvIHAwBbtAEeG52E+YanFcyslUVwsVk/LXnw3FHQkwhY4757o3ebd257cpThalVtPHKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzytoBYSrQqHH+i36gRQkuWvGfCcYN1ygewwox9yY85/MSev5X
	su/yY6TDwlKZcKO3jQhEv5qyfahIliKEaGzwJAQsASCC3GqwS82/sBTDkiIVb5fQvOuPgY3g+fC
	CDsaKEefkShqFAzzfa7UXCke3409882UTpX5cshLgftclYOUdTE2dWsWVQxfW2/6nww==
X-Gm-Gg: ASbGnctudRKmRAf8uLOzkI9O2blVeMmL/aziZ4My66LITMQ6Sc2FwFCpmKrHwvxIRwI
	+zA3IPxznwZQfappWGq4bZ+WgHpQ3HXl6pGWs9ru+2WB6QQvtIpi0En83IV0gaZDD4KCJDYCifY
	v40osKEyF81ZXRfKVw+hJHt9/+DQLjwsfCC1ch67OzB2FaFP188zuY4TV4Yxtd0xd1+GnqNIxKx
	SodRbWImCuvZqKrefRFmmOSvGFznPAp7EcJt268kcrzQB6q/GHnTa6inkjBFJ0MbRhHD0JbJgpe
	mCwro7HjVF9nLIu5iOe3a/g7puNkN5L/ro6yTqoRXBayIyG4I2LJJcmH6W7o1jKrTtXts6AbXEq
	eQJ0zfwdDThYdI98B1/Vlyp7r96LhvSUHv4g4
X-Received: by 2002:a05:620a:4629:b0:8b2:e533:66f7 with SMTP id af79cd13be357-8b4ebd567ccmr3486892185a.10.1764591500951;
        Mon, 01 Dec 2025 04:18:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR4G7h21uepjoqGj+HTnF9EXrnBkONdATlsyVgmaOwHgYnZY5PX5j8yfp1NqPWxk8IfOgLMQ==
X-Received: by 2002:a05:620a:4629:b0:8b2:e533:66f7 with SMTP id af79cd13be357-8b4ebd567ccmr3486877185a.10.1764591499741;
        Mon, 01 Dec 2025 04:18:19 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6133sm27682614f8f.16.2025.12.01.04.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:18:19 -0800 (PST)
Message-ID: <88b63ab9-85bc-4af1-a802-e2e2f332254f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:18:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: codecs: wcd93xx: fix OF node leaks on probe
 failure
To: Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251201093419.24474-1-johan@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251201093419.24474-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d878d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MVHWC56zHThdgQPXUUYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BWpK_Ii3HISz6-l_EmYNpMKUbqDBmePn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMCBTYWx0ZWRfXwkXbhzOdSuZ6
 WUuTT+ncSDBxWZXJb4n+1XV0MLGh+dsiqiySTdAB1SOL+2zEfFG4//thmmwxBjihfKqkZBRuKHh
 tAmap6JnLQksNjeI9I8rVJwX1/g/3rvv9BdXsAODI1O3viuxkXxEsf/5USJARVI6KyI3Xi9FeX+
 RfUr7ryaX90KHnxHNe1AeE7++JdEKUnwQ0UOmnfcueijtC5Bx+6SvDfY6s7oyNr2YQncggqz6Vx
 UjyAi5ryn/hDFxZM80VQmtBWDxpBFR+m9MCchrzmZ7tbCcYdqvccscQcas7Hr8bi9FFVVa+YZMF
 Xi7EJXxUBfOrHwK1Aje1KBNuXylI05WcBtZLvZFNupu4+UQUS7H31/cXrCdKNy9rhKvZ8SkAhbR
 rNI7mpOPIaM35+hOpSf79LnDrjhpZw==
X-Proofpoint-GUID: BWpK_Ii3HISz6-l_EmYNpMKUbqDBmePn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010100



On 12/1/25 9:34 AM, Johan Hovold wrote:
> The original wcd938x driver has a couple of OF node reference leaks
> which have been reproduced in the two later added drivers.
> 
> Johan
> 

Thanks for the patches,

Yes, of_parse_phandle() already gets a node refcount, another refcount
is redundant and will leak.

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini>
> Johan Hovold (3):
>   ASoC: codecs: wcd937x: fix OF node leaks on probe failure
>   ASoC: codecs: wcd938x: fix OF node leaks on probe failure
>   ASoC: codecs: wcd939x: fix OF node leaks on probe failure
> 
>  sound/soc/codecs/wcd937x.c | 4 ++--
>  sound/soc/codecs/wcd938x.c | 3 +--
>  sound/soc/codecs/wcd939x.c | 3 +--
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 


