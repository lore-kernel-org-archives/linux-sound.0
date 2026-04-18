Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E42318139
	for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519439; cv=pass; b=RgUhetqKIS+bqSCsTkcBdSOmnwQbbMcYUq9s+tm6xQwgjvzXuQhOrS+StsX/SvpoJsDgJ5na5OiIozEK5SRzla88YBwFuig50CLm0iQNuMbK2N7OKH9tJsdl37nmGPYimtJV4Sy37726dCg7ccEDv9+lQfC7Tvk/fDm8qYKtjcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519439; c=relaxed/simple;
	bh=dcSMSl/WEq7yyaf5lQbkPA86KkCPPo3BDlgTDv3bCwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gy0YZe9nSExpWkES5Xju/tvsGOVJPZXCpl/hMP7Prbf1GeisFUtz8tRwkoyunuD9m68nFrxXVujL3wb37OfvYoh5WkC3SBLkPN0kKPH6pW8WPpy7nqaN0g9YF94wQziooePC920EFjAMJYCBYZRbJI++9b7JpXv338WqXHfHsB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zn0ohuAv; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zn0ohuAv"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so1719802e87.3
        for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 06:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776519436; cv=none;
        d=google.com; s=arc-20240605;
        b=bR5G0Ox5QvGC5qf7aaIMygh5DmUDSgYwRqH3hnrZC5oFGp9hVye7qJCeZ8cucER/Xc
         ToX03e1/hIJjBuIXEqblOfWyFm+AS75/P533+bvnhlFLbEqKu4kxqrW+RZo0cK+ZSQwq
         VDUQOcqJoDhQY/by5mVZ72nci/F0fvPyZAYCiZxdpPPC4ItEoYBoObFIXjY/UOtjDqF9
         iPRzQX0U4Be5TzbQHCi0AOP7UQS51E/Pafl/nkBTuaHcoMc+0NDKOSZUnbEt2xQ6m46N
         ZmRnN5+DDd0ikjL11gdCw5GmpVr5iNXnfqtF1It8mx2iIDZ3d1aU65vRE09GhKjQFEyZ
         T8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilQZAzlg/SXrVi5zNAVi40oN2cY80CKPwE8w12CH8oM=;
        fh=F0cu/NcVL+OKaruOwIJUekXHD0wbVOVqexEsIQq6xWo=;
        b=hojUhZChV1rTRoujME7Wk/zvrtbQj92CNLsLG/WV+7jUIXFjwc1qBS+/OCHOs87JBB
         6kFAh4Q45QM8ftZt3xrhX6m1eMa8by0GtaS8Sv8GYuu/t7P4I08GqXZBcU4gBTxh14ib
         wJPvQZ2jddwIX5YDrxLNMkPwxwlfRmFFMwhIbDKkFq5bllkwm/nfaATToMgOM0Vk2teR
         ZNpKj3JlkTWT/bJlJWDjeOMh1sJsbYN4cU3tmA7IUDjJMSsnaGb0G9ctzPhCT77PQWdG
         NDHy7mHUgLojWSsrELh+QmwdxGQBjWKw0s1LJ3JxdgOjWcRhGKp9PUa9j0xeHxzf6DqN
         sAmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776519436; x=1777124236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilQZAzlg/SXrVi5zNAVi40oN2cY80CKPwE8w12CH8oM=;
        b=Zn0ohuAvY90ZU6BzrJTjfcE8tSayIb/ZnAoj8s/f2RnOeYHqLmf8v2Ref3M4mW/s3k
         pELHQvo5IqFJDQj3Xr08W8TDWAUIyVwpu8Sppt1dU+dGVj8zEuvExKHeTBMf2+snip/2
         jyJDnmpUN1HARxdngYyBCM1dmhX1hepqwyKQmYxsrUv+1+0YmMjyZC3oCCQpjplDgXDL
         F4/WbL40cbVETjMrGbjy3uDWewxrXrYoehv7T7oW/sYfkInbxHx7jzwGVvI+9tETVSRF
         HquB4eXaVvNFYGWYdwL7IW1PNf+PfAQteGh17zN+7LoEETx8fSmWbEFyzXHzyj8clu3Z
         MW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776519436; x=1777124236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilQZAzlg/SXrVi5zNAVi40oN2cY80CKPwE8w12CH8oM=;
        b=J5MMKyN3v7P4OpUJsmmTTm1SCx94ijQp+/9fDJVz3+lcF1usaayv/O1Lnuzn+NJrTX
         6tPoAjIIgcn1RWVT0u7YuUykMll21dZfYB+PP5LmLcGTBQSruSQtb9Y7+viW1Wx6jldk
         NhZvAD/t2V2cD7yVG8Mo4j2Phl20KwRYrYNYcMd+zO8BS6PiFDdWDdB5yWUWGgX7458U
         HqOnP0Ry0awWBFuwtIB7AD2JzZi+znF3EkiE9GYEC2Etz5k/RqO/CzDIXnaMq6AGtKoP
         GVT+TeOU8APq1XwSQWmV/HlmxL7UXJxJPEb2GlLBNhwYkugYxk3qeBHTPwkSU+Ch3M/u
         aVGg==
