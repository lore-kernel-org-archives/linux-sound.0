Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DD22A7F0;
	Sat, 18 Jul 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784389021; cv=none; b=o7PVjdGS+1iusYEKSTbIMI1MiYEzkOr/QZZIr/nxXZ2kqWX/qss98/4HxmGDJB9T2XsdipaQAUeOT4QdAYojU64m12fD9u2DKDvZ+MG1I+SeF0GcWWcU5EihE8jkCMEzHxlfCGu9tmHGekrWsDX+HxkDIt84cHmsTmTKADcC6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784389021; c=relaxed/simple;
	bh=UE0IrFl6mZ50TJfg/b29+c/8RhalAY5uVgKMBKdPOSE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=B1tGuHjMb2a6EgRjm1frF7jMRVqHilwF5ECibObIIuhS6C5kGv7mck2Btx8XQLeW87EX4Ypa2Y3HQCeDpDLNiT147EzI8OYuArSAecHYeVtjdMYKTurxUsWg8Urc7P3t1CWvCWb8VjPqW+5tvqGAJjGhHPWz53OWmRM//yXjin0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FQwMaS3n; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FQwMaS3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784388997; x=1784993797; i=markus.elfring@web.de;
	bh=vlqpzFLlrEy+zLb0mNrc9tyh0tSEdDV9LsIQWGFvLrI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FQwMaS3npCiQY3nl+5hI23wILTMuFYqOOEeXQ2CemmkQjO4NF1IvjeKtFZFsK7Ya
	 JQ8NI1+PZb4e57flmPSQs5VxR+l9h5WjF5eoR/MKVv1FhsUEdczm/7Qfk2wCt3s2L
	 8LJSUW44lHngZ3TcDeJo9cH9ztdKr1DF/8hK/snCYq3A97fPjfe0vUPy9HB81Sig9
	 s4wiTxB061pk85ph1xwrBVSqmEFfP9rXORhmS4hsowcF9nyEtshYJ3NOsULLoYbIm
	 4STlpqfhxUT9QXMLbOd0B9KzIAGGZlml273g1besAcj+iU1XdwSE2/5uGg1F4eXPW
	 Dmpf5XaA9SAebPQS/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Ma0PY-1wZ61p2Hsi-00X5yM; Sat, 18
 Jul 2026 17:36:37 +0200
Message-ID: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
Date: Sat, 18 Jul 2026 17:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gianluca Boiano <morf3089@gmail.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Baojun Xu <baojun.xu@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Sen Wang <sen@ti.com>,
 Shenghao Ding <shenghao-ding@ti.com>
References: <20260717233402.414326-3-morf3089@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260717233402.414326-3-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tCDrBaixQC/OFVfwomcnq9eCR7eMtn6T3DHlaPePu+NE6ivMBg0
 jzs32X/QFTigD5z94NCm+ldULCsAzQgF8HPyWHGhPHX/2JfpkyUO0/ZjWSx0+3whXRKqCPY
 XFxTp39jVaFD/E2SuEaenNYj0EdmRC1OfgM1ee0LOPS/SgyVefZuBNyt1Uses7z65xsR5+I
 qz+urAzvUQJ0a2AT4uE2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sp+/EaP03/M=;UhIEXivxFUr4ckLx7BJFara3ula
 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

=E2=80=A6
> +++ b/sound/soc/codecs/tas2557.c
> @@ -0,0 +1,3067 @@
=E2=80=A6
> +static int tas2557_dev_read(struct tas2557_priv *tas2557, unsigned int =
chn,
> +			    unsigned int reg, unsigned int *value)
> +{
=E2=80=A6
> +	mutex_lock(&tas2557->dev_lock);
> +	ret =3D tas2557_change_book_page(tas2557, chn, TAS2557_BOOK_ID(reg),
> +				       TAS2557_PAGE_ID(reg));
=E2=80=A6
> +	mutex_unlock(&tas2557->dev_lock);
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&tas2557->dev_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.2-rc3/source/include/linux/mutex.h#L25=
3

Regards,
Markus
