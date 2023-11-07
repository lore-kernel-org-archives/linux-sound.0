Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE39AC4332F
	for <linux-sound@archiver.kernel.org>; Tue,  7 Nov 2023 08:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjKGIbI (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 7 Nov 2023 03:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbjKGIbG (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Tue, 7 Nov 2023 03:31:06 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F37011A;
        Tue,  7 Nov 2023 00:31:01 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 772F566074B9;
        Tue,  7 Nov 2023 08:30:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699345860;
        bh=yKQJD7ZBKcHGUWXd3GzZKFwSDEFqn99afjMFFcXUvPk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=H+0nBzSe19XoVpVr9bCgr39Iajf6iRKPqjdGq6A8H4pSYZqIpM+XWP3mAQgK/Zz4N
         LGCTHH3czA+q6HGIyytlZt3SFEc2mQQ4AGpEib8j7oh9l+FW4kKv1HHDJVfxf41+BR
         /TR0W80lq7GhqW81Nl/uRdvRjetw2oT9mNdbNT1Vdv8aPfKKhH3Y2HKGVEvPhYbubY
         nze16TJlZyI0nwHXgxv5oLQR0hTIJLnFFzF2M671ejbIesIvbVgFPn7xeKlo616GLG
         KV2POp7SS2UOONs6wzmCWqo1+fp+uREC8XmgN89y+cFWM6qaEPb67C5pPc7vJ5I+Mk
         7IN6OqUK/8kmQ==
Message-ID: <9a30463b-3581-4738-9eea-b45e0c9a1d7a@collabora.com>
Date:   Tue, 7 Nov 2023 09:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 3/3] ASoC: mediatek: mt8188-mt6359: add two amps support
Content-Language: en-US
To:     Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, perex@perex.cz, allen-kh.cheng@mediatek.com,
        kuninori.morimoto.gx@renesas.com
Cc:     linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-4-zhourui@huaqin.corp-partner.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231107031442.2768765-4-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Il 07/11/23 04:14, Rui Zhou ha scritto:
> Support codec rt5682 using two amps.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Can you please change the commit description so that it's clear that you're adding
the two amps support to the RT5682s variant? As it is right now, it reads like you
are adding that globally.

ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188_rt5682s

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index e994faa3556b..917640939621 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -1549,7 +1549,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
>   
>   static struct mt8188_card_data mt8188_rt5682s_card = {
>   	.name = "mt8188_rt5682s",
> -	.quirk = RT5682S_HS_PRESENT,
> +	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
>   };
>   
>   static struct mt8188_card_data mt8188_es8326_card = {


