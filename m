Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C526FA4C
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116555; cv=none; b=FWrwlMuWU5HxXx/FVtILJu3CKGcye+EUlOY3ruMrbw/I6WJYpJeWCbZ/0vshZpZt4XCSNq4rQQ2XwH9hIuGcJ2rftdVHLje6/LfFnityAW50PnmqsCKsZPcCk0j19CwReuEv40ndl1A2rbMZkFpU+Lg4Smxq6/8zrllZvouaf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116555; c=relaxed/simple;
	bh=PEIRIOJnZElDhlTV49EogU8DtR9iYUyuZoS3Qu1ap7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JzGH+4TVhY+roYTdwtyvaDsJe7qI7viM0gYHkl4z18vR5L9wzR8l46qJYy4se5hUaA5cin01Y2jjFcI2ML1fkqjghZfrzNQlq/Aa729JRxrXv+jE5RjSihKCP300cUw6K+upwG1t6ALQU70NrFWgbS40c9onfNWcVMk9ZLTWID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIWdT9Q4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIWdT9Q4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2F6C4CEE5;
	Tue,  8 Apr 2025 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116555;
	bh=PEIRIOJnZElDhlTV49EogU8DtR9iYUyuZoS3Qu1ap7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qIWdT9Q4wKpKWgHln9Vet2U1wncTmdrvpPPAj9scwERSljw6zFHm/RXFi557JlrO9
	 lqt+FsGgawIH1UfAD6zddfVhwM8aZ835SNTYe+E7w2++wo4nyyPfNBeNzR9F/vP9/4
	 WfzExqehWKQ5CGtWKZ6Jahqev5RlRPoTlcNuffV4kr36uVOyQ5N+PNTQhP9kJAJ5gu
	 qYARvBB5KGcV4jXG4PgBRGEGQtH0fKEd9UB21Tz/m1ffofe0cqHgkLKKWITw0woN/9
	 8J7TsMffb4gIGgQ503LpAj7oMFowI+Qpiucmaamvg2/ZX7whrWKvppbyUQqH30RTpT
	 ldMmabAi4ENhQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org, hdegoede@redhat.com
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: avs: 16 channels support
Message-Id: <174411655411.2091760.14626614465803803196.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 04 Apr 2025 11:03:29 +0200, Cezary Rojewski wrote:
> Relatively small delta-wise patchset which raises max channels supported
> from 8 to 16.  The existing limitation is software-based, not hardware
> based.  The hardware, as per HDAudio specification, section 1.2.2,
> (relevant register at SDnFMT, section 3.3.41) supports the
> configurations for years.  The avs-driver becomes the first consumer of
> that configuration on the Linux kernel side.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] lib/string_helpers: Introduce parse_int_array()
      commit: 83b9ae77f06607d19f7d3dcc6008742051137b27
[2/8] ALSA: hda: Allow for 16 channels configuration
      commit: e6b9c7f5a32b3bde4e24ee74c0d4f954ce086272
[3/8] ASoC: Intel: avs: Rename AVS_CHANNELS_MAX define
      commit: 87bcb08710160bde5712ca0d24c505074b7dfafa
[4/8] ASoC: Intel: avs: Allow for 16 channels configuration
      commit: d360b713727db0093fe9a8cf475d1d536075c12f
[5/8] ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
      commit: 7d859189de13f06fdc511761c745f3b302bed7b6
[6/8] ASoC: Intel: avs: Assign unique ID to platform devices
      commit: 79138dbff53ab0e9891ebdfce8d7b298c3783cd1
[7/8] ASoC: Intel: avs: Iterate over correct number of TDMs
      commit: 6a68cbe09e9a7dc9f53857510bee1bc34bdbbfd9
[8/8] ASoC: Intel: avs: Support 16 TDMs in dynamic assignment
      commit: 8d18e67abbdf380cd1cfd2c313aac625092d7777

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

