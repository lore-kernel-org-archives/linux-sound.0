Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB21437C113
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684955; cv=none; b=bt+lDn30z7A394I/zc6c7Xnd6p48zhdnK04pq6+iE0ZShG1TkMPjxX5/aVMUEJzBP/PaBkRbkKCCmraPDUd4oMCy9tX6oOvT36/7q5dklTP2OTqawSu0rJHAFfL5xRFcP8szNz8iaoGiQFoX1KzPU3bD2A5pS8OAL+zgei7RGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684955; c=relaxed/simple;
	bh=54fx7/1MhDCKQgMrG6dJOr+lw4T2NnxLn8gzlzkgMq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/qJ8UxCDhiVRr4BvJJXBW7wuCI3s7EcMaMVmT5YImax7Jyt7/FIUPSRLyox9aLJ02wtabXu2tNb0P1/htczHdGRRZ4Kir7yP/ZalLcBNEPSXrruu4d2xgfQOF9V1HNtMHgzDxctnSTYe6wBCUu1hYutcbb5DEWwSzGxnvnmSfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=el4jWjve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6LjY5ZQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="el4jWjve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6LjY5ZQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdNn21472534
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 19:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhQeQs6iukOPc54XzBtdmkp7GWu3IZZHouTapaF13WM=; b=el4jWjve8Wz0IOGo
	i42UC51PHw5jIQtWHHdRgRx4muDCOFCueVj+Zp9SdVpC5hzcSwOYBH0d91JS8VSD
	2P7WxkFIoNeqtvxhp/DiHnW7KMhN1IY6vAZDl+aj16qUGT60qxa4vNXIffRw95V6
	Z74lhF998N8Oz+MM2wmul2xsVwkCqpo39W+4zatnh/nrDDq2i6LnyzuFvObfHF5v
	Gs1+fSV9UC4c9Q6yoSCKfaVigoqYaT8By+OaD/LSgnx9nCm/uxNHaUxHor5o/H1F
	k1ibOpo7tEuUGPCz2umFgWYtUxp2Bk0jPi3H6+NeGMAmoFfETGoXXaGQp15tVD3K
	mM1oUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9urf7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 19:09:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so2227345ad.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787684951; x=1788289751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhQeQs6iukOPc54XzBtdmkp7GWu3IZZHouTapaF13WM=;
        b=A6LjY5ZQEOaA3chaQ+SP2fRZ7LsVlPqvs9cqEfp2WbEyvB8GhN5J6ssCtVtLBUC6EQ
         Fg+mQErK8WMD5QXDdIvO7n6WLPNJaoSIbsieR5HeeL2t1AfPfniilzY5hzjA165XPYFn
         T1PNFl0FbAjeaw7Odt6bClcTDxMMnMh+jJpXOAnLT10nqDhE7qTXPDxf/b8zlNxJ3cBv
         5rwOzNT15YIYtJGy2oLA5pAOlJkzsyTeYxotD5HCuq5Tt3C6ZC1LLnrYpdwIr09bFNHQ
         7/9IgMg/4Cu4SZWlJrDzsrb7wjp/FdfRukFa0GsOYIEBLxGPkbiDCB2OfZBzF5O1dmZs
         Lh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684951; x=1788289751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhQeQs6iukOPc54XzBtdmkp7GWu3IZZHouTapaF13WM=;
        b=WJ6dzFDlVX836yV5gtIJ57Rb2C6zYI0zP2UVqq146cu9HGgn6Y7+qo6dNXYpCMNPRZ
         AzSFwMNzvRHFTZPlJ/jb6wpDdo7OVpO+0SLxt5riruG79stitEjiuNWMYbp+hLHPL112
         PhKLQDRT5s8Tf/PuyrdqWGdYE6OB53I1Bo2pagMvMPHutP2j/Dal+0p5KWg072801es5
         qBapf/XBoQBnKHeB1Fx6YVdJcl3+pbmqnB7k8Kd/PBL0fjgmMkX6ViSGanHfT6hYYc5K
         jru41tYeE2rbTXGK8K8nPMogzGRqjJvp9l+a7RgsqOspcJgXum6NUvW6IC3++LvqBagW
         nH4g==
