Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9C1D9A70
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 00:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025068; cv=none; b=Lktnn3zNhzu5EJWHTfsq1noUjoavP8ySEESHGyl6I7ZphzWN9LInQDLgbrejecfk1scwPfCvdUDT1hRZBVgWn40gYtyMsfUFHY4FxFqwGNokvItNgiM27U2hGFS1xAnf7veh5GP9KeLv9cm0lLhcm+jKFKZQNRx8gDbiPCnB6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025068; c=relaxed/simple;
	bh=Am1zJrn9JDhl3VNyJyMRi/vW0Nz9xOEmi/5uPEvS7GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkxHZqlWVJMaM8OQw7gsGi7UqQgojzqCLgi12OogAQCAj0YBXOfI61MRh90+TGfALFqgpdeIvAfi6FSTwuCavJviID1X0pJqpd7DRvlFTLkM1n/B0VF8S2MkHSWw2RizmVUXMqvTXhnXWEvu6jrbJ4q4XJ3bgTnh+7vjPMsKGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OppX0DSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cj308ehm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OppX0DSr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cj308ehm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENJagZ500328
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 00:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwLvIv226Kbz3Mldv+ppT8nWCp7iwfoRCP3ii8p0yZA=; b=OppX0DSr1y+EdrxL
	hQ53BDmahnAmCSDCDDZGm8/Mz2kpeAeqAoor/0xWh2mnzpTk7U1ANH6OZLcd2iVJ
	xh4XILsG7jaFV4vY95YKadp0vMlBqMzromZAyfqyLovZXcdF5DXLWrh1wUcuWLc6
	89AeZ/5Q8WVZW70aqvknq8tZMeAdwF7+t6RmuGcgOqiYx0s/AQxXLqqkYr2HV/UH
	tEjKXZnWqxdnpS+a1Qqi/KpCbdViuiWbYcCwWvjVS3b0NaSGoXVCmTHD8iZ018fp
	tfe4ATrMPiEXGxjwQm6mOiLx1vR4tNn/3nDJPcygrh2MTVkqGgddWoCs/o/Yi6zK
	wPDYQA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf2duf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 00:44:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so4944086eec.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792025066; x=1792629866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwLvIv226Kbz3Mldv+ppT8nWCp7iwfoRCP3ii8p0yZA=;
        b=Cj308ehmGm6PcUsT+wuhlNk+JBlFyCWT7fwZuXFnOmLIgoEBTGIJ3bXCl2ULuAsjKZ
         kOchhixPPsAwO7XLXxDnAOvIxjK8gg1IZIdoF4kcrm2qd3xRyWl/kGErvhL5J/M9ILmV
         rZxA6ttqi/mQ5+MOvOtMAFBpvUpE2OAAHB5AzZk6oBSxj+iEawL80JMnszeyDtvC5F4C
         lJfv38AS/miKyJMy/j+K8drYnlmljOA98x50w3zWf/OJYwz5s0heOI3c1ZPWwGTUWDnM
         FDPAuVQOBeWZWEGqsZ8+dUVM1ciu6OYwKj4CQHJIQneX8+rfXzXIPIiQ6x00axgLFkgu
         F9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025066; x=1792629866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwLvIv226Kbz3Mldv+ppT8nWCp7iwfoRCP3ii8p0yZA=;
        b=aW7bd1PszPGNi/hH2fOKa9Z3tEy2ADUNQLGBIdGX9P80wlrAsebB4HX3U+gHfQFBOn
         3zqXF21A852FcEGboLy2ukEYlqUFEYTxSWWRToWSWVSg3Nnjldrju/JkjMOxjtldlvJn
         3Ob7iCv19yNq5xKxPAu8bUYm00LSiyhDCM2D+dWbPX/A2gOUm1+Nk5CFopTCPOEwt9Ob
         umd/OluZ/WpKYR7uYEJ70YgQXD0AVG7L5OYQBUXMhqcX8VaD6Ogm3zOp+Iy0KPHY+UU2
         HeHgoAhX8zNlhLSU3e2xYnQf8/ANDXA8P+FP8qXXzQsk/uVKHr9M27HHgCK/4dru136W
         GKAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYgH+667yIACE5XNBBIvmRnAXPuJNqAkdatYDfM1WQJ31zo+I7TqsAPICX6r0vMcU/9q2eDu5Uiz+LrQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgxNmDnZaRfGLxLGvKTp81tNfe3O+4Y7PRg0zYvps1s8tCWAbn
	jxrvTn3kHfReb4LD7TAzFCc0mhvzYhkmGWzfGFnLwik0kFBpokkhcAkyyXFdvEWhDE8RZoXPnUW
	X7OTrfgXs2CCCagDmHwQbdzjmX07wAPpgR3gEX7A5M/WtG066Oq6Ye8xrAM92iQN+cw==
