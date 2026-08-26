Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE794519A6
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787774301; cv=none; b=IfNN3UUfLWUeUs0UQXl0MXWdO+UW6NjAGoJWI2E9GQPJO0M/gYgG4+EXQgbo07VqT3iIEIufkpaJher//rTlkmkKkYZb/KooCRhQk061lszYPRAw6HEJE9mVwXFMP7SP5xnjpHOg/mpSWHKgmGHge4TOizTrtY3atYI5XfDaPp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787774301; c=relaxed/simple;
	bh=xNgYWycmlnGq7YlQ8RCp+oSUMIXqArjLn6Iga1KQwQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eftF3ouh3CvuaNxXEl9w9GgaXdK8QwSGohbRQDh46BB0MmpZwaMNILg1yR/6BkCQwK8vbRD3lawO3+bJaE6OLJEkmpkGXoE8azkhUz2NK5ggVGjCPsyhJeLUtnxRKL0m8sy3gqIiZ/BMvJG2CmrbSByXINQ5T0ZS582uknUMcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVr57BWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/WMdsHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVr57BWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/WMdsHD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuq5h1541334
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 19:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEeeqCnE9RY6Ck7uR8LTWxA0zB6m5qUucip2PAu6Tx0=; b=gVr57BWv2Ct40txl
	wOoFNyIipDypWt8SgCtcSI4YqmmB4fyWTg/81uxk7M2qLbTZXz2NubQKwzUVD+ll
	e430d4Oxc3FYDbHoRVPx7TrfTGREZRlGTPGHgB8o/BD25v7r41e1Ts8C7N1zEOe1
	Y18cDI9Ymozm8AT7s0A9cUbr+r00ko0uRvJqEXmDNoTImUbLCenTjBvfmVVL5P8O
	BO7tetAOF/GZF2Y0aI9SLHLW4dn9C7GFA0LvjwSbFgJPIqLjogstg49WGl7PCUom
	1hhjC3A8okOMPQZbjFXlsWUqhSAKrkOdM3knuxvd9HUn98vS+9fTEWaJNpwekXwy
	lxF+AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0759s85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 19:58:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2010937a91.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787774295; x=1788379095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEeeqCnE9RY6Ck7uR8LTWxA0zB6m5qUucip2PAu6Tx0=;
        b=i/WMdsHDEa/yzEso20UWI/buRJJqBEKyMEU1IJJFQHd/nAKyAKxBb+/9SbBMQ5pBDn
         FAxu74e/lW/Ip+NgOW6m7ZEr/bjvLyGAXN/zzbBnKE7IMInLa2+ZVJE67mzEnQFuoCws
         d8BuGGHEnZM6cVqfOa/HS3iDL2EhTEZ9R/JYS8P+HdvOzomWTUmygiDzYQ9pYPqh2m48
         HwZcQFd6Knd3lVMzWvUWHYrBDVqO6NLBCzwvzTnz2rqoPhHjt47htPiS1w8iWLxymgQh
         fO0tL8JlUTrDAQBbeCV8fAbcl+kLB/B/vc2ervY9w/6K3qa3GSIeUb0sTFono0Phktd9
         pVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774295; x=1788379095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEeeqCnE9RY6Ck7uR8LTWxA0zB6m5qUucip2PAu6Tx0=;
        b=EIk4TShoW0G+de7IumlR5EPOzo+mVpbkBRmBdr9mKKNED9UZzojhiVOrphlbANYVts
         7QYKTjCtnK3ehQoyW0a4CCZj97hVy3pxKHlIoz63YsAfsOHAtgwLl/VpAst6vsncEp8r
         uSNtI6TQmocTRZtSK8wftu5ysYVpaRCxDQ6qA672FioIc4olrS16QDxFMSt69IJlzHjc
         fKjpIzLItBS7yvSKEMJtRynAjDAm9mfC3JujUlZr8CZSMRi0nIMvryvXmn39oVs7gxG4
         6UyJf8OZMn5NrcKW6BfwAn+6I43bpf5Jq83m2+zzH2nRGZkpqGNb1ycKXS9Tc/e/J/6C
         n0wA==
