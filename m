Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488002;
	b=1+p0TwLXp4HZBLHElyCSALwUHpnlJiXEUM+KqJgexowjjuoelLtm6Zz4PgjESHqRiA0K
	 6AJC5kYkTo3RWsS3d/tltvylhnK9+zS9ckvGv+Vorpv0nI1aq2ZFRJ2x8RNGq1j02vCxW
	 11ppp48hhG7qXOw3MTsCLBE+jacJGtEbG1HhMgFbsNK8xQFceJOSeTuy+uL5aQQWcGPz5
	 gvX0BPpQru9YT0Pxd3XvgXcDNAfMAwuBbmtStSNkwnxgwiowl2VfBEanBh/mE4O4G4WqD
	 2gEBMI0PWi18nMlMSRnySfrTlxAIgKdL6emr+PqJL8s9DNCgG2A87wDT251eZDoRmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
	b=NbtBFVFjbO9Y8EnxByIQ5b/FjHrDeA9OJMpQI62J3f/+D4sCIy6JRu62Qu3ldo3WToj8
	 YjeXu+jwGKz36uIB8CgBDKTIwtjUObVCma3i0jR12xtLxbT5m+JhM6pVClZep26OaRLNJ
	 7qcJFacRczT7gPs3nLciyjy6eZ64wfJS5jO038OODQkpC237QQbO0RK/seEV3HOjISvUv
	 /37CR8dcAhEJN/Z2cy11J1UydWGDFQZ7RouLV5Fk+xiVT1y3UD3GxO5Ka6Kny7QuwB2pq
	 pI0OFyWT25Y2q1jCk0DCB3ARDn1lGSf1nfD0D3tZmLXFmsB8EABn6ViQj00rh9cjehg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rI/aYFEJ";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151F606A31E
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 09:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F151F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rI/aYFEJ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1693122f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792488000; x=1793092800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
        b=rI/aYFEJvfYmrkEMAwT9ZLOtYYvsIN2RzloIRTCc8l7swAy7LLLpN28HihTkCBXvPh
         +Mdgk4fDkZuQjt391FMat60ZEYACOcoDWDSMUjaw+qaC4HDH5HQFk5sVcn5jUw/PynfR
         Twms6EMcr+RogweQ8HSfe9JMTjYkbT2LMlDy5SLmwMXGoSL6gNQsx+fAdcF7cvb2kdc8
         rhxKkmz2Z5iS1pubznLpIKpbGZgl9HijlQhMzUGiKb7zJTm4dL/QtbS/wNwthIHQDNOF
         CETV9wgcrIYx/yefAXaNGs1jI+Zbyk6nAsqpoPVN7Ym9fmeVfgx71/KL3HR3lPw3kuR8
         8gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488000; x=1793092800;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
        b=xiOkOpdKS6IBSk0w8U7r4e3tC6Wo58umBu+t5LFNtXT3EMyn4FZ3W63mExfe3Oh4BJ
         ICLH3c09noqXs24Mi7y4E2thX68kFKjwaeg2dxEuDf6X8EBT4cVd0j8w0vhvBAa0y6k4
         4Kyvfaj4nsSSUEfzFJwCKxx4tRgs1jVuYIytFs8iCat7Z/BH/gVnmsEDA7dWDors/nV5
         danPA9zDyBx5rfRfu6HuLySQ6lmIxLbs3XnaWDrwy5rH0siJZLOXAtvyPkv+jrqGx1Oj
         1as7yoIs3drEPI4F2BIApQ8WDfajh9x/M2Lylihlko4zOPRB6AMi9s/CdXFYXGFEQ5oB
         MNPA==
X-Forwarded-Encrypted: i=1; AKwUvBxawBUX1B8Dho8FFTAHPiY4Qt+QU7+BpMUzW1MXSxorYv3uz8loQWvVs6/pUBZ72Jr8hFZ4HoI5cjPiEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+KwWR5RpZBihXcXzVSvo68z/mba99c+Ri52/5jkpdTNfKr3+8
	zzfbF2sD473dlYXvy5h6wTDrdDfgTflmrjKXFfs34zuxPkQPqesLJdO8pxUaIylj+Ec=
X-Gm-Gg: AYBFou38xYnnpxrAsKM7DK7KPq1IqLzxztHJer68n3A2GJAu2pykY6hLK5PODVLx0bB
	G598RhFLfiIa2ti2wspsb/DzzYHzd27f68hcbu/WOFU2G4QUDSpI97lUjwHr1GBjr/cRNMu3xiF
	iIRIHn0pJGth5JYnH6fo8JgSsTuQuOnuzXlDPZD14NCIih+nUErlVa4alC5GAVpq3gGN78PTpUz
	LSuMI38V+JWV+CRNPzQzPXxG3KRJ9uTXRiRrh4bHvjyVWQTrRn9/4pmu5trYf0B2kUw3Xww8cPn
	9mjjcjEvlPfUhY+cuq/SSsPAutWJW2qb2U0dcxPwxpOspYKGb+XM0ZmOJs1Q5KTb0SC3BdUjOf9
	tKfvV6YaIyWxM0MntyxOcg0+qlHn4Q8qUp52SZA8teen0U7AtdhWfSziqo8tkwHrLzZlW2cSXwD
	ZRlFDocBWdyIEfzjUHgPGZEaSRHPQzklrFaT3ofa4PxU7a6GjjRAEwjCJFxqIk5rsGdv9LHRdFl
	d2wwaNBkdlcrxUSDyO1/tG9Se/CD6CNzPMxKpRMsnF2hdBRpn8h2w4=
X-Received: by 2002:a05:600c:3baa:b0:4a1:e586:6328 with SMTP id 5b1f17b1804b1-4a1e5866352mr167712225e9.12.1792488000132;
        Tue, 20 Oct 2026 02:20:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm4872571f8f.5.2026.10.20.02.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:19:59 -0700 (PDT)
Message-ID: <fbb6c91e-cf8d-4bba-82cd-57f0d1b2c698@linaro.org>
Date: Tue, 20 Oct 2026 11:19:58 +0200
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in
 typec_report_(un)plug
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-4-val@packett.cool>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261020082631.1509275-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:26, Val Packett wrote:
> mbhc->cfg is only set by wcd_mbhc_start() which is called by the codec's
> set_jack op. wcd_mbhc_typec_report_plug/unplug are called by the platform
> device's typec callbacks, which are not synchronized with codec ops, so
> a hotplug could be reported before set_jack was called. Though unlikely
> to happen in practice, add a check to be safe.
> 
> Found by sashiko-bot via review of wcd937x Type-C integration patches.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0c105997eefd ("ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 850be84d65ce..fd40c1686d66 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
>   int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
>   {
>   
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>   		return -EINVAL;
>   
>   	if (mbhc->mbhc_cb->clk_setup)
> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
>   
>   int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
>   {
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>   		return -EINVAL;
>   
>   	if (mbhc->mbhc_cb->clk_setup)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
