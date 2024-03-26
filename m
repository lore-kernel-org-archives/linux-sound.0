Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8813CF87
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466886; cv=none; b=BCH5b/iIAKhY0aQ2FLt+u4cK/JBPd0GN6WllhdVfGmKkbdCswXV0vHFj6maUnuQIUBV8iyD9NfqbNHvfZ6e1s6FGiAf4DnMjOdQ9EjkUCioBVrgzcEJL4fhiM9+muXqaDcp64OyBETQTW2y1JI+oxsrcisJQMm9nlIMpbKrp5uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466886; c=relaxed/simple;
	bh=lzBgn7ZwyiybdLLu+X2wmP2xnCrvaAQVXn2o2HU7zN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A9+gcCH5bb+iurDQyIlUChj5fMzYhQQjchaZf/RrwR6hzf98EqYELAfQzn92DiYYD6aWpRqNv9Kcu0jHgji2i9pmlbEAix2mlMpagP5zXU6O3zsmn3WjDOVEkvnaxQkMoEfpTfwYvqAfmTcKJnIGcIGDHvUNm3xhJovA/7xWEmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP8azZjU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP8azZjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9C8C433F1;
	Tue, 26 Mar 2024 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466886;
	bh=lzBgn7ZwyiybdLLu+X2wmP2xnCrvaAQVXn2o2HU7zN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gP8azZjUtAFvbpeGggLnOeqGuK6MAj9MU39KEpw8jyTWc31d4qp4btLR5+dE2yAM5
	 Zv2b0gAK6A3zXe6TdpUpXLNTR7MpUQ51gaNLDjFDRlnPz61JRdQkDK3KwRFJ2KyOZQ
	 mUqiheazvQnpedElRrXxIhkvfAhBvlG+DxUncgY3Iq0jeH8czSSkUIVwvPzMeb2JTv
	 o+bddfLPn8JPnLkkoUnwyb+TmKOlYCh/lttFAe6tljqXZqScjLW9F7vDK2FJI4ZYOc
	 +PoiWJsIu1XeF1nOp8PSRMo4LKMTaV/ngcNCLWQig1zEdI+Fcw1rQvNkAUZA/VaE6z
	 vvtCvc9bXpE/g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/21] ASoC: Intel: boards: updates for 6.10 - part1
Message-Id: <171146688503.132239.16717123597590309309.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:28:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Mon, 25 Mar 2024 17:10:38 -0500, Pierre-Louis Bossart wrote:
> We have quite a few machine driver patches, spread in 3 series of
> about 20 patches each. This first part from Brent Lu adds common
> helpers and board configurations to reduce the number of quirks.
> 
> Brent Lu (21):
>   ASoC: Intel: board_helpers: support DAI link ID customization
>   ASoC: Intel: sof_ssp_amp: use common module for DAI link generation
>   ASoC: Intel: board_helpers: change dai link helpers to static function
>   ASoC: Intel: sof_da7219: add rpl_mx98360_da7219 board config
>   ASoC: Intel: sof_rt5682: support ALC5650 on RPL boards
>   ASoC: Intel: sof_cs42l42: rename BT offload quirk
>   ASoC: Intel: board_helpers: support sof_card_private initialization
>   ASoC: Intel: sof_cs42l42: use common module for sof_card_private
>     initialization
>   ASoC: Intel: sof_nau8825: use common module for sof_card_private
>     initialization
>   ASoC: Intel: sof_rt5682: use common module for sof_card_private
>     initialization
>   ASoC: Intel: sof_ssp_amp: use common module for sof_card_private
>     initialization
>   ASoC: Intel: sof_da7219: use common module for DAI link generation
>   ASoC: Intel: sof_da7219: add codec exit function
>   ASoC: Intel: sof_da7219: add SOF_DA7219_MCLK_EN quirk
>   ASoC: Intel: sof_da7219: board id cleanup for jsl boards
>   ASoC: Intel: sof_da7219: board id cleanup for adl boards
>   ASoC: Intel: sof_da7219: board id cleanup for rpl boards
>   ASoC: Intel: sof_rt5682: remove unnecessary idisp HDMI quirk
>   ASoC: Intel: sof_ssp_amp: remove unnecessary idisp HDMI quirk
>   ASoC: Intel: sof_nau8825: remove sof_nau8825 board id
>   ASoC: Intel: sof_rt5682: board id cleanup for cml boards
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: Intel: board_helpers: support DAI link ID customization
        commit: b020aff0ec6ec089bd3e07bd6b58623826752ff7
