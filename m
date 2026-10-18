Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4A35AC01
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302485; cv=none; b=XhJxqSJ/A+56rcOqqTD7Rn5m36YJzxz7EIA1jNFmO+h69O0s/Yq4kOFRoO7SvOcvW8pZS56z9nyV7nJGjcP9BsNM53PScOnUXZshneyjPPaNNznoYv5FcY4MGoMYYr6h3pnJCIrALtug+49cjbEFaw3HIRPE6B/bYBnTmGCW7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302485; c=relaxed/simple;
	bh=nL33N4MkG2GAXW61rbmW51GmG14HD5JKfZBJNorgJ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRvQrO+RFb+J763lb9sU6emy0NiZPq6rGU/0GEU5nJgLeH5MhMPtdzG6HOri5+Aq3jlJWM2Lo0HfB2txmDsIRQ+MyAJpVnEEvTxLHyisP+VTRVQRnD2BJVolGRmEBUoA+iiSXT8iP4/xI23fGqFX1bl5kmKM3+JcnYDvowCar24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+Fudt+4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+Fudt+4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05b210703so153036b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302483; x=1792907283; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=a+Fudt+4e3OgW67xS1yaWa8wIhwZ0817b8ZSxDEmUF7BN/A8tWfBQdUtxrSbUpOixK
         ax0dihjdGmYwaGU6Q9Tv3mxTI8Iu89eMfygwHBV+yHZozOl9Qv+wMPLkxvAEBHghsKjy
         n2WYDipj5a1iuntZKr1My8AunZiesDyYCwglNoKCcOyMWpbDDnRnoTv5NaMPSTEgL1EQ
         ua2QT2RYy56PwqQOSvHU3nAfRrs3a65vPB/Z5bgyjCco8D7layo2OPpAhe+TLjbcBhhL
         APFMzXGDKF6ulpYnzlIXC1uTqKDEt5xVsyN0OcAZAa47rQ4VPqQkPFHSYF8/ID84zObZ
         biKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302483; x=1792907283;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=C5Uh/X11mJTXu0SIrJKRQqL2icsWc7ux33IyFz75MPAn0t+cbS8gTmKKSuDtTYVdYF
         sVJzj/YZD0GukNoi1D5968KM4hZp6YQDAcNrrZ60Cp0fFt7wjRiR09DyqT4SQlRvEoC2
         hHvLcOIqn/zJJbclj2vinsBJIYSBf/0zLe10nHtNpOrejJ4fhO2/v1stt7Wv4Rq5w1tF
         GGzq2hcb4tzlO3uvSnZXfoJFRCxXL4Wm5p4zNsfskN1kWh7HKMHgsjZ6WmBFA70z4WW6
         1fAWw1TJYuhjWBfAdcTD3KPbRhEkkjWTedRmKWiVbMg8ge/BEA9V8llRXsPXvQrIuF86
         ctcw==
X-Forwarded-Encrypted: i=1; AKwUvBwaYNFsGmZ8+3+SERVVWf41zBtYABiHSNnXp+IeV33jUh7nY4DrXHHggrL0GMyBYaDRXvxD3N6jiFrkUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPbtbDWu3r1aNUmH4roXH97L4OLmWwJ7nycrs6KmxodTZi+Ya/
	ufHcNwd+5jxHnHPZR6bHD2EAfyFY77EwRihpX6HzmF6C6v8AZHFma9p4
X-Gm-Gg: AYBFou3RsIOu7dmn6joS/L0fDonnLW8KwjH7bKrgR8frwHGMxgM4dB9LbJVOR44va0Y
	KuaJf3+qsJeeiTG91W3FxHgvzzjjPder/iOARoi28yAvy6zew4VsSIrEcrsHOisTaEoHvOKYoY0
	6OWe6wgPZ+iQ0K3ZWJRn/FwJhtbSOaDS9vVe0g7nBJB5bjLTydxEQxWohbUZP0c6UhW6N3xXQZV
	BYM+zD09HivTCPw/FVO2u3ut0H+qw5yb2Pf3/NswltCSW/Blfnp7gRQd0tzQIFspsukRrMGifi1
	TF6pDxDZrkIv1LUWVGz4+uYvdYOJJgobubB5A2CYVBC7PegRrA9XFLGoT+aguEvAVy7JR2olQGJ
	PXZ87JtHgIOd2acHwv7Pnk6f2r6P2uqgoZDoSfTM6gsyVPB/uadToQCQek18sL73l/7HGtevmrw
	qKGTmFwz8vHE3heBl+vKFvieRf7Nt7HzpenYnrO0lwovW6OeRo28wZAwC35Jlg/CMwqybgG05XA
	DvNoWO7WGb/owlpQQ8Ia8NHkvRuFOEFk8rDH49RiDnn10lzOwja6MNG099dl4kHElTr9CVL45xb
	TjpnKIeJMVRNuaC45KQsa3HIDDKGnLlA20pJeVnonY+wBiyeA4c=
X-Received: by 2002:a05:6a20:c5aa:b0:3e1:efce:1d35 with SMTP id adf61e73a8af0-3e225f2b40emr3593769637.14.1792302483139;
        Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm2648102b3a.29.2026.10.17.22.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:48:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Date: Sun, 18 Oct 2026 15:47:54 +1000
Message-ID: <sd9fj8SNRAmGisFuRJU7rg@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 8 October 2026 12:23:42=E2=80=AFam Australian Eastern Standard=
 Time=20
Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > Let the 'fixup_controls' card method return error values which will roll
> > back the half-done binding of the card.
> >=20
> > Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/sound/soc-card.h                 |  2 +-
> >  include/sound/soc.h                      |  2 +-
> >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> >  sound/soc/soc-card.c                     | 12 +++++++++---
> >  sound/soc/soc-core.c                     |  5 ++++-
>=20
> Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Unless I'm missing something, that one calls the .fixup_controls on
snd_soc_component_driver, which is not the snd_soc_card callback
modified by this commit. That callback already expected an int,
and class_function_component_fixup_controls already returns one
per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
for IRQ registration").

Regards,
James


