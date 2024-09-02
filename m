Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB91862AE
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265743; cv=none; b=jVvtHsS8RTPNvx9LUsY03lXdYw3BI2AQTi4G++VoKs/YTVzRhMeLLetcmeJiuJQ0E250e0vxeKy4UhwhY2GnozdJhIM7AgWrPJBQypxSDfoqh+rNlLzn/Y0iKIUe3uo4NH1QM2LvZmQdPWQ62lc4y4rAg1undpyviyWnJHpfqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265743; c=relaxed/simple;
	bh=MIaHRBbleOvp5Fm3wN0MH4xZRqewJGpHkVCnZieq1Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjO6xC3+jklh7GVX8/i9qmZY9GhypeXFr8PyoxRNeZwgy2Hmmh8bx9Ec9uUQaGZuRAsjgbwpFrvxkNifnSmfgSk12PewOKi8gR9sG4wjr00ZE6pVrXaa8bCSJiYzR+20PpVA2uPJMlgElrLhOOhJWlXQGzIMnNg4p1CauZp3nGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oAbeW4gg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oAbeW4gg"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f50966c448so43821481fa.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Sep 2024 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725265739; x=1725870539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIaHRBbleOvp5Fm3wN0MH4xZRqewJGpHkVCnZieq1Fc=;
        b=oAbeW4ggX0U4yqUs0IosVF8L62fxzOdOxQKGRYvIrHSB2mpCicW40wLgftKlx5WFwb
         bbJzm6eokrSy928Ld+WMT2Q8oPAuMowVAD00HSl1aAEh5l+F/mgnMuB+56CYXLq8Z6Cy
         e+fqTfmIYdVnUU490uF0mPfg7CaftHFGQOxSLKBCnnS4uEQqsh3toV2zu9/SLvwltcMp
         H+rmUKPaqKHyhpSOKNE1W8MuC2LxvUjWyIzmaAmACiyPqmDKAMZ6l+iGYIlVqGlzkauM
         3bwjZm+1PPH4OHOdVuLdkYXwk4YHbizlN2/XN1+SsNirjNtbINujcn2qkysgUR6UF7m1
         ncIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265739; x=1725870539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIaHRBbleOvp5Fm3wN0MH4xZRqewJGpHkVCnZieq1Fc=;
        b=KANzHyNqmKN4HK/JypXPBYBErac4PmtJ+J9dpOFhiD9UISRZyACT4V7v42oCj8xQXV
         SbUQ62IaNqkIFfM2QtzCipS9cu7wHQeBtkX75MEk3cTbB8aTEeX5Z56fVGc7WDafq2Uj
         gncig4Nrwzxh8I747tjmX77HpyNCbkyoc/C/88TXYHyr9989Vg9AKdAxX5zCxfA/4Vnk
         EWrNMADn4vGxvU0ZTe7bAPcCb+RsBxQNit7DNJf+ZoLy0lDwe/KUu/F2OEEmwd/yBNHw
         M8To8fdBYjzSRkEm8qk0ap5Z+AOlMDfVt0uhWfFm2TVi09I1itRVe61kU4g8YmeNi7tu
         qmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgPf+4Aqw/UGAu3hCxoeVHISEZcLSFiS3UPS0j68F3nVVA6+11ste/Dsj42EYpOLgB+1lHgohqN6byxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr3OmJHjY9bMPlAGf9VZRwgPcyz+U4uB7yVosIa3X0bYqd4dfh
	yr3D757Lzg+g4/S3xi9r/up+zKfU/tOJ/zfBoNXVrNmYhsd/z+MO0zCWR8qDd52g7RJ8R9AuGiH
	CDm9S81YgklAY57vY5WcG5cpYQ2i7nmIH9l0ntA==
X-Google-Smtp-Source: AGHT+IHPWy3EoCohm4ZQ7Nw+pjtHINUGWbi0iXZ9E+VhoJRrDChfQmlQqhKT7iJcy1rrIoGEA3CKMiarlVi0MZwFT9s=
X-Received: by 2002:ac2:4e06:0:b0:52e:9481:eaa1 with SMTP id
 2adb3069b0e04-53546b25d21mr6803224e87.23.1725265738824; Mon, 02 Sep 2024
 01:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829044835.2047794-1-yanzhen@vivo.com>
In-Reply-To: <20240829044835.2047794-1-yanzhen@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:28:47 +0200
Message-ID: <CACRpkdYMn1FyUFrhGMx=Kq=zK28o1QX-pnJ_tKihduouML4aeg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: Simplify with dev_err_probe()
To: Yan Zhen <yanzhen@vivo.com>
Cc: ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 6:48=E2=80=AFAM Yan Zhen <yanzhen@vivo.com> wrote:

> Switch to use dev_err_probe() to simplify the error path and
> unify a message template.
>
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
>
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
>
>
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Fixed up the subject and applied the patch.

Yours,
Linus Walleij
