Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCC3DBD59
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844256; cv=none; b=fDsQg0RMqMwioQKUniCpvouW8oLZdskyQtnj3o71lTvro4a61cOAodpB9wGFtO/rDwrq2tI5n72CRfhAmzSMYWoEUdn/6j61AAWUiWuKrFWA7bPghDF+YvGxgx3Worpj03D9hiv6Jun6/J04Kh+UKsQBr8bcIskw1lIrXucq5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844256; c=relaxed/simple;
	bh=UDAqnS5xXFCFZgV7oNPEshoLuQVHUR3lwUkSrMCqxJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvMHGhLiY3pGjhEo59c+l9yU/k+V8CKSOxa5T1w7GI5fpoycvOGatT4rYTUA2N6gR2pkgaA+lUFAkdkZmwJJkfTKF+9VGbymAFZqv1NGZbi65SEB11Lc0iVErkw6YH4ZFPubkJENa8EZsWqjg5x2HBZma3lVJGjiCcpKw1Jq9fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SX9ADs20; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4P/RNNN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SX9ADs20";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4P/RNNN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBCRS320145
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 14:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gc2Ita2B+Gh65J0U5VirkdchO9wIvOnQgiffD5dzumY=; b=SX9ADs20XbPRYEFk
	oB2OLZnwBiEgxtQ/V3zRSYbOr1On2Fi1l775SW/jmf2d5tYzlhoaVcJvy4qLdkoB
	tD6Izg7GBG7WO51D05PBc5q34B9vVH9kqCmTH/11FxGzZU2b4mlZsCdHSGqIi5iw
	MAu2/OOof+u5AdmVYHXYJTd3EsooDfK58ebiw49yrrGzTvhWhXqF6w8RHA6DCj7F
	JnVA4rp17+6WS0yOkPcEQEkKjG7LR1G6NNMhuJY5WWeNIDQViv/KlgD7N6uuxihP
	aroGZC4jRjJ+VesCB4Aw2AlmSdQKJWRhqz1sU4AnkoDt85axHQSLBH/I7ppv6VDs
	Wtl+lw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrncr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 14:30:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fc74c6634aso81689129137.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844254; x=1774449054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gc2Ita2B+Gh65J0U5VirkdchO9wIvOnQgiffD5dzumY=;
        b=i4P/RNNN6cXeT4TngnANy9mfoF8q9CJVVF6JivztEZp4ByfrZDiy5aYs+cU536YtUu
         Y6rVomu8DNT9xN6w9TlWc8VjyI+9wxZrXRovElNe/Ric6R3kd4UpOkXjrpkUh6NHWi+x
         deTFtuyWtQD6HtVyUubkLsvPTDWq4I214fs90y80q4ChHbKS91ApbPSGR3rkvmoOBfSI
         6WrROAeJ9PY+h4WJ5xAPJsNCJZRX/i3FJC+b4JobiRFzkEBMM5RuGD/3mynEbO6qqGzh
         tSwN0XT/NO+MnF7+beqjSSJb1pLagoGveDVc47w5uO+Pd0oIh692FIzPcVUQj/Jyi2cN
         cilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844254; x=1774449054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gc2Ita2B+Gh65J0U5VirkdchO9wIvOnQgiffD5dzumY=;
        b=LIyHZ5S/0ruh0eewUz4yIXw/9ZqCsN9XquS77wkgnkYgFhw1qf90GcwycfaOxfUYmv
         p1wkM89d0RS8lf0t+61T3v3YQC+tGlpfcudhC5LD6NLNsvTKln3UVc6yTKCH9cBEwoxY
         33zYVozrwhw1eJxDXnHR3UGLhzacnLxeIfZ0gYCPBfuAHVgmD7VMj8nDd5/APRsn6wKH
         rspO4IzEQeuHSLRVOsm8TKsIxm8CtvzhWTyUV0/8gPnujp/5FEusXGrwkRdW9P/vtnyU
         dcEZCrfPVyjP9h5Q3u01UIp864tETm01+H5Sp5u1DeF37ZqdsAxUWTL8DOw3eOYyZp5B
         ROcw==
X-Forwarded-Encrypted: i=1; AJvYcCXixuv2Y8VSPMqEhouklnFlrCGtr5IkrVTiO04G9oWS6Eu4gjutWzm4q3KdIByqbOv0uI5xO7IAFwmxXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyRQ8fJm0z3+ZxRDcSdnf16uLBl4KYegb32BB4oSY1+f3iJwFP
	/o58mDqj8tWxT+YfRnjCy2GUqZAvzWN+lco4RL57iTIZFhfsCOLqfpzwkAZK/PjhkWXM1YQ2Sfm
	phhRj6xxw6N6OsPpbR3ZmN6FqFzjUo4hcjk8wgLvUmFSoMOZwe3DOvCQ0naxab19tVA==
