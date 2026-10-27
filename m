Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132347;
	b=0u6P1sEPGzB9mkShuduc35xAVSeYQsmLN9lvmMzEkZBa7CrD92nmSndJJU7dk+L31jcB
	 GK6EMvNfqCF7WtQKyE8dtoPN3tAGR4uwSKxW+Er8XCbGuNK2WSPJIhWubnq3OCqE9xVtx
	 wfv+V4JVPFTMXOBcjnM/H9+0pjYI6cegB7IseZ6Bwnv6J0pumogMG02bOVzHfuKwvFtLD
	 IrBsLeHg/Ai8xUr2gsNQIsePemv/RhuDqNFrAVC6UKYyqhQtiWJsg/GLVyn2+d3RZZczX
	 lZch+Ta31GUpBJNLnvkVigtYLGH0o01xk8wPhflGgVYsNm7cIitTF2qNY2XrqqRDEiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=;
	b=eJSd8o4rVxjJxDFsY0BC/2LLAQFvalX6F9MIWoAUAMCVFZEInU+ZtXkE+RcsxF7CVn3m
	 XmlX+mWqUqDKlP/I2o1sJRGdVG0O2iIUXtxpMH+w0V8wNSprBAMIK7vsTMj58zik4Vzjf
	 j3ZO7kYnrSBETUWsUBtNofX4tGIHJDMdBMMXf0ThcNev5bWI/yxf5SkY2vduB/w8le4i6
	 06WWxExqLUZoXpYvR0Qip0uu5OZ6uKVJNah6EcKic+zVPiN9LDy8nGt+3O14DS9vS5bq5
	 T5uvQ6wDsT38m/RRAGbpDTsPhA7R0Ltw3Wu3O87qh/5XwNVDWQPU21FTiu1c1I/xtWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEXcYDZA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+6A4oBB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56B606A31D
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 20:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE56B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEXcYDZA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+6A4oBB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHFmh4050573
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 20:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=; b=KEXcYDZAEWzfnG7U
	QZFrOGkok7PHvc1t0irivsbOEZozq9T5AwN5CMGnqUvRkOprSnBjZXPZveMQHy1C
	CVxXM8wwU7vt7I9WbZ9IhWEJucP6vwFu6eiv593YA6ptn3OXbFD8YoTnnujkPB05
	qoX8O/MNt8GSXTVy/SLwemcbfszIq42FRgc1VMJtQxkqy7OS/Sb+5+77MZPIggYg
	9nFgKuwtDxOvzUzK8yGwsHd04fs1wVRuZTek9NmwY8YhWCNGXh4W6jSVhaRPeE24
	2veHCo3aWLR/Rlcnmq6kQ7RBJ+m/+hsM3HN/TJVM34D+m/iLHsChzRZ+DjcKrxYq
	0uDe+Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pre5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 20:19:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-19dbbe4b1d8so183958c88.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793132345; x=1793737145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=;
        b=V+6A4oBB8ZgDXGJHAeQSgSjTy4fIgis7+kK00d73yX/A78S4bexKbl05KUoznfW5dU
         GMSCZypeFkQTXPSDWul5yp0X8OYp7wCHKXTQfs/YQq+qvoUi/ly3qZa1x+hrU5J9SRrU
         QyEEviwpNH/WuEtj8U8HNdDqKAkhl7Po97RlDa4kPk+fgTLVL+bGbSgDB/vAGVD/om2c
         3KI+6E0x73CDcxQXuWcNZq2sV2eR1qM/i9C/osYectl4yiRSe5a3GXcQBaPDz2YyDfWH
         2E9/VjA67v371tiLcBIqm/ySUnr0Z3jCeHyT6IQ7qTy0WSoHn1ubvFUQGt35Ixrt4EMs
         F8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132345; x=1793737145;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=;
        b=HIHgCTdypB3wOtq8bxWdHl/zicnUp3JcIOP8aZ9cV0IkP5+75/cMdiljAgEUHBoks/
         gqVOfcN7mEZtDl+FQPwrRfdmLP37qTcjm42yOz1GeAjU+SgGbotZf+xpcrVQlip+xqnv
         N4gur+WA4URAKJS8/I8c9hUx2NZJhlkfo+p9H12AERpo3GTR08hY11QA1dzzAdnoeXuq
         gARaF2g3lSlXcJuY0RAkdRdS5HFavd/Po6iVR4eDc6p/mFnj2EHa72LL/fXpXnbiPGXV
         IuVXT9CUzR6I8mye78yPmE5v2PgFlPbe+G/SF1eR0H2cd2aK4KSJKFFkyJDv/Ax4wuUD
         +y3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxa2bo/bHCi1jiLbWUX0oyoIOAZdx1ZYEStUapFLyDpZB8Kceb9v5LOZwIwLlVAlB35Iz5oxNEvzZ9SCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjmcszdDJkwnpgd3cL+t5j+mvXlF5EP2B/ifKxC/I87jPQcaXc
	WneoJYpmCJlTmo560QrJIXDqqVkVt5Ws5THmjTotF7MsXLSK0JXW5/4dwcDQzJXUdToL6he/Cc2
	AkY8RAdGWE7mbTipdddocZcASzoiTYnzH6OPGCOAYP3xNS9QKaLdgimk6lEaUaU2d3Q==
