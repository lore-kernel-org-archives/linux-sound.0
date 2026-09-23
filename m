Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE96549BD94
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162461; cv=none; b=ZsybMsRy4l1uIvmnLhxkOl4Kmdqd1XNqGeS3UJWAqqgqZTvM9IH5XAMAFSbkZroZjW+uaFTZFwDgz8L71YRkg/rOALOHL3K4T2VXojQ/jSlO2qzCJnXpgeqsBZpJmtyEnPpqqt2lrXYQs7J/Azi9qXRwLjSm/D1OpvPlnTTuuxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162461; c=relaxed/simple;
	bh=IJU9MKcwbvSAyF5y30NT+cRls4Pn1fA0J/YBjBXRzkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ronwDwRdR49WQcEjhYZGYif1sgG8PE0gs6A+doxT4N6PJwHcq9/zTjIJem/84pmNzgudnIKb9vvmjZG3BcmxQlqq+N8hlgs7mDRH42iQ2uI2YTBb89U8mVwUzidmz+aRVGwWcNwgV96W8oiJhnmkXMbkPGiUrtJyaEY1WZGxqPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOFFg2/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bn9qgeAb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOFFg2/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bn9qgeAb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2cKj2236729
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pvnghHOUtv+RWwHYZG0OQG1LJBa0evkZWaVyqIA/oE=; b=KOFFg2/R3VL8g5ty
	lg3w6xp8EqYfWowoyBUsufen0Mwwz7lRw/xhzkS7YNyPHgJXk4jNb0frG1c6PETc
	orq70fAvyPcGktcwcrt5/xJj8CLuaVSUdmH+svWtbOzeUddWAGuMEZO8EiDd7dN2
	RkI3Bz/AVD958iSgUgjI+sa0CkIx/qym2xNqJDB0NCPTXAza5gHXjuIX1G8LAkHk
	d+odsuReajFzUCRZikILMa8MOS6TP7HWmK+VZ/PgazflCG+QD4aab8rRv0sC4k5x
	VpO+RBaOl/zzrVWiy8D3rdTRKZfqggK3mE0RATrg/SHfR7U0OCaJIErETvSlhoA9
	lWH8Pg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7ggxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:20:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso969223eec.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 04:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162458; x=1790767258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pvnghHOUtv+RWwHYZG0OQG1LJBa0evkZWaVyqIA/oE=;
        b=bn9qgeAbV517ifSOIgeCQVegdb23XnDJ8ZZrt4KAeoIHcsxz3wf/CaEWiR7mkHZNmC
         pzyAQENr3yOC94GNF90Eyl8tg5ro7P+aFpWzc8tBoxF2P0nANhIsr6QlTHJx22t7AZHE
         WC4ZtoX++tY9AC+c81SU/vXBUVmcwKpQKVWCEaqb+8EyrOQREP9ct+YikJUSXs0FlUu1
         qoMx+DVtN4YmKyAQnuDKgeZTnjiH/8BBKxAA56LWIiSgvlq3mADa6QNeUdXgk0UHp5wo
         dTJGoLnfHZsfsAGxlmVDApwNJulsBvNq0A+uC0JPjJLUeuu/+e9qjnfkn12yTQRR9jaA
         OeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162458; x=1790767258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pvnghHOUtv+RWwHYZG0OQG1LJBa0evkZWaVyqIA/oE=;
        b=uc33+DiqAoNYpI2LvCAuSdEVSy5B1J7n9kf5U5N/aIF2Z7ezFhAGs07FoPCpZehFpx
         21TX7jVk6btb4Ni3OYUwA0oA1IcXf7IY1WWZNPLIc+RF91wP6vC9BVMpgWGWZ/eCT5X/
         /5QMTySELKXNbTTL74AlMk8sldIFm5P+tn3xUeBqWqW7vyvAr8P39JRjcnyB71ahRAiT
         c7SE9eeFhzfOkotCXMKjyXYqbr3qsW9zjr5ncbYrVgZBQVnU+UabwJ2XnK9wlYothdng
         Q8+CC8lz83mdCARbSA+tBpnOU0pkXzZm+eHu8GKRl3ZSIF/cxmxUe86esQbKINdFI3a6
         2Jrw==
X-Forwarded-Encrypted: i=1; AKwUvBx+pa+UFBXr8DQbDUE6SCa1akJw5EKT+tjJ+e/8D8lTpMzNoqxBOyyWSn/YoN2ZLGkpZLAnq9P30RntEg==@vger.kernel.org
X-Gm-Message-State: AFuF++kJsnkAimcMPQ++xRkeA9ZjGRrZg5tvZxry3BNVcqPaLxIPELWW
	8ghCVzsJerNWPW8DzmvR/pfFmc/26ycV3pOFhpLk4Id5mGWtLbI/oJTrXhIq5AZf7caNXWRyYEM
	QPjLNByUbr6lD89t1LjBWMv+UfOqb84d++4M+zun58FZvthoj25whjFzSW0k+n5qVzA==
