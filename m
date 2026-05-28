Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392D33F5B6
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954014; cv=pass; b=nAAcg1bfHRU44I1/EwDEBsPgY9vVANnVx92KU0ymIvas7rHRgJetcrfE5Ausqe1QxjJ0hKfgf3LgycsRzbVFUe0dAX9v5A/TbonGsWJOEVF9CrFoyKfbJP0UNwXSZxVIhj/OGcCt/4NXtpsN4hfyXOivMwROXzXG1UOO89ZHcts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954014; c=relaxed/simple;
	bh=j3a6kkTxZxaZI8wswoftHlBDrPw6NcrFuIHXjMRcuxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBJ8JX00ohRnPjk8V85iMLdv0xRz5scTRSYJYzqx98saE6GnLz7Mb4XPsnEJVG487tmvV4LmdEEA0yJX5HvmbfqiGJ6QaJrqBMLcD48FftKklmywuN4D8erEc8/Rpmj8YxkEMjkqak3hFl9zU3foTaWjSijA2q+YmkC4uFb1W8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wqo6W0nw; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wqo6W0nw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd124546379so1865827266b.3
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 00:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779954011; cv=none;
        d=google.com; s=arc-20240605;
        b=g6BRHz+k/Rf+jsqBHxw2JPch2xByfIALEv/qWvsU2f1N06T+9DOtF61YghFkKFUbrr
         aPnsdlV4a5iyiGpalq7fVxjBjtdATXyD8OTCq1ID6DsuC05IZkBlRrsa8bmC9nm/2eBs
         5Y9j4UtlYM8TP18rOFr4kaqrg0ialcdAKN2OXods+zQ39Kk7hKF/OJjphs8IDI5VDo1e
         K41AwMyHqLNi2gP0KdYsIO/5QVKGMykShNavM9wfChi+9InbwfIiMebQDy3Wr35Rz2n3
         zaiEBST6x2nykbAY6tg9DWZURncjdzAF5HTvVw58+BKzC9LFDHa7daUEe+pWn/FeDfpn
         zRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K4A4UI4OtEAg56yUjKb8IRThu2A+ZurcjAgnAugOSbo=;
        fh=Wu0WGaNNtxZbbxqyJVUft2ddUOYVUhTRl7tgs9/cknY=;
        b=CQ1NglZiCf5OsbN3dXBO5eO1spvgKlueF41RqtR++1eQUsJeHnnMdugfQVun7tlg62
         dwtwLr/QIN20uNQm5HrclQG8adoMdWScJoYGQn3x/DrTIx0/JZ6Grnu+0VShGL1Vruav
         Ut9nN116aRmbuz8n4sv0amUAQ9IFMou1GhBI2t1h4vscmI3YxVeR5eta6BN1dObRGsBu
         xAFpkSdh/Q4cazkHoRqe2ec2K713kPZ1+HWjOu7icXqpdAzZUFr0VXuiyRoaB+zB6G1P
         ceXkDU7tZ/ZWW6ssD5UaMUL2xls8516k9SyEHXIvVb8OXRySsvovRB8v5Q7vFYk27nsA
         hTwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954011; x=1780558811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4A4UI4OtEAg56yUjKb8IRThu2A+ZurcjAgnAugOSbo=;
        b=Wqo6W0nwSO9+Z7NaRoiq0KO4HTnRil5y0W/fyLZVYlHhT1InCjBTFT+hSKHctxw/kY
         dL3O6hnmGZHuKs8+ElFBKjrFKiG1aoBy1lOMLunqoGB2daXxCKwI7pHKDCLWV8e9NGps
         codrz+LvCNoP6OSm611Sju/oc8q9QTwpXLn5oDV/4Y8Pb0JqED0JnZUN1AnkLOMs6R1s
         KONj8wMGW6EEz3S429udr5FvF2GXf4PBcTtuierP4z6qkMKFir/kMJU7xRst6rbpXJ1q
         JVHimwqOfDSmcdDtixAnphRP8aRI+xJ0DP0EsCcZkG6u+6uXboJcS7KBXV/Z1JGvgyR4
         zy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954011; x=1780558811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4A4UI4OtEAg56yUjKb8IRThu2A+ZurcjAgnAugOSbo=;
        b=PfDFWYmr7jJr5Q0h6ICphZqaAUTpSH2rTZ8NLLqVijmAaFsuNrllsXC1vNKgfgvXaw
         zGgM4dYL6Gw3OW0Nr+TQr739Nxcflqu7V7bJmNO7rZIOwQoBOhDPBQ+k0RlGJUQX/hQj
         8GwM4jEhqr89zRWu/XdL6N5WxGJuV0jCDCbP3lJPOz5fR2U/GC7W2SfC5LFxxNwyc+t/
         GdJJCP8y44Ib8yyR+O1vqSci6OH+VTqUVaDQWPXxf5umQ8ApgFv3KSJYe3NDqL1uUaB0
         sZmYGZxvboqIcoAGk7QBktTQiUFeY3+CWhP97gMk6c6dcBMCtcQKW7EpNXqoFETxSng4
         0NXw==
