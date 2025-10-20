Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947391F9F47
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970944; cv=none; b=iHfQvArg+Ia72rkjYcbfLhjflOoXOmteLTpOXx3AuRmSJQbrHEu/UKZZwJIagChAjmqcQ3I4Rb9fSWxvEBWjX17goHIX2bUNUjFWDlY19eKXStAldngMsOH88p1YssrDrEJBu7DoW2v+1mH0ScG8QX38cJOzhL8K7jBISi737hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970944; c=relaxed/simple;
	bh=wnYcHCuWZPeDg0BhtNTyWjiqcR00ZxV8ZoizojL33d4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=k1UcFUybxBmBrS3cIe31i0+VdExAu50P1REgRXbixeHF88WCAQMuyKGhG0Kjp0LhrBjvw8fZ6F0KAP5Z9B8Y0t3zgVzvP1aKgQ9JEB3hz62qGCjsxyFxWgAgnx0baZhuwAmf/K00FBmuM8Abrc+Ne6Ywc2iX+AIwLFcKPXl5kiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2AqTT8B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2AqTT8B"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711810948aso29518635e9.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760970941; x=1761575741; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnYcHCuWZPeDg0BhtNTyWjiqcR00ZxV8ZoizojL33d4=;
        b=d2AqTT8BxzPj06lnKw6PwUJzRS+mwWO7kv/T733MPM/8/v2UJ7JIJ7YOMFEsWsNerH
         4OgL6OPIHWQH3nKHWloRaGOcD505CyRF8IAgWjMiYW7hUxp1OXL6XDDXiKGh6tlW51pG
         kBq0osh+V0mvARgbBlgRFkA9rvenk/VWPQaj4FF1nmVGtW+TAGTAcdcExxc8DHNglECM
         ++sW6a/gCUqj+be+dGO2FngG0CXfTBbupgp5vL4AfzcciOqP+k5DZbB3copDn4pigIQ+
         b2aOF8iZK+V/NXkm59eAx+BdFW4ZaHCJyXYaHZU8CIzkyVb6QjYklfvfUdHOqV7kko4j
         9+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970941; x=1761575741;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnYcHCuWZPeDg0BhtNTyWjiqcR00ZxV8ZoizojL33d4=;
        b=jrT00eyI/RoGKaUp7ZUHiuYJjdXetj9MGgUQwSKB+1Nw8TQWm3te1qC8rsku91ee7F
         Q6Sl1Wco3cKFqj3/7aPjb+Gg4l6K9K/8e1oPmWHCO81DQ+P6nLeqZJlihD+iiurVY0js
         i9qRyjsPVCUGnS20dWmompW1gitNAo7kvFQILhm+GP9Whlyil/f98l9mXU+LzyaMKeiI
         /HtQabatWT9oe02goVVkkF63L8hziP2lAXpScgewUsoq1GQ9tpCsGh54CDEEObRDWLfw
         1KC2kfFm4L+ZZEXfQzYjDrxpN5VlrqyOkCwWHD6j7OlF2D1sLLlDuh/iionfHya9jwUA
         ejUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3wcFGgARecyYe7XocJ5Ati+dFDOnszjp/F4IfF2/CpCQ7GWJKak53CvtAsQByDzFyoI7BgS44OykBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjESEmOZqsJDRZtAbpHubWtd/xbVkxTizNUsW19GCJyAmM/7Yr
	zviiGevyGLnG/RUr4TFJQGbJONH3iGyTyyWBBQAQzeJSiqbM1Benq7U09w/CG4HlQbI=
X-Gm-Gg: ASbGncu62iObPAH/77GN80T2S7+8dzBDYOlkS9UKgVEiPBOwYwFDeBus33Uwum4vEt1
	niPWrm+r+Y5cHsKfePxtB/DeymrZDB4sEG6K6HhFuUTso50fE7JAI2yAkysdkzyR+wv3Ncx1wba
	jja2fJRKOR5/NbAMnrAGG8yB/o+qW+E930oJBMr29z+K9LT1zBeNxSQnsAmwa5S2odoaqha9P0W
	atQ88DKQ69cCK4jxtcroKynomNn/ApNluo2k6vo79MFUFYKV/MTQ/yWd0IhCnBL+cI/dpUO1k1u
	zQFqkb2b4DLVeyykhV5i0Qh+axtuhlCMbS5ogfuIjzH5xVEL0BWtvVlgcx9nA6mHF3fJb9PlF7Q
	w5Nfzxpip0HEyxrgGLSUSGaN8eYMPz23+5vPjg7K+Xzo+KJK3Fd2/FnkMwuDNzT4fOdjX+/xgb9
	1frvzMIRsVtnC/Tg==
X-Google-Smtp-Source: AGHT+IHstFjqQkjl+l0ywmYAHSUcGq43w07vFirmXX5YtQRkOxuXbbdfyJ4BicC1pVjbmBltYMMqIA==
X-Received: by 2002:a05:600c:828d:b0:471:11a3:a289 with SMTP id 5b1f17b1804b1-4711791c5f5mr91081905e9.27.1760970940912;
        Mon, 20 Oct 2025 07:35:40 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed4b47fsm116778775e9.4.2025.10.20.07.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 15:35:39 +0100
Message-Id: <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after
 closing
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> For record path, multiple read requests are queued to dsp in advance.
> However when data stream is closed, the pending read requests are rejecte=
d
> by the dsp and a response is sent to the driver, this case is not handled
> in the driver resulting in errors like below
>
> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10d=
ac] not expecting rsp
> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10d=
ac] not expecting rsp
> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10d=
ac] not expecting rsp
>
> This is same for both write and eos.
>
> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
> ASM_DATA_CMD_WRITE_V2 as expected response.
>
> Reported-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I was also reporting this error months ago.
Thanks for fixing this.

FWIW there is also DSP timeout error on Audioreach-based platforms.

Thanks,
Alexey Klimov
