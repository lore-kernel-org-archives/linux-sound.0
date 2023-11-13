Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDC2C4332F
	for <linux-sound@archiver.kernel.org>; Mon, 13 Nov 2023 16:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjKMQOo (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 13 Nov 2023 11:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjKMQOn (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 13 Nov 2023 11:14:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9594D10E0
        for <linux-sound@vger.kernel.org>; Mon, 13 Nov 2023 08:14:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006F4C433C8;
        Mon, 13 Nov 2023 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699892080;
        bh=krVHrXS5PV9CzkAfsNTg/W56xEGehy+8LPySVsIbTxs=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=TIigimbIoRuWhhm3Th4+fgA8yMzgiTe4VLcuRRKdV0SOlu7mmypkRkeJvnGPeS4ck
         Fo2eWhgE++fTHoC/3G+oUOyWNWCKpg5UizVYnwO4eg719cz07Sqbj6I9ck7v7bC7/K
         nkeah1evION4qUMpjW/SM5/DTldGFQFPsTC1N1xk2pPlmbsKrC8N4+5Ti6lv+QfK5z
         SmYcQ0JKqz2HVigFoI1udM8EaSIido8WUTI5wSAbdVTb6OogP1PZG5c4sUPkQssznL
         9YjHePPR3uAMlaeSg0E0s/F1nhdJ4mC6n98VavtZaZEgOxvcBnHFgGBSasPPkJAifz
         E+yopjB5pShAA==
From:   Mark Brown <broonie@kernel.org>
To:     =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/17] ASoC: Intel: avs: Properly identify boards
Message-Id: <169989207732.3289099.17592806378739900331.b4-ty@kernel.org>
Date:   Mon, 13 Nov 2023 16:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 02 Nov 2023 13:46:55 +0100, Amadeusz Sławiński wrote:
> Instead of using MODULE_ALIAS() to load boards, add proper device id
> table and use MODULE_DEVICE_TABLE() macro to create board alias.
> 
> Amadeusz Sławiński (17):
>   ASoC: Intel: avs: da7219: Add proper id_table
>   ASoC: Intel: avs: dmic: Add proper id_table
>   ASoC: Intel: avs: es8336: Add proper id_table
>   ASoC: Intel: avs: hdaudio: Add proper id_table
>   ASoC: Intel: avs: i2s_test: Add proper id_table
>   ASoC: Intel: avs: max98357a: Add proper id_table
>   ASoC: Intel: avs: max98373: Add proper id_table
>   ASoC: Intel: avs: max98927: Add proper id_table
>   ASoC: Intel: avs: nau8825: Add proper id_table
>   ASoC: Intel: avs: probe: Add proper id_table
>   ASoC: Intel: avs: rt274: Add proper id_table
>   ASoC: Intel: avs: rt286: Add proper id_table
>   ASoC: Intel: avs: rt298: Add proper id_table
>   ASoC: Intel: avs: rt5514: Add proper id_table
>   ASoC: Intel: avs: rt5663: Add proper id_table
>   ASoC: Intel: avs: rt5682: Add proper id_table
>   ASoC: Intel: avs: ssm4567: Add proper id_table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: Intel: avs: da7219: Add proper id_table
        commit: 59fff33e9d923779b68fe46f39262256caba71d6
[02/17] ASoC: Intel: avs: dmic: Add proper id_table
        commit: deb8dcad7bc3505881e2c0680d8f01f23fcbba98
[03/17] ASoC: Intel: avs: es8336: Add proper id_table
        commit: 9441450e171fc90aa3fceadae9728acf8bd0726a
[04/17] ASoC: Intel: avs: hdaudio: Add proper id_table
        commit: 9a872caede56d20564caf30d7ea7cf61b66f4060
[05/17] ASoC: Intel: avs: i2s_test: Add proper id_table
        commit: 8267213c54db078db091b778e904ec1af8fc6ee6
[06/17] ASoC: Intel: avs: max98357a: Add proper id_table
        commit: f1e9f4f5e9e5506edbd17b33065ec8c8a9e6caab
[07/17] ASoC: Intel: avs: max98373: Add proper id_table
        commit: 8e660f303230741ecaab561a30e123e7dc76abda
[08/17] ASoC: Intel: avs: max98927: Add proper id_table
        commit: c3ff01859c31408eadfd607352d4f87e52096371
[09/17] ASoC: Intel: avs: nau8825: Add proper id_table
        commit: c94643c2b416afc473541943291e61c453846a6d
[10/17] ASoC: Intel: avs: probe: Add proper id_table
        commit: 4a5403e3a75ddc24941f754c14c3299cc0e28fe8
[11/17] ASoC: Intel: avs: rt274: Add proper id_table
        commit: 54c830fd4e38261adffa51bb22c44a2e33d803ba
[12/17] ASoC: Intel: avs: rt286: Add proper id_table
        commit: 027ab0cab18071fa3476ffe7bb69ade551515ce6
[13/17] ASoC: Intel: avs: rt298: Add proper id_table
        commit: 3d4021f30abdb7cef51a901adc0dfc4d4ee98e9d
[14/17] ASoC: Intel: avs: rt5514: Add proper id_table
        commit: 389f3c6c7ed89d53ecd83e629b7e529630cdb96c
[15/17] ASoC: Intel: avs: rt5663: Add proper id_table
        commit: 5f249523d3fcf1fe28e567a17a3053ea7ff899a0
[16/17] ASoC: Intel: avs: rt5682: Add proper id_table
        commit: ba096fc618254918056061ecef32aa77c2fcaf84
[17/17] ASoC: Intel: avs: ssm4567: Add proper id_table
        commit: ca5abf5d2e1c3860382e0e33599e969cb9c9b42b

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

