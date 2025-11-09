Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993A202979
	for <linux-sound@vger.kernel.org>; Sun,  9 Nov 2025 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762729323; cv=none; b=Vz2idGyAq7J8ljAp9lDqVe6yhYo3q8hIBZxDcHHuxyytRaLiUDDtMzmrZVqVyskDAyONz3VQ9HBmHpE9U6pnZds9MPDIiK4AyxtHkoN+YXQCRMkYcQTDg/SaKMnZ/gioq5LUFbytySuPyg/VTwHTnUrb3zEcCyraj4531UKC92E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762729323; c=relaxed/simple;
	bh=3/L0T8rSm6gsiLWrh0ubcOyIYT6RaCJ1Xiq49GwI0nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6kMf+2NlVd5bqOEQXw/EnkKBTG7PbV6u1mVvQUTADgNMk/6HnfqFmtqSxBz+NJJaU2Zjiate9ECQjTDaYnlyP/EtFCXyS6LQ+6II5ndXgpKkgWFYBidPGNr9iIWkSJQ2Z7u1/ZGn8yVD3FIox3vlVuq1/D6mYumuqJMxQM3nqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=coGoAD+5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coGoAD+5"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-591c98ebe90so2521515e87.3
        for <linux-sound@vger.kernel.org>; Sun, 09 Nov 2025 15:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762729320; x=1763334120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/L0T8rSm6gsiLWrh0ubcOyIYT6RaCJ1Xiq49GwI0nI=;
        b=coGoAD+5cxjVmuqTw06wNuC42yPJgph15O5XYIQAV4KHu04uIfEVw1/Oz36dpUBWac
         pVYaX2Lk2P0Wr9bPUCojavFmJUPNiw2zk2N0iZRdNa2z5s4g9R9t+jnj2du1KLxJC+jN
         21nO/zmz3Naf1B7y/8ILyhaVfYJNylzR1HZQcKBs9R5hG3f+O5U6Lnf0YKzL73pQEKA1
         X6OUAIdUpgBmvUjWwHyIXWKaTb+ud7tdaRzzBolXmsBjHgiBjuj8JFWFlEWwyuWqETzQ
         PfL1xVOwOMMKJay//Negz2oQQjeH5dIVoRHfVIWdcnrpGMNqHv13Z6vhwsmOpiceUKrb
         7fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762729320; x=1763334120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/L0T8rSm6gsiLWrh0ubcOyIYT6RaCJ1Xiq49GwI0nI=;
        b=gG7o6XLUfDqCDSOHHsKLCCNO80+b1xLLp/XCi0jvULxJQqNwOTZYPoYqoRNlZioHTt
         iO91eAujB8vwQYnyZmHrz6kjA3Z4fFM/5hzfHpRMIFMwmjVIwutAWAgAjwd1Qx4QsQik
         qmhWMIuRBnZ1MlbBM1uMX3iXatoKhnoFZKJ6ueTuMdSoquFYMH3qSLorRf9jQon8yxIS
         5aAHjLC1VpvqtnNj/EI6sBGFS6/ZrcKKD9TheOS4QbemDHEgliby6X2PgX5ZXaRh0vzz
         3n/UsnksrnNq9fqP/cyHnwLUGGTTrzCwzbCqpsLeyIwWZeoxkX7TPvgwGZTP/02thdEw
         j+ww==
X-Forwarded-Encrypted: i=1; AJvYcCVIs1zeSlSjX1zOBwcrR8I1NbJklkFJxk1uZN5FRLV+3B+oWTnGKV/7vscZs8HpqwamrUH4zB6jpCCiqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaSrANmPgoCBJx/MfFAhssBx0m5OFyL3PN50k5aKP0/a5fXYvW
	eqOjKD50jPytVe9zPjBn8yFPlayovwy0zhhiMnK7OJK8g/Xtq/7VE91+8wWIaRx5v6DzdcYbjpg
	ET/Xpw9IsibQruKf9FDoMsBFvo0qxXHkkh0eelTxUTA==
X-Gm-Gg: ASbGncsAG4wN74G2EzgV5Zh4bp40onLsqsPsKRM6dBBqDOzwtMmFAZSz1Uncw+0RJR9
	x4eFa/PnUO2faQyyV6dzHl+tC3DoRwjZ2PT6nE/gzQEX2b63O/YKVu7t3ZD+RQxN7exJ1shBGcs
	fQGgERlf0GV9IVIm+VChsgFP1hEI02YVP18Z4OIAvucRMV1+p4yUzdsqFI3f8UXJqoqLZd2Tu/f
	MNGIYGsXtoCnD0oemPVZzW1ZM3R8V5BguEkLKPG4TA2/55+0tefRnFQd4aKXK3nFiSCFcE=
X-Google-Smtp-Source: AGHT+IEJqZS9dOiS0BTy1PWLU/LhcYPWlnuekntfeZstCDkN8jIWeEWUqE9o1x1da70TwTio8LtGZ7NuzutBZINWzRY=
X-Received: by 2002:a05:6512:3d04:b0:594:2df2:84ab with SMTP id
 2adb3069b0e04-5945f186cb5mr1826403e87.8.1762729320057; Sun, 09 Nov 2025
 15:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929031031.2230-1-vulab@iscas.ac.cn> <20251028030509.835-1-vulab@iscas.ac.cn>
In-Reply-To: <20251028030509.835-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 00:01:47 +0100
X-Gm-Features: AWmQ_bmRbj12Hfpc6B_yMJuZyJtxM4kU8pIbrDCZ7L1PmiDyOKOscnGYzc0nt7M
Message-ID: <CACRpkdbwzEG8fEO7mbgXTW3nn4rLUJUidHW7GJ+-OWYtch8PNA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 4:06=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:

> The driver calls fwnode_get_named_child_node() which takes a reference
> on the child node, but never releases it, which causes a reference leak.
>
> Fix by using devm_add_action_or_reset() to automatically release the
> reference when the device is removed.
>
> Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
> Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij
