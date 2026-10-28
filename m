Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191903;
	b=v5Z3ZH9wGPM2wMY9TwJH+u9ljwhu4op9KQ9Bsj98RDdTADMGrQZ+QgF0ShtyTvxA+FLT
	 bbqtzTqz3dkHNqQxoVDQEVtu42j6r8W6WJ+tErrjMHXOgTsXzOebOlnPo3VSKe2OYraZ0
	 VzRpXWua//lXmGlKW+NkOLwU6VuQ4Cw4LY/uZ3NTno49Xu3Rb5DDHqxfI7DYHGHushtaw
	 NYLZ26yJFzyf8/4vTAk8P2/XjK3dbGlh1LnP9mVvdSk8TC8ax/Hd8Lt2txgg86qkSOENz
	 iiFXDKdvcAWwIXk1x4DcA/0YTPX140rzS2zdepO2oADpH8dQpREX1ki1pnQval6Z/xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
	b=TjILRzoa9/4Idfm2mJeXR5W7X2vOMf/MI0wXpECctwB2V06bgAn2B9WkuHI3RBKQ+MW0
	 7CDusX5oZLCxLSYhSYvw4kjmQgnaYrU/Evj9oMmRqRJzWPn5aZPjjDJ6ge0hTUq/FMcnv
	 YfhYuSFy0BWNVuKQCKuvtR7aPuArhZWxd8ueJVjvt6/wSzU9utDz9eVgn71+TCgyYz74d
	 VBMdiLALADBp9ORD/Xo5ZkyIlBOEpFif/30nnU3u+b+2HgSVQqjZhxf19x30hOCwM4nhD
	 k6d+raOK8yTijSK6AcUvz162SCZepmibSiw1iQnWtK5uIt8wbJDYuQE0d6igl1CHEGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="iJop/YcJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60C60A263E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E60C60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJop/YcJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBduC4137571
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=; b=EhO6gJ0b7Fu/03c7
	QiFvEyoo6+Db22HwYPHzd2kwr9wPbpDhZAKU/8MCPc1jj2bpbeuMXLLXY0AdN9mF
	BwGtOHDebmwUpLBkXi9BgS1bBkKuiDAdfJjQ6idY6o0/P1tbpLnsJsz7o+RzPt4M
	955j5OpYz/cyjUvh235ZXR6G3U2ycbjtt2V+zphuqp0F9HCdTx/uosTXDHiB4G9b
	iL4BpaXwInr24motMXM31/m9wIE8J4ahWPzjdYmN0h/2sQgwjyVt4qCIGHn6B2bD
	IvHvSsqH0tj76vvQ066MtkYsQARmhmngV0zmlLPXBxCn9PIi9juCC8pCkSezU/qQ
	FLTUew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92fh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:51:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a26fe9521so304034eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191901; x=1793796701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=iJop/YcJgNYAcvki8Sy4PngnQ6VcBdDoihddMzawOZ1J/zYXGnsVKC36ds4SKUmUiW
         jzxCziARLiyhlW6jxcPHvD+aS9JC2cOHQWDOHK2lHqOOKX64r3luwqwl0EgzUeLedeJ5
         wcsVRn4Vs5kACqj41Vp/AMJQ9EuspNDHnPNxdgVWN4j/ME5KEJj7qMJiVvX74BPpYFaG
         h+i2z91UcRCFEeiyUNhFtkkJQ2Y5ab61CbxTKILu8ZyKOa6dJ894TLp/dXkIba5ZqZhz
         PIG5A0BIsd55JVS5ntWL8VrS2eRhVa+qS32fVA/r6TbfjnA7LrreKLnMzxYJqOlF4EeO
         9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191901; x=1793796701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=inksbS/ApcYT9/tk0KZl8oIKZXLHm2RqATdySRcpdwJE7qVwV1zLJlQo3bsZdkGd5u
         c3AneINKYppC2nxX16adxkQ44hV8n6giEg7JE5TWTwmxTajGpxrjz59gmrW63AA5JhmG
         RyhoHhwlbWAfzcS9zUC1KEVzCuAuGwc3IfzXqoNaaHK7U7S6+zUCveZ4laQLhAqGLWOn
         W5ppgTZyMUdrU+8WPGvMbwCfux0CMBXtMg0UfgF/e7n+z6QvmhX2aGCLvx9u95bQgfLz
         +QorVRF6f5CwfndgThknuqdnTyHBp6fxrAi4aaSBoYh6maX0Z0FFA7ysLF09sqMh895c
         l9Qg==
