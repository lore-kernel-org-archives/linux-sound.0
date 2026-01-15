Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226B9339A8;
	Thu, 15 Jan 2026 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483019; cv=none; b=IjZhIa1WfsZo07keqeg1XJoPOjVux1OGipbdoCMDEMSVDvn56J94pMrdwXeWoJ6reZvVXZXd4QqgolLw+slOLUP4Q1cmUZaSGTiDQT9gBl3VnXHYz/HdVfPCoEE9lvuh/uesKTdiTgoLWjgecyiofZfjU6llbFffAqie+Q+oQco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483019; c=relaxed/simple;
	bh=NEHndrv/GFLkXIcpeLx+QdTY9TQn1VHLAJq60OQCti0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yh7lsAfwDwf03ublFqos8TgF9AuMRb62WjluwbPsvsWlE8CsuOfHyjjVV7VIoW6/qe66C+EIJSxt3bBMai0I5eisGzOMw7xbLa7zLQJD6O8qi7LkT6QfiDzI2lTnjD70kRBBF6xX2OIcs9szV4HhD0bdHCUY/82LluljOTOlye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTNrOMeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTNrOMeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0634BC116D0;
	Thu, 15 Jan 2026 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483018;
	bh=NEHndrv/GFLkXIcpeLx+QdTY9TQn1VHLAJq60OQCti0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NTNrOMeDrEwZPo0YuwydGexojvyGkalxYJsGJuevjCwnIuZyq7chxL69MRA1sxONM
	 iqkmkPjX1P5gPB8knUCiRkNirOCBmtiZuFWKQdVreqOcZrncGESC9hY5gzUT0BDF9Y
	 OJ70HjfDAtGrcOu4tXbtxCgV+j0Im8Rsnr0VgPAJypz+dzEOk+MIax888XnRWFKhl1
	 6ub7q9aDNDNJD2DEvH6O5j7AfkvKGt7m7qKjfmTwRMnbzGMFBR7HMvFoJVCbrNJ6bo
	 41TmKxXa3Q+stIjrAo4N+YevgIs3h/eeR62Rj9KqUDGoZnWI5jJhTNQTbNhrosIC8g
	 W08/SSRR5Yshw==
From: Pratyush Yadav <pratyush@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  lgirdwood@gmail.com,  broonie@kernel.org,  matthias.bgg@gmail.com,
  julien.massot@collabora.com,  eugen.hristev@linaro.org,
  jiaxin.yu@mediatek.com,  shane.chien@mediatek.com,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond
 W25Q(32/64/128/256)JWM
In-Reply-To: <20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
	(AngeloGioacchino Del Regno's message of "Thu, 15 Jan 2026 13:56:21
	+0100")
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
	<20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
Date: Thu, 15 Jan 2026 13:16:53 +0000
Message-ID: <2vxz5x93818a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jan 15 2026, AngeloGioacchino Del Regno wrote:

> Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
> allowed compatible strings pattern.
>
> This also resolves a dtbs_check warning happening on all of the
> MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).

We normally don't allow adding any more device-specific compatibles.
This list here is only for legacy DTS. You should be using
"jedec,spi-nor" in your device trees.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 587af4968255..2db446c9ca9b 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -29,7 +29,7 @@ properties:
>                (sst,)?sst26wf016b|\
>                (sst,)?sst25wf(040b|080)|\
>                winbond,w25x(80|32)|\
> -              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
> +              (winbond,)?w25q(16|32(w|dw)?|64(dw|jwm)?|80bl|128(fw|jwm)?|256(jwm)?))$"
>            - const: jedec,spi-nor
>        - items:
>            - enum:

-- 
Regards,
Pratyush Yadav
