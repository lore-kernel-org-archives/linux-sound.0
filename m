Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD193C4551
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958592; cv=none; b=rf55OdnBiNpon+chJg6surhVntvQazJlco/zqtdJ0oG4KfOhSuNLoboaiLFD+eKB0KxVvxXA8dHP85kxGVzK/rsBkUe1Yw44lv/45sOiOfK7r1Pp64lDmT51VTKpecP4Q7BxDBQ4vx78A9+IBFSNQN6NMTvlbdS7UrzreTXhMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958592; c=relaxed/simple;
	bh=j5g3yfIkDrLBj+5B/CahtbPvCTJOVV0fOGXayw2/b88=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VQ/XVhY0H8J/KBZUtFjp0WOIln9LH0m9aNXj636/mOrZvAbsaLbpPeB5u0qfJZrKJvi1o+dWqLRi6AoCZby/eT5XOqQXxbs5QbgV0UQnj4kDLVppJqkRYY0L9XMfjkkmkT6TLojEr7UDyjzmdcNEKdxShl1Pox8VK7lGoG+rbPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSqBkeJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BltMqfBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSqBkeJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BltMqfBi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H74bLW373116
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVaMj0syyeRHIkdagyrNZ6l0PUeNTpkp0efYWtQXW10=; b=CSqBkeJhXCh3Nymr
	TbmwicqsgoBBsNgsilqe6va2kwvuL+ije5Lh0nSZLOvxsKnJb6hEFU4QSRKi4rgf
	LrU8UjamnNGX5A/U4ssnl5SxTjcOvrpyiTuzZAVJXAoFMt+QhqS/9xsycZxbAk32
	s0OeBraa19L+Xactdn5RAteUUSoXNaRSVeRS+5uCPT5591xtW/o0IUJmDdHETzBz
	MmnW9pfmbVd7Zdlz2R1Cu9lkBvSE/86j0FtZ4qhUVnpkA0BjPUtKapaDhU1JLWPq
	XnfoExgSxzudXJxV8RUeru4BdfQ7+xzEjvljLrutR+UKz2sfvOZdnWhcMI2cXfAo
	alpQ4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke0jhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 09:23:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5349118a91.1
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786958590; x=1787563390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVaMj0syyeRHIkdagyrNZ6l0PUeNTpkp0efYWtQXW10=;
        b=BltMqfBi36Nuh0WCoYsw6zf4ac12Qk0MF3jVqC6x6jhJT1WgKBeyqMxrG9vmve60I+
         yMh3dG8h/UW/cpcR0b0m4lJxS/S71zCTLyd9Ey4jTHT5fdUSmjmLPZRgMAiYFCbw/BD9
         CL+pOGVXMGRpLEe7/3umZWTJVBxkWhycuZO9gj2zg66Sbe5isWQxjW3glzraFHvtpYGG
         6Ki5ZBA4awYfiNA+virc+h0BZw+0EnAMfNzSFhHI/wDRV/rZBrBZ4cey/s8p/0cIYlCD
         7KegsyQBmI5tbmr6DqEnalUoJ9SMtcXjLLDVfr0jTGJAeEivLxllhCQDexExkt6grjCu
         c2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958590; x=1787563390;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVaMj0syyeRHIkdagyrNZ6l0PUeNTpkp0efYWtQXW10=;
        b=ie8RZjcVLDvVHRU+L/w+k0PtmNHyAsJxdTaxTafqrrjtryixaxRktsuAK6cIgxqz8f
         ltEAaWkk0FVM4kAfcD9SYZ5dC1tjNzK7o8dVeOxDWUNCmq+l33jdtzYqLHdpabfQJyXp
         98cJHZC0PX5yVnqHWcAnrKq1cOkNf6TzrBkwOOtTLk0rQoMcwjxxBLk04SznzrpVOnQU
         KdVdBx/7JoYkl00hhrfMO2PFpbPMgnbLPcJESFTrYQBnzq3lySvTDxAc4LZetrWQxUxH
         Um4CGN8YFyMR7ARiUkkvX9Xx4L9C+xbzWVImJVZ9BF6l17HrCaLEj0lSN/Xy9KN/NJdi
         xUwA==
