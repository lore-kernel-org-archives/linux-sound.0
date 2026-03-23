Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E6E2571C7
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774309849; cv=none; b=SRMfmicRtlQK3CdaYZcfGMQMnwNq9cSW+HFm/jHI1kHhHSxVumhPm/AKmURJFSLl9bxYHcLJ7qSzkTsRFlpLyun1V4XqJjcXSRJJvXbWF37sUeTv+ZCo1pFqzMQjCpRzY+6fYITvpWykNg1ymCi4cbJHebvM8MTtW2Y0cmki9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774309849; c=relaxed/simple;
	bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8alC3YdG12y1fZMo0zKH67N+YL8U5+ZS9D6NSUTnENowqFam3CoCDFNY9P4A8lhCEXhPJcuJqgC8SjoerZpTaKmcoZnopICXcBoi4SZhtRZWs8kihhR5WXrJMk5T6ovcfgPLniTD2ogGKH3YlbOgVthkOdLJiPjBPMGD6hj8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKVqyxJc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKVqyxJc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso27702785e9.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309846; x=1774914646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
        b=lKVqyxJcl8gJ4H/bzx3SfcYbo+WWskg6Dn0Zec7LvNx1gt7pG2+EJ5/UEqRqYxLl2K
         3gmC6ujY8cJ5lc9tnqhGfNfKYiGlgci676QIJu5Psz80ooIh3NnnDbnD0y+IvgCHMPgT
         mB+B6JcxNgGxiRFU7HDOrfGZSTdqp9StrDXV7qludmZBC0icMKUi0Uu5xvsEQC8T9I+D
         LNb6C4YZh6u9MI7Txqf0hPnhEzZvqLwTiMhAVASVmWeYokrxQd/2h63cTGNkjRypBVYe
         jGwtCB4MByX3QeaCKnz2tvKqSWitmYrVnelhRw//W7f4/gp9F08Y64ZR5yAjiJSHz2F6
         87lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309846; x=1774914646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
        b=D0YoZnQ1xrdPMIjZYtLZm7Akz1SHHkzy0OWJSWJ4G49uCpbFoWjwPC6dcuHqR4R4Nu
         3tEHi+TKXO4PYEGlHa1QtqW/6CrMlT9kpcvxRrdqmacY/halKFjRE+4xSF93HHTkprZR
         0wWGiDD86+vhzpdJKtfzVDqgDzfhCq55wxx5xqJ54twN8o3J+/gDNaO9YQbSswU3Pur7
         38c/VuOplJZ2DIoMgAVtmg6iRh9L41pMXVmTXEFDcTeDGUbdH4kBX8lTvVIewD0wTm6R
         Pj/Xab8TK3/CTYGhLbjOGSsGa5GgRAu06fKXIWVbDYaiSe2IWAtmf/IQ5KOi8tuo5fDw
         7wxA==
X-Forwarded-Encrypted: i=1; AJvYcCUMoGXWW8HU36ysaZI+UIJc/Vb7Rkiy54uVI0fdwcXDstJv7DameyRu/uiKPX9pBDyjfWcsBQgk1gfrow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKkfvargz7el0dDVISOtVJK6cBigzRzVUaWqe3r2xEqe6+2MS
	8ej1UjemNNXTaC7vZwFd434RPpgSlOdyDo/Y/WHopL/aXGa8VcKf5/ZPU4PcanLca7A=
X-Gm-Gg: ATEYQzxyhUOWFviw1fmTamvgETbUVyS5GAoYWS0lLGpB5ZnrHqNM5zD1xZ0iG3yzslU
	B36FsKY2PvbKB9aZTrJSYJ3UK4IWfY5kFEjiCWFoT9H3chl+k9JAqSXehvLWnQ9GWMLI8FDRpLR
	aX04nFNvdVcVspAdElUiCiNNkI0Oli9NmIRo4nQ/lvjZhwyfydpK3/TMJxf4FhhUmUqQhH1fsKK
	qR4ul7jXKyFmVNlOD0oZTkVsxRLEjOLL0YBzNQo+LZSNQdKl9Hqru4Yt3A1ZyTA1/Ak1Xu7SVpK
	Y+Olx3tNz6bvaGEbHOO7q0Qf8f+5s/Yvb2A2MSovUYP3wdPoAq9WuvT7NsclkOFkG/TqmcEMl4B
	GXIxn13uj+prE8Rb0Nxeeko7O1YbwZcVOjfF++/oNokhngOUMqPv0cF85VJxMjUbeKryM2mhFmG
	5cXRl0uGn/QaBwmxeZkoHMxL1mwxe9BsdYVGgkmObfLA==
X-Received: by 2002:a05:600c:a43:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-486fee0d52fmr183730635e9.22.1774309846416;
        Mon, 23 Mar 2026 16:50:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([167.71.101.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm7483995e9.5.2026.03.23.16.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:50:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and check for
 all errors
Date: Tue, 24 Mar 2026 00:50:42 +0100
Message-ID: <5975699.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260323172450.1259111-1-wens@kernel.org>
References: <20260323172450.1259111-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 23. marec 2026 ob 18:24:48 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The logic around the reset control is weird. The driver already has
> quirks describing which compatible strings require a reset control, but
> the reset control is acquired using the "optional" API. Then any errors
> other than deferred probe are ignored.
>=20
> Instead, switch to the non-optional variant. Also use the deassered
> variant to simplify the code. This also fixes a missing reset assert
> upon removal.
>=20
> Last, clean up the error message printing with dev_err_probe().
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


