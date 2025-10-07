Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC62E8B8E
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856604; cv=none; b=ksilDOGqF9wCaghe6CA6efaUkevA+1evzzrtCrk+Zp6eBULNYAR7qA5i+FYj1mTCHryhThD1cJlQpXGWC09kwBnnr9CBDqFvv2Wk9YZ6qSYG4VO+IkoZUP5aVaqxLiAO2fUEo0v0aDaEXB1niWREu5gGo3JggpWf7FfFNa+t9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856604; c=relaxed/simple;
	bh=I2VO0DXl+sCNR7nUBk2guHsudIm1VtkLy/0VDZgZSWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TSfx+NE8BfYDkZFmi3R+9vTvAlVHDbDGQP3p3WrhNyLPB0eAxa1h3HhDG7dTf13OsP7ItFwMnr16Vn6Hd3SPvC99pCgGZarkxzs/aYl0JOXkkgzLPATb358xLf3T9yJTNz4XGhzAYn8IrIYy0QpT70Ir7KDONuGXixkktJC+yso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXfwhR+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXfwhR+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE674C4CEF1;
	Tue,  7 Oct 2025 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759856604;
	bh=I2VO0DXl+sCNR7nUBk2guHsudIm1VtkLy/0VDZgZSWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RXfwhR+K6ELeQrj5jWOz/lPtM0x+9vpTFPk1G3ClRVEK5aIClgYc7AQQuA+P17fVt
	 lPEAMjzRbzG913+etDiIth5grFxEmj8b0vvfvCGTKV/M92oKtb4dJm5qSOUYpln4hw
	 ZtzfyvJmADpKuEdglGn6oKtTsU1biodQL+1BB0iaZ98755o+DVFwsTNT1GONRoniGr
	 mbOX2kICv8+KGUG7cfujLcv0SSioA/6F0I4dfhObDatoPxJEIQqAgLtCpHVxQDhiV8
	 sS9xrZRED+iJZg4XQoWjGH+NYxtIyfWuSTyhok6YMLpFhmHm5ZTpRSh3sSZlFkzx/i
	 NSrvFzFsTbMPg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20251007080950.1999411-1-shumingf@realtek.com>
References: <20251007080950.1999411-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: add settings for rt722VB
Message-Id: <175985660252.122025.14252227522632632655.b4-ty@kernel.org>
Date: Tue, 07 Oct 2025 18:03:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Tue, 07 Oct 2025 16:09:50 +0800, shumingf@realtek.com wrote:
> This patch adds settings for RT722VB.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722: add settings for rt722VB
      commit: a27539810e1e61efcfdeb51777ed875dc61e9d49

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

