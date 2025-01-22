Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C991C3C14;
	Wed, 22 Jan 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534190; cv=none; b=ZUApgulL/GI/VecdCUwxS0IJCnKZxIGM/5Hr3mIjkRNGlkc/3nXJmVpmQPppNZIcFjISeuxdn/rHgMbCdYDq9dyvV94GCYnFVODdQdbV2bKEVEHUbKbGJ3tKkzxF6wduX+ZjU4+FRQDEzFKeNe+hgGj+1wcRB6I/QRsud9AgXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534190; c=relaxed/simple;
	bh=obiEB34YoAsn19KGJxnJqDVbrFkoRLz1gaFVh2UXrFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPjyiJOnTLKV6qzGjV4x0DtJOapfllYHpyz1QVbuuC7oxHWa59nO5d1zjk2lfTpZ+Cgj5N9KeplQDwIUSaXmIwW0VMLZxNrQ+ggnct6YTu/8TclWGOhIP3XfzEZ8CXdytzC5yOfXwcC8Pz/FPF5H56O37KcBzN1OWQvTT1kKqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW/OCFql; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW/OCFql"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216634dd574so77124315ad.2;
        Wed, 22 Jan 2025 00:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737534189; x=1738138989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obiEB34YoAsn19KGJxnJqDVbrFkoRLz1gaFVh2UXrFw=;
        b=FW/OCFqlNzEMblO9HlS+4tbuSiqzXgRx9F3d+i+s6DVYpOVJkun+f+bHTT5RfYPBFN
         hu/y031/XO+2ewJimV6a26E8VfQQnDGydbe0d32xFwuPS8JdTAAQNYaJSbd3GobqAfLK
         e3i3iq0SKoZM9M/jtG4ZgMccaapienPzQU3pnRZgLBLUUTC3XUtr3F72Ld+suEBAnXPN
         G1oUER786WJEXP66fZUM8Chpr51AapeDIjxKQII38X8rGP8AZB8QRyVWjRnkA0IgK0ln
         9hbFkTPGu3RIfV1HKigpG/11gaFVafuNEvKl+mbHX2NmsrO6BWMmsIPWsGfyiWo9jgz0
         2p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737534189; x=1738138989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obiEB34YoAsn19KGJxnJqDVbrFkoRLz1gaFVh2UXrFw=;
        b=s9vlX2u/92vA/FT/KLVafPhaOoX9xrQnneVNOk4ffvEALeVV4QBETIvsbZ+IMi1u0h
         qQ0KYqgJxMnh6BqtwM8KxT8HgTORBpqAfvrlGfer9lzmlrILnCrGZGeM3kXRZN1LFPfO
         3SKwfnvGHON5Lbly+hijMEbivsGSCkJiFkzmmkVQ5aJpnHG05NDV05MzKsOBt0OxNrfA
         ViVoIAyencb9tQ5lSsUF7/x6P3+EzOWrsCFa0vs+ttAf8TC6w5dfz/Ks7hgLkCxBP76/
         Pt5ugq7xtuyldGTh+3QlwxlyeDihtWrOA/CckviL2BdF+54kWa1yqWwL0CwkAwKhqGt5
         ITJw==
X-Forwarded-Encrypted: i=1; AJvYcCV2pSZdhKd2tZ+u1nkTU6pgrx5qPb7GM1Di7C0R29xbVeqlY2glvXVJ4MG1Q8BIu8LisVMigageKB/mIkI=@vger.kernel.org, AJvYcCVicbstRlaUsOfah0pZ4k2WdDpsX4iyEVCQ4ZXDCTXhbSrWXXQ1EQnp3AzkUE8MH/AQLbak9OHqYPs79cw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5oz3nVWjHaULL/M8jOIARB1k1cRkDVGkmBdy+1pzjAK+/wzGA
	NLTF5uFH8JB506SpNVsLUfCrDb1578PuQzHnk8oA7rWjV0Hw2xKBvMAPK3hy1QeepvJZiEEAGiO
	lgmKyagQP7jvony7Mf4xIKFwHBwU=
X-Gm-Gg: ASbGncu6/aB/NTPCw0XZrxW6F0WNxoIusXpvdWcYrwgsfswJdu3q5B8WyUrSwb8jrC/
	BpTQbWsaK66R3GBlFiBtQL10QrBNqXA7ay7/iuWR3wNa4Byk=
X-Google-Smtp-Source: AGHT+IGuwMgE7Ae9hTrXsThfUk/DGdhuvdZ2LXE3C7vOLtqJ6xi3NmieMytNPxnFMLOiPBznopgKieGxjLb4EkFcgZE=
X-Received: by 2002:a17:902:ec81:b0:216:5448:22a4 with SMTP id
 d9443c01a7336-21c351bcc64mr338178365ad.10.1737534188713; Wed, 22 Jan 2025
 00:23:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122065330.1423248-1-arnd@kernel.org>
In-Reply-To: <20250122065330.1423248-1-arnd@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Jan 2025 10:24:33 +0200
X-Gm-Features: AbW1kvYLH4pTyXeltuKJ_WfaQIbECDjgmD0AvDg7ZfyaDPqP38_06mZv-aKpTts
Message-ID: <CAEnQRZCbCqAdv5jz+rf2etCxZqfPQthbFEfNiNH7Ys2xNdyeZA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: select CONFIG_DMA_SHARED_BUFFER
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 8:53=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Randconfig builds without dmabuf result in this link error from
> the fasl-asrc driver:
>
> ERROR: modpost: "dma_buf_put" [sound/core/snd-compress.ko] undefined!
> ERROR: modpost: "dma_buf_export" [sound/soc/fsl/snd-soc-fsl-asrc.ko] unde=
fined!
>
> Add the missing 'select' statement.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
