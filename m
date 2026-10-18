Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B344825B087
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326648; cv=pass; b=ITpewvoQgYsFzoLXBDcXui+TuOOkEyxMaFXBFsOgM/S+dS2x2uX8pZYLNh/sbNSUav83jSV6bo7VTdLZ++JagSR1sp8iCWlX+0mgXWmlFbjsnAsilnYf2OfWOM5gGPJ9N/7tyA94HE6zYirmZ3nlc42seU9kwTpBJ97xuXnudXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326648; c=relaxed/simple;
	bh=hGBxUYjWWAc4v/Xd4FKKlTwQX13/gslDWb3f10OLHzs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eqWiu8fSEztRORaZhVrNBUd1L2Q+TKs7H8YXAnK4Jzc0tJgdWKqiLY2cYaMVLKIN36OLWONQno3IucpGaBwZxewwh8EGG4iqBP53y7KVYR+Ase0fnO6IAyR811CZ3epHa24EQ7JM9DocViAiSVxQsoFgUOYqHxOkbaqCcTfQlCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8/CW2oL; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8/CW2oL"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6faddda49e7so1272113eaf.3
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792326646; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYrwOl9l+/WU1eRpU5bhF443rzk3WnFpXjV9nXbFrtZbPIH2+EIAWnRLAhRub1a7Up
         sukNne4LA59+SbjPAfleupTEbwtnBgdLDo2X5drmH+uJv8f691zVS4i0y+CcWDdN6SOF
         Ec2f3D/BtzRmPLWZyzAn/3KAiCivG3fY75eNRDCtffN8Nx9D5pwIWPb8fPO/ZGfxgfDI
         OEwm+sfGbTy5L3NkmDiY12ijBxfpwJ7F6Nv7ZQ2e6DdhnGheFO9i4u6hBGMxC2GarilP
         WQ9EbkcEevcL720AaOiLZaucC60k5a/SnDNGJw3cPNZar3O+IKAxNc+g0SNmkv5H8/yJ
         he/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3htTFltoBWRjtENRXAT7lfEnJyYFiPOWDtSlLZqXiu0=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=CsIfuY5Jhxrz16CuaYRjd+BzQfjPMlDhU6sRygHe6ZV/X8Sws9Ybt3rMQjmNEW1jRe
         LyzvJoF/mK8awcXZhmMhmIe2w4lBiSvKF8Eh8g6hEeACCjLmb6XXwDYqBHVbzdY+iDiZ
         n80KfEwTczTwHNhx/lyAbXab2WAbrMqLxRgqNzeuuFFonFDq7ulCzIBlJv87xyeka1WS
         eUYsK2vVgJCiCqlPryLL3R4yAMvTTDiBd3diS+qenEQkOvmM5c7rJ762YBAvFEJH0UBl
         eE1M3OA6hB9XdRaKoXZo1NioAQD+KTO0IXbtbK0JupdupdTETulqF6dEI65K3cqPjeGo
         a2Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326646; x=1792931446; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3htTFltoBWRjtENRXAT7lfEnJyYFiPOWDtSlLZqXiu0=;
        b=o8/CW2oLgSpwaFehZA7jmEwcm019n8gCxAO1njuk6Ermiy9QIiazujUQJWf/hK7Oii
         6QECiBcRVaEo5l7mES/DJVahWmND0ccq5xca5NxssTpXCjrdsVLRv0nEhuvzj/li0x1N
         dTh23+2jXWGULJQv/j5wldWM6HjzWfOucp7Pf4s4/61sFAzZPoyRogQ9Vl6vTJ3D0g4P
         H/WgPjzuGjwC1W6sCs5ZoDol7ds91szA2y+eniigkmdZY04z5Ky/UNw5PysFyT3u6/uf
         Y0t7z3MA4LuNiS4pPDH7+pHaB0T+FrPCg9XmlyauouA6RY3EzKA93CCQXMgb2Q7PRu99
         j51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326646; x=1792931446;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3htTFltoBWRjtENRXAT7lfEnJyYFiPOWDtSlLZqXiu0=;
        b=qcEGr26B1MZlWRMVOc1NIes7blLJ+f3WRdJZsYahGL5ZHUebtjkVLFXtUSyNRLDqwq
         zbmY/XWsY5ScaUojrKTxthQn5B58QorzP2BXWcO3sz2a2XC5+4H6HdxdsehXTNrT5A/L
         5YPU5FFW70edbHPxU5MCx0IP62oJt9EasgUs2IQTQ8jA+bO7FdT43iLOrTA6/NiLF1XS
         o2JVqfNz0HhxRhtK6LNUipBhtTk4+pt3kN/n+0psWq7iElZNY2M0siH3H/NNADqr/kMe
         /THpA0Al4d/p/KQaJqrbmB2ECB2mztYO0RZx9Gq3maeaHDN6vvSxB+dEKYr+LnXEY3fr
         sjYA==
