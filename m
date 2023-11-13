Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1641AC4332F
	for <linux-sound@archiver.kernel.org>; Mon, 13 Nov 2023 14:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjKMOF3 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 13 Nov 2023 09:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjKMOF3 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 13 Nov 2023 09:05:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FE9D4C
        for <linux-sound@vger.kernel.org>; Mon, 13 Nov 2023 06:05:23 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D12C433C7;
        Mon, 13 Nov 2023 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699884323;
        bh=/NaN3JhhTLKf35ns0Tx2hua/FjlGBaju/kmmbE88Qng=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=je2fBLML9l0iiFDcvV13EtSB+5+EZpaOZSLolhDMyUZh8bDtB0mwJfe7UJkuvhoMD
         vQfTAGA/lSjEnS2PWclJw3NnJs8hLztfI1+luETZe3bQlwspOBQ+ft9jFE26DG+n3Q
         3VByj8qpDKlclWwMqjvwjd+92h4atrG729+d7NpJ9bDC52WuQxQZOy8tmaZ/i/t5CN
         tyDPyEIbA6bzrv8fLS9fIYtEYe3Wy458jK3eQTGEREIk7UQXvMpiyyEtFhY/tlJUXg
         IAtDR2IJ60b9doxF6UswlanSTjOyNEeBo2vHneOQBQSnxj+Xh7YhCtpsLSI0p1/tkO
         X6yVM0uoZ4q7g==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Syed Saba Kareem <Syed.SabaKareem@amd.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <e376a712-e0c6-446f-9e0b-c444dd795cbb@moroto.mountain>
References: <e376a712-e0c6-446f-9e0b-c444dd795cbb@moroto.mountain>
Subject: Re: [PATCH] ASoC: amd: acp: remove unnecessary NULL check
Message-Id: <169988432049.3280890.18390269348281971784.b4-ty@kernel.org>
Date:   Mon, 13 Nov 2023 14:05:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Mon, 30 Oct 2023 12:03:51 +0300, Dan Carpenter wrote:
> The list iterator in a list_for_each_entry() loop can never be NULL.
> Remove the check and pull the code in a tab.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: remove unnecessary NULL check
      commit: 601cc04c9d73ed728b29eaddb29ae13b48b03ce7

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

