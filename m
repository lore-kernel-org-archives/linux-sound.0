Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235834;
	b=rsL/fxd6VMBtYc9UFkNntyq9D9DMheKz8TbYpbwK6ogWzYJ3ezoASN5f3JpNOopwiKhT
	 GS9bvjKpZeTH+3mj3rp2FTJgZ1O8a801pPfww9gvIQOu6cuQOBcWAW0Zghv+MmvcGs7j7
	 FzhRs9zWQORNYD/oOKltXb9SilIOyNHnIhRaT+wd4PQEFt6CpTgIJCbg1TcBPYEMx/73U
	 RrWs2GNyQvCGU2GfWxxDtSSQqNibVqMrD8wZv/I/arKjSobyg1PuL/kV58Qvvw5OJC5w5
	 JpyRxlJI57N7u+mUNB0EL/kX59hIWYANBq2hFReJCEMMac6nLj8FfyKQGJVBweDH4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
	b=PxMsztCahGAVopqFJ6kvdz5JWJVqByKuSqbc3vl3ZTmgmjWgIgdaiJqgWT0juQmBc9ky
	 XVpRhLyyafxnYmIlCrN6VnNJBFBJVWf95PmCQXB6vcwTaDX5jr69DbqCoCkz8IVtPi3I3
	 Y8TVqGJ+zlYpT+J8X6BZVG26AfQbKIrAHZVfHuu0q2gP5mSXRnsF6pe97n8su6NikwjES
	 rLQhX4RPsAaoRWI9HLoWSK7U5sAa3tMDyzVAtCjfKeL3RZLSddDv4KyZelV3/dr57ODmG
	 m+TfaEEik/wKKGaTQDCCC07AmT7S6FWfuY6MC8fujzbi7tvx9vqKqPun4uHzhaepx1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPsisOVo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3z9rcPP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C5606A339
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 14:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610C5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPsisOVo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3z9rcPP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFNw33589056
	for <linux-sound@vger.kernel.org>; Mon, 9 Nov 2026 14:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=; b=iPsisOVoDXgMpI7z
	fJBnRvUvcsE5O0IpbOPV4sEaIfQZH/D30YSfvXWo8C+gDklfi0wfWWX2klkRA7RB
	ZmB+YkwxHb5VgLYumzcJSk6ynGlnRzet962Ci2Tw7WjO47//xJEXkwbPrBW4XQXO
	wY2RstYXTo57yHkfvLWsRUlGsjlN+EEvQwSkh6t8ZUpt8NvbkjiA3RcDu1LeWnyQ
	jRB23WniW+XnaQHGr0zcI2HDIjRhfgI/b2H6/67hiwVL3OnOPtJkYR3W4nimOlAz
	HErlb+dC1GZig/qVPm2A/lzgED9md9TzwebPVCxAp6jBYL3AwSBKgD4cBtHzln38
	tFGbdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8nn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 14:50:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so182636485a.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235829; x=1794840629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
        b=h3z9rcPPVlutNPLRA2ibag+hJEPXMFTmGO3hEHq9xmBt69Bg8Y/jlOOXoLTs7lBs5e
         EM6ebARp+lK+f/dxI2UzrmUPH3ENJSMiBiUiOyUiC9XncBt+ye63EtauXmT+Vhazes7f
         xZBS06e1xhZm+uacjqTAny8fK2JX60kOFTTNHaAxpalBvlLchCKGIizI7fjUX+awcx2N
         iQ23T+orxaGMNQ7jJQRU70xzE+tRLXKGJm2Pd8W0j3CvUvODKyxgs4X+Va7KxynfWhz8
         F6+9AiNkBZnBCVSVZZZm3opNU9uQWxcQvs1KLmMlM+tQz3UqoSB4+GsaS8ApOY9TiHoL
         Ek0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235829; x=1794840629;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
        b=bBsJ1n2crcIpH0mJANCROIdAhlTbY20xnHtBLOLUEpUlKsOWNF/jgt8s88zWzndRqo
         9muNR3lP68BTsj+cFPBRmtTaEP2tlUWY+svGbG90oI5wqJpuEA0UIcL6lWBlTpNOQiuC
         1THGb7eW6hi0g9d4BW88QJaXVeju7RJHLgO1bUbjnXBkR+zK6szq0gQKZ4o6E0kOCzOB
         JZkWaZehcYKFpJzJgqnF0W6uJ+1Z727VaqRXKYFpEkOO5urUcJQBlIjD36Muoz/mVFRm
         IeOh9I/qJIbjHbJBNRIrPRxkmkTMJFMoJXyLCDkhq8uIdhF1aiDRfiqbqmXsdgTEz77m
         Eilw==
X-Forwarded-Encrypted: i=1; AL+hErFqfLcGquqdyIVLBqt1u9ZywCHrKOBbstfVHygfP7EIbb+aKjGjGxqft/bu54aVJ3myPTg4rzPMFwbzOw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dUb2opaR4TjL/S+PfIwvw2sAUdYzFLgmJ7H7k43NXcPSk1d4w
	Hd4zsg5CQMGXouM5530pAb/mZ8s2kbZfnIf7KWQLXG8KwPeCCIy2ZLzkuyRp/6YhptGlF1lsGlO
	tFpXN9pz49CFadnBFYlFRGmzYiFGoCZwALpfc7LFxRzkaQ99DUtPy9vOyLlsuWKEdkg==
