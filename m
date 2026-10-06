Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96A3B3BFE
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286458; cv=none; b=pJ1wrmu6vGAiSsggnv8GlDD5MvXmTv6o9hJtDzG8zCyFOE2cHrfR2VIIfRvy2DQ6SmxEV9/BDeME/JZ9U8UoNtlYNj3JNwRWqrGQvV44zomrz2GIJHZshWZDsq819/5oNejrTMXl8Wx+FJ3q/X77zlyim+eeZbXa0rngY/4Rkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286458; c=relaxed/simple;
	bh=OMizlvS6AN612+3zia7ESwP/oovdwK/rnIQP2XW5tNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCTeKIFNN6EaSulO+vUGfJlUlD7U8Te4PYYXCH7V51qaaX9XujyrtuM0RJoJdnuAySRwdwzmy8MWI6LBsEEl49ncsBXzTFtaN4jYYzUeK2koS9Fv2HjhFONpfdJs0cba+onKPNQDuUM3bZxJTcaF9WgHfj30G4s+WM2y8c0iCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gH1jQuzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkiQpjJi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH1jQuzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MkiQpjJi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPPhJ535571
	for <linux-sound@vger.kernel.org>; Tue, 6 Oct 2026 11:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKW0WKWDRVXBCGUqhbtra2Jo2FAHskgbTqhypYncQ+A=; b=gH1jQuzpjR+16cVm
	/4bilY9eYkJ5x/dr6DRnhBSEPDt6PZ2tnl0Hid4sIjqI24bacczwxX2J2BZMWhm2
	UiVii8dILvH/t+vXkVbdhohjc/O09EYwjXDaU975rJpqiIwm7CIZQj5mvQGruNPA
	+frKfc8Ykid8o5xCMtUbyMdgowoyG3iDoWWMzyyclbQmF1OFQzg+3mQKcDevy+Yd
	r3pMgMDJNzDe2o+f68MkUSlk/IrzlJsBH5ovNx8EDCqH8vbHQ/ZT/oQ0MJpdrqZZ
	cOVXd7Fsqf8pfXM5Vk7/eI3fKKrjwZisYzWkzZig8agkkVTdXq1JD5QjXQGFa7QY
	NP4EPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0bbct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 11:34:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso49683985ad.2
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 04:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286454; x=1791891254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKW0WKWDRVXBCGUqhbtra2Jo2FAHskgbTqhypYncQ+A=;
        b=MkiQpjJiVqZX6fxTAk7Tde4rvBvhPdfdbXQBoaZWigrfOsinU4qPfWw//RI4/ZxxlW
         cIdC1ene4IMRWMT8mDPBcu1ehS9aZ71BdgZSyKhUUX1YDGXjpNqZEly7p0LOPA5s7ZfI
         GGtHS3PHnUaCHxKikSVRIJSAfL3IlFKPD6Sx+Mz5FryqcNhpwZ3aMM2q0TcrrMF8bz7z
         Qg/ZmTG8fAs9g2LaR5PKfLoUDCBljShbZwkcRcDQTJxIq+zrPe2/bZIvIaBg5jnT/5rG
         TXhQq4rv11Yk4ObbluhIvKhcrDhRvib0CyXs8+74OpqAqbbSYVHAIHmd0c2OAxuaqO9H
         lMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286454; x=1791891254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKW0WKWDRVXBCGUqhbtra2Jo2FAHskgbTqhypYncQ+A=;
        b=MDCv8IyL9/yBWhIzWODrwasill69UbXobmH8EZq7Av8Dl5FY0hqjdbGH9BnKxLDzwn
         QTOvgWcKLFaFILHEcZDLqC+PhFCwBbJsznBhHnhdmVqD9dSkG8CbbrQRxBdFOKHmcXdz
         tLVr2ORgFzCz5YaYKgcqXXiG9kvUoEWykJbQvmKzn7cDEeD/TQ78uza7qeOTt44Ue8TK
         FsxFXTZT9vNkg9p2AixPHzv/bMRIcIkVytgRCEx2qdl1ZKKJSGbjDzkk2k64wa1CeyqC
         NeVmbSYgwU5taaUohnG78jMekMx2klCVTEKdFmjZnQZvOqKb8aJnKZ7Qw6933N5CveQl
         TXLA==
