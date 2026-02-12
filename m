Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40094221D9E
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770880184; cv=pass; b=eCGNGGtYTNwBdHdTki5g0Np/rSIl70gKy4m4yDkmqLsrQjP0/V5vgOb9clvFyTS3qQlug6/kfak2IjgWOQRzkwKWCqVstXAvHsH3s51EG8TA0zygo49AHejQU1hWfMdgATuxFQWBfy9lP33K77BtezeM+KAxcsHtvrKJYrG5rNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770880184; c=relaxed/simple;
	bh=Z2nqFiMrEK54GkzHQWYfhFXprKLWoPHmJuZaC2Yd5rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+0IXscN1+s2JIfuhfJRV/oEPHCJKuEsEfEa7Z0eGDRmT+uqzYQKMaOVvsTOeAehwVOSIpAYcTZC8Y3siVdvf3VVSh7CyLzyNN6Ldgha0/jhVICcKrYKImXE+oMC7gYls3G2lLd/02Q2QcQm86OhX+YPKZUxewfcwR041btMTrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCV3ejdt; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCV3ejdt"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-126ea4e9694so2221844c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 23:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770880182; cv=none;
        d=google.com; s=arc-20240605;
        b=b35kW0eloG4xlxkRTvgKWtREIPYwcNp10Qn7aGe+7ITIlk5BWYWJBVcZFzMRnlaIyQ
         PjS34Hciqhs1IpqH+gwluHFzAnrdBhQ9Fb3DAncGxj8ZOW1YcIH9hcTDy/C7sLYOeAXT
         tTn/WkuclXg1xBuXoOA/kXx1Wkvdvt3QcUDvDxf5FQx6DqcSwbABEa9pTHdzrH+Mhp2K
         cTDc7qzMM72lLuYthKMDJ/9IdFg+shaosAstV+hbGLvgoAt4GKnjaYAGjBTWx0Ux47Np
         0fRzd19mcMN4SXZqzUunOhSyUwyx9ltYkL6V87GYpgEhNsVVXDeGl5RdgP1khZTlr2iM
         OIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        fh=hmoH38b/Gzja4atJYk7sMEZAduM27JWmw4jO7J4yTOQ=;
        b=jpttLpPVMf0F6sNE0QNGt0iaOqVEydM1LcWjwhykaano0oG6udyiPysOGLGVnMOsE1
         h6rYO1F0DEQJ2/aq2CgeiFkG1nYfjdcOmpEJV0lS6ZCYRjRJyBSuZE5ruis5+0CPVrVV
         FNFGXufJd9kns1yDBQnwwaOQ8etUhnXoEqWftTDm55sJ8iYC3FsvKnvy/Phb5tyV7ZJL
         TDZCD5HCjt1XEBg5YSBrZQ+KU/EDQLag6OS1DpVGOa2b+TQBKr007aeJBa3JCIcoUbkx
         UcslLYsXo0hUrzguVkUuHby05jL5/PPg6qhfve5XJXHdiE0/Y3kw6QGN5UIDw1dCbFuN
         ue9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770880182; x=1771484982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        b=JCV3ejdt/+jPJBLeyv/SRb6bklb0gfn0QXDawZszmis1l0MWT2AtUG8V2o/Ix7WutU
         xz7FE5LoZCaj97/pgUI1t9+oXaCOvB10mg293vp9x9Jdh/WOX7JxCc93xmjutqLvAlCl
         HLJ6LqC47tgpTT4gEMJBoVhr5GeeH/Yszvu23RbJIaXv0u1+cj1cLp+n1Jj4j2jlM5Ar
         h8ZsKh40XFrzGWG9WcYjcKmFBN6SXIt7l/Vt5tyezZNQGiWJvdurak9jbS1+xgifwzD3
         Rez+0R+fkf28jOHSGw9sGptUJ/Evg5t7x+mL8YPCqkJr3tpggScfvnNQXb9kZmOyybq/
         YUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880182; x=1771484982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        b=XAs4uZEyGqX2F7/nn3Z6Pi2x2+Qu9nKg9On2w2BMMSlsk75GdUoTzn3TKxGuDICrbc
         eWV0EYCJyIj6diGjX/g1Ef69A4BnEY9MT5G7odqPbVlXPh6pEKubj87jCk8TDjnuOlI9
         anNUlLJ/ALfrymeVLGCqC4Wt+aba40gNyGFAvKwCcQ2CJiDnGoo9yBLOjCmE5Xc3aOzz
         VB/K2qBnOO5YfNBaEi/KaXCPjeVOOyZ3dDOQLkThCyAiNQCW+sWq99XO1C3j6xt5W1TI
         n6XeMeMDr6Uih0QhFmbptvE6vv8GwaqJ73p9kIbGuTAtwZj8yXRdwnHPvBjfxzNpWC4/
         t6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE6cPUpON5HvsQJUQHU3UmW3Ed1NhuKuaBcbyVGZAMN90FxHerkX1c/MsdHHCxsqx3w68FgsBg21WN0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGldk2IPYb8S8zOyxRNRGsK4sp3D3hHVZYcybD+hg4gcy0hvwX
	M2Ap2zVAPUrCHSDGtUviI3mlLkyGcv3y0job/bYl1wQQg8TiyYWZF6YgkHul63xR1kWKDAImdWF
	LAYi7e9H4C0rcWspRJyRx4su8a47NjIU=
X-Gm-Gg: AZuq6aLHL1T5oECMeK2XMPZC/WTWvTxwhMuy6iJ1ACcl0PpJB9naC6hjviOAWMMDbWF
	Tht6OIK2CrumNyZRBnIgdLgxdomqoSd5402RceYO54QOLEqUmG7yXndVXN86bCG4Hn/O5zUWxBk
	V+mfv40vuBh0evdzCnaw5KHilFiS3KbOXkt6nlljoAdtKiX+v54NBLPdtcjpVUYSeR6/rKrlZkf
	d7axjDDcfEJ1BcWNQXOqgT9mgtL+XC7HMjfpD4BfqVUYvphqax43IGieFLleX00N+qJBt3qj6M4
	IhP94wGgOUiIlUn51XGwvjlKObA3sHgwHG+rADRUQ4Q+PW0+ldigkemQwNMcsu4jHx285d4rfnh
	SsoI1jv9oCC9pZ48sjUFGrA==
X-Received: by 2002:a05:7022:61a1:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-1272f796ad2mr846334c88.40.1770880182309; Wed, 11 Feb 2026
 23:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212053036.2581083-1-chancel.liu@nxp.com>
In-Reply-To: <20260212053036.2581083-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 09:12:24 +0200
X-Gm-Features: AZwV_QherBboHyGiDA8CJURenUrUDzC_HZm3EldthyJ-DQtvEc8-3hgQOSJYk0c
Message-ID: <CAEnQRZBTHt7XjCqDzavdRw+kjSCJ3YyK9rW_Xqg5xUuckOkV5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	shengjiu.wang@gmail.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:31=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> This machine driver can parse DAI format from format property. Add
> "dsp_a" because it's one of the DAI formats this driver can support.

Hi Chancel,

Are there any other supported formats?

Possible variants are:

        - i2s
        - right_j
        - left_j
        - dsp_a
        - dsp_b
        - ac97
        - pdm
        - msb
        - lsb

Can you also add more explanation on the scenario for which this patch
is needed?

Thanks,
Daniel.