X-Forwarded-Encrypted: i=1; AHgh+RrSzpHllPSF+B9is8K+cMv5kGvSdgHx3ACixVluPMzeKcwBKrI+wEjPIRD1ul5/yhmB4WG0ODm2Nlp5og==@vger.kernel.org
X-Gm-Message-State: AFuF++krRcdX1bM1kJjAQGYl7AG5rzhS+UkFhiRmE2q/HsGb3A/BaWl+
	FIUhVxNMTQimcO5sRG9RB9ZmmjhwZiJTo/f2C8A6hHbrt9cWpmqjx+xt6jYzrXdJVUWF/ZVSQJ0
	2deyxngEDbKMriSOiXQ9tkQn9R9fYuacZ6OahjwskE2+a4Hws7YKLuFHAH/BSKHIKSA==
X-Gm-Gg: AR+sD123ZfKZ6cBBD38rDyouws9h6AQkvHrtUi17wPtTICsD4HMLMqj/RMM9h7GcrGW
	bbTexkBAib85ZHTswZt98LMCWORzcDTXs3BnVeDW9s3ztY4quTf0ZG0ba51OGDrpzi4TqWj4MZi
	FuQMUfmf5VmF4oWxErG1eVngvqZr+BHh2HVXLNz2mVKWOofJzlA/nO2vBKimmXkTyOJRCJUQQAW
	RpOawtw0CEukDNM/Oa/gXRf5GEXNv1N9dmitm1HytiDZ+SwsapQgR0LfJyP2dXeFt3vHpSZQa7q
	EdzoBsxJNEw7I9+eIO63e8HEePWWFBKsee62WuOlXVrjL3rlXSJ3UOQzckX7DJZXoArWldSsEuR
	TfU86v4nubuUEJE2s8fNwonJlWdfZmE9Q//Jl0fNLPkQMyVA=
X-Received: by 2002:a05:6a20:20c3:b0:3cd:20e4:2aad with SMTP id adf61e73a8af0-3cf7596a64fmr1339901637.4.1787684951522;
        Tue, 25 Aug 2026 12:09:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:20c3:b0:3cd:20e4:2aad with SMTP id adf61e73a8af0-3cf7596a64fmr1339796637.4.1787684951025;
        Tue, 25 Aug 2026 12:09:11 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d730c57sm1091912eec.12.2026.08.25.12.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 12:09:10 -0700 (PDT)
Message-ID: <cba2704c-b3c9-4f61-8852-9799a1a8b7d0@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:09:09 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
To: Takashi Iwai <tiwai@suse.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
 <87o6eqsbgu.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <87o6eqsbgu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2JYntSqoKSGLOINflYOSSstnAj8esgct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX3pcTHdT5pmPC
 6lnrJ8VqJQVPnKFkJE2KR4Gew6SGI/dTPRa71CXCMnGJMnJYdg8b+o+F01G2094pUboae4XkluJ
 +FVeqIGOv/JePdvwImCCr7O2Xo73JYmUDj65USd+hfpYAas8pukGXvXhZCoMTavDpc5MhkxUeWS
 YnAK/iF3+l2j1HZJ1heJ4Hvo/bc7hvlodfrMPmxbieKI0UUOQiKSpVgUMeKsyBGbTqXZ5Y1RwCa
 n8Ncixq5UDaV4QtiHSQu+zNK+9GGxpw2+pLBn8VoC+nf2oMxqsV9n+sqLAN2W2S8yP935Sq1lrT
 dYiw0b+kfn8Ji4XnENukYbZI+36qup16CcgUPE6YT+ldxLUB3Gu+/MLYrutgNZMI/VGOBkTPFBH
 wLzV3SUEy11moOSDzRsDO9ifc5BJdCBiPKXY6QaN7pjF4f1i76++Ei/7Q1FSihdsdlSUfXJBjhI
 0dJnt862KJ55QzgTtOg==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8de858 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5kBUKlsEpMLtOZ44VFUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX0HI2bFdfxY4D
 6RWXoOnb9DwsbE5hvDGk3jr+iePiI2tp8X3sTPgJd1sjhnNVfPRrQIs3QwtRJFcwze6ryWfwpJ2
 Cb4tJS3tquswjMq8avYuKDG52z/mlcU=
