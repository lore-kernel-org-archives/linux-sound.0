Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184F3C4332F
	for <linux-sound@archiver.kernel.org>; Tue,  7 Nov 2023 08:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbjKGIbC (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 7 Nov 2023 03:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjKGIbB (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Tue, 7 Nov 2023 03:31:01 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D043FD;
        Tue,  7 Nov 2023 00:30:58 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F74D66074BA;
        Tue,  7 Nov 2023 08:30:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699345856;
        bh=ZMrrFLvLdqin6a1tq6YFP6vBhnFIzClUM0C0/GpzRCA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JgrbOsq9foxIZ+xviHYv/2qRAcRyjEel94au6B9XpJenVvERZbFVeEU3czhV3QSJa
         AGzHDWBS5T3DBsK7fT73N5oTgssoQP12SORYOtxNKWGYh41AioBVxiTqMT2WROPQG0
         dNw7Yser3cGFrb10UEflVyTEMVT3qrDW6cygsoB5OOzcvC1xVx2X1/RYzcNoeS2SBu
         6y2L1MSIxsjR5PA1wA6rzFYqsmtuzcrLQ17q6+DoffhdNhpzvWM5tTzWsfJyiXlvJ/
         NrEpqDWsTd28NSix6vgvUeuhV+y1akXoomDLoAHdDI3tXvZZbUbrflBaz+0R4yrFTm
         Ygf22Z1g0bUww==
Message-ID: <c64bced1-36da-4b31-b06b-c4313e893cd7@collabora.com>
Date:   Tue, 7 Nov 2023 09:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Content-Language: en-US
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, perex@perex.cz, allen-kh.cheng@mediatek.com,
        kuninori.morimoto.gx@renesas.com
Cc:     linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Il 07/11/23 04:14, Rui Zhou ha scritto:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

