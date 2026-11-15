Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737190;
	b=x8+oWkF29Pf7JhUP4zeg8+KyB4P36f1a9gZ6vJmAanzLUss+affCpuw8fdbSs3weubep
	 X3yruWI5XBae5mG/hyYvztxc7cZHQIj9htiMDVqYuFWUszGaTdV8NefMO8bS8pV36GiPT
	 nwt0FVcdzoHqdPWLsalUK4G97+MQdgQyd+qF4EJw6AZFRJn6BQU4cAL/DEN5jPKBVbGem
	 wiupq0mJ3+SodSuX1f6UjqIhFQnmJwrvUHC5VOG8H5rQII7QLAf24FNGKH2kHIY2BurOY
	 wJLRU/zflKp4auTCdCFRyx6JGmFBh36g3XjimGCScSVud62M4D0fEPuAbl2zfaYAcwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
	b=j5zlL9r6y1cG9xk8YFupQRRh46z7rmjLjBEca0rS+vi7x+VdOEmZolD64JDBu5d7EHJQ
	 PFC6o7hXyM7pDZYJRr4nTJvPa13LyN6YGgjq/X3Jd7QplqUwe3uenNmZH2QXueawsNJE4
	 jIS9TgozB3qohb8ffWluytHzuJHR4zZRJfozzoTY91UC6S1NtKlZKSw6bsa1+F461vwBt
	 gFGWXIjng6GGVavPeSLaj4Fpwrd9cR6l/sKjUOxomLGP1ICEZ732PcPYyFbvXTDQChsvD
	 UCJOGOkYseaalhaKop3v8CFOULbEC7as/PCmCQ1ihZYYvXobPP21EOzF/VfUR/BhWjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJhS6VOq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H854WM9m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA794606A329
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA794606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJhS6VOq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H854WM9m
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wTCX1871956
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=; b=mJhS6VOqqT5s6RYS
	IZ/goJ+6AJo7F40qNhP0aVD4hO1jV7egquRQwB9YB4R3hpWFseybL4ohva+84uxu
	FsiUro2LAwyyHlsHQNBgcnTes0VeHiBvXQhqVj7urF0vNJx0KXJdHmmUbKOD+0VB
	8+beuCnZaxY+X0OA+rwqLCZQTQfrBjtOGTnlTUxVIao4a+nBM8y4K0Wfd0BmmfWz
	gte5MJZ8vhCO9J+4PrKtIzwiP6sjh8q6Rgr4LfBkwTV6ZYnu/9twHCMUgdhNTreK
	89zGyGLBgv3n99oc6XS3TToNTC/36RsJnwDzwZkcerHTuxiquDfB+9KujyhE8PEt
	51C6qQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx2ub4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:06:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so405831885a.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794737188; x=1795341988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
        b=H854WM9mSmc8X/BzAxncKlKYhigjoXrQ+t+VZGBH+hPXmkWgF2rAjCVcJfaauvl568
         9ep62vCYUZ296SVXRW734CnF+R17M4zjt7dnaFY07eh2n0TTTn/eFq1Aqs+NLCj9dxdu
         5kQ7rp2T+3wvP/gP142sSbcBddPW5A1QUHP6czFTcG+5MNIjgEL2ufovvkuE+umYnx1p
         tvTrMNLA3QvDUXrpZM5b85iDvZ5FUNJqJwB43aYuQsF6bmg8H7Rv4/n2YuOMBbheBxvr
         aAV7Q/df7GzdGrpgl8ceuBaLpKSW8jBMFB3P3XSmI36YZnpgz02B0XqiVPqGg+MkFwxc
         nP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737188; x=1795341988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
        b=NODoOwUMdgXsLpp4ZFhs2/EQDnMlXgqlACOAT3yT8ExrYx+eFtib7R/r6chVy8dXLq
         axJrBwL6e1EvhyehBq6OBlvfSzG+qNfF5drRKDiw5VhrKbywzr5PJDc6ogEibMQ50h4z
         dWtoE9Ed8fXLOOxlxaiKPet3qx4fbMs9dj3C8hOg5GQHRzy3+9xGcRpvazwhNdHdSy5q
         VfNn1mGerbqfjQXgUaeokKidOams0qN3hXQacQHpPzz0bALKr0uOaaXNdBrs3GuHbT1P
         WrBf88LlEAEc6PrNi1139rYgQIUFJpHjjTngjO1wpL9VVS5NbJZkBudAYYaZ4wSOaWZh
         EDwg==
X-Forwarded-Encrypted: i=1; AL+hErHBOcC1faJtP67VgXNDuvUhJUL1IBOVzm6n9H5p1l5QtvUNPKXYr/tjXiPrJ/JhX50DxwUwwETK4av0+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9C9UIFKxEH7/mvRBwFupabbfFcZJVeVU+XGyokEcyFOh7BocHl
	xackKZTMB5+qnSUpHQnOwhwIccX0uMYk5r0DSxOENdLVYRujQ4dW7uKFH3nBMgLhPK5u23L2cSQ
	sdxKnIa/RHoTTLjCQNwFNtQX1GlowR4ziskJOgccpRhBAY+shOy/oF8gcbkpnDg5wtw==
