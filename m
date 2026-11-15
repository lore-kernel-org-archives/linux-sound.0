Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778151;
	b=t0YxbWd7P1HJtz3qWLVmkmCI5c6Jc5mrkNFiIciBH7n8heYny4rlyY0dad4A+IT33O43
	 q+QvZiUTrkAC8O6HmNl0qtYHVo2k++iZ0Ig3EVvJY9f+7elSiGRNOWfQkYPTmijnzkOFz
	 mhmNCFalwZYoGZoFh75xo/1ZkHp71JUBXkq92pdC7So37loVS0XRxWH6P+JrPywoqpu6x
	 841kWYBGVC8+U5ldhZV6UvyhpYqI8Kqca35urAfHntGu/aYcVaJxaQTcpE8REdRaiznhi
	 WRumcHZ4lMz8T9eW5M1FTuZ4a2cG0mNEWQjX/e5LPuOUBN69PVULbraVUi6GbfXmOVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
	b=Nx+NRF+ASRcUaEzAgRsMgTEKGnwvkmunrC3s8q5MQqaizy1YgAMWRJoEAVi2669SdTML
	 j0x9elyFvCsKsjch2gUIso2bIc1cMdw/P0KMYimEEONSidh6MXb0xSOiMP45sb7ljiKVt
	 qqeiuRMs/NJ7toiek9SCkKjdvvOFgGLWnhyOvZmWajA0hp3HEqJkmn1VkrqPbaJzIvCq3
	 5wBT4G7NMByr5kW3/aW+Mm9YQ6mZUAbZGmzHHh/IJgJXxLR7OiPN+Miqkwu+O2cWc/2uC
	 vT6dGY3w9boIP3y4dG7QJ+VM9af0G+6lOWq+JGQjeC3Ra5iNZ828+YaxSkjlFAIhhxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=rV5+gU+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E4606A32C
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87E4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=rV5+gU+N
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c246c0c60so3442118d50.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778150; cv=none;
        d=google.com; s=arc-20260327;
        b=aO04lvYxdheJY+v644pab9uhkD9hNGwWqV+oWx/ePVGSJSOtKIXlVEywhFENa0IT1G
         hgcnlkmX1cdGJAAlL0u0LcNhsCWnDrt8iUXcKzEXuYPPr9lk7RTJc9MGtSOu0hyNH1fx
         zR4Bh236EOqKDZ4T3dPzzWY/tIZCuhW5tvHHVAisgj/e6zURTpd7MBzaW6WOZE753s4j
         YtThU387Winh6IOP7J9i+p20HrESjTk3NwoHhbRmhYXSt+s/SP1GIomkLvLZIZIRGeRk
         8pJnQOCIEVf4j86XY03LXwGhLO7yRtt0y1/Tg5tMp+d48PZ0c3n97sF5I5OsgKb14BJX
         0W6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        fh=ULHUhK9043gA8uDlhgypGhtlK5tbKk5o3cWqIqjbcao=;
        b=sTazIQVoHvLGUNnGepu9nqS+YyXcyEjWFzvjpQLz4YNLEiAqtAqtMwTk0r2sgNYAwd
         u6Q7HotPBtzPLXcGgojMndXmJtUyGo+7Cq1RCqnFwhhhEh2DROpfTgD4psG7qk3xgjG5
         w5fk0fxQQLCi143YrQk8chFLlH2ljatdfDYE+gVA7FKBL/PoOj6Yc96xqQvYWBptrYBK
         LboU41UtNMSjpI+LV64hsYgmgBN4ZFEMjDtt8do1kI+EIqp9IDchtrPuE4Te7py3gUYw
         W8Ya9O6S5QhW/K1O+jUeUDkP21MYBmx7AtQjOMvJogJJ2nAdtH1KlMQNRigg+JslLho6
         IqFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778150; x=1795382950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=rV5+gU+NHij2v89bHwlyKY5Noir/2v24z3w0oIAEvARkSvIG7vd/YfqLUzMP3cmaSz
         PzFU2lykEHbheQDsK2BYl9l6VKCgo+IPgPrlACsHsPnzpircwB7z66RcO+XSwDhtaY3z
         MFTJUjF4CAJNRHves/bvOhHnzbyjw3EEc+Vvgnq6Hz7qcZtjZBBHAvwAJIp+uFsJIF83
         CM4IQwPYCq88iOcwLOA1AH+yprNaPnJsRhjVEWeC+oRWid4DKMiIJ6g5EGBx7Lrqd3dB
         uhQF/ypFr1l+xUXc2mErccQhwwC3ejk8Gv7Bn3/FCqlQVwXKMf41TDdqc6KjtqWlcFAV
         mRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778150; x=1795382950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=WkhLRBV8Rs5CB8kwxbu3SafqRFDv4Tj+JEdYAhcjsWjFIxHLRUEQFvsMO/xVvhHMqN
         Q3inqH7OzhxsvJFArtjPWczrxBOA2Opgh5pz4IxLtMQmq2Ye3kkzBm2KQkVhBihBdX6M
         /0A+dxEi9s1RjXMDUMUEY2QFKz7wmALhebNsOaEymthz/7IjPayYOyCxOj7jYL6yC7n3
         xmJqZ7bvtjcMqmZE7FVh7zMS7kzX5bu8RTTpDZduPVVHFWZcQmgjZfRxd1stlbbUIsCk
         J0OpLcb6W4Exc4QQWugu31MxpZBvuRmZQqrvV3DNWb/IAXdAtSJBd6WIskysvrahfyLJ
         AlHQ==
