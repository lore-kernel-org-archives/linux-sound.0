Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013800;
	b=0irs3ZrDBEy822r1GlzXJNoYdx4zBpKJfcD6bRgsUSHEIim8CFNLTJ86HikoFppNvbNx
	 rcGfnsi6YyMBlg8LXc8JAPHvJMBhDcQA3izy5N5fnu7jySaL/S5AXaTa/S5Ee/QLmwOyF
	 n2yCBuYsfTbVqTdvRhsnL71gdQD/GyvaPcmV3ScTK3aBKNZ7Jp36b3w7SU+sV58olTxcv
	 eNKZHjf+8B2eMq4ANQYmGy5iiXGhElf6/1Vxb1sCjvOszXHw/jXYRNS6rYwXwlGKrNBQu
	 IX8rS78X2AOKnBu0oewiQ7vye7mhVmc5DZg2hBhcTfuR1rmP0S9koRh0WlHVbBjyrGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013800;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-ID:X-MBO-RS-META;
	bh=FYR6lAR4F/kvDycE+JdAzmdMYH84ljUk0yMV3grV5hc=;
	b=KUOZP8Ra8eMe4NaNyw/tsBEJkGqSSwZ+ooVsr2MxfY3HY5QPa+W8MKl7EyifqwxeDqkm
	 5qrE3xBhSk92ljE6Od1FZo0YUf1yghRIA91Gquz5wMLBYP4rzM0ZwK53kRA5cyIdRgLz/
	 DkLp9WqtZynAMP1Ah2R3zuZ3P+E9M0dsY3v/uyBKp/sASFDtcVVwKnyYlydJ5/ZJ1hlvM
	 FsTfTtNdrbeXD6CBYtZ9RwTW2RTBf4x6kQxvJ9zoImfvLY4KPqLbfObTi9tgMjDTRiM1n
	 gjhrf5BivN00vn3i76kYGIGlHLp0EG9eaQCRRYV5MiCEyYSPF9vuOWLSQpftGyFilFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=JXaesICp;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40959606A325;
	Wed, 18 Nov 2026 14:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40959606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=JXaesICp
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jV4S43N4hzMlyX;
	Wed, 18 Nov 2026 15:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795013796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYR6lAR4F/kvDycE+JdAzmdMYH84ljUk0yMV3grV5hc=;
	b=JXaesICprn2CjnyE3WbO0RBrhdYyl2dJwYp//aiyC6Noq2rjpsgib9XRUqsadUfJ9uE3w1
	dxKZ4GEUL34w4XtnHTnAwi13rpmb8PKj7zGdSXzlsiCD9G2PVmqwHjOY5oDfuAJx4L8QF5
	0RvWnV4O4slFX8sIiXhskD88hZGoP1PTC1TNbmI4I2fO4HJ85JuD/ej2kj2fPQH7XNE62x
	0oO0zKOrEQFharLAyIGSDgaYgzq1FO1uD4LaXfHJpo6hs+PckE4agQVPI8C4AJEqYYDq63
	B8rFp88zeKzw2PawoZKe1P4+8mAps2RRpoUlW0TKhNn1Kswdbm0DbAb3vpNBjA==
Message-ID: <d825fa6717dc907247cbaec6c7555eccb5676b9b.camel@mailbox.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
From: Manuel Ebner <manuelebner@mailbox.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl	 <martin.blumenstingl@googlemail.com>, Kuninori Morimoto	
 <kuninori.morimoto.gx@renesas.com>, Christian Hewitt	
 <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 15:56:32 +0100
In-Reply-To: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
References: 
	<20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
	 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
	 <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: b463c6fe2c6dcd9de92
X-MBO-RS-META: 1twaz6xuakpuacrj8wctghpe57hhkz9j

On Mon, 2026-11-16 at 17:41 +0100, Valerio Setti wrote:
> Hi Manuel
>=20
> > I have read your patch and have a question.
> [...]

Ack.

> > > @@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_su=
bstream *substream, int cmd,
> > > =C2=A0=C2=A0=09=09=09=09struct snd_soc_dai *dai)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09struct snd_soc_component *component =3D dai->component=
;
> > > +=09unsigned int val;
> >=20
> > Here is val.
> >=20
> > > +=09int ret;
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09switch (cmd) {
> > > =C2=A0=C2=A0=09case SNDRV_PCM_TRIGGER_START:
> > > =C2=A0=C2=A0=09case SNDRV_PCM_TRIGGER_RESUME:
> > > =C2=A0=C2=A0=09case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > > -=09=09snd_soc_component_write(component, AIU_RST_SOFT,
> > > -=09=09=09=09=09AIU_RST_SOFT_I2S_FAST);
> > > -=09=09snd_soc_component_read(component, AIU_I2S_SYNC);
> > > +=09=09ret =3D regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_=
SOFT_I2S_FAST);
> > > +=09=09if (ret < 0)
> > > +=09=09=09return snd_soc_ret(component->dev, ret,
> > > +=09=09=09=09=09=C2=A0=C2=A0 "Failed to write register on trigger");
> > > +
> > > +=09=09ret =3D regmap_read(component->regmap, AIU_I2S_SYNC, &val);
> >=20
> > So as I understand val/&val is just there to listen and forget what get=
s returned.
> > That's kinda weird, but not an issue.
>=20
> Well, I understand that it might be weird from a software point of view,=
=20
> but it makes sense from the hardware one. According to the manual:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 A read from this register indicates that the nex=
t sample to be
> =C2=A0=C2=A0=C2=A0=C2=A0 sent out of the interface should go into the lef=
t channel of
> =C2=A0=C2=A0=C2=A0=C2=A0 the dac.
> > > @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_=
component *component,
> > > =C2=A0=C2=A0=09struct aiu_fifo *fifo =3D snd_soc_dai_dma_data_get_pla=
yback(dai);
> > > =C2=A0=C2=A0=09struct snd_pcm_runtime *runtime =3D substream->runtime=
;
> > > =C2=A0=C2=A0=09unsigned int addr;
> >=20
> > Here it's addr. It's not yours, you just kept it.
> >=20
> > > +=09int ret;
> > > =C2=A0=20
> > > -=09addr =3D snd_soc_component_read(component, fifo->mem_offset + AIU=
_MEM_RD);
> > > +=09ret =3D regmap_read(component->regmap, fifo->mem_offset + AIU_MEM=
_RD, &addr);
> >=20
> > Similar as above. But why is addr here and val above? I think it's the =
same role in regmap_read().
> > Would it make sense to name both the same? If it does, I'm in favor of =
val, because that's in the
> > kernel-doc of regmap_read().
> >=20
> > > +=09if (ret < 0)
> > > +=09=09return snd_soc_ret(component->dev, ret, "Failed to read FIFO p=
ointer");
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09return bytes_to_frames(runtime, addr - (unsigned int)r=
untime->dma_addr);
> > Here addr is used, so it's not same as above.
> >=20
> > Looking forward to your POV.
>=20
> Here I left 'addr' to minimize the number of changes in the patch.
> Looking at it again now, I'm more in favor of keeping it as 'addr'. I=20
> understand that the regmap documentation uses 'val', but in this case we=
=20
> know that the returned value is really an address of memory, not just a=
=20
> generic value.
> Also keeping the name as it is makes the last line of that function=20
> reading smoothly.
>=20
> However if you deem this unacceptable I can change as you requested.=20
> Just let me know.

I'm good with 'addr', thanks for the explanation.=20
 Manuel

>=20
> Best regards,
