Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE92F7EE7
	for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598818; cv=none; b=u3CuVUTjCSF/vGJ3wJ2BRSF0FejRykPER5zUpONh4CV0clQLhMr+SZNdNZiD5Lc5wvGuWFnaOiqQRzpLbgXm0l6fnar/nJbVHXZBrVw9Je9uqe5uDE43ydBdOUiWpvhVgomEtsYlsoH4N81s4je4jDLqPOekMEABKfCzoh07WKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598818; c=relaxed/simple;
	bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+GA+f/ATAP9ZKvs/PQm9ve3GJb6ASheHDy4GVZo24b5ZJcwlC21v/Rxs6ha236HMWObFP2Tnpy7BavJlEmr0Mi4N3eOX3TZB4YBDea1iJQ9UWZYn5jtH41n0LZwO4Cl8AwnboRmIfg6ZfaS/cNu4Vs0HpiMthVk3+uaAULolo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bedSKEcd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bedSKEcd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88d48da248eso217597b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598816; x=1792203616; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=bedSKEcdonktUwUOm6kGJgnOp1+atn9lWPkJm+9A54WEWeLJq2NfbMTh3fMmTqhWG8
         1ATBLPRzno7UPJUAdmSOVqNTlvxwXqsRQ8NX4tLN1zO/1Sxgnf+qAlMJYFIuPSLphXbX
         WVrNgv/hyIGWKw0KjB/Ck90NEgloNgeJNTVocHjOLCz+s7NWAVrBR36YHCVdECO2oBrs
         7552wICnjntsQukPvk+cpGcKljXeJvIr7MflJ/uh9KamJQizF98pvdUu247rphjHMfUJ
         +RTGwyw1P5U/GBlUqRMB9bao4YEmQaQ/07AJwDq683jWmnuuoz80faxx1uBQ2mvozT85
         AYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598816; x=1792203616;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=BBZKEUjP7RVc8YcauFMBhKKXSyRPpFe5WwlOe1my/5c/6TUPVzRY9D9aV1+zBLQAH1
         3QaA6X2Dq9y0g4xK4vnYJcpgZkPClSMv/lSYw2sbs6gRYn62eQrzVmQDYOGv2BxrA7ef
         H4hxS0vPzHs83M5p9eb6ENoaJB9kJGP9qzLWI/KZRADTkYwb1VDiW7tJcUtct3awp36k
         6V3FiBmgNZgsu+ayOOei/ZDQZhld54VGMBR0vZDRK1zKGjLnb3oCzRrViAsXL9PRh1wo
         s9NpjacglZtMLyK64JjCj0/p9dLZ2dZ1yyhNSTTRo6jx0hXMoH7mptO35qmf5mt5TvG7
         +eUg==
X-Forwarded-Encrypted: i=1; AKwUvBzjVFs0OiZbEuBFBgrTQE0GDzKNhPPyw7aKgCdGBKOtDvZnnPrTyMg6LcsL+2PaC7lbH/O2u8Qj25tEgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCJJIYesoXMGOnEJ5oEwlEnIi3hbEfWsP6iTbUCjwZu2vff6Di
	YwF6AuYtS0p1qWh0Ho7xa14UW+yk8IrnHPMeQyqS5rhtfOmn0GVuIp1FBo27c9+/
X-Gm-Gg: AYBFou2z5pPE7sDTcY0PC9ACWaa0i6f7cppM9jH2R1FqKVJ2W5N2mZ9C5mc9xycQMER
	zOqM7ndZKsJVVExZse17ly00JaGNL0yBky6iAPNUxLRY0Un5HaccyzuGleXhaMA0jafu9NM/pjh
	1+MivzbKJH3ckB2oU3qgbftXMsGQd7rv+ZN3XBznocYoK8KAsppjMHauU3D44KHIw17RB/RhIlE
	nks53INgjn8YFi5qJPS6HjkhcuZPMk+60zvFtIm5UEliHULrkLT+ycJKeYUo6+svIBYtU3ML7lo
	QtErj6etTl6vQ+Yx+6ENvyZ5+y0QQzq2A2j5YlU3cisGoaidKtsSJD4auYwn6ZsrKpf390Onldu
	WtWywHnDs850B4Tp5yXeCrVLKwP/7bs1QzO+9YcQ92W0NzHScDYJrPBtJrbGRV8zLvm7y+ZUqHy
	p5LmIXRJx/pBPtOSoFcRgA0Dj6rf26zQaO5SBuG9PFHMWhNg1HfpEHVWeoLgJmGihIj98QarZ5L
	kzr3zqnuxVjeHVBngRv1sybGzjg5WW0rXjGlZpe1920hkB01pS45Cv7q+Vrwk0AZ5S1qWv/btiZ
	jLulJ8yF2hL/Aaf3H3Zpv4ybxIVuzX5iX04RG1wQKD3bLvPxOMs=
X-Received: by 2002:a05:6a21:4eaa:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3e16bab5c23mr3009407637.2.1791598815958;
        Fri, 09 Oct 2026 19:20:15 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c479c2cdsm1804113b3a.55.2026.10.09.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject:
 Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip power
 supplies
Date: Sat, 10 Oct 2026 12:20:04 +1000
Message-ID: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
In-Reply-To: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:10:01=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> > Some integrators do not expose the power rails connected to the codec
> > in a way that can be expressed in the Devicetree. Do not require them
> > to be specified on such platforms.
>=20
> I don't understand how these cannot be expressed in Devicetree. What are
> we missing?

On Apple devices, the regulator(s) driving these pins are completely opaque.
They are not exposed via the Apple Devicetree or any other discoverable
interface, and they are not controllable. As far as we can tell, the pins in
question are powered whenever the machine is powered on.