[02/21] ASoC: Intel: sof_ssp_amp: use common module for DAI link generation
        commit: 8906d8663d72642b05108963a47a069b7a04b23f
[03/21] ASoC: Intel: board_helpers: change dai link helpers to static function
        commit: 3b6378bb8baf519e641151dcdb9171c2bdecb7b7
[04/21] ASoC: Intel: sof_da7219: add rpl_mx98360_da7219 board config
        commit: 54bac56954a7c36eb8d1c7047b63133635999eb8
[05/21] ASoC: Intel: sof_rt5682: support ALC5650 on RPL boards
        commit: 94e9dd5b38bc3d04f86c4a876f3b4b397add248b
[06/21] ASoC: Intel: sof_cs42l42: rename BT offload quirk
        commit: 109896246a5311aa05692ecf38c0d71e1837fe23
[07/21] ASoC: Intel: board_helpers: support sof_card_private initialization
        commit: cf22d15ecf61c783e6903f3409e78d439f9c9b4a
[08/21] ASoC: Intel: sof_cs42l42: use common module for sof_card_private initialization
        commit: 96258c3348e1a2cb6842175a0ac895ef3963f2e2
[09/21] ASoC: Intel: sof_nau8825: use common module for sof_card_private initialization
        commit: bfa8c0088f02440653bfdc7e72144302f2f5f22b
[10/21] ASoC: Intel: sof_rt5682: use common module for sof_card_private initialization
        commit: 8efcd48646526dc41dc54a5044b434cd8a139d82
[11/21] ASoC: Intel: sof_ssp_amp: use common module for sof_card_private initialization
        commit: 495d5b48d4b54efb4fa9f972f8bb599c780d209e
[12/21] ASoC: Intel: sof_da7219: use common module for DAI link generation
        commit: a8f408dc8733d83c1cbd0ff238fc90d8b43db1c4
[13/21] ASoC: Intel: sof_da7219: add codec exit function
        commit: a7963f6ecc4be8a331d7740cb276651f2045e92c
[14/21] ASoC: Intel: sof_da7219: add SOF_DA7219_MCLK_EN quirk
        commit: ed61b2ef5aa0036ef1dc593c191e762386a92cc5
[15/21] ASoC: Intel: sof_da7219: board id cleanup for jsl boards
        commit: 45728dc6df48118b4e49f5abac4de87935bfc255
[16/21] ASoC: Intel: sof_da7219: board id cleanup for adl boards
        commit: ef771be889f0e5e036ff54e4f0178b6eba177d56
[17/21] ASoC: Intel: sof_da7219: board id cleanup for rpl boards
        commit: 9ca54c3356f488e7800b6bcdbccb1f6de90e1621
[18/21] ASoC: Intel: sof_rt5682: remove unnecessary idisp HDMI quirk
        commit: b497654f1d3d95c37c8f2c6950047e022be04a2e
[19/21] ASoC: Intel: sof_ssp_amp: remove unnecessary idisp HDMI quirk
        commit: 16e5700644bda0d236288f17fd68b15a1e2e6f2c
[20/21] ASoC: Intel: sof_nau8825: remove sof_nau8825 board id
        commit: 2b384bcd2cb727edb5647692134f4eec2f0a32ae
[21/21] ASoC: Intel: sof_rt5682: board id cleanup for cml boards
        commit: 61cafaeab5bca2d3e6a68ee8fa92b5c10b8610ca

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

