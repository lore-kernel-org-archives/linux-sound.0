Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0152326942;
	Tue, 25 Nov 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085085; cv=none; b=g2VqDXtSvGvD1vqWc7JEz5yiOR74w9mN8CFhImBwj14rSaHKuxRZ5uUc+LKTA3BSDLITnbwOGpilnTgvRAue7XYcUEOnn9FXX/V+BX0zufXv+5YrS+lwU5dRipZxD5OSTQvks6TF7EEBeaLmA4OVYydb1YHL2e/ArQqTybY8Wpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085085; c=relaxed/simple;
	bh=XV8rQlegT+PlHdM2A+98t77dYhnjg6XzWzVJ7wnmqIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fQw64Nu92vZLF8vwRtQa0VBzaECSJeGIFseqfkHBM/7FParNVDd6npvYPgTRFULIUCVRf0lq6uLvPDKgoBXCDweiPGCzoTi8TuVyNmtfkLV6ImE/OklzJkTuy1qq8FTzqZWDZ9IDcfNjounsP1UGza3DCjmwYtcw466O+EApV8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIK831tZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIK831tZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E66C116B1;
	Tue, 25 Nov 2025 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085084;
	bh=XV8rQlegT+PlHdM2A+98t77dYhnjg6XzWzVJ7wnmqIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tIK831tZ8inFenPgfSL/aLHh59DGk5OakYlm76KxJu8r+5MDAn7+m2HUgRYL2i9mO
	 5rUjDKce5gys/p4Iv/yOxJ1lRmCrNpP78TpqqGTMepTKcELro0Y081/AgUH3soTlCg
	 O9649MHZYwfLp9/rkC/NYwpN68yinbRetYW+jdl06FqFmxpZAVtRRIXYB0avDrbgDJ
	 ZyA79R3Evn8GFihumXvNNqHCacwuGR4Deq9WsQ2F5kX/aM7s7GwAljhbRujqI/Xi4x
	 5DTq4GpeaMYA4tbS9RoCf1I0wmcqlTPrVYlUyAivfubpE68XJg0QkMrFBCyO3j3iXW
	 CeHOjshuCCW4w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251124171536.78962-1-rf@opensource.cirrus.com>
References: <20251124171536.78962-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Store control length as 32-bit
Message-Id: <176408508374.37186.15698361451262080935.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 15:38:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 24 Nov 2025 17:15:35 +0000, Richard Fitzgerald wrote:
> The architectures supported by this driver have a maximum of 32-bits
> of address, so we don't need more than 32-bits to store the length of
> control data. Change the length in struct cs_dsp_coeff_ctl to an
> unsigned int instead of a size_t. Also make a corresponding trivial
> change to wm_adsp.c to prevent a compiler warning.
> 
> Tested on x86_64 builds this saves at least 4 bytes per control
> (another 4 bytes might be saved if the compiler was inserting padding
> to align the size_t).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Store control length as 32-bit
      commit: 7584edf15892e29190b2145294cc1680aa142586

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

