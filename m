Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465EAC197A0
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 16:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjKQQmk (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 11:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235563AbjKQQmi (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 11:42:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110B9D4F
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 08:42:35 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B3CC433CA;
        Fri, 17 Nov 2023 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700239354;
        bh=AKSfLOlfcLc2baSDoxZreUCl/cMyMPiua8siyDJo9uQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Yy0TjjCqjOGZ5XSTrsZMUxV9QfXgP30PO30Sw7bmUilV7CbvO++cFxNNCMQ6hRfNn
         3J6tIHokOY/Y0puVN4w4fgPUyrPv1JMmU+3OBv2CWklnPavp3SCecZTTg/AeRTgUsd
         IFlWA+JJ/pLM+jT5J3RLiWGRamb9t2itT+v8pTMMTYcEZ+Usgoutri6LqivirXKpaw
         pDi1wIyTT8mz/nOlgZRydJWUd6nlv9DXxdL14MJChUnetk+7fjIrj7wGOXdLb2NWNt
         yep2/peb4TZUbymqEzATJeWsQxGSCdzsl8f56Ggem4GN/8xvPxl/c+d/lNkhW3fZtJ
         1faOgnNW4YVaA==
From:   Mark Brown <broonie@kernel.org>
To:     Kamil Duljas <kamil.duljas@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116224112.2209-2-kamil.duljas@gmail.com>
References: <20231116224112.2209-2-kamil.duljas@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: mem leak in skl register
 function
Message-Id: <170023935261.1567036.18201018889140734844.b4-ty@kernel.org>
Date:   Fri, 17 Nov 2023 16:42:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 16 Nov 2023 23:41:13 +0100, Kamil Duljas wrote:
> skl_platform_register() uses krealloc. When krealloc is fail,
> then previous memory is not freed. The leak is also when soc
> component registration failed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: mem leak in skl register function
      commit: f8ba14b780273fd290ddf7ee0d7d7decb44cc365

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

