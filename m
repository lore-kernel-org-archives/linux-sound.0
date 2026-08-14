Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE745D5C2
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706920; cv=none; b=KIvPRhMNcpCnNh4yd6oXXFLOhmRklcnTGdfSFlT/EZtG9NFu/UzP8IfLyvsAIabFYiiUCsakzMmdgV5MMp9pSKnGrnrvK0NaxTgTgXJyWp+G9g4I53Doz20jKGvXNqbTsPhTcy4xAyamIbhsY0FM2XMwlP8AzB2oVoAxK1318SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706920; c=relaxed/simple;
	bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SKyh31rOVFZbLcnUGUK2I+FuHW7fYRQhDUnnuPoECSVUdz00XBDjhdVJ1QjQIqQkP/r3jttEbzBXaKnYXFrTnCI0HxilmuW69azv1/Dg1Y/w3s38bpASh3FDV918NAI4XrpsancwIPVaBd6kWKbwVY8VBWETAzhMDA3kkeGiR+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iV4CDWVL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iV4CDWVL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so6653035e9.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786706914; x=1787311714; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=iV4CDWVLuMdDCvIwo2BkJnm9BDP6ydMRGyjPU8feRdiQM0DgnY+EfwSJrTLiW3pGPw
         nsUuE9+beb7gK4UwBEhgdYUyKpw/8htOe7JJ0LMhL18K/CQ+kVlOQz1oUvuySaoPNu6g
         JD5h7VQdzaaQPl9kEpx5IOXX5LyCxFftZxCe/9reRqAjXdvTa9+j4JUZh9gQHq9zUn37
         oNuTdGHt7w78NwHiBOlvl25mIT2RjoBRyOSys1/l5ITM6E865ezntPke/uxM2YfGfBb3
         Z3r8BfpH2hQTeJdcN2ZBOuN/VupKY5BSJ/SCkbbe+ujvQpWkKDFKxOpMdERZ2la8n22N
         LHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706914; x=1787311714;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=HkdvLTFZNq04l/G10OpAHRV3EkRj4UNbwUI1w46GzXqHkNt7t40Lbl61RkMwdjUwO4
         wH6laaF89ryUVZGJDu/7sInUUrYCTjeiurzR1W00tjD1niyn+V7yA1MvW/AIKXAPbx3m
         6Q6Ivd2iw/koTfIqI6JQ7kVbHLzUCvDVG2nWKVtog3jG/KnVymG6q3WLsscOXVmt5JYg
         +pfgGJJQHC3eoDblFxtEdcipN4E6uRHJcRPNUwaKHVT4tRPBqkHSzc5Zrr+cItTY5EL2
         Gdr7YVl0Xi/0Vhr4jhsB+0f48b+HjL35euBAiFLL+DEiLxaU6sXc+tu7oS3U2wbekAjb
         HgHw==
X-Forwarded-Encrypted: i=1; AHgh+Rqlmyh1ZR39S9DTGYncQXji1EwleN6Tr+x+2FJBie1CwwXF/2u2YhU+r89NaRlUIqvfN6DG5ekVrE2AhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOO08ROEltfANwow4KrSN3eXVCme2TfA/UKY5ti/Ql2U9vpLVB
	oTVHoRSjdx8nPdpQJ0Z7TbOsw/1Nqv8j796xnFF/zxEB1BEFlHgGaNhO93tESXIy0xs=
X-Gm-Gg: AR+sD138VydgNhgb7+PY2noln4rdQsuvAYTwQ8vfCd9GhE4g3ZK0SLe29LDT6KmyLkA
	s3JS01I/CwpcW2eeSN/KBmHde0iKAy1ylq7vtyr7JHiQ4qfvL/YDbiED428S+QHStf5J8rJ0bn3
	wbjnxMOgSpbW+XxqTsD40tLQHdljVwU0foYapyPGUbEizZdhLY9pf9QdA0SDnvK3IDi9ENtGkLD
	VDFHna5E/vwaq4LSZEvZRnMq8+7dfiROLXnvexK57kWRalUilibgwqyn0C/5jQ5276OSGmHEQL/
	VvoySo/RHw1pQ1H3PEOzl/dOKmGTkmH7CUCT4rqKG0hcuDqY0SOFXM6h8NPk7bGs/ZVNF1gbMx7
	8v7gelt0OQs9xcH+NhgbuMdAbxPdzvMfSqWPZKg/U/sbnjS2fn4BhYv7VdUNr4XuIrVHOTDz+EG
	I80n4yypjMRF9ep5ZuySvym3rHeMwXLY86g+gZLFBrHSexq9o0UEvTSORGGi8=
X-Received: by 2002:a05:600c:4708:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-499879419bdmr54955745e9.4.1786706914115;
        Fri, 14 Aug 2026 04:28:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899753ccsm24626765e9.0.2026.08.14.04.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:28:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
In-Reply-To: <20260814094211.25151-2-phucduc.bui@gmail.com> (phucduc bui's
	message of "Fri, 14 Aug 2026 16:42:11 +0700")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
	<20260814094211.25151-2-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:28:32 +0200
Message-ID: <1jzeyplz4v.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 14 janv. 2008 at 11:42, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The functions called here don't log the error themselves, but the
> error is already reported deeper in the call chain, so the dev_err()
> calls are redundant and can be removed.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