X-Forwarded-Encrypted: i=1; AKwUvBwIOrFNBoWCo3uHtz6a5UbJJrb0XzgqPJIkgozN0vWxlLqiAqaDnyhu91tZJpm4GN8tPeo6LZzfOvevQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHt/OX2fDr6z9Zax9O3P00mBN2s4lwxYfVRAFDAspPpUTcEdo3
	oX7+Oem6Pn+xd5Dfg5euLwt/bxoeYoBqlgzT4QLvRNU4dKIUygIkRXR7DMRkaAFD5GJ8fiBzwWP
	ovwn6becm33B2TnU1HfXgCbZ7K6lyq9vJCrhtjgYmrMQkuQ3pixuWTkAA20SjM3sVtQ==
X-Gm-Gg: AYBFou1dtjKCQ5kFrsEI/V5wOEIyH/R+KsPb4Soy1nKAKIYI38necvTJo4eEQ5CZbsT
	pjokumN1ln0natvcyZaTL0Ph/P7b8hlfWjUK2IA+CR0zZIzP92N9k3Zlj96n4cpw9jQu4YW50br
	H2gpcZctG4DZ3oIiXntRtK0EDzG0D7/Rg9QtM06dfHH8pD9wiwgU6+ITwfprq3bOLbovILAgJ3g
	MgHuqC9X5b5DOo6RikJpBShRl1heVln6A0Camf9SG032XCMP83Ni1lnTF1FhM50/KQ/UAV4vayU
	TmeJ9F65wZzxKyG6WQUrQ6eYM7hZoxajIw+oxk9Mil8A4cEMDZJVg5e7CnyCGc38EsB8VlSf2kb
	lZW8qOxxGUCKM6xJ5we9cwP2oFbu3oOjk9g==
X-Received: by 2002:a17:903:2309:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2e510613551mr89871675ad.47.1791286454113;
        Tue, 06 Oct 2026 04:34:14 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2e510613551mr89871515ad.47.1791286453626;
        Tue, 06 Oct 2026 04:34:13 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae104sm20366095ad.21.2026.10.06.04.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:34:12 -0700 (PDT)
Message-ID: <d819705c-2d7b-41de-a4c8-2772ee6eedaa@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:04:07 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: wsa885x: Reset registers on teardown
 for B2B playback
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-2-prasad.kumpatla@oss.qualcomm.com>
 <47a42c54-d3b8-44ec-8017-cdc34b474798@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <47a42c54-d3b8-44ec-8017-cdc34b474798@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX0MNLMdjnoMF2
 1NZfKIWwY5rRLefuINTnPWkOCGxMiAhimhYq2mwbg3puW1S1qKUvgzbZKsOPuQau3D18Uul0w4e
 haGpnTOkz09ZpEYcZlQixaAeNxaBTGFSFtyM2bTYBQmc2ci5bkSWxBNTT+jAUAQeddK6nEuNdZi
 1b5XTdBMsKX51yUellff05rphhqf6l2Bp+4AbRxCo9HlymGjYbjKy1RNLUyFlQGZtPu8f1+s0h/
 EYNk6MZ4/eUec+7p7AIFApAA3gDnxjXIOZreuIRYJb2jA2rqKYfxE56mFP0VcO8+aheRmqt60vm
 yVlyb+BT9iqvgUPqwhm+tjmS5kY3tjoHwktGwvMQQXqdZ5krJgUcml/wfjp1i/3jhgB83pX2RM7
 NgXXRiwYvEATVoPLfZzAveQpLgX4H/ZFW1Wf2c5zeX9NW/I2gT5KQBjZDY3eXIfhZgaaWI3zkR/
 9Vpbceqd+gFPL4T6Tjw==
