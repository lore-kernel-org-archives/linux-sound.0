Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBDC27713
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759981; cv=none; b=YRO4v72uKMTB/VtSDq8OnTKEwEjgBamDF3J6uZvXLFm5v+c5vYhLQGX6cTGbkId4CFwzsPz6lz4n7AmLzr9h9fsCVZMK6t2OoxGUb98Q3qN0y4Hxv0G+6zQprsh2T7x3ZbS3R7c7ASzh0P6X27/xkX2IN+6nHtCvrhQXG4lUTz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759981; c=relaxed/simple;
	bh=p/7IiyjcR6PUr76HCKTZD/F7A3oNg/SYzo/DgIkEZJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCW9+9bAWBH8MibfNY/xTYJvD7S1IHUT9f5b8dJDYFQCdBD23xRX6y3BiO/9EDQffTv1/icLspMl0TtORSjpA47DFxskJ19qvvjjAH7wWbrH+SZdR439dTAou19c/El7abOApz9I7Mvj6OJj5DQs0ms/yL9VZWklhrgqRxtd1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRkJkoWi; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRkJkoWi"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-540201cfedbso6052991e87.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Feb 2025 04:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759977; x=1739364777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/7IiyjcR6PUr76HCKTZD/F7A3oNg/SYzo/DgIkEZJg=;
        b=BRkJkoWiiAyK/ri+MFHsJaFaBpqAhBSoudsYkYDfbBKKaxKgN2VvCyORE/+5ZA7BVq
         vvvw9rHxKQOApbKg5wV1DnX/RaCZVerDpo3C08m2ZVWEvSXkMLjREdjsaalAFYq8jv8s
         9zVL2iLjQePTQ4GaONOr2JNLIkTv/PdFqoVEH6bHmFp0/JjCMry6P/BMucYqkJAz8EU/
         9JQ1jaiJMS+vR7vSoE3Njig5HaUM3BaRKABPVvVwgtFzr83uXFtV+d6EupCNytA4eM4q
         xtVKNRzFdYt8hyTrRKAYD0RQGk8FoatTV3ux0q3DJWf2sIqTAMo41xOWslIHbTQp7azA
         uYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759977; x=1739364777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/7IiyjcR6PUr76HCKTZD/F7A3oNg/SYzo/DgIkEZJg=;
        b=d9gI5foHaqUrEjopGZRFkHb8n+Q/w3Buvaw6lwg3cjmN4p/Eynbu/xdotcQ2A9S97B
         fvEvmgcPUe906FOjpq2UGQKE0RRfgVKB4UdZcRrrc3l5XOleWsHjbQUS31u8D/yDByIc
         0W36AT6+0WtTzZ3ecVhUPNTPYqGk+uKTq6/hnUHdL28TcttKCt3cEkr+F1YmcKYHSTlb
         pRYTuF0TH+2IxY8HW9PDMhel6QIWa4v6KVGIh7DiYBpg7dsUXQXlMJVgTY8x4imXKP9C
         DiCRBjSJM6pRY+54I8TwrlbCLq2vl2hEUVXAkipMVp/fjdJD5MpIGPA45cbHYrS31q1R
         BeFg==
X-Forwarded-Encrypted: i=1; AJvYcCXqI5XHiIcu1Ver//hDSuNO9IDR7nCmmV5KjCUsZW2hhqqvY5yhwLohfRn9q3NQ0GpntLFLecgiltPdow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxunST0jn2prZsLuW+VQTXS3u9agtb/q+1iQkH7Viqo6g7w7zOf
	l6ALwuc+MhEtN4pe6fpPOEft+ZYLexah1mKUdYTxT3aBc79nMepaBE/tPVNreN5VQU8iGEJ8XXp
	HI1ZR0KBvm1gbq8W7eOeVrV8jq2w=
X-Gm-Gg: ASbGncsQUg3ujulZb1rhtYCI4HI1MNMEWNcAKf1AUGVRwPisvkgX5T9AMeIt1XFyI2L
	A7NB929w4xrMY98Nm0fgTxtlPGHEKEGdkI7UsDGpn3NT3jnHJLI+6nYNa4NxqiT7z1EEVRy6TYO
	d4pw9sSeggc0wLu6/tS/s+5618x0ND
X-Google-Smtp-Source: AGHT+IGls+8RQQihDHZOOFThTy2DjKYO468UdYF+Zfvm1KZclXolVg5PBq0qRORsl5NLNsMflz8T9Y44LEN/QUodlA4=
X-Received: by 2002:a05:6512:2011:b0:543:bb21:4245 with SMTP id
 2adb3069b0e04-54405a3924dmr683471e87.28.1738759977276; Wed, 05 Feb 2025
 04:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205120128.1080295-1-festevam@gmail.com> <7f78ee88-e33b-481f-9a65-88d67451d95e@sirena.org.uk>
 <CAOMZO5B0HeMbqu=uj9Eh8zh73JMnpPQ3V9m_NFeajbxKj4yVzg@mail.gmail.com>
In-Reply-To: <CAOMZO5B0HeMbqu=uj9Eh8zh73JMnpPQ3V9m_NFeajbxKj4yVzg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Feb 2025 09:52:45 -0300
X-Gm-Features: AWEUYZkObcX8Q4jFJQbUcGFWeFcS8e8ps7l9_6G0Ehu_koUCTaYCc4aRt56MUAs
Message-ID: <CAOMZO5C7T1DcK54qiG58RdqzXq4guEGuNU8Gc6ymQnuDqach3w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: Use of_property_present() for non-boolean properties
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 9:50=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Wed, Feb 5, 2025 at 9:45=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> > This doesn't apply against current code, please check and resend.
>
> I used today's linux-next. Which tree would you like me to use?

Ah, just realized that Geert has submitted a fix that landed in your
for-next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?i=
d=3D6eab7034579917f207ca6d8e3f4e11e85e0ab7d5
