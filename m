Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4259819341E;
	Thu,  5 Sep 2024 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525268; cv=none; b=ElqYW20RkDXZcYixFyLMm6Z4fRi2MMBNW+IU7RB5uWs+wbPDie9AViOZ1vz4tbaSJET2fBmfXXH+tllS5bgZRA4yKOyrDB3KB0YMBeKqrhulpuqAGanMyi1E0HQ7Eq+2TnSMvqQ1qkOkKiVhZvsvdGJHMoJWpeO6N3/KkM6EP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525268; c=relaxed/simple;
	bh=VckIPtdfed8GjyudCjkRZ3LDyAZv0/6vNcZcmWw9JEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFj8HDAK9+GOP70XxzDmCxjKCpzJ+VZWL91iSaldKQHrD8ojKAwkbzeMOOga5qrmEUW7O1pAr85oS7hFvowkNi1dWIpjHh+dcMZ9Vv4KLve9KiriYoFEogoZlH1cRp0B391WemlaPFpZQqmuOy6kVD5lxdKkYy4t90Q3yV8JQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcfZhAfs; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcfZhAfs"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86acbaddb4so67775566b.1;
        Thu, 05 Sep 2024 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725525264; x=1726130064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VckIPtdfed8GjyudCjkRZ3LDyAZv0/6vNcZcmWw9JEE=;
        b=mcfZhAfsLuTlvIbtnwFA38sJuBcT25jzwoiSAi9PokY89dlZPzmMflRGal0Nx3h203
         Ysk4XFGwNYOjBCiy2mSX4iVa3MmfLKfgQrkA0Gg7TGEjueCsf7TGhBZacu4jI2worDwO
         TvzuZ7CFTFgqhbZW0gGgpzQHhxCDorh4pNhbR2/hEPIwsUPQlYJmvjH32z7cp/j4k7KY
         UEuSVYBMqdpKdAEJ4UkBTz8X6GS2zakljHVXBTxzu/TlrRJ0Rh+KKpzlOuiEkl21KKZb
         A7x479ywFS39DwTL2vYAISDaiCQmpK4oFy17v0zt9a28eV/fyD7bDU6z38ebmBFhjH+m
         768g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725525264; x=1726130064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VckIPtdfed8GjyudCjkRZ3LDyAZv0/6vNcZcmWw9JEE=;
        b=eQ6FG5jSrUvJx6Gs8UePlGqisu3lRyaizF6sR7YXOfn8oLgTFJLzRFWRYfhdgQZ49H
         OB0Vi7gQUUPfbK/wskZIjkI3ZO0BsnDeiQ0m4aYJQlOyqmdMCIo0+iZzsGT3GZ5fJn24
         by17WY+ct6DFpuyOauqbUO8NU05YMEsnjp0dEhGlxSTc/xw0KsDTSfAW0qevoRVw3a6s
         GZPofnBFCYDxmZACFCxYu42/BvvXgsxMUP0/sp9W7Yk2MMkTpdoftBpvTSLeZ0caEopL
         x/E4eqt5QFWIM2JNp1QTo6G6/0Zf9KmY8Wto5dstXu1RoO3R8p312C9uTocgrHBmQIhM
         wAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW76e3h92UMnyy8XbBKDusb2U8M3MN+mFTjiYGFMzwtsS7flIYwFl4o74+6/uLcnuqwdVmOBAssLtK0guY=@vger.kernel.org, AJvYcCWVUeIcn+9AL9SQDX51GdwONukGSJN1YOocTUq+H5K6TyM4pq0LW5lKloj1B04ThymeAJtOTZjW0EOa@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIDOMRMIKHCNCt+UipX7bwLQTKhlgv6uSgaiwnhxvFSXJ10Tl
	AhO2zc2YB76Mr3KxSXCLE12XJornhxZ2ViuHm8SYvPcA/BnzYlgmaVtQYSPLFzWOUweCS9b4Utb
	R6pCPnbOkGYMxal03Aw5H76pA308=
X-Google-Smtp-Source: AGHT+IHvV+aIbib5qEchTzia04VRhd80KuVjvWRdgg5ffoysV8XnGZaJsGq5V1QhKeXUroZD2jmRuq6BJYEVPV0WRro=
X-Received: by 2002:a17:907:7251:b0:a86:7c5d:1856 with SMTP id
 a640c23a62f3a-a897fa744a8mr2068532266b.46.1725525264155; Thu, 05 Sep 2024
 01:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <f581c749-999f-44a3-94a8-a39d355c32c5@linaro.org>
In-Reply-To: <f581c749-999f-44a3-94a8-a39d355c32c5@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 5 Sep 2024 14:34:10 +0600
Message-ID: <CAMpQs4Jqx56NRkdVPztPe+xXcY-A=WDxGua-pc1OyYG8kD2Q0Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] ASoC: Some issues about loongson i2s
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:14=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/09/2024 09:02, Binbin Zhou wrote:
> > Hi all:
> >
> > This patch set is mainly about Loongson i2s related issues.
> >
> > Please allow me to briefly explain this patch set:
> > Patch 1-2: Add ES8323 codec required on Loongson-2K2000
> > Patch 3-4: Add uda1342 codec required on Loongson-2K1000
> > Patch 5: Improve code readability
> > Patch 6: Fix the problem of unable to detect codec under FDT system.
> > Patch 7-8: Add Loongson i2s platform device support
> > Patch 9-10: Related DTS support.
>
> This was based on some old tree... or you do not use get_maintainers.pl.

Hi Krzysztof:

I used the following method to obtain the email address I need to copy:

scripts/get_maintainer.pl sound/soc/
Liam Girdwood <lgirdwood@gmail.com> (supporter:SOUND - SOC LAYER /
DYNAMIC AUDIO POWER MANAGEM...)
Mark Brown <broonie@kernel.org> (supporter:SOUND - SOC LAYER / DYNAMIC
AUDIO POWER MANAGEM...)
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC
AUDIO POWER MANAGEM...)
linux-kernel@vger.kernel.org (open list)

The code repository from MAINTAINERS:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=3D=
for-next
base commit: 097a44db5747403b19d05a9664e8ec6adba27e3b

Is there anything I'm missing, or where I'm going wrong?

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
