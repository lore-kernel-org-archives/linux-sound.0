Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A457324B2B
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374981; cv=none; b=SCzwIRNwcuwGnNpngaZaFWMWHgin/JdCbZPUO9WuoKSltBSpeE0jbuNlARET94+1slZ0fRNa3wk4OdFH0KR8vKHrlTRP8gep56qb+tX8UM4JslBbbdkKYMVU+JLBlR7yAgNbyj3ceuUl8Nq25RzHrEjfyJp/8PbJEmhIlKw19J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374981; c=relaxed/simple;
	bh=Q23geQWfTcgaAm7efMTvXGe3yEO/c1XdMxHPP35puUw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=QqR3N7qsruz915w13l7jHWmVP9YpXSBRpSzylNt7E49xVUoAjyBiVnkxYESaYTTAaXYflsKwPyCQySoOIMZN8aWEQHguKdocw8wtlZPWqVQjBqqoqFrOaM4NllB9cjyPeNzfItcpydz9US/u6ssmF7UhiNbHV8NvWk+hTGKwTto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZZwMhU9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZZwMhU9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so64693345e9.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765374977; x=1765979777; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q23geQWfTcgaAm7efMTvXGe3yEO/c1XdMxHPP35puUw=;
        b=qZZwMhU918XbxXFlSwR952cVgS2AwrPW17fPyJxrjSnada3I/Ah5+8XzZQ/+ki1yna
         ABdwu6SyqmPZHuPB7A+mKOGsU4DHMh7SNmRsHrFX0SMEDJZ+PG2LFey5DBLEDmTSita6
         h0/1SomYd+Z+UQQcNcgSgNvkiiKA27WUOIvYlABlgui6stLnccbMKeGg1kHeQg9Rs3rV
         N18K9ZQyL+FOwRiQ9D7I0p8PdeLgdIVdwGG6iy8Anu1AlwJ2ml7e+MEHevm5mLFHPuXU
         Ky7D7PYC/BW+imZTcgE9hJSj9NIz7APXOvADH4y/NFgs7MYU9jyBm8LbBT+kjOrG4hgP
         AN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765374977; x=1765979777;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q23geQWfTcgaAm7efMTvXGe3yEO/c1XdMxHPP35puUw=;
        b=bfWQ2D391yES05A68wyqdrHszdgFCp/h2Tl6s84PDniWEhfkHMAbFkgrHry+SBTYcT
         Nm3YvBS8Xm91XM6qZVFc6JN7YPtMtAl0ASHoUs9px3ah7jDAMLruFsFZF1jGU7ALYBJY
         NBLD/mefxeysoDIdunTYN2nlAeqAMEoaYAWRb+F7G5TtLL5yDmY/f/HNbSIsdxuRfMyw
         KDVa4ADhNAscT2F39KcqPfNiatg77QIgSjZsy9K7UQdKEmfGQvgwAD5ERib9Sspztx7/
         PREVpVtIP5Vm5xB0icRAqsOwxoBeCUSqB+WRcxNVGfalErKqtd/pQAKTdqfMuBaRWDCD
         n8XQ==
X-Gm-Message-State: AOJu0YxQDvLIHTikKxHmRp/BNsEqYDKjxdEKBEqYXXmequx4OqXSrG+J
	CCJ11TOAFr0lr9eMSThG5FOOaAljCCaoMBQQzg665OB474c2xfKUeXRgwVoGOiMf04A=
X-Gm-Gg: ASbGncsasQKOxlfss40OkSaVV2MsekTX1jHSt+BR9SEuYnlcP7bHDRcmBsSGBgmI0Ir
	offdDr1ahTdCMyugfl9UR0CICn479ZisVwT2tEbmNJn/arIL3O0jTWHtRbxBk9NZX56ZuEs5qFF
	YkXN0/iMdFhdiEutfKWcIW/EKQO5Zd+aI9hcCvhpyt/5WIvgHHOD+FFdLuskVAL+ZeKMGEw2/k5
	yzcR2zPnm/15BpJcJg0WzYTj620kzvZkk888Rh3REEPTPL4DDUOf7sOZjp+FR5bwr0qjE24gYqn
	GxSdTuCUDnuJeyHxN0fTcKSREaAapbxK+dqhBeiMNB/JocnKsKYVmHdOmgFJNxFSJFuyQMqw+BC
	itxP9emBnQQa4d2x3QFi7wE3RaskuRUNPVTj2HPmk30bv9B3cJ55qyOXQyyx9682ZlcIkkP6GKX
	DPaQ2yZ6d+7cIhYRdX
X-Google-Smtp-Source: AGHT+IFV25+Rly4w6oqtxhD9CKdzzsxZBZKqoi/9c3+m9JENsiG1sAcZy5XtO2nwmWYRqiO7lWdOjA==
X-Received: by 2002:a05:600c:64c9:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47a837b9d3emr25425865e9.29.1765374977566;
        Wed, 10 Dec 2025 05:56:17 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6c67:affc:583e:e754])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d4a995sm46908455e9.13.2025.12.10.05.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 05:56:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 13:56:16 +0000
Message-Id: <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
X-Mailer: aerc 0.20.0
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>

On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
> This patch series expands the existing constraints in
> the q6dsp-lpass-ports driver to improve compatibility
> and flexibility for audio stream configurations.=20
>
> The first patch extends the supported sampling rates to cover a wider
> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
> diverse audio hardware and allowing more flexible audio stream setups.
>
> The second patch adds support for the 32-bit PCM format
> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
> and 24-bit formats, enabling handling of high-resolution
> audio streams and improving audio quality for supported hardware.

Is q6dsp-lpass-ports involved in compress offloaded playback on
existing devices? If yes, then how is it gonna play with
explicitly setting format/sampling rate to s16le/48k in sndcards drivers?

[..]

Best regards,
Alexey
