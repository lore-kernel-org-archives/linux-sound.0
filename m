Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870405;
	b=X+rbMf5zio9GJnjj3UuMwSNm/Vz8mNFpnxSx0YcmGQ6cVltrKrmHh7z/L4tdWl2U/i6R
	 ff0V6nXC1BSvN+xy65YNq1UXjxu/gzXh8sihefazOuAmIBXzN18bCoHoMxbwVHy/8+inu
	 upLkw2xXZx0TW/MFxdIwHtDLM4gg2pW/tqwmMeut+NUyF9jlbk0L3iPE3fcvDV/8Ulajd
	 KsRsI346D//LO+4wfUWDh3PmFVQR0Db7ZygoiKJNh84SxYkxhpLnL+G7KvNX0AacKEtYO
	 SvqCP3YMzjwZ3ebg1MzqPp4X6dthB9xl159KPh98R4QX8DyMSLrFR6VD6MZxRmBEsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
	b=xUtE8mwTlKkkDhlsQCBY6XTR7tUkhcZ1n7p9NOKTg20wsjSv+NdZUhhyu2xZSvCZlY+z
	 2XwFV643sFLMVDC7kUX9frZi7XTc/lZ7Ao0Q6JEAlqGfKfh51521jfVA28UMlEv2vKNcs
	 6kLDbNzZb+ykmTmTErxiuApHw6pDESZBnnsXCsOnnXSIel8AVBmR6aqrP6LF+NbMJdL1E
	 O/r34KylAH+CawJN3A9v1WffOJ+Ab3XsJmBra7Cmc9mqeUcvajlDC7cQlow4KsWzIp929
	 3nHjXCheVSEdLPLc5CmPptrZ1cCdB93qexRpfDokEjBc2r1v4y0ma5fUwHj95US36Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nUPwfzc0;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A5E606A329
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 23:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A5E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nUPwfzc0
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2244600f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 15:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794870402; x=1795475202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=nUPwfzc0SJy2NglXAMZADWXP3O5XbEar5kuQ3ZaYgCEL9BAo9fYukYwP3StBnAf8AO
         zLsw2M5YP1aDg0Tm7JVz6VjqXm6NM7cJdngFa4ZpLYB7Gr8rv8yt9NBOWvIqBxn2BWgM
         ACXx/XnBEa6oBhTILZAPLYtCUBYhnVlNiKjdZct9HzpMg4wkDKQJdA7gWNc59NY/X0xE
         FOPLomTGmQdUgXh0st7q+ycak/5Xr+kiEofhqJrrex1EhPXFYwGcpaVFnx6jW5ul8Y5A
         t/LB127BgKZw6eSCvIbfCtvh19aubqbrjS6Fvb7pPKdZbjf3CuGwYi+LwoMX4RbQjlqj
         02Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870402; x=1795475202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=XbizNMIdOqJUz2mup24I1VZm7+bS8ahPs7jhoXf+xmTB7h5C5hN+JADElxlDM34sY+
         80AxPVAanZzCduLtknqdz9msBkbeT5Ftj8MtbredQGBzAuS9/MMrAWpMSygWXPA86nYE
         wjphlC025KQiHvK8PMPUVRENFM26kSf4n5iUgLlUebxqJRQpD4ilJ1xuPzt4Hh6gh+Ci
         WixzcG6ygPF9YePY+gxKdSbzPiio7ka2ho2NDdPmUWFRQS+mszER4RR0TWH9yCRThtNl
         P436KcH50uvyj72DWEbKFV9sF7LDeLoz6obvE7grfZ8BEYDwFcYWzD9NMu0YjiRtlbLU
         NPZQ==
X-Forwarded-Encrypted: i=1; AL+hErEUCpwADtQfGVltczrh4RZvunaVRFfoDgGVS2CcgGHTBKL3tz4beNG/KmsuQkizm+VL3mijRrEp90GQCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z97S3spkXDM23K+hx1TnB+AvAfcLbM0ftNzBLPrwC+6/VMRjv+6
	stBbevQneScwj1KM7P3gd8eiBkPOJhC9C+Qj7CPVhD78I+gPNpw8/SMtw1cE78/uez4=
X-Gm-Gg: AZFdTZf1K0vbYxsAuKzdAS6dERjsFEVVtgtdXM5NEeWcvvh27z6cNEOTPULm0ITctZD
	pwx7mnCOgIjeenlZbs5mh1Ha6sQCxh9UCT1GcPl2U40RiIeHZx3Q/XqvNpSl42zs2EfGb0pD7Ps
	xWP4EnQdtINcdv4ceFhPtYEm3DCUblsAzpFhA4jjPkQq1BKyT+memuSaODle99lT9zkpBenOQTv
	iTRS/lH9kRMpPSsMZ2GBPl03TDI+zC+RCY2XgWYpEmGf2PySB0AhF9th3Wk3e8mKzm9RY4Zgmwa
	gYRRES5jX5Bzuv+qUKTQTlxCasMEE1s/FjQodc/XVPztw1nEjypI7UGK58JZSLvGylShQfWdGGT
	fHS/sPFDVJltWSBqnN/N23FO6gDcxawAsVAckSwZZynxMVKMWfaBxd8L+9TtpH/iJ1yC4DU7XqK
	REFlZFeSHnHhKzyvQYmSDabkMPJY+mg/1AG4Q2BZ6BFZZ/lW+gX+jDWVBR8v0wtA+S/bw2GZdAw
	GqNIYDNC/Y8wc1BTzhIeIGC27DjQ+FuNILsta4m41pRcRhLXGo6uyfAlO6L54GO+fBoJbWczIIT
	XZ/YtuV4bXGAUzMjR3rvxn7Ngnep/DSv
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr27070236f8f.9.1794870402452;
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm24359908f8f.18.2026.11.16.15.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Message-ID: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
Date: Tue, 17 Nov 2026 00:06:40 +0100
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
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>> +               return meson_card_set_fe_link(card, dai_link, np, false);
> I suggest using the "audin" prefix. AIU / audin seem close enough on
> all supported SoCs that we don't need a SoC generation prefix  in
> there to handle this differently.

Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the 
compatible?
If so I'm not sure this is allowed nowadays. As far as I understood 
"meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says

   "DO use a SoC-specific compatible for all SoC devices [...]"

-- 
Valerio

