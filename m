Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA9634A33A
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070741; cv=none; b=DDHoCPvE8sAUjRn2EK1oG70Npwg9xjmyVfiB41Y/z+dlzyouq9lYzmRsSgMseR1LdBg7XRmtkyAfmGuNlswgSTem+JVbY9Ubg6n94UIKnnI1LNu7+X45bwj97a0z+Q9z2P2gYICNNmQN+WISBjqLar6ra7cC+tptVoXk9r+L52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070741; c=relaxed/simple;
	bh=NklTAwlTBkReIsEjZks5DA3BefQ9nHYN5o2ulue2alQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndAQrhZfcFi5+gg1Vz9auFsG3xlRYWjXzkkrrHkd2NpnVTNcHmSfeJeQwYibWYVF1d9hinDQw+xLRw2xj1vIQRX3TNJsEMlJKM4NqSY67wCtIYLaCi+eaWMJM7qzinj3QS7t+ZR5B/QWadpIUJAfyxQAbbT3EtLAqHe7NkgKVSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrMtGzjB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrMtGzjB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857TMu2031754
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 11:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Y2WyGMjVVIjyiJZWOlogBMpgxJOKu3k0zYxg3Q2N+Q=; b=KrMtGzjBKIC/Keyn
	EFfEf99/DUV8jBvRVyAXkm8PWvH8C1eo8/VqzLQie1Aw2E/2y53+ghuagxy+/oyQ
	wsZdg0BmDA3SZLQHb0Ghij5Ep5gbwArqfgCqq77zr2ZwvQRpoNIU0vnQumvObHsF
	qa+MGz4nWTBwqT6/4Zp30E8koX1QzuSxgmG+1aIk2m6mkLiz9CUyOUSvp0jQVB6P
	eV53wqZP3alDu5b32ttmY8IL6ttpUeU5iitqH0cdMzLBaFbSr0BS/f/+X8hw/kSA
	IchykpiLrXghZnDUvS9PMB5NXngAIwugDAr5Y9g3qzFXklg2l5attQHzOzpUxYCo
	uBanEQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0ayed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 11:12:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c949fc524so1591497a12.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 04:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757070738; x=1757675538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y2WyGMjVVIjyiJZWOlogBMpgxJOKu3k0zYxg3Q2N+Q=;
        b=NsJ6Dn9Tj9Qt3GqwUWXhdpApgSwY5+0Ysu+h5d0j2F7YjIXKrJg5PrMFgt69Rt/8Y3
         Q13caVzMfdFeULcOyOHpMGoDPKTjNlVAn5r4MnjGp3pMRf1D74+Zdx5IkfbSxjGjb/dP
         H8pdOBPlS84aXB3Q2F3QfiQ40Fp/xtSG36LZwRU76smNd/b7NwU1qoiFVeP6LoghDiX9
         j9F0V+IRwSnnLG9J2DuVpeVllJwQPygz8oOT9eF6h/MdvLWZwgFWtMP5ojpHSmLmOiSA
         noq1yikIef5J+18LQp2JFLSBA5HqbYFC0cPv/Viv5guAwB2dsYspjJLbwDUiSrU8EbmF
         gv9A==
X-Gm-Message-State: AOJu0YzdhY5zJcQBH2Ba/R8DOiTRiRskoJEWbfeIOrHF4aJ2aAcTi1Jy
	5RT0kA2dN2QLpqB2X0S8dihyIwZWChoaTChsBDabHt/Pz+xGed6oKSyqj2zerLnwSXLQPLH7WjO
	vHpNhLNi3p78dpuyEOqbRyNPtlA9fm8FmfkBmL6HK49Ky2y7U/K58teE4u1b6Hl2kBg==