X-Gm-Gg: AYBFou1WzwarP0YNBKEbV7VSxsjLpLfpXHPOi1317zRFfwaj9SOcqzH5wQEYrTCQL5s
	31jGEpf+dupcC9+fAsMz5dIPydEX6HxmWhJcLiqFNl6VaeuMQ2JfXaAT1FiRSejb5clMH+wOa6X
	/2mhPupDCwEnAf1wLXVBw7OuK0k2Y1JoWE+wio+soF0UV2XSZ8gL5ccEnh09YLcGX/WkDCwoZ58
	FFluob6aaWLa13Wz4zNzAa6floFDfnyFRhsx6U3KBuV9S4nxn8bDYS3wnBQBMUr8ahCNACrPtp6
	7+QYt7HAAm77TDOaJ9MNTca1XehNjRpeuKjEIEckVuBVrxir5+QIxy373dD5ySdr8OAVm3vC7+h
	haKgblqySMD/MPcIWImYL3V/F5vW0QcQXIk0T05AETrOnEAEYdC7T0ZrVf2gl2KEAjWqrjTBwsA
	1shB0qAUD1kEpaZCfegg==
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr1184791885a.6.1794737187941;
        Sun, 15 Nov 2026 02:06:27 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr1184788685a.6.1794737187463;
        Sun, 15 Nov 2026 02:06:27 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm3177401a12.6.2026.11.15.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:06:26 -0800 (PST)
Message-ID: <9cde423b-e71a-4038-9e89-d6ecd7da5399@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:06:24 +0000
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
Subject: Re: [PATCH 1/2] ASoC: qcom: q6apm: Guard callbacks until probe data
 is ready
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-2-mohit.sharma@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022144130.2443667-2-mohit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfXxvhmgg0cTybC
 M5OiqR5Eg9J8WUfTBPjxPo3AFywLBO2GuT5x6LBeZF11lVl+618Wy8baxsJ3BWa7WLJManSO8pA
 Xiy7yPh949SYg9jJeWW4RtPqOx3g1jgpbaeoJyegTfj9Oxyf1jLRiYx6jJQx7XO0ndlTOpeyQfi
 UWVNk9aLN8a6kepqjcdyif6JLnP1IN1/g13QTjdiFUYJ9iRFFN34lirRvXeF8jOeu13GZqdGQ3q
 ZY9D48VyQAUOpHNtE1vbwjpIf7WzwDMIQBAspQHhF/uP1n1hgjqAgM49ZaxOHcUNZN1bep18VEP
 31IcC+Qaw+1Z31qG+8EM/Orp8t13jdXHVMxwN6vRcL1ZX/ev7MNFZnoM8FfB24uQcDo8Q4B09Vq
 wv1G2HkgiUcR3aj/pxX+TMkvMUVyR2K/Acu/6VHPc5VgztooWhSUL0t0Gfxrz/TIz/YloY/BkJx
 i0u2Kr13x8LZtMc0Yeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfX/Yh53i78Hsj5
 QuCFdhN8OsBRebZUcKCUeHynqvBGyz8FW0APLLMtabvsTUQPIMZ18mdIfERhlwzUfM5+4yiLejP
 YLsQaOihGY5I+qY+ZK5xHFVWb4c8b1Q=
X-Proofpoint-ORIG-GUID: 5bxBFXvsOjMjeqNLrG4CCDpjSkaWmgs7
X-Proofpoint-GUID: 5bxBFXvsOjMjeqNLrG4CCDpjSkaWmgs7
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af98424 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoK0sgpsY2lmbaFclJUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150040

On 10/22/26 3:41 PM, Mohit Sharma wrote:
> The GPR bus needs to make response callbacks available before invoking a
> client probe because clients can issue synchronous commands from probe.
> This creates a short interval where a callback can run before the client
> has published its private data.
> 
> Make q6apm publish its driver data only after all callback-visible state
> has been initialized. Have the q6apm and q6prm callbacks ignore packets
> received before driver data is available.
> 
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6prm.c | 3 +++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 3ec3c5a18c7a..dbebb643cd5e 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -872,8 +872,6 @@ static int apm_probe(gpr_device_t *gdev)
>  	if (!apm)
>  		return -ENOMEM;
>  
> -	dev_set_drvdata(dev, apm);
> -
>  	mutex_init(&apm->lock);
>  	apm->dev = dev;
>  	apm->gdev = gdev;
> @@ -887,6 +885,7 @@ static int apm_probe(gpr_device_t *gdev)
>  
>  	idr_init(&apm->modules_idr);
>  
> +	dev_set_drvdata(dev, apm);
>  	g_apm = apm;
>  
>  	q6apm_get_apm_state(apm);
> @@ -930,6 +929,9 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  	const struct gpr_hdr *hdr = &data->hdr;
>  	int graph_id, is_pos_buf;
>  
> +	if (!apm)
> +		return 0;
This is going to silently drop the responses. What are these packets?

> +
>  	result = data->payload;
>  
>  	switch (hdr->opcode) {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 2042ff1e8ff1..5c927ebd81f4 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -194,6 +194,9 @@ static int prm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  	const struct gpr_ibasic_rsp_result_t *result;
>  	const struct gpr_hdr *hdr = &data->hdr;
>  
> +	if (!prm)
> +		return 0;

This is going to silently drop the responses.
> +
>  	switch (hdr->opcode) {
>  	case PRM_CMD_RSP_REQUEST_HW_RSC:
>  	case PRM_CMD_RSP_RELEASE_HW_RSC:

