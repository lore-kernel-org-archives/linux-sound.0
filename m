Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D5481FA3
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328091; cv=none; b=smdwlWWwmKZH8kTtYGmvGA59COL7kI5TT5ZPyJUk3R1HbvapHUh6qBjVKkKTxIBsRtqTcC7tqNNYNKYLlG2plVoPdNHk5gxS9SpcH4+K73gwbxDJZLp0yzY5zvXK+2ZlDY3kgos1E9k2zNJh3hpmpfI9TGaoKfCB34DTCgn1fQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328091; c=relaxed/simple;
	bh=mvedpIxak0Fnzj/mZY4251qn7YJgCBi9zAfCHtRMKVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8SyaEqklAMCdyV6RgjFEzVyeglUYQ87KXB7p6eleDv1SIQnrZf7GFZwS1scTX/nQkH26Wr4PZbA/AhtjijhnKCszA2JR0PbuD2YSzBnezaDESHZ4HHwFHikBeXqWOJeWYGwR16uoi704aYMDW698BRX8Gi3iv0KJK+8Xm8wjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRTYy2jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr69nHRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRTYy2jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr69nHRY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YoQp3532401
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=; b=fRTYy2jvZM+gocIf
	Anjg/IjTKq5zbwrdhfH419Jt9409fi3VgGXtPuFwOFCnhHnXB/O2OMFELzUd+LGU
	qidQpL17GbphNSW2n46rTQBteVN+Fd0wWNmJU82LS06qVnGSC4L5nyMtdsYiy4sw
	3hdh0/99kT4e4y2WluAK8vsczO9uDilKk1njvv9dkGBwlVJJUf8PSxf3+3G9hSCG
	6UTveLjrwCTzrMVmTNBU5IPZW9P1X2pytvwd531JXQ5yZrX4WHxDzg/oTiCYUJzc
	jvf0XzQU1Bpc59PbAptplKXqsKbU/OlGF7xlk5j97AWuBSsP2jl/c/SBJwOAv9bP
	4GgaMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kaj9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:21:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342217d8d53so444484eec.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328084; x=1790932884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=cr69nHRYtFJt/l9lpjp//8V5uC547BKVpm1Jh6dO4bpXhAv4RFYx1sgcmSEWPyr9Pn
         TtHxqO530zqDMNo8m0dgeRyPzG5s/QnVdsot+ureo7XiMUsvzM6DV9fYWql4NNiSxu2A
         KFF+6wKU6CJ3TfBwCjU0Y4EDViidT/AqFrguNpTIaJXtwmKlsC3x3l2jW3XeHo6aU1S2
         Eg1GmAgnkucc7/tfwobAf1SGT9HeMMqF3RX052lmM0I3Ci3EmAheNz6ea6g7eOOXC4Xa
         OsJb6lkvDxYwOdzuVD+NYrbj8BbVqdXvhskpYrlNBKJ7XNTJTMaXW2v+rkDuR4vDGJnQ
         r9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328084; x=1790932884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=1LtjptrzfxRAI7nmIkJHPsZWDW4SNILJiiJkPb7YTvMin+KL3mXFEpGkK+1aD1rlM9
         4fKQ030gxHWQsjVfpBYX6dTNoMxhYTXZAofpnjMRI38DAw5WuxtCNLo/puAqEt+lZBML
         yiQXZzh0paEFQJybFGSq/KKcOUZND+6qh+dxLNUvYKGNsTwIm6eG78T3wEsIWoiB2PNt
         zP1nGpx2Wz2dNP1ws62QzapRE3YPvq7CAQhY3oCN+VnHqPt/y4tKqI9HJvxA32doDJAW
         IjZ7+yMGVooh6hHlyBXSeKDu1JmCdHb3MNp2LT5xk0msLhgEGrM3noM7le48vVf1hziy
         BKlg==
X-Gm-Message-State: AFuF++nW9Fvse5dqL6owma899pyZm6QCxQ6tFNIsbDha/ORwGQ381I+T
	K3bjYGBD9bGX+z9CsWuQqvaS8hpJkod23YFl0/uXJwE1ECTfnKH0yng0RY6Io1mmeh3mSmC6zYt
	UcpM2suJtaNxISeBSPn07hPl+ul93Vc+eys7qFOyv/poXms7bHpwFgp2wTJMhH3jMxA==
