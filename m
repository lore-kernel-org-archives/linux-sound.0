Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38EEA920
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 04:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739939371; cv=none; b=neZBeg+TQFDV4fCC3bGbDXTubsQ3Iyed3lW57ZIWLAR8s163dXzmgbDBZTVxhIP0TEd3OcutfAe89QjQv+O8gmfinfebyN4Ycb/bII3Vd8RP0quF72yonv4NLSfHNtq4JeDzBwGtsGtvTeL5kd2RtTvUojj0l5YyL2Wi0KfXhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739939371; c=relaxed/simple;
	bh=zb/9KgFfbpk6f/2smouuL+kG7zlSq7ptifNXDJHDfA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPCDoSlkrImH3BMl6E6IYvrxuz6Eqq4oovM3I9ZCEiGGr5Iuv8cpLU33YVz/sO7q6swunk+S011se0+3cblLe/f4mOMypO4ly1/LluEffrSvzSDs46lbozyHJywLiWKwlWRfZs3qg8mt9GfJWBESsoIxNLlx6zK6lHRo5Z+ujq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FcxhHo88; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FcxhHo88"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso4576742e87.1
        for <linux-sound@vger.kernel.org>; Tue, 18 Feb 2025 20:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739939367; x=1740544167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=;
        b=FcxhHo88lA3YUC6lyZGCLtuE8o8haZuf05zOPMCMiChbPYAlGSs1rXu3phsaFt+/ud
         FcHr6ild44OfnrLB0ubk5EDXNon5iyG0DPXR15poxsczeDqunu1ypeDyZlL+4V4IzhSW
         xXqFxKH2fYCp815Oxtd1YMwJOkwDJ1+XZDbz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739939367; x=1740544167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=;
        b=PMHqrsF+L5NFqj6kBqxtDMZZJCfsSR+mu895nQmOkaO9ywdzmlmccJY+zLganvSVGr
         0lMI/LWNwcVJU48ppUIsMEbE4dcnu3g6ARX0kAEhIiueEgtoyjz98rRqVFPkiVVPFBv+
         ehbtnukBh6o9HOS/OXg4Z8x5fb3C474EiZySH72QGE3s627LZ+28EDNN+mfjTimL47Sp
         /zOaMxNSqo0gu9ric5huSce8/2fvAnBRX9t5osoBJfpkryw2ww+nYyD0DgObVpm6lh4+
         qOaEh/Q1S3c8TeijmnFkggDPjZZQqorQ+ERcKCu/urgG3YeQxrAybggjHaRUPnW+DQ1G
         uwNg==
X-Forwarded-Encrypted: i=1; AJvYcCViHK2qavw3ObfmfCKY2OEmlQzwI/t/AiYlRofnO0Am1F5kVMjek5wRLlcLUrHErSipJqRZcp5c4j5LyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSefpx6gZj0K0vkZTQu5YocS80hA1bEdkSCujv50Nui5mPQfMD
	ah4+UJNyWhEBIk6s1wEEYCbcjoqDsbIOAqRiQUrS5NdcrvE9++eJ+6DTyodA79U36MLmJPZFeIk
	fnxlhrgX176gXo0dzabuHX1rUzCwYCzcrJLRB
X-Gm-Gg: ASbGncsh+A0+rMTr8aON/bfZF6HE3kp9nX2Et3gDUVuT0MaqNpwefWOQrixPiRJh1Q2
	FwTfJwAFeXCLRQe0Jz3K7MNeMsU4WALCAD3Ft/0wvL0RqOBKi+RgIqBB5swrY/yKLtJAn4RWww0
	/mJYNzWhp+hftSGF7lkEN8BkmQ
X-Google-Smtp-Source: AGHT+IFDON5BTBrIkCqYoruAW+GgEU4kzLUMfNza88SwUu5KL01SJq4OJVKPavaKWnoXBdabjUxCkcKdf2JVNhz5ek0=
X-Received: by 2002:a05:6512:3d8a:b0:545:85f:4962 with SMTP id
 2adb3069b0e04-5452fe5bd65mr6877441e87.20.1739939366740; Tue, 18 Feb 2025
 20:29:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com> <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
In-Reply-To: <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Feb 2025 12:29:15 +0800
X-Gm-Features: AWEUYZkGeDpr43jARxyOu4uYPJJwq5tj1ueAuV0HV6f4Jx2FAOS0QlcBYZWYQSE
Message-ID: <CAGXv+5H1pfJMQPBTF_K72D3-JFsZDvZ277erZ449sc6FTkNFSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8390-genio-common: Add routes
 for DMIC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, parkeryang <Parker.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 5:27=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add necessary routes for the onboard dual DMIC present on the Genio
> 700/510 EVK. The dmic is supplied by micbias0 and micbias2, and inputs
> into the MT8188 DMIC DAI.
>
> Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index a37cf102a6e928440cc88e7e8fe0225fc28ec962..efdeca88b8c4e58f0c1782515=
6276babf19af145 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -959,7 +959,11 @@ &sound {
>         pinctrl-0 =3D <&audio_default_pins>;
>         audio-routing =3D
>                 "Headphone", "Headphone L",
> -               "Headphone", "Headphone R";
> +               "Headphone", "Headphone R",
> +               "DMIC_INPUT", "AP DMIC",
> +               "AP DMIC", "AUDGLB",
> +               "AP DMIC", "MIC_BIAS_0",
> +               "AP DMIC", "MIC_BIAS_2";
>         mediatek,adsp =3D <&adsp>;
>         status =3D "okay";

Shouldn't there also be one or two new dmic-codecs, and a dai-link here?

ChenYu

>
> --
> 2.48.1
>
>
