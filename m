Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3F39AD2A
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616202; cv=none; b=LvM8INcZbCyCyKRVWtZfYvA8SgUsaPMosH42znnOpzqkgMc+0FPKo2Om9c9hMPwQ2rQN1+zaeR81klzjSp659UvpS2IPDd/Q9EXjUOIJ+jq6TTLncgOO3PqElgXdWI0TZnt3GoYnPW9ODwBxJwkigIwYpkNntTHX3WxHQCH+SSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616202; c=relaxed/simple;
	bh=ZleR3ioJcTTR91AyToYtwQAV3TlNsGAWt0uRafzJSY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CycC0ORKC/2nXK9BrDkNIykVmDMeKw0JTXWWH7WR+RhM7ZiJxWpBQWSlokIwO44YDaWAXIyFjmZdN6w+ltXGppWYPo9j+gdHS+pHl4nVtwdN+PPwSNLoCY1bcWriGNiezqYhlCJ4KgWjUpqeYi7w+OerqeIt2HY55e22FZOAa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+V2Xb57; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+V2Xb57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9631F00A3D
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616200;
	bh=ZleR3ioJcTTR91AyToYtwQAV3TlNsGAWt0uRafzJSY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j+V2Xb57NLIFLSI2VHWxiWexNMgM9piikLd9PPCADeMgIuP8N8LL6BYbJPuMqZLP8
	 HwlqoyhGsYsSlBGpEmESL3CXdNsgS7kMpxL3w4AMxgq9Z1ewmkHSBCnqEDCPbYHp3u
	 NtqGVNIARB7ycQMR7ELfctG/nD9wS7A3u3mam8BQCcAdIqYFM8+9+BOSLbrM5Z1nam
	 Et38NkbI/rMCVGnM2UbC8gl2PxFf7GzWGlJwyX79ZKwpQMFI0UuS85yYHOzmVJ42U1
	 HuiD3dUXwsR5Wh87eG6Qm2GD4yy867GGP7bgBLfExF2Zqujy2yE08k6nZgHNDd4l2I
	 pm165rk6vpj7A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c9452243cso580231fa.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 09:56:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNsOGFWf4zztCttNhMgDApBSg/OYE4dd/o8+5iODhjDpzXjRbvyj770Q1t7nVtufZT5SFeZXXHT3K+tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzarwEiwzzBXvI+4Nsg5CvhbYXJK4lgADrabmY+4v9xEbhVa4dm
	V5flLXrpg+wCDUDyFtV+FfUMgATUaoH9tN9fQSnj6/oG/MsHZQ+RY6N15CojA3OO0WTVFKJ0xji
	6shLkeOkpkUhG/UJ0RKQaeIKUu7v48V4=
X-Received: by 2002:ac2:522b:0:b0:5b0:1108:c57d with SMTP id
 2adb3069b0e04-5b0114a2c3bmr1207530e87.46.1783616199309; Thu, 09 Jul 2026
 09:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708125002.202515-1-phucduc.bui@gmail.com> <20260708125002.202515-2-phucduc.bui@gmail.com>
In-Reply-To: <20260708125002.202515-2-phucduc.bui@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 18:56:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHSmtKeMhoqfDgn91E8WfQ8Oyk6MJxEkZnV7hPLxUHZw@mail.gmail.com>
X-Gm-Features: AUfX_my3KdOnJKpeFWZERXUk0JY70PEAnydvzyPe32uBhM8Y96UyY2wPOq0eHcw
Message-ID: <CAD++jLnHSmtKeMhoqfDgn91E8WfQ8Oyk6MJxEkZnV7hPLxUHZw@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Arnd Bergmann <arnd@arndb.de>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Chris Morgan <macromorgan@hotmail.com>, Dan Carpenter <error27@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, Rosen Penev <rosenp@gmail.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Teguh Sobirin <teguh@sobir.in>, 
	Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:50=E2=80=AFPM <phucduc.bui@gmail.com> wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Looks right:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
