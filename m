Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559975;
	b=2ZRxVsHuU8ZB9d4/+5rw2UfdD9NKPawGly+NX55PdCrDOZHKjqC3ekNwTagOX5+RIkq6
	 ZZF6xEvwG2dL4CW2LB7vTPO+rGuaHPt2VU43y3WbY+yas2VIV5XaKgMk1QlcttNs763bL
	 KwG+3dujNcJWq7dsGGK0A2oFt7CHAnwMZ99ARsx/IFeP+LVSUjaI47wsRSHbcgVqBwKJ1
	 gZlOvZ9t/Lq9PnDmG+lP+3ILGoKr6JsKIlRXk10VTuERXtGaG8d7s6wpiGGAzFsEkzhaD
	 0ZpuxbcFY0X1bY1NATO78BAhST2iVRSmb6amPmg17Tq2zhrzC8mQJxGdnEc+wYR9G3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
	b=nHyyvDDbn8d9bhmxW09o9DogfnehmESdk0kQcnzfYtzbQ8zjv6e/eU5veO5pGxM0w9kc
	 6uLaojVVB3K2BB2vqtmX0EPpSLHqYxDW1kWigEhK1BNo7vtmFTtsMCzfVZ3jGHENpISx1
	 3Ztl0fMz5siD/4zjY2zDKYIOrCPTHDHiq09Zj5UKjqrh1BFJpA5gvQQEpThTWYPbhh8Ux
	 miXADeQSpD6S2ozoopdBWWhT7Zan6QVxNJJ8O5K03dWG64dbOv5uro+wmAoPZE9aqdh6E
	 iYISruuBHP8tBTSigK/Cxm18QmGAqZopne85sClbmF1MMDvF1pWiqRRZ+Qr7G6ATamA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMRKsmdC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFr9r6gi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1980606A327
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 19:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1980606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMRKsmdC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFr9r6gi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQSEM889007
	for <linux-sound@vger.kernel.org>; Sun, 1 Nov 2026 19:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=; b=EMRKsmdC5woX7Uxv
	jv57183TZNgH9vN0WFV4bnXr5Lmg49w54lRk8ykXQx/Zjw4gAxQT1EWaIgqM/P3D
	G+7uHDZvRj7auKNKo36OIXN4cXjtNNLH6mgSG4wprpXrRuztiKLel4VbJS5ZfNzB
	MRROH2ai+wG8cj49u0REDHUD44jB2YRmkPJAzJhYaqtQ58sQwaULNfs+ocp3qMRF
	qD3SMortdMPufwuzEmmSBWNvofAV0t3U0uKdWVxIAEgRcdPrz5Xj1C5PTHVRWEIR
	D9fp/K3dh08G8cBrICIFFobK2KX9wIsS7iCZbyn4lm2+lfE14fLjaMw2tImJByds
	Wy5t5g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ekva7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 19:06:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso1826190241.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559973; x=1794164773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
        b=JFr9r6gi2riSRIxDhhic/9hICwhKLS8MmpV+HZkmK8pRWr9ylADOzWp9sIlYgPJL/M
         1PhrRib6Jm0jE9VorFV/YBJxVd6RIJwRqWoEUks7pJMihu5J7Aqee8cw2zCZe4M16SUx
         MqmO7CdOI6JuFfa3hy/GwjLjyCcHTd95NMj1xMPUjFmMp7MPf5JtJY5db+A7hnz7dAg4
         +SxBJqhD/l6VOru0sOi1f+NeilU67YBNAgk1DZ/7THKJ5NolF3UNZ8dbq1FRjDi0u+sb
         AyZItlAcBtuDw29V/cpCU4GLDYPp8jz9a5+UTvLkmM3awKauLh3aLY+vnzoVJ6uOD172
         exew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559973; x=1794164773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
        b=x50a4VEK44T9TiHabGoyMeG1Utq+jnBqG6H+Fs7jZEJePwZFMhH8W2i7pt6RTlqUjj
         RjZD4vIkNYoNnYGh8zt2rvOHp35y8tcwF0jDXt/J191929WB4AiQzsid9PUZvVewQgZ0
         iWaYSPAT966mbop3exTl1TS611hcEPPUA1vdpgEPejLp2HcAi2hhAoSzDbX2NNWrC8z6
         8O5gLpcMCNS5uqsiHhZUt66qPQygJb5RD5Vdp6s6G1uMcIf7LUY5T4mFezFkpnI42uOq
         uj8V0z7gTROEQ4fHXjjXRN5/PsjGivV54wqehoK8yAtAlpeTylXHFtEuBPLYRwkdMi5K
         akIg==
