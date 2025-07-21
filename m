Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD335953;
	Mon, 21 Jul 2025 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753058357; cv=none; b=X5aWvb+e4unpn5+pvpBZc5I0sexSOpGg0VfboCliIA7hXhD3YTO3EXKoO/z3H4SVE0h5Ml/QNvpJZbKsECx6gKOKQjSLywGnn+LJUnA7jqejiZxdocwnhfpAlDcPp6GZh2bbzzsdNp2QjMmEYIOrk4OesVvbVF0SC8N2SktdurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753058357; c=relaxed/simple;
	bh=M2vU9lJoVwY75/DryyDetZUbzsrTVQwp7tOnAefTts4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1pDnwQAOdp7nw70D+c92p6EY8iyvbfR74dMDktgjeNT7YV/as1evLPa9DGXbgZ9XYa9WkO9khAoY+aPcyjF6fnKLJJotsywQ06+WqeMxvuIkps+auOqh6L+dzDyjuNgx9Yz+bu30U45tYLz5PBN29lVnhJwRgzP/aWPGtsQnPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFvmoL6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFvmoL6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802ADC4CEE7;
	Mon, 21 Jul 2025 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753058356;
	bh=M2vU9lJoVwY75/DryyDetZUbzsrTVQwp7tOnAefTts4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFvmoL6z6F+w/hcZSnIxXevA0HNZqv4fsVkAgH8Jq85D9LRA+614eLJO/o2+ZETJZ
	 SnkT8vj8x0tIdeGhn14tl7Cz74icR4FgKlSMAhDIM40PeSD2fwo3lGKB8GcARGugJ1
	 ijYcMM5qCl7WK39fRwRCBDCfojeKda2lJzu9plqHyk6A5yD5+mVx73zOOINqLnxtOS
	 86OdlR67zBZ6aHldlFpAsI36B/6eXF6+UEguO6OQGrCYSAMwHfFJaQzF2HlfWqsLXi
	 Wnwe9sl4/QrwJtlhHxgKt5g5Kd8b19CJGPxTCbKoeSVtw4u2d9DlhUtFts4VSk8vc6
	 ilqUfh61oLSpw==
Date: Sun, 20 Jul 2025 19:39:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nick <nick.li@foursemi.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	xiaoming.yang@foursemi.com, linux-kernel@vger.kernel.org,
	danyang.zheng@foursemi.com, conor+dt@kernel.org, broonie@kernel.org,
	krzk+dt@kernel.org, like.xy@foxmail.com
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: Add FS2104/5S audio amplifiers
Message-ID: <175305835524.3150899.3349675485069206127.robh@kernel.org>
References: <20250718121221.76957-1-nick.li@foursemi.com>
 <20250718121221.76957-3-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718121221.76957-3-nick.li@foursemi.com>


On Fri, 18 Jul 2025 20:12:19 +0800, Nick wrote:
> From: Nick Li <nick.li@foursemi.com>
> 
> Add a DT schema for describing FourSemi FS2104/5S
> audio amplifiers which support both I2S and I2C interface.
> 
> Signed-off-by: Nick Li <nick.li@foursemi.com>
> ---
>  .../bindings/sound/foursemi,fs2105s.yaml      | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

