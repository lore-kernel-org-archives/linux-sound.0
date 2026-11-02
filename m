Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616927;
	b=2O/9eLlFsAk1EW+NM2CN1Bg52OFpz4YWDr2QkFmeQk4KkP0Q1tMwZjJdXLCYaTwQjTbu
	 k1BkSyFaxCQD68c66yN9Ca4Dm7U4ZZpGI0EwU1jim3kYM2Lb0SdONnjAaHlij6gIxwZuh
	 3Jt5vE9skelpAGjm+IK2T7O4lE21R+MmGCylRieuSFUn1pn/AFO63JCRnF14VvRBeJNsN
	 27j2LRJa3lmPs9gMXZOHhXQR8pIwWh721GEEIcGdwmgVEIg1mzu1aZPlbEo9efmjVfw4d
	 0IxJeLkEerU9tEKjXLE2ZEktkK8GyeTztsuMy81DgVbjGS2UIFUAes1SUhiMF0NC1ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=;
	b=Uz+nbA3vuxG8dtbzyiLJ72GLv8ocv0PtVWRztZLnzNEHV3L2vZohGdfQpqocmnVRVH2e
	 +O/1tPZ/VClp7p7OB7AHepXf/IT4azY7pg6noAI8FhbKBnFUWgGykZYvqxcNxtP6nCnVE
	 065ZTuCp+6NhJc/2jJXcuOIomiqREO2K5kdT1X0dULd4jcpv4JELnA9HHTiQN8rpn8FTy
	 BWB2w1M/cG5w/+QmqUfWVhT9YwKlcVlzR+xQwwF7B74jA4opkoe6VhAr6orSY1hbJNFsg
	 SRlRKvvXhGSijq2GA+vP7Y4BEC9q4udvHh9FkgdPy9PlDu68WbqteuQLpEOE+LSyVmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AogXHSbm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GR1njt3C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE7606A329
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 10:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AogXHSbm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GR1njt3C
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6kQ214014
	for <linux-sound@vger.kernel.org>; Mon, 2 Nov 2026 10:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=; b=AogXHSbmMq6jzD4G
	FpC2vT9N2l2ssJoU2GTqwwA6aVKt62y/VCLyquDPzKg+ACVhTJxeGPX363wT4SK6
	wuvN3/6EORHDsXpoMFz8MNcDyjmIsPPFQEqwJ7n9SCZisyk0qsQNxKpZzqtcq21Z
	2neDglkb2wDs7pGwa50igsGCLJjv84KQanQhD2hqrJ/dqxyLhdbIQ2/S/pcO3WID
	gMcoTgBxB8KfvnNXmfnmoOPGkMZREyO4O7qB6KtZ60xdxLtIOWUqysW0F8HestKJ
	dw9o35jvJAE1YC+Dbel+RMWVzYexXlIokLqD06JOanCK39gjfkhvi/O7SCCkzynd
	63K05g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s813-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 10:55:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so4778302eec.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 02:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616921; x=1794221721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=;
        b=GR1njt3Cv+wv29tAVmps+evmm76ytzvisPXju1cA43Wak7qyuDnY9shnOS3FoqD2Fg
         GmNsbxq3sFSE0GDDuJIinoZHXzvuBJBXvy0OHUT2FbWsTis3JfH0ZCWWIyFB5P3nxzdm
         04pgLjRYN6UxSSHd+rEu3tXlkGpEHA1qJ+Sp9hEvOm3LyBcCL0Ma1yXY9LJpwhEBZsCt
         0/Dv5CFabJN2RaYDlgus+dCZiWRO5xX7ZVRE6E5RnUdBd3DFsyIcaSpZxMZPN27PCmej
         YfgqTloFb2Bya4WEpqzLJcJPP1O6P9WmISWWjicE3OQ+6JOR/AYCE7ITpT9JLNz2h0Vt
         Poaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616921; x=1794221721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+g4RtcpsbOEJna1NU7oN7OB6+C78U6kIVa5NdLfGLYE=;
        b=FS37TsQSZW3xnZKNp0kDIVXcDDVoOXfTklXOpWZLNizF5nwY+Pxx282FPyZbOZObnh
         3Uucu7PzR4rBIvPUR+oQaeMBrYgDmSd1GnT/cVl5ASO7sOgoImr4zMZff6iEjzM2YQre
         r34IzafnfdNwunu58ADupEphajfa2rVJBs0QdBYUuqmxeNvHIGJ9UyKcrfqlbqIiNpR3
         D/GkuMqdzaE6fPNnUSj5XM7bnSODjY5lKyNG0e0bA4lZhmUmkoTtyaiIj2ASEyBxqBoa
         0Hmi3cloFISTxeaYD5fseQ/Xr6W6IOcb+FlMsU1jvrj+7ejExWJrZKtXYxhYOaaTbyKe
         BF+g==
X-Forwarded-Encrypted: i=1; AKwUvBzh3Jt2H4Tp/6AXKEzwOetr8ldtJwvQngr8qtVvA3IbkQAKnZfjtG71RD7BuOUFtG7SEjcumdjwtEblbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lloi8efIjhM+lZ9mvi0ELHBsutiLaTpgK8hX7zF5xR4V4hIZP
	26iSx44w/NpGlB1Jpxc3+jeWBBuboYvplweNO0uDE8Q85TYZjg8/q8+pcbTCAJ53pzqWzg4p4q3
	OD9ysd2HAcONOpu8KoOIMY2cENF9BEz5A7h2EVFIpmbtiaMGkT85daT6rtcSsG35Nwg==
