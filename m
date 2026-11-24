Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489311;
	b=3kUAIZTeLVC1zcBij1rzxJVnLz1aOrW6UQu2JYX6y4lp7rLFsZvU31g8PcpF/IoDN/h2
	 Ae5UYh3o9GbNLEr7HYgOIvaS8DNaNJmPzrx0Cuf7CDXFZuGaiP/oW87P/dkk8w+iqGRSS
	 xRS6egVp2FjmI9H4gsuKUXFO0U4ZxSjBMhaC+rJOSpyBiQp2St59+AvTSEakjYaRnhWbD
	 GXGPMPniGC1i3bnQgQkZZ2gPpHiOTVH8Bib/9dnFPOoTqhD3kjtrKRZtUEDm/Qicnx+Fb
	 ZQITWTB9B6pjc/zifEt4mszS0IQGgyOBdWoFvgBEL7z/I66VwRipch8IouuFId8mPlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
	b=VRkA4lLpBpxl+r/HDoTNjcgXomEHTl014roPlYNeUZGq2fixPdUi5DmQi8nNVVNMXBjG
	 tbSIICQvbc+/TsF2+i0cGTuGABXorzPl8z0q1eOTJi292dSBRuaH0QfAbbLia1KeZ9tK1
	 irAoqfrkQOWmdjDH6KxLiYZJqYTFX+ybIBPVuu/fQmUCtG1r4gPKvpvQbAVe0hI4IQfR6
	 Xi6hvPBsEiTX2uBJ1Q4Pe3JNcntMX7ItMj9rl1naTxXFFvphcw+WdHCRd4N/mm/Ytupfe
	 0oKK/XloxED863WPd1tAZxBnFHHL6DqHyJM4qWUwWMVnYIrCcgR8MEFM3ecW6/G9p3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UHvxTIF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9080x3i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E32606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 03:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UHvxTIF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9080x3i
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kIIe3850773
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 03:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=; b=UHvxTIF6tq86T9CZ
	vPUfeezi9q52Mm9ZAiqA1HoB8DQBmvf8A1qYlcRLE6U6Z/3kwMeTg8oOVvdakrnP
	6WOYyorBnwZUcIKLVKj7tm5bIjyepFWbISHwMHoO0vBdsI9/5H0H3a54bbzf6U7E
	wak7+9TWY1q6FlxC9V6sjtIPDQ8tyPeb7WdPIZsAqT+ujuHndmrFLdRgSgz3b5j3
	seP7dDPvMxeaQ8NAtZl109N75+XhPj3/33cU6Tj3S5yrdalBsLx6ZAwxd0yn2rc5
	gaIp3TPH/k1JKK5Fn0Z66AaxW/r4QeXqEThamLzoQF+8YboG2l2VlMkWnVxmwPs8
	uJyzVg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb0fpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 03:01:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so4447614eec.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489308; x=1796094108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
        b=A9080x3iuU1zI6vT3iPwfdZUdAkpUUrLB1UAxVAqOS9mQ0FBTIrRRvoG0ipF+LToJ+
         O894TGMZc14TwYGG6pWUGIH/812MGEOZIlql3J5JWGauM0Z8RkUZvgKkbjC6KM+as7l/
         LeBFE06zyMSVSIS7Pp79/BaXOCpFMQcCmo3DiIkt0Yx9u9LoQB0uMGpRglOtHKyW3O3T
         dfWPUSeXVBn16RWiMjGvHKDLYT7B+CGnRylcJFtLRn7vjBg8e9WcgAcpybIgO5xo9eZG
         O9gfiOjHhc9QH4dqz7CNE0fjkMtL3/55nwVO47sVS4pDdFBIjokbHDRG/aQMBBcU+hLW
         2EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489308; x=1796094108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
        b=QdFMMy6hI/4ukkER3gaIIfwM9ddEKHtndWGpc+9NfNx3PL2rHH7OavdHcIIM3jM/Wv
         c2j4VpVuJS+SRxxvoAiWfDcrA9Ja+3qgrgbeZ5I3L1Kbl3kwjv7HSEDIsUBEQyJdQ9hT
         pTEaHINe+y4IGfmhbzTneFYm2A5kpWW01xnxKaruB3J4GwUYtd2JeH1dUUOfaQVffdK1
         MpHgFz7NH2Bgi/GO0FphtBCQOGZ2u/OqOdiyQxPxQryQFehmuW5c8svIymy2rEt8fMqc
         IS0eNuFxpwzbCdKxTw/xhVYZqHsxXSbIHEwbfxi+fWztJPc8mzoHbZwQOxSiXEq4Slly
         RmYw==
X-Forwarded-Encrypted: i=1; AL+hErF6gZub5lhfpc/dCXB2DBZmXdL4d9fQj+1BPqS9Sp4YfYU94L7qJTx7fEhrIpNTl17QLvEiHzte+VMEAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hznz2XiPY0paks5sQ8kjpwOyo9h6pio8PDm/dnCTZocbz7hQE
	Dx7TgIY/V1r8fR/IzrBVfaWuYywfbCUhs/+kWnSY0tuexLMcBJF+u5sQOudkpW3///jW1kTo7k4
	4BokMqlvVM+SADKS2wLwKJbasavCsYBywUvDnnEWjWC/kBjnJrNYCLp0/61wpmbunWg==
