Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096051;
	b=4IB2pJROGBrsSfXrgjpKCETa78x+rNQnNHX07v4TYTfvdgT9iwEqmldW347e3B1Y5daK
	 82gVxEdc22DTJvy31C1b5yc3m9V+psozPYs2kCwDlXDR7NajI/iiiIoiuqOaFPDnbNboE
	 Ep1jAMci8eZvqN+zsikRXcIY0cs6WD87EYcv8H3vDtBNNh4EhEnFkg8zuuwWLFAj3Tdzg
	 ctOyxH1beNDLSwMMv+GjWMt46TCP36yrJ+fWrNf5B2+pOoROKsYkzxkIOufk4ADjHBeK7
	 zN0QpQy/PVwaRT0J1msb75XzCK/Y8SC+zxe03Dsu/AkFCfTDsP6IdymdGG6FfiPP1pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096051;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dXQP2m+btkvG5QiKdm+wviw3/2QTYitkPuS/MHWOAlc=;
	b=Uc3Ak4LmwFbc6KX1mYf/dRSnmjDtUgh6Om4Kaz9k5rqLDaQ3iyXrXFKRShMiJSYs40Ek
	 JVmJrpZZwWt34p6PxkspDBEtxeOYzLY+fOCJ+tiqHOth7PRe6pcaRCfSSN6m/CM3O8+Gq
	 R2gxStEk9QuXjwfnZ7VYg+eadJA/TKqbkJ/CPQsyxIjbOWt9w3QdJ0D5gBOdjA3H6BRST
	 BdppWVR1vHzeik+ASzxCQ9GG4KRQ9+MJ9CPvkzDabW46Mf9ZauBIdrdEhvklewcMbMa2m
	 PuDWX+CrwObXY061rLQpveyTRrEohU9JDhee2mULXYV4Il6LOrzWBsBar4XLhqG6CQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jx4y7bRk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB9606A325;
	Thu, 19 Nov 2026 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jx4y7bRk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20821F000C6;
	Thu, 19 Nov 2026 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096051;
	bh=dXQP2m+btkvG5QiKdm+wviw3/2QTYitkPuS/MHWOAlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jx4y7bRk8IjxoGzrIhZXjKfl15cbteZALMnnd+jMHWZ8ds2tSCgcGe8Hbhkm2tGyl
	 2ab0rfTBsmsOAoXy1lIJVftVhfdWNkEakKAuVqe0D1tuSoKjPodcQuGCMErWhezMcH
	 BFQ/zthHdbWaXW+R+TkSLlRd2bo+6c+c+pcurVhULNlTPyTebbha/OZzW2UCQfU6rz
	 nQAVUPl6gZGqZ1u82V+zmvzklRrAucFfmgRXs+xJKYs0CMfsgEymkPKk8ypLxitYfA
	 ySOyYJ4E2SKhb/LBFA72jQ0ddh4PQOkGtOVi8DTlKew0VWdQ67S0Bz54nYquw7X0Lu
	 XrSXWMs7xVyOA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Gaurav Suman <gauravsuman007@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109-wcd934x-mclk-v1-1-ab86342e7ead@gmail.com>
References: <20261109-wcd934x-mclk-v1-1-ab86342e7ead@gmail.com>
Subject: Re: [PATCH RFC] ASoC: codecs: wcd934x: keep MCLK enabled so init
 writes reach the codec
Message-Id: <179501573710.349622.15357136971746348293.b4-ty@b4>
Date: Wed, 18 Nov 2026 15:28:57 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=En7UEdzltcZ12Wa7wjNpSD3vfnoA2uYlkmf9ijhqAdM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/f2Q8vhTtdvkyI1Gf02rlSLe+y7r/9/gvTbthKeLd
 ZllQKNjRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYSacvIcNHjlp5B/PKnN+Zw
 7/lXs6lolpOZxomInDsFW1V87JbxbWP4py27e77pvvPqH49WLrK7KSGT8T0jT2b1xOvXH0vse6u
 iyQQA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 22:33:47 +0000, Gaurav Suman wrote:
> ASoC: codecs: wcd934x: keep MCLK enabled so init writes reach the codec

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: wcd934x: keep MCLK enabled so init writes reach the codec
      https://git.kernel.org/broonie/sound/c/34430741db6b

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

