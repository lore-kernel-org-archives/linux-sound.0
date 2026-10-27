Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089947;
	b=CJ8YIU5anvlvyTUN+TwolqxYEw1iZYKM4x3g8DPsCng6XBcKAGzThWnD3rRYJcj6Q3lv
	 EEPZyrxVubU0ANoE534Xow5Nwik04Bgjxndb9poCi8aENJq+NAFBb7wTHxjALz0f7Cx+P
	 lj1UikLtiRelIkySacDkgnBpnFmpieuzfvolilFdLf77H6FxRfvmDOCaghfhJOFy9rT0t
	 mK7d2tXxaUQBMqOZwC2CagffquQEWEfDeVqp0tBad6yH2FpkvB0V8MmFIEpLlw0EAqKMa
	 v/S6FkSv4H74Im6s9l5UvWsj1SNLrTpBgKYGtLHFLeWmQheTSsL4tlvm0laB1r+B9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
	b=oPMHkV4R+T+/AIUwifa7GY7m33E/KswILJiVrYcb9J3OYXpZALo4HvURA+w5tTSOhYEF
	 qQwCC+I48mB8bJk7fnVhWgVzIGjX5hvTtUU24D4ZBjOg5/ryWQB47LQ3TNkWm5b6keUrK
	 +JWKk9bxEz0whm+59Qn0RKTKhrsvhdPdr3fgYNDhNZK/EvR7zQ2s+YJkBidBApJbfKU8g
	 bmDQJPdTsXnQj7WfGSmX7zXHjYoEZ6pqsCZVia0hlMp/lTrB3SCOBfj3pBUpdNPlFCLWy
	 ETzRj6hqZ1J1eX9pyVUuj1NetGT7/3ba8roelnglD4ASuFsqZ3NDJZ35b5isLnk23og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUHTusdd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF12606A327
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF12606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUHTusdd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YwlH752084
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=; b=TQt2Um62gtkMeC33
	k22+7dsfMQTEI7Kgd83HTKTwp4H7RqL923gCm8XxzINjxyHejBhRbEmmmaC7Vfum
	PevcXHhi3S+pCtKRgZRshE+q5XdPhT7KIssVXYeJkO8QbghKB5k2RocHTIoXHMWj
	EgSdBXIKJXMGmlitoV+fo7wKULJQ7O/qPd8wDwDnPvBqWfKC9cT4/xkIe+W7X5Eb
	Jeh71G3cnVriK+q1nLXLxwZo4yyqYXNE74OhipIao6TGexJ9/yzKB3Rr9P4vijrr
	+M2hobyAxe5bgWJBnCFyAQtVykzuqmRSrTmCby97G5eDXt4T3/W417ZUqJ9sufJW
	Tz8p4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmap2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso48413565ad.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089946; x=1793694746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=CUHTusddBqkPRIDyGX/dtAiqf5eICKD5rtrey2erKUyemQu3l/2Ni46YspHQzh0cHM
         DWh5TutRBHLSOIPyjtKCChr2LW0mp53B4L4s3jusOoQMHwfkwflCdk0l7K8ILJgJfryq
         MyVgzKydLB7Mal+7UnIkfvkQO4cYliOpjHglHx3QDUqpdkPkGfr8Z5rHXCEGc5vYWne6
         arhL7z8dNvhoH7ZwokL3mi+i68WHtbTav+wnHNf0hsoVpBF0AdreXqWhml0HBakrOi1F
         cjrm3AaoV7eXghsNy0GiZFNlSXVbBJRds7df6yqB2vqdPA+IYt7d8W+adrdBgMo/6bKY
         G//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089946; x=1793694746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=gZOD3Amxc9mt0g+x1hGMO9eL3b3GJItzaoKRm69ZXTDO6vR+KdxaquNcIVL+qWLjCT
         id5dFrRlLdvoQLnXGaT6BndevVohdofVHer/SWgvr2nBwTku8G+vVHL+VJtbm2Fx1ogw
         N5PgBqCsGf7lSituBm/Vwsvjk/eU4dmUhMxXdinHCy15HQgoFlHF14R3hSQ5Avofta6b
         wAW3i9PKePDojV9Xb/OWDLYBgZ81OTv4nIgCZecohFpFxc5qk2tUe9jx7yJarv4/2ms3
         E+jkljaPpjZJOQxF3ipb7C2MLQZRZfr94j+JSinsifaoDWFB8legwfIAUiVSVvsyhSss
         16Gw==
