Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537985;
	b=rj1AhBTqlEwrUil1EZ/np5YeXDe3aq/i5MFGN6JXzbdoqi1tSUbuSOQFoHhoOqXJkUOg
	 jGOanV34VQpazOuJNce9rXk3Eopo1z9MhUQhegu0EE4naAiWtl+OcETqXo26AKJLVNidO
	 HXiq/4d02BAFeZIsNZm+lRLnjz9qJRE5WLs3ZFWWth62g/+cQ9Dwr0NGWQ+EV0/TQznFo
	 wW7gKxazgGV3UHfyDsePCSiuQ0spS8eUXerSTSaL6glcqYAF+wlKpRMPm8p/RvmEid8w7
	 aFo/jvrSu5GZWXwuDwiKfQcXwKkgu4m4Zqz8iBw3ltdxygDkziTQ564ImZ+JGvGfjgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=;
	b=HelAHfZnbLPUQd/4WR5WIBKTs1aL8EEhVpiUUkGuf+rE2+DloZLwrGML8fjCRRV3gqvx
	 GrI/PQoUJAVyBKbjp73IpZw5NCSmj/vKrM4HZ31Al0Mh7IXhusCZfO85ixXsRWUSLoQrd
	 8rsjdMqQ3P6ie3MzhPiFN4NmxPQXuh/U/nQm7nZCATNmFVwj4CwFUUMQDnzZQtzwlW7vX
	 rP1Ps8XlLQ7s7PwLcBDyDsYiU9+/K0hdLeW6sKVSMn5HRWCHT2lFlycTodi5cnAFVoPFO
	 gLhobKTXUhSFG/jYsjpP7B5G0zD/aQI7MZ4ccaUtcND2UDZiAYaEhT2DWJzrKaBPhFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KXY4JHYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPh7nLMw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6144606A31B
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 23:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6144606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KXY4JHYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPh7nLMw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKticM1716848
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 23:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=; b=KXY4JHYUWO3bE3is
	gRpMrAuolNDZbZzva/DkJoYJ1+F2DIVilRKOaKd+1caJA1zwCjv7CJHKyWJbFrea
	/ULCqtNqrArcVpAUYQZh8JoxVIADVZMFi4NbDny5kdRjwgnZuCoe/E7EKzh8u+uL
	1/SANw1L1uCqY0I8DxY1mc+Jad0DFuVjJ2jx269QWTwoyLaOFwZvSQkw2nnSfNvH
	MKVTjyMTj4JB/fHvKSwZ4mVsC8uKALdxmYC8A9Jdr0iYX3Qi+Yh4z9P5lgHOoct0
	YxsY667TGpesMrnsNYBok7OvnyO4YVk1BAK5Y2P1ubwIgONENP4knd+vyee0zmk6
	xaOVGg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb98s0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 23:13:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso158116eec.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 16:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792537982; x=1793142782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=;
        b=MPh7nLMwvn6EuIojV940LYBY4GaAsuAcmhWFHj4lMlRwt8tSyzrUSOfclMjRNm5UqR
         5g40F2iadoQf7ZRRXX6SK083cq001RfikPhQRiCrjO5tqnjrjaN2pEAcGJlgchEx0ymy
         sLm9WmRz76O3A34yEUdH6aZ7/rc1EXIe5zShTGccgEBjnCZ3eUD6qGMCkHCXXXbJYZHI
         QjJU7YnrUEyf1eazDQ3+QDJMRSDpanO8kPnFF/LAP51L+VUDIMzygYwFbVt0Be0dIASX
         jgI05k2CrS1DJlROzEnG9U936t5nBZowCUKwwN95SK3gpgBpAoDgroYIFODTLJ6oYHkk
         JxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537982; x=1793142782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=;
        b=SkpZbTX8VdNGTTHfg4bEPdBMHtoZCygSzfUpw7EZf8D5llUZcWecErZux3zhvZeuZy
         DZtT6KS5L2Imknbbe8nCVYEM9R5PJxslB6awEN8mNtMXyI67tm/IIN/ED8QwGf0nv7KI
         AtmmGNkmVmCV1oKKgioEwt4ixYmCNzlRmFjCNDaPt/Mco7bbr2adspK8lIx7uQLkgoOF
         cfH4H59Ea9XxANxIir3I0r03zLzp32E1a2Ocbjko2oe6gav+kizI5JbzDKGEmPwgNtPW
         +Mlj2dmSBT0jQqhBVHmSIIbDQN4WjufSmWD8ftZ+lW/vlTdO6dqoQPKtsX4nW0waD6uw
         eV1Q==
