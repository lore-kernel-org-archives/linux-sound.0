Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041007;
	b=gvKM6u7Y2nao8epKBtCrOeiPxxMbc2R9LBjg1zRsq5XoJH6c4/vyHvbfqIMxruYt9cvk
	 cFmREnupZT5z8upihTjhC4v7mS8CuX6Or9o2Rog2DBW10BqZV3k/PKo/m2/VMnENmFz+2
	 WhpDoF8wVgb6Wsx6N0AXfbgR6zEQoKqJO+dy5ljOici9NJOfON+2UJx7hFQ6gZ2jJ0UdN
	 9A9Pp9wRjS997deyfTcnrb+J06wLXGVj4Y4BIFm5o20Z8+2ksgVvphi+XTTjcUDJ8M159
	 X3qjRVQq28OePrHH/d3KvmI3tEWWzYXsCPhGik2Ib/T7YYVZunL3rwZMdUvFMqpeBLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
	b=GEq9y+5GlEmIMJJ24VM+Ei6enFdEyTXZ8Avj+ifEK7zmNWN7178yzt/49Bns1pLyS3cy
	 ad9GOZ5tlAIsnLjrBy9oqoEm6/fgG9z5rDQbC1EjHGh4jHDIyPXj9y3JdAAGm6/a4+Vfa
	 fl7WWYCsVLu8504BaLoHvfWnRzaqtrwOqgdAUU1nRa7tjcbYI4uRyDBgH0f5g2sfNZUUp
	 9PFLjZ8tT3RAIILExL2DtgcO2n9ENZIYQbVu2/UfHa8qxnhqW6O52TaVfAQl/3CoRvC3I
	 6S7DJnWlolpLhX6L5DeHfwTIlsP/WvVtrvSfxE+4/6FA0LP2BWoTsbdf4YeXtZaoNnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfyK9ayF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etK5QvD2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EFE606A332
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2EFE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfyK9ayF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etK5QvD2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILD6IQ3942748
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 22:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=; b=MfyK9ayFDB4tVk9F
	9aV70tTVs37YAqlLn/b9MWH2GPEFsbk4uPIlcM85RxFQbMSiUvlZsYwLdQNOOJ+C
	ZAhUie0BZqi8vFwgX6Aw/fsMNGCTI1DC5ZVN6j/mjIRX7fymvHXpwgqjfMwHkZOf
	r1OovTlzgZ/lnULD9RV3JFEAePu+RLOHUfYg4EJ8KpL81nLoI5aMDRj1vkMYjckH
	XENBMAATbeST5eu+UkvxoGTh8ow8zjYJDp6POjaFLMfzxNQNK+BeQXXbw6XjG9mp
	1H9d6+O8KyRZwvirndwIZJSrghHR6aKsRaeFFyD+XZ9QDd9Xr0Zrhdmldaq77ZCD
	LgtOLQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnsq4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 22:30:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1728055eec.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 14:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795041005; x=1795645805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
        b=etK5QvD2ikQUkhNM9NX8Z3CtQ1MDWiTNqoo7Ht9+F5s2IW+SPIOWWabXXOilmhtD1l
         62SI1oWUldMWLVg3k9CFybeeRrjeoLa71rJX7Zp7LKvVwquSRzz7b0Whjw7bBs/lLZTi
         decTLdBzzQmxvwtFhgyOugVjmvol1LkWKNM4tXQTEIFvXnJZPQGl0Pa2gjidRKMSP69K
         2c+BHdNWmQyk6s/Wtik4rtV5E4cG/hnyZHcqxhWqNhlkWs4OrpBEZyk3RofUB5n9RpoQ
         Knuqbut0f0ISR2vQku4Fz1DOzII8vnkaBmzqsIjL2buaUhZK2pPxIAxLf4vdT06y8+sc
         2ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041005; x=1795645805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
        b=lHx+1311FM3RLAN4jBMzPx3N9tAH/sfzR9ywETWe1DTbkpowv5tn/0mdGDxNPh4nWL
         8WDhWGqjgwfQbZIJD6m+Q0ZZrYfGwRunACq9eEg7ImsxpY4IOd3ZD7Ak3Cf2qVVsoTVe
         kZyZx+NxnkqlTNJcyyJYPJvgV4QkLBBT2nRTGKqkoh0U0XEdopvgF9VKXeNwGYhRD7Eg
         FhJOHb4sL+UHrBQdRT+GAcF6baEpMzNk+/i3VLwWRW1Kcrt4Q1zUIf37NtMFSdby0UFC
         goalnJyZ+IkMHMGDVPmYU/0G21RnoEA76XyXWb25fQRoLMPGmXYt5lg/Q7C5+XjKcQZM
         J+QA==
X-Forwarded-Encrypted: i=1; AL+hErFnGgWlu6SmomRa0pDXIu6kCDUDGK5UI0+/i8q8QnbIN/8em1lxivO3F1qWJl8unCJntacGBDiSRdRmag==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FQRrsWzhXAjEVI42VDwOhXaxo0i85+ZvKmjTbcE3TC4bzXFaN
	sBDaXn31pVCCApAVWB9UOlf4Be67VgvHzpCbi9bYH1/QoX1xrHpRSkirLWBugU1aAfqWTeLWu6k
	JoORpGB0L4VLGhopTaCJVBLWqdkxuU4Cg2IRhHPD/Iy3zFqmSFh7JbAdfHXaP63ubgw==