X-Gm-Gg: AYBFou2JMw8w+AZiHLYs8oz/qMerJ3bclrfjU+3AMcnRsGfXTI54TNmSxGif0d4Dx7E
	Cy9rxU1RgSfPFHPh0uHEgcr8lJqNDTJi9AzjzEJ8sdKxxUiuUBjWhNbl5iW6+ND6ZENIPiMF5yR
	5ug5TR92spolfRi8a3nxSN0SjK4JQmsFDJ7vzWKIs/t6iChb+hP8Af865nD3IgvLKvU9SErv/jo
	NHtKiTq1uVtT0Tlq0/cOfrI4c+dfk3CnhAo184o24zymywUO8RxOzVyHkUw3HTlz1515Lv1clus
	9Og6I8+4bIUmyx6NeU+yLBpWwNpjoO1+RisWeJjfpZL7J6LPliRkmKHYoGzefc4QlQdBhU+QL9z
	CKwwAgnNcTOxj0b5dFIdF/eTIjwdu2YC42U8nEEegihpYD6g=
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr24842335eec.23.1792025065623;
        Wed, 14 Oct 2026 17:44:25 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr24842296eec.23.1792025064843;
        Wed, 14 Oct 2026 17:44:24 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm62458917eec.0.2026.10.14.17.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 17:44:24 -0700 (PDT)
Message-ID: <5a60513e-9d39-4cbe-9f2b-dde8ca71a8a3@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:44:23 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
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
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <73096f91-146a-4754-a685-f3b22f1ac3d5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX7ZAZcWC/3Mm3
 8RgtnIwtROssd/oSJM20iV2k43ww381fpW/urSp1Iu54RvHKFj+fQs/K0IBPPLT0uQrhlH0AsRE
 hKp3mlD1sraTmMbAYkZis0r/ODcv7Z7pI8d4Fd7uLTvNdItNM+F2uKuYj7Ny+7shAi7EoPD1pFk
 HCjboUB3dAE6jRFSnHrqPYN8jnGoxkDuG3znQtiH1+EieM8qLBa6PG66N7YRXN3N1C9v/+sdg81
 60bC0Q6S5MO6/vpmfkDBGfe4Icrbb1S4mOm09gcPT5tLIoPrFz0SxJZKqzmUqz/0SpYmZKlZWOj
 HkiS8efUBrmoQbBWAXMLfE0pngi/1++w5xfwefj1uv05jci69ZQkBkhyEH4iiiidfscHmVMePZ7
 qB2va+bipEvFM1trKPINUGF8mIQJOIaB/un8LK/BUXJUulncTnmtfd9YD1v0KsrdRKZXOs411QG
 jfKFlMIB1JP7/eHlNKQ==
X-Proofpoint-GUID: ix4LhAxODGOjHOVo6wjcgnkuu3Iz76pf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX35BoEc5wiy8N
 ltA++ZRwCjGyMhqOgt8nzaxqr8wXzre3RyFuN4UTsKBAVgXSYWhY2O93yFH3v4F+I6j8dSB6c8z
 BfLYYx8HpMlzbBw71PamfDi+zFYXiHw=
X-Proofpoint-ORIG-GUID: ix4LhAxODGOjHOVo6wjcgnkuu3Iz76pf
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad021ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZtxY5wSq_RZQGLwgOdYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150001



