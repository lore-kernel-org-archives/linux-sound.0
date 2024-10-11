Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B201991AE
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661107; cv=none; b=thdM2uvnrbjDrXEgCTRNlIP7rxRwvmkPYw2s3GUzL+dwLY1jUVl0FzBwzQIHRH8sY2+4IMNZWU+55lyAuhqvWY3f49OTRVhBVrtyMiNOOkBtuFQjIjM6b/F7AX3ChP6FC18glBj9lL8EX0aqZqetOpGaZnn5S5Pzju/ZQBYp/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661107; c=relaxed/simple;
	bh=VGmlgzoYuoeXjf4/N4b7/dVovXvGFizGCIMQ61YHm/s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=O1OoqGDpZEaZyE/3Y4jdJZNpIZpkuZJjLayYyxIVCvgRmsB+nMjM7d5qGWhd7RbgaAYrrAn3LHEbn71xNeiAzLjanqhl8HxkWOhNDdV8r2hb0P30sZp1eRxoRJ3473zKO5M2wuzkdvRRb2LYt4N/XH3DsNqg9Iiq3p5hShPm7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlXuI00z; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlXuI00z"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a998a5ca499so306608066b.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728661102; x=1729265902; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGmlgzoYuoeXjf4/N4b7/dVovXvGFizGCIMQ61YHm/s=;
        b=NlXuI00zVFBTe5bu2ArvLqRNAxiB6Ss8qz+1O8pin7rOljK3WW0QLSBwiDspTz80rp
         +PJaQCyY/+wrPgYV2to4jwR1N8C91Gvij0N0K1onkIGjACivnNDTzsahW/G+bw9cPGnN
         H+0ZalScydRWsPif5dNeUQKT3owdNsa2lFFDo8OeSIAInGjyee9ZXfyLsQo8Voujhr6Z
         mhSe+d/t3ETRtDkr6zGRz69/OUS8+oitB19WJ5dixcqg+Jhh8y5MsZ/MVXpqtzgVPG/U
         dfVTIUhcCooUqhYrwgkZ8EbK+lvsAhwK9H8YuDp5nQcFCarY6Kd2nQDt7+BEuTAyXWKs
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661102; x=1729265902;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGmlgzoYuoeXjf4/N4b7/dVovXvGFizGCIMQ61YHm/s=;
        b=OBBMd4UEl7ujBzMwrQsQ1pUzfw1dc1qJFLu1mpbalJZLTR8RGPYbrdvekEO7Rd7JYb
         7pOeJilB0VN/xgx5qDBESOx5ecN4eMtu7ePuaSHpeBVJc7Pzv2iMmNA+If0WC7k8Bvo5
         hwZjayMugpmL5kZFuR6KvczhqM2GVPu2zrb3MHfpRXZqPEDpGWHFeJ3UibqI3lDdIX1R
         5TedqH4LJkFFsf0F7tI9p5olVwMGu+cCu24nFLgrSkqhwT1zimvv2r7oTfDc95q0zjWm
         E6xniyvgHmDK1QYhXIWSC1PlmnOSQMEF3lamWOCO8HLqJh73oa4bgVIHLT/WamgG0+pl
         TyZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqIX4+MjtgFss8E0wTL6bPoKsPK8wY6Z9IYkVmBhesu1WfoSFvYHT4/NJ2xlqeku+R5cWqe8yi5Xf8xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6fS9lgVgbsh7D/CaxVtppmc3QR9do37+w4Cx4fh8gLXIEo/w
	unVh4TJXgWmLTwGygwnOQWoAYd/qbNduTQfrsndV5VvBIDklxBEYILjSo66jdvOd2AnaDzp3WjV
	e
X-Google-Smtp-Source: AGHT+IE4s8Q2Ca1GkHgtWLtOqANaHvXZHFNkqtGmRZ1SRo3AcPnPAE5BoCN9RPb+yOZ2GxGrHrFi8Q==
X-Received: by 2002:a17:907:31c8:b0:a8d:2b7a:ff44 with SMTP id a640c23a62f3a-a99e3c97e69mr8078366b.32.1728661102107;
        Fri, 11 Oct 2024 08:38:22 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99d3cc2c99sm20436166b.158.2024.10.11.08.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 16:38:21 +0100
Message-Id: <D4T37UMU6SH0.1IFHCFVO3UJ7L@linaro.org>
Cc: <stable@vger.kernel.org>, <broonie@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime
 stream alloc
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
 <f46623f3-b915-42db-a1e5-0427df310b8b@linaro.org>
In-Reply-To: <f46623f3-b915-42db-a1e5-0427df310b8b@linaro.org>

On Thu Oct 10, 2024 at 6:18 AM BST, Krzysztof Kozlowski wrote:
> On 09/10/2024 23:39, Alexey Klimov wrote:
> > During the migration of Soundwire runtime stream allocation from
> > the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
> > soundcard was forgotten.
> >=20
> > At this point any playback attempt or audio daemon startup, for instanc=
e
> > on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
> > NULL dereference:
>
> ...
>
> >=20
> > Reproduced and then fix was tested on db845c RB3 board.
> >=20
> > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: stable@vger.kernel.org
> > Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc t=
o soundcards")
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
>
> We should fix this everywhere, not only sdm845. I'll look at remaining
> sc7280.

What about sc7180? Or is sc7180 one the platforms where soundwire is not us=
ed
and DSP is not involved?
Anyway, I don't have hw to test sc7180 or sc7280.

Thank you,
Alexey

