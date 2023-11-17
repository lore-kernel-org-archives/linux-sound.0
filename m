Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE737C072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 16:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjKQQmk (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 11:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjKQQmg (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 11:42:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D46B194
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 08:42:33 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB21C433C9;
        Fri, 17 Nov 2023 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700239352;
        bh=gvJ81MvIpofL5H/zrzey3dRIS2kxO6OQQG4fitsei+4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=pNZbRl4UhAhvUKyP1eQt6PtXJUe7hzwXgLhAhEo9pDRJxa6fT0fIdfRvRmAcDz6Id
         3JU8Hflm7ZYwpq7hk2+10/lFEM7QUyqfYR6+n4IvQMJF08QE92G51zIHqSiklfqmli
         Z5CcXxaUI6XD9qqzJsBlIs2FM6HVx0VADn7OjPIM0awGGbv7DyM3gv5KUDOy6cdL1e
         C+D/Op3DsQwk/IAjxtrpWru8YsBdDNkzPcycZoVOwq3AScMZmzX+kXsmhuy3tnTC4z
         ioR0yJuxeN2Mmnl3LzLBshd2CjVcwfKwwJ6ICQwBgkOScVx64vdYshVyPDWgIqZWKX
         Bbxx4IhC85N0Q==
From:   Mark Brown <broonie@kernel.org>
To:     Kamil Duljas <kamil.duljas@gmail.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116213926.2034-2-kamil.duljas@gmail.com>
References: <20231116213926.2034-2-kamil.duljas@gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Message-Id: <170023935005.1567036.14058330217835865666.b4-ty@kernel.org>
Date:   Fri, 17 Nov 2023 16:42:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 16 Nov 2023 22:39:17 +0100, Kamil Duljas wrote:
> The function has multiple return points at which it is not released
> previously allocated memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
      commit: 31e721fbd194d5723722eaa21df1d14cee7e12b5

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