X-Gm-Message-State: AFq9FYJPTOyApwqF3VPB1s+JLC7+YI0Z6iU5l0QPfHK22I9oUHhuEUPQ
	RrA9qUeodFk182QWiP6jqcU20eq0ksqaS9mGAdVjRf1lHMut0/BSklnMkjZ5W688kVNEfuwwm2s
	ly2tqRx4LCh1bWVpseFkFiuaXwbeiI0jOLKLn+z5Iyd7QXbd5WvM5bsKzi7bnJvr/BQ==
X-Gm-Gg: AYBFou3ZnJdXMplwEY85L+uh6taNpHTjKjQS+8tEXmpzyRelxsVdhNZEOEBjoctRD1B
	BdFH4UavVcnBdU2Iox66TfET8eYdjsGfL/0M5YqtLir0DoVlSYO9aeqXwkQnqMUisu+28DgJofn
	amVj7KJJmFDY7JCC4TKMQSx5Qgl98KrZnPanNgHa42TD2yUOnqKMTw6nVsDbNkP3MiJo0yLo0X0
	WiE05PuDGyQsBJr1kc8OONFMLOMjiWtXLvV4tqzElcp03gc+nZvPqt4v4l341uMhvzec1sZlSMa
	X8AEWSgM4JODKdqb/5MHh7eMg59wLhnAdNXobhVKPHlVIozAtGqscMvq4Yyq17gFEYTiOOQ4QMS
	rOHnJsam9eZ2WGFzhONK+Q+KDlE9s1hk0wA==
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69648095ad.34.1793089945485;
        Tue, 27 Oct 2026 01:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69647855ad.34.1793089944998;
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce0f45sm5545525ad.70.2026.10.27.01.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Message-ID: <37a69bec-db13-4acf-82c9-854fdc441ece@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:02:18 +0530
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
Subject: Re: [PATCH v1 3/5] ASoC: qcom: q6apm-dai: Add 32-bit sample format
 support
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX9jDL72iTfq1G
 /3AUBX2reOA7BZe+3insou04ATyVdrUE1WTkqLESpB1YCBKMJL9uS62H6nH4U8WYgBHg4BNx068
 Rl8huwDZnlVMIN3DZC3fomZHUOmVNTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXykv1GYK4vJoc
 umBtUEfExkQi0d3Jgc6iXNu0AqUPuqw6FJM4oapmd0VVV8kPoN2fQrQbZyDMx+N/y9ccL5Uwn1A
 i6EOsa3zzQB12tSObOWn1LxZojYjX3KJOHafFcgNfgIsmtupcAYacO4rzaMLuFcg2ED0l8lXUsm
 pd6Xf2JVz4ZNvf/pyFcmO8N5c5w4XyGxQFvdyAAqzEj8gpre2X/KinWMZFMZVz7InqaGzkI7+G3
 ym8jqJFWC/HUysTMASMbPlyLFkPxMewY2az/50xc/sWYGlOWHrKwL7x64RJEdhtpNJRwrYDaAOK
 Tb5OEhTnNjeXJxMWsZXJC+5YLIb7YU+h3ueMjli1kB7EQBNSyuAUJk1chUE9bQQN8RewtCdzhE5
 YB9zSd9Rm7bmhfLJHjliJ9QPtUR7yFhkPJWOUytuusEn+HIeRU8C2Rot+CdywIGm0Y/FCGAMgW7
 SSo06mQDgFt4ij+K8YQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0619a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uxQCGOQySBFxhreOsTYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6vYbRkHxpZO9Sf1pSTwlXYS8cAFkmbDa
X-Proofpoint-GUID: 6vYbRkHxpZO9Sf1pSTwlXYS8cAFkmbDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033


On 10/22/2026 3:13 PM, Karthik S wrote:
> Add SNDRV_PCM_FMTBIT_S32_LE to the supported formats for both capture
> and playback hardware descriptors, and handle SNDRV_PCM_FORMAT_S32_LE
> in q6apm_dai_hw_params() to set bits_per_sample to 32.
>
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