X-Gm-Gg: AYBFou1uyuE25a5DUZKm1Oxcj2MicPtB+ETbyuX+b4wIiYBtz3uM+UMKvMD/D+UlPIZ
	805mOONZHZxSZWXUEySqBe3nI5tnHw2xpvPDrcn4EpDsjYO+tM82UzC6Xs1k9LtP+5sqge1qVUp
	hp6ZCo4AqBhVD9ntTyO4AokZPW/XkghJuA6I4xG9htckbcM3OzyZNXW4YqhiAg8k/KUa5MYs21b
	uOmWu1BFgb4U/G0HmRGDC3FOB/Be2tiIvdeCUvCH6NGBj0msIUHsZFXc3PNtNueoZt0Z5KCB+Sp
	hQ6kxkfcnE/aYzQYZreReK4AsBO2IsYEduHlo7TykT3dsi4Uh38fvVvFDjVHX9fdIx+PUj2H0UZ
	2awzQZCIG/UD0Bk7eG92my1ExGl+ttkpFGNWdi5AbYUDxQg==
X-Received: by 2002:a05:701b:4641:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1a6cf72ac18mr314153c88.35.1793132344853;
        Tue, 27 Oct 2026 13:19:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4641:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1a6cf72ac18mr314124c88.35.1793132343969;
        Tue, 27 Oct 2026 13:19:03 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6da6355a6sm520361c88.19.2026.10.27.13.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:19:03 -0700 (PDT)
Message-ID: <24d045db-b8ab-44db-83c1-9832d22dc9d8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:19:02 -0700
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
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
 <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
 <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
 <20261013111110.423dd0ff.michal.pecio@gmail.com>
 <73096f91-146a-4754-a685-f3b22f1ac3d5@linux.intel.com>
 <5a60513e-9d39-4cbe-9f2b-dde8ca71a8a3@oss.qualcomm.com>
 <090277e2-e36c-437a-8c2c-f6f3b63abc89@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <090277e2-e36c-437a-8c2c-f6f3b63abc89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dfnzdXiTm4LeFigscVn0o9Y7mAth3qon
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae10739 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=x95Msn0_mbxkGruDv4oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA4MSBTYWx0ZWRfXw54MSqZHwNdZ
 Qx/RQape8sGHWcZvVFYO+WUTS8ZYTY0ibpj17/0EFlUQjnwksoVUA6u0eONSaEmM9iOyz+P5Y5W
 fL4zgkfggVdruvjJIxrQNcDQ1f0dnQELnMNqqh2QvCupRx+ATLrBfEbf13cWDWCn4Nc/qGwA2hm
 gh9+XgiZoJFZakJ2EQHKMCAf+J7dA+bAqdtQ9zIEKSFiQMOxs7IG5CT+ppOIqRWNEUOQFuVPKlz
 qS6cnNz0y2HPJOl/SCuREwXztnWl7B6mnyOmo98jdtSj9RbPs1KVXoJZuJN4ud5aCmjo59i4N9Q
 oKpy1GRT8dZzpNm3LNRjKpcTOufUolB3Oos3lp6dPK3JzAGSzPAE9Lo6XiwZzgsN4NQo+aYEFNF
 eOtgWqNSsJuUz2UV5ScjGCSJrUGdu7j4JatKn8XR7jYnMKuLGzNX+30NioLlkuZvM2P5NGZpZbw
 MlZ0XNHPsrWdYgd/cxg==
