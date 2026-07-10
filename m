Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1B3DBD49
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687659; cv=none; b=LmKhTdhejznmkJrUszpvzzrnN3DkpxNtjUB+VYJz+EKaCbnEdsdWpnX+jTrPGjda3x/1U7Hrc0eUIMci2+B5rhiLQhJkntiK0VRUtA/OBPz4QGiwhO8dYMBRXBOx8PqUxLJF3PUOwHeKY527j5Mxxbyy2NjQYm28lzcgiPJx9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687659; c=relaxed/simple;
	bh=hV28IQmsVQS7SKHRo7rdmqenY7Bknj2kwcKONVApwww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FneSQvEaw7scxVbJrMmklG2htB0vzdZTB3Et26N6h8sQG9BeUxJ2MCQinr758O6MJcb1gY0dlJ2xekXpGI/RvRV1Hu93z39u+KGhXdHfRGlaX3wHySezhugkjsM4F1mPioacQ7SxRtgf76AVmJSHbYlKXyBwJDhiLBVzYqAkz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PSFGV0c4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PSFGV0c4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso6910535e9.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783687656; x=1784292456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=;
        b=PSFGV0c4/ms23bew6pGongM/3tIIr4W34Kk7PQ9PD9MFD2Ahv/Ct7tEqtdbLSPwprt
         LPNO/cNgg+UbKZ85rbyWocc08xcvRdg6UbMlwyfmlgrcPciT56NZ/F7NoWAqsKJtw7WH
         BeXuPESViIVluPXoVUWzzs9EAEYPaVRi1bvU6ljw/l+jzTdNLKzCuiLXOTwnzQnaTpFI
         xR/wVHEetLhSRX4CjJzLu3BgM/KNKXZfucP75yYIClJPUHH0wJbn9H6aP5Nq7Ij0nzxr
         XQEZaPdt7a19/GADJzd+Wb1x/z9EM5bm7RacLfFMMDtGna8JCz3xgIOE7EkqMPWnVFms
         4uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687656; x=1784292456;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=;
        b=aU2Zv21De4fy+E5REQslxp394ULvNEctf2rnkPjAFgcHuvuSJ7MRkUC46x6szNPfHR
         SOXVcmOrjui1Cg+c/nIZzGOHrxZgzHS7/AV1HqejSZQvHtwgopC3sQU16lziDUQwl08c
         CWjJ03t7M7yYdGycCieZdG0+l9rS+hgNdeshOBqqECiIW73gRuM0PjPemG5nexp26/Yh
         KpVKqcGS8xsLVlx+oQvHmHE9mzoePFfNDdY6/sOlvBCsmVMjLFn+VFoMpcfWV2dppYVX
         LLdas3AldDcRo5SKUNHVwh5fM6NZMub1l3Ty9MAlqsabNzD9apMDA3z0Rb7GPZvHctDo
         dK/g==
X-Forwarded-Encrypted: i=1; AHgh+RosAo9rZCGG/NjP4BXvM3Yk5f1CQHYruG8PqxUuTpiekCILgpviKO5S9iJVFrdV0bpzwGS9L1W4HhGmjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlcInvfHkUfsDBNMuxMlDKZnsoqvwoP/0b6z6uvNaNdOHWhNu
	wnWmOWmQWsQE3A8+tZUHfA3qTFJd5wAffQzc7Zk9g0BXhRbw2eAVLGHpc75I2t3ljx8=
X-Gm-Gg: AfdE7cmiZDb1nMv9ESiVIiiqN8vQ20WkvpfmfexBohdpxlnPXdJoNXarr4FM1kcOApy
	yLjQnXgdihBU+udHQnWjflGHcaYr/PHs3QNTi7CR6znjioWZ2ZLAwdrvj3o3Kv6IIPgGfiXY2S8
	moHrO/RT/cc/6VtnlC3u7Q2Oq5WX6gdBbp1Kq0LI1pBjY9cW8nLmLto9auhaYHXvc9NmzLwedIn
	GgomtS+lg9AyqoZXxSm/OiZgeMxSvaCEKwE5ekI0VxuzJhviVVlqMHdEY5cqaPUTtFCY6PxxmED
	C9VAwjNhQFyc/d8gkvPp+u2J4vkmju9u0HwQsHTRvl2C48+mCRGzHWRnUlEVvz5H6lvFt1xE+On
	+vruYoLqvR1mlwhXfcjNzebEZ0gp89iYu47xyDDPmsm+VJGW/Lep7YR0VQDNW1bMeuNpQDMCc22
	MjbF1M8tmyq9CJJlg=
X-Received: by 2002:a05:600c:4455:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493e687fb61mr114586355e9.37.1783687656144;
        Fri, 10 Jul 2026 05:47:36 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm3834312f8f.3.2026.07.10.05.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:47:35 -0700 (PDT)
Message-ID: <191ee2b4-d552-49ab-aebb-58da970087a1@baylibre.com>
Date: Fri, 10 Jul 2026 14:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Ethan Tidmore <ethantidmore06@gmail.com>, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
References: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
 <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/10/26 1:27 PM, Markus Elfring wrote:
> …
>>> +++ b/sound/soc/meson/aiu.c
>>> @@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
>>>    					 ARRAY_SIZE(aiu_cpu_dai_drv));
>>>    	if (ret) {
>>>    		dev_err(dev, "Failed to register cpu component\n");
>>> -		return ret;
>>> +		goto err;
>>>    	}
>>>    
>>>    	/* Register the hdmi codec control component */
>>
>> Technically the fix is OK, …
> 
> I doubt it.
> 
> How can a snd_soc_unregister_component(dev) call ever fit to a failed
> snd_soc_register_component() call (according to the presented suggestion)?
> https://elixir.bootlin.com/linux/v7.2-rc1/source/sound/soc/meson/aiu.c#L240-L315

The reply was based on the fact that looking at 
'snd_soc_unregister_component' that's a macro for 
'snd_soc_unregister_component_by_driver'. The latter cycles through all 
registered components and if nothing is found related to the given dev, 
then it results in a no-op.
So calling 'snd_soc_unregister_component' on a failed 
'snd_soc_register_component' looked harmless to me.

What did I miss?

-- 
Valerio