X-Gm-Gg: ATEYQzxYS8kWzCBn0gNkc/f085mjubmv+xOd+5B6V+YSYamidj2RiYXl+TBJrGeY2+8
	Zap7uY8S7ssKKT0EEyoE/ie03yfdtNLZYCfb6iLnXPXr5L93lTfzDm0J06gW27bKAQIBcgH49z3
	KNmd27PzPr3WRwHHeqkraAdXn5PVjbTrxorPpfPYA4CUB78qtwGb5vI31Peuo9n9t5knN3JYZdJ
	65vzaQFmEe24TJ+9Y/UgY6TImjVkfQ0iJnv3ykhPuIewHWgN1s3Itnxt7TPJI/7bRZcKsiP6/q3
	oUJTMQcBqSe/5czotwTcIzoSKuuZiSc3/0EVE9Rq5fX2PM8Okcc5r5haZm115FHYHAY5rD4mdhQ
	xWg6V2N4+qcBJoG/6QJCOtgbwJS5k2axo+A0RLSEbdwEzathaDXayJ8YR8tZf8IEFhNYwoAPmaq
	U3yglPWMng
X-Received: by 2002:a05:6102:160d:b0:5ff:c510:b7cf with SMTP id ada2fe7eead31-6027d3a1720mr1860654137.29.1773844254060;
        Wed, 18 Mar 2026 07:30:54 -0700 (PDT)
X-Received: by 2002:a05:6102:160d:b0:5ff:c510:b7cf with SMTP id ada2fe7eead31-6027d3a1720mr1860580137.29.1773844253389;
        Wed, 18 Mar 2026 07:30:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:749e:2bbb:7ced:aac6? ([2a05:6e02:1041:c10:749e:2bbb:7ced:aac6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaffbbdsm144392725e9.15.2026.03.18.07.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:30:52 -0700 (PDT)
Message-ID: <805c7ea8-521f-4f62-b6b1-c5f02c6b84b0@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:30:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Fix the license marking
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Wesley Cheng <quic_wcheng@quicinc.com>,
        Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
        "open list:SOUND" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260317180943.3062085-1-daniel.lezcano@oss.qualcomm.com>
 <87fr5xcqrw.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <87fr5xcqrw.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2OmgXCOj0dXeUjeHf52Y6fqWPoP-jbNv
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bab71f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HnkgBX20PQqAqA2ex9cA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNCBTYWx0ZWRfXxQpDl2JQLPM4
 HfTgt6YDemn0XvH2vCmhJPmXkuUeScJyjDtDof3BPOC+W7vI1lT6/yLznjpUruLb9ZDNhJR0kgD
 jYAORxUigUqGGVvcw1H2nyr0I94hiAt41QcXHFpMJqvlzPqHo8PkUESutch9UEhCWFs/3b7JHUb
 EZmWd0lHpHZxDRutf0Ylw4HOPLykVXPj6ZhChgsbgoppaWcgNCnVbDPr35OPO5Kf3HNvL+3OixJ
 375UNMqMDxTmu6FM58MWleUgkUPgDUdzn6WkXAy+tWa6b2aSruYeKXDz0sD1jwcLIDG8CFX773V
 Kgi5S+xOzWWhAxdrtNMmFXxvF9vrg9Jl7a1S5D7Y3A6IAllyhY+sq2138JuyIB6GXZmuUnMkQwJ
 5NPxVQJRNu+T/7vdr97dyTNS8v0HrjweYlmoz0iAJL3DmzgwWyx0W6brGus9w8DC0ql4yIjyZCx
 8KS+Mp7AHKePtoAX5Jg==
X-Proofpoint-ORIG-GUID: 2OmgXCOj0dXeUjeHf52Y6fqWPoP-jbNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180124

On 3/18/26 12:37, Takashi Iwai wrote:
> On Tue, 17 Mar 2026 19:09:38 +0100,
> Daniel Lezcano wrote:
>>
>> The Copyright for Qualcomm changed its format and replaces the old
>> Qualcomm Innovative Center by Qualcomm Technology Inc.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Applied now.  Thanks.


Thanks Takashi

In case you missed it there is this trivial patch [1] to be acked-by or 
merged with Bjorn immutable branch [2]

[1] 
https://lore.kernel.org/all/20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com/

[2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/