X-Forwarded-Encrypted: i=1; AKwUvByoiSXwAlwFHwmQr5bV01lLTdoPcbImJKDiATWZbySdh1UF0WWorC+vpM64L5CFfr2qGPE9yILWFnrXtg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNBeyX9VDyj2g3ZMr91cYjPGzAuJqvlQTeuKyhN8pZaTjH0NGu
	XbwbnvPyVl6+102IMa9Zzd8ARfc0zdWcDZjFOYNZJg0dfDdxf6M/pzeaW1yuXnI3iQAG6X36cad
	fH3H9UUAtJwpqWsyRauCcu19Hqyr57kino0kwiWo3nEiOJVWzf98RbMAFWQ1idhUYfRsqMC4uKA
	==
X-Gm-Gg: AYBFou2rfMHMRBRUTvKbn5XQSPd0JmVWM/hpGHYuqqvFnOzKwBzOzYtUNor/v/37dT5
	y+1gG0YE8KNiHkbvyHQsJsKu2Mm6AybaFsCIM54UEMvBNwuCXvDRSR5sZCn9eYW+a3jJSpitAX0
	pk3F+LBCIedXoXHDE7dPQ5R8VqM6Tgiwhnaoq4b9+zXltmjYcCblFk8b1Jw7GaWcfa389oXAZi2
	UmtEM/cmU/hxl0bfbi5XAJjL58eGpVd6C0TKVtYs8fW0h9nzrLvmxSvRpUH+EIBcOIUhnQfNF9O
	kaUmQ6DyCM06NWTtCiXDsQD/FAhMiFW643cWfsRcgDEHGKG9lYWVlXmCa12GiqpbsknzONIQgnB
	rMxhAhu5bWQz0C2p0WX1HoRSmYYdd7ZprCba3TuUl5oDf/w==
X-Received: by 2002:a05:7300:fe46:b0:350:869:d106 with SMTP id 5a478bee46e88-3674ea39d18mr774587eec.34.1792537982198;
        Tue, 20 Oct 2026 16:13:02 -0700 (PDT)
X-Received: by 2002:a05:7300:fe46:b0:350:869:d106 with SMTP id 5a478bee46e88-3674ea39d18mr774572eec.34.1792537981562;
        Tue, 20 Oct 2026 16:13:01 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm1830710eec.15.2026.10.20.16.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:13:01 -0700 (PDT)
Message-ID: <090277e2-e36c-437a-8c2c-f6f3b63abc89@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:13:00 -0700
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
Content-Language: en-US
In-Reply-To: <5a60513e-9d39-4cbe-9f2b-dde8ca71a8a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfX1u7lUv5KS8vE
 tNNAfF6aOv73dI25fE5i+ZtFcitO0KAwOm9F5m1TNTouuehP7qOEIknzidmJ9/MTIx33V8Hkzay
 JEOsn44gqOfxwwRiNtfo5joIBbcTYLg=
X-Proofpoint-GUID: 2jiCMBvBBc6KiTKVVHlOCir-UxgG8tFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfX0uLGfaknTgwd
 yQOfON9wlBc30cui/JViDmyQOAlcp/BNoj67WscxdPs/TL131/U/l/nqU1/TFytQ7BqO/bMdUcK
 dBa6UpTQZvRsCRRT7gz1KSh8nIAd6ZlOaurrn9R1LBiM+8KPyPdQoItGhMMq269u5+skHGaKwN4
 Zj9nkc+v8qrWS+umFe+dpwnGbLdjnVp44ane2iQNMf0k8YTcWirUZ/Ayb+sKB5BF4S7GjE2FUqe
 UmxAVn45uyJp6Cyx5gSKk/RdXMHQSZJQFOlbk8hc89xwhMWkHIca069rjKfP2CJOH0ZeFyEuFNe
 WtCGpD0zTox2SCXhzvcKyzJiTFwKnas5AQu8j3C+pJ3uYOCqKXYtFyonozMkQgoJnz6grgwn/v3
 OBOOpfeWznNUaizuOaxLkZGIwK0pygmN8pvQd2b8bWWcPwUk39n+LEZlTlLgNybBfWuWH9mJ6Pm
 Nm+Iyy4rzSYMOiSwgcw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad7f57f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x1azOlOpTcDmYp9XJnwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 2jiCMBvBBc6KiTKVVHlOCir-UxgG8tFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200092



