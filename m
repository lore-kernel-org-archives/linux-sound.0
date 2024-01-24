Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E6135A4E
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706135368; cv=none; b=Poemz9txYzHmqUqyf4/YOLHzbozBaIPXO7nnyOJxFHHt0EOTdEOVeXyDQGn/+gb4IhwMg75NNOJd5xl8KKTvoLH952d4fFQFynZdD34pte3ZhQliMQXsZ4DnxKCemyEY714T9+etP6KxxiZ7eo+z8hfQj2Nx7DYpOsXszC4J1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706135368; c=relaxed/simple;
	bh=9Gt5rRGulb3wd06cWnKlyAly4andqii82CRBLDIPKS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iwqcr4ixhfe6ylZfCiKGOjLjDQD9Vn9Jngd885hazdThAwrXuApJH3FHLEJar3SZhTW0bI58KyAJnP7lljM7S4hkcvS7TJMrBRIZCl0r3TTmTvA628SVYaMi1rV4UCbgPuU7HpBhkBN+HPVvrk9GYQ2rIKthAuIvxKdN95oUyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWTDhoWJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWTDhoWJ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55cdaa96f34so269517a12.1
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706135364; x=1706740164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gt5rRGulb3wd06cWnKlyAly4andqii82CRBLDIPKS4=;
        b=YWTDhoWJqdufD+AO5rGuRzj6xZgurIR25UocIi6N66w5+pOOCgPaGNSJBTAxykC0js
         BDcodeEHl061T9hjnT3EaUPR9PruuUQC9o/jSlnipAre1CtE5f1yQzxlJGB7QQ+s7Gtp
         YaGEuqqA2+6WIDCiKExfv6xtdVNVMqcghAi0itU69iNxKqqqximrbSouow5y3LTM16Mk
         XvhPrBeRGNTACf7P3DcYxPh+NyRZnmSyLBArlsS0uziEiHYOP4OKdY7bqVaMoIa72jTF
         2hEq2bkp8Y54MLc2QdM4k1RlsZWY1It136UoxlKjr6glWwm9MiW+5G9XJvlduQFYLPx4
         W5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706135364; x=1706740164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gt5rRGulb3wd06cWnKlyAly4andqii82CRBLDIPKS4=;
        b=vdzhJrDXKYM8ONur+DN79gH6MkCE9ZdCe0bOKCfYtSufHQ70NiMo/uwjnP/g1PeATR
         uBlsYTt7/oo3V/YuqjS9u9fu19Tv+4rJpSnHva3PRztto9mcVS71uKXyUWj7VZu2M2Fd
         HK3k0IZG+hVDqPN4ztx78od/LC7LBN2Yb2hO6YF6w9SInWygjQ4uahO84eiT6B6hhydZ
         1BGWpDxarhMsHKfSrrW4Z4H5fQCK1WGi4XjNh3pnerOaLZuIDIX1KbtNqGT2YLap9R+g
         byjyrmMuxVa8XeV/Bv3kHu7SRE45CJ1aaBZrvmLuCQPTBAWBggAwr/FJ8KmgfKjewT/k
         8d0A==
X-Gm-Message-State: AOJu0YyxKdF2vaSHIGbCErNiK48VTT0wLcdZbOzExcdiGlpgnW/wfuw9
	61A8YklaGrcr/Ay2Qbca+GR8wLeI8uG6Ild071QuoD8h5aUR/huyjpTpmT90u1yIZBYsxExfoBl
	RbmwzOaCAbsFFEvkZ3+yEbwelEt/F4iVVmFg=
X-Google-Smtp-Source: AGHT+IHOWyXqlBTT37OHmyeVfqsAgCQ8aqjdgdoqjiRKpuDi2Lm4Ok/JQ3eRX1nm++sObRQTRVGOa7WSOVvdpZf8Ef0=
X-Received: by 2002:a17:906:3105:b0:a2c:d6f7:5fa1 with SMTP id
 5-20020a170906310500b00a2cd6f75fa1mr229836ejx.8.1706135364610; Wed, 24 Jan
 2024 14:29:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com> <20240124165558.1876407-4-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-4-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:28:47 +0200
Message-ID: <CAHp75VcBJpmVWBEveT3HR9j1KsHgd+O0=Y3_QR4gTJtFJPtt7w@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: cs42l43: Add pm_ptr around the power ops
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pm_ptr() (in the Subject)

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

Commit message?

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

--=20
With Best Regards,
Andy Shevchenko