X-Gm-Gg: AYBFou29Fr8a179yPWAYIEx26q1ry7xSRBa1RSbBGh1a6xX4JQGV4pj8viWW/7OE7i6
	ggeKVNomw4B4lQNr7zwjewS2voczoY8fguIBoJ0AMqS37wBmkpg98w5BWcvHN2tQtRrjkw/gxFP
	pVYEa9chz3xkJ+yfX/CTSO2r0/DgErgwVB9HYUNRy/I2IGKNpoi0BUecRSt0TUm3kHvwxl5g7cu
	i713MzGyPhWt1ucukOiklSInUWc/Q3kKtAK9DOdcgFH4DmFsiYVR0O/uXDInTQ1ZuhxMnr5MDtf
	5vKqLWbKjxt5QW+bgt7yP8V6b6mazjZV+nhf/OAMjZhOQTAaxJYGD+wTzE285F3CRhSizwDyRhm
	UyMNxsQF/iUaO24/jRFCzK4XmTfdgFF1zdTvpY0wFQTyiZdgUfRZoFfc8ypZorSb0uDTC/r/+5c
	TsViPT7ZJfu5r80dG7iHhlYtA=
X-Received: by 2002:a05:620a:4088:b0:939:7fc4:fb1a with SMTP id af79cd13be357-94784212518mr641833385a.27.1794235829440;
        Mon, 09 Nov 2026 06:50:29 -0800 (PST)
X-Received: by 2002:a05:620a:4088:b0:939:7fc4:fb1a with SMTP id af79cd13be357-94784212518mr641829285a.27.1794235828909;
        Mon, 09 Nov 2026 06:50:28 -0800 (PST)
Received: from [172.20.2.50] (51-148-87-169.dsl.zen.co.uk. [51.148.87.169])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c4d68d53b6csm185881566b.9.2026.11.09.06.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:50:27 -0800 (PST)
Message-ID: <b77240a7-fa95-4164-859a-775a1278cc93@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:50:25 +0000
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
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
To: ivanverbovoy@gmail.com, Srinivas Kandagatla <srini@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t9R24g6epsru0X2t5KhECZki-UMBQXdw
X-Proofpoint-ORIG-GUID: t9R24g6epsru0X2t5KhECZki-UMBQXdw
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1ddb9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZN5Ng2YwNTFb1nzmVy1PXg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pipf9DByAUi2Cdr85H4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX/8LGrx45Wqp5
 3MDNBBHcNhDdh3pI0Uq1yip9/Xe22BGHdSBriljdKLtGo1L1z3JbaT9NbRrpbB8f7y2kuDA2jND
 8fpkNTaWG6XGdNLOyJqZfd6XfCcCZwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX/0XD5Ralhwi9
 asnL4/ASESvGTuSZ2sGd6wT7wZ/RnWzMGrk3jwS4lv+NFKB5gC6FwBtHFNYTUgmvlSG8rIPCmST
 qGFjvLN6eW712zXnsc1dNVa5ZVHarFmfTyBpV7VbYQnqV5ANMuqgazqTO/M8X8eLjKxEKnMigai
 8NvzINhSzzg00NgS3SeX3TrycNdPHtoALRhYkEjFx48SC0P9FbIMkkMvlc/5qDOPS6EIODMgQGt
 6y+AwV7FKdfzpWcik1cBfoeR5/n2Wl7lxiQr28Vww5d7XHlMcAAjyQUNJc/Xr3TeX8KrLl/Lbfw
 xo6bjyv2iycIY5Kfy0VpKycCZkpHEoyBuMMWxkvQfW7l1hTGycPmEI9ecupPsvF0SdT+M30OV+L
 eqgdqmnSqINVfHI+yT62fkf4PS6BtAkiEnKNFjeB5JekS0T1b4COpS+tc8EY4GegF7xmiIlxZQ2
 LW4AvZs9p4Ae1Vvos4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/9/26 4:21 AM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
> the amplifier no longer enumerates since: "SWR bus clsh detected" at
> boot, "link failed to connect" at each resume, and every stream fails
> with -110. With the check back it enumerates and plays again. Shikra's
> controller is MMIO and keeps the enable.
> 
> Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

lgtm,
Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini

>  drivers/soundwire/qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 147e55b7a600..99c1b6398894 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -995,8 +995,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  			0xFFFFFFFF);
>  
>  	/* enable CPU IRQs for the selected EE window */
> -	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> -			SWRM_INTERRUPT_STATUS_RMSK);
> +	if (ctrl->mmio)
> +		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> +				SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Set IRQ to PULSE */
>  	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261109-swrm-mmio-irq-d896783a54da
> 
> Best regards,
> --  
> Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> 
> 

