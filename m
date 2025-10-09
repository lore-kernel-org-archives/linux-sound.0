Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EDE2D6E58
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008902; cv=none; b=E2MNpVH6wQQuOGiDv1V4id7/bkDhBXv0cOv+WwJ7FGegUUQ6g4IFeJId5apSi3o7MDQLJcn4/syXp6ub2vTkBCtvYQldzlSjjKqcyyooI7DVKJmeXqJzStzeBy59p1PKi8kcMktI+qp1OZIKXVyaebqJQTRD1O1DNo0QIqp3BEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008902; c=relaxed/simple;
	bh=6sSh5spmOZHPAgftosq8zlVm3OoCuBCxRRQ44DRZGjc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uHXCrYbVCm5sJ7adNp6forBVQsGkoPoo6nho6K0TmEir8amKGOYLrYdrr0zMMP8zXzJPXnbw/mYANzh3jrqQO12U+JsBwHuHMTcNYJzZVyzwm39LFC+xJFRjWE8uO9a87WDNjiGCljLqBkWKmt55IZFPkzSOkKNqtshxI1/NTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3MIRV9b; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3MIRV9b"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso520229f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760008899; x=1760613699; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sSh5spmOZHPAgftosq8zlVm3OoCuBCxRRQ44DRZGjc=;
        b=m3MIRV9b1XS61m+5IN+IwLqYRot/WxOMPX/pLjsCv8pEDdgKmbpg3e3qRS4S2z7Vup
         PKrcV6CymqWAM6GSIaXRxOOe23X7YuUh3wae8EzEsO/U06z1ehli74U8TUS33Pu6u7oL
         iC2qhVjg9zkMRMtYDp3SueySjadkMGF4+k89xmigDm3mXBkGLJVhwRDtUJNuNc0pKul2
         6EbCE9WRy7ieKb0HCvyW0EWlIK7pOOw47pUT7dm1PBSoM2f4CZgFJqwXfHJYyFcZHi0U
         J9OPt1mIToH1XILlU7ZFRAJO/U5WrMI1ohhkQdb79FwPhcGKoIjmVy6p9Rg32Yw+Ptyg
         Fn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008899; x=1760613699;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sSh5spmOZHPAgftosq8zlVm3OoCuBCxRRQ44DRZGjc=;
        b=OymTAMIPQhKBD7A76nlhoqgiu5Z/YymSIIC+JYCJcMs/O6Fm2d/y7hcbZc99sRuRD5
         a03PuN3v318w8ynho/4UbugallAgdlD6UtUAnR/8Z6n0XpLmLnY/VMWYPFOv2trirTfF
         igZFgqqOx0G6GXSW3rFaqcHSgdnBNaIxQQ82JP9qGS7UEQmRU37bSQ0c2UoS6TrMGnbE
         UjW9QhKbK2X9R4jqPXPBJg1GqvNSU77W9Qy/OTvNvfMWEqbKriGltuew+kVD5MeuVoSM
         jAJaCQ6RmqNyg1MaVHxw4hhMrAWzYYUOY8eAzlhB+j5HM6lY2a+B1iY9dAv2QLD6ayCv
         pewA==
X-Gm-Message-State: AOJu0Yyo16lbwqfdmRMBOaOW2y12NRx0/Jdaa1t6GWAukPJTcdehpDSs
	1OQkGcB65WXfP0JhHZyBQHYaS77VUbRuVzxYzTBEQPmYSFQu5LqQOMolDGcXuNjE2qo=
X-Gm-Gg: ASbGncs1SroXqqtBHvd2K5M6slezxyWcfbmFN4/Gq8EUFffnBB2ob+MVp5RxVjuY+no
	ITYX7P1z1Y+kMCb7KYWj9lGGwIXwIlhadsoSe7HrKGlxMqt/PID0iaMdodcYipOCuyS6nvkWdbw
	zmDxeW+4PZTeqDxSLcrfV5u8gRj4R3lyJHjPxLTA68s2nUtD9bBFuYt6lLTvSPq9RUspEtjy2QP
	TGt9yfI/47HGXg9EhiNkEXXnzwPML9omAwR1aghmsmsMT2/AhZYmFh6Y9qA9i81TuE4z5T0Keec
	0V+bRgYYu8zH3rtwL3W5sPBz440rGm9GJ9T10S2VonfceoqfqqamY4TiihoQiUobR4w4iGjenkf
	31tbnswKmDPdUcVid47YbPWKpqV21SVbeyjst4LrK9e0UjAjXpgFAgc43us/U/aAe
X-Google-Smtp-Source: AGHT+IFflhQlmkSN/2tNWXDC3THAhllPJpTf3aMPCOXB2rnMSjN2hhW4xvzZzF5ZeV/gFPVv90cBLg==
X-Received: by 2002:a05:6000:607:b0:425:72a0:a981 with SMTP id ffacd0b85a97d-42666abb02bmr4351249f8f.2.1760008898811;
        Thu, 09 Oct 2025 04:21:38 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:5333:92bd:dab:a2ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97fbsm33992893f8f.34.2025.10.09.04.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 04:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 12:21:37 +0100
Message-Id: <DDDR31N2P498.3FYKHZRLUS54G@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC v2 3/6] ASoC: soc: qcom: sc8280xp: add support for
 I2S clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org> <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>

On Wed Oct 8, 2025 at 7:56 PM BST, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
>
> The rate can be easily calculated since the card forces 48Hz,
> 2 channels at 16bit slot size.

48 kHz?

48 Hz rate will result in too narrow analog range to reconstruct anything
apart from beeps probably.

Best regards,
Alexey
