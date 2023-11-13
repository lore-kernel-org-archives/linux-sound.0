Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEADC4332F
	for <linux-sound@archiver.kernel.org>; Mon, 13 Nov 2023 14:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjKMOFW (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 13 Nov 2023 09:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjKMOFV (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 13 Nov 2023 09:05:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95F5D4C
        for <linux-sound@vger.kernel.org>; Mon, 13 Nov 2023 06:05:18 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B4BC433C8;
        Mon, 13 Nov 2023 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699884318;
        bh=vTMYffes98zdDzbW5PW6PMn758Eh1TJV6fxNVpAjtjo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Rn9Aq9fXICUwKhugQRtPzzZbtIuCL67Jd/ESWpboiwsmI8SnebWLvgnt26IaT+hbW
         l4yFrAh/DXE3sBPvawFCFSCQ4SlHqgTN53pL+PmLh+ax7WJZjqcq29Q9TKIg5e7mN7
         Ytt0vn15BlGQJ1CBAkfRsDE5O8e8w2+CNpt0MD98AYGoykn+n7zoasFWjf6EOq7S4Y
         68Jah3/Nc1R53kr8hYAFwh2GFPal8V13XK3nzVjfiJ+6jRrUpcrtUhAGNLpMRBKYLU
         MjSAFRsJXISdYTZNS1trHsbS9Lv8cBx2ukjxONjAkhtWTREq0rVRqqeUEEAZumTtKN
         jjlFulqF28htw==
From:   Mark Brown <broonie@kernel.org>
To:     =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org
In-Reply-To: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
References: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: dapm: Simplify widget clone
Message-Id: <169988431615.3280890.12635214679835055069.b4-ty@kernel.org>
Date:   Mon, 13 Nov 2023 14:05:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 26 Oct 2023 13:35:49 +0200, Amadeusz Sławiński wrote:
> New DAPM widgets are created based on a provided template. When cloning
> the data, the name and stream name also need to be cloned. Currently the
> data and the names are initialized in different places. Simplify the
> code by having entire initialization in one place.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Simplify widget clone
      commit: 79323dc80318aab6c2d05abdbcf88f09b50522c5

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

