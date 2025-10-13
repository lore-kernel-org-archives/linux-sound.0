Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0990270EDE
	for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358603; cv=none; b=eHsKUEqM65JDUSYaauRopD0oe0urHK+k5KpREFwuOUQhvQP6NtDJBlsGAeAdF1FxYPHlFKCpgkMGA5+doLGSEx1QBv6c/dEDtRXXye8RYOMHySGM79zdpHTij4sMJN7sEw7rgZ/j6QKbth/63j9NMLGr47LvRBOy0ZRkwxnrQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358603; c=relaxed/simple;
	bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWk+4oc7BBih+vfW/skYgi/tHLeMA0M5UqDR1dwCR6hceMlg2OOXNVxNRSAaZiGia7a9QS9Xfp5F4OhznD5ZwX0iMWMXDjzFiTrFUS3XosZqEhB22C8xIpgLW9UY/aFZI9gv0Hcq69n+S6uvkC28BZNUB+LbPD+Sgbtp+JTOOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuHyV48c; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuHyV48c"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so4792565e87.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760358600; x=1760963400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
        b=WuHyV48cutS3BFuIeIUDZMPcLa6tMnyBbtcxK3rif3mfMAQ8/KPy23tjOczWdZwsOA
         pM7W7HYN7Is3DwRnSLIdWGYpbyL6yYwOoSTyHH4ty5cMcpkR4O3R1fFSfhY6ProapXL0
         c0YnntQczYeTnH6jS3oG4RUimeMHmcLW2HbYOmM9HXqNY5fSv+DmH12+vmzJ62E+/4uJ
         QPPGCDpNAZ2BHfBnyyqq4XppsF6skzr0cUoZzM2Nh0iQGnu0TVH5rhnO3S9kT9E+gKw/
         NExo/fyCqnnOezgrh+c0EREEKaZtYThXFgCuHGwnx6DciKiin7I7JfuFwJpXjUOGxFuU
         ZKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358600; x=1760963400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
        b=Ut78OsEEGUVpwuAopFyRJm83yv6a72PNA5Zpo0k2X9RKToV7dmeDLkgMrYZjUef5Cl
         TrQgvZe4XS7ED8m9lGm56vDSzYkQG9cMAmac0H3HnkDhpObdwDQL4IVH2dh5nkJB3Iij
         UFWQzqfxqycR95xxddLZUoblpJzZTStrHwZR+53m5XKk6m4jDY4fllkCOVosFMLZ0QQK
         B+P/46jmHjLKgGbELyDxK10bAmBNOLfoBmwfmWdTcGOsjGMUjDThizkTeZpPSAozeN0q
         xL5/mSP3DdG8LdxJMnIdPV26fbAF0iJv/4BgaFVsRwlmrLTQalnid6QbKkFxTEChANkY
         dhXA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Kt7Pmyt8lI73QcO2dJU2G6THvy75dWcUDfNCLAXR8OZwdMPPRRGxOOErBZFQ835/3Dmu3zi0KSi9gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2fHOSaZfz3LkuHHerrX5BCD/gYYhpRmr96zkiy97N2vbXq2F
	rz7j0PF9k1M5kbOyhBVSR/ot3nGo4942PbjmfAbPiOOg561p+a3HlhlUzS3AdtblUNqZzGscoZ9
	748gckR0ZO12GHz/3ukVRW/lIufiBwMso+b1e3hhpjA==
X-Gm-Gg: ASbGncviavEjiZ5MNYS1Vr6CoJiKg3aUgwmHGCbBrFitdlF4uqnFBwCj2DG9NT006CJ
	fklnvenz2P8MS9e+f6U54JQHE5UpdY6M1hnWKIYiWJJ7W7dgnsssFgcKOqMo536H41NFkfbiprQ
	XOdR5JU3mQTArvNBYA8xNE+UrN2Q18BgAUku0zFsh/PONV0tQWdaQ+AstK4UIUFwCk8eOf5mSFy
	YO0sY6gFU6SZTfpwEBAYXMQ8yXHpveGtMIaq7PR
X-Google-Smtp-Source: AGHT+IHDziq/3pEjSE34Vb9xc10xnYDJuQK7aFT0KnwS0eJY8GRc+vGU1CYOsUeevL8U5VlYG6e//6jV5rAnbmRrIB8=
X-Received: by 2002:a2e:bd0d:0:b0:336:5d33:c394 with SMTP id
 38308e7fff4ca-37609ea5185mr56779601fa.33.1760358599989; Mon, 13 Oct 2025
 05:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org> <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:29:48 +0200
X-Gm-Features: AS18NWAyQHOstCpKlOfzZTMdQhypcq3gyuY9Qq5Lmp_pCYAjRMed25BVKMqEClM
Message-ID: <CACRpkdapDastXAED4YhKAXQ9byvMH6SHqt3zHHniGRJzuXhDRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 4:03=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:

> Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
> to be compatible with sm6115 LPASS pinctrl.
>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

This patch 1/4 applied to the pinctrl tree,
please funnel the rest through the SoC tree.

Yours,
Linus Walleij
