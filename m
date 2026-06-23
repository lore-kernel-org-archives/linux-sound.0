Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF934D901
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206466; cv=none; b=NbXy96bG19GlnmgTDIBWQ6EQ2sOJYuWJ5p2x5dQzXlQlP9LyIWksZpnE+m1jehFXLZWFrg0SF7Pfc4MVyP4mNP/hXquWbAjEtVnkToKQC4qLCnd2j8Op3TkGrSsJvSMPVPqdhqiAIlQPI695m9xt/LwImo6lFhUYD7FlEjudltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206466; c=relaxed/simple;
	bh=mj+L6fNIend4DPnJIWWfjOMaq1nQkDBZqomFXdwOlsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5AgDAK5J0xcQ5BINbSPyHT74NRZtAKj4TFO57cfN4IcrnUhmsAWvOlKG5iIvaRhwVfvLLFSctJp+9cZ0jew5rNQG1+AJUX1KUk6v8tjFJ5RdKfuFJP6DwUPV7Cd3koeyF//exkcWEK1KDG/R6rSwdDezyXbXIXO+OZbwMvdPDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAKwn+ZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBmi4rvT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAKwn+ZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBmi4rvT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8Uw943243887
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 09:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYS6OZjyyZJEvXuWC0yUGIwHhaWz1fNCfLFi8IntxzA=; b=nAKwn+ZXk1196PFZ
	62hTEwsBtBMuZdf9QbH23aty2LfHEJxmTepY+JnfQ0VyVCRZbK57dtLlf+nNxuB7
	SjKMRsO3iySjudL95lHivhjopYdqwoMa/Ub69VrPTR2UV780RSndEXU8F2nnz4C5
	ZwsdJtahJYjI9CtwfiSowmmjF4fJBimJXawPI4GKGYVtzojFQL2uYUTkzVNlAVEf
	1F/rKL+RvRUkPRmCfwKKkgY6enQZPZd/cU6F7Y71LMJyf2shbkAB8sfS6GCYJtOo
	tWG5M1AK2JBtC/Fcv4aZc75t76f4RwrwKJ3nTpbfNSf/cfBuLRW017JLS2GgiN9+
	7OqcQQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197] (may be forged))
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyg6hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 09:21:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453a81b846so7821246b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782206463; x=1782811263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYS6OZjyyZJEvXuWC0yUGIwHhaWz1fNCfLFi8IntxzA=;
        b=HBmi4rvT0tAFFO1P8HdHiqMy95cHAe81LLx8NTSMu4YLIOfDlxn6kjFNVnuAws8JBL
         PK5JEQkelmpZdx6OsIrj/IbzQYalblqEElYt6tg4lpklxtAjMqrMJi2nrxCaSbi9TwnH
         n7oj4ZqetNUNWFTvL9BS57P1P3BrqeRwJjRepm4j5CKjKunGq6hj1Q9yuG1jM1F3Jmex
         WFMh7cL+8JVqdC1eBmznqqWgrMZzrQh6LDx/BL/8qCUbOsietBrgHEwKv1S2fo0OmHGt
         Y31Gv17ELMDZuGTteVWnwOAXWiLsI4jr1xMIjhu4eiTNJnEVgMKH/sJ8V8gwO9NkOrLt
         i5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206463; x=1782811263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYS6OZjyyZJEvXuWC0yUGIwHhaWz1fNCfLFi8IntxzA=;
        b=r28tk88+PER0xOX8xSPT4YbZC1SE/zPnpDTZ7aYVuKNzLV9TAyaA6LI0FnXsiXujG9
         Ve97bd/7ji9etYDtAuTU+kcJpxPuCILI1NdzCypqWFO6cxB4iXA25VFtELCjnbMuTl7S
         CNuI38gUGNv27D4Rj6uaq96Ss722VhKK8xgy0sucFffSAWC1zQqNwG6Vn3G2N5prfxXp
         55oOlA73Dm91MyGGIhdpOW/7RD1F8wxWk+ZO1NEmlIootWLPjG5rgwM92ykJzJYsmqEt
         j6QkklL9t8SU1IWpq3AL8rIPObfyL9Yhj+8t/bMY16AS2F2DVCivDFgrL3pKA8/oQwUr
         6BTA==
X-Forwarded-Encrypted: i=1; AFNElJ/R9lwnmvGVEnsE5sXsmzAhsDgXuhMWNthYx4LyUR1BYzpz6U83JVG/K/y5lbAs9yT94Z8poerYncrBkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOCSxGaIjyc3fD6p0yYUuLXqS46S39tIxnoc9Ijn+u30afaJu
	esdR4eSF4gSSUAt+bSlWi5pP96pOQKdCWEGcJMHzMTw0Q5/+gnciM7N5uB0h+10c5cKquT6OUNV
	1ic8nibzhrwqC9IVE2r8Uk5f5mHpT0LU8mw+Qomo2Mp8mkxY9jxFccVAVaXrLFb17Yw==
