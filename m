Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF322F751;
	Wed, 21 May 2025 16:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846193; cv=none; b=l4gMCu2q5UeApU3lqgjHsrayD8gEfRtiZ1u1vEdPqVDjMg/sVkkwE65jSCqgBd/e/o8b8LC1KKgGodm4KFVN3V3xo1u8q7lo6FN+JVsmYTdh2VA8ro7Wtpi3yT/eTGXhRynN+di2R63ioCSKZqeVNaxnEj+GXU8eD3wDOYzyRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846193; c=relaxed/simple;
	bh=J2k4aFUiCix93fo+M8JjKUZ0S/vmdUiTRsDkWf9ChqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IJJOMfRHnfwq+sn9Pcj6I0nbL3MDdDwfVI+bNJqYtYqH546KsGHnlGVEE9bjAlkDpzyuCJ4wZLYNTMXOZ9oZlRGDGzn3nSbYcJDO0FEOJDL8gV4GnCOnJ7mRncSriy+WR/5jPdSrwuH2Rwj86hAEyKO73d09mFVHzPoiXjEG9EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuWbDGxV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuWbDGxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3139C4CEE7;
	Wed, 21 May 2025 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747846192;
	bh=J2k4aFUiCix93fo+M8JjKUZ0S/vmdUiTRsDkWf9ChqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SuWbDGxVnKJVit73BlaOgbg5USpN5mvC0myqNR7qCGBmZgX06X3NwUCIHwPHgT9iO
	 6NrtEzww6cGEXyaWJEFbVHG+U21T1xS8JJS8MjZQq0hYR6ZWKNHoEVxSI5wiZTTwDF
	 EOVl2/RJDehjs+p9UsEudwFEnU6KlMjP1Y535ySm5aEAQrcn6yB/DRSElY8GF7s2G3
	 Xt3amYCW61EHxURNJaHaMQAb3kl4HodaAFCUY6CupVc/VSruq2Gx90n0EPG0WuNgHd
	 7jFc8xc9SYMnJYBoPfYBBkF8jQOLGeEmqnTPkXdIpPGC2jCdeI1x4u+dM8DVR/6jk1
	 m2CSqSYecjC3g==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <877c2kaxn4.wl-kuninori.morimoto.gx@renesas.com>
References: <877c2kaxn4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: audio-graph-card2: add missing
 mic-det-gpios
Message-Id: <174784619171.170401.5751278061377405367.b4-ty@kernel.org>
Date: Wed, 21 May 2025 17:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 13 May 2025 23:39:27 +0000, Kuninori Morimoto wrote:
> The yaml has "hp-det-gpios" property, but Audio-Graph-Card2 can handle
> "mic-det-gpios" too. Add it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: audio-graph-card2: add missing mic-det-gpios
      commit: 15c2b04abe863978e23ab97d1055638ad631475f

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

