Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06D15C13F;
	Wed, 11 Sep 2024 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726066255; cv=none; b=hb8TlzBKoezUrELQkrlTYUCG9DyrxbzJWFTlCS7uMR5+C+0YBTcFnLahI8kHWJoj5fL4aqL+XMP/vYGK7ImSVyMS/uoUV9f8IWxw1RvZJs08h4HKEEoWVynpw3jnvfBLl3sUJ6f1Zi5UBGWWRFb7r1JnxQK3Jz4SX5ffXF87lfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726066255; c=relaxed/simple;
	bh=xJGwEM8YdZSxNYttVYLxVUocEygY6JMFJPPwCIRo8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crqPb0EFD3pck2fpQMaY25vBen85sAifxF2Xma33S/wCH8cTutYJgaldwWJ9FQuJySlSYL+PckBjsVQPLDNEKq6aI3zVA4xz/Sr+wnkiKiM6aoAB9XTjqo7+IHg0JoitgoEBk5zHqKZNzs016ge3yXJh5H4D8dRHCeeLnmZdpyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEpM6Mpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEpM6Mpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03406C4CEC0;
	Wed, 11 Sep 2024 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066255;
	bh=xJGwEM8YdZSxNYttVYLxVUocEygY6JMFJPPwCIRo8DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEpM6Mpwr4cju+H4p1MJKbRpXjj2puIuuNAo4TVcg73PaInpxIfH7sWewcyZ5HY9C
	 Dv8pQajLgmlz5gOouiSqBb5UjJlwTYWbPry4Aut1MCI5NmnDSS1YU7l4mqTccYjUtb
	 UWaq28WJebHaJkUtFUp+5Yo9vh94hS6ryKKIz4nSj0EuRu4kibwjxCUbAMZImd8KkC
	 FD8j0KxpDwEq8Wj6Ua5kUsxWcefkdu/I5tMsVPToJoPwTQhjnubH0pTFtqQxL6kEw0
	 Y2tfgZ7ulY1UWskVyshEn72d5KRrTLhUVBCXWyvAeDgBSmGM2W2x2zqaWrwkOf9lMX
	 l18ZaLm+tlHRQ==
Date: Wed, 11 Sep 2024 09:50:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	claudiu.beznea@tuxon.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, nicolas.ferre@microchip.com,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, broonie@kernel.org,
	codrin.ciubotariu@microchip.com
Subject: Re: [PATCH] ASoC: dt-bindings: microchip,sama7g5-spdifrx: Add common
 DAI reference
Message-ID: <172606625336.165976.15010375858914287805.robh@kernel.org>
References: <20240910082202.45972-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910082202.45972-1-andrei.simion@microchip.com>


On Tue, 10 Sep 2024 11:22:03 +0300, Andrei Simion wrote:
> Update the spdifrx yaml file to reference the dai-common.yaml schema,
> enabling the use of the 'sound-name-prefix' property
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  .../devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

