Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794464451;
	b=JJk/yP2VevnU/RnP8U/PElGyoDiTufJ5VjGvLFDhnlMhHzsDotpGWLVIeZacJsohzKEN
	 zgHBvpd/RPlw2rXyLsBABwgZD5S2qn3MlUsK2V8kat0zv8QUgsShd7vTrx16/1+9o37kN
	 FivuGuAx7HoBjygn9caz6QK6iDIvcv0ehhTNCDrRmjzYdXb44s+IwAaI6EfAvAAY62fO1
	 5UWRkMbUa3y+4U9yrFuVFzvO68IjwomDGhtj3PMNSxX7DiDMPS5RiZsFaDjQzTlNTI2vs
	 fk6zzyYN7CkvXA1pMA5Ng9t8h925RnkvFDtY4TBELbNkeNMkcvB7l1iRB5JBC1dlrlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
	b=GWP0XDMKlivfEgSz1e3w0m1UfPTzN7LrapZNUEtGhnvzkEsB5Wfin753EsbNgWswbimP
	 +pT1470mMoAZX+/ZIKN4MO9B57wK2Ca+P0fkITDvnCHZdH0comubY2gJNXCZ/eWlxkjEf
	 y7J9xc6z49QRIAGunmE20f04I78Zs3wa//JMCGZhRbtM94vWDToCJ+QNTsvr/D1xYoZlD
	 eBrQ5UI3oTMWI7QNzxmaZ4iEfwZS/2yoFWGxk3ar07U3dkTmjQdJF1bg9E7uIOXW3MGxR
	 2HuPM4+Svb4oLXisgvPLEYbGIBHHk1Cnh9gSnh+R/ypOd4HICXR6NkLx6JLXSIpb6rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfB5hIVN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8388606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8388606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfB5hIVN
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so2783432a12.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794464449; cv=none;
        d=google.com; s=arc-20260327;
        b=MEVsA2EU8P7vzxl+7Q7osiTJNDl+4K7BzzlECQCanDT6++FgyyY1uIHUf2nE3Di6Q1
         r0Ga7gjLWdNgvJP2ChsWFKfSTveJca/ipMJ3wt45Tab68jQLIfjeZlMvBUXhzC+zjbP2
         /Tqu8fIoVZap3PPHcflob3KTuNj+2Hh2p2nrQsDM4ruRm1WZjCbVKvVlgKgHk1lhEavh
         70xkzM9S/3b00z6o21RUOaNkZGDNXmOz4P7c7qhc7Noh6rYaRUM51txb560NfS9Id9K2
         yUnwCw2xYt0xntKAWWWdJhQkc1i6zPaCX2CeZWcRt27S7z/Kga61jfcNfhKqfMNVaUtm
         0idQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        fh=oMSn4vZIPjWwOakLAxZXTcRHzZXMDD8WqgdDv5IMvQU=;
        b=c+eXUAkJovAZRdxp7setNqkzxXU0B/ahfoqPLdGF3FYW1/3QgFeWH9KIDH/QgQVOxk
         J5UePBwwFfQQArTS9BQ7UnuNoqOetWa6r9OaSj72557fzXCWQ2st7gnpYYYuwTKTePxs
         Xq+X0TXUKUMIyMuqDHj8pBPehxE7HP2M4mD3+ww/0perO0Tc/GBwrhnGrGdnjRBhizfH
         QxUPVHTrcAoN0+wT+1/c9kfBeztyQwn/z5VuBAHUl3Mu41tiN0o836OQlO+f4ZsocItA
         Smvuyo87NAu7V+Y+W4Ysk3TfQhZUFVqN8RLcjU5g3yU2Jv44LRjDD/RogB+/Tj0R2lar
         erCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464449; x=1795069249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=mfB5hIVNWoDc0eoZue/HOZ4HTeEVeg6PgM4Kxapc7zgauJNbm3Z2s3yfmse/uf1jA6
         7EyIjfUUrCS8j/ErOGcMpU56GwoPk5T7GaOMB/PSDa5zmu2k+JMb9l+DwJOCt3AlNMHY
         8w2iIjN56mQqDaUzU8JoDk6axWRaPSvo35mZ7KOhNQ/6TRMA5VpXTuj+g05XrdHGvYHT
         uAdDIk+FNr893kh2DXjOEz8s4ldN0KCQXku1Cfrjhvg0HSDq4ZvB9PWVbRv9e2MqijRR
         Y5RhpXs75aPeGNFaI69337V80axoszmUBNJiLINmkCgBqwfl6OqQyHv8+IlKxeoOJk+H
         fSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464449; x=1795069249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=Fi5EkHwSB2Pvjwq9rE1AwZVy2xrC729pAeaKPxvVMIEOIfRfIY7uqbkMNWyHabf3o5
         s+todRg2bJATVYMv+sLimm+B9u+QJOA03OJRLcfZgEPlu0+l59wIjwqK7bqJJRmHBAL5
         UCJaX4C/3swnyYSVBf5fXcx3BEwkNUXqSXs6q06het6kGKrLtm9LMCROqy2fSzw5zsay
         cqOmxVa+Kpo2kkNrUBfx19MKj5BkiwJDRnOfF98GXxOPXX+KqrK6uLHzXyPa2gEGI4V8
         1Ejesf8zN7FadJGvxVsFlARmLDQC4AM9ArTO9uXJefPboiHUbUZfFu5U0mOGaoIdqt0Q
         FTMw==
