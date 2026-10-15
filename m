Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF415172EB
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058376; cv=none; b=MrnO+upCDPbsX7oLxwmGkAGoAVSHquENnjJndGW3xM0eqUnaB6MnFmUMWf/bzUrLl0woUMqoNXmyZWnBWYURCxaMTsCJbEvymxJUvdtrKmCM8XGR/76hj53MzWlr3SdyMg2W87LO/ZkRl5fbZ1tQyzS5PsfFVZ45DZz2ODZ6XYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058376; c=relaxed/simple;
	bh=TPS7X4ywFuxBY42kPyEJIt1jO4uVByHGfOTGcFT5gY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQFl0ZUSvk+IohKRHo5gymiwRvmNhMu8ZAJqjqVxu2JR099wI/uFgij4mhd4OKxjtp2PBjbWzI/iKvegq6P29hDxmru2OHN57B2WD8Wz9owQAkx+xaaSrDx5YWN+f2v/xDoHhBCyYrelcmlTChffHNvc8Cj69u7uFoncd4tr4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZQXzvmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCNvQmAU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZQXzvmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCNvQmAU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhIR3510339
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6HuWkRZ6PRSrIH0wP63PHXsk5UEYGZ9FwZw3iYvNzM=; b=EZQXzvmPqP3s+ndG
	3cqt0tBC8YYtcP2Y6j9paPblMmif2RMsTsj4i1tep01sfhxbf1ywdLS7VnP969g0
	BkujYvJOHsoDrz6zIjtKl1ZTugQ0pk4QajE2CcKZOk9Y6OmLSfgAc2ZX70yp2i9y
	gRpQCf1j9v+53rGE3fih1K6DMdo41BRiMhVL8xmzfJN3fyd1tUW04dpsnlh/9rlX
	xDuHRhawlg6APlLsXMdX0a8dh2mcDsCgPuyOAuyOUtavNOThCT90kDNEk21py50s
	IVFMXmtKKpCHcrLlUz93E/rgAmCjjOeqBlcxAc3o2OKGYL9ryH43Kz83lGu7vNcL
	t3hQ4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9ep3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:59:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso865225285a.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058373; x=1792663173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6HuWkRZ6PRSrIH0wP63PHXsk5UEYGZ9FwZw3iYvNzM=;
        b=HCNvQmAUVLjjpMFsTpSFQWwF5ggbuBNYdoQnsl9lG+gwvEilsSFRJmC/3BTY2T/dr8
         +pz04XimJk2elxOgHDv5mf0L3a64eVnDXNaIz3uqANxpmT4yJWYZf/kbm/4wGPNz1Qyw
         IMhVZ+bER7rFhwp1OdWLc/pKFsklg9eJ6QW18kB70lWX6Afu8mRuboLqVCbXELxxRnEK
         PCAIauRopcOSoC2NzGm8CroUtxSVzccdKeOrJiX124Z2af6N0f/YLPpQHQM5TizAXiy0
         2wtA31rFyx7MVOyPEKGK19dOyEnah46JS1dS3IudapEa7ZtBEVmqh46bGF4uJnyiHuW8
         3E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058373; x=1792663173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6HuWkRZ6PRSrIH0wP63PHXsk5UEYGZ9FwZw3iYvNzM=;
        b=zXMFUPjraM5F9L2t++UFx+5HiAh2FpYBkvRL3xsg4rJLf1vs5w71n9l2OINC6eNEG+
         LrptwfLxNIkYNv5nI8654TlN4zqWCVGj/XogXKjwBu9s8FTloa5YE9Ay2XNCqS3nWqah
         QB0vS+8r8lgoEOzae0PyQVuAShWMFSEO8/kdA1msjOSXLnxPfyFO3ybXpkoZQpqurKAK
         pnZLk0KzLAccLo4qumSxOEJqilqHUIj1mF3eTGnfWpLmNegQuairs6VK2Jg0vAEvzpJp
         W5v3uRUUHB1GM5iawANbGT3ikqBTZcrdpoCJzEl4rcHy5koKOrZoKQCcu18e7nGZunhe
         Zq1g==
X-Forwarded-Encrypted: i=1; AKwUvBz/KqXGKnn3rnmNNxpYVATLqVlZDS6DqNcLciMPmt5VcfYEIS7T/7hCPzf+VzYNYe89/fJitbtP0CqNng==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYvnESjuJKcgUQ+QXZbXGb8piXUpRuagzL/Nfdou/zXj2i+knY
	r7iDqP2bL45Iuj9PHK4peddI7knheZNzI30YrYe44859ttzxFyDDoLt/Gg4bKOtfZ6JgQZDGFX2
	ykV1BKOC8mPAIq9OZfeRMk8PXZA7TWnEShpQiuMBNjhXNmIuwxqcGo/1Mclcq7OlCAg==
