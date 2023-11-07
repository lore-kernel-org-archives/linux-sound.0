Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1679EC4167D
	for <linux-sound@archiver.kernel.org>; Tue,  7 Nov 2023 08:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjKGIbJ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 7 Nov 2023 03:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233748AbjKGIbG (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Tue, 7 Nov 2023 03:31:06 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A7411D;
        Tue,  7 Nov 2023 00:31:01 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BA8E466074BB;
        Tue,  7 Nov 2023 08:30:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699345860;
        bh=UnylclfTzVUGvBNhsNbg1AWvk76d91UX8f6YeykP2QE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=S0Uj+oSvu5NHNd3y4/Z6EXNktbAvLtolCm5rOioMMwgmZm8q6R8vQAPlU9FRd6ks9
         m161naKI5p7OTpHEc9YHfZtN+mSv31XAbbN9XE7J7CpCod6kCMCmf60L4lJ3ZOJRNS
         agxmNiqGjkQSoIITav8ZzNP9J7JGzpJLLuKqOSTFChesgL6g0LtQPQ9ePx6Uv2gpkn
         mxV7W5Pms9gjhzdLp5PLKJ5V/IhvIpXe+81DmZbAtAikzNyrWXhC94A/NlbIRELnjt
         re8FwtrASkpywmkk9Q9IXmt3/0aYlSGiABO+f2FdSrFK5H3EQR4uAmvjv5jN6D6cM8
         BK7ohCRBpagsg==
Message-ID: <f1990975-c3f1-4758-a718-f30b36743bc2@collabora.com>
Date:   Tue, 7 Nov 2023 09:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 2/3] ASoC: mediatek: mt8188-mt6359: add es8326 support
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, perex@perex.cz, allen-kh.cheng@mediatek.com,
        kuninori.morimoto.gx@renesas.com
Cc:     linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-3-zhourui@huaqin.corp-partner.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231107031442.2768765-3-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Il 07/11/23 04:14, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

