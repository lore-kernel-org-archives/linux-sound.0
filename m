Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A0447F2F8
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460608; cv=pass; b=LKqmdeDuf3Tt9/4ZMYKEfkxHPS5cb8PcBYRutGvoOMnZvmG1QzfmTbDZp8VCGkUb11PWW3BTBiHJMMn7RHRjmF1DAZlK4+CLH7Fmkq25yUrSdy8VRd7/nEjq6VpDedS3H1pUeVDD0T1399AdwYj7c2kEcRTGYk2nRfCLg3MJCDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460608; c=relaxed/simple;
	bh=zrSbisXnRqG6tuaqy924oPWL1X1bSlGGV0YFTsGVVTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mx0BcqSTSmoloCI3fFswACZivOql0CUwvDd1kVr+Gw5MYBw8ZOeVdklzhykdbAoN3pJogLQ0XmryGXR2Ugvt5cqjBlDpeAahmyWxWk8n7RlHRTIjnmgdcpvGn6O8xtYtNikvy/9o3AErx2jd90Erem/AvtP+liipn6u4O/7oty4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNiOCsP6; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNiOCsP6"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c6so2904715b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789460606; cv=none;
        d=google.com; s=arc-20260327;
        b=FiAwR7xdpt1d1Q6sEtYKDeakOgJ0spPGgutVMIFa9qSDt/cNMnhFNkTtfgBWFrrHXL
         UgxmB77+Ykh0OHgQbtMi2NzmDxx9MIET7mceZ1vhLJarXFEeqlyN1bJyN8IAh+aTXDIk
         q12R8fv+UMOywOR0sWpuVNqXm+xtTeUPUeADFq26ZKWKjqo03tjXur5TV4MS74isA7sB
         gQFM+gbAJHOwjrymJBdFtN58RQx+NMLxBFIOwBDkd28cDRs8oIGCbXYBNhAsN32hS6GW
         DLQ3GwgmPIRhsY6zUPQv0h/wK/1OF7KxRk65rMW1MYq8s17Rfn4RdaVw6pdsjIFhTpYC
         x84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        fh=godBHEylO3LY0ukGEJQIVI1vsX1v01jggKYY3UBqorw=;
        b=lUwuv49MWy0q1zukyxCA2g0yCzlvc6auOLjmQvoKmFCc57yjxaHwB0H4GChVQz9IM6
         FgdWTlzx8g+QuDHGA7Kh76LEfeQRz30wMB7+8Qcvbo0YeTfYTRN9tQtzhFUw/Fxc/YuC
         XToggwfsCJE0BeWbtkWGntlGL6bTI1AmcTiuHf6o8iIIL2OC6YYY7gdHGOH6PN/nESSt
         8tSS/x/EcrZ0v0VrMBeyCdoBUMf30FBcOw57S8dcydVucMM7dlkaWviPIv9thS3aGmJG
         3f/50wBK6A8J6e7oaTrWdEy3An+muiT/ZERi86oYEOlJFc3q2gJpWZUq251H4RcDOM6O
         F57A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460606; x=1790065406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=XNiOCsP6Gdi1amzLUOjgViWvXP7BpRIlXCrMbjh2QXLP3axR+M5LSLNJjbVoI1WzN2
         mGf5TInJeaSHuEzKMhRfEyXcSnKbHa2HzhkhS97eWUGhqgZD2aI9eh/hpr6x1utG3vzH
         xWY6G9R2Ti2l544wvospp5ZHLPIEJevNz+/0gWWcDcEBNUyZgiDW+9EGMmPcpLR1AoH8
         nMhB0EhjvS3mF/on8GoxI0gyJNRBzEu+1wNvfeWbYaQNZG5gyFzLzvE22NBtT3J6lFhp
         Eyauatg0oSnt4dEtmt42IQAbJfUINmPvAaQ7bQpu8TlKWLV1rfIMQob5pG2SEWNrSN46
         j0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460606; x=1790065406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=XlX5d/i3dU/Z4Y0Gk5cFkJ6fix+yuUHkRidzEZSdPL+GtvwCxc84mqudBaerjDuKlk
         pUEf04me4ECbzdWOHEleAWQc0Rw6l6PD5T7AAKoI10WinyIHzD1Rj1bNNMm90kkfJrqQ
         4uFQA9eMiYHZkmVVHXjjbMal0MXs0huzVME4+Uw1pL4+dlMxIPLV+Y3+CAl8DvWQgT6c
         iustDWOfitGjAY57At/RyVC8w7bznA6aFrujmRQtGyknYaW2Yjs7esF0/nXG4bdFCMBO
         Y4f01kg31UCNIPfyO6GNJcy8kNDmIunSZJorJ1CPeYaEDkkvl7JZDdw/UDBe4G7AyVbg
         6Hkw==
