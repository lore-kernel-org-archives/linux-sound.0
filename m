Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688854;
	b=DOyrhAU6maaUfZsiEeeJjIn8/0IxUSVRbTlyxHS50a1i0qpLjVWsUIAVCEQPp7p6Hzfy
	 NgNVDI4PRyoySURUVJSawnlvJ2IdKmhPjsqnOjycd/ACJQ+MfjIGvDHtqRDWRvG2R5tlV
	 CTzv01APijtwkqjvbX879bP96UHktk43Ssjj/Mq3lBbt70ealUJzOoCzpra+naWu3h6Oc
	 M9yi0OI5afL3OEtWC3VmbwY3VzS2+KX1CRDUdrt29MNlVbMRCWovfYqgF0ieEeWGERRKf
	 n9Eoo5Co0jhQygb8R3C5ItEyM0xzoZRsp/dIzIbnGzORz/ieuAKYU4PC30bSYN5T1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688854;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XeZpiPemRmNTxja52dSpjuEOTC+OXqCETz+H4aGtRyw=;
	b=gM0wjii7XuEOfQLNFcbIS3+BPkeyLjvfxnn80NFktMylSZG/bjIBA0fmHIYvcj/qvZMj
	 kzVO8RR5yh+PPn2udIHlCibI0V0eIH1bC7+opU84lRlNb/S9iTH7tlx4P/X2zFVi46yn3
	 RsJaA+4MdzjAuP/9HYRsPNWN5gpeLR/8jCdLicZNgoszqpeNWjuey6XtI2PV8odaiuVVW
	 Gx4CbGyGjWutWCsTQvdwSno6unN7yJV31kLz9drFPACLtWs/poevsLqBs+gHkwRqJHAZ9
	 HE0Vu4yDuSArjU1h862k2dnvCBl/ea67DTEI8dX/MSderhkrMz71AgCJH4aRFnbixtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftkc5cOm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8273606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftkc5cOm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091741F000CA;
	Thu, 26 Nov 2026 10:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795688854;
	bh=XeZpiPemRmNTxja52dSpjuEOTC+OXqCETz+H4aGtRyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftkc5cOmhKiwR4S1H1zWKQghEKkw0dX4C9apsGP7AcUqm6PygbLmypwU0yKVEUOT3
	 pYzGTRnfA/8HKP1glA/lv7i5X44fQyx+U1SfIfjtsJt+UDopck+GilJAXhufqVwpcT
	 2PO+f/WXXw/rgHDptvhLJ3NttdaczKxx7MtqrpG9UyCggASmKhhE0wI0VnmqayZR0f
	 1yJnIysZyqFltKsOxlS3AHE+RZhnjPVGYPhiJEcyoTbuRjmSyJNxLYA70Ex7mceqsR
	 n6QcX9m+PA+k8JbK10HX537nR8Ksg8cqp1ge2eqBQvL+boGA+7QZVsH8dg6IuiAlMP
	 ykKSp6e3gH6qQ==
Message-ID: <sashiko-outbox-235289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute LEDs on ThinkPad X1 Carbon
 6th
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Heng" <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126100731.903504-1-zhangheng@kylinos.cn>
References: <20261126100731.903504-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:27:33 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: hda/realtek: ALC285_LENOVO_DAC_RENAME chain skips noise
  fixups
--

commit 4c036af7c1383440b00bb1ed09a1398a8257668b
Author: Zhang Heng <zhangheng@kylinos.cn>

ALSA: hda/realtek: Fix mute LEDs on ThinkPad X1 Carbon 6th

This commit chains ALC285_LENOVO_DAC_RENAME to ALC269_FIXUP_THINKPAD_ACPI
to restore the mute and mic-mute LEDs on the ThinkPad X1 Carbon 6th Gen.

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index f906fce39c111..e54fd1b414715 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7578,6 +7578,8 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  	[ALC285_LENOVO_DAC_RENAME] =3D {
>  		.type =3D HDA_FIXUP_FUNC,
>  		.v.func =3D alc285_lenovo_dac_rename,
> +		.chained =3D true,
> +		.chain_id =3D ALC269_FIXUP_THINKPAD_ACPI,
>  	},
>  	[ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1] =3D {
>  		.type =3D HDA_FIXUP_FUNC,

[Severity: Medium]
Should ALC285_LENOVO_DAC_RENAME chain to
ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE rather than directly to
ALC269_FIXUP_THINKPAD_ACPI?

Before 108704eecab9 ("ALSA: hda/realtek: Rename Line Out control to
Headphone on ThinkPad X1 Carbon 6th") added the 0x17aa:0x225c entry to
alc269_fixup_tbl, this machine matched alc269_pin_fixup_tbl:

sound/hda/codecs/realtek/alc269.c:alc269_pin_fixup_tbl[] {
    ...
	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_LENOVO_PC_BEE=
P_IN_NOISE,
		{0x12, 0x90a60130},
		{0x14, 0x90170110},
		{0x19, 0x04a11040},
		{0x21, 0x04211020}),
    ...
}

That pin quirk chains ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE (which disables
PCBEEP-IN passthrough noise via COEF 0x36) ->
ALC285_FIXUP_LENOVO_HEADPHONE_NOISE (alc285_fixup_invalidate_dacs(), which
disables DAC 0x03 to prevent headphone click noise) ->
ALC269_FIXUP_THINKPAD_ACPI.

Chaining directly to ALC269_FIXUP_THINKPAD_ACPI still skips both noise
fixups.  Because "Line Out Playback Volume" is only created when
alc285_fixup_invalidate_dacs() forces Speaker and Headphone to share DAC
0x02, alc285_lenovo_dac_rename() is currently a no-op.  Also, once DAC
0x02 is shared between Speaker and Headphone, renaming "Line Out Playback
Volume" to "Headphone Playback Volume" causes PipeWire/PulseAudio ACP to
mute "Headphone Playback Volume" when switching to the Speaker port,
silencing the internal speakers (unlike a port-neutral name as used in
alc285_fixup_thinkpad_x1_gen7()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126100731.9035=
04-1-zhangheng@kylinos.cn?part=3D1
