Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AC9C4332F
	for <linux-sound@archiver.kernel.org>; Mon, 13 Nov 2023 14:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjKMOFf (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 13 Nov 2023 09:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbjKMOFb (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 13 Nov 2023 09:05:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F629D79;
        Mon, 13 Nov 2023 06:05:28 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2037CC433C8;
        Mon, 13 Nov 2023 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699884328;
        bh=SDRkAHDc9itV6f8oK3mmT3NDiKoKnApjwxqUguLBXSc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=eQ39f0kfOVpu/qAfrUSSjm1/kH70Wjyj/nuLbKGQjmmxpZrAUk4atDwXMiHA8aNvQ
         9AX1Ti9j5L8+cYg3vAmMEjhlmzid81xcWJW74eOZjr7A3oJR6zWo3SWROpvNFBm3wr
         p8QUEdK9Q2+4frfLTj6U1vR0yWmJxKMtztCK42b9Jaj6kskprL4qRxraFhIQgZ/vMe
         my2VtyxAR+XtUu8s+f5pHlnKF9iyjLYXsVgcxLAV2ti/5THFhpakJNVpPBBGVM/Guk
         nK3JmHmtqyAV+ZlPQQvn/hF4QFNsXeU4mqpbO0UcTuIFJwwEpR1BEotN1urJiumaW5
         72PNTTxKhDcTg==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ryan Lee <ryans.lee@analog.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
References: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: use "soundwire" as controller's
 node name in examples
Message-Id: <169988432341.3280890.10229585948785487186.b4-ty@kernel.org>
Date:   Mon, 13 Nov 2023 14:05:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Tue, 07 Nov 2023 11:16:10 +0100, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire".  Correct examples, so the incorrect
> code will not be re-used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: use "soundwire" as controller's node name in examples
      commit: dc29d3d253f1f3513a916f0b4271569223860c71

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

