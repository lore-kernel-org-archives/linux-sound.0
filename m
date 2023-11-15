Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3879C54FB9
	for <linux-sound@archiver.kernel.org>; Wed, 15 Nov 2023 14:44:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344420AbjKOOoN (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 15 Nov 2023 09:44:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344422AbjKOOn5 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 15 Nov 2023 09:43:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4E72D64
        for <linux-sound@vger.kernel.org>; Wed, 15 Nov 2023 06:42:16 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C35C433C9;
        Wed, 15 Nov 2023 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700059335;
        bh=/VnhW6XNAlYbmraAXUOBLMr1ny5iRNfsObxNKJlK2PM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cfnklic2zj6BLXDMDv5AHq11ZtFjt6/Y4W3IXz3fhfAyvXj/Cyr6LQ7XKQ6BqhV42
         QnbLjD4Fo+QNU3qurTgV/2JhzKISXC/eaUZb3ZameW1sC+VgCweeXblVr4KZO9WzPq
         nh8z2U5b6W2a8zCYCMVK3iYdqV813Du8dgC35b/AoPtLxFuAzUAA2fxER3Q/VDg0o4
         C3IBNvhYj3JZwnsEtuU8jVF+MaJzw3a+CRi+VhcaT2jBYKl/emWQZNtjm9ncFR8wb1
         bCCfDXmQK0vZFd6BW3YFXoU9oZgLvwK6Yo6Fbx+OH1FGAM/VxskLK93lpZAlQ8rdrF
         7Rp6YLtlk7pfQ==
Date:   Wed, 15 Nov 2023 14:42:11 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        angelogioacchino.delregno@collabora.com, perex@perex.cz,
        allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326
 support
Message-ID: <20231115-amount-unashamed-ba70aa85b6a9@squawk>
References: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
 <20231115090903.578438-2-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q1LKci4Ma36W9hfw"
Content-Disposition: inline
In-Reply-To: <20231115090903.578438-2-zhourui@huaqin.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org


--q1LKci4Ma36W9hfw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 05:09:01PM +0800, Rui Zhou wrote:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Please pick up =E3=81=B1cks from previous submissions:
https://lore.kernel.org/all/20231108-handmade-cadmium-97ff07964b02@spud/

Cheers,
Conor.

> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt63=
59.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> index 4c8c95057ef7..f94ad0715e32 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - mediatek,mt8188-es8326
>        - mediatek,mt8188-mt6359-evb
>        - mediatek,mt8188-nau8825
>        - mediatek,mt8188-rt5682s
> --=20
> 2.25.1
>=20

--q1LKci4Ma36W9hfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVTYvwAKCRB4tDGHoIJi
0utUAP9yU8NM6xdQfcRRp17w+Sf3IPjMeqQeliXk2oT/VoqF9gD8CrphaoCuTs39
/rOAA0Rl1hqA1krQauB6VANmeuAEgQo=
=FyXQ
-----END PGP SIGNATURE-----

--q1LKci4Ma36W9hfw--