X-Proofpoint-ORIG-GUID: 2JYntSqoKSGLOINflYOSSstnAj8esgct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163



On 8/25/2026 4:09 AM, Takashi Iwai wrote:
> On Tue, 25 Aug 2026 04:06:54 +0200,
> Wesley Cheng wrote:
>>
>> On some environments, 16kB pages can be enabled from the Linux subsystem,
>> which manages the IOMMU mappings for the audio DSP within the system.  In
>> the current design, the following assumptions break when 16k pages are
>> utilized:
>>    1. xHCI ring size is equal to PAGE_SIZE
>>    2. Ring addresses start at the beginning of a page
>>
>> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
>> set with a 16k granular, which is a problem, as several xHCI rings could
>> exist on the same page.  This is because the rings are currently allocated
>> from the segment_pool.  Hence, potentially mapping non USB audio related
>> rings into the region accessible by the audio DSP.
>>
>> To mitigate this, this series introduces the alignment_req parameter.
>> Before the USB audio offload path is enabled, the USB audio data
>> streams/endpoint are not active.  Only when the class driver issues a
>> usb_set_interface() call (done from snd_usb_endpoint_prepare()), will the
>> xHCI allocate the transfer ring resources.  By setting the alignment_req
>> beforehand, when allocating the ring segment, it can fulfill the audio DSP
>> alignment requirements by allocating DMA-able memory on the fly (based on
>> what is being requested) versus fetching it from the segment pool.
>> Likewise, keep track of if memory was dynamically allocated to handle the
>> free path properly.  The function call flow will now look like the
>> following:
>>
>> handle_uaudio_stream_req()
>>    │
>>    ▼
>> enable_audio_stream(subs, ..., pcm_card_num)
>>    │
>>    ├─ xhci_sideband_add_endpoint(sb, data_ep, PAGE_SIZE)
>>    │    │  alignment_req == PAGE_SIZE
>>    │    ▼
>>    │  sb->alignment_req = alignment_req
>>    │
>>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)
>>    │     → xhci_check_bandwidth() → xhci_endpoint_init())
>>    │    ▼
>>    xhci_endpoint_init(..., ep_index, ...)
>>    │    if (sideband && sideband->alignment_req)
>>    │        new_ring = xhci_ring_alloc(xhci, 2, ring_type, max_packet,
>>    │                                    sideband->alignment_req, mem_flags)
>>    │    ▼
>>    xhci_ring_alloc(..., alignment_req, ...)
>>    │    ring->alignment_req = alignment_req
>>    │    ▼
>>    xhci_alloc_segments_for_ring(xhci, ring, flags)
>>    │    xhci_segment_alloc(xhci, ..., ring->alignment_req, flags)
>>    │    ▼
>>    xhci_segment_alloc(..., alignment_req, flags)
>>         if (alignment_req > TRB_SEGMENT_SIZE)
>>             seg->trbs = dma_alloc_coherent(dev, alignment_req, &dma, flags)
>>         else
>>             seg->trbs = dma_pool_zalloc(xhci->segment_pool, ...)
>>
>> Similar logic is added for the secondary interrupter path as well.  The USB
>> offload class driver calls xhci_sideband_create_interrupter(), which will
>> be responsible for allocating the secondary event ring.  The same
>> alignment_req parameter is passed, and during xHCI event ring creation, the
>> same set of APIs are utilized, so the runtime memory allocation is already
>> handled.
>>
>> This was confirmed to work on the SM8350 MTP platform, with the
>> CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:
>>
>> tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
>> tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card)
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>> Wesley Cheng (2):
>>        xhci: sideband: support page-aligned ring segment allocation
>>        ALSA: usb-audio: qcom: request page-aligned xHCI ring buffers
> 
> I guess your first patch alone breaks the build, and this is bad for
> bisection.  When you change the API, the callers should be addressed
> in the same commit altogether in order to keep the stuff working
> during the transition.
> 

Hi Takashi,

Understood, I will figure out how to adjust these patches so that 
incremental builds don't break on the next revision.

Thanks
Wesley Cheng

> 
> thanks,
> 
> Takashi

