Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903550;
	b=wcz+cDed0Iu3DD4GblEeCoe/N/llWSjUDqxnRXFppq+ygKeBjKE6F5i/VZy+ozhHBR8Z
	 KaybR/l0RBEVMqa1LAHhmdfQFdemFVpAGF6GzPbfzlcEhRAZhKVxXttw6KQgdzaMktv8L
	 wpZoofJxfwRvqs2Q2zwzK6w9tMq4YRqProVWgQCk7rCfuQdIv9XpBUGxKzQl1FoGapPB0
	 PQSxcrmbkiNEVMaGur/081Wx3RXRnGGy/IxIcXWO6mRV/7i+QlApJP54TJuNBrdGtzZlF
	 Yn2dUgIGymn7gzCz+3Gg3w8sFh9dKdIIeBhZ070e6qQvh03yRoBTd6Q1IBpa/rCObGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
	b=lxuhr25wzLRstmYfkVyHiGLjWGSL4PDyovC1KipYVsFEUmqSdRZofaf1G7AvlkXGjCSV
	 75z4KP/2zRBALOtxKGSevioEnXx9p3H4XM/yJEbCeMqgCl0d4udW0r2n1v6OFI2qUSFnU
	 R/HIYV/cldUyRND6ztdvc997qisGGkHaO8/Wvg4CKcNgv8Vy9LBYAKBpNEJUaFLbceU2t
	 cTM+8xRLznWzbcGrK6P5JG6jCAejgaRjqx+R6AhpkxIHzOzWygF24Jlag21nv+r0Lu3YD
	 7WGzRmYupDyPsCPv71h1zse7EynxPFXnVwBm22AbKgv6ltvi4Rxq23/DcFfu2+OPAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHZGUf2p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKOrbTZI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B6606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHZGUf2p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKOrbTZI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exv72998571
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=; b=JHZGUf2paxYzYRD8
	3IRgYDgQDh1ETHF24DfSjYaCnkKVRtZglxeHpj5uxZ2xz5HnaSbG9YdHmC9NzJI7
	x11hKhWjnpCU27JUdJUU6fc8BigqcgDn/lpKBSdLjqO8hfkB+KCq4pEG2dfxJK4S
	h6NbeciHn5RXapzceCUlUzMunF5RaZp9ra1KDIWz/917PVAILQ9qMqn8WCVWyQtV
	llsbxrZiPt9v0zGPsEWD8TSDtvBdDv+rMhhE/Uo6NR35LCd7mzl7iXPwNN+JIcXI
	RRwzLpBxLOtjlrQVs+ABKOvXvbapdKPHU+ghOnOJ8KMS9QenTt+2C56DuALiL6cj
	W7gRXA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0cfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08903566dso545037b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 00:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903548; x=1795508348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
        b=TKOrbTZIO3rlsAKlnkR6J9ZJNpFTIBmGeRZMTN3EWbm/f8RgEphImG4Uv7NVlNnKf/
         QXq27j3nX2teB7YVjEulLto/ron0gKZfynKVvRZLWUGJUTa4VRlrmh1Z74Y+2evrzXQa
         tKPFY6EluG62mfMYbHKHUpyY5y2SpGKFuCCMlMIUpjk8x1dUg0KlS3b7vljgLJjIm6w9
         Kz2GECe2IXKvphOV4BuDdU4Lm6CPP1Wow60Jfdu12aEmGPR4qbgSH9iNXS1wnVjSztVl
         Ysjf54svOCLqyOHvRZ9pG0kyZ5ye8cgqeqvaMs2LwIIr45d0PAYXEgoiqDQtOScIXXRj
         moag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903548; x=1795508348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
        b=si2UyxaS4Rmqhta8+E96SWWGND2cZf91D4Fb5t6oTb/D7izP6cYcD46+h7REfuEKyt
         +ae6RixuM69FyRguSBGqRb5/9Zds9o0N95dBxbEEEfiF8LFiDrpA+BKbeyhIKZ7vcHe8
         9Wds54QaAT3ZZfDC5TUYa259XvI1bdiIuEVpk6ThrrOM87Zl8CHaxtyj5uePHaT6wJFr
         uvmgxnNSLz3neKaEHNB6gMNGgpPbdD/c2H5qTBFlC+vL1n0lqNb+5M1BGFkiRro2Dq/o
         SbLkU9L3CIL9SYOqRg+aWYWjGmphBJPBybrH/oY/HFm1Fa4ChgE3eClUlrE4cBcwJY/E
         4RMA==
X-Forwarded-Encrypted: i=1; AL+hErHuw5YDkOrIJoOEwUFaAA6oN0BbRmIBk7nSPefNyQ8v37s8+KN0Dlvdboe6PlFQIGXvlx58ZGEkvFn/qQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EItZljGRyuOHi2RKqwsbByxeluM5c2xwj8Oa4JkwP6vpc1iN/
	uGp40ipVJCfexxen8XUOQMVWs4Yn4f71UAOONiun7I4oO0LPJx2YgDCEKZ2hf7fZhV/R+rHqIJ/
	IDAJok/HgHZ1pPCOfjAEsC1jmuvxQQDphNDbbc6UwxdUCSvLvhFV1MDDLhbNfrn5d9g==
