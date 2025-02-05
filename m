Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2222D4D9
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759471; cv=none; b=Kf/Y7TCv7hKmvkKX7lHhuXCjgmX5cuNrrShepyVKZeto3acLKoBuaFqIJrs4W6Kgy4Zgn0f5xqfC/bsss3KYKLjE8bHMInkFQU3JOQP/5R+BUH+E2sJWLsuQq2GPF/SW4OdcjpNqLbhLgjxxZux/adedabPxSFDEcw4i3MQNfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759471; c=relaxed/simple;
	bh=6QxRzIczK/7Y+pp7xRW28g5nelQLril39eSkw18URoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i5OqPZpmHnnv1b8pkZClyKX0Y+eONNPu1DPizTcB7x+C3d/QGPPJaHPRs11If2p4kcTvvdjl0NoYzJQy/bVJFeV8qi9eySMVMO8FYErknnSJNwJGE6bxcpEa+rt0MTVQhIn7lj+BH/qfTcqbD2RET0xeZO5PhOp1Pe9lgCkioGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/aY3exi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/aY3exi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AB6C4CEE4;
	Wed,  5 Feb 2025 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759471;
	bh=6QxRzIczK/7Y+pp7xRW28g5nelQLril39eSkw18URoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B/aY3exi80myvKezzOj/WIt1PaxxctNdG3lKb8Oz9pEkL9ZrCo3coTy7fyUfInD1s
	 5qRMvbxvWAEMnfBUxLE9PPZe2UrV55+xZPucplzPxbmU11eKmkSeWOpFV5H8Diq1qO
	 Xm3spTpwd/EkCNqTnaFze8x1KoHfOYkWf6veBaUXWZdV9cFE4JiFCVcwLzXPIJSuZW
	 0EP+WSauDumw9U/tsHUiRqYef1a5DjkcAflHhB0PfTU0nDL4L+c4e1CcQoU51/BtHB
	 R9cyWASDPqBmoGchT/6sNIEDzQHlDI531zFKXDwZdBeHEFoIG3CkBbax3RBhqkEQzG
	 0HbPrE0kJff1g==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <874j1bsgw7.wl-kuninori.morimoto.gx@renesas.com>
References: <874j1bsgw7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-ops: remove soc-dpcm.h
Message-Id: <173875947063.32457.3434639734418975994.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Feb 2025 06:04:40 +0000, Kuninori Morimoto wrote:
> soc-ops is not using soc-dpcm.h. Remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-ops: remove soc-dpcm.h
      commit: 1a4a5a752fcd60797ed2cb7c06253c6433d13f63

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

