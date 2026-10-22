Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681842;
	b=qEe93ZX57370CCdFSXtTXr/SqITkM9/fWTKVFLPFbV3qH992dzyKK/ZcHgAKg/9D5AtT
	 PmRbzrznOyZEFFdah1ccVGO8pNnG4AAPSnowMC4iX/TPP5LrxKUtX/68/Btp4gi//o3Ti
	 3DBlPZiblw/XZFSWxQXsz3eMx9ax1jIoGaItOKubCR9YlZh88zAc4ueNdzy8yMIC+ot9Y
	 sdm/jzVGC1xKzctAN+PHAq9/ikpS5B+Hfw2fkEXdLVi/SUXBvO8//phzmOlD2ycn2Wb/J
	 vJ1OML4U/KDZ/93Z3X2axjigS5M6+4Qt4mUrAgfyYEG9nnZEcqCediSFjj/vKMQHlrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sMiB7eSelwn52aZJRNOAHGM3tk1cknhYd7fUwslLiHk=;
	b=CNUExKQFj0ldG/k+jdzZ6/h8+ANX6XoOlEEAYIjixha4t3iJI33SQGH5WHIRDpvjlvpj
	 ft3hIkf4CtBO21xudMcDHSu8Dg2juQijueLM9rXnRVNhbiZt7GeT1VpDe5tHdwB3yqwCR
	 PUSzkjXkcK/vOmydo7PUIpe+QpXYRLNrtJ7Yub2NOLQ8ilD+Hqbh70sCoHcGoCdS4IWw7
	 yPSKJ3t/0FsaxB70NtRAx2s9eHYKvvt6abF1+NypL74LM8zpupQDVjYbLY85JhwyCZ5Wl
	 2bl49lrNMoaUnH2ToHBzqYG6y5NhQyJv7eByRq4HIbgpL1gv7H8FXCBRZtfWx5AKPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d08omH+5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B67160A5BE7
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d08omH+5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA7B1F01825;
	Thu, 22 Oct 2026 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792681841;
	bh=sMiB7eSelwn52aZJRNOAHGM3tk1cknhYd7fUwslLiHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d08omH+5jy3+mo6x1CYWsoSLxctyKtx9F+u5bxTBPsAD1xWOLKEVIyfr3CMs3kZPr
	 shKv5f7tuy2EmP/dt/E/mWvIY+WstNiJndwk4vI25uV82vu+EW1z3R4XrrMN8z5j1s
	 KL5InyLrtbzesRhPMnqSBLjK2qxVQDIJNUbAAk0ryCN2zxK5ravhYPm/KfcvN2dulz
	 Uvn814FqLSsbiFzRUX8yN6rtyafJpCUaUvVSEZ3QOEjh/YM8FLcTFR79ygZiCFBbed
	 UpC3T4tMfy1ngpe+RSBDdT+5Ux4oe/24103eAd847IYKITO1y/tieoFfpCFgY15+ZW
	 y2xCkUe6LCrDg==
Message-ID: <sashiko-outbox-181673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ALSA: opl3: Clear voice channels before freeing
 their sets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cen Zhang" <zzzccc427@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-2@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
 <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 15:10:41 +0000
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
- [Medium] ALSA: opl3: snd_opl3_clear_voices() clears voice state without k=
illing hardware voice
--

commit a0dc4d938c6f259e2d8cec7c1fb6339768606511
Author: Cen Zhang <zzzccc427@gmail.com>

ALSA: opl3: Clear voice channels before freeing their sets

This commit introduces snd_opl3_clear_voices() to clear voice channel
pointers, delayed note-off flags, and voice state under voice_lock before
each sequencer port frees its channel set.

[ ... ]

> diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
> index 2bacefc3201de..f711139c50670 100644
> --- a/sound/drivers/opl3/opl3_seq.c
> +++ b/sound/drivers/opl3/opl3_seq.c
> @@ -148,10 +148,23 @@ static int snd_opl3_synth_event_input(struct snd_se=
q_event * ev, int direct,
> =20
>  /* ------------------------------ */
> =20
> +void snd_opl3_clear_voices(struct snd_opl3 *opl3)
> +{
> +	int i;
> +
> +	guard(spinlock_irqsave)(&opl3->voice_lock);
> +	for (i =3D 0; i < MAX_OPL3_VOICES; i++) {
> +		opl3->voices[i].chan =3D NULL;
> +		opl3->voices[i].note_off_check =3D 0;
> +		opl3->voices[i].state =3D SNDRV_OPL3_ST_OFF;
> +	}
> +}

[Severity: Medium]
When a voice is active via a direct note-on without a port subscription
(where snd_opl3_synth_unuse() -> snd_opl3_synth_cleanup() ->
snd_opl3_reset() does not run on unbind), does clearing note_off_check and
setting state to SNDRV_OPL3_ST_OFF here without clearing OPL3_KEYON_BIT in
hardware leave the FM voice stuck sounding and desynchronized from its
software state?

In sound/drivers/opl3/opl3_midi.c:snd_opl3_note_on(), starting a note sets
OPL3_KEYON_BIT in OPL3_REG_KEYON_BLOCK and optionally schedules a delayed
note-off via note_off_check:

	opl3_reg =3D reg_side | (OPL3_REG_KEYON_BLOCK + voice_offset);
	opl3->command(opl3, opl3_reg, blocknum);

	/* kill note after fixed duration (in centiseconds) */
	if (fm->fix_dur) {
		opl3->voices[voice].note_off =3D jiffies +
			(fm->fix_dur * HZ) / 100;
		snd_opl3_start_timer(opl3);
		opl3->voices[voice].note_off_check =3D 1;
	} else
		opl3->voices[voice].note_off_check =3D 0;

And when re-using a voice, sound/drivers/opl3/opl3_midi.c:snd_opl3_note_on()
only clears OPL3_KEYON_BIT in hardware if vp->state > 0:

	/* kill voice on channel */
	vp =3D &opl3->voices[voice];
	if (vp->state > 0) {
		opl3_reg =3D reg_side | (OPL3_REG_KEYON_BLOCK + voice_offset);
		reg_val =3D vp->keyon_reg & ~OPL3_KEYON_BIT;
		opl3->command(opl3, opl3_reg, reg_val);
	}

If snd_opl3_clear_voices() resets state to SNDRV_OPL3_ST_OFF and clears
note_off_check in software without writing vp->keyon_reg to hardware, any
active voice (including a fixed-duration note whose pending timer note-off
is cancelled) stays keyed on in hardware. After rebind, a subsequent
snd_opl3_note_on() on that voice will see vp->state =3D=3D SNDRV_OPL3_ST_OFF
and skip clearing OPL3_KEYON_BIT before writing blocknum | OPL3_KEYON_BIT,
missing the 0-to-1 key-on transition needed to re-trigger the envelope.

Should snd_opl3_clear_voices() also silence active voices in hardware (such
as via snd_opl3_kill_voice() when state > 0)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/pm-pmb-4552c4e60550=
7d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com?part=3D2