X-Forwarded-Encrypted: i=1; AFNElJ/k36owoTVPaSSGd6bE7A+Vq8K41alR2ah4Ycm9ej8ChGYIJiHLDRt/OZEuBUnC73kvIIS+NlLX70jCmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx3+otbriMpYmo7wr8LsYwCctz22t1ADyyLUq18aEpZqqnbdkh
	8poTQOxzTKknWq0UF0xSuyVrhUb9UoSFWwWeysBEFavG7MgF9Qsj6Oj7QfhE4QATiZJK3ercBiL
	Nlqnmita+Bs6+uD7ZzAODPRmUIrmui0Q=
X-Gm-Gg: Acq92OFJovuGcucMXmhzGGSCR4D9w2zJpaAd4VPr+4uJ67t5RuotM+zM9v97O4GvxIb
	pd8dZ1QLLERnlZYN9qvUeuhJrVfQUCvH8oI0+3+Rw1zqtbUE3WGE8KCeRwx+vcYVI82KDlPZndA
	FKZ96hYH5YHpe6ft5Fl9Z+RE1Uvf2wtt1VL8nDWo3H2cV17ulHPkaiREBpUFyWX7Zi99euIyetZ
	eBat/2WKP/jU3XdnSmymXbAYBmgPJa8brj7tWZBeFbYER9B8+gBqkbM2AX7zTAgOhOdAdhDx/Bi
	J4gL8xXHRYcz38/Ixx2Y
X-Received: by 2002:a17:907:a80c:b0:bd1:1391:c331 with SMTP id
 a640c23a62f3a-bdd269b65c9mr1635356066b.43.1779954011153; Thu, 28 May 2026
 00:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779796354.git.zhoubinbin@loongson.cn> <738268f7409fafdb65cd25214114fbde4d7e25c5.1779796354.git.zhoubinbin@loongson.cn>
 <45a5b690-e7ff-454b-9120-1eb906bdd0a2@sirena.org.uk>
In-Reply-To: <45a5b690-e7ff-454b-9120-1eb906bdd0a2@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 28 May 2026 15:39:58 +0800
X-Gm-Features: AVHnY4LRyLMudRpfBuRmx1dOKz6oP1vsVr9Q7TPRk_gXDKB28ha0RhJmvj7vJPU
Message-ID: <CAMpQs4LJmjMw257Kgf=DJkZpJr3MdW=wz-yr+ekskykWyy6CYQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: es8323: Adjust the initialization of
 certain registers
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Wed, May 27, 2026 at 1:36=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, May 26, 2026 at 07:56:26PM +0800, Binbin Zhou wrote:
> > A few additional register initializations are required for proper
> > operation.
>
> > - During hw_params, write ES8323_DACPOWER (0x3c) to ensure DAC power
> >   is correctly configured for the selected sample rate.
>
> Is it just a write that's needed (even if the DAC is already enabled),
> or is it that we need the DAC to be powered?  If it's the latter should
> this be managed using DAPM?  What does this write actually do?

This doesn't seem to be necessary; I checked, and it was being
affected by the preceding I2S_CTRL.

>
> > - In the probe function, initialize DACCONTROL17, DACCONTROL20,
> >   ADCCONTROL10, LOUT1_VOL, and ROUT1_VOL to improve analog output
> >   stability and volume level.
>
> The volumes should be left at the chip defaults, users can adjust them
> via the existing Output 1 Playback Volume control and UCM can be used to
> provide defaults.  We don't configure this in the kernel because the
> settings needed for different boards can be very different and tweaking
> the configuration in the kernel causes them all to collide with each
> other.  The chip defaults might not always be helpful but at least
> they're a concrete thing that provides a fixed point for configuration.
>
> We also seem to already have volume controls exposed in at least
> DACCONTROL17 and DACCONTROL20.

Thanks for the explanation.
I tried adjusting the relevant controls with `amixer`, and both
recording and playback are working fine. My initial idea was to preset
the relevant registers, but this seems to differ from the standard
approach for I2S.
>
> > - In set_bias_level, set CHIPPOWER to 0x00 when powering up and
> >   to 0xff when powering off, fully controlling the chip's power
> >   state.
>
> It looks like this register is managed by DAPM already, presumably
> there's some bug or missing configuration there but

This doesn't seem to be necessary; I checked, and it was being
affected by the preceding I2S_CTRL.

Sorry, please ignore this patch.

--
Thanks.
Binbin
