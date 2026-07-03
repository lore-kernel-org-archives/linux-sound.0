Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0D036E498
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065545; cv=none; b=ZPSDKmuN0SIIC2avqsuCSH86kuGX9a6pWbOT7W+OReCTkUTUUwaHmF6Im7ksdQ8QO/LgZ1u7YFMU/71UP2IV0AXSuJ2Jd2DdhfZ9aYbWYfe/yfAqc/Xpv4iT5nEXL81MtyZ0gMF0hKUhaNsqMG4Oz37+vxHjsePrfbJHltxTVXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065545; c=relaxed/simple;
	bh=anyS8VtMUVw9saVmNUWxIEx6o2o9RH1ILwD3t8+boWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=opK9MAybsH3koKWvR5IZZiiXkWFO8wms7+ydPcqJu5JPKaulv/iI1cJ4JqkstaHasnHACHMM7JSnSU1l/NuKJdHDCTIlUfrhWG8lAi0RHEjBCYlUgq62ugE/Wiq+VtmZ6JJDpkqbvVBUXKgeos860/irIv9NPnuyeT1EW8+gx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=W+pGbZYD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="W+pGbZYD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-475417f010dso151887f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 00:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783065541; x=1783670341; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zqjm78soCzOZsah5k4plTO+J9DTAjqlcZkOG5zlqAcQ=;
        b=W+pGbZYDhpY0He+Ntw+VxXjBx1WkZXrHHKUHOeKBs77L2p4uwBj/xalHNQf01pYAo2
         teKgI6DcYtEVNs3ulldN5KOM5AnlfD8FJLIsVpj2FNHrNTZLhM1VBxivlv0k4RsuJoxd
         6kaeyQiKWHSVXY6a0+OYiVK7DcNpIMJC1OIEO2RqdG9q8Hhn/tUTSFoMbUMgI2F59Taa
         PqwhWlCVpHPnDAR1i8rpS263QmQztpF/ol7nQHqay9wumsxkQcF1RrVWDVRUfl4bdOP5
         UV5rhjMCgiNVn0FfUoFyflLHqjajcF7DsEFaPrNZyFVzL9My5LAfVnzSlZsy1CYNlblu
         fZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065541; x=1783670341;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zqjm78soCzOZsah5k4plTO+J9DTAjqlcZkOG5zlqAcQ=;
        b=l6y9wcWgLc74+VcskXN8tJigzQRAGxil0ZJ3dkNB0QgIati5o/hxhwFy1SX8L1x5I8
         aIZu9i9Abr+SZ5WUB8s9gAMc/ZC+zrslOXR80Nmd0AU4rronCfDRiOJ5tNTwR/S8ZpkN
         jp+j3qGx19LztGYd5Ppfu7XHSsLDje5wV7sMkRhXaI85PN9eBPLPwRAsUQu3NGTbwJ+M
         xsdca+KJszqfel9waNMU9Uno+2SZ28f8BMuZ0ndgHkul92xWpawWAkgiuWrbPiNfRkpI
         o6iSmBr+jvxvgmRllmGi2P5uyQqQLTc6aRhNQN1Bvf/u7btBwytAdnmqK2y6Mxd5+9RL
         HNzw==
X-Forwarded-Encrypted: i=1; AHgh+RpSUd2o2J+GHEjL47p6z4+otAk33xRA6paHjaLZ50PTqHRR9S6qt9DmiKjS15/BaFiOnVvPz6CmckHThQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytrae9jlMwSTkWcFcW7XmvMMKG76MTYsRBjZUKtQN1GjUfqYDd
	Y4yaR1TEfHAHuVC8MYWMXRWHdsSYLzAngeNl2GjQwDGTTS9FgIFjIjABJGn13Qfrmco=
X-Gm-Gg: AfdE7cl6qakzx+W8HzIFsFZWSzdGkdfUrXPwaExdt5CJRE3Gyi8fZ9Dr6Qnw1qNt/jG
	CxBharKM9+XnAZyG8wUzmXX/qg9FI+vCQG1H0DsUexQIS3j0/lhtkn+c8jcW81FqnDdqbrTCDc9
	Vw8seQ4xJuWihk4p0FGyjCrGOjNHdTCtGvGLqim76G0/MMoN0ni0FBpIgPGI09L5O+G0aRip/rN
	INP6i00b4+Nlb8oOQsmJLiznnEfnfKcEmaOKqjjKDsx2rjFef+bqL+7ky0B4VAPTxPY0O+GjRLg
	TG9ptEYcDDFWGJZuMhIXIvNr9xKU6dbFukQkZJUsTtAURntUZNnBSHHPfz7OlBhp+OVydWmQPqS
	FTMZWDdv3b4gm/eASp/Pwuqn+QmtqTEIi+T8krjBCxtfXdsfwhCuQpNtZAhPHtuymWOBRztZB7n
	jQc/c3wTnq8bVZNHK84HNklA==
X-Received: by 2002:a05:6000:2310:b0:46f:e796:c3fc with SMTP id ffacd0b85a97d-47757c6d1e4mr14250190f8f.25.1783065541604;
        Fri, 03 Jul 2026 00:59:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fb6a:cb8b:b7f7:bb42])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477dde19fd3sm16565369f8f.25.2026.07.03.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:59:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset
 from prepare
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
	(Valerio Setti's message of "Thu, 02 Jul 2026 12:56:41 +0200")
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
	<20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 03 Jul 2026 09:58:59 +0200
Message-ID: <1jfr20ijwc.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 02 juil. 2026 at 12:56, Valerio Setti <vsetti@baylibre.com> wrote:

> 'aiu-formatter-i2s' already performs the very same reset in
> 'aiu_fifo_i2s_trigger' for all relevant trigger scenarios. There is no
> need to duplicate the operation in the formatter.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
> index b4604734fe88..cb554c2e7ce4 100644
> --- a/sound/soc/meson/aiu-formatter-i2s.c
> +++ b/sound/soc/meson/aiu-formatter-i2s.c
> @@ -13,7 +13,6 @@
>  #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
>  #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
>  #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
> -#define AIU_RST_SOFT_I2S_FAST		BIT(0)
>  
>  #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
>  
> @@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
>  {
>  	/* Always operate in split (classic interleaved) mode */
>  	unsigned int desc = 0;
> -	unsigned int tmp;
>  
> -	/* Reset required to update the pipeline */
> -	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
> -	regmap_read(map, AIU_I2S_SYNC, &tmp);
> +	/*
> +	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
> +	 * trigger time.
> +	 */
>  
>  	switch (ts->physical_width) {
>  	case 16: /* Nothing to do */

-- 
Jerome
