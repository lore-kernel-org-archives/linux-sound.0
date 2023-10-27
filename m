Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9702CC25B47
	for <linux-sound@archiver.kernel.org>; Fri, 27 Oct 2023 22:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjJ0Wyw (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 27 Oct 2023 18:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjJ0Wyv (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 27 Oct 2023 18:54:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3E4E1
        for <linux-sound@vger.kernel.org>; Fri, 27 Oct 2023 15:54:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE671C433C7;
        Fri, 27 Oct 2023 22:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698447289;
        bh=wWVqTphYSgMZ/+ta//p33X1HYKf6U7khb+plIGgPt7A=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=gn52L1Y1QH7NexYb40VnResNfHYmaCdgaXUUyllsBBbd2jWJqwUd9AobbhDxBovHF
         uFQYPRDDcQUMjNlQQgFBRtMfptV4futGvZlgD5VnNKft5WIRx/X9icknZYauTvzN/2
         hH2/TvTlfsJlVke1/bj9WIkPDfycEca06geoQ6/I2B7OllLbWGd7Rg65HXxu7l60VB
         thZP43Z8UIMBIJd0xBl4jUiV1jeyYykFqVKkD+Vgz//jtHorfIiXSYMnBzsWrs4c39
         /eqbZpnaceu68HB2aEYZlGgoQWkDFioG59gJ0CxqKrf7n6diPXXlF6qIvVxs461xje
         +veStwNNdDvuA==
From:   Mark Brown <broonie@kernel.org>
To:     =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org,
        =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Add support for rt5514 codec
Message-Id: <169844728737.3013518.16736299523992907038.b4-ty@kernel.org>
Date:   Fri, 27 Oct 2023 23:54:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Fri, 27 Oct 2023 13:05:35 +0200, Amadeusz Sławiński wrote:
> There are machines which use codec rt5514 as DMIC, add support for them.
> 
> Amadeusz Sławiński (2):
>   ASoC: Intel: avs: Add rt5514 machine board
>   ASoC: Intel: avs: Add rt5514 machine board
> 
>  sound/soc/intel/avs/board_selection.c |   9 ++
>  sound/soc/intel/avs/boards/Kconfig    |  10 ++
>  sound/soc/intel/avs/boards/Makefile   |   2 +
>  sound/soc/intel/avs/boards/rt5514.c   | 187 ++++++++++++++++++++++++++
>  4 files changed, 208 insertions(+)
>  create mode 100644 sound/soc/intel/avs/boards/rt5514.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: Add rt5514 machine board
      commit: d933333694a7e63b0893d23f65b104430a1d6cf6
[2/2] ASoC: Intel: avs: Add rt5514 machine board
      commit: d933333694a7e63b0893d23f65b104430a1d6cf6

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