X-Gm-Gg: AfdE7ckDubx11ytHWnTGOiFb1kdKSoqJOxj16RNTaV9t54oGYrPhF3rFp3KYYkDsIJH
	Vd2CnwRq6dRtXxzVFYAH9b/6lF9X01GGZEuHV/3L5up2rAqoo9pTpB7biQGYw2QHBQ6FHhvW6MI
	s0MtWF/KbhW1ZiTyDfenpbC/avjzkufZgIVyl3pNFfvNJV9Bu7/lcw1wqRt12mhOAiUUQTzouZ+
	6/K8K1MoGm5erOGNTXiLSp4VHgeK+J1AeV2v46kdu0GuGR8TcLFkjPwI8yfYxwspGa2GXMsnFgJ
	aemau7HpUopogLfvZZVT6S6rswZDup4a3M8Er5DRSz6OJwFCrZfQ/aCcto/Xf6Ozs8+QznF8H26
	rq0rZhPCNv3O6jk+wsTtWqMWeXIMDnOxoO2LOdxmOwiPO
X-Received: by 2002:a05:6a00:990:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-845970cc9b4mr2598659b3a.34.1782206462975;
        Tue, 23 Jun 2026 02:21:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:990:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-845970cc9b4mr2598603b3a.34.1782206462359;
        Tue, 23 Jun 2026 02:21:02 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564da57a0sm11428820b3a.26.2026.06.23.02.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:21:01 -0700 (PDT)
Message-ID: <47a9053f-2153-43ed-9e6f-21f0153a2f04@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:50:53 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=Mf2oujn6MstGqKg1JCu3hbPD5zHhCB-Zke_hu8LYCz-Xg@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mf2oujn6MstGqKg1JCu3hbPD5zHhCB-Zke_hu8LYCz-Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NSBTYWx0ZWRfX2jP5eE+LxpUN
 O8QCx4iA7+b4E4yhtUEPt0/oBqq60l5zMQehQrlpmTbFdSynQ1CmK0Zj7OmB3OT30IyVAnSu0ZU
 TZ8xC36FSKwepr2eNSq5n56bZcay65iwFAXr47u7TNaaf7hiqYz0WBeeasLnKoeKgzrHJQd38UW
 yS/TcNYiaMMZImgEQOHE0yvqUEGYH8uGw5l0u4zwtGqn2Xx0jNA5ier+6cot4nxmSvaidGi47eU
 vtF3E3Wt0VGlnOckyGniorMJsWEHs5yrg3d/bd3ajTy7oU36OfyjrWDq3Ah/ClwfU3pobw0vKQi
 EgZHMfmIZAJR+8Zc22XwLnqBZ9t5TjCRuvbIsYFWX0gsvExOAR2IvPujDD+p79iiLAtd3axNrRf
 xOiacHCmQRspM8RmQq4h5GeD8s8erF+A5twvyOy6wkzyx2z0j27CxQ3ZgXQ/6yaBcetNkYDfNWc
 QL/J65t2lqLmgSQBXZQ==
X-Proofpoint-GUID: pwZ-brrJUpg4vCphIajUunpS0byFVmfb
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a4fff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xkAQp0t9iyHIzJGVLTQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NSBTYWx0ZWRfXxAYqJcB3YhnN
 rtfOOvOnM9tHC97ZaYnzDhS4wI+Mm97udLXzqpEIUfbz33OGeWZJh79e8TVC0R5hA1dPktjF44k
 yv3+ytTx3/YKpMpHdf4MYD/PTGkROVg=
X-Proofpoint-ORIG-GUID: pwZ-brrJUpg4vCphIajUunpS0byFVmfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230075