X-Forwarded-Encrypted: i=1; AHgh+RrP2E5kXOxmnChCPQ6VAE0S3ZYhI72rFOLNfgdiuez4ogNAvV/SFLHrnSP4/T597K5K95076ysrLGcrpA==@vger.kernel.org
X-Gm-Message-State: AFuF++mq39nUYNwR5Th3Mg8zm9a15PE4y9VagwRHFp5wFFoXBj6fWalB
	nzbX+L4ZwnFp1KGhGE4wpDBuRhcYgcQ4RMtYVdRi9Jvzbt6A4vVPJL1HBBX94AsnmsDAURMxBcq
	0S4twI0IvFPIpAinQoMCChvqHjpzTqrGoKEM0WON+D2HI1f7p/PfOlXhYocpI/zrwZA==
X-Gm-Gg: AR+sD13Fa9jsBLe1ETLPGdAGNAynm14lIvJpG1dNobD01Ttyj7OhNwoVILNcO0xGnn+
	/lU219nPH0Vs5Kdvy1s0UFYjaBT8ClxOoP3yWRFuqUr9EVKfqUfRxuuU6+Aa9aOlslIIWLv4Q/D
	Q9siJJN83mwJG+/gGAviIXGbFU/mVOj2R/bXdR2+HMqodfMXMIaNcREE3r1aC0h6SWwekNxEvK9
	bsz2QaLnbx2t7840BHPGBe7g6/eLBLuGcI1/TiFV1DoaiSNFvxmc5Z/U789CNelSXvrLx/SrqAC
	QlD4SqoTZRbPHcybhs7S8l6UaM5m5OrNo0z9onJI3wgehD8dSgS95Tony9Gb7jU07DPtvcQsUdH
	o1SPhvqRSgBzcwzMXJwhB4gJPqo4GD8zBJ0YUF4nXg3NIbzw=
X-Received: by 2002:a17:90b:2885:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3966d5c1a78mr20150684a91.15.1787774295192;
        Wed, 26 Aug 2026 12:58:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3966d5c1a78mr20150593a91.15.1787774294646;
        Wed, 26 Aug 2026 12:58:14 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm16866425c88.5.2026.08.26.12.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:58:14 -0700 (PDT)
Message-ID: <68a7cf57-8484-436a-9d3a-4d993c4e542b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:58:13 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
 <20260825094327.606072e9.michal.pecio@gmail.com>
 <25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
 <0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
 <20260826122552.5761dea2.michal.pecio@gmail.com>
 <05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: arDz61hID0zsDe015mZcgoY9WLut47Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE2NyBTYWx0ZWRfXxEZzCvcop1u7
 Ii0TgLvtlsbpluC1BLsuTIwK5Gmo+mW/NgVSo0q9RoSKTKoBBAt5CDLDq75UdgJWufAUWrMtWfi
 UB15/TbIjmwTA/I3NJTMPN1wxPXdq50X37LKGXhx3kZyOoSYvYUZa2sJWXYv/gRTk06dlrpFrIO
 NKr69XgdYUHp5zLU0J1YdYlFD6BGAxhFJ22UuhKoLIO1bXNIkXjFaTh2tKqA5EMwdThv9eyl1xo
 vESAjN25PUMCvxvw7Te0a0OW7HDhQIWryj4ttiXmVZ+7YUXgHyoAGakAJVl+iAa/cDvctPFfd+j
 Dub//QdHrNrc8jNeXWFfIOZXv+mByucF/bsbutf793Y8eNxgNxY4uQu8uZnblTCqBYoi2lQvBKq
 duDIwiO9gPkzmKCFmuMk1UGtyWZYDAKQQ4sH27OXpnNQebElcDGvkAB6JvWxjwCQ5/UKpv1w8SP
 PYDbFy4OCmP0JBWGSEg==
X-Proofpoint-GUID: arDz61hID0zsDe015mZcgoY9WLut47Sj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE2NyBTYWx0ZWRfX8igfg3sBTaK+
 XoMPOYAj5AwMzGkGDsJbVgAnU3HUc/PXxBCGYfGBEbvi4QP26WoDCpoMObVtrcaWqv1bc3nO0X9
 ZdhiCf058/xNfKg4HnvMS/tRyqhVfIk=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f4558 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3JJVxq43hS1pEoG2EpcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260167



