Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC771946D5
	for <linux-sound@vger.kernel.org>; Wed,  5 Jun 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717582667; cv=none; b=cM1wmEX7rrFb2tiuaIKgZUld4HPeDYCjj6U/AFdkKtXBxtIkkuj+gIaSWLa2K+Il364UUSQoBMflc9gefQvELBJ/y4wTj2CEZD8hOT+G17qDfzErGaHniCgpW5ww+oOMn3YIK8UfVobjaKcNe47a+2lcX89OsMyAk0SBM6Ljv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717582667; c=relaxed/simple;
	bh=zFRsKi5wfDczGQ7hwffs3Ib8QEc7Xy/Kj47DSRKznmk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qGDgKP/WE3orXQ4GiWEKQQUe0cmCKr8w8phP6LtFM3iMcdb5c2Sw3KSp52DmPNdvOf7e8EbssYjjlutymaJV0dbiOMRslR/I9xdjj+N3HmzyVMaJcv5wWA23jCvEPGsBBcWLv3xNghRuJpxk9Q61/mFnyZMeXegVPq87bw+Ddd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzDapg3W; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzDapg3W"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-374a6987a62so12032615ab.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Jun 2024 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717582665; x=1718187465; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gujRNmGwoDPhM7MJNKrffsVmCVd5k8er05O3BpvuMmQ=;
        b=RzDapg3Wi/bo5ddNkGe5HSEhIh9j+uRyMvJITQhEFBVFgFPlhCqgFDrvm1AQWdp0yM
         8bFtGWhjM5RD7EUHSGj6sYJGFuJwlIlxlNi0pUhBuV5GNhBua6A+rA1kAwq5E2dZKVPA
         8+wYVSwjt/BcEVZSzBXAOYpWv2GoL4yB0HsfH+X10P4yWkOwFauLJ+KrDb4a2wfhJvHC
         X4kZkBVMhoO8P5oP2cbIuLFrOB/E3kh9crxCXXYiYlEEyu0i7JtD1Q9+39Jkfmzm8PwH
         64E48wtJ1X4A8Pqt3T8Wb4k1QaTJ7SOaipAlpqvOS5J6uL0jpGkmQUou2xDpa2V7tVsB
         NVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717582665; x=1718187465;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gujRNmGwoDPhM7MJNKrffsVmCVd5k8er05O3BpvuMmQ=;
        b=tXSCOUBDGprVHwnQEtlcHRsxpkCQ/KtZHz9+B7mQWCYK9oe44uZy3TLlShf8eep6wN
         doAvJun178AJPviU7w7+5AlbT8Nldq5cnbdsObIODMuZ0qynriL4ohB5dx4GgFm05lXy
         9oQtVHpgAzL8+4U5CsAVcXS6w6N1tVKGbOeEhWEE4JWDBGwxkAChpXZ2KuiGiY5lU8gA
         vhfDs8ZT2cs0OhlPp6GprAqKXEyX3SyHVVYYnY4FDnOrzweP/XuFvkYfWggvybp5HSsE
         L3wzD0xzA5VIIutOLK4MFrBSIaJukFqCeTGABga6nner+WF2gD9eQIQCZNqBN+IXviBH
         i+3g==
X-Forwarded-Encrypted: i=1; AJvYcCWTe8VQCEtNvx6eFfLITa/1F78klYXAXDgAuy7lBiTpxq8ollZqoHZAbXD3mKLrCi+F3y6lp1YJbk4AdOdBw1BtriklkdW2OlOMUqI=
X-Gm-Message-State: AOJu0YyC2Q0laNuq0nZIfT5NdRF+cEw5tCH+dbShW/MQW2+EfRCodGij
	Gf25FQm8TiDgr3jlZNQkVkEvP1y5VYpYw+3V4yAjnJJNGUh9c6JMunA6bnOm8XlR0KRKddVm7rn
	xW8OuyZJo3kzTBu0wybpM/D6WQyI=
X-Google-Smtp-Source: AGHT+IGOfRuPRRrGwqZvcFgv5HEc8jrjI1RBzRZNG/XwIcZFd3dFiqmYo8D6P7ds2BjaxzAZuVZ3whuAQMQq5wNK+BI=
X-Received: by 2002:a05:6e02:1d16:b0:374:a04e:3d8b with SMTP id
 e9e14a558f8ab-374b1ef5ac2mr20724015ab.10.1717582665192; Wed, 05 Jun 2024
 03:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Jun 2024 18:17:34 +0800
Message-ID: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
Subject: About snd_soc_dai_set_fmt()
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

   Some use cases require that the format of transmitter and receiver
are different.
   Shall we define a new .set_fmt_xxx() function to support setting
fmt for transmitter and receiver separately?

   For example:
   int snd_soc_dai_set_fmt_xxx(struct snd_soc_dai *dai, unsigned int
tx_fmt, unsigned int rx_fmt);


Best regards
Shengjiu Wang
