Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA920CCF7;
	Thu, 23 Jan 2025 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631760; cv=none; b=PgB7CYBa79E5+OhAGN1W5QyAFxU8KCVQNN5AlwcxWiVRT9j/vvf1x6sPrqTOlplqQAD8LWe+yzJ1MNScoR+rJi/cSGCwLvzWBIsgHqb0xwGWcBZIGCQBpBPzuBEcv91t6suHLPSAEWDh8j25bDXRBq6vFBrXUmRzV2BYWisEWHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631760; c=relaxed/simple;
	bh=C5ykgmHNWPBZFtY7v0XDev9nsoPs0n5+OdKnlZ79aTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HFhsxsqSxtyByHBmmUexAqdxF8WfJ72d2tJMx2xdn/qLxNIMkZSSAJUCuEPyjVWyfKAm26GmbfgUUYnNjDog9v0XKwqnf6gj+u1k4jvvjjNZ655bQ00+rehZpklxYLfdcM6DN3GD0xCL4OoeZixQOlRBQ45lNVp1YiwRd8dC/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckHlJixW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckHlJixW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5A1C4CED3;
	Thu, 23 Jan 2025 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737631759;
	bh=C5ykgmHNWPBZFtY7v0XDev9nsoPs0n5+OdKnlZ79aTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ckHlJixWdU/eRXXCfO3biE1EOqV1VcKNYH80hn87Eu+XY+Lmt28fMjuZ4UUzLZK+z
	 llhOthQ9l7jnsoEObUGLL9Q1abEbkQxLvHV4PtU/yjj1pQlGw3sidxSH7mLPnA0Vz9
	 hHqZw8KVUOzHBKSheuoKQYP6K1mf8Y7JqTH+HYO1NIhnaS49895v0zpnCssRdluZyd
	 mOOJ835+33K/Nu4zPE6FJGrAdbya/YD5lhHzEY54Uh2Tjad8HDqcEVYUv3CfyTzKP8
	 aDlRUBSxmya2S+xl5om4kRl/V+dSdiqqetgiwnGdrAT2mtmKQM86lFhClmqgR575oC
	 tZQuBwxnkpD1A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
References: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
 <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH v2] ASoC: audio-graph-card2: use correct endpoint when
 getting link parameters
Message-Id: <173763175820.25036.7570662428516868582.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 11:29:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 21 Jan 2025 08:48:15 +0200, Ivaylo Dimitrov wrote:
> When link DT nodes are parsed, most functions get port as a parameter,
> which results in port endpoint@0 always being used. However, each endpoint
> might have different settings, but those are currently ignored.
> 
> Fix that by passing endpoint instead of port when parsing link parameters.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2: use correct endpoint when getting link parameters
      commit: e935f903ab9bee43f3375883c230a32138ae3d1d

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

