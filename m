Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5414A62A;
	Fri, 27 Dec 2024 23:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735343954; cv=none; b=uVDRZRdii627CWcCwoFLlXMoBOmL//XouGZZJpUlsJ/+/Are3dSOkpRRgq2HZUiAExytDBiaogtoTvwa99aIeNwKCnzJrbDXul+QdMqel2vlcxwS10208Lp8F1PwHfvfpf6isswGWJTPFdtMhCCZ9rR5kAwuCf1jMjWrKyqql7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735343954; c=relaxed/simple;
	bh=PcVbruQKCVpThCQhS9OVVZeAiUKW8DeB80FK/GmUYvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PH8clujJ/++XJDNy+0vlBGGm8WDQCiwDJUfgpobLJ0nFZT3LNgea8DsujsM/ycWM0R0TFFIMhNew9emDTSlHQjI1U0WBA7UHc208Xb1scsnhnhDGee5RAS/85kyChe4PWsCmSDAMxDDY072fssKaCHvtrSrkWboBTS41RZZe/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odzgl+CF; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odzgl+CF"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f2d8f62290so3510170eaf.2;
        Fri, 27 Dec 2024 15:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735343950; x=1735948750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=;
        b=Odzgl+CFlq7E5V9TSw30ktkjzm4onkwHm8yqQp7AEz/kJO9OqOzf9hxxJlSC/F0W1f
         234WjndjNWt59N3P5vOqRh9erdPxheY9Ut00vfgariWgPB5Vlj4DZNMRQfuyKQxSYySe
         rTfecjzdl7p+s6SSiTcbqfIr+kET+hqRoilEX79WYgz9sg2WY9cmPyuXXSN/kFKSWnyh
         m8TGvSPLGyJ3OL9854lYb4ODn/aGZ27J2qAXsn6lP95ysELopavIpFXXSUL5w6W9NyQ7
         nUD2zxCfsTxPsuHvwwnp7oD2QWJJnJDet74YXZQyhutypEf+prz+blXDDEvDl1ArDPwV
         Uflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735343950; x=1735948750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=;
        b=KQqqMuY/80iT2SJ1dZnd/AZ7Eo3g47RzzPiphFZomBCT1O99xq3HyoMDwQ/x+eR+DB
         gjDz5QPaGPV7u4+69yGGe3tOEegxWjo5FDBjsSubj7VLBUIYhAwsgvzSBuCJBA0dVEU5
         61jjIsYKctMxPtCNEm/zrFRR1xbVovRkAe6UxqfTkU52WkBQnitUBbpi8Jm7PNwjqC2h
         cAJA5QPuR6cWXqNsTc60hSYPSHkO7d0T8sCwpE79VqLJRcJnksM6K35BB4UVPPOHpb4q
         8BaAUGnlJRqStXrGBMQRj2X562IR/4kHP0l8GRdqV+W2TTcojy3eCxCQBSJOvCLEjBj8
         9WXw==
X-Forwarded-Encrypted: i=1; AJvYcCVNu/7vrqmgXJgbMD2TVfxUVStgWa18WOBZWRDhQOtCHQdSQtOkMv4Zp2w0jVt1FGrdNZ0C9rAJzQUIJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfLnG0DD+E0UvpzdQUsptxCjyoyi/Zp6rFXKRFuocS9ZR2l1uQ
	jvj2J7F0wXT9bK/2Bu8/mqb+oRuaXDR1BkJ1YnIlwNBGZKcDVkXOtAYWbJBUcRV1dY0SizA/Y8L
	WKxPMD/6TuK805vQgVQIdNvNDTsw=
X-Gm-Gg: ASbGnctg5Kb/PoxUqMidKP+CrZWzhjBiw1ahZQCE8fsNNgZgOhQOj9cK9XmPj3fW31d
	d7bYguob6NtR+ECKUsdKDw+9PLiVEXEQ/a2GoLtPa1idjv/dOkVBv
X-Google-Smtp-Source: AGHT+IHF+9y91xAzk0WeclG07YYaJBdE2gf7HVbMMZ/WpHgN7HlLp8WAPxiUjkeqzJKcsxPtIyGDxr+7m2I+WGbBIeI=
X-Received: by 2002:a05:6871:d114:b0:27c:a414:b907 with SMTP id
 586e51a60fabf-2a7fb4d0065mr13413322fac.33.1735343950458; Fri, 27 Dec 2024
 15:59:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240302140042.1990256-1-megi@xff.cz>
In-Reply-To: <20240302140042.1990256-1-megi@xff.cz>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 27 Dec 2024 15:58:44 -0800
Message-ID: <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present in
 A64 SoC
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2024 at 6:02=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wro=
te:
>
> From: Ondrej Jirman <megi@xff.cz>
>
> This series adds support for jack detection to this codec. I used
> and tested this on Pinephone. It works quite nicely. I tested it
> against Android headset mic button resistor specification.
>
> The patches are a rewritten and debugged version of the original
> ones from Arnaud Ferraris and Samuel Holland, improved to better
> handle headset button presses and with more robust plug-in/out
> event debouncing, and to use set_jack API instead of sniffing
> the sound card widget names, to detect the type of jack connector.
>
> Please take a look. :)
>
> v3:
> - removed all device-tree related code
>   (it's not necessary for core functionality, it only helps make the jack=
 detect
>   functionality of the codec be usable from simple-sound-card driver, and=
 I'll
>   send it spearately, because it will apparently need several more rounds
>   of review)

Hey Ondrej,

Has it ever materialized? As far as I can tell, this code has been
sitting dead due to missing dt-related code.

Regards,
Vasily

> v2:
> - use set_jack/get_jack_type
> - get rid of some custom poking inside card internals to figure
>   out what kind of jack port we should setup the codec for
> - read jack-type from OF as suggested here:
>   https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-component.=
c#L288
> - add DT bindings
>
> Thank you very much,
>         Ond=C5=99ej Jirman
>
> Arnaud Ferraris (2):
>   ASoC: sun50i-codec-analog: Enable jack detection on startup
>   ASoC: sun8i-codec: Implement jack and accessory detection
>
> Samuel Holland (2):
>   ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
>   ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias
>
>  sound/soc/sunxi/sun50i-codec-analog.c |  73 +++++-
>  sound/soc/sunxi/sun8i-codec.c         | 346 +++++++++++++++++++++++++-
>  2 files changed, 399 insertions(+), 20 deletions(-)
>
> --
> 2.44.0
>
>
