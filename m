Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB053E8675
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846477; cv=none; b=LEwfI5QzzLZ+00H2Qetg6lvhGEaKQpBVygYKNlYksNY/09LdBiId8ur0RRnuYFPSIsHD47BVSLe1cRAHc7uDU296S2xDJPm6TYp8GdY4k6+C2huUpC4Wqcl7u/KawXThbuBOzUSoNNIEEcNZw82vAKARj/IPGdL3hHNmbl4NZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846477; c=relaxed/simple;
	bh=q2j0Uk9SIIPpPUuH8MOC0yNBIbfAyJx9hZoaDzseNb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJM/ULrluUaRY02YYDCMWB225py4qABvCOGNEnl/+/TxB45hE9Wlz5lzpC3H86sJFaP/CwlapagP2f4uNfv+WKXhYrAUuZcfwEc0+E1Ddnyy+pr7WmOOAIk+d4cp/V3ZA0m0lHL+peMAJMFfaKvUgfceS+B/sBYTIgAguAP1lWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+o/eET4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRvdPhbU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+o/eET4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRvdPhbU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9o7um402852
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjLbFFRKyjAyZ8dCcbYGlaZTpktqEWnTQuA3t6w5/kM=; b=d+o/eET47g5wv09m
	Dl5UCG2fD3VmF9N8tRrg8Cen17P7UXFIraLS7VYAtx8SyTZ/fakLjHEzZiGabd0K
	1/yNrric32Oe0fQywRA9cf/WvqQQIlg/QQvYUhV8ZU4l0KMMoHlAk5+fi4hVAw9K
	+0f3TUIdbTC/5p0WbbQHSAGdoiwU3syXagGGCgQa+2MnClFK61KjqzHqF7ta2Y/U
	KRYPFwjRRIPaVsmddg1x1zApaZhp+PjKln50czqsumCKJru8bI92WT6w7boLS5uS
	OqWgdwHQLzEj+mqYQXqIWWHuKhY0YKg1F6ISxI60g5CZxQS0odnumgRl/8lBeDIx
	ARiAyA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dvbs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 15:07:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ea6fdbd28so74775831241.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773846474; x=1774451274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjLbFFRKyjAyZ8dCcbYGlaZTpktqEWnTQuA3t6w5/kM=;
        b=eRvdPhbUe7ly1uIYK914qk6nN3KhmzcNmOhfavsxeaurgxEVwqmTQYkjxEVw5/6x7M
         DMk0lx8UqBUDlTufuWeG6rKrzGe/S5EaBywHBcnKyF1jHEhJXeZwh6fSsiU9rrCPf6ha
         KIVxp8T9hv6eLkdRDgxgWEuVfmsxJGdRix1oh/n5iEKFBs2PrAM+A9LwO6mF/6r1TX4u
         kzIbnDioWmaeYlE9athjmx7v7C7pDeFAM/4DyUeR7OndJTd2oxC3WfK6Ih3jiWTcfmvb
         1rvDVFk1Fkoj9JPPyH7DfjP7k9i+j0uy00E87UOvF8PychzgOe/0vVyBO6ZKl7n5inuY
         m4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846474; x=1774451274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjLbFFRKyjAyZ8dCcbYGlaZTpktqEWnTQuA3t6w5/kM=;
        b=YaS1u27NWLRErbI7MRYd8MJ0t2U3wxJUHTkZWUPlMlvAJTyzH9FOLwQA/O3m43gnCF
         j53Jizqs+deSQLuRECwHjHf5Gfkbt/7KdZ7TL/uDzhk5lE0mGqdUPpmo32kpw0MFAWeo
         m1/trJMTK2Sbv6eyHMHq2ZOyFFYk9uie4/hTKBHbM3wsY5m2oFkSCUNZy2Z8VW1VkBUe
         u/v1a1pNCPpSD9xS0sbf92hu3G9tZohLLb0nyUU3ZvrEikW61w2H1kGnVnhaJXUJ/+0l
         WTW+YuD6aEdpxN71cErrIHrHLOqE+mBb3w1rdaBF1IULh7xj7m+4PPpc76HJjyZnPQpF
         I4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXR5Q0yqhmyomINEXs71sG9aNkb3GvYU7B/jmKeZRZwNg4+K/gkjODF558TTVBWxuBboGkAMI45mnWHHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydHYkFIPHnv+vTsJ8sgEf990nB8UP54qx9ZMILvXb72Xhvzsnc
	nLhT5vmgt3NBhmJIrE6m2l18PG0NxxFavIlfOsdt6KzsG0Q1HMSrGsTKjsVBrIYD5JfYp5bZMJE
	u7J+3nIieVh58dvZTvbS2L9ie+nDs1pSQKtX6XrNiH6w9EzT8MQmXFI5jivIANCbx0A==