X-Forwarded-Encrypted: i=1; AKwUvByoZ6RY5ZaP5JASB2x6x/hvk3FuYPAZJ0MtxaxzKqJ2vwXFp6prywegAOoV8/6EZTnSPnuRPJV28Rjwmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JHm2HbL2FQO2nDixgx7CkBJvBn6tVE0UJ+bPbgHBf4EnZrWOF
	PgRDWxWhkqBw/PgR+cpN6g9TxOEVnCLzW9UBgwXe533iQm5Py7y5VEBbbDY74yp/MyxKF/azy1u
	ODsYDpjFPMv6jf6r5gW7y5Yao8QjVSO4ULsiauykEyvs39Kn5EtbReNYsD4JmVgIbHg==
X-Gm-Gg: AYBFou2090lDHm2N4wsZH3p4WT/uLbR2PUkkhcI83JxQz4S13dbuEU6kpt0L0Q0Cgb6
	BkjYlfBZgSywRRLde5qX3JYB1zmyvDm7TEnByidxHGtOXII0tkImYpQWK4zNP0YsjgorSGaNxKQ
	2kLrUTGTEFHVtq2jSJ6nfZ+e6JgPVlma5Kk0pTo3WfN9e8+7Aie2yimbFsizRmT4kr8iLAUdeIN
	gX1iQYgfkXVHS5tyMTRZkH80ddDoa2+iLmhmtV1CxeP114qM1KoVqEA6Pi6r7BsAAMPT42KC9/5
	9/M9VLqBdvm2vos/iK+8JIa6ibVlINJP8SdQeJ7YRgQis+4QRFBZfiDRddU1m1v8LBZxelClrLK
	AmDHU9myWpwq/aMDDwDDRGZcZZt5U9KxmH4pQ8W64FWet7FlQaImNgLhns9JZKj2cWXwtx9Fi7Q
	==
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr3652904137.27.1793559972775;
        Sun, 01 Nov 2026 11:06:12 -0800 (PST)
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr3652895137.27.1793559972307;
        Sun, 01 Nov 2026 11:06:12 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm15616335f8f.20.2026.11.01.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:06:10 -0800 (PST)
Message-ID: <07cf366c-4efe-4a80-a094-5ee93a683720@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 20:06:08 +0100
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
Subject: Re: [PATCH] soc: qcom: apr: Reject packets with header size larger
 than packet size
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX/Ig24svQwhfB
 f+c3ewl7MVz08qJXjGtOyjkhfTf1pFZE+vvvb3xhGZXJCWoJjX29WRlSNt8m4YEhOgvi1PlpFX1
 nbscCZ/cWUzkOZx+ttPqfjpO1fc6g5HC1DYUpfST1lg25zhe0TJEGgon7O6D6MsCw1b41m1ANx6
 ZETmGsCzFqWCMHMPoBrijTd45o3DU1bAWy5XeztkkPn+v5q6rAF5iRbWUl+JR4KZACi6scNxW/9
 82s+Pp5P7zikEIDKWkRiM8pdGMYQNP00EoMJKVQHZ3raQUM/g5UIKkGYvzH6njjngaF2daPArrP
 k6JlwY1gyd5ifUSKe9xfQSm8Dh5+1laebqlbnVKy4h+rqvCslZrLuqw1lvgQre7LtPZ5718bC0U
 JIdHXMhQp/cfo374JU5NcZV49VFRBmoDTleYBXAHJczzK7XNGSTZg6xnQk7Tk1M6zYs89G2a/o3
 bOgo/ijJRtJmuM8trZw==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae78da5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: Nvno5Sj750mT1weVjTTW8CZz-hbQKUGL
X-Proofpoint-GUID: Nvno5Sj750mT1weVjTTW8CZz-hbQKUGL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX3JExtjmcmzcm
 GtgyHw591a2nSsFxp4UU9/VJ9wOvFFEHf+IgBlJeqb+s6M2w3/7OrMO4YheOTjKeM1WOPExxkcS
 uRJ5DgZFWk3yFsSRONtPJHR7fAmN4lk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076

On 01/11/2026 18:54, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Valid Sashiko review.

Best regards,
Krzysztof