X-Gm-Gg: AYBFou2e6BTxhtpKMxMmFqHRaeom5m+0Sz3GExJOP8mrmEYoWZWe/RMT/DTqPV9RmQE
	bS4heTg2RDUI1lblaB3eVbsr1ekeBvt/Up9gab6U8bZ5ohMwietbEJS8F2Ts8WWGCljE2BD1LvH
	qTJX5nc86SL5YKo3e8w27/RbIwG0otrQKZ+uE9SsoeUEgLl2YxPOQz+CvTcF8mvdjuSzi/cdI8Z
	QXW+bNyBRKZe01/wTZ7+hFd5RKogdz/S9iyin2QHr3HCoaNcDCrJDOohPUz/v4Ax4g7oIqSqZQl
	0r5POfYNBevvKrf8WVBlY3OAYhKGsH6fufmp3MK91Fqbo72ZwF7/NmPlNCCCBgieuIJVY8KnhZt
	EQPDTxb38wrNCHk4Ovvq/l+ek6dlKwUfSNOjhAnC02ybQv/Ob0USP62KuH9/cZbhJR8dfx6nfOr
	gW+Yw=
X-Received: by 2002:a05:6a20:d090:b0:3f8:9fb1:211b with SMTP id adf61e73a8af0-3fd2a5f42ccmr1450196637.11.1794903548446;
        Tue, 17 Nov 2026 00:19:08 -0800 (PST)
X-Received: by 2002:a05:6a20:d090:b0:3f8:9fb1:211b with SMTP id adf61e73a8af0-3fd2a5f42ccmr1450168637.11.1794903547880;
        Tue, 17 Nov 2026 00:19:07 -0800 (PST)
Received: from [192.168.1.26] ([76.167.124.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm4729678b3a.36.2026.11.17.00.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:19:07 -0800 (PST)
Message-ID: <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 00:19:06 -0800
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
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX8D5ITIzdf3sx
 FfbMRXyngCNZ1oJ1DGLNjAR0bEd42b2dypiTmo0nfbAg+N5Pmja0nrtzDGM8ZRILdstImWTeEHK
 dy2+Jx7IiRINgQsI9xnIVPwdMIyTqgE=
X-Proofpoint-GUID: U9djeQeNxJi_xwywQe2ps78llDeMV-UL
X-Proofpoint-ORIG-GUID: U9djeQeNxJi_xwywQe2ps78llDeMV-UL
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc0dfd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=jLiqPQF7yFVFeg7DRIoZ9g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=oWt3uI2Zhp6YPFwEOV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX32c7Emc+7Qhe
 tXPty2VQst41CweiGOpuWa5j9/DunDP/V7QxZwIz9yo4Ncu1p517H7wwnjlIB4aXaNKJa/gbtVA
 iMPYxR1c883L6GboORSzP7YwV4d0O//VCpDTfLpivMeF+xgcLWhlMFqRmRZWUvp8QEr1BZ6OMr1
 gvxkTIqtzvUr3+nAkfwUuPYcYeOIoQBNhN9NMikDbvp97pX1zICso2lOTzbkZf1eG15BUr5RPez
 JJCskEQDfoNQN11KlFysM9uhOuuLitp0mjY4w/k8J8ylJiA0IoKRYTTPcqGgGHS5reI6f+IpZfL
 JZlvPyK7oTsur8iDhx03X1zRjBTANV6RYg6jzXhaSkkdwsz6seMx1YxSghHZ19pEiRcirNAYcET
 pp4f1KBXtyhH3mzPKzgA5LS+EMw0ztUCuy8pZB2XQ1j2OSugKVVGn2+nPn9xD6GZd8c+c4vvH0e
 LkLnwW6tNtsenhjKz3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032



On 11/9/2026 6:38 PM, Wesley Cheng wrote:
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>    1. xHCI ring size is equal to PAGE_SIZE
>    2. Ring addresses start at the beginning of a page
> 
> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.
> 
> To mitigate this, sideband rings are no longer allocated from the
> segment_pool.  When PAGE_SIZE is larger than TRB_SEGMENT_SIZE, xHCI
> allocates the segments of sideband-tagged endpoint rings, and of the
> sideband secondary event ring, using dma_alloc_coherent(), which gives
> each segment a page of its own.  Before the USB audio offload path is
> enabled, the USB audio data streams/endpoint are not active.  Only when
> the class driver issues a usb_set_interface() call (done from
> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
> resources.  The offload client driver therefore tags the endpoints with
> xhci_sideband_add_endpoint() before that point.  The new ring allocation
> flow for sideband/offload clients will be as follows:
> 
> handle_uaudio_stream_req()
>    ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE
>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_add_endpoint()
>    │                                                 ▼
>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>    │            new_ring = __xhci_ring_alloc(..., ep->no_pool_alloc, ...)
>    │            ▼
>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>    │            ▼
>    │            xhci_segment_alloc(xhci, max_packet, num, ring->no_pool_alloc, flags)
>    │            seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags)
>    ▼
> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
> 

Hi Mathias,

Was wondering if this design looked a bit more acceptable?  Was able to 
figure out a way to achieve what you had suggested earlier mitigating the 
dma free problem I mentioned in my previous email.  If there are any issues 
w/ this please let me know.

Thanks
Wesley Cheng

