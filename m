Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778B342CB0;
	Wed, 26 Nov 2025 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178869; cv=none; b=M46n93jvwzVqixvTOkk+g67SLC/qSInj5yByzQtU67ldsZUglWd9q9RxAqPHlh7P6KasIJDGedjo4gby1a0h26zI5WnRkJKgfX58TF7NpQLchDy9g2kHQI95S6A4sgsGS0ESc8Mq9q9BQH4Ay5Wf6Atb9wDdpriIWUVYnNAWWz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178869; c=relaxed/simple;
	bh=fPDqUcVAiQR4NjJRm0o5O0ia2lSZh8oWkwubXUN5wYQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZYFm1fRoZFu33yA7+iz/hnh3JP2q42b7/Q4g5p0OmyJhvkWzHwN2JKy4+eKHS08pHTGEopictaQ7NrkBh+DbvEWqodh1VT0aRsLKhxkTGzEeBdUpSUXkelRJtFw5iaho4rqzPDw7pvemt7mgJxcIIgd32xnp47DIS4i2GRPi/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpjHFWNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpjHFWNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE36AC4CEF8;
	Wed, 26 Nov 2025 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178868;
	bh=fPDqUcVAiQR4NjJRm0o5O0ia2lSZh8oWkwubXUN5wYQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OpjHFWNyGrOoOVKB4WiUUWnOVHzkUkOqw2thB/YhgHKqed8SLqFL8Q6yU9d36TqN1
	 L4BJOyUxFqO9j5R9rkJZSu+VMnpkYvS+120GwmeCAFMgjnPP+4iZvKcXeoKnaGQVmL
	 rKWQASRjp9/0AYIIgvyP/9BsEvWbTVu90/Fymp+mFJt9+iin7zI4mE+W8sMVtZ9VhP
	 HtXGefaR6QxfdNZLTqERCFF5WzgW0z6cftfQ4borGPXeWjpbNYSsPaos+QcvJzC+Ei
	 qTIFs3zy2NdSW8WyKi4lnrdo6oq/0ih0Fs9DRALY3xIHuxzR+7KVZjUkaN2G0IQRbE
	 NRwhdn3xKTTOw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251126064509.1900974-1-shengjiu.wang@nxp.com>
References: <20251126064509.1900974-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: clear the channel status control
 memory
Message-Id: <176417886645.96001.9476091546839523665.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 17:41:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 14:45:09 +0800, Shengjiu Wang wrote:
> memset_io() writes memory byte by byte with __raw_writeb() on the arm
> platform if the size is word. but XCVR data RAM memory can't be accessed
> with byte address, so with memset_io() the channel status control memory
> is not really cleared, use writel_relaxed() instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: clear the channel status control memory
      commit: 73b97d46dde64fa184d47865d4a532d818c3a007

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

