Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E513A2E2B;
	Mon, 24 Aug 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560760; cv=none; b=AHH+dZ4/17RNgsC7JzijTZnrmUHD9unQbdzBc/P90jMykTOCwqOd5jyD0V+Wu+pyiWMBkbU+KIncwPJX944ZPCeg9bmuPmu5lJVH5dovPs1Wul4LiQrlMYJl35KhNiYDBOz685CFWMbBlrdx4RmlPnMS/wtWAmxAov0CG5jXVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560760; c=relaxed/simple;
	bh=7x2KoX352xmAivhWxz/YgvhdxwVhHT5CbhGYO5W71AQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sfNZDzA88Xmm6u36mKaTJK077S0SWhY9mBrxmqaJPEiJ7GR/HT8/4vxw28ONduv7xjXvYtPHLuOdB7FrQCp/kNwhbL0XSPcDfG7iC2O/d78+4JLsmSmhibne1L0DbsjGF5HdvwOTMfqQ7auLHB6ZVpo+DZB9H4MeRaucXyTlY/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HVtZPJjP; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HVtZPJjP"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hT48L0C7xz8tW5;
	Mon, 24 Aug 2026 10:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787560754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9WmlZTx74FIGjf3KBcP8hN8ekHorq2lgLDcljVhMHg=;
	b=HVtZPJjPeUjW2Y1r0Ws4J6fO0DPAZNWSZxX6glmCm+HaBzbXcLX7NARB8VAvuH5EnG2SmD
	B/WIWQCtS4IzRSItt8Sz07BlLoLPTUFmQxAnKHjai9KNQ4FvwC7bs5Q94rPTixMt4ij0JK
	QjYMNI4PlK+pMSuIkmJ+UqZf88uP+HW5kp1jekS2wto2q72eZfIPszJ37jkHHD16dFqgdq
	f88B5rVxa/MlJ2UT1Ex0RImtkVYiszMR5WzyvHZtp+dG6O7yXzDnE6kZwGkgHKPer/I9fA
	7efGRPGvA8mNcwLMYwD9EM4t3FrbVyKYU8yOegHYRnIafrHyEZ/6dX7CNdA8tA==
Message-ID: <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>, Srinivas Kandagatla
	 <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela	 <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prasad Kumpatla
 <prasad.kumpatla@oss.qualcomm.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Sarath Ganapathiraju
 <sarath.ganapathiraju@oss.qualcomm.com>,  Kumar Anurag Singh
 <kumar.singh@oss.qualcomm.com>, Mohammad Rafi Shaik
 <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:39:05 +0200
In-Reply-To: <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
	 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 9dgi6kpsjcht7h5tjwcf539qokuokesq
X-MBO-RS-ID: f7a8a92c772b343e308

Hi

On Mon, 2026-08-24 at 12:06 +0530, Harendra Gautam wrote:
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
>=20
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
>=20
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
> =C2=A0.../bindings/sound/qcom,qaif-cpu.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 307 ++++++++++++++++++
> =C2=A0include/dt-bindings/sound/qcom,qaif.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 97 ++++++
> =C2=A02 files changed, 404 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/sound/qcom,qai=
f-cpu.yaml
> =C2=A0create mode 100644 include/dt-bindings/sound/qcom,qaif.h
>=20
> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b=
/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> new file mode 100644
> index 000000000000..134356114733
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> @@ -0,0 +1,307 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

Both of the links redirect to https://www.devicetree.org/

>=20
> ...
>=20
> diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-bindings/=
sound/qcom,qaif.h
> new file mode 100644
> index 000000000000..24706efd07d1
> --- /dev/null
> +++ b/include/dt-bindings/sound/qcom,qaif.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
> + * QAIF_MI2S_AIF* and QAIF_TDM_AIF* values are used in sound-dai
> + * references and as the reg value of aif@N child nodes.
> + * QAIF_CDC_DMA_* values are for sound-dai references only and must
> + * not be used as aif@N child node reg values.
> + */
> +#ifndef __DT_QCOM_QAIF_H
> +#define __DT_QCOM_QAIF_H
> +
> +/*
> + * MI2S DAI IDs -- one per physical AIF port in MI2S mode.
> + * Each port supports up to 2 channels (stereo I2S) over a single
> + * data lane sharing a bit clock and frame sync.
> + */
> +#define QAIF_MI2S_AIF0		200
> +#define QAIF_MI2S_AIF1		201
> +#define QAIF_MI2S_AIF2		202
> +#define QAIF_MI2S_AIF3		203
> +#define QAIF_MI2S_AIF4		204
> +#define QAIF_MI2S_AIF5		205
> +#define QAIF_MI2S_AIF6		206
> +#define QAIF_MI2S_AIF7		207
> +#define QAIF_MI2S_AIF8		208
> +#define QAIF_MI2S_AIF9		209
> +#define QAIF_MI2S_AIF10		210
> +#define QAIF_MI2S_AIF11		211
> +#define QAIF_MI2S_AIF12		212
> +
> +/*
> + * TDM DAI IDs -- one per physical AIF port in TDM mode.

Is this sentence complete?

> + * Each port supports up to 8 channels over up to 8 independent data
> + * lanes sharing a single bit clock and frame sync.
> + */
>=20
> ...

Thanks
 Manuel