On 6/11/2026 3:19 PM, Bartosz Golaszewski wrote:
> On Wed, 10 Jun 2026 17:57:08 +0200, Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> said:
>> Add an ASoC codec driver for the Qualcomm WSA885X smart speaker
>> amplifier accessed over I2C.
>>
>> The driver provides the control-side support needed for playback
>> bring-up, including register programming, serial interface setup, clock
>> handling, mute and gain control, reset handling and interrupt support.
>>
>> Program the init table during codec initialization and reapply it only
>> after an explicit device reset so the static device configuration is
>> not rewritten on every playback start. Also program the TDM control
>> slot-count field from the runtime slot configuration so the same codec
>> path can be used with 2-slot, 4-slot, or 8-slot Audio IF backends.
>>
>> Keep the stream-time power-state sequencing in the DAI callbacks and
>> use normal regmap access for the control path.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
> ...
>
>> diff --git a/sound/soc/codecs/wsa885x-i2c.c b/sound/soc/codecs/wsa885x-i2c.c
>> new file mode 100644
>> index 000000000..a7d8f8d48
>> --- /dev/null
>> +++ b/sound/soc/codecs/wsa885x-i2c.c
>> @@ -0,0 +1,1643 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/* WSA885X I2C codec driver */
>> +
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <linux/property.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <sound/core.h>
>> +#include <sound/pcm.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/soc.h>
>> +#include <sound/tlv.h>
>> +#include <linux/interrupt.h>
> Can you keep the headers in alphabetical order?

Hi Bart,

Thanks for review the patch and the feedback.

Ack, Will update

