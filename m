Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437079;
	b=AR3CkdTlY+44MM9rgVIOzbpDe58cApK+UqClR6PREpongjNDGmdh+QTHJLWnbR3g0SHs
	 3ho49tfQ39QoTpnc8KfutxOrEuF6r8W+Dg1q2RYou6Zf2Bkc6lMj+xT9DQTkhDrYUu7Ac
	 K/2NoC3oCkvEDf7ZPK+d2eKZcy7Q76oXWW8InwFyJpMo44Q1v2l53Cfh2ek5P6Vmp42Sf
	 dLxuoxyR+z7fd3DAbv1sAmKHFcqnfqk828LKhoUSGCoPWxGYuPKSIX64qB6o+vmE1O7sE
	 VmzjlnkaoxQKEOMzpU4z+CYpkypjqNv7rQXeQki/mF0byOcIXJecOd55PXANpY3mTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437079;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M6/He9409einv4IK55xx4mOoh+j4kLKZxB66AzKY4A4=;
	b=1SLbs+woKGH5Gahnz4kN9TEIJujYWtwwZNmPg+TZMj3r79RYRgEUfitwzO1k7B6xawhU
	 NCCYwOh3CxfdlccdLA80Cz1aTDygC0aPa73jUnw2HU27mwKX7Cs1RVyEGESlPDZMoCWbv
	 OKt/6oaJ4JgA/nN1kRIeBOsOiHifjj6fSpVQyI8Hnpldbj5JB0+eMZNGoWccGLZfMo5ob
	 fU1LBE7fJEKAAAaudlLC+tmDyJgThUoU92pIJkHqjtluLynWma35iYwL9NWZOJQCfB2Vt
	 GfHD+HW8x51cWDnemKTQU9VffNiUdCtZOS3AKkFfkcEk6N7ZCz0zpZi3QB3qpNwQrqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQb+tsG2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2E606A31E;
	Mon, 23 Nov 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQb+tsG2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A271F000C0;
	Mon, 23 Nov 2026 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437078;
	bh=M6/He9409einv4IK55xx4mOoh+j4kLKZxB66AzKY4A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EQb+tsG2NY1n6o8xDV2FMj35QLRB3lR6YIqQmaKUk4cf/kfDU0erGRclEbGTpqllU
	 FRieTR6rlPYtz0JIt886MLZ/eTGXN4cGgTm4IuOY++ESX/jkCooY5DmtzO5Y+SLcXU
	 oGqHbVwN+xlrLdba8qJcvryClwlSCsZwNY7c3bfbF0JMExGBkZIsJm9eqWMNMAiPhB
	 Y8w9Sxnpdy26vaGiEgH9At/NNThXJyqfxaYkihebHN48JKp48UQdOs+yeeZIIyev+1
	 DXMW734XQrJcmnK322a0jTwnC9TwqjCrLKmkmqgP4H8asLjphPJlVW/sJ9xhAhvWA4
	 v2NNY409X3baQ==
Date: Mon, 23 Nov 2026 13:31:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: sound: qcom,sm8250: add
 talos-lyra-sndcard compatible
Message-ID: <20261123-funky-divergent-ibis-da0def@quoll>
References: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
 <20261117110848.465407-4-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117110848.465407-4-karthik.s@oss.qualcomm.com>

On Tue, Nov 17, 2026 at 04:38:48PM +0530, Karthik S wrote:
> Add the qcom,talos-lyra-sndcard compatible string to the
> qcom,sm8250 sound bindings.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46


Best regards,
Krzysztof

