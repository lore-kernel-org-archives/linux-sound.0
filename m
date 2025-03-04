Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289127D77B
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100270; cv=none; b=NUdOoMRpepKm1ISCelftZVYmjVTo0UphzVI8D2PcxxK+q6xrnmGAVZZHyoXgYuBkNihZ78bI4IZ+HBDad5r4VX4djrGOh1EonghNwjnOnfNvJsIyMI/oXKU6l5N6kuW0/6MDDVxOQ2onmp87fF7QR3ebDA3/cHWn/j/AY9R78ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100270; c=relaxed/simple;
	bh=6BkGgMCQlKnBVI/z/gSMz/QG6/qLrODbE7vy+j+F1/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFIl8A/s4nHrPeVF1g2mh0p/BN8epymS9Zkjhu3RA3JDTL5kRGix4QhqPUEcJU1VbJGDfk3EIeeS0pHqBJVPM3fX3EQAnQ7HXemRrRxBDR8ApF1SNYwSKslUNbG48kfsgqwwEFbNo3fbRpDfMrzdNGBfom7ykC49hURtazFZ5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ufv8lhra; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ufv8lhra"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e57c81d5d0so2149543a12.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 06:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100267; x=1741705067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/68QcT9qmsXPc69IGraMC5MbQqgSu9/5hLTlhc2o0Zo=;
        b=Ufv8lhraUMgD36VHSmxAiE9zDab4TrUVF2NHgCj4x8lnn4TqheD2GPGLJ7PgtIp8pG
         E7b7EECSb+RMHVtC2sPpAUgxlHP6iICI1Vb3+y2bkqom+ly/GgjUy7Qs0Hok1Jp6ML6p
         qqZwhVBBAH11EiD2QmQK9M+xY4ZNHkPR86FuL6iQJhUyjFbKz8vqs74fTkRDTk8vYyli
         63/NIbqOXTHHdrMpkEeIK3uIly/vgoYrAIeVwdZngllBVORQkkCQOVXNg6pajmrs/hH/
         NfeaGqpEQsoeNNSCMKlcyIr7lggNK0yb4IfzNlnERwGeaZmduXrj7DWwoBLeUR2CpmCJ
         5X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100267; x=1741705067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/68QcT9qmsXPc69IGraMC5MbQqgSu9/5hLTlhc2o0Zo=;
        b=F3TBOluxnIBZ9fMIRG/1wKEoGsLAcacCkI+N3l8h98dOg6YDwXuZi8RexAoDuTq2K7
         qkycy6PmWg80ZojTcJnbAoNh0at4fAf22PXatJ9UuU9l11jdxYo0L1vwt/HnHTECB5fE
         ZoQWWmHcS55hOzf4A3MSEwnyXp3KbFWGzYuJuSGO5PveZ7qLRD5GactoinHvBUKgddVi
         duPTF0A47p0E7KczxUNJPo6U3o2gqV2lO9DRckdoxIAHBJikK+w8cj7XZRLY4GPa5R2b
         /UYjPXGNlLMrQyfrh8UWvDfc9GmmaerdBbeME1udQmj93Y2AI/Hopy1zzPxTshzpAVs4
         Nn0A==
X-Forwarded-Encrypted: i=1; AJvYcCWrTNm8r+nJlvYgz2QaXpcDKMUZsTPxZSDv0DR6pm5DRsepBZ+dmRlp+FY10wP9Vfun2b27IJz9SOjxEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+zpIfHN2bMMmIFpHiuPeS7aOZdVld+LHcXOimZ6n5t5qbwBn
	wiIAUrtN8v1BvI6r8y7RQoGIub0z1FkMSt6j11psdFL+RK76zl8XeNEeXHNqO6g=
X-Gm-Gg: ASbGncvUdhicklX68Favy/oDwzTO9LLWkxFYSjiWOgRVmczxS+O8AGyh1Tk5KMX4f6h
	GaJ9yDYz5fZnRk9WZy5Sk8RWI0DXBDsZMap5fko81R6IQmMPgbcg8raJPQqZcOSHw+Dob9gmboN
	qpoNt/q0NM+JicDilVfiyW8Vh1L4lIB8dMcVNE0+BDidLlPoO8EdIIb1YeEdKIpK0TE5+aEQsoa
	kojEZx7jMevejtS+4B7QgdXS/2I6wrs4bPipBYTQxM+4qIYtOKodVTS7KTwWrQc8E59qe+6fzTv
	1Q21ZOcIxFA/yL7rEgusSE1mnXKTeIcAEACDBkXNgoePNCmX6prMFkD5CmVMNNI=
X-Google-Smtp-Source: AGHT+IEY7PhEqQJuGNVHSkKsQAe7pu1Yw5wYxTDHs1q4RmGyn0tUXGiG6DmuGxPMIR02qbfXS4GcZw==
X-Received: by 2002:a05:6402:388a:b0:5e5:335:dad1 with SMTP id 4fb4d7f45d1cf-5e50335de57mr44726697a12.27.1741100267164;
        Tue, 04 Mar 2025 06:57:47 -0800 (PST)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac12cdf244esm296583766b.20.2025.03.04.06.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 06:57:46 -0800 (PST)
Message-ID: <beab1578-eb49-4cf9-bb74-b1282ab04754@linaro.org>
Date: Tue, 4 Mar 2025 14:57:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] ASoC: wcd938x: Use SOC_SINGLE_EXT_TLV() helper
 macro
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, peda@axentia.se, andrei.simion@microchip.com,
 nuno.sa@analog.com, paul@crapouillou.net, oder_chiou@realtek.com,
 kiseok.jo@irondevice.com, shenghao-ding@ti.com, kevin-lu@ti.com,
 baojun.xu@ti.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250304140500.976127-1-ckeepax@opensource.cirrus.com>
 <20250304140500.976127-6-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250304140500.976127-6-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Charles,

On 04/03/2025 14:04, Charles Keepax wrote:
> Rather than open coding use the helper macro provided by the ASoC core.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No change since v2.
> 
>   sound/soc/codecs/wcd938x.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index f2a4f3262bdbc..b536e8bdc5a74 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -70,13 +70,8 @@
>   #define WCD_MBHC_HS_V_MAX           1600
>   
>   #define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \

We remove WCD938X_EAR_PA_GAIN_TLV altogether.

Otherwise lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> -{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
> -	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
> -		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
> -	.tlv.p = (tlv_array), \
> -	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
> -	.put = wcd938x_ear_pa_put_gain, \
> -	.private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
> +	SOC_SINGLE_EXT_TLV(xname, reg, shift, max, invert, snd_soc_get_volsw, \
> +			   wcd938x_ear_pa_put_gain, tlv_array)
>   
>   enum {
>   	WCD9380 = 0,
