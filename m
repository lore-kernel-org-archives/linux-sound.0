Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778029;
	b=VVqrS3SlUEMlWXNfIOqyICz+7ydPtcR+8j7CkWrv9U7q/XAEQHdKqY/6RHdJiw5hjbo3
	 Y69lHuk9oQYhaNVf1tnBFkcN0WyvYFF4b/VltIDnA2rVWfkgOqz5Nagd7JPPBx8+X9N+G
	 SCDz7RfMQT1FyAMf0DvGy2DAPwvSe20+1cpWMp8Go3/j87eGRfTcdn37KWeWMRORETGVX
	 wEckibOV3DNP5a98abMPygxAoS1Vqmw+6uMPBJMgggQSGD86pX4vLTrAaGaIGP6KrkRVg
	 I86aUhELCJseWcHmr4rygfkgEUyv9dkmpBU1iBD+964IR/7Va2t1pbKjUMVr/1JWJ1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
	b=xVdPr6AcuCgGV1VFVqyeZpzYbMO7q3LMonZ+vFBmyYNxlqS4FCu1P/ZSwsVFpT5MdcHi
	 cNHdM0KsiKQPvzIPnPN+jyhBwNBp9TFOetOdF/gmPRo5cP4xnd57kjaPRG29VEU5J+ESs
	 Khm8USOAWks1klX6MXKznRCkfh9fA94RZSQs4F8A3PDog+jW+k/UbZCLf2CVqd0x+xenp
	 7+sXQfX5D4Y1JvPUC6FBytCs9NqP5lvm2+QAWWoSeJoAb2krufBNN1zJMEjPHpwQD5ryk
	 hC6QEcOyto4QmF5la15CUdAaDjxjh4+Cttao/Oo00JiS/g3SzncxjoXnoHHyrmPbKZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mwSj3gru;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528CB606A329
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528CB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mwSj3gru
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d126f631so24352177b3.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778028; cv=none;
        d=google.com; s=arc-20260327;
        b=b0Qww9NMsL7xjgjcbnFuusadAyzz+PpuhTciEjEoWi0eHPpS8ahhDELWluQV9dCIpX
         fZdzyI3jb6iEJU7Hfo5uN860el4lRqE0jPHYXrXxHx3GAeLVh4JxxVK3O6QcN8AmTLXe
         MoiR1Nhc6qFx5lFkq1UPd4iGRNRn6n+FOewqzSQ/eSITbS7xuIlOX9i8OO0npICuob43
         dRnNNpTPKPE3NYllZEda51I+qXcX6oSjr292LTO3qWAjkWuRmgIB7ibHbhwdWIdHn3AK
         1UCYcbVECnmKWw8hoI3hRXezzRMf8SABd/jhVYSCVUuwarHUp8bymrpuqS1SeOxPmLqP
         HbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        fh=P5uANx9RalFUFeSObtx3q6liyB4TXc29PAVBw1ZmxxA=;
        b=b4vsGoul4hY8I+1nse1NZw8OhpBMnhtGfYN/tkoy78mlWOF5C0Kau4nEsr2sz6LoP4
         GbIqft2vWU+f07bisiuvPm6/aFNSItxRipPQk9L1i5mIr1/LPm9jaosZL81QIzhyc9Iy
         gzoXwwNr4i8Ms2GogivGAuwNzyswOX82HdqdJ4HKCfMKLNFvkLjifB8rgzgMMtYuFNiU
         L7qu5UjT7BIU7pc18x/gX801kRvUT5+dPLEdDgobJ0YWY7kML/AUQdammcUXkdd2vsr9
         fvKp64wXFwDCkWfZwiYgbm8gaFEY6lFQxi19J7s/oB5xwwSSAkb7C3hhzAMeWigFT6ez
         9ONw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778028; x=1795382828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=mwSj3gru6GVQtVK1B72XWkcBo6dlJyZWzdgxG91om6bDIjcOITIyDOSFQ+/zd5koD3
         2rStRnpCvYiSlxPqntKz/pJ5aMuZwpctbmiw5FavSk8jWq3yHM6+JGyrT9TfGFMPdJf/
         V4Neo+Q1X7wRZeSYG/sfy555gUgQrmyqSj3V9HFPYMeF78JD06cLamLjImg/upse27uw
         MVZpA5wfkowHSpJMxKiUYnWLt1H1IV55G6zbdispT0pcsUPmikc4mZTH/k3svCydvnc6
         wPeNTu/joJVKOLhSLFqShwsg22Y3E9sqXzZQneDZHqFpjvcsRlkGy2XX8jNKIWz47Tmw
         Amwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778028; x=1795382828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=q0sowQtuBhZ8IuLfDXLDRPMnBKC4boMJ3F7fKT0mLpgXIrQA9Ogwfv8PDR5I9Brudi
         VkOf5cExun0WPQXN4JYxIx1RX4h/yDD4ngYMp/fzKKLrkNh63vr6p3XjijRe5QbxSwrv
         DDCHFlxopjF6QTiyfz7w8lDQtggylUo5tmRGYNCzkoDnz2j8TyVEW+k2qdheYuAsorMa
         mNj/N7rvzhYs4wOBIkyy/fvmcX48Q8IKz0PsQSmqtSLsZB1H2E9/29fHI8RGNrVzKYKR
         k4f4LfyALuVfG3aLT6pR5z2qZkQUa9XwH1y4RysAJrNaskB8tcApuzKE0DsrY1t57w3j
         E94g==
