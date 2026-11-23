Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421014;
	b=1VIbDkGSYM1sNM/V9cMbTNAbRYHeUkfC6u/LKGjOIM2LP0U/EsTb7Yn0CfpWLV4UJIul
	 0sd9gQqiB3Vz9XLAulyvQi3uWwbngBPVB8CDaTaSGva11Wk/njSV8NZaaJXbdZ+KzRzHa
	 s+9XUp85CZs//1bCQuqDUuiEikvg6fS9LF0raorJ3SwyYRq/HKHgX6S6LuquvfIes5iMp
	 gD5WMq1bQmtGeRihVW4iwCUlGnnxkwrdLA8eEUCXvuDMpxo/vzITfiyFvHEWnSAoFX2SK
	 TrLRzChGQNMn3hlI2vFfOJf3Hw683lNz3pdXdhQ8Tq3eApqALQqlOyYjibhZdABWnWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421014;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=klX76+Q6uZaH63AEzTJiUzNSYX1Zp5/p9hz4/WqOmCY=;
	b=dFJ3F5U8szxfHaHWeZMZdXmqQrWv4eatk1SRbKF22aV3kMrVTDF8ddJXaVbHi3rHFPDt
	 Wy4aWlX1LvImwNk4voMhqKZzslF62YCF+dZVA6Grp+KS+Odt/lQOT7U/s396p+6OtCxFK
	 hdbTPAt46JzQvgXQcvJvaXRRWY+SyS5rjD9Z8GNomeiW1D8V0mL9L6If+9fFOY97evpZz
	 5qkvgiikfigw9P7CGA2Cur0xth2nrXqKAB9U63RhwzJfe3ZKFqEXxa5Ilsot0+6+N7J32
	 WC7XpzDFPL4OpmU632An4SRLLI+nLuKX/ftpX0B11eXpqWHVrOjvg/sbaYNs9NIzIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WnDAFCwJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7F606D16E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WnDAFCwJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB441F000E1;
	Mon, 23 Nov 2026 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421014;
	bh=klX76+Q6uZaH63AEzTJiUzNSYX1Zp5/p9hz4/WqOmCY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WnDAFCwJX+TtOOcOlN90qUfdGPuotLkgEoJhUMOQgWGG5Rm0uuL2Nw0FgQLm7ZKB5
	 6Zi2koAsmkrAnuy/QQnEFD7hv4t+ZfI4AwCc9HrxaUIiBAM0kKcVN+IvcJ1DjxxDQk
	 obdof4EVwwVYa1AVZc+ASi8LkbpQ0ct30T4e2a6XENq5ojmwcW6KD8b1Qxlqoyrzhi
	 TMm95UPq/3MHlhOerqEL8f4erBcaJ3cpcFHiLFad79AnFkNh4a7Gd1a6gAXmt0gZmG
	 feC32AUGURLL/u+hPGTcQkHzCPfHi2CRbtvi4ZR6JTatOIG8/kAjLt8JDXfksIOnGu
	 QF4FZT2Uk5Elg==
Message-ID: <sashiko-outbox-228873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] soundwire: qcom: Disable runtime PM and avoid
 clock underflow in qcom_swrm_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261123075522.405347-8-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
 <20261123075522.405347-8-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 08:03:34 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] soundwire: qcom: missing Fixes trailer for qcom_swrm_remove() PM
  fix
--

commit 8d900f88422c31c5a9cfaf034a20312a41dc8d0e
Author: Lee Jones <lee@kernel.org>

> soundwire: qcom: Disable runtime PM and avoid clock underflow in qcom_swr=
m_remove()
>
> When the controller is runtime-suspended, swrm_runtime_suspend() has
> already disabled ctrl->hclk.  If the device is unbound in that state,
> qcom_swrm_remove() omits pm_runtime_disable() and unconditionally calls
> clk_disable_unprepare(), triggering a clock enable count underflow and
> leaving runtime PM enabled.
>
> Resume the device before removing the bus master, disable runtime PM,
> and only disable ctrl->hclk if the device is not runtime-suspended.
>
> Closes: https://sashiko.dev/#/bug/linux-e26e04cd-3dec-4a3d-94e6-f45403c4b=
b57
> Signed-off-by: Lee Jones <lee@kernel.org>

[Severity: Low]
This fixes the runtime PM and clock imbalance introduced when runtime PM
support was added.  Should this include:

  Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123075522.4053=
47-1-lee@kernel.org?part=3D7
