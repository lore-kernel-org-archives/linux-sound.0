Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1142BC25
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170867; cv=none; b=Ib0jvuneLrkYY97t8T7J/M9UEhuX9ReU/dVt+3vDLqZCRzVZInyXdvUeACxsluczbkz0ral3Z0hqgXOHg5hwTMzxW65KThUGoMLGKQjWcLftoZsNH+wdaM6CzC35BNlQkt0wUBTavvEjy8UR+QY197BoIms2L4edGsbC6hcnFHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170867; c=relaxed/simple;
	bh=6osKRbk0uKsTETOujWjOr11uRimT0wpIsULkIpTqtc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H09VtSAsSlJawsYghEEnfPgBvbC5viTQDr13m8KyS4lVr5Bd8R2p4uYd8XPeSZMns3ZGOQrlhm5TIPfGPnJOtCgwSYVhsWB7d+T5LnhCen523ZVzfUvTv8mJyQzNyzrVH8DIYPJNuVrqtSfN4ncqb7j9krNU0xgGjqZ+fxFeGz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrekofF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evxCjg+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrekofF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evxCjg+v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlflY033185
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 16:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUEgTvaKONdG8ocE/B3l4rVpV7LguUz/D1duATSW5RI=; b=PrekofF66EujB+DO
	sMUbS77Y5iVX7muLi5svnPNCeFMdSyDx3kDoSKU/INZ8w4nl45VNwQxVYeQoq39C
	l3LdtH+GxQP1kyNM9DVkjtiPG9U3VacLmOPFYlLpa7507CLhQEeZG3wGEFcTP4rh
	f0tDNJw0mBroZwoNiDsOTvudwmyw5k6G/Zsl4NqOohZUk5CHVppV605t6DY+OZOL
	8w2RU2Rg1CoQ0A2ZB3vKxp/ZikXbZdp8cDX02M4Y5RnMRlJJ6EBws2kmskK64sjk
	lx/5FdeAcwdOsFQcbWqZzkaX/p3gkH8oDk1F7w21gQhIBBv0lI1OSn415fkQJB2o
	ukynBw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c61y8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 16:47:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso2978812b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785170862; x=1785775662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUEgTvaKONdG8ocE/B3l4rVpV7LguUz/D1duATSW5RI=;
        b=evxCjg+v/co3wJKCyHM2bBrxbc1KGJdpDkwjhPSoJi8Jp+xBcTbjQXSn7yy7qGaVa1
         2h8omU7mtNt4IEg83VDyzq5u5w6v1pemraCK4OS1ZOFaF4RvxlKcLLTkN2I5Mk22cspj
         vw0XcAfBsjE0D5IZBlkN1YcgMpQZBuFboR0AyPwqoyl167N8/Owa9yuzQ0UkgGnDHjf7
         grcKdnZvxMMvB+fH8gLYhTiL3EbLn+4D/05nQQ6HgFAJfpbE+6+0SuTkkGQVqk7+TW/D
         L+NmGoMsbkPrAWdvUMGGLvJr/I93NWX3q3blFdOg+RcEp6pg510fxL2Cdet12Nvhwpsj
         Wesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170862; x=1785775662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUEgTvaKONdG8ocE/B3l4rVpV7LguUz/D1duATSW5RI=;
        b=je15Oqn0kLBP7p2biSVIlaN2lGIqbaxVZmn3arAsmXZ96hpV1MB3R5TNgP9en2ldBo
         8aVg6dIpqK9aHH6+LETwG+Qez6xddibP0UKHwHO8C/wGLKqG4B9CjuHoArsFyLtI/n3j
         6awxzze2S0+ZWtEw6wNTxiviR0lfN4oZ3BuotBj8zXamntCBixitUtrDmLPrbZgH02qP
         87G6gyl3g95QK1hPU3uAB6bcIdPpuBEr/13QyJcEq6n+vokkzpdXfWLUf9TWNMOXg+RO
         eGyNkmTEJYABmrPNP7G6h/2jgXX+adizXEZoEBWu1ntjdDoNLLi/QXF/hPzWwRnvbcLY
         Lxaw==
X-Forwarded-Encrypted: i=1; AHgh+RqFCYTUQdLS6oBcVUDfu47C1QisrdmmrWioRczpDcnsDDbvnseUazP8LNwbt1R9zYhAb2YA1kWEx37TEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKpSEqZaPT8th65+2AzB/RY8Viyr7qDznvIuLiW/BzCHSBwsd
	Vs65hbVGuhUbqBPvH3Wh/zJutj8fMk/I5hHAqUKtrEsjPxUnSszRizc11UqZffQBaKIiWGOcGuW
	iLsB/02k6ErMHil+ORvJg0//8SnIGn86y+kUxYsUF9gkdhO5csSNcas5wr08suwt1Ew==
