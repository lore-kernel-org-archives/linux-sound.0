Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778075;
	b=JI1IyQwCGVNWyQSrGZIJ51RmknSuoEMXvvbw1JJ1A4uiUu2llOUGCQuuAJPX17ri6CTk
	 iMIQcwnxv5MkKUvkn3MCdKXSd46aXlhrhzJl33c5bm3PZdTlC1Q1tIhRZilug1iFebt9Z
	 BMLrJGWl1KhBXTXGNooIBeKyZQFAx3mEQ3BlJeP5wyrDg+Qbnsf85pKYFcVgZtZcKwBvg
	 7DAossrmHqdtQGKNdvpnAaQ8NQkuWt9ykzgPCO5SEfXDweMTJSAqv0DQ9pdpBBnk94rKE
	 G3+O8OTe3BFfhu0o3LK2EJc01n5EtTa19CSk8vWcKxrT3LYQnQaZfeGAtnmXhlj0xeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
	b=ZQgy1plbrN+14G37NiF9qC9cH4DArdJsoACjr1i4JOVOqREbIDIH3/rymrWFX3BqnGUs
	 38TJMzVNyoPSt2KSHjiFJ+zbUk/3ussGjut9cBTij+WjyxVzXJB9L44ul2YWjqvAjkXMh
	 6r3kTodxwUsjdSRlRNylSdoG7tMCkmh6H17Aykj2Z7/IBYcLQstYAww4JaEB1dTnleHEY
	 iqMYPiJu2Ylj9DZpAANAW5AwWHVoydbChS3GkWgS0NqSqsAJkypF8C71Lz2OUUiS9lvLJ
	 8GA+y/gvGrt6mv2m/fLEx8d6suhQhn03SfjRzY9j8u/uIlGeIJWCTFAiGqcyIJLWgGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tsxRt8q9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD5606A329
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DD5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tsxRt8q9
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67da62357acso918120d50.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778073; cv=none;
        d=google.com; s=arc-20260327;
        b=WxwSiIu0fYHbQCq/REJ58FWlepWFvk4C8sVYz9tem9ioakl9S288yGFirmHr89aYvF
         TYIBcXmh/OJZTQ7UxMh9RyAMMvhdahXDrsr09zN4mvpLkvhmQB+ogX2K9cWck7h8PukA
         3r0Nqi+ush77TFkLuQdN+9LH/TjwDIIbn+yYk74S59feJXtXXN+SkXgnSXPgWBwsVkXt
         oe5nb8auUfzSpXlFEzopZskU0lEclTF0VrCw+dLau33uUfRgVTcL3o1gjWXo8yG/l9Y0
         bW13PyA49vR9jovCyD0qPGKoaKREY6M25LpemWstQkBozptKuQ6b8iy/K4iQ3ND8UtmD
         A8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        fh=DiIqP1zvcfEe80WtQR5ewef0KZvUYwBdGYHajRvTIck=;
        b=UbwhT6gV/klibjRlRkaFDUQDHMlHREMN91BGzd6X8ASU4aJFbXs8k+VMpri5YipWdi
         Om+rMx9ErCjuEGKv3KP6YKtJnUEAJwQcTd9VG7C28wrTuFRCBXEHWSs9wIYtRXCsq3Y8
         YVjjmylPo23ujiiBcgrtUhz/9HQ2wnfcif9pHdUsj57HmQVEJcuS3Q0nUTdetcgUMUy5
         prUCAiYNDc0xJZrml7W5+izu5vZjhZ2NSyTz6npp/OnWWTzmnJ6bnZfoJM3Kt3BxinZq
         MvYfdH23Yi1ha3O7JjLtjaPmxq/df6VTeRUPQjdMUFkGxhcN8T41ESClNkzWQjH6A5yj
         Oc0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778073; x=1795382873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=tsxRt8q9f0KX90Du1mkVtvnIrRJ91uI/VDkudcdAb4V8v3m9iWT1DPO8h52T4feYeR
         gJHCu1MOi8ezNmQSyvRRmw+eP4SzGDbsdwIu1UKcU5GnAf8Rw51+hm913Z9lLSkPjU4a
         F+8xa2LAUUZ7Ie6NsOyzXVGow6N7RTLiXslEkHL51fjIqh1hpkAkrrkUQpOVFXzrgtp1
         QvmhwpfqFOv5Xc/U2SBheC1k1NlGmUtIak/CdMk/x1rXdlsokyNtv8rkABKbfvyt+Sq/
         5er2XsQw1/H9jxgizo/gBcIrbLm29KXVhWrPII4KUzmeT9WNZavCUFrq6ZCj5YQYpFe5
         bvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778073; x=1795382873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=gJQdOCR1XUEzwMaEqPoJnlKdMo/Z/JHNOutBfU0h0jI7H5M1iCx/6rNTyUo3sf56b0
         b1gkwLXdoujYhLMficDeG4/xlwLCJaGEggsa/3jWN4npeT/OWT4etumQXugvz/aYhNmI
         nZFLscLc+hYAidDOY/qwG5lDFJML2z1SAdxFEzdRDHNV9Sq6WYXDBTed70Tq/y0P/ui6
         9L1zssy8/izEQMXKDvLWklkvqenjbF/C4VWMli2J7asVpukU9XVV2ofjwJ8HYMucIz8C
         rpilSr/Y0LmeUPQfjrYs2/r1knVwG6ixzEA3CYRiEzod04eetBTFMc/0qDT38hQ1YH5G
         jRrg==
