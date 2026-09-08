Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0625153B611
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870708; cv=none; b=c5wOzCzIYLCEnCaKNt5cmYKxTk+Ae4gGnIfFcIc96wFNZPjD9N6Z4oZHhLi2lkRPPiVg+bPraBtHX7UBt81ivaDLprC7w2W7+MdShtQmkGMtrFuOB/pixdbhuJXOnvyvgSoUh/9+fJXTrA6jQNL/nVT+FmOoJj2Zszl74qZZyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870708; c=relaxed/simple;
	bh=zml/dB/dBKGLIWCnn63+5Q5zty1XxnbbCX9Of2icmSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcWpl8UJRAJh2Ur+DQJjg3lX6yepr346VJCrOLxmMXwbeT+VRSb0a/Sbpep6l94eEdt83U5Cze4u8EBXqRjqA9YlWtheihmWZ0fkyFgmZRBvcQlEXYX2CFn48qRG69YnjpsXup76O1kTB27SEZ+CtS90Jtqw84liGUWd9YA22Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYsaMia6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5Gkc3eq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYsaMia6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5Gkc3eq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADCPE3506396
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 12:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpDBaVXeCrbOdaIdpQjKqF9RqKIJCNC/+XebxKCkHRc=; b=jYsaMia6Xw4dYoIT
	FWGfQ/rO7f/25GQoxViQFeMZBj5UJ0ziS9iDBlk/Ew/KIF0cKnpIuPeIVdhMs19f
	IoOBr/GgSQkUTqKPUQusq5S5Jyi67BOhcDSq+yBaeBnxF8hoSKR6DkXnLpSEg7t0
	SnIKj7qIFCES5HUUnCw8FyOfRbR68Mj7nz9cv++1BJvg9KQJuz7SHlRqZ5CYlA3i
	xQFybiyWEldb1KgaX3exs62WiV57jUydCnURXm8fTcZL70U2po1jZ5zmfCervfLJ
	5y9zcI1bqnts7nKuqdOfynSjVZidvj+J9WvVItlAWwl1HF3ZinnaLtMyNlmy2nFt
	tO/sNg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrhx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 12:31:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9cc5ac86so317941241.1
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 05:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788870702; x=1789475502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpDBaVXeCrbOdaIdpQjKqF9RqKIJCNC/+XebxKCkHRc=;
        b=L5Gkc3eqSKjNV3K2W2JMZFvedTxLW8t0bS8fMdvzQ3DnH27iUbtckBhkfZ0Du+XOIp
         5c6w3v6+YhNZ8CtjEIGEnkC225WYWN6+l82uC88lwEdy2rgnklGRhfYEGJvGOrvNTFsa
         bBZfMBzXyZiOkDKqWz2srMDXRQIGQz2W0hji1DGPgHn7WYy09oclUVDQJ0De3JKIIMfG
         QmWr2QCc8jQGO4u/FErg5Ni6cTkAKo7iTTF8U2u6XARg5ueIVeF3QJH1WN6QMOgIRNEG
         ZdFBKvo1VZlaL8082Wov6dLCYXZQHmLA861q7zTev/pxiXrRW2NH3mplNVH4v418yAe+
         /Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870702; x=1789475502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpDBaVXeCrbOdaIdpQjKqF9RqKIJCNC/+XebxKCkHRc=;
        b=C8BjJGbXsMj+yWAksN0VbqAy7/7f/lFYYSbvQ7xP+yeb3YfARUl26PN4dYpVEZT4HJ
         W9x6HOAyFlDNsdnk+Csqrip08NpRpPtuz754xoPqTMRFQ44d7GSQT8aSmgI/Id9H63Ej
         A570t4b+sw7bImOGHhyyvENzbksLTVmCKFI6ivKpqIkenjz7myTIPvDs4qWrdWu2Pd1Q
         UiCyZ+xiynTsfyLws8qX4EKVYfG0h82s40osZ71zu2YqJ2mpFRlf04Y3oo2u+HVYw6qv
         sQBiw/QHejjCKjHRCpT7V8oGkfegsCcvXIzSvOBGY0NYP9oZRWqhhlPvV3eRORQrgGM4
         5C1g==
X-Forwarded-Encrypted: i=1; AKwUvBxMzEDgx/n3LNQ1LEouvM/DNBdw00tigOkmfiP3mWYJwwl0sPcWGot3zztNDkGFEv4u26EGJ2eprN59Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++mSFdVNFLs36PoNbqvOrJancvYzHbn2nwpwR24f1OR02Xv454Vv
	zTb+/p/NrqMOzaoH2I4tnQGvI4oSYCGulp8e7/EMdmq8sT2DQ2XVzD2OpAri8KaR368FNNDwDaH
	9auxHQxcMva9lMNaH1wOr6w2KQxa/kVdR80oxtZlgdLTOGDd0cHkQbPXxJP1pcGahzQ==