X-Forwarded-Encrypted: i=1; AFNElJ9KYjMT4ElXMNiO+FRHsoe4vjbg8zj+J5cEMX2cmZTRfUcGTydcrb7ezM0fgIwvATQKPwUhFTkQ85rjFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/yU0WNpzeiYFNQRaTx3P+XKVfQLHchb5CMryjMo1Sp/DEFGy
	laFEaNYqOpO8xID2PbMJpbJ1X4DXwKCUFcDmVjpCeY+VBpqE70DTnWvO3Ybm1sP0fe/ZORAXddN
	WKdQYFUsrF8Ik1DSQSEZAZNSTHkzhDD8=
X-Gm-Gg: AeBDietwWq2buyBTxKa6YEH01YvFP+k4T4vPAkPf14SEMEdSOaw+STMB2CIgP5qZQky
	pFM7AsvzhGOlCuw7dnxhCcib2pJYQgikgLpe4TQcoE1Su100q9z7NBDX6P9jn17Ka/yFJxmAvCN
	t9CkgQI+2/HnoBdPAXliGsnimjUxX4GHS8nOpR3VH+/IOq9dgbOXdjathPluHvLMIL7gwsMTQD7
	VDGT0xZZz3JS5wNCtgk4OCypJwLF273NsDqPHxEELKrwHnWht7SkR0YmzyT3ihmNRx9aOk0PGK8
	Er9YkTOM5YW22d4WZu8xG3471UgE51qL1QP0BetZwA5Ynz/R+YQftsiEZn61v5qd/2hN2adGNf/
	UAYY=
X-Received: by 2002:a05:6512:234c:b0:5a4:1672:59d6 with SMTP id
 2adb3069b0e04-5a4172c74d0mr2164468e87.15.1776519435667; Sat, 18 Apr 2026
 06:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410200530.171323-1-piyushpatle228@gmail.com>
In-Reply-To: <20260410200530.171323-1-piyushpatle228@gmail.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 18 Apr 2026 19:06:36 +0530
X-Gm-Features: AQROBzBW9jKpnnpm-uXKP34lAFjICEdCoA6cruit9Z_tuBzWU5Tej3ZknrtJJyQ
Message-ID: <CAMB+xkYZZprxmBMWnypYc3kfVa8ZN+WWrTOT9TpZqcQGOAyjVg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ASoC: tegra210: simplify ADX/AMX byte map get/put logic
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sheetal <sheetal@nvidia.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 1:35=E2=80=AFAM Piyush Patle <piyushpatle228@gmail.=
com> wrote:
>
> The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
> control state as a byte-packed u32 map[] array along with a separate
> byte_mask[] bitmap. This is because the control range exposed to
> userspace is [0, 256], where 256 is the "disabled" sentinel and
> does not fit in a byte, so the two arrays have to be cross-checked
> on every get()/put().
>
> This series stores each slot as a u16 holding the user-visible
> value directly, turning get_byte_map() into a direct return and
> put_byte_map() into a compare-and-store. The hardware-facing packed
> RAM word and the IN_BYTE_EN / OUT_BYTE_EN enable masks are computed
> on the fly inside each write_map_ram() callback, which is the only
> place that needs to know the hardware layout. The byte_mask[] field
> is kept in the driver struct but allocated dynamically in probe()
> using devm_kcalloc() with soc_data->byte_mask_size, and zeroed +
> recomputed on each write_map_ram() call.
>
> There is no userspace-visible ABI change. Control declarations,
> ranges, initial values and handling of out-of-range writes is
> preserved by treating values outside [0, 255] as disabled (256),
> matching previous behavior. As a side effect each patch also fixes
> a latent bug in put_byte_map() where an enabled-to-enabled value
> change was not persisted.
>
> The packed RAM word construction is also updated to ensure the shift
> operates on a u32 value, avoiding potential undefined behavior due
> to signed integer promotion.
>
> Addresses TODO comments left in tegra210_{adx,amx}_get_byte_map().
>
> Changes since v2:
>  - Move byte_mask allocation back to probe() with devm_kcalloc()
>    using soc_data->byte_mask_size; revert write_map_ram() to void
>    and runtime_resume() to returning 0. Suggested by Jon Hunter.
>  - Fix bits_per_mask: use BITS_PER_TYPE(*byte_mask) instead of the
>    incorrect BITS_PER_TYPE(*map) * BITS_PER_BYTE. Reported by
>    Mark Brown.
>  - Drop <linux/slab.h> include (no longer needed without kfree).
>
> Changes since v1:
>  - Use dynamic sizing via soc_data->byte_mask_size instead of
>    chip-specific constants. Suggested by Sheetal.
>  - Replace magic numbers with TEGRA_{ADX,AMX}_SLOTS_PER_WORD
>    and use BITS_PER_BYTE / BITS_PER_TYPE(). Suggested by Sheetal.
>  - Add <linux/bits.h> include.
>
> Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
> Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic
>
> Piyush Patle (2):
>   ASoC: tegra210_adx: simplify byte map get/put logic
>   ASoC: tegra210_amx: simplify byte map get/put logic
>
>  sound/soc/tegra/tegra210_adx.c | 85 ++++++++++++++++++----------------
>  sound/soc/tegra/tegra210_adx.h |  5 +-
>  sound/soc/tegra/tegra210_amx.c | 82 ++++++++++++++++----------------
>  sound/soc/tegra/tegra210_amx.h |  5 +-
>  4 files changed, 96 insertions(+), 81 deletions(-)
>
> --
> 2.43.0
>

Hey
Just a gentle ping on this patch series.

Regards,
Piyush
