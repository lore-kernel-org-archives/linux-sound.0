Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332081F60A
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706210026; cv=none; b=V5wJMuawF8yWoZtsfIXpE50ECUHFpdV+TchUnDVuDXtlOlBd46xzrshGMUwP4pr211TUDQ+0vjI3Dhb005PNpM3+xMijpS2BTrhEx7TsC8TgJCvSzVZjg6FJv2Owza1PH8Sw/rYNuDbAGCz69AU3tVAcl7a4/Mc+71bxXZ0CtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706210026; c=relaxed/simple;
	bh=YP+ZACbPdPDNPp0wqbLMwoK7ybKxr6Ai3T/jgg7xKN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zcq3wglGwm41gQKJkWfUMXpn02SQxqp0EDW59BM85HY4DBytTlDzN+8jen/cGX0LrlNkLqz+YU5IP4yvZwkEotuThFE8vyALaXY6GVG4yLlbmhljR8J0nY4kN9o095a/IVNaUMW8yu5pFSq7nNPsCYgDDNaykNoMiqyaRuasGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8T7jztk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8T7jztk"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so8491286a12.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706210023; x=1706814823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP+ZACbPdPDNPp0wqbLMwoK7ybKxr6Ai3T/jgg7xKN4=;
        b=I8T7jztkRskud1UiJApM/pVjaFZJKJvrHjAWrW8gPd0ywa8wvA3t+GJ88eCkSeAAOU
         lH9hs7a+eD0yyaDGTz9ohMBo0iVCEb737FJtFSYhNbQDgo5DTi3CkcgiwbqgJWTZfzjd
         qPVPbbliSr/3AOtnHRqKOJshn94FcNkc2qPqraFpxDZ21U8kAi647CLRNUJ+c+Iiz1bb
         aJP6zBrjYLRgKU/J+yA3aQ7AHghOxyS/v69VcBlGD5pgw6kJywT13rGL8VVcBszFIJNv
         Ht0ILMSECkFWjvRxfFVKE5GuRQYgQSMn7cYT7yHOIZ5F5RsEAV0gSm1xdia7lO+aBptZ
         hnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706210023; x=1706814823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP+ZACbPdPDNPp0wqbLMwoK7ybKxr6Ai3T/jgg7xKN4=;
        b=pBxQ6B3N/ptM7biQXZGjfOQfgqrCs+M/M4PNRg9s/ColtT1Ue2nVTe6DSfzjFFZ3OP
         JUtlOeNLq8mRk+mpOqfOS1AFOiAX8JxFl6ysf4657HzRsD9hwAH1OGH9EHPs1ZS9G7VF
         7tIzEFKOyOehqqpr5R8TKY9fxVPbHkC5o6AqyJsmudUJbS7fwiNjaWSa5F13J72eis3B
         aEOrWoqMXF0eP/Z0fKDh4znCbkoHjMDp+1nZTf3j5y4X2+Npa4c5+ELrfiDWZuVwD+yM
         7x+gcuMYKHfNsMpfLnlVOe9HXKvMU18ZbRr8ljMU74pUJNjxfnsRWTy1LjDh+BaP0rte
         S0mA==
X-Gm-Message-State: AOJu0Ywh3iBag9ENAEVAwmDnGeCxVZDY7/ZBpsEyNrDYI9+/Qk3T3PgQ
	kow5w2UlC3PWpo9NxCQEkvv27Em3Ut6Mta/vMencDdBS38qbW4GAAmrGVKMzD7pLGOKngzKKsct
	Nod16YbeywUzb4q3uoyzd4KR3J7A=
X-Google-Smtp-Source: AGHT+IGfkSRCBrrvKqqMEq4ctCl5dmSmQpuhXdTB9wouHDjmCH/Ept/X7A8N+L60v5X4vx0N7tei2nyHpa4fgsdLG1M=
X-Received: by 2002:a17:906:3e46:b0:a28:e6d8:dd15 with SMTP id
 t6-20020a1709063e4600b00a28e6d8dd15mr24850eji.33.1706210023157; Thu, 25 Jan
 2024 11:13:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 21:13:07 +0200
Message-ID: <CAHp75VfASF6RB0eyAEs342=i32YMG1=nzdmOYE7tKKUkRpUZKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] ASoC: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.

For patches 1-5,7

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
