Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14232AD23
	for <linux-sound@vger.kernel.org>; Fri, 29 Nov 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732875438; cv=none; b=DnAxpOlLZCIWS0eN3TJdIp0GXS+Bf2tbyK6/8BcYbwxSvt7PPQla+54WqcJ2EkYLjl7RDXEIQz8RKsV/vBb84JCvsgqLnbcnH7E+WvUuL+Ka5gvHsAhfjPLvbj8XIqGKl4dhIJDXXBcatL/DeRhLH2btDSnaKaJ4nRO4Gu/0Ou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732875438; c=relaxed/simple;
	bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwDitA5NqHwvX3bLrA+fO/6jIWlnK80Brq0y+f/g6pnO16bf1zF67zjxDwOqwABXj+sOyc19qQHJApA8gV0InjGbQr+VSimSdNvWq3uKHTX748CpahXqIr3qTNNxEyPZXAG2EVyFt80Mh5W5iYxqUlHPS7no0I6D+dPt5cXNXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0XRLVeq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0XRLVeq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de852a287so1737325e87.2
        for <linux-sound@vger.kernel.org>; Fri, 29 Nov 2024 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732875433; x=1733480233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
        b=B0XRLVequSnqWRjkWtcLtPf1NdDFbNIWNT/55UQ/mER/7wt2cGSVQfpPGop3zCqyCy
         TMKxx7U7EUordvMkq8zPHiW3lUmGHc2qWOT/DVLOl/5SNQ+j4INfT/TPKSJIEn8zQitp
         azgcRHscyizQBPsXmqb9f8lHWGo2UKtUuJLwLOer5cn67PO+7oTS8pPiFhFs8TeCP1tk
         +vTmjphQbUuGJsml6P1LBDwpCFTwj4Nq0T8+P3di1jFYZRTUKmtGUnFAgHmimk8G9IdI
         HY0ptc45dQAFS8iff/KAHNqfJZYycuIpV7HMg7LSIcz75sckk4dDzceV100N0ewo/qio
         1znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875433; x=1733480233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
        b=SwgXoV27bsI3BfQVc7kZUKqgwU2fBThxVPf/Od+ZruJtpz0tsM9e0RNuA3iA2PHtnr
         ALvm6u6sBMBIRGrKLhr2M/e1boVjBRaSK7D9vOiUmzYvoRbyvjmsf0dNX9+alV43X1QF
         u1p3GX4Qi4Tmr6+5B7qxf+QO/krusJoHzkIfQz3YhDkiu/MyObyw6JQx9/BDGBy2qAis
         KCmtuJP0FlNtSE3UuRuuYKAbyvzyN3SoEOxAfDmKWEzjRXWU7yJXVj57rsrdS/Vd0YxC
         QbGAAC8QnUjV6X7qKxEMar9PSyl8/E+KIgfBe673qk8jPxHEW4HbB0SM0BqhltpppPJf
         uFTg==
X-Forwarded-Encrypted: i=1; AJvYcCWdWyQU40jq6uRxVw+Je7Nt0kyHORD4pRN06IyFAEyDvZutO+k2ome4Nzw/HlgGOAI8qWFI+ZGCT9vHhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEPW0G+dJ/P0qEvcCyfAiSWz1hWOw4tf8BM4670SCFSNVhCIV
	gR00j8REIpIvG2QCAJBQS/iVMsd/lKWPNq9PQUNeP7RZR0aW/qtKqdW5ZAFN4NtxL2bIpzZf+gM
	xuvYRsAp8Ii979920mmM4zBPGRBhlfNIHabNHOw==
X-Gm-Gg: ASbGncu+lghvuStz4130ozjUtMqAkoQVWM7BvE84w63UgRLBPFjDOd1czx6Uyx2ug3y
	CbIRje5dAZtPIHBGSoNX65Jf6MURD3N0=
X-Google-Smtp-Source: AGHT+IHsgFbzClrBYfEFLufjcHJSY9BVx1yMAHpzLueAWoM1d4Mtai5958T8vHB4BDFRgLnlbKD/8tkWebNyM9HrsEE=
X-Received: by 2002:a05:6512:3d88:b0:53d:ed6d:71cc with SMTP id
 2adb3069b0e04-53df00c645cmr3259605e87.8.1732875433264; Fri, 29 Nov 2024
 02:17:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126172240.6044-1-raag.jadav@intel.com>
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 11:17:02 +0100
Message-ID: <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com, 
	broonie@kernel.org, pierre-louis.bossart@linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 6:22=E2=80=AFPM Raag Jadav <raag.jadav@intel.com> w=
rote:

> This series introduces a more robust and cleaner devm_kmemdup_array()
> helper and uses it across drivers.

For the series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It seems like Andy will push it to me which is excellent.

Yours,
Linus Walleij
