Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366124B36
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7jPfNYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81ACC433C8;
	Mon,  4 Dec 2023 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701697999;
	bh=esHuCLsnYzWLmm5Oa6L+Kmza70Ps3RCO18AT+iUJYoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7jPfNYoSehiFCVmvkeB3YWHBnjgSiFuETLq9dY1RH90k0MXl6dSB376aJQmxz/SJ
	 QRqiBrCPDEv1NNNLFRdNyVkjtcdqEqUL/zpg/AxF++c9EonLkx58tZ+UvojQSP6YXE
	 62SIy3Jbw8gCBjUohCYs20csnvEtT+ev3iQwuumVREZmjFQv/HL4+Z6/ikawOUcHaD
	 JW0zXl6b3XoZFkJE+nF3JlC2xpaEMk9MhOOQFq4Dz0q2tgyz7G4hyemrsz9elc7pyY
	 lVqrA/RCi1ut+Rh8FCFmoevezMjQhYb7V/4hj5lL35IcaU/LhMTlMSJYbRWuEnne3T
	 MMAeJQzpMoK1A==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rA9Ob-0003VA-1F;
	Mon, 04 Dec 2023 14:54:01 +0100
Date: Mon, 4 Dec 2023 14:54:01 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
Message-ID: <ZW3Z-bQwlEoubDU2@hovoldconsulting.com>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
 <20231204124736.132185-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204124736.132185-3-srinivas.kandagatla@linaro.org>

On Mon, Dec 04, 2023 at 12:47:36PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Limit the speaker digital gains to 0dB so that the users will not damage them.
> Currently there is a limit in UCM, but this does not stop the user form
> changing the digital gains from command line. So limit this in driver
> which makes the speakers more safer without active speaker protection in
> place.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Works as intended:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Given the reason for why you are adding this, it seems you should have
added:

Cc: stable@vger.kernel.org	# 6.5

as well.

Johan
