Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802244;
	b=PtWXM6zOx7fYBA8+H2BRmXuAeh4UNEApW8TADP2XXHYwvsXa/Xg1KdXNweEk73gxl0xb
	 prpdBny2xmFOjsBh/BTolysHd167CdSVnddEpTzYQI33uXoAMDJa3z1igOQK4L8l23NWr
	 PqsetSzv71yzFYfIwUdZVhANnGVKWFVnpZWtEEvzrQweV/7fbg8XRGyDBj96tELyJpwjE
	 yebxUo7Rf0UvJN3c420qZoTM19H0d260zKQb87obK8i7O7IY0NR9yLpoFQicLDp33fMEy
	 /DPOpZUyGe0WmFxKv70oOpYylwe2swdWA01a94pBOcnwlZXN63CKUcc0g8kpRZTQEcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=;
	b=wX6mdqCGYCpzeh+X3G6S6TdxqKzcC4ehlmLsjFJnqT4zq81koe17wpPZpY3g6isVQENO
	 UjlsQns+tVF5fD0GLXoLYnjGvEPcA+77yo7AbupteQSWqoxQkjY+mZefC482jOOAOmSsZ
	 /EDXFX0xyO9CxpmdAEyL2EbHkp8fXQ1IJjiqQjAfD3t0JQKscayYZ/Qbjt6kmZRFZIvwP
	 +YjqBRBZ/emGS9pgLL3h3IdCCjonkVgV8zwy69wuXnm4QrafgcSVNgOr1U7Uqe+NAJYm5
	 ITM/VIxhHtF8hgWZtax/LrRQwHpShfIGmDSX1tVX6Oj59JVjgBfxoRB9TZXnrUBC5UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEl2o4os;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Va9bck5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F8606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEl2o4os;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Va9bck5y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp7Fn925496
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=; b=KEl2o4osfAgukKcU
	37hpQXKY6CxJAv7BBYINoD1KvD8kWG+nMULQeJIxpMeo1y7K+8/MuuGaTyJ+Zn/r
	XQjkWia60eCzjywUd8VYNCC7OiDiQ6cUCTsNwenDZbW06M5LiMIu+ugRnU6QpDKe
	iyF1ngX8K+EQpOOFh+g+PgoeuWFLXyrfi9DcTBmocl58VbI7vWEZoPZ3hplPIS0M
	wdwrrgdWrGkKQgEdXfkkPbwmRXT7U7xY+1Cumph4cJqrCrnvPJyggC/ZewOrDjT5
	i9/sukuFaAp9fQLocZJt/rP/Pd81Rg1ZejWtCGM+l7SL+6l9rTC6IG/Fr2us0DJt
	TFTOfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49c2w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:57:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso1134503685a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795802242; x=1796407042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=;
        b=Va9bck5yy8IsGv5b1ne5rBRXVXiM73mXS1FQQG7hRPMGRA97ti5MJ7kvVe9f5AX4JJ
         ET8McujWuhWLmV2/btg7aQz5UK3wFJZo3ckAJd6vBBbghY7puLhl1Sx0A6AfeylV4QYX
         Vzyc+iBIW0CTVC0wOlu+Gq1mBMvWZ2rpysp5IzcC3EpbwxEGX2FzQsZfojv5hKsfmzJo
         jj272c/aB/mEwB7KrS2BiJ/WgbeQ+VbAIkwxhlMknpxxNTc14EWANcmnpapAGiYBuwVK
         jk6HqHfRubUFwsrjdq4gNuK/rWZcbe9YgAIK5bk8PlP5TVpxN0ez4S3FC5Cp51b7YAx4
         gJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802242; x=1796407042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=;
        b=eD8JmKfRc+pD/hZnsPpR6Ynj1encaXC2PU26A1UKsC+OdZrwiy1rY7MhuJO3wFwcT5
         /vkQBsqE0GGk3oCjBPEw/DsKMskBUlAF8pVEY8eBEgdePOgAEJcK4094oHWj/t8t83BQ
         Yejp9XcULtQNJpn6APr3Sh+/3GX0Usvv/nGyiOSC2Dpmz14CHjiO9sFx0B0rvOO/mK1q
         gxzVl7OW0A/AVQNd19+K6GcLk14F4b3JC11zJOEIKKoOVTiHb//6uqm1p8PijnqnNgUD
         Eu9C6eOGa9L+dLnlGs+92wOLxIR7oGpRCkQfrftYP89XQv5BDJ3N9QdP/Fg9UqT8hfam
         DkjQ==
X-Forwarded-Encrypted: i=1; AL+hErHaDh5XTVVq7SigtODFOWchy/aw4hAafaqR47+omfqgNHI2/4tUr70zb+u3af6AXAbrA0rLij6NvdZZvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/u3LeJgTkw/RilNRGLoMzgRWRSOLgANq3MLI16Nf0tAbRakSgu
	jzf1dktHDlHHR4UWO/ih6HBYFUNAn0naUlPHm930ajflXN67CtcdGsTu8SyPolLdkPFCAr3OoyZ
	QjphgkS8pRf/+jCNdmYfEYBFjhKP8Wd5Ocuk8KoqrXOwJi1ocEopBPcAJ9V5+zG8uVA==
