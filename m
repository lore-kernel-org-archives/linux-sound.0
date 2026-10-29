Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295144;
	b=ZH7FQPfgI2OSTukRuW9/ygzmHMeD14Fc4MdRH0dkWmmAwbB3I5mt0g6wKzudTnpu5yWj
	 mTY/Lp3YMMNN+q9cDLlVoUjzh8RjMNftwi6zDIsjaPogu1DUGTuZiNx3XEG4JOn663aeT
	 HuQMKKWdzTzCcIM9nAVXx7wOoXdCNl8xKTWmPjB9xv+kCjmxw5i0qvSLLauDsGPpjHc/W
	 +7El3V3+fR2omARSBYRvgfXDvwm3yF4YYb2uAg6G9aywWBEC1f8EpHwbFH9MYlLk7NIaq
	 VqITUnXYeW95HK3F3NrjZLkYMPzDSe2yuSH+7jG21ZDdcsCnIygulQFEUoYH/NaZCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
	b=HcfB0RREW5dBN660OOQvj8TOtVjCn9k+fyLqv5nEvX19UoOba5QFvda/mF8mcbtoCXnk
	 ItvCNd4wq49VdcErA8y7+2pDP3BBiW6/74kDr83alwZqhKi6TLw5hfy+NZTjgfAJBTL6W
	 oJU478YyqJ8h0SNLjNRhT348Mah10XQR5E4tJxWG1d8tzqtEtehnK7GCeHq8lmhtIDg8r
	 GqdYE7MaXtXCOEIq8gWE/D454QG4OzPnxY1YH1GCYsFULzp/De82srcX2gqlaex07ervm
	 PWcWMseEvmoux+5gmAmGJ+mujpDfTjweKLES0+plzQLmeD3VNpurq3fTjaswe02cFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QC2V6mey;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJtWcF+G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A3606A32C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QC2V6mey;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJtWcF+G
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD7kW1143524
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=; b=QC2V6meyZl4mc2Fi
	Xk7S9Eh6zFOo0p+Y6zQUF34RVIwoVCSM/pZo2ea4+Lq4zXk7LNPjERypZJ40f7HJ
	UvMVpv8EOBsn+KLbcOhJkMp0z6j3x/wHs187VCZrJZz/lFaRmEhCe0lhTj/25Pr7
	WhpX4rLkVCOehgUTamolzVNBlFhGTjYbFuGTjV2LtdpfR798pSGjsGoQGHAR9J2e
	zPtr+wvVF2J/SkfBdE7CwhZychQHTIdmoL+Tvhu8oexEpmrJNvAN3/xGKmL97D2k
	LwrDnAmqV+Qqj/GYLha9C0iZ0HKiVcEO7nmRRdQnGy2L13TQ4+TLkdM92IQFn97a
	qIXa5Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76chk3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso1375085eec.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793295142; x=1793899942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
        b=fJtWcF+GkOFY5Q+GhjJhwqYobyF3suDcOtmEMmqMWiRCMcsQf9iMV7NfDSVqUBGNKK
         TQBBtB6LaIK2CLjVOUZdAwdL2ERgvc2lV97YPxSlFAtmTHyN0taqH/OO3PITZfRx8S5/
         TJby/Is4tdwoSWL+yP0wu8uRMMgnzqFnjB6sz3BJcVI45Qn0eR9tBglw/hmBlgeIQLrl
         TTDf6X6o33hgDrWf2mYK1Qyrod/Ozv7VbK79Fc9CVlJbdYhu+v4eoVMQYb323ElKhGCf
         /GutNqEYp6bkvhI7vr6CEOP4Np8rY/J4Oi7sozh+dqmtkJtN3D1GN1frUP0dnH5ac1DU
         sYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295142; x=1793899942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
        b=2WT0kJt8WwwfqNFTdM+5NlnmiI2kPh3zjqq5Ph8CvYJaD8DnBqSxJPeBzGR1PiPkJi
         A2FliXm39twmGJAMpNx7vpyEQS55uRKXgqKwGgFgjxEHDpOMJK/Gyn12pxyvea3NTg6i
         hKub49fgsBXWYh4Txx/ErSoc4SbNNYsnZ3lJHO5ydjbPNnJ2KT752G9GnjeelAx8va02
         NI74D9ZrndgWwD89qP+h/8fVxbPrq/zmtfRsUVIIGA/hZxrcfOQGLvm5ptammqL0qRQD
         Y3WK7GyAaal9hIF00KW2pxUXoxOmJbgPd4PxZvNpoS+zgS2jwCN7QxWM0T06of8GnsS8
         EsLg==
