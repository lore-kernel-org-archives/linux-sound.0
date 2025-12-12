Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7D20DD48
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577535; cv=none; b=QtwqS8reJhEdxSaY5zzJMDy9RdMeLtmedX7o/Bv1zA54uh099dc4gApLt71AxYIU80V16xwSqsQuXeQLStRvNVbso80aUz2wZv64ccSjiKlQvzMftgOcHZjnP9MNZ8MO332GMTqQcLxhA0IAR6ArsrkhzioEgZkjP2KBBsoKddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577535; c=relaxed/simple;
	bh=AJ/6+eQ8kd5d5fPfDtDL6GhqcmFsKwTI1Qwl04u1K0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOU1xj797lnDK8LT3+r+bw53jnHV5+98QpKEfPTwjHdo5aBdlVnD+HOM0YdMF+3tpOR4m59dLZ8wDk1VluM0gpxc68C392CT8O2bMkavRSKtxrI9gMaVigHB0wpR6XFzvKHPgVAAdNzoRK7gQE8EO1ERgM1yLPCGhWJCNkRX1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRClULav; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRClULav"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59584301f0cso1812042e87.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765577531; x=1766182331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQwqXmGfix2YeAXAoUv4kLWbk4s2jhfO/LPyPeEEYQ=;
        b=LRClULavwU/mQbWn9A0GYizQguSchkgE6DcXiopoMAE+hOqMoBWfcHZSd1g6EkYJK5
         /0VTP9Xw5x4LwO1nxpJdB3qsdMab1fT1Z2hwxc8tt6KWSvae2Ef3h/C/s29dOuS4TAR9
         3asZEJGc0m6hrPRqob8NdxODKmdFxBjxoUlryj290wvmEFLkOITdYMS91I/P9ierkwZD
         muGpuUpHpldkHwXg073L6vvPPYTQaJMy2GhTrS1Uv1dzPHIsZgOsGxbO/yZ27Ao+/bbU
         nvH62hS0Ff8+QuLgasQnRijQfAVmT/zm+bv0WgAlDH9mO8n0F16F0QQ/Gf06qjSedNyq
         yHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765577531; x=1766182331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsQwqXmGfix2YeAXAoUv4kLWbk4s2jhfO/LPyPeEEYQ=;
        b=eO34at2nXahJdPUx556ltJ6/eDbWVcWKwYckp0aZjvFhTpOXkF6T1U9DilWQrmsOmD
         nBQJuJoc7tmpruRRVJiomSFyzCuIQLMqhhWIkLlSrUNzusnWTeSMsX8U3cKCDXmLYMjP
         bGsF9OvYqUleQkzbZwpDWvLtE9X1xnu/XjiXO+kkuiVJpVaXV3Wb5f6r5mMHVSpsQDAZ
         ccA/bWyc/ca081qylQz0Jb4D7BB1bKlgEaBekGOUEbuQJIiCMJYADfEqgOk8iYxtlcNZ
         8q20Uyaj+ARzOkWjnzcRYiyFwA9+6SA50OKs0xQISaZXcAMbxg7iUagYfagTIpJ40aPL
         Ftjw==
X-Gm-Message-State: AOJu0YytmBEojP5sRpxY2KxMwutdvXo++GPoXD4cWmL/uRwew4aCz/i0
	2uAXuxFvg6HPcpU3GpoVKN39d69kQOgDfyOjaFpUhETwSxd51IDaZLqUctaFnbtSOQE1LzIENAD
	+fR1u3vysDHuZJ8ZpeqHPls2ww/4nahl+XCSU+Yo=
X-Gm-Gg: AY/fxX6IjvbSK5NNvAfndsFK0ZwywDQz6b7jqCOzcA+Zkcznon3UnPtE6Bg8x35Ngh6
	xklOhhFOSpUTwxG69HZoRlHllEXED2JPdhmA05Nm9H2NoUfHrN21qKh9HGB90AMmpuYHw9vAlHP
	r25rTvsTLxc/98EfmBeT4eMf9fBR44HaEMiceiilRUqecP6OLbeObikITrCYQtd+YSKOAYLUSDi
	zZq6ULJQXbb9rtVRDTq7CpZQW5anpopPOAqcgfV0L7A2wnxmZjUaLHTXUUIsDcfxxdLfwh5xJ8W
	6LYl79cN+YPOi7aTSiY/ze8T9ao=
X-Google-Smtp-Source: AGHT+IFrHfwuqwr9V4KpZ0A+wkTg0vJDfRRhzq3tgpbB3l6i+Djtge9D+UN764HM9ic91SDaegCUnSstqGx3yLAseEk=
X-Received: by 2002:a05:6512:3d1f:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-598faa97309mr1123655e87.47.1765577531199; Fri, 12 Dec 2025
 14:12:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Dec 2025 19:11:59 -0300
X-Gm-Features: AQt7F2rx42oyhjZjDE26CeukYpUL_DDtpfRSipXSf75rBpghyxozipg1BcDtvZU
Message-ID: <CAOMZO5BhmvC1_AhcKTerd1p6PdJ7+YLonU59CcHfmpTVavgqdA@mail.gmail.com>
Subject: Re: imx8mp SPDIF TX does not produce a lockable signal
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 4:11=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> Any suggestions for debugging or fixing this would be appreciated.

The SPDIF TX audio locks and operation now works.

The key thing was to pass AES1 information.

In /etc/asound.conf:

pcm.spdif_out {
    type iec958
    slave {
        format IEC958_SUBFRAME_LE
        pcm {
            type hw
            card imxaudioxcvr
        }
    }
    status [ 0x00 0x0A 0x00 0x00 ]
    preamble.z 0x0
    preamble.x 0x1
    preamble.y 0x3
}

Play the wav file:
aplay -D plug:spdif_out  96-24.wav

or a 440 Hz tone via speaker test:

speaker-test -D plug:spdif_out -c 2 -t sine

Thanks
