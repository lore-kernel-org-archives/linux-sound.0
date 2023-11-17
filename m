Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF5C197A0
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 16:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346102AbjKQQme (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 11:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjKQQmd (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 11:42:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788171AD
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 08:42:30 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631E8C433C7;
        Fri, 17 Nov 2023 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700239350;
        bh=vR3uWfFdmcTqknAhj665hhwb75ahVLwMGwOTWz+mqiA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=IrJt3fQ0nXcfnrNmW2Uj30ukQt7ktbgdFg7H4qBoebxCWWA0uSey8dCmS9XhN6kb4
         PXBTMad5KsyfJhXMaSH902JaSYMkXzuNZrzHcYyr3FdvkXoqNDb8mLX43RU9mwVHZW
         TPpBdGmkRVFxfdbvNN2oFzyh9yKKbxks9F6zmSzprZ95ap+QeIHhAloKoPmaYuqEfC
         vRXgTU98jVdg73bG4VzUjOgyF8wjhGbEm64xEy9D0JREHjuXZx7FYGCMGS7dS/YFTa
         OPmoe2dbB2PwYOZyHtT8PMYNUerEp2QzYGnlcxISrGxfF7zaA2lGQOer6ihw7w4ZtT
         F6vMPVYVDDjPw==
From:   Mark Brown <broonie@kernel.org>
To:     Kamil Duljas <kamil.duljas@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116125150.1436-1-kamil.duljas@gmail.com>
References: <20231116125150.1436-1-kamil.duljas@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix mem leak in few functions
Message-Id: <170023934782.1567036.11109294313039417080.b4-ty@kernel.org>
Date:   Fri, 17 Nov 2023 16:42:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 16 Nov 2023 13:51:50 +0100, Kamil Duljas wrote:
> The resources should be freed when function return error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: Fix mem leak in few functions
      commit: d5c65be34df73fa01ed05611aafb73b440d89e29

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

