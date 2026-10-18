Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A16340A6A
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364615; cv=pass; b=aEGwsFlJm5ZXjcatOcLb4nSFCfG+TtiG8oLQN2nDSqhGHOBmh8WNXQD2AekVlSTHebVkSPn5skltl4Sk16mVMbtptXm533yJgRba/Yd0q8WeZnAr4kqv3sR4lUrvZMaDLf1xDG1wvpJr7h4QpIZ+4pT0x6z8q25m4gPNYwZ7Wm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364615; c=relaxed/simple;
	bh=ijO1ofwtEk8IQ9wrxIsbZ5OqO4mGdU7H4W4wNstdTvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YajV6zx3z6lpHryZlEvOBsUG9REg+mY+0k2Hw5sn0p2ckE4t/fQXusRLDtlRnTDitaSaUC4uuPtdpQTymOzz3r31HDYQys33MtJC/8LEGdYhfG6/m/7ljWtsyIOjknyN9LvHrYD8wWrtdEn36OG6V4Nr3k0+fVA1gu+6gVnuQuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inBinjm1; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inBinjm1"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so9743571fa.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 16:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792364612; cv=none;
        d=google.com; s=arc-20260327;
        b=CkPx+NixtAubugkQLEwNWCcHi+GtDmwGCPaPpJ/156qO+kDssrE5l3eE3Fmk2/VHUU
         CnjgFADCmby1dT67d29NEBV5AZz1LSN688KnBvtX6aRNfynHU4GQ5C2JJz9jXxB9jYQj
         yRjJW6hrkRrk352VOYoj2GMjD3IVNtdtTNtvHdrPzNeuFTncOFn+yspSOSQJWuWY4T4g
         0fMKofZLUkHUizlkdt0dmswypaWreTlMVVszrLUztYhjNujuRGtbIL5Wb9yquE6ks99T
         3te4I9CH08n8h9mr7rMqNNuQhN/lvKxHDMyjBYugJRnHiSMdevTCSAiFFsPBjkYE58HV
         sZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CtDEPcWWsmT1C69fTGFKrXB4DRq4jy7DyiNJS8fWhlw=;
        fh=RVLblqjWIUuQ54P8WROIJVV9XB2wPeLt86sLIGlEYwk=;
        b=bgW4j7jCnrSB4PGHT7v9xOL6WjfynSt9Xba0nglq4fKyjZ1AMLnm5A9C0TegYpJZEz
         MWOhat0qfowTE2BbBkbw4x461tZhTZA3dApAizgW38xFhOUK4iy1tPf8K6pk2RpXW2Ve
         tvpxgqkDx+MuIR2io7GHuEhtIL9IV1nQc//oXfeoKPMxKVyuRWt1uZYJIKG4HHM787nc
         BftF6hF7cg6LDn+9F+bgressp0kaevbIw88pQVUh9Z9c6vohLaHuqqVE7V7sv4PMMguY
         80+hmljTXIcvyIQhSnT0ZjlUe2I8tYa/8Z2B/lVboXGDffTFOcrJO9dWZ5Kgkt45Q7rM
         K9rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364612; x=1792969412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtDEPcWWsmT1C69fTGFKrXB4DRq4jy7DyiNJS8fWhlw=;
        b=inBinjm1BQeuHPft3qhR18LQ0KyeC/S9aDax9RgINjUiP+vH4SmdMTAcLVNap3GtOK
         FfihsA7Si9I6npjZ3TmnZV0idxtGeW9IKoeEqxGrWyKzzi9MMVRu4MhXJg44+5KAQSNS
         yshtSaQeDySd+bNiCJnhxxCLUrvSCB0XakcNkU+AR9URdnnqqfOFMeSlJkxmVX8Q0dRD
         y60mJ+7WTbXBTmcLvQiw3ZS+Xwxi9J/4dJNE5aJB755gwxtnszmnbZqT7QQgExbV0TJI
         zJGQQxFOPwSyo8FAbzNUvsy1Jm3r/jAxjwgqpOXXHFGV74Vi55DIOvyEPU2V0pL+m/c9
         Vojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364612; x=1792969412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CtDEPcWWsmT1C69fTGFKrXB4DRq4jy7DyiNJS8fWhlw=;
        b=YFybFYeY9ghQWiJBq5/ea1lcJ2tpn7n7REgSmV2hNPE6YK8F2H/r62svTItyqWh6bQ
         lN5SQXtl59kmwwbmJJqgMAgqZ9SnKPpI9qZ6z/elFnq0hrVKkMaNC2xgduyhGPH8z2tM
         RVQb8aEShYi9LngoyXjXla5rnIEXeUrN3CsikxEPtOLw+nbGYeX/FXjervJCWaYOvNJz
         l5UwkKMICFy5fTZV75Tq4dhxf6TNRqfcIv/pcIbEr/zIKVoW82isOOceVIyk+rZtjFrb
         QO++XnqIffj83tvZq9fkMysWRW+Bq1PU6GwvrsDqkpq1mWwUxxNe8NctTlS/CWxHA5qJ
         UbIg==