On 8/26/2026 4:44 AM, Mathias Nyman wrote:
> On 8/26/26 13:25, Michal Pecio wrote:
>> On Wed, 26 Aug 2026 00:50:53 -0700, Wesley Cheng wrote:
>>> Thanks for this suggestion.  I think it actually makes the overall
>>> design a lot better.  So now that the sideband driver has its own
>>> segment pool (per sideband instance), we expect that any page
>>> allocations done from this pool is technically owned by the audio
>>> DSP.  This allows us to still utilize 4k ring segments, while mapping
>>> the entire 16k page, so it helps conserve/optimize the memory
>>> allocations.  I will do a bit more testing and review before
>>> submitting a new revision w/ these changes.
>>
>> The part about memory being "owned by the audio DSP" made me wonder
>> if it would be helpful to let offload drivers allocate their own memory
>> and then just dma_map() it for the xHC. No new rings would be allocated
>> for offloaded endpoints when they are enabled, we would point Endpoint
>> Context of the xHC to the sideband ring and leave ep->ring as NULL.
>>
>> Offload drivers would have full control over memory allocation - size,
>> number of segments (it seems that qc-usb-audio only uses one out of two
>> allocated by xhci-hcd), alignment, anything else.
>>
>> It would become impossible to offload an endpoint which is already
>> enabled, but is this an issue for anyone?
>>
>> NULL ep->ring will cause oopses/panics when somebody submits URBs to
>> offloaded endpoints, but I think it wouldn't be a problem otherwise.
>>
> I have similar thoughts.
> 
> One idea would be to basically let sideband allocate the entire ring and set
> ep->new_ring early. This would tell xhci_endpoint_init() that a ring exists 
> and
> a new one should not be allocated.
> 
> xhci ring allocation would need some refactoring to create helpers for 
> sideband
> to allocate and initialize all the other parts of the ring.
> 
> This is something that VTIO (xhci spec section 4.25) would also need.
> There an endpoint can be handed over to a secondary DMA ID (second, new PCI 
> BDF),
> that the normal xhci driver can be excluded from  with iommu.
> 
> VTIO use case is something like trusted VM accessing a secure usb storage 
> device,
> preventing regular OS running the xhci driver in another VM from touching it.
> 
> The secure VM needs to allocate and map the ring to this secondary PCI BDF
> 

Interesting, so in both you're comments, it looks like when USB endpoints 
are offloaded, you want that to be fully isolated from the xHCI layer 
running on the Linux machine/proc.  During the initial USB audio offload 
series submission, I think there was a point where we had a discussion 
where we decided to support both the Linux USB sound path alongside the 
offload path.  This is because applications that are unaware of the offload 
path can still utilize the USB sound PCM devices.

In that situation, we're needing to map the region for both domains, and 
proper ring structures in xHCI, which is the current design.

However, with the current changes I have, it might address some of these 
points.  I'll just give a quick highlight of them:

1. Currently, during xhci_sideband_register() I'm creating a sideband 
segment pool and saving that reference. (if we wanted to adjust this to 
your design, I think we can have the DMA segment pool allocations be 
handled by the offload client driver and passed into xhci-sideband)  I 
think keeping the dma pool design just fits better with the overall xHCI 
ring helpers, and all you need is the device structure associated w/ the 
SID you're trying to map to in the offload driver.

2. xhci_sideband_add_endpoint() will populate the sideband entry for an USB 
endpoint.  This is used as the trigger for which pool to fetch new_ring 
from in xhci_endpoint_init().  This pool will get propagated down to the 
normal xHCI ring segment allocator, and will fetch an entry from the dma 
pool.

I guess the only thing missing is a way to avoid the current xHCI APIs to 
avoid operating on rings that have been offloaded, but as stated earlier, 
at least in the USB audio offload use case, we'd still want the Linux 
environment to be able to operate on the ring.  I'm just trying to see if 
we can come up with a way to accommodate the VTIO situation as well.

Thanks
Wesley Cheng
