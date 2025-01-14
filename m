Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348CC1D5154
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736872536; cv=none; b=exvLRtOMFjF3/arvldEsbjg3G9/fm0j32wvj3ranU9q9+39NszDflqWjBfBkFQZUa15nvyOftCIlVh0jkJ0r3EivNQk83tsFQKyRd11cpopdAV7IUoFJ7qeJeEs9fKgAmxYW7hbX2KOCJh99OS/KP13zKZdU/V+s2fbjIPRz/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736872536; c=relaxed/simple;
	bh=TGqPLlXm23CoYhhrWoKZifWYlvLNZf3VPvrmmLSMYJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iLlLG+0mz/gMO+ETpC3uzvamQqKTkTd5mEiWWT5yCTIVC+RNSzAiDKVCS0Q2xY28ntdJ88Kmk/2pw6yRbudLTPo9RwEECzuJ4CAKq2Yqs1e7QLnIuPuoSsr/r1cP44ovUct77HDc97au7fWDDqPuNmUSU4dEYFYVVDD82sBKTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mf0C7CcY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mf0C7CcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638CEC4CEDF;
	Tue, 14 Jan 2025 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736872536;
	bh=TGqPLlXm23CoYhhrWoKZifWYlvLNZf3VPvrmmLSMYJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mf0C7CcYHtCvOrb3N37ao/ZxryY1dHcc/R5y2TBtuVuus/oc74ST8aF4vZ+UvSr05
	 kJcTLgWjPnuduCVPPIQNpuGg4/p942b2x0FkXbf4Jsc044+BgYf/lfcuX7LG5vtHda
	 4di4/eW0VuBEO38KSlIF42FF63DUTRUcKox4V4fk7kzZiOvNCTj2gJens34K3s0U2t
	 HNa+LrFJWhvoYQ71uMl8Xic+SEL0HytE37w5nD/Fd+rHFDr30smYSmumYjG0nBNhdV
	 C8W+8WP3KYPAsxlLbjBRQqQtFIwefstMDUfTmqaxZ6IzrM5btWHKTCZ24jWHP3VNTZ
	 1r23lnFwqkorQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <877c6ytd9t.wl-kuninori.morimoto.gx@renesas.com>
References: <877c6ytd9t.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-dapm: remove !card check from
 snd_soc_dapm_set_bias_level()
Message-Id: <173687253515.61795.2748491696120857053.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 16:35:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 14 Jan 2025 01:06:22 +0000, Kuninori Morimoto wrote:
> dapm is setup by snd_soc_dapm_init(), thus dapm->card never been NULL.
> We don't need if (!card) check for it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dapm: remove !card check from snd_soc_dapm_set_bias_level()
      commit: 41f1d2bd4998829341cdada022ede610068a0f33

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