X-Forwarded-Encrypted: i=1; AHgh+RqDTnMAoeMfhMqhz2WptaFpTQ95gO9CdAKHjR7T1PhNVF42lTr2nnjEbY1QLnBM2+CeGCD/nZBg80EJwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7OiBOwK270MUgd14VWEzdRZM8C0th15AC/Mh3ZkPLyf+rh5U6
	7nhfrndRG7/3NmULX1+FaYlgO6NRG/tJ2Tp9pFWJRgAndMvpdEi4osc11eezVdrGSwDzldjGyjQ
	taBbC8/4MDwxNSlkIQaGUDk3NkgVpS+5BFCQh50cqhXry0zeNbH82wp2Ej3bkvwGKxQ==
X-Gm-Gg: AR+sD119kc5hKwrftuG0jFMpt3bS7ioCiaQu59S2S1KiPdn60dYZhR2Vk/GPmfVtJ1b
	T0Msxly+Qg7nZdQS27sLv5CO+fUOA9NVwAbN5riz9RhyDjxRD378HsP58Kcn0c7GbOKprDcGTBR
	GVUagPoKSbCqG2WPjtcD1we/81+6c9GQgoRyrx55FFaeJltiVxcqjnXLHs06AguCA3EdSRS8zdl
	iPYxnw+O1wkB96UOW0zJMDnjL4ccIn8WcqaRQECAr8K+jy6z6DK7K6ywIGHpdJDaBcf381U73jC
	xSu/wzsyDpNg9tN0cO8afC6hWnb5M6EXTp7pd4xbkn6a2seCdIRtsXv65d0vq61+ACoEqWm8kPy
	w+uxMqRMjPh6EDAy71pq5SqwP+hJE6sALOQ==
X-Received: by 2002:a17:90b:538c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3933b8744cdmr25296075a91.11.1786958589574;
        Mon, 17 Aug 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3933b8744cdmr25296022a91.11.1786958588743;
        Mon, 17 Aug 2026 02:23:08 -0700 (PDT)
Received: from [10.92.171.149] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d0a6asm1575303a91.16.2026.08.17.02.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:23:08 -0700 (PDT)
Message-ID: <823843f6-b829-4b9e-ac74-b3c4f3531448@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:52:35 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
 <da616225-4be1-4c28-adcb-c32e392703cc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <da616225-4be1-4c28-adcb-c32e392703cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX41bhegq+qGOw
 hSDuz4hwbRXH9dAn/a45++81rPxEEMhhpTYac8JLHF7uNLqmwv4hV0xqVgI3I1GsjAdzWny9BnB
 HFX0URQLbdlDDlwdngTuaYa8Ku7Or7NxR5BfH76vJCva+8ggohaoWc3Rh1bsaJCfyIKHy36wJ8a
 h0NfpJ3mFxR94nQNWkKC9nN2+yhJKTZPssc7b6T11zQ6qN7nd+DTFvtgiQX/TkbVlx/ERqxfQQ6
 MmxtuTznMYxQ790+MkEiayOWZzDRIG/dyEZ+sAv0m6zoW+CchXYdgsNataBEFjiWyu/mK+rLudS
 Jh28gZdu+1cW0MyyNPXMe5NUhQucTsyjHmorUQgKRtPkpyD6udebD7MxU0sCmbFT0TcgPkZfkJ3
 CQpZBns0DDSVXFoEIUDYDeZiYcbYIUwfvS8PqIwQ07w1UJkzD7i4MKS87ycE2z8jIqRvAntCHNG
 QfQLUbpYX3ExESPNXbw==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a82d2fe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I8l-se90OHnaKV8gZv8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: H8GUSpccF18HyW20-LCaeUQx5zr3prj1
X-Proofpoint-GUID: H8GUSpccF18HyW20-LCaeUQx5zr3prj1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX9UblW9FcP8bL
 3xXgXPdKZgQJrCYuf3m5+hWygP1Qo5XHubIYjxqt5n7libf/O+78F21AESYMHqLrS5rzdQKMCU0
 aZCCthQd7WNjySdviayR5nihPM4Oq8s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170070



On 8/11/2026 9:36 AM, Mukesh Savaliya wrote:
> 
> 
> On 8/10/2026 11:22 PM, Viken Dadhaniya wrote:
>> Switching a channel to a new frequency without first disabling the stream
>> causes the channel to be re-enabled without a clean shutdown, leading 
>> to a
>> crash on the DSP subsystem.
>>
>> Implement qcom_slim_ngd_disable_stream() so clients can properly close a
>> channel before switching to a new frequency.
>>
> 
> Better subject name would be "Prevent DSP crash during channel frequency 
> switch", it highlights the issue fix.
> 
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
