Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54036280A57
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102557; cv=none; b=MHpw7n/i1ZbYgNmeTpsQS7Y5+uqAGV3aMMoqIgxqKW9UfHUdxTkCPhK3kIYcp5LneNG6LFtn1ZtFXs6pRb0o3iZu4L82kmNoMZbXFzSeuJqUMZQkDCAi6vTovQC74Z80hE2IeUirYJ84Ai4ErRlZPUzV1IuOCsNh18MWJ+V3MDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102557; c=relaxed/simple;
	bh=E95IICGFTBSLmC0oGvTB4ejS2vnkZRwLv8jqWfnJ70M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hLX7co4NlzS66b2hY9z9mPX18fIANmRbpdx1dEnQtY4l/67tnqW7WcfqU0IlCI+Z3sMUoLs9Fe0qird9/AUpV1Jfv9dxZFaIXs7bOyup9mU00LVsvVPrGGwCbXik3A4xjOMsi3F2SwuSZA2HVoAjJ4mw9XAduCxhD2t6u38GnHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYE6pnVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYE6pnVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56578C4CEE5;
	Tue,  4 Mar 2025 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741102556;
	bh=E95IICGFTBSLmC0oGvTB4ejS2vnkZRwLv8jqWfnJ70M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DYE6pnVjJo2akVRavZa/eWQTTpVTfUruHNhSOgIERSo4/ImunN69IWf2189Xubfki
	 C+UhEN+Vk6QdPuXZFmVHLBiv+IB6IKdZtizXIORDTJMDvafFVOvgnCdz48UJ94qC3m
	 Com0Flr+8YyM5x49IdIUrY4G/FK9DzhCi68/moPIdbKUPY2GQRBhTtG8j05oJprYTz
	 dRr49dH6SJh0uqq9tMshrLcJ9BV7XKJlHhowN20BrDkfJ/T+DBj/GZZpodSnPvrnq3
	 aaeLT5dZ9q/J+WDJ9XCXxas6IO3ZoYNhJS8kuQzmgfRtPttQC9VFipnlRLMYCuUsEh
	 WStUD6uz46jVg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: audio-graph-card2-custom-sample: Separate
 Sample DT
Message-Id: <174110255608.87345.15771297913308314898.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 15:35:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 18 Feb 2025 01:14:34 +0000, Kuninori Morimoto wrote:
> audio-graph-card2-custom-sample has many sample connections, but because
> ALSA card has number limition for links, it is impossible to have all
> samples into 1 ASoC card.
> 
> This patch-set separate sample DT into 2 parts, and remove original sample.
> Because of this separation, we can see all sample connection via multi Card.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: audio-graph-card2-custom-sample1.dtsi: Separate Sample DT
      commit: 22e5c40fda71d0b6cdf83af9418403808d5d06bd
[2/3] ASoC: audio-graph-card2-custom-sample2.dtsi: Separate Sample DT
      commit: 7c0572197faf3b6d6b27271455e76ac8ba84c43f
[3/3] ASoC: audio-graph-card2-custom-sample.dtsi: remove original sample
      commit: 7d73a1beaa9428ed4da7786725fcb1a20fd371ab

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