X-Gm-Gg: ATEYQzyr0cJNF9DpNnz8hLx5R9jsNoyEHmUa74Q9KVtTV2Tcd0DLj1X4S5rPHCObEK6
	YC7bON5ieh6ve49l3pX9NWMI5Hhao0tg90rI/xh6AxyIeUNCEyKGgqzxgJ2cKLmCGZKo1VOrgEX
	mt4qYMEsbeXGS48OKX1Dgoeqs5eo55wdyoCHmf9VeWVUXx9QdUDw1UISpsGIPL4iI1xttTJerjE
	TPMDZ7jaDEFkLzR8T6FHdyw1pHM3IXkX6BjZPGKnqE/Ulz13CEaHNIFMyOmJI7MFwmQq+L9AvxP
	HDhblBut7iysErMuFyzmWr8/+bXVs9oORO3T1Id9gSKeHt40pDlKfbT+sV2zq7T48uG73bCa00V
	0C5MxDfjbSfs/3DXkZn3HsqxBOpzK5Eytrubyb0Tf7Y0Q84wL9Je5EziZaesoYxD4/i47DCHE3o
	d2Zu9N9P+K
X-Received: by 2002:a05:6122:4d05:b0:567:44ba:bd8a with SMTP id 71dfb90a1353d-56ba7143f15mr2180604e0c.9.1773846469659;
        Wed, 18 Mar 2026 08:07:49 -0700 (PDT)
X-Received: by 2002:a05:6122:4d05:b0:567:44ba:bd8a with SMTP id 71dfb90a1353d-56ba7143f15mr2180552e0c.9.1773846469215;
        Wed, 18 Mar 2026 08:07:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:749e:2bbb:7ced:aac6? ([2a05:6e02:1041:c10:749e:2bbb:7ced:aac6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm8863699f8f.0.2026.03.18.08.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:07:48 -0700 (PDT)
Message-ID: <838f3171-a112-4193-852f-8a4426a86ac1@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:07:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Fix the license marking
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Wesley Cheng <quic_wcheng@quicinc.com>,
        Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
        "open list:SOUND" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260317180943.3062085-1-daniel.lezcano@oss.qualcomm.com>
 <87fr5xcqrw.wl-tiwai@suse.de>
 <805c7ea8-521f-4f62-b6b1-c5f02c6b84b0@oss.qualcomm.com>
 <877br9chnf.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <877br9chnf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyOSBTYWx0ZWRfX5WYlmeeMjrlo
 81eUhv16p+IIugLhjybAddOr00/juKPK7go/EvPt2nWG7Kd84e9yUWgYJ5faNEF3ctwRmyAJgON
 k+3a9hSt2B9Ejt+35jyUKNLpoGwkM8tfjqSkjIOw5fGvRthVLjlUgjRWVofX117ZSZM8NQ53OjW
 SnYdweQtUCWfdTqW8JUxL1clGAiPcdx/BshDG/Iovwsp0a71KnPSAqEVDBDe81ZZHZc4fP3WpN5
 PEgoMUThhkbBJpqjfXPH4MADzSOtnl3JskhjYaDl65hFNK6ocHKMW3o0DC+iFhe+OaEYlrBklpe
 hCZh0ptbSHmrJGpczzd2grYiFiTNZv/zakAEUiYxV0Q/oK7Y1QzUvmBBP/yv8kUhEzJu6bIFLFo
 mwtMr3IUg2rdMYWJ/UFboeojRm3hRWd7bWQA/+ymu29N65IHx6vdOIjnPmIj0b5XTWrn5+dK8K8
 AVKb9OebeCq+8Q41vHA==
X-Proofpoint-GUID: svrT-s0gKY_seLvoMIuwPbf-pwY4ECvx
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69babfcb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5S6TL0peyIHqLjJchd8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: svrT-s0gKY_seLvoMIuwPbf-pwY4ECvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180129

On 3/18/26 15:54, Takashi Iwai wrote:
> On Wed, 18 Mar 2026 15:30:51 +0100,
> Daniel Lezcano wrote:
>>
>> On 3/18/26 12:37, Takashi Iwai wrote:
>>> On Tue, 17 Mar 2026 19:09:38 +0100,
>>> Daniel Lezcano wrote:
>>>>
>>>> The Copyright for Qualcomm changed its format and replaces the old
>>>> Qualcomm Innovative Center by Qualcomm Technology Inc.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>
>>> Applied now.  Thanks.
>>
>>
>> Thanks Takashi
>>
>> In case you missed it there is this trivial patch [1] to be acked-by
>> or merged with Bjorn immutable branch [2]
>>
>> [1]
>> https://lore.kernel.org/all/20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com/
>>
>> [2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/
> 
> Well, I already gave my ack about this so that it can be applied in
> other trees.  As a really trivial change, I don't mind who to take.

Oh, right sorry

Thanks !
