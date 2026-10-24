Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792824464;
	b=M6foh+Z6EkQGuOmgayA0TkMGZjnZn5zNVkeAcQkUGNGBmnxpMr9TNLqVkN8mBZZ0frDq
	 99ccDjh2WKfiBXWfOEDJG+NOUQOfBaHjjo+R9psaMbCkpBfKzA7KVQXI6CtpvBe/OGhtO
	 2+OJ6qrkEyMDDyCKoUacNbzVCGgNpQV4NTw87dNVP1PYd7w3THlRiFCHOZNqhGTv8ePw4
	 QUnjBNJq5XlfkW1vMSm1ITok6avNKNJjnSjRHU3XeoRCkFbC2YkKy6akJxU2K3aqoG0v/
	 L01sXWv1NRVE8JchtUBqU9Lzqr1A/m6Di4EWtcL2gqIhynVFmrXEVU2LbPEVb4emAZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792824464;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FaSfZyQqxK7FJJQSGCohkubtHgn/xvDgE1p+Nb+eDM8=;
	b=ZA0gb1wVJHG8qu6oZs483H9KjPjkJ5xhFTk2ZVpZ/0ePsgIss3SR33yBqiQyzaziGHXV
	 V/w2lN81xBmhxiHg9l0052dIuUifzjW7GM8p417fmibjuTkbz3pn8UkTArlyyN3g7m0Qy
	 F7W1OfWaVlhHL2cpDOXHwcRHYrLFNxrCsrGhQ6Rv5ry52jc27U/4RoTpkdAJTE5xS9hMW
	 JGEr460V4wrbBDzJRMvQn724nIYLkxIZ/D7HW8slrMZZBKPdfCV2TNG089O9zzycsUu3a
	 pa0jAPxNSQ+gUGoX2K+Qnt5OEdeWR8J/Pz51nGvj7rQgne357c5o9V57oMxUhqJ/RnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mViwB9W/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D3606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mViwB9W/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D6D1F01825;
	Sat, 24 Oct 2026 06:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792824464;
	bh=FaSfZyQqxK7FJJQSGCohkubtHgn/xvDgE1p+Nb+eDM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mViwB9W/UU6Bf3qFlUHBiOSpbsJXqcqySGO2Qdz31rHEP+SvOW+S0RH7+6aXeLYGd
	 BqHr8MhzqO5SGbCh0s8NkSWzdqkHLKDrCbzEhslPoXF84BUIcbnqEiXYQRDxHZ2KEE
	 6zuSfnzD57WOaHQe41zKz1KFDq6eXxzsBxt41AdU4ejYiqdGTMW4pS9Fe/a/8X/OJx
	 wXnIxfUtF9EEQuhVtHN2ntM9mmpw70y1PJoqpyqLkesM5KMNt0ITMulgVeFYWuz6p2
	 vJG4f1KhpeYnEDtowznnWwZwgZTWiQVEmUYKxtcUuOP2FHVs304AyFWEfT1qRPzTfL
	 ixyIc5RZH0wuA==
Message-ID: <sashiko-outbox-183573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] ALSA: opl3: Clear voice channels before freeing
 their sets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cen Zhang" <zzzccc427@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-2@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
 <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 06:47:43 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ALSA: opl3: snd_opl3_clear_voices() skips keying off active pair=
ed voice
--

commit 01c630bf3a01da16872929739a7ef4ffc65b5a71
Author: Cen Zhang <zzzccc427@gmail.com>

ALSA: opl3: Clear voice channels before freeing their sets

This commit adds snd_opl3_clear_voices() and calls it from both the native
and OSS sequencer port teardown callbacks to key off active voices and clear
their channel pointers before freeing the MIDI channel sets.

> diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_mid=
i.c
> index 6d3c5b5a35ffc..ba807be2cf1de 100644
> --- a/sound/drivers/opl3/opl3_midi.c
> +++ b/sound/drivers/opl3/opl3_midi.c
> @@ -632,6 +632,20 @@ static void snd_opl3_kill_voice(struct snd_opl3 *opl=
3, int voice)
> =20
>  }
> =20
> +void snd_opl3_clear_voices(struct snd_opl3 *opl3)
> +{
> +	int i;
> +
> +	guard(spinlock_irqsave)(&opl3->voice_lock);
> +	for (i =3D 0; i < MAX_OPL3_VOICES; i++) {
> +		if (opl3->voices[i].state > 0)
> +			snd_opl3_kill_voice(opl3, i);
> +		opl3->voices[i].chan =3D NULL;
> +		opl3->voices[i].note_off_check =3D 0;
> +		opl3->voices[i].state =3D SNDRV_OPL3_ST_OFF;
> +	}
> +}

[Severity: Medium]
Can snd_opl3_clear_voices() skip keying off voice i + 3 in hardware when
voice i is in SNDRV_OPL3_ST_ON_4OP and voice i + 3 has been keyed on in
SNDRV_OPL3_MODE_SYNTH?

In sound/drivers/opl3/opl3_midi.c:snd_opl3_note_on(), when opl3->synth_mode
is SNDRV_OPL3_MODE_SYNTH, channels are mapped directly via snd_opl3_oss_map
without calling opl3_get_voice():

	if (opl3->synth_mode =3D=3D SNDRV_OPL3_MODE_SEQ) {
		voice =3D opl3_get_voice(opl3, instr_4op, chan);
	} else {
		/* remap OSS voice */
		voice =3D snd_opl3_oss_map[chan->number];	=09
	}

If a 4-operator instrument is keyed on for channel 0..2 (or 3..5 on
oss_chset), primary voice i (0..2 or 9..11) is set to SNDRV_OPL3_ST_ON_4OP
and secondary voice i + 3 is set to SNDRV_OPL3_ST_NOT_AVAIL. If a
2-operator instrument is then keyed on for channel 12..14 (or 15..17 on
oss_chset), snd_opl3_oss_map maps directly to voice i + 3 (3..5 or 12..14),
writing OPL3_KEYON_BIT to OPL3_REG_KEYON_BLOCK for voice i + 3 and setting
opl3->voices[i + 3].state =3D SNDRV_OPL3_ST_ON_2OP while opl3->voices[i].st=
ate
remains SNDRV_OPL3_ST_ON_4OP.

When snd_opl3_clear_voices() iterates from 0 to MAX_OPL3_VOICES - 1, it
processes voice i first and calls snd_opl3_kill_voice(opl3, i):

	if (vp->state =3D=3D SNDRV_OPL3_ST_ON_4OP) {
		vp2 =3D &opl3->voices[voice + 3];

		vp2->time =3D opl3->use_time++;
		vp2->state =3D SNDRV_OPL3_ST_OFF;
	}

This clears OPL3_KEYON_BIT only on voice i, while resetting
opl3->voices[i + 3].state to SNDRV_OPL3_ST_OFF. When the loop later reaches
i + 3, opl3->voices[i + 3].state > 0 is false, so snd_opl3_kill_voice() is
not called for i + 3, leaving OPL3_KEYON_BIT set in hardware while its state
is SNDRV_OPL3_ST_OFF.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/pm-pmb-4552c4e60550=
7d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com?part=3D2