X-Forwarded-Encrypted: i=1; AKwUvByxsneQybbIsTwsY2IhIT/p2WDiA0/UMDCWGCG4/S2hDgFDMs4xeW9Zk7+Xzk4FXNl6sFDwer2/J3V82Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIeUW+Hp/yI9TjTNZyBjbZYdOclZlVgHgEw6QwWwAQTRyGWp9uT
	E8GEwlxSlYk34P6Easdw5lROtxH6ZUlTsCkeH2hP9K9j3pqiJeNATQ5MT79Uk0CR3YAy3eSEzGG
	dCp/gJTks9R+6ZRQju3cVPBhn2pONIht2tILUDxcq5LUz5G53uVNkSMxbIv4hGIzhVQ==
X-Gm-Gg: AYBFou09xqKmkJMALEG7dg1n3VYk51GLXroWUyw6tmte/D2JdLQLhrA7J570Et2phCC
	nCte8JQf9z7hOw6AthMXKtPsz3YJdcOi5wEt7p+YTKHDjNje0lLHcwLHcFndzpLd4b24ggMEcfC
	Ed9YOz2bQTIoLwNC90ck+K+JLYdtjLvS2mliHoPziPYrKr7HTQcMnguD5b02CQeMWMYREIb/GHf
	IURB46z5FgXONv0QD19vZTYbHDaOvpWwIX97CrZ9S780pJVxxCYRvbkNAOq8kDULgqRh9qKKhR7
	NCiJWff0jDgCjxiYOe8I+qdTJjulLbKD9QyHh3CmW0zk7y2uhoLBHhuf5Eb9wqJXHQN1stRZRbm
	ILylPLjvXzWZ+TuBFz0wwshbR+/0WNXMya2zeESCzXVTvYhiNhIKMlI0LYe6GBhTKdXsOi2oqBl
	p4k5InRpAj
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179285eec.11.1793191900667;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179258eec.11.1793191900087;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ecfdsm7277318eec.17.2026.10.28.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:51:39 -0700 (PDT)
Message-ID: <57aef084-4328-4e4d-8ace-f0fc288e478d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:21:33 +0530
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
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1efdd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iuzv4ofnY9mMQXrTmB8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX0TEO5tZ9O8Ip
 fTPmeNMyIYgMgbAS+Je8loQmVJqTqHs+ccQEzb3dz+BjneoVENANgVp+engRyw627rCjYy+CRGM
 +BQj+4jZW2iS6fRJEmTYsNcLwkBtRKI=
X-Proofpoint-GUID: wCOzWURIfPh1y6_3iwi_E7eL5g0kt8u-
X-Proofpoint-ORIG-GUID: wCOzWURIfPh1y6_3iwi_E7eL5g0kt8u-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXzy2sBkoOHhAq
 NIwk16CrBAEDfiLyOvpZdoD/B/4XwQu1tDPV8za23llgxpUEE+SsbUgpG1JmQF3jnz1wKzWRKJZ
 bAZUbhO3+abCpnjNT/8JlQo+Glakm4TQgLReeNog6cK5mmIqX9g8cMR6LnDARSKuaEwsRqw3tnH
 yNmgqos35GjpO1fuJJZjjhnBYqJzTxtdKU/abao8VMcTXZKwJjY7/+jHSmwrTnPZ2WqP8IgZZh/
 DKHE8arxLS0IzGrJpHZUFp84INP0SdpGDe/nqSgQyQ8lmEGqJUXqtHZQobdYKdu1cpK3mYZhvE9
 VXh+bIBB+aCpCsPUYjeqC2aHwF8uTUhn4U14RNdHxj69TFjEuW1jZLCkziyxeX46NIvYs5+hXFA
 s4yvqgdUt1Aam8itCTgRNFgK981A4hH4L8uqfitPAWhht/Q7Hc/K5U3DZRaH15igIzEzYpjgGJB
 KLjHwEJCQKdkv88fqYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add Shikra sound-card compatible strings to the Qualcomm sound card
> binding so DT can describe board-specific audio topologies:
>
> - qcom,shikra-cqm-sndcard
> - qcom,shikra-cqs-sndcard
> - qcom,shikra-iqs-sndcard
>
> Shikra EVK variants use different codec/interface combinations and DSP
> processing paths. Describing these variants explicitly in DT allows the
> machine driver to select the correct DAPM routes, controls, and clocking
> behavior for each board.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

