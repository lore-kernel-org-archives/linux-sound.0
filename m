Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E732727FC;
	Fri, 16 Jan 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576173; cv=none; b=TblkZmzPIKqWQe//l6vuzEmdosCBosRB+l9x/8/lJkZZqJr8akNJmzYEg3r6xSCKuLb75RWoZgZUDtAzB4DyKufuozG8D97LdOiTtiAG4HSL4KmoXbyoAmq7Sm9H9+hrL16UN2q19pFKBofTjZpD09Ph5i+3uwdqu1HUr/NxAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576173; c=relaxed/simple;
	bh=JaycEg4pEUBARbXys6lFHpvRjjDORrRS0xEzYaJP3/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8avZNaRwDdZqzxPw/8ETlvU2W0tI8dxUK5aXUKvoCZKptyzUAFAd42EXF2WwarbNvfsDSimK5G8GR/x2pE8BOgTGDo0gsI/S44VsQatm5W3n92dmVEMi2C9Eq7ywyG7B2TBCg+0Z7L45lDuMT8CN1uK6CC7ttJQQXANN1LIDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bn+ZQ6/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bn+ZQ6/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0FEC116C6;
	Fri, 16 Jan 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576172;
	bh=JaycEg4pEUBARbXys6lFHpvRjjDORrRS0xEzYaJP3/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bn+ZQ6/SjS86BFNGVsh5LR0MQLdrS94iE39QOjb8kNzERTkYjbHv6uGJLIsNx+PfL
	 rXlgG7UuzYjU27UX54GD5i3ds5Z+2atDjusGzKgzSP8qQEX8KBXfQuX3CX6DpmTlnS
	 g/IQkQkW95qkVfg47/rW3JsrsPUhOOYWAlttYchuZB8m0oS8Exg0rauZNUBBU4305n
	 fWB1gZpgNG9OTrDs8R6mytg+qRr1rYV1SZpvgOA3yxwLZIod+CxyoofLCz0nbprUsS
	 d9PBqrLA2tf/5kGh7yhTelwbDv/NHyvPA2mSf5wORTjh9LnrTYskk/iap3ZFjwGt2j
	 IAQV5jNV3sksA==
Date: Fri, 16 Jan 2026 09:09:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: julien.massot@collabora.com, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
	miquel.raynal@bootlin.com, linux-mediatek@lists.infradead.org,
	conor+dt@kernel.org, vigneshr@ti.com, eugen.hristev@linaro.org,
	richard@nod.at, pratyush@kernel.org, lgirdwood@gmail.com,
	mwalle@kernel.org, jiaxin.yu@mediatek.com, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, shane.chien@mediatek.com
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
Message-ID: <176857617091.1608125.5751888135752689568.robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>


On Thu, 15 Jan 2026 13:56:22 +0100, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
>  1 file changed, 162 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