X-Forwarded-Encrypted: i=1; AL+hErHs4s5N040+LjtbVNBkwdMKmF93Csum89PPjf/uzoeUV5awRxB91rcYPDjT+/h459AsVzrhwHF3q7TW7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V53PTpmeNucD4aXHhm06lVDlG9mBlrYmEdQ/pAKMmSYywnr5I
	o+vTR8blP5XxqBU5FS2egkeV8vJOc7mQlXt0DgYvriyIehAJJE2w4an1wjAaxDTJAoz0JRPXKCq
	HcoDdc2PHFuoW2lwN+QTqG72NtazE2g==
X-Gm-Gg: AYBFou2FNY234oVw0Pl/fGwefLSz6g6HicInbKS8r4mnzJhNI0+I3kr2TX5ZssB7F5N
	ya3pDSrFcJe4PHvv+NZB5x0d3nUO/yJK81xRzjCYrfIVhWydIHGkJ3goo+Q3QkLLbhGBAQfbrIW
	ru1MNYOAy3XJaG/QBneJtnsT+rnR86YhImyXgtFUi/eYg11AUYlon3oCkzQsGAH7KMilHqHRY6H
	XnrQXB6xxRV8RPoOVCmz3gqFe40zqAMfx7rIAQwzlrFVTjB90bpj4mrmqZwiYTUlTqdFcSDrJQv
	+iAiSIcpxEbzdUgAaXp68ryaMBP5xB0Q6HYb9HtHUMQO9rCIhXNydBUMkyY2p2Fe0Bv83gLY9M7
	fKrt+XBkqpHF4IwhXC7fNpSxqHhGaI2bT6WvZ3y20BGOUfMVSlUNG6aALn3iAoyyoxRxIIlmqj7
	tzYUHklojXUpUmZJG5bDyGs3Etf5xHc/BdJEv47/SRv8tsEtY=
X-Received: by 2002:a05:6402:2809:b0:6b4:21c1:21a9 with SMTP id
 4fb4d7f45d1cf-6b7778159cbmr3839503a12.31.1794464448878; Wed, 11 Nov 2026
 22:20:48 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011222234.2098904-1-mhun512@gmail.com> <179406798190.3424803.7064068903462702662.b4-review@b4>
In-Reply-To: <179406798190.3424803.7064068903462702662.b4-review@b4>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 12 Nov 2026 01:20:36 -0500
X-Gm-Features: AclHuK8iacxlbWVlhHrmZf4nXYKveYZX5zn-UdiKOJPEhizJAmxWAuRAURZ4Y8g
Message-ID: <CAGEsz8FAOrkf7AzjfJS+ZXnU5eZdTbSjYtVtceBimH=RyMz7YQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. I've rebased the series onto your for-next branch and resent
it as v2 in a new thread.

2026=EB=85=84 11=EC=9B=94 7=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 11:13, =
Mark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > The AFE IRQ handlers access regmap and PCM state. Register each handler
> > after its inputs exist and release it before the final remove callback
> > or managed component teardown releases those inputs. The mt8186 patch
> > also balances IRQ wake settings on probe failure and removal.
>
> This doesn't apply against current code, please check and resend.
>
> --
> Mark Brown <broonie@kernel.org>