X-Gm-Message-State: AFq9FYK6qRTRhHsaizguBT9ncLIp0TljOgiX0cd27f8ifVh7xDp2GTXI
	IyTP255n/yt3Rx4/9FerfU3BPGef9hMb+2aXuDaWdpFseKsiLWOc6A89SURStJjO0pxocPcZk+4
	UNMG802BDs0bGtfIOBzT7eb+RK8PKGKAEJKP4lnUtyVCyQ4/6w95myDEgHa6Ex9b3UQ==
X-Gm-Gg: AYBFou2/6cbR1RfqeLog7e/e/v8098/CX254GgPOSI5LSzUnw3b8ux3KVzfI707C+Bq
	lm7rWEOkqxaiPcbk8kgP9YRo4ro26nZizDsy2LdKGVMqRq3mg+yrWpGSCPIVLys5/CN/ihhHAjC
	1kuQfgQqd/YcFiik7IsyvXYlHU8eApQytEm1PjY/s1rGIZLbEeh7b8iVaYkjSnnAqr/sG76HJHS
	QkXZ9tQy3qgEejZmLlaUocBReT7CHJnp2rvttDyaYezmAsMlswpKpNK6I/ZzAswWVBJbfssDgyY
	n9tj7saj3ev2HfjTW2oGrgYtOovbeIIMfGjnHtwuuXBeEjDKURgQhD0hC2ZUFnhzJ4MXjSxr11A
	TC3UftjwoQgRikl1sP8QGiM7oU/jSEJT7fKUZQigMXFJX4I/Vk1YFMoxiiYNpSp76WGYczM/OV4
	confbYClBg
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr4479415c88.14.1793295141592;
        Thu, 29 Oct 2026 10:32:21 -0700 (PDT)
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr4479382c88.14.1793295140986;
        Thu, 29 Oct 2026 10:32:20 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm82433c88.9.2026.10.29.10.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:32:20 -0700 (PDT)
Message-ID: <e5a01a54-a619-4524-8829-cc19289c057a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 23:02:13 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: fix PM ref leak in
 swclk_gate_enable
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UhrBI6fwPhbK3cuV5aCvOJz9QDNHZ8Fb
X-Proofpoint-ORIG-GUID: UhrBI6fwPhbK3cuV5aCvOJz9QDNHZ8Fb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX1ClLIeVSaljL
 dOEJ2P7V2J/zmCWUe0QtxY8Lz8y1yBVRMh1zj5wTkhRVczG7BANQh6K3JKe+BIZgAdJaCANl1vC
 Qr5MA5yQc+ZCsVN3RI4F/Yvr2mIusek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX+tZ05AOQXR3l
 3splr64CvAMVlUfBG9xd2gvwBl49O9ZaFdmtXbIZVIPuhlPAeOIzX36AtO6I8uX/XAP3eVAQM5d
 9aM7mOWeBzSW3aU6ZfMNQxXjgjeJZS/TFmK/MloB6VuvG65Zj+7lQSVujIMW22JAmtDXOCdciup
 l8PdglmVI5a/JRu1XVMwPaMta8oImNAKGxssiqofGvowWQcTVJtkZOYaKGvAcGxyBytBmerH8os
 a9UK19vit4aCdzJsxJgAg8mhebX6PUzqV+dhUJMBlhdC8Qz1O5nTXsZhn5+ZT6Rcf5guGI71XbW
 pR4LrY540ByF+k2HUt5Pbz3ffJtp8HPPd0hjFfefd1+xW+6H3q03/gZEMrzKxh06JDAaUUXtdqM
 15Tj7329syM+TnMlrhh7OZsLaWNl/g==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae38326 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=87T0Mtg4cv8Si1ZwwcsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290068


On 10/28/2026 5:15 PM, Tang Bin wrote:
> swclk_gate_enable() calls pm_runtime_resume_and_get() (incrementing the PM
> usage counter and, via of_pm_clk_add_clks, enabling mclk) before
> rx_macro_mclk_enable(). On rx_macro_mclk_enable() failure it called
> clk_disable_unprepare(rx->mclk) and returned, leaking the PM usage counter
> and potentially unbalancing the clock that the PM clock domain also
> manages. The sibling tx-macro/va-macro drivers call
> pm_runtime_put_autosuspend() here; do the same.
>
> Fixes: e38cbb75248a ("ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

