Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D86C2BB3F
	for <linux-sound@archiver.kernel.org>; Mon, 20 Nov 2023 17:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjKTRTI (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 20 Nov 2023 12:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjKTRTH (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 20 Nov 2023 12:19:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0F7BE;
        Mon, 20 Nov 2023 09:19:04 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2594FC433C8;
        Mon, 20 Nov 2023 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700500743;
        bh=KdMpAjwTLabg6HzVjLeUzYXEVS5h+SXTPQxdrCJRAIs=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=MbkZ/8v3f6a4IWq1LjYkb+LgMt02kowAVS4nSrzE3iP4nIvKyGcF5Aseln0UQCdVG
         sWYH2Oe2W5tuV5Uxby/rzX6qgpbQ7xvJfwS/EK3x/MU/taTzrn3GZzVXtjKcOWTEa7
         dBrwGbPRqPBrCWhFmbTPQlIFgaoSrd9TSG9NSrIsZ/9pxa6ZyK6m7TXqQ0tBGo4m7M
         fxJ4mbBHxdsFtzdwK1+RiMbOEXyGziBFdujaUDUw9fXliyQKwUF73SUIBCp9xli9lH
         hnHTC60SSv02klKw4X15blN2kdL738A0y8NFEjSxqcLl7Oz7H1BUUojHS2b7VVLU8P
         8RMyaod0Hr2Nw==
From:   Mark Brown <broonie@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lucas Tanure <tanure@linux.com>
Cc:     alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231119104514.25536-1-tanure@linux.com>
References: <20231119104514.25536-1-tanure@linux.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Remove duplicate linux/of.h header
Message-Id: <170050074083.869901.16484540368376230648.b4-ty@kernel.org>
Date:   Mon, 20 Nov 2023 17:19:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Sun, 19 Nov 2023 10:45:14 +0000, Lucas Tanure wrote:
> Remove linux/of.h as is included more than once.
> Reported by make includecheck.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: Remove duplicate linux/of.h header
      commit: cac15dc25f416972f8dd0b6a8d74daa79dc3a998

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

