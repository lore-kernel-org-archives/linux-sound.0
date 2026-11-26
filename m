Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721831;
	b=d8338k3COThDOe6JwayHuPNxBu52W+CcRrfCWGPMl8emErgxd91Uw5Cwaozek2S8R97o
	 MGyeNB//o4XmDM6Jvrh6pRPwY6DH14y8UA8LpsTzN97OFUGCVjQ3h21RKlwZQdWGoClUj
	 1ilNXwuhMjWel9nkwU9apiI9OpgWtaWuxfFWKWqub46zb3PcG34PSe3mWyBojD0RBhjt4
	 BwUNJhG55XuDx6755lXDNBk14oBL+8XcLUVW3r4JkJviwhEcMZy8pURMchCe6UAVwYDL5
	 H5lr9bLUOjB4eAFg8NcX2g3IqTO2iyt1etJSCPc3N8cRtJ04+EsXvNSRrViSS55Fg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721831;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=z60gty6+p+vwF3kd/m2FkOe+0F6XrOOsj0gxf8kQRdY=;
	b=TFpEjZJHn/QP5jfUva6+Fu4p9amVNDOMCamkxcofC8BTlqKm+aVIMmUkVvRjgo/pl2ou
	 PdFfvQlW2LyTSerA4/JizCvDYrPuCV4UV8rch/XjJ0/20NW0qui1AYhEQPQSGvZyZUMSN
	 SwPjMxRFSAfsbGQc3Abf+ZKfsYw2wt6feC5SxdtofEkyfotTwaxhuI+q7lce0OMNkkPJy
	 75OhmxrtqCsUm6UT8Y07OvBHD110jsUhdwMpvbVYJgHtmYGDGAPK7xWK90y35FKD3m0xH
	 +UYkI/HFSHfPQvMZelxWAA8JSSlkNrp+qTr/FWnv2AVA0xk1pocf0jfOHw8sJSFbyXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPjhMIPP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFF9606A31C;
	Thu, 26 Nov 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPjhMIPP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1461F000CA;
	Thu, 26 Nov 2026 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721830;
	bh=z60gty6+p+vwF3kd/m2FkOe+0F6XrOOsj0gxf8kQRdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mPjhMIPPfv7IdOpL1YlY1P9IlmMl1nhaC5uw8yqYQcvhBZ8snMMhvDbvOvqLLu+pc
	 MJW/DBCSXSfTkSlSr5jClVsF7jrdDIvbvDUtC+0OMncAw7fpm2m1F94dA7KokJ3cU9
	 zYKGK4o89XMVGLjA2qRT222Bnd3zaza8C/UodIwi4TYPWhJu+Foes4AkQXBzxIW31D
	 kfkfZa9DigLo0CMEnn2m4bPuCbE1OTpkOpgavSvTjHTjCaS//Wpy11SCJ4L15BvUxW
	 rmH6t7XXn4GInme7rzq7ed0bw4d2myTqwSDhc4WYn9FMENU+MRc/hG6Rf5vq7CrDxL
	 cl0rbc33Ppt8Q==
From: Mark Brown <broonie@kernel.org>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
Subject: Re: [PATCH 1/5] ASoC: aw88261: fix sign bit check in
 aw88261_dev_get_vcalk()
Message-Id: <179570329744.142532.7395623740715138052.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:28:17 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VGOaLeGuQvlrCwUC84zcYzmqwdatVWsRSWRO4cRMl48=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5upIvb9qw6pPDmokrbWMKTVc8NI1mieEXCX9qtYbLj
 d2koOZDRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZyl5WRofvzwt+azyy326ha
 ripcEh7EWNLxoiuvTyXWOnGLs1m4JsP/qqUnPLL62dwmc5znM7ojLmfMnjL9vb/x50sOf9NmyVW
 zAwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 17:30:12 +0100, Marco Giunta wrote:
> ASoC: aw88261: fix sign bit check in aw88261_dev_get_vcalk()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: aw88261: fix sign bit check in aw88261_dev_get_vcalk()
      https://git.kernel.org/broonie/sound/c/b824fb3c0844
[2/5] ASoC: aw88399: fix sign bit check in aw88399_dev_get_vcalk()
      https://git.kernel.org/broonie/sound/c/e18570e9cee3
[3/5] ASoC: aw88166: fix clearing of SYSCTRL bits
      https://git.kernel.org/broonie/sound/c/da290cad79b6
[4/5] ASoC: aw88399: fix clearing of SYSCTRL bits
      https://git.kernel.org/broonie/sound/c/9deb0f9e7028
[5/5] ASoC: aw88399: rename AW883XX_* macros to AW88399_*
      https://git.kernel.org/broonie/sound/c/a860c9588b94

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

