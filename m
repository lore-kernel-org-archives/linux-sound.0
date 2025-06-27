Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3B1A2541
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041222; cv=none; b=qh64mt0CddenycXXxtbLhUZxfTvuXZMtAXWFAy7O/GfhB7mClvnhK+jgwpgt2K2eAJU9qzKEMWOyVmpg3/zfkwwvyaU7Sh5D+RLy/nGTNbL9gk7gArrQF7uL9Mj4fpEVQJ67yBZbFT2cdMS4RutXC6DUFDUT/onYA6otmup84zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041222; c=relaxed/simple;
	bh=XwqHogSSry3M2xOy9mpJfC7RmzJCOdzUYxSsyffvog4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WanktNVNnhEzIWJJu0MHPStzyDSk8ixob0A7njxcwh1fpxg8L/b4fetJrTWdw1gsu+JavP3yl0Yf2tu+qulFS//NLPewwjNaHrsgLCmNHDCbsayhqM9e+w/OAkzM+bH3ntrzQeHWHnknDdW9Dw1+4Xd9Kv6nUu214QxvqTRBb94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XE8jySfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XE8jySfi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBVp8h015157
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byTdy4NUp80D6fRVNH608h/H8vnHagA3F7wro8Roi8Q=; b=XE8jySfiUhYk0olX
	fBwjxLXhjQiipLrhvUz0NEjqA1e6LzZ7Tc+Rr6rK5kSXqXQe0H+WdZ+zNDWDSplp
	z8rHrl0YsUeH2TJHEcaN21qXwHFiNmC/iemUmcjUp8V+CNEm93aCr07a4fFrIcDX
	RG6xKoZnVBqcEaL7daXbu3QtYPi1LNUhRjDx+qUNcbrmrlEynagoOdYcaw0GDiP6
	PQocKc6hLDO+umCTRSDXEztYt2CltF6rRfdks7+uFXod+yBerOSMWYJXSOACkA6/
	gTOYAshjbzXE5+ma5enEgwk33rZFMvzgeUxHwrbcd3ApBq24w5mtrP2fW87G2TaN
	UAJtTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn17re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:20:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so393718885a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 09:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041218; x=1751646018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byTdy4NUp80D6fRVNH608h/H8vnHagA3F7wro8Roi8Q=;
        b=MMBBvBaCjhQgaD88ftZNdyKSh8Rnw2qPusByF8oVOj6j/YBsEnw+gMxdz6m2kyaRlN
         XjyOJK12XMOc8CPIKkD1abIzXKJW/RcgA+3psMU2kbxVu9Q61qrk/xPLcUVsmJ8AWKBH
         O712NgoL53Faaqbt+8wZ4ovsN6Whpdr/mcIs6krRU06GqweZwV/eJmc3t2cSPJrg+g4p
         bkoJ8hmF2KFq/HEYrQmAdxqWNK2Phq/vZB/4Ce7OpSKUtjBgLexZDyEQfFBddc4EUsMK
         xqeP8G7H3RePsvtkCGeBC5ycyk8CPmMGT2QK5yDir9G3SG6cW+8vQIIxdemsuzZfiism
         o+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX9JdZb6d2qwGHnjuNZaVgKE861XEtqrjA3170hBBROpYKuaaRsHzyNc/Mob95Er+IZWWqrhGALx8h8qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oRtUrC+w2w/55SYjEhwT2NJTAfR+qtaCx8oakxbhEhcQsKEZ
	pWui0JOeUalMdV3gKFuYFEek7/NXlXeP1zWFjnTiCFjM9vfgbManmXEDBOCTgJD0lVI0VZRpzq3
	I/BdEo19KG/jqxkANNilQjglrolqNDTekLpdU4AVGHprAqcP1xqBbcPTxmiGSnjg1ZA==
X-Gm-Gg: ASbGncvSYSgzj1OpEA4lPzEWbZBL8evsd6LA3+XP6ZwEbomRYX9+/xjSZiAMyNKTzPr
	aYs/cVucNZDjPimespCVXtt+E9N+qBSL6Giu3222e+yOMKRsOBRIIMFLXZuNsQbQxmPWMxvIIhz
	0zi+60e+woo/73VlH8pyw5BnKHMREOmreqdg3RDeBPFJjreqFpHhL/mncY4mMUOO6sJTW+2R7QI
	CrXFBwFsgol16mzKLYjoj9Jd9u42jp/9vYZIg4azTtXd9Hk5X8X1dey5wjADRj85ocfih98rCaO
	bwZGqvEWmaNYSi1N2SK8ESsNBt8OHqb0ZBfPlGVwYXLQyE9y
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr581809285a.35.1751041218006;
        Fri, 27 Jun 2025 09:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5YR9jQmlbqJf/b3wtB+gkoIUeP+Io5gvMv3Z8vaeITKKJSuhEBtWn6NwiGA8qRYC/80SaSw==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr581803785a.35.1751041217536;
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm3127195f8f.12.2025.06.27.09.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:20:17 -0700 (PDT)
Message-ID: <c783a7a0-5fb1-4dcc-99df-433352dd9ee5@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:20:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
        broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
 <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KN5EucQPXD38TCiMxsBcjZnDvXyJMdvU
X-Proofpoint-ORIG-GUID: KN5EucQPXD38TCiMxsBcjZnDvXyJMdvU
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685ec4c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yTlN0QwsL3H5k83FOakA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX1gDIEnp0o1WT
 7zslLRlAywo6W9gDW3+Dptr0uwNFIn0KetTevESjnty87T2FwX/jN2p6ETVKcXlBg4IESW7g6Vf
 sqL1rMZnP/9VctJ820NCRQo1DdIZ71PY/FWYVntzq7if+08YX0NjmTcGDjr0GAAArTtS6dEKX9m
 9Lw7Ox2+KnBqFscJW97ik+2CLZByixmGTAcOudTXCVKz1FbN6zbhCg79eN25PUi+kWN7GxbyHuv
 9Mjx+3m/XDelL9PUaDonsqDrqS6DMm68KhcsRejbiWir+E3P71CSxWlI0YtNI3q4+q6jFQJqOXM
 tqSAb7S5cT8c1jY4wBGq1/VFgPwdMWcV2POADX/03g74XxBIe8XmCSO6AtzWoCW4MrwvTe5pVEX
 Io0tcWGzXHSIagSCj0/54Zg2Yh3lX+qxfQYqGKVsTcS52aOEKlXzjoMZEdj02AAR9Ud+Pqoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=922 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270133

On 6/27/25 4:54 PM, Konrad Dybcio wrote:
> On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> There has been 2 instances of this helper in codec drivers,
>> it does not make sense to keep duplicating this part of code.
>>
>> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/bus.c       | 7 +++++++
>>  include/linux/soundwire/sdw.h | 8 ++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index 39aecd34c641..58306c515ccc 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
>>  }
>>  EXPORT_SYMBOL(sdw_slave_get_scale_index);
>>  
>> +int sdw_slave_get_current_bank(struct sdw_slave *sdev)
>> +{
>> +	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
>> +			 sdw_read(sdev, SDW_SCP_CTRL));
> 
> sdw_read can fail (miserably)
I agree, will add check in v2.


--srini
> 
> Konrad