X-Proofpoint-GUID: dfnzdXiTm4LeFigscVn0o9Y7mAth3qon
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA4MSBTYWx0ZWRfX3s9rsNitJC3O
 TQ2HmWoxQ/6J2uedBMmvEy9D4fEWTtyOhiVd16f8zuRmpDByEDK5btS4woFlsr5JN4Qii+HYWGk
 jvCZZLhdppOuffEzK2PgiqKMfwZhfN0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270081



On 10/20/2026 4:13 PM, Wesley Cheng wrote:
> 
> 
> On 10/14/2026 5:44 PM, Wesley Cheng wrote:
>>
>>
>> On 10/14/2026 7:26 AM, Mathias Nyman wrote:
>>> On 10/13/26 12:11, Michal Pecio wrote:
>>>> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>>>>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>>>>> xhci is the one allocating the ring when adding an endpoint, and
>>>>>> telling xHC hardware to write to that ring. It seems more
>>>>>> approriate that xhci should be the one freeing the ring after it
>>>>>> told xHC hardware to drop the endpoint, and there no longer is a
>>>>>> risk on hardware accessing it.
>>>>>
>>>>> Hi Mathias,
>>>>>
>>>>> Sorry for the late response.  Was out last week.
>>>>>
>>>>> Specifically in the disconnect path (while audio offload is active),
>>>>> when we utilize the usb_set_interface() path, it'll return early due
>>>>> to the iface->unregistering check.  This would lead to the
>>>>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>>>>> handle the transfer ring cleanup.  This wouldn't work in the offload
>>>>> situation, because qc_audio_offload is the only entity managing the
>>>>> DMA pool, and that would be freed during the .disconnect callback,
>>>>> which happens BEFORE xhci_free_dev().
>>>
>>> You are right, audio class driver .disconnect is called, driver unbound
>>> and interface device gone before xhci_free_dev() is called.
>>>
>>> If sideband is unregistered as part of .disconnect callback it also means
>>> ring/pool would be destroyed before xHC has dropped the endpoint/disabled
>>> the slot. Would be better to free the ring after we know xHC controller
>>> won't access it.
>>>
>>>>>
>>>>> Would you be more inclined to prefer a solution where we can defer
>>>>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>>>>> adding another sideband notifier (sb->notify_client) enum to tell the
>>>>> client driver that it can release the pool?
>>>
>>> sb->notify_client callback has the risk that this sideband entity is
>>> unregistered and gone by the time we want to call it
>>>
>>> Deferring freeing the DMA poolby some kind of reference counting again adds
>>> complexity, and maybe not a suitable solution for this issue.
>>> (taking a reference at sideband register and every dma_pool_zalloc(), 
>>> putting
>>> when freeing or sideband unregister, finally freeing pool when reaching 
>>> zero.)
>>>
>>> I'm trying to figure out a simpler solution.
>>>
>>> How about skipping dma pools completely for endpoints in these cases?
>>> (page size over 4k with offloaded endpoints)
>>>
>>> Instead of sideband client creating a custom dma pool it could just set a
>>> 'no dma pool' flag for the endpoint. xhci driver would allocate the
>>> ring segments using dma_alloc_coherent() instead of dma_pool_zalloc() for
>>> these, possibly even allocate a full page for each segment?
>>> Freeing would be done similarly.
>>>
>>> Would this be a viable simple solution?
>>>
> 
> Hi Mathias,
> 
> There is one difficulty I ran into, and that's w/ dma_free_coherent() not 
> being able to be done in the current xhci_ring_free() context, as it is 
> under atomic context.  I could move the dma memory ownership from xhci core 
> to xhci sideband, which could probably get around this.
> 
> xHCI sideband will allocate the DMA backed memory then populate the 
> new_ring reference.  Then when xhci_add_endpoint() --> xhci_endpoint_init() 
> is run it'll check if new_ring is present, if not, follow the non offload 
> path and allocate from xHCI segment pool.  Then on the sideband unregister 
> path, we can handle the freeing of this DMA memory as well.  This kind of 
> moves the memory operations from xHCI to xHCI sideband.  We would need to 
> have a set of sideband specific ring alloc/free though.
> 
Hi Mathias,

I'm going to go ahead and start working on this approach.  Feel free to 
comment on if you have any major concerns from your end.  From what I've 
looked at so far, I think it is a feasible solution, and the only major 
shift is that xHCI sideband will own some of the memory allocations that 
will populate xHCI core references.

Thanks
Wesley Cheng