X-Gm-Gg: AYBFou2oKGbw41r72Ot9g+4en1Hwv798ciYlmQPkcGhs+ElpC8uyD//CuMmSReRYSgN
	7p44ZqglHYP5ctMZwWp44l56tajHFl0xHViIB3mfRyuTTlWzKs5IAj+R7sZsYR6Npl07TU0Q1D/
	hutRm2LI8oU/Ew38sN2scQcvl02MU/e5IV9jKQuSj6oSkq32wbaZ2kfyys71lAZOFwwqx2nU38w
	pm/S3gnirrsI6uv4QA/D4pJoIaB4Z3/FVZHf1jyz11yJX3v8zIdH2JxwTcwrilTOP9TZF+f+orG
	TbJfBOwThvTyMSQih1byZGowymEj48nwr5cb6ea9nmWAjho8vjGQSFy2TqVfXeUCopAAMfMYl18
	6gBesv7+p6ZIipEKrmNX7q9VpUA==
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr3052887685a.14.1792058372841;
        Thu, 15 Oct 2026 02:59:32 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr3052884385a.14.1792058372259;
        Thu, 15 Oct 2026 02:59:32 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm22128628f8f.4.2026.10.15.02.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:59:31 -0700 (PDT)
Message-ID: <fef22189-05c5-423f-b0e8-c1ba9dad0fed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:59:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: qcom: qdsp6: report the position of a drained
 buffer
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Zhang Jiaxi <Z1529105815@outlook.com>,
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014162703.10172-1-tvlad744@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261014162703.10172-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jUeC2EC6PBQogvqVozJT36P_VCBoChXb
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0a405 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=vypxUws9g1tSpB0FtU8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0M8a53phm5Wz
 iAflNMO/ZUUBkh71++UhcVaWLIL0eAoE/alJnhF3m2fc+EzJDhvJQi6hssUfTNl4Q4pLluwSYJ+
 9l3ByU8jRYnXpXs+KDMVZNlT3mRlGKos9O7tchsu9XC9vjwon+I1swQbl81wMCP3i8nYNoxxkzE
 lVLKE/XzSEPwZ5x4uoaq83HqS45MMhN32N48ULTfdVVs01/o65r+r7QzH4mEMA1JIokE/IsW7Gc
 4luVv6tzMCP8qSXWi2DjwvuOSj//TfAVVd3qgBn/CQMoWEJpeRFbSOdKVKEYDr4rnxe1BDbt+fc
 QofBTzATs70mjwDlGI+Eehl9jFaDQmHtxADlLjvNg78334Qj8scX18dDrzhB9T6bkUVX96B54Br
 4i7JRpozSM/39gRtIn6fj8ki9GqfoSu9yq+wPpdltSMYbLbAc5uEJbK+0zkkeBrQeikl0EsQeTT
 D0p6BnA4WgCPr0XfeaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX1UlYRvKFmN4i
 Nbb5f+1/18BpvpkO+CMqcHORNJPn9avF2BPf3Jf+myjX7COL4bawjy+VjBvFuKPbdpNHvcpWqKr
 tYGnVaGjZFYr3mkLWthoTTJbBZb0se4=
X-Proofpoint-GUID: jUeC2EC6PBQogvqVozJT36P_VCBoChXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039



On 10/14/26 5:26 PM, Vladyslav Tymoshchuk wrote:
> Since commit a93dad6f4e6a ("ASoC: q6apm-dai: make use of
> q6apm_get_hw_pointer") q6apm-dai reports one frame less than the
> position of the last buffer the DSP returned, and commit 44432315444c
> ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") did the same in
> q6asm-dai. When the application stops feeding a playback stream, the
> position never reaches appl_ptr: ALSA never sees the underrun, the
> stream stays RUNNING without period interrupts, and drain ends on its
> timeout with -EIO. On a OnePlus Pad 3 (SM8750) this left PipeWire's
> PCM stuck for hours after a stall.
> 
> Patch 1 wraps the q6apm position to 0 at the end of the ring, as before
> a93dad6f4e6a. Patch 2 resets the q6apm hw pointer on prepare, which
> a93dad6f4e6a also stopped doing. Patch 3 is patch 1 for q6asm-dai.
> 
> Patches 1 and 2 are tested on SM8750 (numbers in patch 1). Patch 3 is
> compile-tested only; a test on a Q6ASM board (RB3, RB5) and on x1e or
> sc8280xp for patches 1 and 2 would be very welcome.
> 
> The RFC "ASoC: qcom: q6apm: correct PCM formats and error handling" by
> Zhang Jiaxi [1] touches the same hw pointer, in graph_callback() (4/4
> "recover PCM from failed data receipts"). The two do not conflict:
> that series changes when the hw pointer is published, this one how it
> is turned into a position and when it is reset, and that series
> applies on top of this one on sound/for-next without conflicts.
> 
> The analysis, the patches and this text were drafted with an AI
> assistant (Claude, see Assisted-by); I reviewed them and ran the tests
> described in the patches.
> 
> [1] https://lore.kernel.org/r/SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com
> 
> Vladyslav Tymoshchuk (3):
>   ASoC: qcom: q6apm-dai: wrap the position of a full ring to 0
>   ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
>   ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0

Thanks for the patches,
Lgtm, tested on Lenovo T14s Gen7

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 12 ++++++++----
>  sound/soc/qcom/qdsp6/q6apm.c     |  1 +
>  sound/soc/qcom/qdsp6/q6asm-dai.c |  7 +++----
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