X-Forwarded-Encrypted: i=1; AL+hErGMbQNbyo7mpirweuIhCt0pM9FbBT9U45bYRrPlKytPVr0kkYaD+enFIWWKQW/pYLQnPe3IXMUQORj2AA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zq6Pzw+aARbfgZsBqgQkOFFroBpP7v8p66LCGsPxUkjedLytZ
	0ivS7ku9CnHytOv6HDa/Mnxyc0GMy8lhwWEErW8KU4utxAT4PofGWIpwY0Y9ptNwJIZMD15NMHM
	Ii2s8IbFkgDVOVcdwIItKQBknjiBaeic=
X-Gm-Gg: AZFdTZehaQTNpLEdFSPPte17y2y2UTG1oLinVxdm6awzWOGp0KEndfCKWxToSK15cIr
	9PXvsUSYZHga4G2Zd4csDRubsOhy7HqW+ta7sR9HnpIdC9nB4W4PoIX321OHrJf1irUI1MmoPzG
	Gf9AFnX6A6Klp1WbCySsVFw3VQSCoLn5btBww9YSSldgMYt9gYic3ebZOH1IWqpwmwq0UqyDAdY
	oACt40sHxcaVcsba2/TME7rjbcIVXXJS5PBCWf99+mUtlJOWUTirNkxnlTU2CyRwmRumwkRiw92
	GUZvBbNLy/NEa9dmxlx91NETvS/eBdy7I1q7wSlgaPJbfgwkY5wImZgIxKzw8ao/9iEOv5tz94C
	Hzsr63kzhj63cLUto9h5BK7KT2HTRGYOohfrmJMKDH1TyBC+JDwIUSIENgAW0z82/dMG/qQ==
X-Received: by 2002:a05:690c:6e85:b0:8b4:c2c4:bda1 with SMTP id
 00721157ae682-8b4c2c4c026mr25492897b3.67.1794778028118; Sun, 15 Nov 2026
 13:27:08 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:26:57 +0100
X-Gm-Features: AclHuK-_NZa3qMznm_nhucaqssqDCKZOwFULWjo8j1EdkFI26I-pZrQxJB4Pk5w
Message-ID: <CAFBinCC6C7QD2-eYhOR6FjQ+1a1sH6E0ioUMapFkTWe6626hfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> +static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
> +                                 struct snd_soc_dai *dai)
> +{
> +       struct audin_fifo_dai_data *data =3D snd_soc_dai_dma_data_get_cap=
ture(dai);
> +       struct snd_soc_component *component =3D dai->component;
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
> +       dma_addr_t dma_end =3D runtime->dma_addr + runtime->dma_bytes - A=
UDIN_FIFO_LANE_SIZE;
> +       unsigned int val;
> +
> +       data->last_pos =3D 0;
> +
> +       /*
> +        * Setup memory boundaries.
> +        * Note: DMA has a 32-bit mask, so it's OK to take lower 32 bits.
> +        */
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_START,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_PTR,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_END,
> +                               lower_32_bits(dma_end));
> +
> +       /* Load new addresses (both LOAD and UG are self-clearing). */
> +       val =3D AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL, val, val);
> +
> +       /* Reset (RST is self-clearing). */
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL,
> +                                     AUDIN_FIFO_CTRL_RST,
> +                                     AUDIN_FIFO_CTRL_RST);
not a problem but a hint in case you experienced some weirdness during test=
ing:
older vendor kernels have a different register write order and also do
a retry-reset dance when _PTR and _START don't match: [0]


[0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/sound/soc/aml/m8/aml_audio_hw.c#L348-L357
