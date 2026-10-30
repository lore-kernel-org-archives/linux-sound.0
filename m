Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371122;
	b=k3MVKhyT7hZuHC2W5gaeVGXCJR9woEtBhI7ojBIxD0pODrIQznfPP87eJuCTo1aFW8AP
	 1b9IYXRrx64EU2d6uiLGFfwg5C3oHVc3kALX1pK3Cvy4hofbJp2KdHRBFsaxtLpyt64vv
	 NrLYCnyfr/8N92oRzuOAKUueE11e6PqLrc1B/e+TJ0XZP22X/oSgbIduDRGi1QchSTkQk
	 8V4VPVNjZLlY9rY2p48FehiBhea6DTfCMLBNZ1nJSqAdcXJLGI4VsZWCnv4eUz3I59yAL
	 CnQcOyfKXJI/jfp+YrmN36/QKAndQJ8Yr4w3KcoxOMhwKqbDXQx8cHFvWqkqb7vuOGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/Dj6wQNSuCEVmxA8s3jzQ3MOnbyzCGPuihUcnRjde/w=;
	b=zNX1tuahHdQI8hYjA8B0lBs6n1jtgJVQzH4tzN5Kv7u4QIveeE4MMZeY2k2xdvtACCSQ
	 TFAmtVmqSDiLWyaq0NiHaabJ6ri2+MnjRGWj9gKWmiBDcyMcOnu35g8ueWkwN2gX5Wi1B
	 3q5NoJ9QYMkSPl+3FwbFEZEptL7p5bQnUnPGA0v2oTxL8sSWBEzQDYW0zpZboH10eUCZb
	 FiYjeyXUttKpYevWPimJ0WwhEsPNTuxOj3hyT4yK63Baw5mQ7vdFfLuuOplt2kZMOXG5x
	 kXoID20507WQyAKGJDcxGL8GQH8XYo2EHtEJ0GDNE2Ep43Uo2cFNqMRiPoaMnY1rrzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dJqV+a/S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E87960A260A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJqV+a/S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87001F000C1;
	Fri, 30 Oct 2026 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793371121;
	bh=/Dj6wQNSuCEVmxA8s3jzQ3MOnbyzCGPuihUcnRjde/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJqV+a/SB7+8ppQS6mQoOSBeMDNzlGM/kJTTR+O4z5Wt0hgJuHqlq2ZXiNc9fRF6Y
	 CwFG0X2rn4zzIFA8GXn12qS3vmA8LPUQyQJn3kNR2H41LA0qr6nf4JF6SGFfiOY94S
	 aykmLWibAUWav9P/0OBpltRkt+VqnFLv8yuuSYiFM1dNl2YQbwKwwfcSJxERW/MUIz
	 fj8e4NrsN9vGbncelxiSm2gZsAx7lMdyZjYHUYUTDLiRMX/uTCf4CBA8TQ1YlLNlxS
	 U7YeEXILPG5nF2VblSqPrRjQqqh4wYcFQZPZIEZacvCm8J6Vev/NZZGmqp9XUfbzfG
	 7JDz1qWuHpfDg==
Message-ID: <sashiko-outbox-191113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: cs46xx: Handle SCB creation failures before
 dereferencing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Kazinsky" <a.kazinsky@ideco.ru>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030142529.415697-1-a.kazinsky@ideco.ru>
References: <20261030142529.415697-1-a.kazinsky@ideco.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:38:41 +0000
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
- [High] ALSA: cs46xx: NULL deref in cs46xx_dsp_async_init() if timing_mast=
er_scb fails
--

commit 48c9250fe2fa75eef791b48e6968fdc6c7b7ecda
Author: Alex Kazinsky <a.kazinsky@ideco.ru>

ALSA: cs46xx: Handle SCB creation failures before dereferencing

This commit adds NULL checks for the return value of cs46xx_dsp_create_scb()
in cs46xx_dsp_scb_and_task_init() and _dsp_create_generic_scb() to prevent
NULL pointer dereferences when kmemdup() fails under CONFIG_PM_SLEEP.

> diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_s=
pos_scb_lib.c
> index 71eee5cb478f4..ac914bf784c81 100644
> --- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
> +++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
> @@ -274,7 +274,8 @@ _dsp_create_generic_scb (struct snd_cs46xx *chip, cha=
r * name, u32 * scb_data, u
>  	dev_dbg(chip->card->dev, "dsp_spos: creating SCB <%s>\n", name);
> =20
>  	scb =3D cs46xx_dsp_create_scb(chip,name,scb_data,dest);
> -
> +	if (!scb)
> +		return NULL;
> =20
>  	scb->sub_list_ptr =3D ins->the_null_scb;
>  	scb->next_scb_ptr =3D ins->the_null_scb;

[Severity: High]
Now that _dsp_create_generic_scb() returns NULL when cs46xx_dsp_create_scb()
fails, can this still lead to a NULL pointer dereference in
cs46xx_dsp_async_init() if cs46xx_dsp_create_timing_master_scb() fails?

In sound/pci/cs46xx/dsp_spos.c:cs46xx_dsp_scb_and_task_init(),
timing_master_scb is created via:

	cs46xx_dsp_create_timing_master_scb()
	  -> cs46xx_dsp_create_generic_scb()
	    -> _dsp_create_generic_scb()

Unlike the subsequent SCB creations in cs46xx_dsp_scb_and_task_init(),
timing_master_scb is not checked for NULL:

	/* create timing master SCB */
	timing_master_scb =3D cs46xx_dsp_create_timing_master_scb(chip);

	/* create the CODEC output task */
	codec_out_scb =3D cs46xx_dsp_create_codec_out_scb(chip,"CodecOutSCB_I",0x0=
010,0x0000,
							MASTERMIX_SCB_ADDR,
							CODECOUT_SCB_ADDR,timing_master_scb,
							SCB_ON_PARENT_SUBLIST_SCB);

If timing_master_scb is NULL, its child SCB creations (codec_out_scb and
write_back_scb) pass parent_scb =3D=3D NULL into _dsp_create_generic_scb(),=
 skip
the if (scb->parent_scb_ptr) block, and succeed if their own allocations
succeed. Execution then continues to the end of
cs46xx_dsp_scb_and_task_init():

	cs46xx_dsp_async_init(chip,timing_master_scb);
	return 0;

Inside cs46xx_dsp_async_init(), fg_entry (which is timing_master_scb) is
dereferenced unconditionally:

		/* this one is faked, as the parnet of SPDIFO task
		   is the FG task tree */
		fg_entry->parent_scb_ptr =3D spdifo_scb_desc;

Additionally, cs46xx_dsp_scb_and_task_init() ignores the return value of
cs46xx_dsp_async_init(), which calls cs46xx_dsp_create_scb() three times and
returns -EIO on failure, leaving any partially created SCB descriptors in
ins->scbs[] with NULL sub_list_ptr, next_scb_ptr, and task_entry pointers
that can later be dereferenced in cs46xx_dsp_proc_scb_read().

Should cs46xx_dsp_scb_and_task_init() check timing_master_scb for NULL and
check the return value of cs46xx_dsp_async_init()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030142529.4156=
97-1-a.kazinsky@ideco.ru?part=3D1