On 10/14/2026 7:26 AM, Mathias Nyman wrote:
> On 10/13/26 12:11, Michal Pecio wrote:
>> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>>> xhci is the one allocating the ring when adding an endpoint, and
>>>> telling xHC hardware to write to that ring. It seems more
>>>> approriate that xhci should be the one freeing the ring after it
>>>> told xHC hardware to drop the endpoint, and there no longer is a
>>>> risk on hardware accessing it.
>>>
>>> Hi Mathias,
>>>
>>> Sorry for the late response.  Was out last week.
>>>
>>> Specifically in the disconnect path (while audio offload is active),
>>> when we utilize the usb_set_interface() path, it'll return early due
>>> to the iface->unregistering check.  This would lead to the
>>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>>> handle the transfer ring cleanup.  This wouldn't work in the offload
>>> situation, because qc_audio_offload is the only entity managing the
>>> DMA pool, and that would be freed during the .disconnect callback,
>>> which happens BEFORE xhci_free_dev().
> 
> You are right, audio class driver .disconnect is called, driver unbound
> and interface device gone before xhci_free_dev() is called.
> 
> If sideband is unregistered as part of .disconnect callback it also means
> ring/pool would be destroyed before xHC has dropped the endpoint/disabled
> the slot. Would be better to free the ring after we know xHC controller
> won't access it.
> 
>>>
>>> Would you be more inclined to prefer a solution where we can defer
>>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>>> adding another sideband notifier (sb->notify_client) enum to tell the
>>> client driver that it can release the pool?
> 
> sb->notify_client callback has the risk that this sideband entity is
> unregistered and gone by the time we want to call it
> 
> Deferring freeing the DMA poolby some kind of reference counting again adds
> complexity, and maybe not a suitable solution for this issue.
> (taking a reference at sideband register and every dma_pool_zalloc(), putting
> when freeing or sideband unregister, finally freeing pool when reaching zero.)
> 
> I'm trying to figure out a simpler solution.
> 
> How about skipping dma pools completely for endpoints in these cases?
> (page size over 4k with offloaded endpoints)
> 
> Instead of sideband client creating a custom dma pool it could just set a
> 'no dma pool' flag for the endpoint. xhci driver would allocate the
> ring segments using dma_alloc_coherent() instead of dma_pool_zalloc() for
> these, possibly even allocate a full page for each segment?
> Freeing would be done similarly.
> 
> Would this be a viable simple solution?
> 

I think so, this was something similar I proposed on v0:
https://lore.kernel.org/all/20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com/

In that case, the client offload driver wasn't responsible for freeing 
anything and that was all taken care of by xHCI core.  The sideband just 
set the alignment_req.  Might need to make some adjustments after the 
further discussions we've had.

Thanks
Wesley Cheng

>>
>> I'm not Mathias but my opinion is the same as always: none of these
>> problems would exist if the sideband client allocated and freed all
>> transfer/event ring memory, and xhci-sideband only owned a mapping.
>>
>> The mapping would be freed by xhci_sideband_unregister() or similar
>> calls, which should ensure that the xHC stops using the rings, and
>> memory would only be freed by the client driver after unregistering
>> the sideband and stopping the coprocessor. Nothing is ever UAF or
>> leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
>> to get rid of some endpoint, it simply stops using the mapping and
>> lets the sideband client clean it up two milliseconds later.
>>
>> One thing I'm not entirely sure about is how we could create this
>> mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
>> Documentation/core-api/dma-attributes.rst mentions possibility of
>> using generic dma_map_() helpers on multiple devices, so maybe this
>> can work, but I haven't seen existing examples of such use.
>>
> Could be an option, but maybe not for this specific issue.
> It's a larger, complex change without any real need (yet).
> 
> I'm hoping vendors would move away from this sideband implementation
> instead of evolving it, adapting the 'xHCI Audio Sideband Capability'
> defined in xHCI  specification section 7.9 instead.
> 
> Thanks
> Mathias

