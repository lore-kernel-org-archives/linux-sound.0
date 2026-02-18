Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F02F49EB;
	Wed, 18 Feb 2026 23:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771457694; cv=none; b=e7XBXK5ga6cSab5mSJgWyjuAW8Jos3niwHRai4kQxgB7iyBbDuKqslFAAVlGwZQEne2BcFkea8XH4oN5/oEA6ArRuWhxT3JsiOQxMb1BwwFyVu/B2SUxNT4mwBobRhOSPwVg1MrjMqDGL3sMs8asLZG0lKooe68q/Mk9dOI6lrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771457694; c=relaxed/simple;
	bh=KT5Dw3IpFGRyOt2RzNiqycDyZwdvt3eYyDUGYMMFHHo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ge2OiiOKZpioTMJqWssJjgI7BMG92on2/SgibLrOeBRV9m6MIHcgNqhVaSAcDrCTKVwZyhZnnxYC+uTtHc3Bj9lVOm4ebNPJDp2ELfFsDbsmSnysjexUgUmMt5Q3+AojzlDYngnaNVjHxmM2y+NfIbUAJYH9laYQLtec+RMf9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDnZ2EFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDnZ2EFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99785C19425;
	Wed, 18 Feb 2026 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771457694;
	bh=KT5Dw3IpFGRyOt2RzNiqycDyZwdvt3eYyDUGYMMFHHo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tDnZ2EFzGLZlmoorJ5sCzqZy4H8lf1RnKseaWaiQHEcz14MXRJBFI8fBFIbYr2wch
	 /Nk+EC6JgXGwZ2aMeVIXxCnrU2s6HORFK5CegSpOLBbGScZAJi2HTB0yWyItBXADdY
	 nwH93wK6hAxXeQdeOv4JWPZ2jLdmgDeUt+Bk7QK1qkFU2n8QHiPEnd6lC466AHR2d/
	 QFtwMxou8NZDTcIKElPCsvcP6gb6WTRY7B5zRvfDNRwCSpZYUz0LxUC1CCYLk510ah
	 E1Dz0YHWe6KQxPyv892fzjjnCM7qW3h9GoRPMbxmURopsR5h0GAO8u1hYnSi0hR3Jm
	 W2NSre8YKVScg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 tiwai@suse.com, ckeepax@opensource.cirrus.com, 
 andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
 kuninori.morimoto.gx@renesas.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
References: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: dt-bindings: fix the ak4458 and ak5558
 binding doc
Message-Id: <177145769138.2257280.5500868757051833326.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 23:34:51 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 12 Feb 2026 10:18:26 +0800, Shengjiu Wang wrote:
> Set unevaluatedProperties:false in ak4458 dt-binding doc.
> Fix supply name in ak4458 and ak5558 dt-binding doc.
> 
> Changes in v2:
> - update the commit message for patch 1/3.
> - Fix the supply name in dt-binding doc, not in driver, replace the
>   patch 2/3 and 3/3.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
      commit: 50a634f1d795721ce68583c78ba493f1d7aa8bc2
[2/3] ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
      commit: e570a5ca307f6d7a6acd080fc219db2ce3c0737b
[3/3] ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names
      commit: 80ca113671a005430207d351cb403c1637106212

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