X-Gm-Gg: AR+sD13RzofCt5PCM3apm1Z8Z+ySTVNDfnaxWLxjY57k1BX5WBPSHLDgAXi2ZhESD/N
	YKhmiC27X9Sk5SqMUw/+aCKaDmip0BR+ZVFiGfYrMX0Ev3clcEiZ0c2MLDDxWq2OC3WDCAWrKmI
	RbxLdEU3W5P/iYcl5KXfkCW/PyorrLlxauoCjw8LoiHIWtk3pKq+jZDZLaUDWuMqV3/3qn1Fedf
	o6MrKGKSrApPsuHulp4ApdsrqSP9J/YOOIgvyYwURaWctd7adqNmoWV4QGgxozDxYqjbmyC6Lz5
	JpfA2dpjLUmbtKiOuhPrFqocjkshOIDvxuqGLTDLzJ7Lxij+2KnHeBKTDYJJTWVqZaSirCwin0n
	/kNaiHH4fGHrDBgzlKiSSWlnNHFJdjA==
X-Received: by 2002:a05:6a00:1488:b0:848:3dae:66e2 with SMTP id d2e1a72fcca58-84e8d094ccemr184015b3a.26.1785170862493;
        Mon, 27 Jul 2026 09:47:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1488:b0:848:3dae:66e2 with SMTP id d2e1a72fcca58-84e8d094ccemr183986b3a.26.1785170862021;
        Mon, 27 Jul 2026 09:47:42 -0700 (PDT)
Received: from [192.168.1.3] ([106.212.244.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm3301603b3a.58.2026.07.27.09.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:47:41 -0700 (PDT)
Message-ID: <8fcea280-02c1-4511-a51b-438254e0b8e8@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:17:34 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a678baf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=yelsqLKVWbcqNe5dfEYUXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=goF0mpTvZGH6B-jPVEoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX3ZTcs7RaPkB6
 /6+rNo8p5CChjQUYik6DmgMsqemYHFGtrrHx7EGyrT5ijIvsVU9IgYW4DkzEkcrYEYrrhC5EkMS
 wtahqewtlPxOrZcQe96s3ZmXz8FP1+Q=
X-Proofpoint-ORIG-GUID: J4JNVUEsKFLM2hs1Qf3ckNn9AYTNbYXz
X-Proofpoint-GUID: J4JNVUEsKFLM2hs1Qf3ckNn9AYTNbYXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX+BZDNrSejipr
 QrzNBvH1BzOGs74w69xl7IXMPS8nHwAxYqysqkVnjS6gBXiEOThnhG7enBSJyVYRdm5NCxTa7EN
 qLuNozYib1DhIycsk02xrNhqiiKDWCUZtA6YZRshiUDwjWBq2NRBEP6FxI7oVzo9JmmCdbJhWzF
 bPeD+ippm+vy/hHdEhySwoCdq+rqL9SLnf/UymNTRuHa/wueLcpp7WGCNXXZ6geZoZSfXMRN5b0
 49JY8jfhalXghJ4+y0njeN1fvXHOo9YCTxFX1TlCe2wKdntnQk6wy8yeSNXD3mLDjOiVcvM0MMe
 eTahoTAagkZntC5gJX6hGpUEeC74Gqryi/DhHnS7B9hkR1XOLB39TYCglABwssC8TbhkN6KNSHV
 M7m7HHrJjtgPgKVsXQT/WedL/KVrVaXXK68wBuE8CxI2djKNouxBtG36rhr5gZbqU14ztrkEnie
 h7AG0yNFOhynXOIg8lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270155



On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
> now retrieves its clock handles from the device tree, allowing per-port
> clock configuration and proper enable/disable during startup and shutdown.
> 
> On platforms such as Monaco and Lemans, third-party codecs are
> hardware-wired to the SoC and do not always have an in-tree codec
> driver to manage their clocks. For these designs, clock line
> enablement must be driven from the platform side, and this
> series provides the necessary support for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility
> for voting I2S MCLK and bit-clock has moved from the DSP to the
> kernel. This series introduces the required device tree binding
> support to represent and vote for these clocks from the kernel.
> 
> Enhances the sc8280xp machine driver to set the boards spacific
> configurations.
> 
> ---
> Changes in v8:
> - Fixed indentation, reported by Krzysztof.
> - Resolved all sashiko comments.
> - Link to v7: https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Changes in v7:
> - Addressed review comments, reported by Krzysztof.
> - Drop ECLK handling, which is not required.
> - Link to v6: https://lore.kernel.org/all/20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Changes in v6:
> - Addressed review comments, reported by Krzysztof.
> - Resolved all sashiko comments.
> - Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Changes in v5:
> - Addressed review comments, reported by Krzysztof.
> - Resolved all sashiko comments.
> - Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Changes in v4:
> - Addressed review comments from Mark Brown.
> - Resolved all sashiko comments.
> - Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Changes in v3:
> - Addressed all review comments from Mark Brown.
> - Fixed OF node reference handling, clock configuration, and sample-rate
>    handling issues as suggested by Mark Brown.
> - Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
> - Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
> - Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Changes in v2:
> - Added a detailed commit description to clearly explain the need for this change.
> - Improved the machine driver based on Neil’s feedback.
> - Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
> ---
> Mohammad Rafi Shaik (3):
>    ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
>    ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
>    ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
> 
>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  50 ++++
>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 181 ++++++++++++-
>   sound/soc/qcom/qdsp6/q6prm.h                  |   3 +
>   sound/soc/qcom/sc8280xp.c                     | 240 ++++++++++++++++--
>   4 files changed, 452 insertions(+), 22 deletions(-)
> 
> 
> base-commit: c5e32e86ca02b003f86e095d379b38148999293d

Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com> #SHIKRA-IQS

