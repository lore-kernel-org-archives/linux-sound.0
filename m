Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC660371CF5;
	Wed,  8 Apr 2026 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632386; cv=none; b=n5qfv0+qWUyGNbBJyLbVoVjjb1/GBVbZvO+m8USZcIcanTeAnE1PcjayRD0EJyn76dIYBMJkaHTBwa+Uw3JWk9I+p2Ff0vaLsuRwJ//MG4PEpZINkuoOIt9/TkszfbRTNGbeSOtitoMRYFeqpyNxsbMKJZbkq/wrS4plReR/NDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632386; c=relaxed/simple;
	bh=jEaPlQBpK9e74i+jZAnibkrCdsBl6sxZabMuxRJQnsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijff8+YYpBdjP2JYsM5ikAKxerhqNE7tp0M9lXY7DeKTQ/lMP+M6h7ti9I3IEq1dUyS62xlh5O0kplW72N0DqNxU4jgRuPax2yexEIEoA6GlqPqhHrgTeqIXM/i7w8KXyWHHYA3saennUtFSYJnR8RcsQZsZs1wnQgnEKEsnqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pv9gLUgW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pv9gLUgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DCFC19424;
	Wed,  8 Apr 2026 07:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632386;
	bh=jEaPlQBpK9e74i+jZAnibkrCdsBl6sxZabMuxRJQnsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pv9gLUgW2pR0FxftZeBZYnQx9pTeY6DC7bsW/oG/OZRJV4OepSO8TYrIPO+01ASu3
	 1+o/10H2RqQlKu+Yd2s40Z1juLKxuXOMRj4OrGhMQSREaIonRSLTlfIDtFbxXoto0e
	 k14JSQ7EoPiQIvvSjsyGCCgr9IzvXt/EOje2sauxCPO1A114q+lWRnfX8JVtnQ2loQ
	 BZZt75gM2fFaizmA8vKXI1iCtkY5dvPuhfCzwhr8TMSwVoadFqhkBDQaFBdee6IaVA
	 pHXtHJEP9pW3HB8pHuOuc5zIHlhtUJv4At2M8URjMDLH59mOXJ5+PB4VywOpWmBCFU
	 1bo63FcsmWG6A==
Date: Wed, 8 Apr 2026 09:13:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com, 
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com, l-badrinarayanan@ti.com, 
	devarsht@ti.com, v-singh1@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: Add ti,tas67524
Message-ID: <20260408-bold-cerulean-mole-109cc8@quoll>
References: <20260408053149.1369350-1-sen@ti.com>
 <20260408053149.1369350-2-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408053149.1369350-2-sen@ti.com>

On Wed, Apr 08, 2026 at 12:31:45AM -0500, Sen Wang wrote:
> Add device tree binding for the Texas Instruments TAS67524 family
> of four-channel Class-D audio amplifiers with integrated DSP.
> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
> Changes in v4:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

