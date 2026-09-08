Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D053A88D
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881712; cv=none; b=Tu4Rg0VUI3AA1hXcHG4zjC9gElXf7EIbFGGv/Xy7lxXlsbUBymQ8wjJnflBOKpY95kurUsiK1HKX+QLrF+4WEm0DhMiqikaObzJSuZTEqybeEwupcLCT+wQoDZhKS+NkPRpsuG+XAQ28NnxmoLLTJVE4YFLbbOYruoy/zr768vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881712; c=relaxed/simple;
	bh=ztsuEXkA78vbJ/cDjG4h6EM6vidYirOFvoPafcKsGyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i98gkGFVRWlPt6TumzEbUR181nNOXODA14eak/TaDUqhDuK4PRZUPckMCBtyWbLcBMSqNAFzNdzCk4zq6FkNcoumAEcOubxx6f5X6up3VqWCxLuaMIERYl2e202fIIYRuC96sFLLOmzuX9AiZdLOJ/zm6Ln4vge5ej0Npe1xqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku7Qaw9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNdXDma8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku7Qaw9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNdXDma8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FVBVa3739618
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 15:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=; b=Ku7Qaw9/RpU9AT7S
	ldYZpRx+ImifiHDmNWZXMsjUjGqnPZB6gQE+dD/3Es5Rkl18unPftyebqqsJs0Ao
	B8y/SbkCz38nATer3K6reBbgwlPZXpXUZFStSyQKqloCRaem2zMMZ3JBINWZ3UrF
	eQXP6I/1b37caaDoXSbScuejX0oYQTqGacX3CB5Cn/BR2CIBCmaW6CXChn1bpgip
	3KPQbs+zGAG7TwVvVOKuop9euNCGi0RCgwBQfZQbikH/uYNB0G+tKUfs9yMFX0aM
	dgxyHRxSZAvpRTncJf31XBtyhOmcUPwcWvPQLFT9F1+AjcqvQDrh9Vp1W49YnlM0
	vP02Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7jdrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 15:35:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93771aa0379so928962285a.1
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881700; x=1789486500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=CNdXDma8PuXBjlo1YmoxfsIlb6tqKrF2WkFwW0FhBdhJB6L9S3U1HViVQ1UeVrof/e
         SyrNU6do1siVBio/MxmlEFucNJBQSv4rMxTfekE2/pCQi1+nzEa6yW+LzKlNp8ezSAYy
         azsClmRlIFe4D3/z0bYQSF93Hav04mmntIAtKrcJif5daCdE3AavN81WUBnEWN4gaSnd
         Peoc/ZDGvAKqFPAR2No6RSNvsiRe0QEQmJexPltCvMMK3vPUybkJG5rRbwoFoDHWNysV
         H65WhLWiWuCdh+CXdjF1sBrQY+GOuPAJiZuoant98ngV+sBakylfSm4Ga9W/zmiV44wP
         1fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881700; x=1789486500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=J3bkbYdi6LPgNDbmvplKffCST3SH6PVCtMKtt9ESqQtgUTkKNLo1OjYnIkWj7GgylN
         hjTYnXVSTRN6UwlnV53kBM5oCmwDIynKuPHgGRfTYyPCd5atjBRUEI7aZhnkI7iZrqgh
         +KJ9tZWpZUi8R7ldfoQ+CqbmZE28y8tvGJsAT3EwRvNGHYadnCYgHg2pOErhzOJZxEX8
         95ng2riQsrir3DJdwC4y3yvy17OX7dfyUotudcKGXKXIHJDqtIZHBxVsBuBpf+wZYFYX
         A6wtmWNJEEnWorNr0bCu6tryhi9S2gKszaSBOFzo2yXD2BjzzTe7wT1R+OU0ZxEzdL4k
         DdFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAsRHTa9lvw5zbz07JN2e8JX9QzVHeDd1Efah5ge6vblhopYlEC4dmjix49ma25Fdefl0VIrouWPPSgA==@vger.kernel.org
X-Gm-Message-State: AFuF++nMPa020cdMkL0QWPdwMifTtyUgPcTujqUdawf2UA2LQEbHDA7J
	jMReUawsPO3zpfbZH+5/llqfMc162N1pCCeH5lqNhzRRApcKLVKM3cnOF9Yz5i21NJEnmgEpy65
	82AfNRUTQTrjMGCLH6wKNOzpHgxB993COi6jdRg+gY5AaV5RL6H/ah2/KWgTOwlx+Ww==
