Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FF31A0BE0
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731343429; cv=none; b=Bukj07bOtSMOMCVMdtZ0beF6Shoe2zyAZhByGpaazCOMUDpL12dEDzqxzMFVpp5XfZpbMzv8xJBIZCRRt/STow8GOslyXIvOnb5vUnbC3/AHaESR5rmevDX8LXDRcfviNug/9jo/xvodIa9gOARWO4jyWljziysmHBkm5mcUsZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731343429; c=relaxed/simple;
	bh=aGwfk83gwUEPk4v8XnSoB0A/kyurmmGDOEwNg5Xdigk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NeOBRMtysTmnk/AKVvWKRU8dOTgK5oASUtvKeT5SwjkAn4kW/SEK88ThOCX3eOZL4xAwZLcTGXlVeg/ToTZ9SVBrhz7E9VQrfyv+QrlAHqtOHsD0rrtmfFdP2h+0W+rlWDYWcLAVyxCeamydtkAvpf/Uhv1Cv+/o44V8Rugsj+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNpHJGSR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNpHJGSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EB7C4CECF;
	Mon, 11 Nov 2024 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731343428;
	bh=aGwfk83gwUEPk4v8XnSoB0A/kyurmmGDOEwNg5Xdigk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SNpHJGSRBbSbklMqG7wwbDDl25NjY7UkrTofRiCUZpF5G4zKnzTvZi9GeBZ+2/cPY
	 ZGuHgt4q2lPMUYojh3rmwTB6BcQdyI3KR0Vu7wrZG564DU1wNCg/0KOHXP/y6d5sfU
	 IcFPAZYtIbgiW9cKr4DUKXMChtiiBILRQsvBW2V1kRQFaa1+lzyUxBzAIock6IFKsh
	 8mBzQ0nj2P6t71dfb0UlywPQn2ePKY5M5HdhP1xJRwq5LTIwVJ2x5bqz+fR2J+L97R
	 c4r9xIuTeXrz+RJsTqfjY22mOFWLOdouiJzQFn6K5STbIpr2qLIlE479IaFxgoWXi7
	 A+8WP+Tk2Q9iw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <87zfmd8bnf.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfmd8bnf.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: add symmetric_ prefix for
 dai->rate/channels/sample_bits
Message-Id: <173134342735.341130.7543402410748480816.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 16:43:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Wed, 06 Nov 2024 00:10:44 +0000, Kuninori Morimoto wrote:
> snd_soc_dai has rate/channels/sample_bits parameter, but it is only valid
> if symmetry is being enforced by symmetric_xxx flag on driver.
> 
> It is very difficult to know about it from current naming, and easy to
> misunderstand it. add symmetric_ prefix for it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: add symmetric_ prefix for dai->rate/channels/sample_bits
      commit: 1bd775da9ba919b87b2313a78d5957afc1a62dde

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

