Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A653B27E3
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684898; cv=none; b=kQzfUUdI0y3m+3Mm6w13JkkaqZv5OHCrGnZUFHzvpUzX3IJptYZiB6YqWsZU1SQ1lvtqippo0V4Et3Wbc/+/kuAq7Ipli5MEK0Rzg7Mf0gv8Xv3HgrdU2GJ/LeLvmWmjs0eiC2X4EtQbuZFqFZNToZ9olsXT836yLsuyAzBVxuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684898; c=relaxed/simple;
	bh=SVIp1/ypegL3NavvfNvnqOgLYfPj8K94lMWHpRsBqDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcFDZGtukRlAtMzswa1EBCf/oDQodTObp73PAPUNb2wapl5SYSSYEQhChoQeMLBKeo0eJaNTW9F2+pXIFrjP0K/DVP3jgagegoOrE8DdS051tCFyvV2MHcvCvOzDbezfpifMwV8E5uFPlM/+W58j2lgjttH80q44Xl++J/WfgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfnL5Evg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZArpJHQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfnL5Evg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZArpJHQQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHfCSU2992665
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 19:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+VZQz1EO95LVa82uLNBtP4B0GN+MmEpuJbHIDvbjX8=; b=dfnL5EvgWT2qv0+0
	ntW3UQ7JqG5kOQXYGz+0IXUdJ0QlyUWHxYkv9ZWNLF/xCuci+6X8Rp7Q4tpZkWEY
	vYSexF366dt2sa/x1Y8WP+Jw9o4XuHPMJdAp2cDRWdNGZDahy70r5GfF1uWFgRp1
	KRJBpWQVRqVkdg0qrrxx0VFXv05gHd5Vh4RCuZ8YoQ6yxy80hBFNJEpEu8U4+uL7
	z1+KIIA/EdpyGhuyu0frHQF0Oib8m6FgKSsCQNJaLNjv42I+zBL6t6imY9Db78d2
	8d+n5VeRfWZppCcwvyaXtw+vNFo2cH7blEHBMd9MqBw3raP0Tkyx0RXeksgNm/wU
	uu09gA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr0cms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 19:08:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso3658895ad.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 12:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787684895; x=1788289695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+VZQz1EO95LVa82uLNBtP4B0GN+MmEpuJbHIDvbjX8=;
        b=ZArpJHQQ51qQ85Sr0ONAFf6K8ON2Z/2wpMJay4DsQAXnr38qVSZorZ2btROZVbZPFi
         GS4mLYpMOm85ulWKieGhlJcZf+Vp+R/aiGpwxlFawShKvSPv+FBck74XkSLlsO+icj9I
         mwXVjBmQQ3Fek7202rZVF+Zel3OMueC9D4GIcV2TI6+5PAPu23CIcHESRvqOIlm7PmPf
         nc0Zw0zEHROFGf1HLoJi458EOdGCU8hs4KDLTSp4G4n8FrKuY84ch0+KpwCtJCdh6XUI
         kSDQKZXObub19lcnhpbDoVWRrAgdT2Z8ESKgEPktjONhuebuXD4erdFxLiT0826MDWHs
         Wwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684895; x=1788289695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+VZQz1EO95LVa82uLNBtP4B0GN+MmEpuJbHIDvbjX8=;
        b=Krm95j3dPCs5NMrARg4f69BqHM8NVcknrJjF8C6HYrWOCOOyMHE4JVBM9gvGc8IbjK
         rVc74XpP6CybAXVrwJK3u/KK7Sw1t0qd55uY/rnwAnhOHyjH4GSLQ3UNHwT9euxKBSZD
         6Wzyrym3+/90nzPAnqq7qKkyiMd4XucZ9HDEeflCzyEiV1gk/Es9RJGJxMNNalWo8Ltx
         NsxFeFyCKUsCtOUNCdPYWLHWXx+AVs1n9Rvkby/QATXlOsnX/dcwfyLRAXdIj1QK2pTd
         5omv7eHCI8dZxXwx7IclVvQt93YSMYV1L9qf7Ykkz4jAk5twGI8FTImyfmu0qrdiW+NB
         +Zpw==
X-Forwarded-Encrypted: i=1; AHgh+RoSJeXHTTpTzhfTY8z+LO1t/DiwuRtoQy91QcPHsz2jpSKQjLUdu2Z5nL2/TX6D0jVrtIE2cTnRrQvBlw==@vger.kernel.org
X-Gm-Message-State: AFuF++nHr7bP/U+wBoEHgMrsdA/1uU5D4UWeExjaxRSmzHuWy1NRYfuI
	8oYI5je0/c9u4z4UJpUN7bkKvPgj6JIBU2/t2tMAkpT5kNq7FtC2KyoufuslDt3YJwE14iso86K
	lCwfw53mLtCIUKgCOTEAIjkTTs4kzVTvxcF6WMEJjgsqVYNSUFDIz6WPBFToEABvrhw==
