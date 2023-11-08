Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF0BC4332F
	for <linux-sound@archiver.kernel.org>; Wed,  8 Nov 2023 11:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjKHL7d (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 8 Nov 2023 06:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHL7c (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Wed, 8 Nov 2023 06:59:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4296198D
        for <linux-sound@vger.kernel.org>; Wed,  8 Nov 2023 03:59:30 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB844C433C7;
        Wed,  8 Nov 2023 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699444770;
        bh=Jzja2Mof+0lWXfDb3XZKXq4BgHFCEL/naHNS+9btNP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qN5lN1xKgL4IpT2EWusIzs8ZoTg1UcYPMiF+sRcSwvPSaqyeaUbC82Km/Ivo+Ns6B
         SxNhhVj0mQCznMaxhqw2P8E8iDBqLNE1+kJcKww9ZhEPrTYUGmOwLleaczTAAyRS8d
         26uVaoBaCu7Of66Il5I9EUsJgiDk0JTzCfiUdMjpgezJqBoz/UWyHq432xYzZaNmNv
         kItVqnUd+iZMv9f1tK1y1c8295/Ej0IugQK4s7WI0Cu6hU2Oz+VGMXvDi5txNNpQWh
         M7MtuY2fDW6dhOeWtmXXevTzpldTIsJEBmnaPPhww88aYNnTfJmJzxowRFFONAJ4vC
         tFIm2O0NRGZSA==
Date:   Wed, 8 Nov 2023 11:59:25 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        angelogioacchino.delregno@collabora.com, perex@perex.cz,
        allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326
 support
Message-ID: <20231108-handmade-cadmium-97ff07964b02@spud>
References: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
 <20231108063804.592982-2-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ejeS/PQkh0Imy/GQ"
Content-Disposition: inline
In-Reply-To: <20231108063804.592982-2-zhourui@huaqin.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org


--ejeS/PQkh0Imy/GQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 02:38:02PM +0800, Rui Zhou wrote:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
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

--ejeS/PQkh0Imy/GQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUt4HQAKCRB4tDGHoIJi
0tMzAPsHYjHmomKvHzqtYD1sWEE03FkRfLcrqfov3QX91OzexgEA3EVHfj94YdjM
3HOe9QqxmDEmXT0StDd11t60U+8yXQM=
=IDsU
-----END PGP SIGNATURE-----

--ejeS/PQkh0Imy/GQ--