X-Gm-Gg: AZFdTZcF89qRyF/v1F1P54oyjfK12DJn4XpoTBupBxE+YQbstQ/pshjkFxZ9NHsM195
	7b7xgsfw6Mh/thPvgzdj4PBfMvzq0d0X/AFj4Y1r7dU2fxiYBhSVTDk3AK/TVbmDqIIS7dYQEhp
	razyFRok2Q5rzxfuk8IIjUyckLpC5A2zZdsnaJRhvvkrKr7v1isKTtUz6LcDJ1hJtYhHpUPK/cY
	vCziL9lDGekiJFYzqwqMna6bsMi2jNWHp45TUdx72j3b9H0O0ueqTUfa0DA8vOTVRCog/cE2JZ0
	3z+phLPF3uFGQbvLJUr4VX0e9mzTl8GhDkSWJkAIKV5xZZhiMfDWA0W6QwxeBht7LtMDxIPQV5H
	E76/7xOO92y+aDyAPR72zAa7RHpm0NMNwJi2YrZ+kiOTq60F0VT8XNn5n3tc40+UMB+HIGTZ3OO
	eXHge2Sbt9mFfbeH3Va9Ol
X-Received: by 2002:a05:7300:824a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3827da13cdemr3842406eec.4.1795041005033;
        Wed, 18 Nov 2026 14:30:05 -0800 (PST)
X-Received: by 2002:a05:7300:824a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3827da13cdemr3842374eec.4.1795041004286;
        Wed, 18 Nov 2026 14:30:04 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm11315249eec.28.2026.11.18.14.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:30:03 -0800 (PST)
Message-ID: <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:30:03 -0800
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
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
 <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afe26ed cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=smeftMHU5e7__JqdOnoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: -ri9wvbLpVsj3m8VfC0BPdbATOk4ypmI
X-Proofpoint-ORIG-GUID: -ri9wvbLpVsj3m8VfC0BPdbATOk4ypmI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfXyy7j7grzpRDn
 +jeJbCSBe0FhJpFrdSGfUzRFSaFxsslSVA7F7qKMvh61BV6EeUXYwGhjD9ctwowPOmOcs2CAeKv
 ZPLFWriepO+q/mCt+4+DLhqGX/Fb+BA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfX6I3nro6xwEIe
 oS9ThjNA3LYnfvghy9gZO4JPAIVJeDVZ8MRlpawmqFwagt9eyzsnC5hcVA7QryZ8iT9+UZL0le1
 Iuvxf94BcThXhOJOOY20bpT3ZjHlsUFa4qdZaUj2MNsHsNXIEAD39aWK94QUxZJuD/wmMeYVob8
 RGp0dWtSWmzBmiFeZI7CTKGOS09e29EXzbLOYp0ojjITteNLorS+4Ikg5iMX1mkAMmV5O7GpCds
 eMqtsDrcogIlF4/0oYYn/T2pKb795Ml3AtoYzNovS5fkF9LKBsX7R5tG+W02N+3+m6sWQu1noaL
 QrKZHQzWCm9z3sUUMa6vlBWvgn1hEh02RPP35qfm51rMrhHmSfVxtpiHaNbk8oEm9jSaYTYIuM2
 lrdVodZNxmtM+Iknj+2xdN4aGANaVbg4Mj3wG8RogZrqEHCIon6YJibaF6tn/eGJ+1MQkIuFbRa
 Jcw5wgW80AMDhdMfwUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180082



On 11/17/2026 1:59 AM, Mathias Nyman wrote:
> Hi
> 
>>>
>>
>> Hi Mathias,
>>
>> Was wondering if this design looked a bit more acceptable?  Was able to 
>> figure out a way to achieve what you had suggested earlier mitigating the 
>> dma free problem I mentioned in my previous email.  If there are any 
>> issues w/ this please let me know.
>>
>> Thanks
>> Wesley Cheng
> 
> Big picture looks good
> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 2/4].
> 
> It reveals and reminds me of how poorly designed existing xhci_free_dev() is.
> 
> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
> inside the lock, preventing it from being dereferenced based on slot_id
> somewhere else, and then free it without the lock.
> 
> I ended up with a huge mess that rewrites vdev free/allocation,
> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
> 
> Seems like best solution for now is to add "no_pool_rings[]" to support the
> larger page size, and then later rework the vdev allocation/free and
> slot enabling/disabling. I'll take a look at the details of the series.
> 
> I also have another sideband change attempting to fix the use-after-free
> stale vdev pointer in sideband. It basically swaps vdev to udev.
> I'll post it on the list. Let me know your thoughts on it.
> 
Sure, I assume you're talking about:
https://lore.kernel.org/all/20261118125109.1429538-1-mathias.nyman@linux.intel.com/

If so, let me look it over, pull it into my branch and test it out if it 
looks good.  I wasn't able to reliably reproduce the issue that Lianqin 
initially reported, so I'll see if I can figure out a way to exercise that 
call path.

Thanks
Wesley Cheng