X-Forwarded-Encrypted: i=1; AL+hErHNmSHwxa85z99TJCQH2yXHmRgqfudI0GQdSPZMM359WSDV6l3Dwjv72W1E6mCw4rsJ02f0j5r91e8b+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sOwr2vuxw85JJYm5Ji1R/hdCqzcJt9uF6wsy+6CkJ9elGbuky
	0OpLuN6uvnZoQpMLY/GGyiJ8v900+U/X09BO2KyElweVlhS8FpnddDVmRguBr9lysFZLAtLwwkG
	LCiGQCnSDAZdG2nu1SvP6pRIliR0WhocXXDG4
X-Gm-Gg: AZFdTZceUEUqa97sjbPhtS97oaweZQgTLI8nCmcTkmD4zhOPhHgV4QwzJO6HSq347c3
	7JV7UVvNG4Qd3iPXdZXnIrMwtvKK9PPBA1t9AMnPerZzv+pYjJMXxfGAwpzLFj45ILrsZE2JsQF
	2MAxSmlVTAK15VtdTtfEBVOWq9Da/BGHnUPUa2fE/M4JwOW7llZNbsCSf27gK0+v45Q+WmlaBtM
	G/nZC9fYbOvS9Z5BJhV8LFon5x5cYqfvPqcl7+wU+BPbeTfOFf0DJLRW3Gpd+zmphmpSHJ2xoBQ
	/wkcYQeujJ1jMA0RpXvfFgPFGj6MKKOY4QqTX+63/E6LhlfXELPDVnHGKbwj7MMM36f6LTh13Ht
	R1fgKgZyMU6cXpgrZjrUOWEZDW2dPP8jnAP+v5YvV2nZR1TY9l3wHuYD5Z3Y6Q/UXyQmAKA==
X-Received: by 2002:a05:690e:130e:b0:67d:bcde:a150 with SMTP id
 956f58d0204a3-67dbcdea64amr71968d50.65.1794778073162; Sun, 15 Nov 2026
 13:27:53 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:27:41 +0100
X-Gm-Features: AclHuK-tHWEVaVNE_O7wlDFFBv_6XVrqFZ8dhMwLJs0OnAdbKC_ynIhtYeGD0qw
Message-ID: <CAFBinCC-R=apWQ7729NueJYSi9d_pn_z9ukyFL5qPMXe=VQqAw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimi=
ze
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
