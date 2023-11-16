Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2451C197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 20:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjKPUWC (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 15:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjKPUWB (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 15:22:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AECB3;
        Thu, 16 Nov 2023 12:21:58 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C739DC433C8;
        Thu, 16 Nov 2023 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700166118;
        bh=wjXoEh3VBqOCq9Erb2+MVd6IMbkBhqkdvNaWxFU95X8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=pN0EtEBveWhquPmEaRGvMjWX4iIHLmt0eKMTmQqg/PHWG1UQv21e0sPMOGoyP+5Np
         xLZ/Dm3yxi8G3GJe3hMb3DfRPC/HDGcFtzdycjOn5m9aw7rdCBTAfHTTcjE8izjAYn
         FbqFNO8U/frCFFDuYnl2UrR4lDP432vZJVYXcO9j8J60MJONuTrCp6tay7l+LOEYXB
         BJHUA0H/n6yROnChtJAibs1xn/+mn2wPTY4o4okHyeWg7NqfYoZJ015dTFyN9di/QX
         kBfhbABFuQCUOgM5fiJFBa49+IqD5JjAO1x97X7QztkkzkioyMSvEO44i5o4q5FyJl
         Rds/S9VJfWFyQ==
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org,
        Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc:     Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
        Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
        venkataprasad.potturu@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231116053405.2574081-1-Syed.SabaKareem@amd.com>
References: <20231116053405.2574081-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: add missing
 SND_SOC_AMD_ACP_LEGACY_COMMON flag for ACP70
Message-Id: <170016611552.72344.2975187519248443039.b4-ty@kernel.org>
Date:   Thu, 16 Nov 2023 20:21:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 16 Nov 2023 11:03:57 +0530, Syed Saba Kareem wrote:
> add missing dependent SND_SOC_AMD_ACP_LEGACY_COMMON flag for ACP70 platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: add missing SND_SOC_AMD_ACP_LEGACY_COMMON flag for ACP70
      commit: 459956b17dd5cba06b0f2b75772497e46a59468b

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

