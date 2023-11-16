Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA30C197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 08:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344935AbjKPIst (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 03:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344538AbjKPIss (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 03:48:48 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AED6A1
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 00:48:43 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B2026607340;
        Thu, 16 Nov 2023 08:48:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1700124522;
        bh=jLkSPIyvqaqQkTZh8S9BrSzwjIq40hrTZ/FEznVehN8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Mh5D2d6zWxfI6XpI2UjcSmUbhmKiTzYU4PAkRsggPwagPNpO2UlAH/P8A6BIEAaGN
         +p/hLsx2t88cR17V/4czd6Og/nHBaCaVrv2YXETZRygOFsh0tReqqqdYp/Jp9GI2vc
         uyNCWuWGqKEHtcRfjTWfvY8wAg50371/TvOP3wtTlRGMPE10IveUHAMGx3+pT7ZoOn
         65Z+m1NrVQV/7h0i2oi36CkdKbpj6JJg0gAqsrMb6MMetDZ+umVfV0W9VJRB+zAo1Z
         K4moEI60zB+2OcLH60aXclciHGSyusoIgvJfG8Y87eewaLaKjx/RZ+LRE8jgQf7h6y
         7ksDBnRYhUXUQ==
Message-ID: <83da1819-15bd-4592-8713-e94978121335@collabora.com>
Date:   Thu, 16 Nov 2023 09:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset
 codec init/exit api
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        perex@perex.cz, allen-kh.cheng@mediatek.com,
        kuninori.morimoto.gx@renesas.com
Cc:     linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
 <20231116073106.3757618-3-zhourui@huaqin.corp-partner.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231116073106.3757618-3-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Il 16/11/23 08:31, Rui Zhou ha scritto:
> Reduce code duplication, unify the headset codec init/exit api.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

