Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A181F2C50;
	Wed,  8 Jan 2025 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343126; cv=none; b=EZ4KT9c9t3xRAAei4I6rVyq8iEKbm6eQsjtK8TlGpnXxqqgD8Gnko3OhaDm+NHQ3OksUV9uytDWeTpAxC2zw2L+dgkZsTJxHiU/c9HAX08s6vgOE1Q8JVG9Kz7Tv99LKc/BhfOOplm51Bx1Q4QsRRGaLFmoUof2xmLiH7SG+1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343126; c=relaxed/simple;
	bh=K7Dz/MHfp+OvM2IflV2dsYIIkC6b2hyhvWu/FF3X4IM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BGteciRbIiz3YTDDd4nbv/AA4npyx5z0V6zABMv5yLZCEGmHLA6cUHkHzncLuJozhRu+TErdFVXX2P4JjMensBKmnjORz3uOKrnf2d7BJSd0IzmK3BYSXe3YpjvdtTUJSExx170oS7LlBxRniEoQdf3gWjnChecvXLXqOi9QWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scVjB9yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scVjB9yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B93C4CEE0;
	Wed,  8 Jan 2025 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736343125;
	bh=K7Dz/MHfp+OvM2IflV2dsYIIkC6b2hyhvWu/FF3X4IM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=scVjB9ygZK/TBS5Y9xh5f4qU8EGl7QcGnB4QQH5Zi9KAbXSGHSZfrVtOMJdffAH+V
	 tmhrX7DKwaFbyiGsPemrf5VMEPDRLmHGTI8L23tI38JCuTiPwF32ZjFZTw112yyN5l
	 dgoXQtQc5iGbjEYFEMM29xH/Og79SuSSlnPWksP3TT0Vsr0DtpwYmGdHA97bMsjylr
	 tyXAjBsrnkltqAsEAwxI6tg5BUNhob3F/No0ttYF/jZ66HVBV2XmvhHTUpE+X5n3mg
	 I/m59GF4zvE7KLC5L8vGwgMnbFXEllR06lZSkcb8SMIJjRPVB//4Azk5PSz/kwLGtQ
	 DczaftrRnohkg==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, oder_chiou@realtek.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jack.yu@realtek.com, shumingf@realtek.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20241217135921.3572496-1-ckeepax@opensource.cirrus.com>
References: <20241217135921.3572496-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/5] Expand SoundWire MBQ register map support
Message-Id: <173634312327.36797.11001679317293209356.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 13:32:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 17 Dec 2024 13:59:16 +0000, Charles Keepax wrote:
> The current SDCA MBQ (Multi-Byte Quantities) register map only
> supports 16-bit types, add support for more sizes and then update
> the rt722 driver to use the new support. We also add support for
> the deferring feature of MBQs to allow hardware to indicate it is
> not currently ready to service a read/write.
> 
> Afraid I don't have hardware to test the rt722 change so it is
> only build tested, but I thought it good to include a change to
> demonstrate the new features in use.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/5] soundwire: SDCA: Add additional SDCA address macros
      commit: 7b16e60b31202254c62a29f5c709ffb42684b6f9
[2/5] ASoC: SDCA: Update list of entity_0 controls
      commit: b21468e83b787ab31aa9df8f429d2ca61def0cc9
[3/5] regmap: sdw-mbq: Add support for further MBQ register sizes
      commit: fdd9ef3dce98e035d21c17fac587cb6e3c7706fd
[4/5] regmap: sdw-mbq: Add support for SDCA deferred controls
      commit: 5bc493bf0c37c157bf2eb364e55a1c6f8bc43a69

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