X-Gm-Gg: AZFdTZeSHmmREMa1NUDHBi7pjMVukWQSlX14imxID092Y/an+s1pQ4J3vqcOcw+JbDS
	StSz3q8KSosW+7sMb6Z2uVxp7HjpxcCbv+NReoP+Hk/zYhiJKtHR9wF5O7bWU74f4YQItx68Cn0
	AOQm2W9vAHu1rI2Ku5pq37rXttpZV17+eehW9eY5lntPK+IB7Km9QsZVyUjtwhBEpoqENEP7EHo
	t9/6YAE3brRZW3YvRXrKtFo0E2Xe/jjVy9yErg0pzY5kHTBdePndAQKb/BJcnBbR1qkIJQGGy9f
	8lIIH1gfoOg+n57eqsRR4fX3ckt8dUnMKKOfOVNARrErjTYEEC1gRPA4vRKgJRTPmTyVoX7VJhh
	bbVyFGf70lnNAnygNHj96MvcrWKGzSHsSsdunGWxvlXACMAXliBBIQF7Uve8TjMh0D6Y+YdvHid
	NrhA==
X-Received: by 2002:a05:620a:4142:b0:949:3c50:135 with SMTP id af79cd13be357-949baa13071mr4393793085a.38.1795802241975;
        Fri, 27 Nov 2026 09:57:21 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:949:3c50:135 with SMTP id af79cd13be357-949baa13071mr4393787585a.38.1795802241393;
        Fri, 27 Nov 2026 09:57:21 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm48952429f8f.52.2026.11.27.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 09:57:20 -0800 (PST)
Message-ID: <cfacf655-f30a-4145-8748-271c0e8ee4b1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:57:19 +0000
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
Subject: Re: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
 <awR2ML/nYeYHrUpB@opensource.cirrus.com>
 <awcdwnW0fyJFOzaM@opensource.cirrus.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awcdwnW0fyJFOzaM@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rw6FnJjQY9R6T4VQPDjAFI6R5V6Y1Wrr
X-Proofpoint-ORIG-GUID: rw6FnJjQY9R6T4VQPDjAFI6R5V6Y1Wrr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3MSBTYWx0ZWRfX4hw9QHy4lOzx
 NSFdG/jW6aX3FuDMt1M8qJTUJIU2BapGRhN8cksngkAtdLjYcR7QvSRS8tVFQJ0bgYM2KIzTqyd
 4z5CSFenaebHwnwYTccjeVUp5FskZ+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3MSBTYWx0ZWRfX85+EsizmNMZ5
 lubXJo7Xs1o4rCH5N+M27VF9fFcs1hEuinn0O0pc98E6fdF8GJBa1+oOSgrPgCo6oZS28JAuHL3
 /CYDSVu3YO0Q73pxVG21g+ob2+tk1VtqdnCIY1R2rPSHwnAagyqJa1qnUk52ClyALs8+dvhoZN3
 elT/uK/ky0FgNUIkQEyQLBCb+7GMBWlbXvfKZW4Q/db4a0N2yfKxhB8JxY+iD6z9AFTFm45IPEy
 cAeHXE/4wDTNgwFjzVVda36Hv6rykzb8bmZ+UNmcpEfjPhiMPJR3+Bhyjypdt2IvJW87UbyLJ5M
 JwfQ/gSVTZ7cO7C/ibSXUdIKZmRD63dZvMx1EiwpoViXuqoL+UkBRuLqvPYcviSXpl6uTJZYhwW
 HxdD02wz9QuoD606N9DL4h2hpxj6NQZ6GtEtW3nJW5BuKdGIOpKTR4jqBK3EiDMQ2HhFVoxdMpW
 YuCFlGCCMlrI2Dpr0jw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09c483 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=WC2J5OLVSIRpDh3yi_wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270071

On 11/25/26 5:41 PM, Charles Keepax wrote:
> On Mon, Nov 23, 2026 at 05:21:53PM +0000, Charles Keepax wrote:
>> On Mon, Nov 23, 2026 at 04:56:12PM +0000, Srinivas Kandagatla wrote:
>>> Only intersect with port_ch_mask for Input Terminals and leave
>>> Output Terminals on the cluster mask, restoring the behaviour
>>> there to what it was before 8bb24d87078f.
>>
>> Ah the joys of DPCM. It feels problematic that the backend
>> constraints are duplicated to the frontend, when a significant
>> part of of DPCM is that these can differ.
>>
>> The "correct" fix here is probably a bit of DPCM working,
>> although not sure how significant that ends up being. I have not
>> spent a lot of time working on DPCM.
> 
> Quite tricky this, at least on the DPCM systems I have (Intel
> based) the primary CPU side DAI ops seem to live on the backend
> DAIs. So likely we really do want the backends to use the same
> runtime, but that makes it quite hard to know what to do with
> those constraints.
> 
> The params on the DAI driver are folded into the
> snd_pcm_hardware struct, so maybe we could update that rather
> than using a constraint in the class driver. The DPCM core then
> has flags to decide whether to process the backend codec DAI
> drivers. This also comes with limitations that it only handles
> min/max.

This is exactly want i had in mind aswell, this way it should work for
both the cases, I have a patch on those lines let me send it as v2.


--srini
> 
> Or maybe we could do something like an ASoC wrapper for the
> constraint functions that no-ops if it is on a DPCM backend.
> 
> Both of those approaches do have the slight ick they basically
> require you to do special things in the codec driver for DPCM
> which feels like it should be transparent to the codec driver
> though.
> 
> Thanks,
> Charles

