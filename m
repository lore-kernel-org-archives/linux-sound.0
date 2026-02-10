Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A61327218
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730928; cv=none; b=TBTWVmQUTOF0HuULnTND8kxsbxNhd6814L2NadLwUoldhsRINHW82ljeBw15cP5/wJgYRcy1dH1cLNIXU/PmqSSDNalQ9sSq44r2z0EqzABrtLku8y0CM8ZhId1gHIfTnYX6BYk3aVepYY+855+5ZzEozBUJYW3mZGZIeTQrq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730928; c=relaxed/simple;
	bh=KvCWqb2hqYTj26lrrDonWv4/5HcZhD/EcQOLJLovuUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrG0jyOQ+HU/X8J1eumV4A/5iFUmAZ+cQEttbHBipy5WNNMNndApB4epC/+Hslou18gMvCHBGp1fXDGElIVAORfEVv7KDQYvGwGWLiX/0kn+DnejoIAZcjAQZw+f0ZjjZ/Qe/LIbsTt/1V7QJwdD+a7EyUQugM2egjh4E1Eiqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myUYicc/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myUYicc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B73C116C6
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730928;
	bh=KvCWqb2hqYTj26lrrDonWv4/5HcZhD/EcQOLJLovuUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=myUYicc/p3YYVczXMTgj6o6RxiHJ52msY1URNyD2WD8dKWIH+8EzynRC2t7e2pr5x
	 PeannzEm9qLGMN9F8WpoxokzBDYaV7JYTqXWPIcDWj42wEUCsh5f3gFly6h0BZ5rIx
	 7H8YlRHQbwVh84EH4nL9i1b18mPZruFQSFxlr0oVOpLqiXy3oUlrgzYbyZR3URHtvE
	 bvlBG2EfS6PLcQfdhuf1z2c9P6cVRoJS5XdH6opU8WNtH6u9lZD257uUVfJ4uCb+yx
	 6MsLCjmizr37jWfMrnrArF/xw9P1KS1bR42QKRWu6O/HqvFAJ+eYcb0XrwXPZQhRJT
	 oGwEpwq+8im5w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so1130093a12.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 05:42:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+E64o5rsKoRwOxbq2s0K23BxplpE267J9Tk9OP7naHTuCc3twe/slUsqaZtMEOqhmKAChpYtgQ6UxSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweBBurA5LcOBeBNnGn8RbCZGpytjbPfvdVbBM4HRh1Yt++tWoI
	1Yz3104OAYmrk1VOIVNbqQIUTc2PFJTxVFAalrM2g0mATe1GOtUhzBAiYu5RUKQcP9hy4XMteCs
	IhUoCiSh5C1slvQD0jgHCBWqUIooX3w==
X-Received: by 2002:a50:c8c6:0:b0:65a:2903:3164 with SMTP id
 4fb4d7f45d1cf-65a2903460fmr254675a12.30.1770730926783; Tue, 10 Feb 2026
 05:42:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com> <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Feb 2026 07:41:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
X-Gm-Features: AZwV_QhEv7cl8ZxKnJCe5nmdFpEiI7-_VBEnnhT0PzMh2ys-GVQbQoUyTL66giA
Message-ID: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org, 
	matthias.bgg@gmail.com, julien.massot@collabora.com, eugen.hristev@linaro.org, 
	jiaxin.yu@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 6:56=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for the mediatek,mt8192-audsys compatible, which uses
> a different audio controller (mt8192-afe-pcm) compared to mt8183
> and mt2701.
>
> This resolves a dtbs_check warning on all MT8192 devicetrees.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,auds=
ys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.ya=
ml
> index f3a761cbd0fd..09a6c16e7e82 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> @@ -48,19 +48,39 @@ required:
>    - compatible
>    - '#clock-cells'
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: mediatek,mt8183-audiosys
> -then:
> -  properties:
> -    audio-controller:
> -      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
> -else:
> -  properties:
> -    audio-controller:
> -      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +allOf:
> + - if:

Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
[warning] wrong indentation: expected 2 but found 1 (indentation)


> +     properties:
> +       compatible:
> +         contains:
> +           enum:
> +             - mediatek,mt2701-audsys
> +             - mediatek,mt7622-audsys
> +   then:
> +     properties:
> +       audio-controller:
> +         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +
> + - if:
> +     properties:
> +       compatible:
> +         contains:
> +           const: mediatek,mt8183-audiosys
> +   then:
> +     properties:
> +       audio-controller:
> +         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
> +
> + - if:
> +     properties:
> +       compatible:
> +         contains:
> +           const: mediatek,mt8192-audsys
> +   then:
> +     properties:
> +       audio-controller:
> +         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
> +
>

Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
[warning] too many blank lines (2 > 1) (empty-lines)

Please fix as these are warnings in linux-next now.


>  additionalProperties: false
>
> --
> 2.52.0
>