X-Forwarded-Encrypted: i=1; AKwUvBzXI4xY1P9OgY4M3u6uG3SqAwHXnWRgj82ZHjigmFfJ9BpMfXyCLehPapR2g1tvhiiQtQg6ssTQNpaO9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mBQNUHixzXamO4itUVfRTLMklxf+0EBpFSHEXp3DsnrjzkzzID
	aStEi6GjyR4YnL6+RK7tOLJ19lzR/skPszdMir+rULpmBP/boqBdLM5bruR7pfZtT9kHWHlFSEa
	6nDEZOlow02RAb01eQR/LePPrVx38M1o=
X-Gm-Gg: AYBFou0mt1ENOMj9lepIPF9FYqoqyItPvnOp60RDh3UjHM84pk0qwb7dYQ8Iqnm7++p
	8NIKFpdNye1FlcbIASJniAvYmGzt8C4vpzTDjOcc/158+WmDBV3ePz1FeE8XAArBlLTm03F59tC
	wJw2Jvh6vWj+aMx/dm2htP26kf83T8Ix+0vVXzBezuBrCxgdC25W4GjPF/Oe5sr4R/Pvw9KSZMA
	KgDQ/XdNp9injiePRdSDjYVT694R2qSvfBczNR3clvVGlfPpS8lvdlc6yWFS64OM2+fm9bPPhMP
	VpJu0i1VcbP78qphcyJYTB3ViET9evZFTszSErs+rxQs2+92/sTzicK8cIRoE8YT68yXEWozw+p
	y8VTGpjZ94gAG6iINDC4gB+fHSmgQg4jAHy8orH7YtEl6AhEx6wG2alAftBaS4ytiJVg=
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id
 d2e1a72fcca58-86f82e5bc49mr11440122b3a.3.1789460606294; Tue, 15 Sep 2026
 01:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
In-Reply-To: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 15:23:14 +0700
X-Gm-Features: AcwNN1VJxWS0kfmgYMTWj5HmLKEavOhSqOjDUWyYXdNn-q4rjwexIxFPMbacpHc
Message-ID: <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,


> >
> > In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> > correctly checked for error as in, if any, probe will fail.
> >
> > So... during suspend or resume or anywhere else in this driver really, the regmap
> > pointer can't be NULL.
> > The right thing to do here would be to just remove the useless check.
> >
> > Mind you, this comment applies to some other commits in this series as well.
> >

I found something interesting:

in mt8189_afe_pcm_dev_probe()

-------------------------------------
afe->runtime_resume = mt8189_afe_runtime_resume;
afe->runtime_suspend = mt8189_afe_runtime_suspend;

ret = devm_pm_runtime_enable(dev);
if (ret)
return ret;

/*
* Audio device is part of genpd. Registering it as a syscore device
* ensure the proper power-on sequence of the AFE device.
*/
dev_pm_syscore_device(dev, true);

/* enable clock for regcache get default value from hw */
ret = pm_runtime_resume_and_get(dev);
if (ret)
return dev_err_probe(dev, ret, "failed to resume device\n");

afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
   &mt8189_afe_regmap_config);
if (IS_ERR(afe->regmap)) {
ret = PTR_ERR(afe->regmap);
goto err_pm_put;
}
-----------------------------------------------

Here, it looks like mt8189_afe_runtime_resume() gets called
before devm_regmap_init_mmio().

So if we remove this part:
---------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
    }
-----------------------
from mt8189_afe_runtime_resume(), that could actually trigger the bug
we were just discussing.

Best regards,
Phuc
