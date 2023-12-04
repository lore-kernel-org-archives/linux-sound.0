Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD12511A
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2tHwSN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74557C433C8;
	Mon,  4 Dec 2023 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701697850;
	bh=fsFu1k8Z5gwLxuCeGp27lPUgeerquZ+RKi0ABLqEljs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2tHwSN+wWn8UHYIA69m57D3iBC71gI5x8Pv1eEK43/eRjSFxlbPoyD96+QOH3oGd
	 x0LHblC+pDkyrDJ06GPEDjlIzjTw8HTzxBPea4TaBkEJ1upSxdo2wAv84q/rhRsPF8
	 RRivfL7Ve0W169YUbouf4mIY5DrAzJWybYfAcxcdwijnICYE/rgVBKrsrF6GAsnDHI
	 Yvvw+hrRMEvvuaQqmxv0KRC8srVVRKcH5b8J21JPPoO5PuQrS7ZQIaZTnS7Y6hm0SD
	 BQz75iDt5+3JDe9ltkNe8mM4LB7mbQhhOtoaMktj5RGBnR4ysL2fyixFtsz3C1SLVQ
	 7lD++6S6e3Tbg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rA9MB-0003Ud-0P;
	Mon, 04 Dec 2023 14:51:31 +0100
Date: Mon, 4 Dec 2023 14:51:31 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH 1/2] ASoC: ops: add correct range check for limiting
 volume
Message-ID: <ZW3ZY_2_G64dNAeS@hovoldconsulting.com>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
 <20231204124736.132185-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204124736.132185-2-srinivas.kandagatla@linaro.org>

On Mon, Dec 04, 2023 at 12:47:35PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Volume can have ranges that start with negative values, ex: -84dB to
> +40dB. Apply correct range check in snd_soc_limit_volume before setting
> the platform_max. Without this patch, for example setting a 0dB limit on
> a volume range of -84dB to +40dB would fail.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Seems to work as intended with the following patch on the X13s:

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Should you add a Fixes and CC-stable tag so we can get this backported
(at least to 6.5 for the X13s)?

Johan
