Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA7FC47071
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 08:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjKPItM (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 03:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbjKPItL (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 03:49:11 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9B81B1
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 00:49:08 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 914AF6607340;
        Thu, 16 Nov 2023 08:49:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1700124547;
        bh=euDkFNtGvQr0sz8e9BU7mvYiyCJF/bhThXtK5d4f/U0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QTnSh/9P2TJ2dSP8Vg/VWZgd327u9ezjnrnwos2+Sefk90WjgR3Tc0lKRjWMZoJ35
         80v/X8gEtsQ0/FeQhTSBic47mAGTqkTFvJ6xttDatzbvre6lFkvw1WxC/zk8780Iuj
         o+LSwX6hlb9dFtj14oyWg41jXpg+TSGjhscfJcjN6XWXjfoqjOh9v4OVgevi7TUhZK
         Obqt23wCEUXFvSPJs6X1dZ+cSuBpURnrOL4bY80eLoAF9VZKOba4hv1/Hyh95LtQPG
         xI5HHiVg0Mf+PaaNyg1Xy650YSdZ51N3/2b8QYF7qDY6XABLSTUeDDtGnWvvnss+D9
         rHpkF8QX5uEwg==
Message-ID: <0876a85f-cb17-417b-9471-9112c51208d8@collabora.com>
Date:   Thu, 16 Nov 2023 09:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Content-Language: en-US
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        perex@perex.cz, allen-kh.cheng@mediatek.com,
        kuninori.morimoto.gx@renesas.com
Cc:     linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
 <20231116073106.3757618-4-zhourui@huaqin.corp-partner.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116073106.3757618-4-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Il 16/11/23 08:31, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