X-Gm-Gg: AR+sD13+q7biw8zCEbgVLJiMYlGXNwM/VEuujg4anuIe5z8TIOwA/0Q6zyg6dKe+jwv
	8xjitjRqyQJk2c/hNflt3c8cD4ig3/HKL2qqLKj+YUSxPMeFOgdsddVDbzmFUZJPf+k85tkYbL+
	VH8RCUqolMlX96sKs1yGJetUcpWNAUnoz/eqGOPWRgw9wOJ3crDqvAqYtPiTdXHnSUFbOfUM2t8
	a+Y6e5cWhuK9MzqN7hfthQrrjEOz9HGpLs9OCyFVyb3AQmq0U5KySE0eA/Cc41QRr+SpkFz0k8g
	MvFkTonx2wauL7Z9sPPrC91GX0nGzsvos4ck5Tf16FAo1X9PtETzNlxmZAhVynBfT3k/YhnHNI8
	wNJtYrOl39ORqmwxbEgyhC92Dbpk/WRfgp+reZdF5XGrxtZ0=
X-Received: by 2002:a17:903:40c6:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d707b9ad9amr6997585ad.12.1787684893843;
        Tue, 25 Aug 2026 12:08:13 -0700 (PDT)
X-Received: by 2002:a17:903:40c6:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d707b9ad9amr6994405ad.12.1787684892301;
        Tue, 25 Aug 2026 12:08:12 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d7303a2sm1029362eec.10.2026.08.25.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 12:08:11 -0700 (PDT)
Message-ID: <25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:08:10 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
 <20260825094327.606072e9.michal.pecio@gmail.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260825094327.606072e9.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -0sHdbAo_IY0-fH4k_CjUv_-lL2JUHx1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfXzJUDIqHP1tzb
 sdzxZNEl9ewpF5by6NJLLdiSnCOfUxrpALB9R8vJOrr4HEGT9dtknQq8IHEtqVaWgHjJB7ytGKQ
 24bR4z67Mat2KvuJVzFs81VlUxredVk=
X-Proofpoint-ORIG-GUID: -0sHdbAo_IY0-fH4k_CjUv_-lL2JUHx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX7dU/ZB7QF+3m
 kzdAruiRcCoPqZfUDDkjS/zsDmP9OOYFAY1w3xrmM8SoR9rid7wOdEFuf2mBo9RZ3i7dcgdKHHP
 xZLN6hLZ2jMwyyolDRZvA3uXMXMRZUHCEKsiEKmKWqjDcKJK9z+BXWCnNB7QQIqSBzZJGyAvVfZ
 NHyF+bAmsPMnzempdboYt3VxLaQwkXEhS4uDj2SB6HwsGxzOmC7DC4EZ/w52swaQ+uzZdXArBOm
 8NrYt0OQkB3cpudXHhJsUc9y6GyjdduE37rFHOiSYPNB7wZp9gnFAn8uhA6LTE+/yA5B+SbKT7/
 6YVKpzxLghK2l3lxiMe5sVdiVVMoZKtmiRqT9AelXafbpeebTQGkxx/ZpWDB1c1BehzAwpsBJCW
 2d6v5nPR2fIsUVxPkAns1TvhsPCU91esAHwGAqmdts8wH0J+DbgIMWnCJr9Z/57BUfYpLEuK6kk
 RpeFzihFGed+ZEnpeyQ==
X-Authority-Analysis: v=2.4 cv=TvfWQjXh c=1 sm=1 tr=0 ts=6a8de81f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0ebt7_R2-KkC6wfP1x8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163



On 8/25/2026 12:43 AM, Michal Pecio wrote:
> Hi,
> 
> On Mon, 24 Aug 2026 19:06:54 -0700, Wesley Cheng wrote:
>> On some environments, 16kB pages can be enabled from the Linux subsystem,
>> which manages the IOMMU mappings for the audio DSP within the system.  In
>> the current design, the following assumptions break when 16k pages are
>> utilized:
>>    1. xHCI ring size is equal to PAGE_SIZE
>>    2. Ring addresses start at the beginning of a page
> 
> FYI it's worse than you think - xhci_ring_to_sgtable() returns wrong
> data and uses some allocation out of bounds on these systems. Quickly
> scanning through the patch I haven't noticed any changes there.
> 

Hi Michal,

Thanks for the review.

I had a tidbit that I tested that addressed an OOB condition, but as it 
currently stands, that API should be working properly, if TRB segment size 
== page size.  Hence, why I left it out as a change.

The OOB condition I saw was that when 16k pages were used (w/o this 
series), since specified rings can exist at a page offset, that offset 
information is never populated, so we might be mapping the incorrect range.

Regardless, I'll introduce that change in the next revision, since that's 
information that shouldn't be left out.

>> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
>> set with a 16k granular, which is a problem, as several xHCI rings could
>> exist on the same page.  This is because the rings are currently allocated
>> from the segment_pool.  Hence, potentially mapping non USB audio related
>> rings into the region accessible by the audio DSP.
> 
> If that's a security or reliability concern, perhaps each sideband
> instance should create its own DMA pool, as opposed to allocating every
> ring segment on a separate page?
> 

This is an interesting suggestion.  Let me take a look at it more and get 
back to you.

Thanks
Wesley Cheng

> I suppose each 'xhci_ring' could keep a pointer to its segment pool and
> things would work for everyone, with very few changes.
> 
> Regards,
> Michal

