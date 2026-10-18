Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282E279DC3
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302433; cv=none; b=VXyTyQNf1H1i+vRhX0YxDcHv8epeITGETzI+ModIlfF7r+qvoFqL8KAGjcnL+5hSC2EgvHWWwzOoTUun6D0mvkyLsZy+EiGEz0R5hxx44p+FZiHqLk5gJpJf6EJFVzCRSe3ZQBj0YWUzJgxnOjbckXPQnAykV2KsgC3doVQ1EFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302433; c=relaxed/simple;
	bh=nL33N4MkG2GAXW61rbmW51GmG14HD5JKfZBJNorgJ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qT+FjXHOySHURUmp3acNsErYtxRhoWPx8xvpx/k3GN4THeuPcSP/kAzGdKS4gqCvUzGZffd5ckUGJSEGDTkj96bRKP33SNI7HxbyQAXnC5JL0TfyZ7sdVskFYvgulfbbag4bLvNqtfEXaO+DYrXq/5InjuL4nT1xo8UMzLXmeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1b5Yeie; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1b5Yeie"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso879656a91.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302431; x=1792907231; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=b1b5YeiegRWMuWgLAuFRN7y6LxLREtGy459QCaTt1P9kb1YUBoMa5peZcYbwjpPBuL
         De/5iwn9vjTflKclM5OjnUhljJkSp43agMqm01adiGB7umO7iM58dJABbRdfRemF8Iy6
         8JYvx7EsgoY6o6A/A8QrIIPyE4GHM2rmVWKgwIXIi0lgV4WpaCugxQj7G+sMy95Kczjh
         r3AzTIx5aFRegSzQhM21iW0TRdV9YJIdcrrpZ4XOF7fFYQLrcVDXbgW6wxdJGVwngXxx
         0dJ+rwgOuSNG812S3HXkuVU3RAAI5Cg0yk6zALS6sT3eoBeYWKGIFoeRCaO1w5PpR5Vt
         We9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302431; x=1792907231;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=b9gXS4LlDgRitmexp3LzNBnobZoqlhSx+jXz04N1VkC2uUcpECjPxEWB8E1Y+INEaz
         wYRwzBYMhZCKEDmLAaB/d8eMSwNBLaHfhPfJA4iYnXSUdcm6P3fgtXSG8DJ5EUUooBgB
         KgNr2+aiDFwCYZAEpAba53GCABQIgHVcwARIDMZM8gBAu3YhVSojE63JBo3QYrN60pv1
         2YXQKq/NYtui0Omr3DamHYCbPvQjppwfRWPmrRvxTNKyn1lLeFiJKnOnrUUo7JkOcC6q
         CClxMEuS8u3bbcD8FW5vKQ27sfWWkAESyF3HxuAmgfEN1sEloHfv4jXJ3ao+BS3nY2ff
         ueGQ==
X-Forwarded-Encrypted: i=1; AKwUvByu1aJ+btMh9vaVyWRWP1wc5HgGeF+mcvYCfnNN7l2LlljvJT+P5FugW8APN+8SIMpm9VwEnet0PHpIGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzygNFp75rQ3angGoVAb2nj7iXO6eHmvOa3J+sX8S+svUMqBt+
	z/D45FBm6l4NTpkFVG5q6XqZ81vU0iAKCwdXJeiH8J4k7/ux4dVQV1Zu
X-Gm-Gg: AYBFou1TmBvRJ2kfUpC5CryZbpC4b9AOejJehGTJr6nR+cF6s1aJb8cDG+hodPRH4Ki
	5zRZVYTS3chMIq9FeBzjZF9SxJmUlcCpeZA9Cww/1ofe8inxN3g/HCDLQYdAUNEbY+rKFBgUVfj
	xwgjH0OIFGiupbWuefpE6a3lIumpHqx/a6kt8pvDGTKWzhX+51u9Vc95eEDFxpCsDT/aAdpZvD2
	u+FHF+XmAo6MMl6ojUrVArBHpX+Fa5B6yGYCpggA+tiLhISI7FSl45zS4Vlpy9m8tZQ8Rvu1xEI
	gfWKj1sGEfAeyqS39O4zvn4295clNSSzC4rQR+7kJN4bAz+lNWjlBgPKjososn4K4PAaxLMzBVI
	+gJd9Sh/M6ocKWRPpBUzpmC48E2BjTCyXigFt2Z+1iGqVBbnMQCDQ2w8HBRKRX2vkL/wfFNmDhX
	RdieZYlQy58ue2IMc/ryyMS13Bmt/SYWPjQRBJUGm876XuyXPIYwBgf7FcpBe97GmcIrxuCsgwf
	7JzpVP1px6joEtFMGHVPG4A38dRetqdDuL87fZcaZyOatkFmufVds7ppgM8FnWIapNBeBG/rN21
	Z8Y3ZsAFlrwd/+4CYHdFbK5QreRPgNeBg0zso4xogGuxI8rmEzo=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr3942070a91.10.1792302431271;
        Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm5442358a91.1.2026.10.17.22.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:47:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Date: Sun, 18 Oct 2026 15:46:54 +1000
Message-ID: <hMEBpV6QSOSLxRVSn92CIQ@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 8 October 2026 12:23:42=E2=80=AFam Australian Eastern Standard=
 Time=20
Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > Let the 'fixup_controls' card method return error values which will roll
> > back the half-done binding of the card.
> >=20
> > Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/sound/soc-card.h                 |  2 +-
> >  include/sound/soc.h                      |  2 +-
> >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> >  sound/soc/soc-card.c                     | 12 +++++++++---
> >  sound/soc/soc-core.c                     |  5 ++++-
>=20
> Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Unless I'm missing something, that one calls the .fixup_controls on
snd_soc_component_driver, which is not the snd_soc_card callback
modified by this commit. That callback already expected an int,
and class_function_component_fixup_controls already returns one
per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
for IRQ registration").

Regards,
James