X-Gm-Gg: AYBFou0/wwiTrDafRRNV5iPROT4fds1PdX6ZRrDdGwISfQb6JoIwKREZUyZTgVf8c5Q
	IIorYnlbG5OnFD4Ll3/31xgbQNGWosA/lNqybItNqHWFbz59FDMVD86g7nMRIS3/xUWcyYzWHQp
	hKCKcYkgyXIyRu1TtEzQTAAzzgKoVH6vUOWXEdfpSv99qbSczIRHoYvmrOCBuwl7EtBaYiYNx3/
	li3xelYReIvF3PEzP5snGFLWdkFpQdlXkdQm0ojHUna73YUjowhv8JTiVKRU/YEAxQ9RT9i6k6P
	3LE3WNeQQBESjDi9DVbpE6YQc6B7pji37Q72fKqSSlg8cxfk/LlyNSur5WUBSYcUwSUkIVeup10
	HGJV/a91WOp2eGSuwTizOUKRoFNGL
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810953eec.19.1790328084003;
        Fri, 25 Sep 2026 02:21:24 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810746eec.19.1790328078540;
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757263sm4813814eec.12.2026.09.25.02.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Message-ID: <8ea976cd-b012-4ae6-a74b-b5c2dceaecbc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:51:11 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab63d14 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ohAgsov0r_a2WbmJIscA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: woieVFx8oirf1szbRpP3F_3mFd9thf_9
X-Proofpoint-ORIG-GUID: woieVFx8oirf1szbRpP3F_3mFd9thf_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX5QCAnnwOCZ5X
 6ZtJTV/M9/aiLpD0jqtPgOaW8TPMsY5oMR/8oUqjQuET24PruyWb9YrCiN1L3X1ynTinp+XTRBu
 xiyIK3U509U1Mtd9Gd9/tU2V2dfq7c62+qDe6kclK3vAD4jyGtroaGe4rwXb2nCrzkjKUDNUV/G
 +Yup01X4VpF5bq3KImZSy3C6n1XwW4nhvCICKnpm5cVdXK9Ec1Q7Sn3ls2gPYSRxijhUBEyGz91
 kIaDsD6/meIM2QMIrXNsZBKIizGIuyZ82oILJibXuzDr7RHsImQpqfTmI8r1YaJZ20wmRxrY8rl
 KjwxH6eDu18huXTDMv893poA00iN9ncrWgwdb8d/EOVWbGdVO9nfrF6PLxOoJdjILhFgt/dhQc9
 lsuaZlOMkGYMJ+Ud9u5keAqsdnNSbobdApu9gYDPden84yLIhhwmyY7RB2GGDDN0hlfCpElc9Vl
 y/RMSn8bSoJMqaE0wBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX0qXIrYLGu4Pf
 s1NS2fczVo3Ujix/6WwJuoG0X0pD0zOQHu487bmlaJxoCP71bm46ic8PZtEmE0++fRIcZXCG5/h
 uepqfu8PR5fUiogcntwpXM9ritfSVkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250037



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> The VA decimators can currently capture audio only from DMIC inputs.
> Add support for routing audio from SoundWire microphone (SMIC) inputs
> as well.
> 
> Update the decimator source selection logic to switch between DMIC and
> SMIC sources based on the active input path.
> 
> The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
> the SoundWire mic mux, so a mixer write to the mux that is not part of the
> active path can leave it stale. Program it from the resolved mux state
> when the decimator is enabled, so capture does not depend on the order in
> which userspace restores the two controls.
> 
> Add a helper to detect whether a decimator is using a SoundWire microphone
> input. Use this information to skip DMIC-specific HPF programming sequences
> when the decimator is configured for an SMIC source.
> 
> This enables VA decimators to capture audio from either DMIC or SoundWire
> microphone inputs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

> +		if (!is_amic_enabled(comp, decimator))
> +			snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> +						      CDC_VA_TX_HPF_ZERO_GATE);
>   
>   		usleep_range(1000, 1010);
>   		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
> @@ -1046,7 +1079,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>   				0x0);
>   		}
>  

The commit message says the DMIC-specific HPF programming sequence is 
skipped for SMIC paths. However, this only skips the initial ZERO_GATE 
write; the cutoff programming and the later ZERO_GATE clear still run 
unconditionally.

Is only the ZERO_GATE assertion DMIC-specific, or should the whole HPF
set/program/clear sequence be under the same `!is_amic_enabled() condition?

Thanks
Ajay Kumar Nandam

> -