X-Forwarded-Encrypted: i=1; AKwUvBwY8abXliYzN8Co4ENk3ansXl1LTvlsvEnha9pNhZJqKZn1ZMkU7jEqUrQ+gPPXbFKse6ktDuWsatlg3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8KgeYHQ/MnoR2Ai1HiHGhQlpl6AQMQiNVWYjG0mJDkmEPwyJW
	pOBtOk0siyjuu5egqCxtJHxX4O6/8Dg/ZdExubPjefQ7Xw8rzLk7UZF2hR3po0JKB3XeQOedcqK
	TKDkdGjzSxqJxIO7osihBxgXk3O0NvS4=
X-Gm-Gg: AYBFou1DeIbXkC/vTUWPn1G4HWhgiC3NHf3PUg6NtsQerW2Qmd5i8t92oqSJGQtXUZ2
	sg1wbqqhI0iT0HYTOEr1aW6PfnV0/Nh/yZnLWOkGcfuQ6OttlX5hCf6rOiwT2fAggX9Zzr/ILqf
	FtW/TjvqhOSBAmquLhUak+yOvqnyR0++HeJCC6vjBLDXnBf0vJ2F6DSxFBvO/OIXBR7X8AvXI/F
	AeU+ccYPQYLrIDiDfYre4Swm9dloIYymGumoFsWCIWxlHHy4Zt6VLabe4GLvVLLnHRjtowfcQNy
	BZSZyM6S9wh2Nw0dt5uC28CLw7bvl+mebZVzfUP0Cy1pAKwljoc1DJmcmgRyR87zGONItOl5k/z
	gfsy+Zs/tbnRctgC/S39Kwv96w3tMoW9gfejDPoTV90hB9NHb2gN25+3xJgsAxTOXn7B2kNYZLW
	utg0wAQ0XocqUJxwoa4L7PPa7ctRwWvVwebpuhbBCGBrCY8Bc+5mAI7iPXxxdLM8VyP/7VxLo=
X-Received: by 2002:a2e:b88e:0:b0:3aa:f42a:b78 with SMTP id
 38308e7fff4ca-3ab292ead58mr14531581fa.20.1792364611365; Sun, 18 Oct 2026
 16:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
In-Reply-To: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
From: Lee Mann <leepaulmann@gmail.com>
Date: Mon, 19 Oct 2026 00:03:20 +0100
X-Gm-Features: AclHuK8Udt_rUpVjU1H7ERu9sfyMPax2ZWl4XcdoMOoyRgj4wfj10Hek764Ch50
Message-ID: <CAJgi9roCJtatxZuZbgHZucWjid4z2ZBiZfuz1oc6mpUHq8dbKA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: tas2783-sdw: volume and firmware load fixes
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: broonie@kernel.org, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrey Golovko <andrey.golovko@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Niranjan H Y <niranjan.hy@ti.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 21:00, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> Three tas2783-sdw fixes found while bringing up the ASUS ROG Xbox Ally
> X20 [1], whose two TAS2783 amps share a SoundWire link that is powered
> off when idle.

Tested on an ASUS ProArt PX13 HN7306EA (two TAS2783 on one AMD ACP
link), with the series on broonie/sound for-next (686b3eff60) plus
173cb3147ba2 ("ASoC: tas2783-sdw: split a stereo stream across the two
mono amps"), which this machine needs for stereo and which for-next
does not have yet:

- stereo playback after boot, no ASoC or -EBUSY errors in the log
- volume changes while both amps are runtime suspended work, no errors
- after ~2.5 min of s2idle both amps come back at the level set before
  suspend, with nothing done in userspace

The PX13 firmware has no usable SDCA function type, so it takes the
tas2783_init_seq path; the ACPI init table case in patch 3 is not
exercised here.

Tested-by: Lee Mann <leepaulmann@gmail.com>

One thing you may want to check on the X20: on the PX13, applying the
ACPI init table (via the fallback in thesofproject/linux PR #5904)
together with 173cb3147ba2 left the second amp silent, because the
table puts it on Right while the stereo split hands it a one-channel
payload. If the X20 table also sets a different posture per amp, it
may hit the same once for-next picks up 173cb3147ba2.

Thanks,
Lee