X-Gm-Message-State: AFq9FYKQBGkxeH0Ls79o8cERrjg/F2qxCTtU6Tr0x5+PlxQzhxeIv6KD
	Fhjt9wtgjiPboKj0Y9PW9bbguaNbVraSsbpaGEF8yWtsxRkMLwpppNMoKR4BV961XjfcFXTKJNm
	t4rm8my0jgj5H5fckqo+MDbZN1KDTBx5hcqfRrIbHXw==
X-Gm-Gg: AYBFou2wClr4GZJ8G8Pt1Ms8BUxaOahbRD/SpF8oQPwpp+kxH5NqzFbtN/wnA7luWfX
	NNoHVDgve7VJOg/swHJMen1ucLCItbqXHXE+kHXMoF4/zJ1Et6SGu5IZfMOITlNWZ9MsWkmieJY
	STzguCPEWu7K8B11K7jlrij2VZPCLZaCcBAl+5PZlJdj1vBnk+fdq/UVy9YM87FuXeRlT4qqsPI
	dG+yPUw+LGrExKNafVdld7d3A9xtzyK1Zb2V64BW0wOlApowSVyPfQ8lAnKZEjXhcabfWMyZTT5
	1i7xFIBSwX9wuN2pGb3gDQZIz/AEOgFbxGmf1us/X+Npwja68Ll726dNw7+CPkKrgFiEhiXrTWX
	gncZzbezfTK12lLYGX8eDY8hj19j5JLRE4+yCk5aaB9Lf25a7bVVGQT3sx+zfJCaMsnM0xCzXa2
	E=
X-Received: by 2002:a05:6820:2087:b0:6b9:6c3c:9492 with SMTP id
 006d021491bc7-7035749e78bmr3491471eaf.64.1792326646487; Sun, 18 Oct 2026
 05:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lorenzo Baracco <lorenzobaracco01@gmail.com>
Date: Sun, 18 Oct 2026 14:30:35 +0200
X-Gm-Features: AclHuK9LBUtmagkjITMmZ9f9ypBLkPNQVrGAr7RJ2oSY5iYTtTiPikCPTgB5YW8
Message-ID: <CA+LKU9wqSpsnSQCue1Nz_WGy5XPevq8-2GgkRJgYHQXWunD0Gw@mail.gmail.com>
Subject: tas2781-hda: TIAS2781RCA4.bin enables CLK_PWRUD, speakers
 quiet/distorted on Lenovo Yoga Pro 9 16IRP8 (17aa:387e)
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Maintainers,

Full disclosure: the report below was fully written by LLMs. However, the
fix comes from the community, and it was thoroughly tested by me.

On a Lenovo Yoga Pro 9 16IRP8 (DMI product 83BY, ALC287 SSID 17aa:387e,
4x TAS2781 on i2c TIAS2781:00) the speakers sound quiet and distorted with
the stock firmware from linux-firmware 20260916:

  TAS2XXX387E.bin   (DSP, selected by SSID)
  TIAS2781RCA4.bin  (RCA, unchanged since linux-firmware be101793)

Kernel 6.18.56, SOF on Raptor Lake-P, skl_hda_dsp_generic machine driver.

Every PRE_POWER_UP block in both profiles of TIAS2781RCA4.bin
("I2S-16bit-echoreference-slot0" and "dsp-16bit-slot0", 4 amps each,
8 writes in total) contains

  book 0x00 page 0x00 reg 0x5C = 0xD9

which sets CLK_PWRUD=1 (clock-based auto power up/down) and
DIS_CLK_HALT=1 (TAS2781 datasheet SLOSE86B, section 8.9.53).

If I change only those 8 writes to 0x19, the reset default
(CLK_PWRUD=0, clock halt detection enabled), the speakers play at full
volume without distortion. In the file that is 8 bytes:

  00 00 5c d9  ->  00 00 5c 19

Nothing else in the file is changed. I confirmed this two ways:

1. Runtime A/B: an older TI build of TIAS2781RCA4.bin (Nov 2023,
   4 profiles, circulated for the Yoga Slim 7 14APU8 / 17aa:38bb with the
   same edit applied) contains "I2S-16bit-echoreference-slot0" identical
   to the stock profile except for reg 0x5C = 0x19. Selecting that
   profile via "Speaker Profile Id" fixes the sound.
2. The stock linux-firmware TIAS2781RCA4.bin with only the 8 bytes above
   patched, loaded from boot, also fixes it.

Questions:
1. Is CLK_PWRUD=1 intended for HDA platforms, where the codec starts and
   stops the I2S clock with every stream?
2. TIAS2781RCA4.bin is shared by every 4-amp TAS2781 HDA machine, so
   changing it would affect other laptops. Could TI publish a regenerated
   file with reg 0x5C = 0x19, or should tas2781_hda_i2c handle this as a
   quirk for 17aa:387e?

I'm happy to test patches or new firmware on this machine.

Thanks,
Lorenzo Baracco