X-Proofpoint-GUID: f5oNHeXID-MTHPLy8n859n1nfbP_rB0D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXysoRFAus8EDp
 nzxvIj/+NJS+QDF8CVd0H+ia0AogzWoqWkVrmg0c4I5R6DkptT8RsUV56l30lKMGacfkH3hBh2i
 xe1fukRVZIUoGVneVAgXIfBgVUNO4Lo=
X-Proofpoint-ORIG-GUID: f5oNHeXID-MTHPLy8n859n1nfbP_rB0D
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4dcb7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6LP0HPHEwNRfjc6drA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045


On 10/6/2026 2:03 PM, Ajay Kumar Nandam wrote:
>
>
> On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
>> During back-to-back speaker playback the PA sometimes fails to enable
>> because a few I2S/TDM and clock source registers retain their previous
>> state and are not reprogrammed on the next stream.
>>
>> Reset the relevant I2S/TDM, clock source and bandgap override registers
>> in hw_free() so the codec is torn down cleanly and the speaker amplifier
>> comes up reliably on back-to-back use cases. Move the bandgap override
>> reset out of set_sysclk() into the teardown path where it belongs.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/wsa885x.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/wsa885x.c b/sound/soc/codecs/wsa885x.c
>> index 1faa8541a872..5ffbf9e89fd9 100644
>> --- a/sound/soc/codecs/wsa885x.c
>> +++ b/sound/soc/codecs/wsa885x.c
>> @@ -896,7 +896,6 @@ static int wsa885x_codec_set_sysclk(struct 
>> snd_soc_dai *dai, int clk_id,
>>         regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_SYS_CLK_SEL, 
>> 0x00);
>>       regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_POWER_FSM_CTL1, 
>> 0x01);
>> -    regmap_write(wsa885x->regmap, WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 
>> 0x00);
>>         return 0;
>>   }
>> @@ -1006,6 +1005,16 @@ static int wsa885x_codec_hw_free(struct 
>> snd_pcm_substream *substream,
>>                    struct snd_soc_dai *dai)
>>   {
>>       static const struct reg_sequence regs[] = {
>> +        { WSA885X_DIG_CTRL1_I2S_RESET_CTL, 0x00 },
>> +        { WSA885X_DIG_CTRL1_I2S_CFG0_TDM_TX, 0x00 },
>> +        { WSA885X_DIG_CTRL1_I2S_CFG1_TDM_TX, 0x00 },
>> +        { WSA885X_DIG_CTRL1_I2S_TDM_CTL1, 0x05 },
>> +        { WSA885X_DIG_CTRL1_I2S_TDM_CTL0, 0x00 },
>> +        { WSA885X_DIG_CTRL1_I2S_TDM_CH_TX, 0x00 },
>> +        { WSA885X_DIG_CTRL1_I2S_CTL0, 0x06 },
>> +        { WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x08 },
>> +        { WSA885X_DIG_CTRL0_CLK_SOURCE_ENABLE, 0x00 },
>> +        { WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 0x00 },
>
>
> This moves the BG_TVP override clear from immediately after a 
> successful PLL lock to hw_free(), so WSA885X_ANA_TOP_BG_TVP_OVRD_CTL 
> appears to remain at 0x03 for the lifetime of the active stream.
>
> Is that intentional for the back-to-back playback fix? If the override 
> is only needed during PLL programming/lock, keeping the old immediate 
> clear and also resetting it during hw_free() would preserve the 
> existing active-stream behavior while still cleaning up the teardown 
> path.


The override remaining at 0x03 during the active stream is intentional. 
The teardown sequence requires clearing |BG_TVP_OVRD_CTL| only after the 
PLL is disabled and the device has entered PS3. Doing this earlier in 
set_sysclk() violates that sequence and causes the
back-to-back playback issue. Since mute_stream() already transitions the 
device to PS3,hw_free() is the first safe point for this cleanup.

Thanks,
Prasad

>
> Thanks
> Ajay Kumar Nandam
>
>
>>           { WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x00 },
>>       };
>>       struct wsa885x_priv *wsa885x;
>