>
> ...
>
>> +
>> +#define WSA885X_FU21_VOL_STEPS 124
>> +#define WSA885X_USAGE_MODE_MAX 8
>> +#define WSA885X_INIT_TABLE_MAX_ITEMS 256
> Add newline.
Ack, Will update.
>
> ...
>
>> +
>> +static int wsa885x_apply_init_table(struct wsa885x_i2c_priv *wsa885x)
>> +{
>> +	int i;
>> +	int ret;
> I'd put it on the same line (elsewhere too) but that's personal preference.
Ack, I will make them to a single line.
>
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>
> You have a lot of these checks but this can't really happen, can it?
Ack, I will cleanup and remove the all unnecessary checks and update in 
next version
>
>> +
>> +	if (!wsa885x->init_table_size)
>> +		return 0;
>> +
>> +	if (!wsa885x->init_table)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < wsa885x->init_table_size / 2; i++) {
>> +		u32 reg = wsa885x->init_table[2 * i];
>> +		u32 val = wsa885x->init_table[2 * i + 1];
>> +
>> +		if (wsa885x->batt_conf == WSA885X_BATT_2S && reg == WSA885X_SPK_TOP_LF_CH1_CTRL11)
>> +			continue;
>> +
>> +		if (wsa885x->batt_conf == WSA885X_BATT_2S && reg == WSA885X_SPK_TOP_LF_CH2_CTRL11)
>> +			continue;
>> +
>> +		ret = regmap_write(wsa885x->regmap, reg, val);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_hw_init(struct wsa885x_i2c_priv *wsa885x)
>> +{
>> +	static const struct reg_sequence regs[] = {
>> +		{ WSA885X_DIG_CTRL1_SPMI_PAD_GPIO2_CTL, 0x2e },
>> +		{ WSA885X_DIG_CTRL1_INTR_MODE, 0x01 },
>> +		{ WSA885X_DIG_CTRL1_PIN_CT, 0x04 },
>> +	};
>> +	int ret;
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>> +
>> +	ret = wsa885x_apply_init_table(wsa885x);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (wsa885x->batt_conf == WSA885X_BATT_2S) {
>> +		ret = wsa885x_2s_conf(wsa885x);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return regmap_multi_reg_write(wsa885x->regmap, regs, ARRAY_SIZE(regs));
>> +}
>> +
>> +static int wsa885x_unmask_interrupts(struct wsa885x_i2c_priv *wsa885x)
>> +{
>> +	static const struct reg_sequence regs[] = {
>> +		{ WSA885X_INTR_MASK0, 0x00 },
>> +		{ WSA885X_INTR_MASK0 + 1, 0x00 },
>> +		{ WSA885X_INTR_MASK0 + 2, 0xf8 },
>> +	};
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>> +
>> +	return regmap_multi_reg_write(wsa885x->regmap, regs, ARRAY_SIZE(regs));
>> +}
>> +
>> +static int wsa885x_wait_for_pde_state(struct wsa885x_i2c_priv *wsa885x, int ps)
>> +{
>> +	int act_ps = -1, cnt = 0, clock_valid = -1;
>> +	int rc = 0;
>> +
>> +	if (!wsa885x || !wsa885x->regmap)
>> +		return -EINVAL;
>> +
>> +	if (ps < 0 || ps > 3)
>> +		return -EINVAL;
>> +
>> +	do {
>> +		usleep_range(1000, 1500);
>> +		rc = regmap_read(wsa885x->regmap,
>> +				 WSA885X_SMP_AMP_CTRL_STEREO_PDE23_ACT_PS,
>> +				 &act_ps);
>> +		if (rc) {
>> +			dev_err(wsa885x->dev, "PDE state read failed: %d\n", rc);
>> +			return rc;
>> +		}
>> +		if (act_ps == ps)
>> +			return 0;
>> +	} while (++cnt < 5);
> Newline.
Ack.
>
>> +	if (regmap_read(wsa885x->regmap,
>> +			WSA885X_SMP_AMP_CTRL_STEREO_CS21_CLOCK_VALID,
>> +			&clock_valid))
>> +		dev_err(wsa885x->dev,
>> +			"PDE power state %d request failed, actual_ps %d, clock_valid read failed\n",
>> +			ps, act_ps);
>> +	else
>> +		dev_err(wsa885x->dev,
>> +			"PDE power state %d request failed, actual_ps %d, clock_valid:%d\n",
>> +			ps, act_ps, clock_valid);
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int wsa885x_codec_hw_params(struct snd_pcm_substream *substream,
>> +				   struct snd_pcm_hw_params *params,
>> +				   struct snd_soc_dai *dai)
>> +{
>> +	struct wsa885x_i2c_priv *wsa885x;
>> +	u8 pcm_rate, cs21_sample_rate_idx, cs24_sample_rate_idx;
>> +
>> +	(void)substream;
> Do we warn about unused arguments in the kernel now?

Right, this is unnecessary. I'll drop the unused parameter cast.

Ack.

>
> ...
>
>> +
>> +static int wsa885x_stereo_gain_offset_get(struct snd_kcontrol *kcontrol,
>> +					  struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x;
>> +	int val;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x)
>> +		return -EINVAL;
>> +
>> +	val = wsa885x->stereo_vol_db + 84;
>> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS)
>> +		return -ERANGE;
>> +
>> +	ucontrol->value.integer.value[0] = val;
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_stereo_gain_offset_put(struct snd_kcontrol *kcontrol,
>> +					  struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x;
>> +	long val;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x)
>> +		return -EINVAL;
>> +
>> +	val = ucontrol->value.integer.value[0];
>> +
>> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS) {
>> +		dev_err(component->dev, "%s: Invalid range, Val: %ld\n", __func__, val);
>> +		return -EINVAL;
>> +	}
>> +	wsa885x->stereo_vol_db = (int)val - 84;
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_usage_modes_get(struct snd_kcontrol *kcontrol,
>> +				       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
>> +	if (wsa885x_i2c->usage_mode > WSA885X_USAGE_MODE_MAX)
>> +		return -ERANGE;
>> +
>> +	ucontrol->value.integer.value[0] = wsa885x_i2c->usage_mode;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_usage_modes_put(struct snd_kcontrol *kcontrol,
>> +				       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +	long val;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
> You seem to be repeating the same sequence in multiple functions just to get
> the address of wsa885x_i2c. Can you factor it out into a separate helper and
> save some lines?
Ack.
>
>> +	val = ucontrol->value.integer.value[0];
>> +
>> +	if (val < 0 || val > WSA885X_USAGE_MODE_MAX)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c->usage_mode = val;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_rx_slot_mask_get(struct snd_kcontrol *kcontrol,
>> +					struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +	u32 mask;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
>> +	mask = wsa885x_i2c->rx_slot_mask;
>> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
>> +		return -ERANGE;
>> +
>> +	ucontrol->value.integer.value[0] = mask;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wsa885x_i2c_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
>> +					struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component;
>> +	struct wsa885x_i2c_priv *wsa885x_i2c;
>> +	long mask;
>> +
>> +	if (!kcontrol || !ucontrol)
>> +		return -EINVAL;
>> +
>> +	component = snd_kcontrol_chip(kcontrol);
>> +	if (!component)
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
>> +	if (!wsa885x_i2c)
>> +		return -EINVAL;
>> +
>> +	mask = ucontrol->value.integer.value[0];
>> +
>> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
>> +		return -EINVAL;
>> +
>> +	wsa885x_i2c->rx_slot_mask = mask;
>> +
>> +	return 0;
>> +}
>> +
> ...
>
>> +				/* INTR_CLEAR registers are write-only; use regmap_write
>> +				 * instead of regmap_update_bits to avoid the read-modify-write
>> +				 * that regmap_update_bits performs on non-readable registers.
>> +				 */
> /*
>   */
>
> style comments please
Ack. will update
>
> ...
>
>> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	i2c_set_clientdata(client, wsa885x);
> I don't see a corresponding i2c_get_clientdata(). Do you really need it?

It is currently not being used, so storing the client data is unnecessary.

I'll either remove it or add it together with the code that requires 
i2c_get_clientdata() in a future versions.

Thanks,

Prasad

>
> ...
>
> Bart