X-Gm-Gg: AYBFou31mG7AQg7hUpvKHo3pVRV4JRYIwDc+naQhxY5veF0TCAGkxTBpRI6LhSBJ4/1
	uoYz+5j3gOaZgpxcbfd2w2Zf+XIGi0/rmpUBsP9cT6cI4IPWkAibtiUv3VfxPxq6ZyBeUKuCe5c
	tUKbSlpGSNFvTMnyk+bcL6zmDs38/j120rmSkxgM+I5Q/1VR7WQc14HHqNcUFviqKfgA814oKgO
	oRim/X6/o9v9Xzk8pV2G5yxHYpOSHzkd+na8PbI0Hocmyu2juEns3jmhvBIXi1yXzGuo9pAxA5q
	AgoazlMhM+ZuIh3CFBGT1D33X+K5XY1k1E87jfIs5wK70zxD09OfLG0wzkK+Mm7PoaXyA9jvvKy
	+5EqfDDHVIir2/owdcqdwbokpspw=
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563034885a.37.1788881699529;
        Tue, 08 Sep 2026 08:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563025985a.37.1788881698939;
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm35628669f8f.16.2026.09.08.08.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Message-ID: <9c0adaab-b725-4ce6-86cc-e57dc33bfa9d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
 <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
 <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
 <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa02b24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UsgDQBPQtW9oUzukNeMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX65oIAuhHUH5R
 +MeHSsBdynKQRVQtCW14g9ivMEnOyQlAce9dCw/WugAyb3s3hQU+1Cx/ODX6yaG2F9qoxDX11an
 01kH2NscJrrlc2ZQHz9rIowYSEbUeY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX5xak9UkLoLwu
 BVsM93nX4h/8Djvf2cZtehYYKZeVpOscSOfQOj0/FzGYQPR1P8X7p8SKg6P5ORFwUBUH3ISyc9a
 018uhliEqW8amvf7A+pOqQS7JmtSB2mB7ARANcCYzsL01IMd2PNZ0b625dFnSk6SP4UPUpbPceA
 4rO6O0baL4l2lO/dCSu9KzRTO7ht/ZKb9LC7+dY46fKWicMjRJNKPZ4YCL/+3OIPbR0/MRkUpKY
 bxd8H6qVVp0W/UC1J+VwUs98fJvsxiRP2h1pLpOlA2tjVedITqqkD1W8pFblotNPVjpbz/K+7A+
 mPUy2yV+ExFXzVvSjyFo70sPR5xa0IPv1LuIJ+U4XSdD7L6f2d5xEJ3aG8apxp3PLSo6sEoTtdW
 FeVhrZAK1NReGbwaRlf64WDUGRCpjFRzWWyPHWFU3jnxdtqIrtap1ILWJCwy+iAQSFcen/FQRUS
 IYRS98+VRKPb/TGr3iw==
X-Proofpoint-ORIG-GUID: ROzAPql3lpLFc77Qacog2KNCRidNlqri
X-Proofpoint-GUID: ROzAPql3lpLFc77Qacog2KNCRidNlqri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

On 9/8/26 4:33 PM, Charles Keepax wrote:
> On Tue, Sep 08, 2026 at 04:22:53PM +0200, Pierre-Louis Bossart wrote:
>>>>> That's why the current series takes the lower-overhead path
>>>>> (mechanical transcription in C) rather than proposing an intermediate
>>>>> DT format as part of this submission.  If the concept-DT direction
>>>>> gets traction at LPC 2026 DT MC, we can revisit.
>>>>
>>>> This part I follow slightly better, I would be happy to proceed,
>>>> pending reviews with the current approach, although if Pierre
>>>> is or not probably remains to be seen.
>>>
>>> @Pierre
>>> Please let us know if you are okay with this approach of C structures.
>> Now that I have more context, I don't have any objections with Srini's
>> proposal. It'd a good step forward to use common class drivers across
>> multiple vendors, we'll probably find a couple of bugs or harden the
>> SDCA core and that'd be good progress for everyone developing or
>> depending on the ASoC/SoundWire/SDCA frameworks.
>>
>> If this means that in an intermediate step C tables are used, that's
>> fine with me. In the long run, things might change with additional
>> options such as:
>> a) ACPI support on all platforms
>> b) DT hybrid mode to reuse ACPI/DSDT tables
>> c) DT native representation of properties.
>> We can review the preferred direction when the platform firmware
>> plumbing improves.
>>
>> I believe the point about binary/opaque data was noted by Srini, it can
>> be handled in multiple ways and there's no reason to block.
>>
>> Best to start small at the SDCA level with incremental changes later on
>> how to fetch DisCo information from platform firmware - that wouldn't
>> change the system behavior, only optimize by making the translation from
>> DSDT to C tables un-necessary.
> 
> Super, thanks Pierre. I will start working through a more
> detailed review of the series.

Thanks Charles and Pierre for reviewing this series.

--srini
> 
> Thanks,
> Charles