X-Gm-Gg: AZFdTZdDSJEfp2U19uYCxxinq79GGsP5Ucj7L0GiJUa+2AIPNzwrIIrFYbTSSKNBVwN
	ewAvIONASSDWLatYjYzpGJ+ktViY1yqDjIfqOpebsHNuii0mufA2hANDdVdmYS3BEljHzqZ50Bm
	g/r3uc3iW6i+fwh9HEPQCfU624nPd+rAtVAaoMSIKqVuNAaRQWhSf7mfRdhHjneoj/x9mRtID65
	yRSxvXaM0CgEH+6bs0FLcDN95lP6+whqqIxeEIcVmtpmM3QbIw0K29QfuOLNQVyYOaGxn9lxmxU
	nby1ezshIQDI0TkGqG95sEwlGzrp4HfDXan9r8P5EkZF7LyAJVTGeIrNPAJERw8DNT4/uP1vul3
	Gg4ZWj3cAwjLWfwJJ2UPuyDJMsfpoika/12fIMvYxq9uNKFnNHYhXCq1X07r62/lqSGj7eU4HM1
	EtbaVMgfgJEqD2maFkWda1
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5028542eec.26.1795489308471;
        Mon, 23 Nov 2026 19:01:48 -0800 (PST)
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5028508eec.26.1795489307870;
        Mon, 23 Nov 2026 19:01:47 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43491619eec.14.2026.11.23.19.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:01:47 -0800 (PST)
Message-ID: <6c3c9468-af47-47e9-941e-49619c35a5fe@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 19:01:46 -0800
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
 <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
 <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b04fe1d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=cJ9xjPLimF7whQLiEp8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: V4Le7ZHrCVPLTZZFn4ZR7GNWux8yuUD9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX5adyHIteS2B9
 1lcKNnO2xDG7vjQzU5QMNT/CYiRqoNWZAvR1wqEzOPwaRu8s6SVNBj5uHXIRj9FkyOoNLO9UYda
 Wf0kLBV9Z6Hga7zm0IuayO+hxtcZiP0=
X-Proofpoint-GUID: V4Le7ZHrCVPLTZZFn4ZR7GNWux8yuUD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX65T+85jWnkLH
 zlUr5CaHV4Ve8Iih1mvJi4g2dfNaemN00gT6U27j49TQ/vyRqpE90AszGP6GQstVFLMhrhkPZHl
 hbcwQH2DLkiqqM1MDSJcToamxVnhEI1woUSleKFX+UJxkCKytpa65hjWK5riKmMdsatmF3TlIOo
 zH/5IinhtS4D3TM6oXnOML7kuGVz6it+C7S7ZJss0QB24kMehX4Ml4+EWxcnfcrrWLHhGrl5PIt
 ipE/CiRJT/dXTXKRbr4Sask51d67mELHF5XDKBVqQ+s4P/44ZZENlcGNwQ+VCRML/iPXx7919ya
 1hFKEOIwzwxeBODzbl6WoMQMdUVH2q21LAy/U7Hdgvx/w8ymyO8ffQe6rO/z0UEzeZx6ZglAd9h
 Kn7EatrPJC5CoAfL6ukwsDOtOUhe7Wl49JNeSiZe2yk8a4pjxynfHSZgSmS/bnX2NpHRAH9gl0t
 BOZIZesG/PkshvWBIAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011



On 11/19/2026 7:26 AM, Mathias Nyman wrote:
> On 11/19/26 00:30, Wesley Cheng wrote:
>>
>>
>> On 11/17/2026 1:59 AM, Mathias Nyman wrote:
>>> Hi
>>>
>>>>>
>>>>
>>>> Hi Mathias,
>>>>
>>>> Was wondering if this design looked a bit more acceptable?  Was able to 
>>>> figure out a way to achieve what you had suggested earlier mitigating 
>>>> the dma free problem I mentioned in my previous email.  If there are 
>>>> any issues w/ this please let me know.
>>>>
>>>> Thanks
>>>> Wesley Cheng
>>>
>>> Big picture looks good
>>> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 
>>> 2/4].
>>>
>>> It reveals and reminds me of how poorly designed existing 
>>> xhci_free_dev() is.
>>>
>>> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
>>> inside the lock, preventing it from being dereferenced based on slot_id
>>> somewhere else, and then free it without the lock.
>>>
>>> I ended up with a huge mess that rewrites vdev free/allocation,
>>> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
>>>
>>> Seems like best solution for now is to add "no_pool_rings[]" to support the
>>> larger page size, and then later rework the vdev allocation/free and
>>> slot enabling/disabling. I'll take a look at the details of the series.
>>>
>>> I also have another sideband change attempting to fix the use-after-free
>>> stale vdev pointer in sideband. It basically swaps vdev to udev.
>>> I'll post it on the list. Let me know your thoughts on it.
>>>
>> Sure, I assume you're talking about:
>> https://lore.kernel.org/all/20261118125109.1429538-1- 
>> mathias.nyman@linux.intel.com/
>>
>> If so, let me look it over, pull it into my branch and test it out if it 
>> looks good.  I wasn't able to reliably reproduce the issue that Lianqin 
>> initially reported, so I'll see if I can figure out a way to exercise 
>> that call path.
>>
> 
> Yes, but sashiko found one missing sideband_to_vdev(sb) check that would be 
> good to fix.
> Rest of warnings were expected.
> 
> I'll fix it, and clean up some other minor things, and send a v2
> 

I'll end up needing to rebase this series on top of that submission.  Let 
me know if you have any other feedback.  I'll followup with the rebase 
submission next week.

Thanks
Wesley Cheng

