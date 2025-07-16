Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66390277028
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650402; cv=none; b=WKv6JO4hlbvdeUp0uwPZtpkAWftP0Cs3ihTR1dbkhFXolaKVscUK44LT+iN5B+tgcLr94bwcyIXNL2CSjF1jem0L/+4bHnaxAAntIGqfDKnNtENhOdq2Nf4FwaVRZBnkr/63z3McKTdxITXDAtmI7n4xDESPBdV+B5CIPomdVA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650402; c=relaxed/simple;
	bh=sLBjAxUF8f0bVLkAa+0Ov5QiRQzZ9hdeQ4tEfeTn6QY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=j5FOqtLrX4BvvRrTod1Bur/dPTOtgn2lP4mCFsUg0GZ/PF3VndkqdkqKGlIZWI0A1SP+1MXTCfGvJliBv4qf1Pw/HhdsoU3IibcHPgI/8ZbHhDYdOgAqH20QIaWpA9NvgSjWhK4BGAeRHuf02JTcQns2z/W2EFdPahbasr9sSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0V5sUMnq; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0V5sUMnq"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso8807960a12.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752650399; x=1753255199; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpS7uKmXirtt0SzgMZ5d4QPt02O2nNF9SJVnwbn9UkU=;
        b=0V5sUMnq6XUZ59pl5vKImk9+DasmiDKM+skGK+YgqapvslnmUAp5U3auvJnNo0nNqZ
         SKDEMEIrZJwv3nufAaO/eSi8+UEpN1RGqa29qtRpdYL4rEi9GOxxMN/SGZxSsfnllwQR
         d9PXqQ+Ex65ejoCoH5WKIzRehKdOqqA/mAhfsEY5ey93h1e2EAnYPfEFU7q9uduKLUrp
         BQ1Ai6vFMqD69WumxHe8c6MwikXyKW+2HF1XuApOG7XZ4faB4gK/fz4AseCAFayKIP4M
         lxHGzwHYP+xLJJiZho2i9gu24NQlo7C2S6MQeD8rS0lcAQ5UImXhgSEsqoQAErP1+JVP
         1WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752650399; x=1753255199;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpS7uKmXirtt0SzgMZ5d4QPt02O2nNF9SJVnwbn9UkU=;
        b=mXhcdvongZ1MODRJqGr8PSISmVHhg4+76ufKNDfhPxEz3LhtGV9yzajbovtyaQds73
         qAqgYasTacjMGkPVP1bdj4n/b98Q3X+djTO8C1GVXx0p9hOcIXzCD1gcx/pB8J6nKN05
         pmv4gIuNX4dypJBNGnAX2D5W+iTMKYny57oZEbhrx0IU2DD6KbgMv+ysui6+Df7e9NBp
         dTcYdVElrAB5lH3qAJIInWJafFPWhq9XQEtf8nRf8Qzb2wkWlNJZ7w9weAVXOrbIQWbw
         moYmBxdBW+9h/2j7Og1doTkQlGkxV7HIMc2umx8v6GUTQe152wnd1Z2wfEoLlxuuCTZ6
         vX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2hKy+Kf+d5xKwYzjMBJNngEzi4RW03eQXKtx5t+wo/sOhJ1aTCD69JkZOEb9/O2TV4wLw4t5mNWNZcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlyMqHLhzFdx0WWbrsQankG0dEoOuajhRFWTCRnC8sBixbcArP
	fR4cDyj7/g3EXsUnFQKNBuQuuXxeKmR6T4coeVbXNMDnfLD/b82sHV0qzeJxKCtE+2k=
X-Gm-Gg: ASbGncvgSIE38xg4Oati4zoi2lszXMDsj+swHv51rebVke7AMExb7oIfpbI/xpr0wUT
	pqGbj7keKrxgayyIQCCVxAKfvfRWYJtQPnGthNllvixSJj2C0JIzSCgjtABPfIunBcYsgk4cY5a
	oVPrySFjjIOtI9KIQ6sNBPrG0DoKkizeyEn0HkJTx9WWcm+sVXjsAEYwqGl9SsgJ1OLEk05x7lP
	9fRoH3dbnyH85wSc0CzhlzYQwHLkh7OmVZ6jVFxpjygp3LZQ8KfpMPaHFp63ubvB9prP2jIpk8p
	ux3dhOJu03Nu0CyBxnS4cFSW5Q5VMOGb5afp7tcQfvnM6jFs+/Cu6uD8PrJ9KE5brjaX8KgIHV4
	7ZQ5jLCRo0K6udomEjLPm0dNxf/o+f2fjFc20uo8hYADCFIBlNB2gSNc=
X-Google-Smtp-Source: AGHT+IFx3m1lBU1VkWxih9GukzBwademENkA6wKJQrA2d11n7XWBx80BohXOxpWjVJdh9pJ5agT4FA==
X-Received: by 2002:a17:906:6a25:b0:ae6:b006:1be with SMTP id a640c23a62f3a-ae9cdda3d41mr149340266b.5.1752650398619;
        Wed, 16 Jul 2025 00:19:58 -0700 (PDT)
Received: from localhost (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee459asm1162633266b.52.2025.07.16.00.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 09:19:56 +0200
Message-Id: <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>

Hi all,

On Thu May 1, 2025 at 8:48 AM CEST, Luca Weiss wrote:
> Since the series for the USB sound offloading driver was finally merged,
> we can add the sm6350 dts and enable it on Fairphone 4.
>
> A few devicetree binding bits have also been missing in that series, so
> there's some extra patches for the basics in this series.
>
> Depends on:
> - For qcom,sm8250.yaml & sm8250.c:
>   https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb451=
80091b@fairphone.com/T/
> - For dts:
>   https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7b=
4dcf@fairphone.com/
>
> Devicetree patches go through qcom
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
> - Sort cpu & codec nodes correctly (Konrad)
> - Remove usb-soc-be prop as it's no longer needed (Wesley)
> - Pick up tags
> - Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v1=
-0-f90f571636e4@fairphone.com
>
> ---
> Luca Weiss (5):
>       ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
>       ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
>       ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
>       arm64: dts: qcom: sm6350: Add q6usbdai node
>       arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload su=
pport

All dependencies for the patches have been applied already, so this
series can land as well!

Devicetree patches go through qcom, the rest through their trees.

Regards
Luca

>
>  .../devicetree/bindings/sound/qcom,q6afe.yaml      | 13 ++++++++
>  .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi               | 11 +++++++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 36 ++++++++++++++++=
++++++
>  sound/soc/qcom/sm8250.c                            |  1 +
>  5 files changed, 62 insertions(+)
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283
> prerequisite-change-id: 20250321-sm6350-apr-15f3e7e4e5ca:v1
> prerequisite-patch-id: 69859554c94de52068406dab0d2869ca26072c78
> prerequisite-change-id: 20240809-fp5-dp-sound-b3768f3019bd:v3
> prerequisite-patch-id: 2d8997a2be02cfddf3a054c79e7eb308a6d06710
> prerequisite-patch-id: 1b7c8f00ab50ae71c0221868578b9c1dfe939e4d
> prerequisite-patch-id: 4fd0673c4d35c1fefce63ec5785ff5ea67cc3d3a
> prerequisite-patch-id: f5ec3a893de19900f62dc691d83986f1104914b0
> prerequisite-patch-id: fce7573c39e768f7a09c002064b6159b8e91161a
>
> Best regards,

