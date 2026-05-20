Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69913E2AB0
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282732; cv=none; b=AO0EJL/wo9UX0Gb9u8P7alrrBX3ywPPR30jpIV7NrZjMp47dOI8bT2bIqwrXT5Oau7LdvmBw91SPbL8nONqteQmxx/RJWow8ObBBh58HvWJF4JYwIyeAFu6BezItroKCbAYMOQGrN3J4GCieE29rPjReTAL8HYx2Qp2okmnuXL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282732; c=relaxed/simple;
	bh=i5ptcbSmpyvs7ewoLDxW3yGxGLrP845TtwPnVbwvoxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ci2lAE3kGAX+p7nQeYVLOzPq22A0+4Zp7OtWDjEbYMcDJGYpRvkB0RwqwS67O+K32UGwsbc8qTcJsuhTV4IceUJ7jKXMxY2c8H/mPPaVbElq8bsL1e7lcBr4smdqk/rJXjsHSs5q8OxxdCYASSr5YwSCfiprPpKDw55UsxXp4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfNAoQ2M; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfNAoQ2M"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so3557177f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282725; x=1779887525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUsifWX6aK2jxqZvUw8q1yQUjx3vnN/cEOO8Ykzq3n4=;
        b=DfNAoQ2MZ1xPxwocOOcma82TSzVpJzE+FSJv71cqErdMxHYBR6E8Xf/hCkzFJzYPMw
         KVVpFl5tAplzgcGIOskmHebe3MMXqKEJpbdyqaliw3vq24iJAlpOCD8q++i08d1tD3MB
         KsKt29Wf6k92n4gAnFjLsS0qEFbVRN2h6rQFTq1CSwhZy2SSKSz8EgHd2JgMnfuDh3L4
         VRXByTJoE22Addj+mPUdOiyx2Bk7v3rbXtLE1yjh1x9MLnX8+yEHI0PcVF11DAR+UjGD
         Pa8xRTDwEfGEbjEI5gNfQb/uh2lz+nZ6bdtLTHGOpShpP/MGEMWUz3oae4hOxZc4jNjD
         2nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282725; x=1779887525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUsifWX6aK2jxqZvUw8q1yQUjx3vnN/cEOO8Ykzq3n4=;
        b=JqI1/LoZNZTqIBX3DZvbu3J6eZJyVjlsiwluF4mwA5mR4ho9gNUNnaAC15dEPHNu/r
         oK0vkYssDLQITQM58nTNI9KxOu2S7XnQlnEZW0g9DHrR7x3ZLhA/lEWsuyX+lf69q6Ah
         ZRDgTzDh+nrD/LUOgyLw9KkTjIBt/ecYknw/6ZqbSzbFyWvAFSqE3XgoeeXPM/MnaZxQ
         HrtVOdE4Jb+4MiHuvKeuwPPHsyDa6F/F1igFDctFArlRSlb1XDW4fob2Ey4WwSXnxSpo
         l6iconCt3Xa+8KJQ5AR9t0+Ph7KgatsRvyWMFh3Cqxd9ejeXyaGljEt4v34e8Bxbrq8c
         aGmA==
X-Gm-Message-State: AOJu0YxQUpT3epStMnDAvPyLl2DP0unbvAZjIW9wuZZ+v8KdrSSoxXwo
	DaVsKeyiE2aWa8BodT1rGV7QLr1dG0jAOyP3QsTenIPb6xlqv/m+p6Gb
X-Gm-Gg: Acq92OFN3ltfIF7e2HK/50m6ti8orAmOvThML43oC+RDaOIS8KLy/KGoDNcPzFZlHeJ
	c9nlzQ9kJHkVb/pBSFXP2JMoXYNgmM7D+eVzv8hVeDIHABA2g3d1kAx6TPoKf52bmFTNE5oEl+g
	HtCpB6EgmaNMAAvfzYSav/8L+dtwWsGE7AMN/VG7BBkLwy9/wvv7fgy2yXKE7rVHAVvzDkS7f3/
	C/oG1vq2nz56iQZpgpn2x0Gq9qHo827WE6WMUbefeyYJQNsYE5548PsSet4b/WgmknvUAG8es0T
	XX8SL2jgTFmexQKEkX5wleA1MgLw8u7RtlPXnxy5GzWw0GZNTQB6kT/siSb/cj0JMUTsgPmiQ0O
	+WbRQMg+ibLnAyELhknpw3khM6rx+U8PKMjPY7cPFFt5CA1Ntkt1M0F62o8M0ono+nMFaYqnOX+
	C9Ty/wl5R03d/niABvd6dTYk836PTTSvDuQsOItGScKu2bu4bBgeBpWYTdFK5poaI/
X-Received: by 2002:a05:6000:1844:b0:45e:98ed:bde5 with SMTP id ffacd0b85a97d-45e98edbeb5mr3627217f8f.24.1779282724547;
        Wed, 20 May 2026 06:12:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm56345921f8f.29.2026.05.20.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:12:04 -0700 (PDT)
Date: Wed, 20 May 2026 14:12:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
 support), linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
 SoC support)
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Message-ID: <20260520141202.1803aa7d@pumpkin>
In-Reply-To: <20260519010440.629290-1-rosenp@gmail.com>
References: <20260519010440.629290-1-rosenp@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 18:04:40 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> For whatever reason, GCC is unable to figure out that i2s_num is a
> single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
> represents. Add a min() call to help it out and fix W=1 errors regarding
> snprintf bounds.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
> index 5a2bcf027b4f..43157f218409 100644
> --- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
> +++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
> @@ -25,6 +25,7 @@ static const char *const base_clks[] = {
>  int mt2701_init_clock(struct mtk_base_afe *afe)
>  {
>  	struct mt2701_afe_private *afe_priv = afe->platform_priv;
> +	int i2s_num;
>  	int i;
>  
>  	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
> @@ -35,8 +36,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
>  		}
>  	}
>  
> +	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);

To me that is backwards, like an 'if' put the variable before the limit.

>  	/* Get I2S related clocks */
> -	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
> +	for (i = 0; i < i2s_num; i++) {

Caching the limit also stops the compiler having to read it every iteration.

-- David

>  		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
>  		struct clk *i2s_ck;
>  		char name[13];

