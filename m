Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456951;
	b=VKHbjNgfk50WtVfxa/Mi9kyOoxLCM6OWtSJXpC/Op/HQETm3jDcvXB0TqFPDpqFHZZ2T
	 8c/0WT+IkaP/Xiki/wjr+jU9UChkyzUBLvTIHe2k9unFm2K1BbhFhCrcJjbuxC3/cbr+J
	 um+AZKRFEWvP0ukdRzEYjMxiekpkUcKxEq/rWahYvEFshalYeBANNZvgnwIjr4lnfzOuO
	 DWkZO9kh5/wyoyGwDeONxnIdYXB1c6eJ5aEWrtN7/mGlkAOFo8cx7mhbTN6+ro+R92cMg
	 Mq0bchK35wG5OgzGnfhekvkSpK0QyGf5cbLq3y43q+UDr4GPwFGVvX6wkuuNwWrAxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456951;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NmVNVPYjCzsZdDTtlzY9RCmi9UD+d8iTj6TJ2+93xKI=;
	b=dHQKRRoa4Jrwp4+F/9n9Fqc1l6P/DymWZeI3Pk3LTYiWkPjTxqYAtRhFaZkPGniNtMd6
	 1BEXKmbmo7Y+02dWBKuluOC9DAxrB5qY/tyjp6ucHoHdc0r1FIkgop8Z9p6LjGqT0LwTl
	 419CN0s16qlkEw0UrzV8qu1AJVvIeA9vWN95tIR2S+gMCJcTB7oyrsJLiGqSt1S54k5i+
	 Fgm5NndqgF6+TkTE1mllD6Q6dh0dnGylzwlMt8089xlaAAgiutSUhTTIOkt4IyVatz811
	 nHRNJRyUOR7zyG0he2tWM+HcHTg1Ujg4dkBhlLEf8JRM1t93/mX7lSgq9KuW/P2cnaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D30etPRA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FF606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D30etPRA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3F01F00A05;
	Thu, 12 Nov 2026 04:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794456950;
	bh=NmVNVPYjCzsZdDTtlzY9RCmi9UD+d8iTj6TJ2+93xKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D30etPRABjsfjs5ZHvDumFqe0Lo8tlDKgGxl/Hx+Z1lyDHuLd3F2t0r8j+xFqiIi5
	 dt4czzMHFZspiTHZHVnaQciL0Dj56EsnfKQyUPv2cuO3Rtp2joRzpEj89JQlRbHzRU
	 eqFbzaqT5plmHeB76sljt4cCbVu742HwdFjIlHhS3sqTOa6v6yjRLGRKWMU+Prm8Vp
	 S5onNLAzTpr8OxQaO9GLxBG+X2BkVnXqE+q97Ct9n0EaAuamugDRS338fELUduz64q
	 AMkiJ68WB+B3JM0HhvojJGw+96IquZdftpAMWUN6eKV76uOXTkKcO1COvw5JeIvFdk
	 zvdZ0elMpiy+g==
Message-ID: <sashiko-outbox-210314@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/1] ASoC: rt1320: Use the BIOS init values on LG
 gram 16Z95U
Reply-To: sashiko-reviews@lists.linux.dev
To: fixca <jaehoon1744@dankook.ac.kr>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112040143.6945-2-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
 <20261112040143.6945-1-jaehoon1744@gmail.com>
 <20261112040143.6945-2-jaehoon1744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:15:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: rt1320: missing PDE23 power state entries in
  rt1320_vc_preset()
- [Low] ASoC: rt1320: duplicate board init table in rt1320_vc_preset()
--

commit e08ad88a1a372908c1aadce1ece061c49a996626
Author: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

ASoC: rt1320: Use the BIOS init values on LG gram 16Z95U

This commit adds a DMI-matched register initialization sequence for the
RT1320 amplifier on the LG gram 16 16Z95U based on its BIOS SDCA function
initialization table.

> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
> index fa89db0966514..b1d6ab8dfa45c 100644
> --- a/sound/soc/codecs/rt1320-sdw.c
> +++ b/sound/soc/codecs/rt1320-sdw.c
> @@ -2339,15 +2339,221 @@ static void rt1320_load_dspfw_work(struct work_s=
truct *work)
>  	rt1320_dspfw_load_code(rt1320);
>  }
> =20
> +/*
> + * LG gram 16 16Z95U: the BIOS provides a board specific SDCA function
> + * initialization table for the RT1320 SmartAmp (SW23 AF04). This is that
> + * table without its bulk RAM/patch areas (0xe000-0xe7ff, 0x10007000-,
> + * 0x1000d000-, 0x2000xxxx); the MCU patch is still loaded from
> + * linux-firmware at 0x3fc2bf83 as in rt1320_vc_blind_write[]. Registers
> + * that the table does not touch but rt1320_vc_blind_write[] does are ke=
pt
> + * and marked "drv".
> + */
> +static const struct reg_sequence rt1320_vc_lg_16z95u_blind_write[] =3D {

[Severity: Low]
This isn't a bug, but as the commit message notes that this patch is not
intended for merging as is, duplicating the 175-entry preset table for a
single DMI match copies over 120 identical writes from
rt1320_vc_blind_write[].  Applying only the board-specific register
overrides on top of rt1320_vc_blind_write[], or using the SDCA
mipi-sdca-function-initialization-table infrastructure in
find_sdca_init_table(), would avoid duplicating the base sequence.

Also, is the commit message accurate that 0x1000db15..0x1000db23 swaps the
left and right mapping compared to rt1320_vc_blind_write[]?  0x1000db00 is
an entry count (0x07) followed by seven 5-byte (32-bit little-endian
register, 8-bit value) entries, and 0x1000db15..0x1000db23 encodes the same
three register writes (0x010d =3D 0xbf, 0x0913 =3D 0x00, 0x0912 =3D 0x00) as
rt1320_vc_blind_write[], only in reverse order.

[ ... ]

> +	{ 0x1000cc46, 0x00 },
> +	{ 0xd486, 0x43 },
> +	{ 0x1000db00, 0x07 },

[ ... ]

> +	{ 0xc5f7, 0x22 },	/* drv */
> +	{ 0xc5f6, 0x22 },	/* drv */
> +	{ 0xd172, 0x2a },	/* drv */
> +	{ 0xc5d6, 0x01 },	/* drv */
> +};

[Severity: Medium]
Should rt1320_vc_lg_16z95u_blind_write[] keep the two
SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
RT1320_SDCA_CTL_REQ_POWER_STATE, 0) entries from rt1320_vc_blind_write[]?

In rt1320_vc_blind_write[], releasing the MCU reset at 0xd486 =3D 0x43 is
followed by a PDE23 PS0 write (0x00), and the table ends with a PDE23 PS3
write (0x03):

sound/soc/codecs/rt1320-sdw.c:rt1320_vc_blind_write[] {
    ...
	{ 0x1000cc46, 0x00 },
	{ 0x0000d486, 0x43 },
	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_PO=
WER_STATE, 0), 0x00 },
	{ 0x1000db00, 0x07 },
    ...
	{ 0xd172, 0x2a },
	{ 0xc5d6, 0x01 },
	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_PO=
WER_STATE, 0), 0x03 },
};

rt1320_vc_preset() keys off those two entries in seq[] to poll
RT1320_KR0_INT_READY until the MCU reaches 0x1f and to wait for PDE23 power
state transitions via rt1320_pde_transition_delay().  Without them,
rt1320_vc_preset() writes 0x1000db00..0x1000db23 and triggers 0xd540 =3D 0x=
21
without waiting for the MCU to finish booting after reset release, and
skips both PDE23 power state transitions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112040143.6945=
-1-jaehoon1744@gmail.com?part=3D1