X-Gm-Gg: AYBFou2v3AJH9mQ+RcUF2fXgYy+ouBUq8zkRUBBXOZYujhK3rj5NarUm+V3VBeJjybN
	orUxYJxItwryjBX72yHi1u116qYuWFy2xEsSw3gGlSOCexnCyEdCRkFLs1Vnjr1beRCl3VePOnX
	GzdJefg4Ssb+9V+2lvmlAaBYVGTbMO2CjQi4GHZu4a9KN5ZuBgkNsDTPc4lTX4Ck64OdlAaHr2K
	OadzMu7zHkhTAumARA1mduqyxdhA1g7ylj9QrNZchyEDAHZbsRD1tLuyRQN3wBGW1n0bmECKEMr
	x4Lzv9XoS67RKStF/k0AzAUGVUoWZG7peDqCM/Sh2Lt1uglQ6oK4wpXocRBVR9kg3emXOIzius7
	M0+1p95e69Z5iXYdMTVECbQrF3BI=
X-Received: by 2002:a05:7301:162d:b0:33c:5ff:71e4 with SMTP id 5a478bee46e88-33e8c249fb9mr2158403eec.9.1790162458393;
        Wed, 23 Sep 2026 04:20:58 -0700 (PDT)
X-Received: by 2002:a05:7301:162d:b0:33c:5ff:71e4 with SMTP id 5a478bee46e88-33e8c249fb9mr2158378eec.9.1790162457791;
        Wed, 23 Sep 2026 04:20:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm5805691eec.2.2026.09.23.04.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:20:57 -0700 (PDT)
Message-ID: <2be528dd-487f-4093-a2eb-5916832a4123@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:51 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
 <arJ0yBdeDfjYihRd@sirena.co.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <arJ0yBdeDfjYihRd@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OFNqI4L0WxDccPznSYbNfhHkNcPLtO6L
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3b61b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Eu4FWuEEJWto4IdLvdkA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX7JbfcoGhvRdl
 ifjHilQhR4DXZdKsyxZUmx4kmj2QlzuvTy5YAb2FgnCq63s+wfKMpM0kpv6Ei95Ry5ROIWIW4Wt
 XcUD70epR868KG9OkT5chrOZkLunBDiI1q//BBaqnjtQTIq9v8w69G96yMi8Jm9B6WgEkRA9/oP
 KMWTLYZnbldtPgU2Uccw/bmPZ+KR5Fg0pXqd58f3+EOWNeZQL0hsfyjlWjm42h4NpbhQX/ocR9V
 Sg2YpThZkRkr7NBxav88poqJBVOd4GKFrcGVW/CLsHY4AHomOHt19laLwUsMTi1jFRw8UYB2oy7
 WebJd55Hfu4Hfem5VcLXLEaGSKq2l4hGiY6+N5Ji2WJTHpGIu2aJhlq0Cm+niWehm4Ml8bN2wqc
 4gi59A3+gB2lg6JiOJZmEU9NvqDsIR+s6aUZr/vU8fPYwmXX90Dxneszv7U1gZnq92wjRAWAcB8
 AouEFDABL4+nVRR2Zrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXyFjcbTmOIziq
 +Zda9cYWsgi2uEalEB8FYmvvJhTHONhrHgGOF0w/2aanZcQ0oTj0EvoOUDER9221jNyyoWniMQO
 IdK9HCgeQKwBs3FzzWGgF9eqo67cvOk=
X-Proofpoint-GUID: OFNqI4L0WxDccPznSYbNfhHkNcPLtO6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045



On 9/22/2026 6:00 PM, Mark Brown wrote:
>> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
>> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
>> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
>> reach the PCM buffers unless they are explicitly SCM-assigned to the
>> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
>> does not function on these platforms.
>> +static int q6apm_dai_scm_assign(struct q6apm_dai_data *pdata,
>> +				phys_addr_t addr, size_t size)
>> +{
>> +	r = &pdata->scm_regions[pdata->num_scm_regions++];
> This needs a lock.
> 
>> @@ -1021,6 +1168,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
>>   {
>> +			if (per_stream <= POS_BUFFER_BYTES + PAGE_SIZE) {
>> +				dev_err(dev,
>> +					"reserved-memory pool too small: %llu bytes\n",
>> +					(u64)rmem->size);
> %pa

Thanks Mark, fixed both in v6.

I added a mutex to serialize scm_regions[] / num_scm_regions updates in
q6apm_dai_scm_assign() and q6apm_dai_scm_unassign(), and changed the 
reserved-memory size diagnostic to use %pa

Thanks
Ajay Kumar Nandam
