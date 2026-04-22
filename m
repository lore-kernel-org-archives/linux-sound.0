Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C319004A;
	Wed, 22 Apr 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842375; cv=none; b=hbsTpDY4GmNQmIte9lJgKvT649kOvVkTAxdDxMjNZjKfn4uIkhq1Vgs1TIaoNjy8iYRVLz/VBE17it7+Uu7070vI5ykCsHNXPZtwJoWpB6pMdSbjQrFfzggfzWdNqMDNGVhiCFoAR3fmFArCyNH/F8VM9llpgd3xKAa3aRs7hrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842375; c=relaxed/simple;
	bh=/rjpCv9AgVY957+ryIyB1yaYB3gcSX8IyGz/PAx64+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBePNYEaNd2b+Y4STBo+zVR8vLtKG0LnlXU+CDbR855L1ho4NVBO3jcJ66/j2nDFOIjGTdawN2T65QqZKerx71lUHP4+sLyG4Z73vuIvr47zxkqAB569L7rV0JsBHpl4+Rb4E5UPQCRx3uV3msFhE+g9r23jk1oMcQslQg1h2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENlxW5s+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENlxW5s+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B496AC19425;
	Wed, 22 Apr 2026 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776842375;
	bh=/rjpCv9AgVY957+ryIyB1yaYB3gcSX8IyGz/PAx64+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENlxW5s+Rrvgh6mt0d5lvBLzYM8Vsg50sVcQIi+KGwoNvmmEkoG8NYs7rU/vomaEY
	 /eaqUkEDRNTVVv6a6s05GDmOEAneIdUa8c7szDyXfW1tmLbMjn9RveSRysrAP+LC8l
	 miVvw76jcgobzS8OIc+6oV9wpmR7JhQ2Kj716Xysfdw9YJFsyUkXQkNLPXyAUGXKqQ
	 MbS05SxsV914xCOAXVPq5NxaV2VEVu4WjlFyEsbv98erkMxrGuOc8fEresi4iDmLHm
	 KjHjUPMMVluPVnMADnC1tNDtT/dX0PbJXSEI9kkajXA0Qr6CyE2DecTsZS0gsQRGoE
	 r9ZG63mLh/Zpw==
Date: Wed, 22 Apr 2026 09:19:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <20260422-capable-ambrosial-otter-ddd6e0@quoll>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <69f0b69e49068695db4ba6164c0757ccdf9786fd.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69f0b69e49068695db4ba6164c0757ccdf9786fd.1776646435.git.daniel@makrotopia.org>

On Mon, Apr 20, 2026 at 02:13:05AM +0100, Daniel Golle wrote:
>    clock-names:
> +    minItems: 34
>      items:
>        - const: infra_sys_audio_clk
>        - const: top_audio_mux1_sel
> @@ -104,6 +110,10 @@ properties:
>        - const: audio_a1sys_pd
>        - const: audio_a2sys_pd
>        - const: audio_mrgif_pd
> +      - const: hadds2pll_294m
> +      - const: audio_hdmi_pd
> +      - const: audio_spdf_pd
> +      - const: audio_apll_pd
>  
>  required:
>    - compatible
> @@ -114,3 +124,16 @@ required:
>    - clock-names
>  
>  additionalProperties: false
> +
> +allOf:

allOf goes before additionalProperties

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

