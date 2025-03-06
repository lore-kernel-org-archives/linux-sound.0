Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C226BD82
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287493; cv=none; b=kdiJno8vTmtq7WvhUE5mhj6w/If8gNndUGnvB1OID+IOUwQujJB5yodZrBogT1sxPdTGXx4CWMXE8zVU2efT8WYyfOUsXT1mYpA68cnf1dgeGl4WIhmZ9cX2+T6tgRi+JGcyryA4mE1SBjgvlLnr6YNx0b/ELNfI+H2XBEhEJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287493; c=relaxed/simple;
	bh=QHQZfb/oEf9UxjPnL5EiDx5zhHQ9HMEIfjSAXE+G398=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uFyAO22XWmcySBsJck5EWPeytcqKbUuNKHv5jmShqDvsBw29uA2yUyWPaj8SxXOZsG+Vx5X9AE0+1uvZ0XUb5iJxzVv6feMuL8Jkcy+Yg4PTY1dAxsdoKDFNBo+LmRyVkZxqkWHH19c1jsAzI2Uc77HStnhJDhsaHHg5yvhIU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNCUsOwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNCUsOwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C81BC4CEE0;
	Thu,  6 Mar 2025 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287493;
	bh=QHQZfb/oEf9UxjPnL5EiDx5zhHQ9HMEIfjSAXE+G398=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sNCUsOwHs5TbRYl7QxQlt+1OujdDN0Wq/jUCiZ8m5fUp0XwjZ6FwcpiO6NRKuzSfA
	 41CnhKyGDLS9iG4amuS5YUbyohFWmdLuAcZoRlae1IeDxCNzSdwnJRazkfXj1JFfsc
	 vvNRdTokDeFamc/JEW2vRY40oxILvP6b9cEoAxMkqIxNcGNE+ZQknsAKKfSESkg/Pn
	 cPFjdYOrCodEQ2wzgk/piI/BGkU+89ZY/bk8fMoxcg5B0IuMVHl7AJIq54nQGJsXmm
	 wzjBjsSWMW2mDS25nLm67NAsdj3pll1QKFElsoEWDOhvmoKFohULyp7afKb6UhePFc
	 4EPTC3yFZu7eQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0xi52vx.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0xi52vx.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: reuse dpcm_state_string()
Message-Id: <174128749284.180401.8875698651636960095.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 18:58:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Mar 2025 02:06:27 +0000, Kuninori Morimoto wrote:
> We already have dpcm_state_string(). Let's reuse it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: reuse dpcm_state_string()
      commit: 7a2ff0510c51462c0a979f5006d375a2b23d46e9

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

