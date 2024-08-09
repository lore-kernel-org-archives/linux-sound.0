Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43618DF93
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192150; cv=none; b=oQAtOHMsRIBeV5cFFrGgaB9hsHV7IW/VK1VibL+yuwufhKmi4+LLFyPxJmPXYjWjNj3MGICyqURBrH3qBUy9BmbdN8SD4b76jTHKlN7Tqvnq7GHuA9o1sCo6jG/eOy/ADJlNWyCc32gCRltb16B1VToBORHKYy39F/JQuGVOUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192150; c=relaxed/simple;
	bh=rRzR7Rhb6KTpSoOJoC/MP6DtbgV1G83HjbsiHEJJe+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Indf3yhZwD696Q6DB9Zymr2oCV/cqkwi49ezZj9RpSAzxc+9Su2DMXkKVn43W2XqfLxXoea/Rk4dhuOm85vwjP0A1pxc4B1N69+Og7FkipCqMRA4fC2Sf3yXP7UhH48K3Cv/eZT7xHOMUwhEK8EE/tLOu1ywqkFAECmP6n3btaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pP6aFQTe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pP6aFQTe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso12996585e9.0
        for <linux-sound@vger.kernel.org>; Fri, 09 Aug 2024 01:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723192146; x=1723796946; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9XgrXqJt0/9CkMxHNu45QhllGaF2W8Tzkt4pRfBbFk=;
        b=pP6aFQTeXcYBB2v+/KOa5DfRHS5a0mulNtQVyA6YFPmPptnlKWb4kQF/WyUpGIcowl
         HeNJVbrsp48N6/mlFzxprJQ2X5NK24q3ncES7KG+FCuu9WoDCZLgbxC08LVJ6kJlpeFK
         yYcPQ/73xs+A3pOgj/0VsH3+WAjLGFkpOXcgfCIrMzkgO6XcgCQxJK/bEsx4gUi4J/1e
         AqQh6JiG49LI64SDfCTP85IHVL04yG7JsgubJLKWZggpU6Z2mxnBvBG94u9NIVixLhMh
         ebSfzt7LKQRrhCHXWU9FMYXbEb8tpnnrXTkBWLTQ2NV7oYne3y5fcC4y7oAKTsJZzpQW
         u8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192146; x=1723796946;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9XgrXqJt0/9CkMxHNu45QhllGaF2W8Tzkt4pRfBbFk=;
        b=Mr5nkH8JRuA5WKG7YbvNkAshwhQ7NGy8AeppfSK4fOckkhDZkfIfv7hiLC3qZFlOh9
         MZed8far7UXfTjSbxH8rxJc1n6cJxm/CbmTMOG8j8W54cAExXNgvCcmx6F+HZbx5XU5L
         yszXwjfCzDg94YdglF3AY2uR+tZ9h/EWyjWxqszl2oP/gE3+FhsQxPgkuNsqJ/UxOIoz
         EGuF7LiazFVc1lToxcAO60ulGPp7qrKAypAKiq41JuLkwZouUyM0BYVEUSkqC2F18qO+
         wDCBcOQ6CVorJ+JwTLt65f5VlYhIxoti16D1VH1D9u5OFuGXi0rGeeaghtdrh5h6U8dv
         bOqw==
X-Forwarded-Encrypted: i=1; AJvYcCXe6ysGqiLF0Kw7rORwx4Hf7DMkWBMG/pD50H192snKgwBpIcnv3h0Qzuyi42vqIotHeccYLuoJ0IEX/KNufzwlRg62Jk5y2cO8ldQ=
X-Gm-Message-State: AOJu0YzE0A3ULhsNE5ymUX3VdzCWa/0CEdLrxea+iG7rPhvg+zSltWEJ
	3HrlVuFoxbc49DhiwYf2H231HhziI9qw1fflL5lu85KyTbqujW4qHDdr02Z+S9s=
X-Google-Smtp-Source: AGHT+IHe4KRBbn78xJ+uhzDvBdPlN0FDRDNiUwGsnx4SLammGg6F32dtNQbopsE3P9TfIiTwaOcj/w==
X-Received: by 2002:a05:600c:4514:b0:426:5fe1:ec7a with SMTP id 5b1f17b1804b1-429c3a58c23mr6422525e9.31.1723192146423;
        Fri, 09 Aug 2024 01:29:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f0cb:cecc:348d:4d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74a855sm63260855e9.25.2024.08.09.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:29:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, 	Mark Brown
 <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>, 	Takashi Iwai
 <tiwai@suse.com>,  Jaroslav Kysela <perex@perex.cz>,
 	alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
In-Reply-To: <87ed84rnk7.wl-tiwai@suse.de> (Takashi Iwai's message of "Mon, 08
	Jul 2024 16:00:24 +0200")
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
	<20240628122429.2018059-2-jbrunet@baylibre.com>
	<326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
	<874j99434a.wl-tiwai@suse.de>
	<1j4j90hurv.fsf@starbuckisacylon.baylibre.com>
	<87ed84rnk7.wl-tiwai@suse.de>
Date: Fri, 09 Aug 2024 10:29:05 +0200
Message-ID: <1jcymixfou.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


>> 
>> Apart from the problem reported in sound/usb/caiaq/audio.c, is there
>> another clean up expected ?
>
> The change for caiaq/audio.c is rather a "fix" :)
> As a cleanup, I meant, whether this extension can be applied to the
> other existing drivers that already use 128kHz with RATE_KNOT and an
> extra list.

Grepping in sound/ for 128000, I've found only 3 files which could
benefit from solely adding 128kHz to the defined rates:

* sound/pci/cmipci.c
* sound/pci/rme9652/hdsp.c
* sound/pci/rme9652/hdspm.c

The rest are unsing other rates which require the use of RATE_KNOT.
The most regular rates being 12kHz and 24kHz. Adding those as well could
help in:

* sound/soc/codecs/adau1977.c
* sound/soc/fsl/fsl_asrc.c
* sound/soc/fsl/fsl_easrc.c
* sound/soc/intel/avs/pcm.c

I admit that's a fairly low number of drivers, maybe it is not worth it
at this stage.

Takashi, Mark, what is your preference ? Should I:
 * tweak the spdif codec to use RATE_KNOT ?
 * add just 128kHz, fixing the 3 file above ?
 * add 12 and 24kHz as well ?

I don't really mind one way or the other.

>
>
> thanks,
>
> Takashi

-- 
Jerome