X-Gm-Gg: ASbGncuwpyiSkYtM0MizGfXAJtZew/vTmvYqb7bZWmJKSQ++wYTgMayeHncz6yED8O5
	2tuWvnc3+d49ahq65JqqtkklN+MKwfB4SincOeDyCd+sTOv7Akyl3y9joO/8RulRqhPXxfl69qG
	JnEMLzbLXK9Qbdi6wNAmqaLgCEZujfGaZVkgdPiCupH+DLoke6cjSDRBguwk/S4JhgYhj/CFxPW
	5VDG8Y/u/fpucbOF4dJI8XEDl2/RK4fIPB6SIL8JOovsqSgUi7nMBZiCDaYjYB5N/0+a2TuH5va
	oq6FEKdeVXJ35SIaOwig246uxIzFknrFIwVFK49k1e2zj28w6ylisv0QMemuCxOBqavGrgVNWQI
	LuHE=
X-Received: by 2002:a17:903:41c5:b0:24c:a617:1178 with SMTP id d9443c01a7336-24ca6171c9emr118068085ad.6.1757070737305;
        Fri, 05 Sep 2025 04:12:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0WcuREpe6AY9R0ANAHRzCbnew0DwoBwUUzHo9Cvq35Lu87uvDazIMVqT03aVxdZj6hDs4aA==
X-Received: by 2002:a17:903:41c5:b0:24c:a617:1178 with SMTP id d9443c01a7336-24ca6171c9emr118067665ad.6.1757070736817;
        Fri, 05 Sep 2025 04:12:16 -0700 (PDT)
Received: from [10.219.49.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724ec8sm212621645ad.41.2025.09.05.04.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:12:16 -0700 (PDT)
Message-ID: <d92d5217-0860-461d-a34a-086e52acb78f@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 16:42:11 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <fb126ef2-aa44-4a67-9188-3483b07b73d6@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <fb126ef2-aa44-4a67-9188-3483b07b73d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QKxVlTZlQjJdUONxbGzFXunQ4SHDQ7Dc
X-Proofpoint-ORIG-GUID: QKxVlTZlQjJdUONxbGzFXunQ4SHDQ7Dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXyFjRHU80MF16
 n1AjX+fd4fsV1msPPw1QTcH3fLZak5YDHe5Bw9QZQtcrtUBhsVeK7obEGGRrufymzOU+Ng8OvP/
 HF1IIXnmjV6nePxzevw2YGTrQoaLiVZWidWga5AzHYGeCy6UUsJyfLy9W7x4zyT6d446HsiJp1f
 xmTa/jKflTXrX0xJS6fnlC1CzgaiqpDfzVmjPKuIy07pkkoRomvLyZmlToh0sZottkPXQfx/Wvx
 d1tOfKuVX3vRjt98WIwc/psb4voD5hVPk+ZCUSZYPgw9ASlzzsw5xNjHSrmzJaYm9LeI4NvxzK6
 Jv7ugwU8smpv11W1iYtt2XY7BjEkoTrR7Mxey64MuEb8tBPZ24jKzzA4RcYCKJ3KIpgsm9IKTM3
 ggbc0uEu
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bac593 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=drAcfRgjDz_GiM-E-9oA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027



On 9/5/2025 4:16 PM, Srinivas Kandagatla wrote:
> On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
>> The current implementation does not configure the CPU DAI format for
>> MI2S interfaces, resulting in -EIO errors during audio playback and
>> capture. This prevents the correct clock from being enabled for the
>> MI2S interface. Configure the required DAI format to enable proper
>> clock settings. Tested on Lemans evk platform.
>>
>> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
> Why? this is not a fix, this is an enhancement to the machine driver.
> 

yes, this change is enhancement to the machine driver.

The reason to add fixes tag because I2S audio playback is failing
with -EIO error, with this change I2S audio usecase is success without
error. So added Fixes Tag.

Thanks & Regards,
Rafi.

>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> other than that,  LGTM
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> --srini
> 
>>   sound/soc/qcom/sc8280xp.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 73f9f82c4e25..2fd06354923a 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	int dp_pcm_id = 0;
>>   
>>   	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>> +		break;
>>   	case WSA_CODEC_DMA_RX_0:
>>   	case WSA_CODEC_DMA_RX_1:
>>   		/*
> 

