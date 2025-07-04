Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6727454
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751600375; cv=none; b=nkZKl0vDB0l/N5rVNivff6YHTrl9Fk3e8wXVSOdmfQGcyf4OIC+LwSrq0iyXji2fpzkvZd2pjFxdRgNBIwwwUPenWPmQW+h8j7K8yvSs+Sp7Og/bKkrTVaT+XIeV8E5G0LRc/wKCoO1BxKzspLq1aXh2g2Cz0s1Gxw+gar2zz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751600375; c=relaxed/simple;
	bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyePeA7M5gdf6vlqdUuK54WE7zcCKKCqpMkY24Bv8YkOXkeWj1NmuUyI+/euIFeM0SUw6uFoDWQ0mQ0qCRF9CevlMCP7oJ62EikX5o7nSmjQP1xVPGIX3V5TMUVXVVYC6XpO03PblniUgUnZteauzCaBDNonAhFplCxsB4D1tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OLuVguGL; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OLuVguGL"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e3e0415a7so5740707b3.0
        for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751600372; x=1752205172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=OLuVguGLapU1DVOBXQr9TBFMHhyCcKPUQgw3gVNYXZZwmf1ze0ywI4wVFzzcEKA/5G
         M+nNeJbTY2CaeiFKXBTiGvtf2XdTOmx/FWz5zZZiTZeHt5TFiceJiVebT8HCilKamrJ6
         Oec30N+6wTY9iZucF63UK1VorYhFPa2ytYzp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751600372; x=1752205172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=YgaH1kfk6S6iOpJd8mrsoQq76XYRg+2sUxkPTAlc0xcdgtzFUY5ROKy66X6Gu+qqcF
         SMtNo9tezpQgjyASSZl5LVlUHKBikgtMFf8nAEUsuNKGFckzWKwcg+t8ZtFLBauKpOYF
         HV+dZoWhdOpXei5l/KpSKzYDzBoKunF0VmzPQy9ntxA4ojVEVdezh3DuJxCO9ilH4C2I
         m+kPUEhdea25JSzOhk+OyrqcdkBDJzlcF4Xg/WJ5sy+En9dpK649NDByQfPWlrkWAd9J
         OU2CZ/WBbrdGAf5d/WwvXkA2btni5OyYu7wz/fjtprtNnwJdds70Yz8gqAP+q31y04+P
         ZOeA==
X-Forwarded-Encrypted: i=1; AJvYcCV+6iERgM5FNhVQ6lc9Z0ZAv/+YUL17CTjR/1txgdL9nX16bg5WMKtRJuVRtc2Eb5M74XQk9ulu+Fswsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGYvry6Td/3XLel1FlBZirMegUKPLzdIWhCtCk+bd8Xmow5oDI
	XXEBgHXldp5rd67lj3S0p1v8tXXArgFvxRRUOXrngAO48w6rPMs9DFmLmlmClYvJJ9S/7f4tlO8
	I902sueZVR9OZhOvKNHl5Ye8ANo84Niac1tYgeIgC
X-Gm-Gg: ASbGnculM5qb8DYrbU7TuQ5OyTtIlXkgpxHmvbOVEKeLxFnjoNu+4RNa+yqRwuIHtyD
	1JawuPGHiROjsUvwyqPO/s9JoFQtxxx/g0pyuXDfmwuX3F38AXGkSoMoRIalset3FYXFte0T/n3
	DOROvZe5fqERBc3kmRllYvrAzgeqV1dt9u8CkkCeWFn5aD
X-Google-Smtp-Source: AGHT+IEpv4/ABsyEPWBaSbnhDaxcTMMoASH0qOMAb1EUBzfvoB9Rs9KL0TsrqeATirMWAbb6GqIiVFu78+U/gU30DoM=
X-Received: by 2002:a05:690c:46c5:b0:712:cc11:aff with SMTP id
 00721157ae682-716672d3d02mr24980587b3.11.1751600372350; Thu, 03 Jul 2025
 20:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703183523.2075276-1-robh@kernel.org> <aGdAmGGPDA71rDE3@google.com>
In-Reply-To: <aGdAmGGPDA71rDE3@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 4 Jul 2025 11:39:05 +0800
X-Gm-Features: Ac12FXx1clDJs40GrPtAnmhl7h9XO9sxxgXTs_ThD6wPGcXtPD9F4XTO-6ZiN-s
Message-ID: <CAFv8NwJcwD0wqJAoe99M+dQYA383n0g9U+5+Z77uuQ2d=Ac5pA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:46=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the patch!

Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>
