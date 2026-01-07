Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963EBA3F
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 19:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767812580; cv=none; b=CfNYvfFGeR3iPBTJfWoAQYdjyd8zpTbazUnNHmv5IbVIb4WN3ET8MbAsvzn7SNuR9BBRgNHwBonuwHanK6TRPCGjaQnIyrf9K2vrONjHt3CEEfGZbaDeHPSQPACbpMlX8kpzGm0z230rAezsTNuUWx8L9WDjUASXrfOKzLes5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767812580; c=relaxed/simple;
	bh=IqqcRkZti77aCTxYqrqIsBhYZTMrpdE3+lcw8m9Qn6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fLztbh9V+N07MLHDVbYuuKNix3f6uDNovJqiwuDvS3bnAPL/xeMXxHag4F+f3LW8bhetZnnZwA4HcbaUfsoyuFRy6SN0SXY8DqLhU/8rcK1U3Do0Y16Bs2BaHwQZBAc6XEq7nBVWuT+fNdbCO/X2VupoaRvFVU0IuL9oUCPnQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/4naJyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/4naJyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44425C16AAE;
	Wed,  7 Jan 2026 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767812579;
	bh=IqqcRkZti77aCTxYqrqIsBhYZTMrpdE3+lcw8m9Qn6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q/4naJyGfvN5PsQbvctqAIMqm0Ne1m7Col316YQE1gwA/7omv3YavgFlZiZLkaRO4
	 NCokoe3EVcDdr4TZ2GoNpCUegRyl5oGPKQT8ZWrfjGddbFciDBJYZ2U0ESsVm/48Kb
	 52az0dCWD2dR/P+YTNBsLDzXKcbwq+D9pW4Bv6sYy8HgdfdstP1YggwppuiIitmwxq
	 ugGUs8kitndEEPexXYnLmKK//Q68a38G8fOuikrJg5w/738uJI2ns0CDB8alBDVG/u
	 z4GEttIgFV7kCTaZ+h53jFdSDIfXEeKY2g+3zRBDB5jpf92wvj9enT9litzG4T7Dx4
	 Yv20F5MLQTycQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Zhang Yi <zhangyi@everest-semi.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Qasim Ijaz <qasdev00@gmail.com>
In-Reply-To: <87eco20zn3.wl-kuninori.morimoto.gx@renesas.com>
References: <87eco20zn3.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: es8375: remove unnecessary format check
Message-Id: <176781257802.127389.15292097699386935546.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 19:02:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 07 Jan 2026 05:18:08 +0000, Kuninori Morimoto wrote:
> It already have default for error case (A), no need to have
> SND_SOC_DAIFMT_RIGHT_J for error (B). Remove it.
> 
> 	static int es8375_set_dai_fmt(...)
> 		...
> 		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> 		case SND_SOC_DAIFMT_RIGHT_J:
> (B)			return -EINVAL;
> 		...
> 		default:
> (A)			return -EINVAL;
> 		}
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: es8375: remove unnecessary format check
      commit: 22a4776a9ce50aa47f602d28f53ba9d613a38f49

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