X-Gm-Gg: AYBFou1m9wFiqUNKRhe/YepWkcbV/NlxTPYo4QXF/MVLyf78DDmzgvRUXetYBiofeM6
	ga8gPgf/IOozRXlbKBwZSor25jmwbWTqzxlwVcPsLDwd8YHP8dGgsHOwUj6AdGmxayKoBeBqGMg
	taokWtih7nJ4BR5ZA5IT2jb2Ef0248g7svhB1K3SsF1gespCbrv+Oa7bLpUOFyWRqbNZdzXHAgj
	U1Uw6rGIROM9a99MZxjmUSfh4xt7TKSV6a7vUdwGPxfnVALYVAN4vSPW2u0eLBcJN4eSS+Gaov8
	597Iq0mJ3dDELg5VN24WOg8adUJzl+kCv+xFiFDO7UkF1Ps5HE1W9joqx+BBsA0vCvOMjerpCuR
	0z0vtr/R4katwPfTJSA5bKp8xU1N2a2SdFPn8O5AKlmqcQsI6/EfI1j16lcKwLaAdN3ZJ3glDQR
	VAydWPz8mTTw==
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr17301662eec.1.1793616920511;
        Mon, 02 Nov 2026 02:55:20 -0800 (PST)
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr17301615eec.1.1793616919790;
        Mon, 02 Nov 2026 02:55:19 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm38286105eec.9.2026.11.02.02.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:55:19 -0800 (PST)
Message-ID: <fa8bb99c-6f85-4a83-a920-227991303d57@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:25:13 +0530
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
Subject: Re: [PATCH v1 3/4] ASoC: codecs: pm4125: Keep the micbias reference
 count balanced
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
 <a3df845a-ab58-4945-9221-ff671c3dc378@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a3df845a-ab58-4945-9221-ff671c3dc378@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xu_A9yLVSKOOqAjponsAWk0LmeZYgTwu
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae86c19 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=cy-uCPSrX33jWG4tK70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX7wn41rOCCg7D
 R73irnmPkfH15bU2e3aeJGrnZvmmhAqTfDSaNfc5vL1NsOhREJFoNXYSRdg75QvDWzw02csVA7+
 gTACFAV63CD1hqj4Ue7RPH97QmIlotK8lbLS8EkkehH0tMMTdmuVkm604CvgXcsCXECpEUhvQVX
 jdVB7wBKFnIF7HRQgEHWupsbHCY+Y8mT75tgaZdf/xSoQlpcV2dGIZvxUFl9LEE8h7+w9iSTNu1
 6lPiJPHv0TuRaU62CKbA+YonGwRBczladIb1PYfFjvALbUPEh5uK1c7p+/GKw+XkFVIZURvyODJ
 UbY01AWkf14TjPFUyns0uPGQ8A8yTgVIIXQVHDc3k0KrPqeLYvzpsmQteyK3ppR4n35mvzg2Uh6
 zSwJXehsE/3tpgg29tw3pm0u8vAt+pbVjwHPpNLBl0tMzV4QBU9F1ETpI0aXdGLRcAK0uYwz3SA
 tCJNZJxJLKJmqbSa9sA==
X-Proofpoint-GUID: xu_A9yLVSKOOqAjponsAWk0LmeZYgTwu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX6IjoVjUWq4wE
 gOFOKZ0mSaYcydhJWizt+M+UYIoNMj1ncTFV/QymJtvs8c4LEsp2p4kL+vCqTZWqMUcdnjEiynT
 J3HCkIH0Mky+ULt3/+8XKVQDsSxzeo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043



On 10/16/2026 12:33 AM, Mark Brown wrote:
> On Thu, Oct 15, 2026 at 07:43:11PM +0530, Mohammad Rafi Shaik wrote:
> 
>> The analog master bias is shared between the microphone bias supplies
>> and the playback and capture paths, so pm4125_global_mbias_enable() and
>> pm4125_global_mbias_disable() reference count it and only touch
>> PM4125_ANA_MBIAS_EN for the first user and the last one.
> 
>> MICB_DISABLE clamps the per-supply reference count at zero but then
>> evaluates the enable and pull-up counts regardless, so a release that
>> has no matching request still reaches pm4125_global_mbias_disable() and
>> drops a reference it never took. The MBHC framework issues exactly such
>> a release: it takes MIC_BIAS_2 once when it starts detecting a plug
>> type and releases it both at the end of the correction work and again
>> from wcd_micbias_disable(). Inserting a jack while a stream is running
>> therefore switches the analog master bias off underneath it, leaving
>> the path up but silent, and it stays silent until another stream takes
>> the first reference again.
>>
>> Return early when there is nothing to release, so the hardware is only
>> touched for a request that was actually made.
> 
> This feels like a bodge for poor reference counting elsewhere - in
> particular the MBHC seems to be fairly clearly double freeing.  The fix
> here just silently eats double frees AFAICT?

Hi Mark,

Good catch. I’ll check this and fix it in the next revision.

Sorry for the delayed response. I was away for a few days.

Best Regards.
Rafi.