On 10/14/2026 5:44 PM, Wesley Cheng wrote:
> 
> 
> On 10/14/2026 7:26 AM, Mathias Nyman wrote:
>> On 10/13/26 12:11, Michal Pecio wrote:
>>> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>>>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>>>> xhci is the one allocating the ring when adding an endpoint, and
>>>>> telling xHC hardware to write to that ring. It seems more
>>>>> approriate that xhci should be the one freeing the ring after it
>>>>> told xHC hardware to drop the endpoint, and there no longer is a
>>>>> risk on hardware accessing it.
>>>>
>>>> Hi Mathias,
>>>>
>>>> Sorry for the late response.  Was out last week.
>>>>
>>>> Specifically in the disconnect path (while audio offload is active),
>>>> when we utilize the usb_set_interface() path, it'll return early due
>>>> to the iface->unregistering check.  This would lead to the
>>>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>>>> handle the transfer ring cleanup.  This wouldn't work in the offload
>>>> situation, because qc_audio_offload is the only entity managing the
>>>> DMA pool, and that would be freed during the .disconnect callback,
>>>> which happens BEFORE xhci_free_dev().
>>
>> You are right, audio class driver .disconnect is called, driver unbound
>> and interface device gone before xhci_free_dev() is called.
>>
>> If sideband is unregistered as part of .disconnect callback it also means
>> ring/pool would be destroyed before xHC has dropped the endpoint/disabled
>> the slot. Would be better to free the ring after we know xHC controller
>> won't access it.
>>
>>>>
>>>> Would you be more inclined to prefer a solution where we can defer
>>>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>>>> adding another sideband notifier (sb->notify_client) enum to tell the
>>>> client driver that it can release the pool?
>>
>> sb->notify_client callback has the risk that this sideband entity is
>> unregistered and gone by the time we want to call it
>>
>> Deferring freeing the DMA poolby some kind of reference counting again adds
>> complexity, and maybe not a suitable solution for this issue.
>> (taking a reference at sideband register and every dma_pool_zalloc(), 
>> putting
>> when freeing or sideband unregister, finally freeing pool when reaching 
>> zero.)
>>
>> I'm trying to figure out a simpler solution.
>>
>> How about skipping dma pools completely for endpoints in these cases?
>> (page size over 4k with offloaded endpoints)
>>
>> Instead of sideband client creating a custom dma pool it could just set a
>> 'no dma pool' flag for the endpoint. xhci driver would allocate the
>> ring segments using dma_alloc_coherent() instead of dma_pool_zalloc() for
>> these, possibly even allocate a full page for each segment?
>> Freeing would be done similarly.
>>
>> Would this be a viable simple solution?
>>

Hi Mathias,

There is one difficulty I ran into, and that's w/ dma_free_coherent() not 
being able to be done in the current xhci_ring_free() context, as it is 
under atomic context.  I could move the dma memory ownership from xhci core 
to xhci sideband, which could probably get around this.

xHCI sideband will allocate the DMA backed memory then populate the 
new_ring reference.  Then when xhci_add_endpoint() --> xhci_endpoint_init() 
is run it'll check if new_ring is present, if not, follow the non offload 
path and allocate from xHCI segment pool.  Then on the sideband unregister 
path, we can handle the freeing of this DMA memory as well.  This kind of 
moves the memory operations from xHCI to xHCI sideband.  We would need to 
have a set of sideband specific ring alloc/free though.

Thanks
Wesley Cheng

> 
> I think so, this was something similar I proposed on v0:
> https://lore.kernel.org/all/20260824-16k_offload_v1_b4- 
> v1-0-49a6be60ca30@oss.qualcomm.com/
> 
> In that case, the client offload driver wasn't responsible for freeing 
> anything and that was all taken care of by xHCI core.  The sideband just 
> set the alignment_req.  Might need to make some adjustments after the 
> further discussions we've had.
> 
> Thanks
> Wesley Cheng
> 
>>>
>>> I'm not Mathias but my opinion is the same as always: none of these
>>> problems would exist if the sideband client allocated and freed all
>>> transfer/event ring memory, and xhci-sideband only owned a mapping.
>>>
>>> The mapping would be freed by xhci_sideband_unregister() or similar
>>> calls, which should ensure that the xHC stops using the rings, and
>>> memory would only be freed by the client driver after unregistering
>>> the sideband and stopping the coprocessor. Nothing is ever UAF or
>>> leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
>>> to get rid of some endpoint, it simply stops using the mapping and
>>> lets the sideband client clean it up two milliseconds later.
>>>
>>> One thing I'm not entirely sure about is how we could create this
>>> mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
>>> Documentation/core-api/dma-attributes.rst mentions possibility of
>>> using generic dma_map_() helpers on multiple devices, so maybe this
>>> can work, but I haven't seen existing examples of such use.
>>>
>> Could be an option, but maybe not for this specific issue.
>> It's a larger, complex change without any real need (yet).
>>
>> I'm hoping vendors would move away from this sideband implementation
>> instead of evolving it, adapting the 'xHCI Audio Sideband Capability'
>> defined in xHCI  specification section 7.9 instead.
>>
>> Thanks
>> Mathias
> 