X-Gm-Gg: AYBFou1lj3Z6cjGU+CVqmPhegqYhfjzAMYzGyx90ZaC0j+a2pmD0BuFCdwKugDDQU+K
	lceffAoP2cP5yFfALQiL+i+Orue3PiIDpfKf6U8qxBOE8RTo6lfCXaTlyPnaM0l7xdE5+NNwQhc
	T+HS0lC/On+ZQw36eCYwoZQZgPfq5tNBFMWqMdB8xGy7QSX2mDVDIFmAFSFQoa8LleS4ZtExqlP
	wIrWzO0WvCEgJCljXHE9Y0LLv2AE2og7tEdWQv5jo4mliBPNMj0On4rC2+YcIjQPVLPNmhgmuUF
	q1QH4TcesCycZGdN99RVWyScWzeV4lPxH0YchgSGpv7zBUiYjjFrOXDe9bVur4P7n3KnRnXbtWv
	Lcm9EHbmNttTy5EJsdF12IwbpVik=
X-Received: by 2002:a05:6102:5487:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a4a995f6cmr9965390137.7.1788870699875;
        Tue, 08 Sep 2026 05:31:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a4a995f6cmr9965342137.7.1788870699196;
        Tue, 08 Sep 2026 05:31:39 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a88b7c04edsm658720a12.15.2026.09.08.05.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:31:38 -0700 (PDT)
Message-ID: <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:31:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
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
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa00032 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=_JhjDt18UGZXRo98LyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 1vBmFfglWWaR0RTn-GKH8qmiWn9BXXSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEzNCBTYWx0ZWRfX3mdPepU8w4CK
 L+E28h6bFQvJ8/DshmghC1Hp7+Wykd21097WGMJ5UgDaASc0n40exyQK9oog9+on+4kYN8qqYTK
 aqoznsxdNFj8lij65b07Zz175tI8SRKpkxFQLWt/UmgiXtO0yen11lKrUJCpgycJmAWb8NaF1WS
 zXM5PTzJFHoIPqa/SKrx9x5SsDPnOobtiq5RZiY1oVUmw90Tmil5leK20QjncxGDxsOex1PuZ1B
 UaSXnsu5jv1+1Cpmzpf58ikM1xiTo0MTX/sMRYTZBIXpr5wnksiJYNFZq7Y0poP1IcK0XH5dl1y
 Au+7wRCs+6jBse5wud2QgkWMR38NFzSvCX98pzWy75wNMdAcFbKTsjVy8CDPOsGOPCiBpy8vrDs
 F1HPBvjfLkC0EDaQ6rkJb1aPyAyHEOMGmnbvOjZIHH7RcfPd02I3Hb8QkWuKO7gaHh8Hb2JNEHu
 RBW0XLItoCErTA8ADVA==
X-Proofpoint-GUID: 1vBmFfglWWaR0RTn-GKH8qmiWn9BXXSp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEzNCBTYWx0ZWRfX1cscPE/E/jTK
 7ogTfKgc1uXS1ah3vxBzRz7B9lJDHpf+jHfmHVxlBIosYKdm/pwd1xxxSAmsJqRBR0RD672LgCc
 YZv+J1D4ktJOUDVTtcD+QZS3EzKSjlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080134

On 9/8/26 11:37 AM, Richard Fitzgerald wrote:
> On 08/09/2026 10:09 am, Srinivas Kandagatla wrote:
>> On 9/8/26 9:49 AM, Charles Keepax wrote:
>>> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>>>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>>>> My take is that rather than encode all properties in C, it's probably
>>>>> worth exploring a DT representation of the concepts that *can* be used
>>>>> fairly easily and make the life of codec vendors easier - not as a>
>>>>> literal translation of ACPI.
>>>>
>>>> I agree a DT expression of the *concepts*  not a literal DisCo
>>>> mirror would be a better A.  I want to bring that back to LPC 2026
>>>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>>>> feedback rather than re-litigating it inline on this series.  Because
>>>> B stays put, switching A later is a change inside populate_function,
>>>> not an ABI break. so landing this series does not close the door on
>>>> the representation you're asking for.
>>>
>>> I am still not sure I really see what the value is in a
>>> completely different DT representation of the DisCo information,
>>> all it does is give us potential issues with future spec versions
>>> and create a whole bunch of new code than needs maintained. The
>>> ACPI representation translates perfectly well to DT, should work
>>> perfectly fine using the existing code.
>>
>> I totally agree with both of your comments, there is no way we can
>> replicate MiPi spec into an different DT representation, this brings
>> both maintenance overhead and is fragile. This a very big effort.
> 
> But in your previous message in this thread you said the opposite:
> 

Yes I did say that, and I still think an intermediate DT
representation would be a better A in principle.  What I'm
highlighting is the cost side, any intermediate representation, by
definition, deviates from the original MIPI representation.  That
deviation has to be kept in sync with the SDCA spec, tracked across
spec revisions, and translated back to struct sdca_function_data at
runtime.  It's a real overhead, not a blocker, just something to
weigh against the "concepts read cleaner in DT" benefit.

That's why the current series takes the lower-overhead path
(mechanical transcription in C) rather than proposing an intermediate
DT format as part of this submission.  If the concept-DT direction
gets traction at LPC 2026 DT MC, we can revisit.

> "I agree a DT expression of the *concepts*  not a literal DisCo
> mirror would be a better A."
--srini
