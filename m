Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CD7C197A0
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 09:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjKQJvA (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 04:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbjKQJux (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 04:50:53 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5FED8;
        Fri, 17 Nov 2023 01:50:50 -0800 (PST)
Received: from i5e861935.versanet.de ([94.134.25.53] helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1r3vUq-0003ER-7U; Fri, 17 Nov 2023 10:50:44 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v1 1/2] dt-bindings: es8328: convert to DT schema format
Date:   Fri, 17 Nov 2023 10:50:35 +0100
Message-Id: <170021461021.1221251.790740434324924821.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109184453.108676-1-sebastian.reichel@collabora.com>
References: <20231109184453.108676-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, 9 Nov 2023 19:44:43 +0100, Sebastian Reichel wrote:
> Convert the binding to DT schema format. Note, that "IPVDD-supply"
> got fixed to be "HPVDD-supply" during the conversion. This was
> obviously a typo in the old binding. The old binding example, DT
> files, chip datasheet and Linux driver use HPVDD.
> 
> 

Applied, thanks!

[2/2] arm64: dts: rockchip: add analog audio to RK3588 EVB1
      commit: 97c39c7a0965b3eba87baa2b7d51443a46e21b8f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
