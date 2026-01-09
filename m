Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393B364028;
	Fri,  9 Jan 2026 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972573; cv=none; b=qLVrhzJQUXPmpRv+ykV762u5PisXCeUGDyURaVsocAnVK7sUqCMo4jFQ8pC5bVWDIEbGkv5kgU2jiI9Hvq7wykti7JIizYd9Pn4p20KP+79T5GT3mWdLQCLLs36Sh0E3390z0DaP3QCcrWyZTSNLHBx6SPdiODG4ouBhncbcbbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972573; c=relaxed/simple;
	bh=NlYorFcv2Q+BEfuuMX30J9QgbeghuMMo0rPhFdXFgW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nHKlAyy9X6v2U1BI0OlHarrT4QnyKYFLRe+elScSgzD1ih7U1MBAGyCmRQpKOQKXXNBX//H7DQM/6HF2oVNndAH9CyzjtFzCgCazURDWzzCIaKj2GddPiPq9MdNLQXzt70jrPCJhcx8u5tA7AU8IbdrnY5CNq29OkCtL2MV1eEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOmaQg2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOmaQg2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F0BC19423;
	Fri,  9 Jan 2026 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767972573;
	bh=NlYorFcv2Q+BEfuuMX30J9QgbeghuMMo0rPhFdXFgW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KOmaQg2uVSBh/uN7+KgT8X2wnpATZIzymTeQoKlAqsF7RiNxoB0Eg5w4SZHCcbJYN
	 O+5WxxuUO9BsO4u0gDzk33+JJ+qeu7ZRj63H7bUnZ8MpGFiL5FJyAyMBQPLfIrDXqh
	 L+B5xvZmFkEW8MSA9P4xes79nCeVSV2KErm5JVNJ68uhwUtJzmTO8SKA9ZOxvVFlZY
	 HJ6M95QpHb6C3lzuiVBSTGtPC5vCHYzRvFCFDfVtSAU5JEOZ0MRNZtjTHBqCKej+CM
	 AaF0wiIaqKUkBjN9CSYHVVtwIJdAloLgzzaeZFRkJ/5SrYlYl74NG97HsdEH2m39zV
	 IybjcU2u16pWg==
From: Mark Brown <broonie@kernel.org>
To: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260108154419.3580562-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260108154419.3580562-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: codecs: da7213: Move comma operator at the end
 of the line
Message-Id: <176797257125.63356.15317595390832925573.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 15:29:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 08 Jan 2026 17:44:19 +0200, Claudiu wrote:
> Move the comma operator to the end of the line to comply with the
> coding style.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: da7213: Move comma operator at the end of the line
      commit: 0cd9bf6a6d9a1861087236cc5c275b3bea83cfdd

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

