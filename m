Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7D14900B;
	Mon,  6 Jan 2025 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178532; cv=none; b=az9qD96Ug/KV+2aD9Lujokpm9E1fcnQRZXIaTaQoNhmXkm4IHDlCxCNjPLb3d3CaPpzM5sqHg9ZOG9AECTaIYEUqP4Js9J1bRRcNWx32LMk7bCDM5wt0fduVdIn4GSHpMcT8HIPdjAID3bwglGA1jXFcsyO2lOyFEZtySsguT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178532; c=relaxed/simple;
	bh=I5EeJ+Kq41D/Bv0Ajrh0n4I+EJ9ou23hfrzgzaRrU9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgY+I9+q07K6lH4TfYjVrFuEbp7bQ0+ruSYYUpBXsy00rKoZxTzLM14aNubYZFmiBnveqGlBWAHjcHXYNPABvU0eCpVri81f7tApHWnh7sk1Q5Kp1EOrKdCv0/Ha8vafPAHdQJmIXL7jIH8yC93pLLON5ikYaBn0FePH4gc3S/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30227c56b11so166690621fa.3;
        Mon, 06 Jan 2025 07:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178528; x=1736783328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5EeJ+Kq41D/Bv0Ajrh0n4I+EJ9ou23hfrzgzaRrU9A=;
        b=MTI5exsJpVyh4SQLum5yY0MuRL+oHcoLJLnnIfBEwwwdvu0E5/ug91tcLcBeUp/E61
         MUqtrzVwydRxvHBDPtYkKN948P5GzC3xE3KbavNdOwrFB0n4zdX4zNwni4bNvZg+051R
         IAs9/cQrcmNmXKiAoEvVihmMf33Bem0yZY2mDZKS7djutEZyKx3ftUNVpF6HlOnH1PJq
         YK+ulSiYVVq/GgSJu4A2Dbyajjc1c9XimGi+4Rm1y8qhFe/j1m0Pt4A9bpwF6wdikrMc
         HazPPk5S3b7E29tXo8LBBa2l/sEOJixwuEHfSkoui5qm5RkSuSnCHdYF+daA9k50A1CB
         T4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXL8w373k0KFAU5OfeQjVHWG0DlFidNlR5nk85ciABM0C2CHJtqKG4D+f8J5go39hco5aU+arFiyg8XXnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH8LHtXwoqDG7Lc/Ow7Sie0RUuweSi885OdyI58vwCNzW6hycj
	jlUYL2n3IOOwZRJFFrJpR9pUagD9x3Ii44S57D1PITARKtNEuum1B7bnpbLp
X-Gm-Gg: ASbGncsvUkXx2rp2HTi2Zl2A8IccKhsNl7cp67yk1hTT6QZOfQBGuD6m4YTkrGKBd5v
	v45NPHWlTypdsRZpaafuFGiTzCd2gXqY1ZsJ589XW8KVVXgAGdDN5HQ1xEp/Rn5/SMNL6d/Lcc9
	flxlLRoZ3UEfiVb1e5iUmn1y2Zz0iJIviCR8T4saPGIGfv1KIyGKo0I3VMzdWwDuwjqhK6c4QhA
	aNSEWNPElADa60zCvNoq0kZc5FytBxz+TsNh24heL+UlMz1cXkb7GnLxVG95WKFEeRIkEDdBIni
	rNrGFX6Z/NRvyg==
X-Google-Smtp-Source: AGHT+IGN0YuboTKIrmFQpSOUYgzgc+yDJJvZwawWExyaf8cFl88nMGRwlAybn3qE+DgWswk/K1Vw6A==
X-Received: by 2002:a2e:a588:0:b0:2ff:7a4f:e770 with SMTP id 38308e7fff4ca-30468603d19mr184131301fa.31.1736178527781;
        Mon, 06 Jan 2025 07:48:47 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c626sm56041981fa.13.2025.01.06.07.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:48:45 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30227c56b11so166689531fa.3;
        Mon, 06 Jan 2025 07:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfd4PzUmzxh8RPvDrsGThgztrAUW2NXOuBGJmHBfl7HZX5/F/JZ0/xT7nNyEUG3FNrHBoKDlIn8rNwmqo=@vger.kernel.org
X-Received: by 2002:a05:651c:2129:b0:302:4115:b69 with SMTP id
 38308e7fff4ca-3046851f488mr190424841fa.8.1736178525182; Mon, 06 Jan 2025
 07:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211222205.1915027-1-csokas.bence@prolan.hu>
In-Reply-To: <20241211222205.1915027-1-csokas.bence@prolan.hu>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 6 Jan 2025 23:48:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66MgxCV+rNVC4NaXUFtxMk_=g+CyStLjpb=5e8Q0HNJLw@mail.gmail.com>
Message-ID: <CAGb2v66MgxCV+rNVC4NaXUFtxMk_=g+CyStLjpb=5e8Q0HNJLw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:22=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.benc=
e@prolan.hu> wrote:
>
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
