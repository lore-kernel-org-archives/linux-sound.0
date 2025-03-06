Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62326BD82
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287493; cv=none; b=S4TQDCXaB6ZvpiTcjcmIIbr5xBSxo+31ksc9QynfB0mumymd9KxTEz51diQbi6ntFpVmnRQlnRuaciRxhDVxQwtDQvV7Q6yj8clNtE0QsJIomlthyUxYPHgTvv5GQ8GR7JQcycBdqyNiKZfcLjcp73FnU4umRVRIncZBJ6q+omU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287493; c=relaxed/simple;
	bh=eK+Yj+VKPWt1B97GMbBJP0QS/M03xhSXexYkA1evFJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZAba8cHoHNUQK/P1F4AXWam9Fbealdt1iX9udw0wzERxIUhfsE556//hkp1ENw/ThCNqei/Nj21p7RUG9o2r6vA3qSwr2bUtboE2lziM43ENZZErxNK2rL8LCQpfJiuIn6Ke5PU7YsJhpB+GC4ExJGL9t7Q4/kPXmueLDClNm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P45IeOgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P45IeOgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1D7C4CEE8;
	Thu,  6 Mar 2025 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287492;
	bh=eK+Yj+VKPWt1B97GMbBJP0QS/M03xhSXexYkA1evFJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P45IeOgYUO+IahHpk3VYxXxxMUSWp2IjPnm3qgr3cd20sohvhhtja3XbK3+lTk6Ob
	 jy97rJLGtUeXUm77SkQTcLEHzZxZQjkrie9MLlqVO4FahHLUJzzXxpXDuXlzfz1+VA
	 Ka9DonS8lqGVogPS//tfI3qTZO+Vv+q2IVSwfksqxCU4KKoW5NL7cy3oWGss1ZzdLY
	 oGq2Y/6E8+Myc9EoSPwTByaxcThMrewK6IU0yBZM7R2JWkNPWOs+bAmt+JKLoMNQS1
	 +wGSjptvEkAz/fdKBF1e4FI98CPvLtywH/WxLQBr2VaQr7mnVXyfbfaN2Vy8WQh7GA
	 ETTFjNXC5c9FA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <871pva6hs2.wl-kuninori.morimoto.gx@renesas.com>
References: <871pva6hs2.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-dai: add
 snd_soc_dai_mute_is_ctrled_at_trigger()
Message-Id: <174128749188.180401.14532177427291201878.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 18:58:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Mar 2025 01:59:25 +0000, Kuninori Morimoto wrote:
> Adds snd_soc_dai_mute_is_ctrled_at_trigger() to judge
> dai->driver->ops->mute_unmute_on_trigger flags
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dai: add snd_soc_dai_mute_is_ctrled_at_trigger()
      commit: 5d5eceb9bb1050774dadc6919a258729f276fd00

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