X-Forwarded-Encrypted: i=1; AL+hErGeMVpKF6dxDMCugyTksK6EFDjkRdbSAIHXNwUtEJDa9XituToijrNvTxphbkaSkk/g0iqqqPChMej7Ug==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dVq2mUu3l2Vej6KU1TuHHcufd6sWRtSZKJYKHqZ7mAUMFmeWW
	ixzJUbYVqQwkUe0DjwWjpl/G++OuHBJoTBlCmRv4kLYyAP0+cNNzh6oABkutVHJHTubPYKzfdDn
	J/N9RmAZQmt/NUmzay0jLqx55O3sXFc0=
X-Gm-Gg: AYBFou2alhht1qxgGUi0Bsk9UwP5kaLQ40XWcOwQVz2b8Xbty6tCC0VAeg/ryW9VFoy
	JsR1cwfrFWkc7ofsRlOUObxeWV5nTrn5j2C1uswd6pVBRtRTvHz+nF9e8wy572+QrdC2+r26hTW
	bZY7vyG167PVcjovxGXqr7bo5Gy6WLzXl1Uc23X8C+ClWPP/pF4Dsd9po2Vgvqb/dcoqZdjomrj
	s5Vb+1GdX9RyYsUfW04I2O8Q6rgVCauA4ryj8RVTrop1cXpPQVKWyNHB1lHlQhy4oC/i28bfdBg
	iGV/7tdgzB7sDCRO4twRUl0rWsv4aFjiqBmH2ipbFn0rAJXQcZBL1aUMv1mWag0/UoLvnHdxaiP
	mDTkFrL+t6ykjTTFB56KBfbddShoIw1hjjnA19qd8r4jRsNiVeMZRO12qeewS/hhsaL8lnw==
X-Received: by 2002:a05:690e:1c0f:b0:67d:b0a1:c9c3 with SMTP id
 956f58d0204a3-67db0a1d2ebmr1094277d50.32.1794778149875; Sun, 15 Nov 2026
 13:29:09 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:28:59 +0100
X-Gm-Features: AclHuK_mrwYOs88jQPUihYmd8k-bNvXzF9c0J2wcB0Lmj_2uDGdqbd4QCFY5NB0
Message-ID: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
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
[...]
> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", =
"FIFO"))
> +               return meson_card_set_fe_link(card, dai_link, np, false);
I suggest using the "audin" prefix. AIU / audin seem close enough on
all supported SoCs that we don't need a SoC generation prefix  in
there to handle this differently.
