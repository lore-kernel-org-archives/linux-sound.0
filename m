Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE22BE7DD
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520309; cv=none; b=mg23yBshbklrQYLc2kGcvZIX4T8XNL/XMHneV75d819kbMQ9/QMT3HowV6U33iy6npechhBbhLciClpq/CFcpWmmh12JRvGbfXKZK8Ado2VvFQag+xWRRxN0T1bokjEILCF4HKmyGTeZ852fxxtGKZgTzzdV46nzAuVSiMnNM84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520309; c=relaxed/simple;
	bh=Fz4PEuGI3O7q19w9pR/Qd7L9b3WTupUNixNtZQ6WqEM=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To; b=jcOlfrxgb4StPklCZFoeUkSiVlBHqFnLYLW+jRp3rKaPAfC4pZzhFff9xQmZq7/vxejdsoVStfFCNGt133BqsG6Ks36tasPqEztdOKKzZiK+rFHh89c5xzkoFmZv+6etx2Y3H+a3rMoswXOPXePrV7H8aGYaCXeyGRPyV1QXTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+iuG/kQ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+iuG/kQ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93cbee4b010so370387985a.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 21:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791520307; x=1792125107; darn=vger.kernel.org;
        h=to:cc:message-id:subject:date:mime-version:from
         :content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh/x7oXNS4mJ8zsjUTn1R5anhCmSoMMsD8wrAIfaouw=;
        b=o+iuG/kQL/AQ5zT7NKEzOIeCzPiUNoIyzkRMt9v7d/D3CHzr/X6NV84NykwA/6mLqC
         Ajc+fCE/c3SevyTEXovmLJKg0B+y7bp0tiI+HORQFHBOwPX9hGY4S5Kx9CdI4ZgZGLXC
         NWtd3NStHyyhWM1vSUzaO3viJ1uX5lZJLZVqxZGzgW7PfMDH1LeOC6muGCcDe0CCLiSl
         aOCiMlka+a6GtfS3JLfQWwLbwTN/rYPvkd+6LORNRZ2VjDpXleR6+T/pzJR4gi8RuHVg
         dgKlX8Rw4Rn2HPzm3gJbEOMmKbKhQhZWBfBEezFiImnhwoabhXHzy6Oem+xDnugNJy0V
         5Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520307; x=1792125107;
        h=to:cc:message-id:subject:date:mime-version:from
         :content-transfer-encoding:content-type:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh/x7oXNS4mJ8zsjUTn1R5anhCmSoMMsD8wrAIfaouw=;
        b=z0SexcFRNY5hZ4yEoiWNqNbm/dam8SDQSpGFWqTvAYp0lu+bQSbT8e15yxsVvwiGkC
         YRrmbn1tahC6ZqL8V2hzklRjjQs3oquitVLdGHeRMtkGBGfBW2jjReol0r+VuYQbhK34
         oa2FRtp9Qq0tlgD0F7rrrTYscz+n1uwYHsOJW+AFoBtckhSwHiuN+Ya468JYkAagVexn
         Dj8T26XccflWJkNFH2DLexR6TIPtAduymlJ3A0i3rPETk3enhCDH9apEd1WWnq7A1Vor
         vJI7Ov24sH1tdmdmGO/2mX0FYssxnsayrUmzDih5+9vUBvPyTKrINFoURdrCMmdWgTlH
         itjQ==
X-Gm-Message-State: AFuF++mfpHWqlpkJp36N1luIZ3gqXZmCevlH2erShDrPXkSYeq4CMOad
	ICdJ+eAsX9hhY9hTvyRZESePTfftbi72lmOzrHFgOKtVAImx70QZ8g4i
X-Gm-Gg: AYBFou338yvk+PKgqYNB4WtR0KgLRCNYAwcJQw1onUhL/kx1W0f4IZx0hD6mi7Z3cby
	2vMWYaUjrDwTfFfkNtqBCo3ATeKM9Ewjqa9tHdjfsCpj3/hDW8ItL320Y/c2HRUjaLyMi6CxLIj
	dbQOPRcuJtj+4pUjXXJVVJoMdYBqEtrFb6kL2U5I53Wrz5iRHKnYNKhU7TdZgEJOJCT2Ql4N0L0
	6Xo+1GuUcBHHOw7CDdJkYOef6Dcz1ZLbO6gx2Za9n/iov9ZLmce/n9dERAChgctB0yvvUGsTXqI
	mbsB6sy/+qDjHD7wWQnLP0HN2NB4KR20/EmYKHank+Y2PyvTLjgcZDdsT1yu7ecFiKXzujFUIRp
	jqrSdGk2exeH2L5gFvfJGMTfjl+x0KgDtJDD+rcZiNJhKjiR09bansmiajLrhKIWffZcYO9cTDO
	kntdmFBjRMrJN/droVkaOiLB60gE7vAx+eJyD8EYiEUksIpQ5R263sKa83xNhmAqIaSBRwCs+Dq
	xr+NurchOf1jYHjP9RuC4OPqGRZUhqvPOpp7p4t7ULW5Dl29FylIwZCEQ==
X-Received: by 2002:a05:620a:2985:b0:93e:910c:5e65 with SMTP id af79cd13be357-93ebd26b66fmr106881185a.49.1791520307022;
        Thu, 08 Oct 2026 21:31:47 -0700 (PDT)
Received: from smtpclient.apple (c-24-245-44-53.hsd1.mn.comcast.net. [24.245.44.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501755asm8674026d6.12.2026.10.08.21.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:31:46 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Cory Mattson <corymattson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Thu, 8 Oct 2026 23:31:35 -0500
Subject: ALSA: hda/realtek: LG Gram 16T90SP (ALC298 + ALC1318, SSID 1854:0521) - no speaker output, need amp init sequence
Message-Id: <0270FFF8-D78F-40D7-874F-6240AEA8C759@gmail.com>
Cc: kailang@realtek.com, zhangheng@kylinos.cn, tiwai@suse.de
To: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailer: iPhone Mail (24A446)

Hi Kailang, Takashi,=20

I=E2=80=99m hoping you can assist with resolving a problem I=E2=80=99m havjn=
g.

The internal speakers on the LG Gram 16T90SP (Meteor Lake, ALC298, SSID 1854=
:0521) are silent under Linux. Headphones and Bluetooth work. Windows works,=
 and the Realtek driver there (RTKVHD64.sys) drives a Realtek ALC1318 I2S am=
p behind the ALC298. No existing in-tree quirk enables it.

Bug report with full dumps (alsa-info, Linux codec dump, Windows RtHDDump fo=
r speakers and headphones):
https://bugzilla.kernel.org/show_bug.cgi?id=3D221815

Tested so far, all with silent speakers (playback runs normally in software)=
:
	=E2=80=A2 SOF (sof-audio-pci-intel-mtl) and legacy snd_hda_intel (d=
sp_driver=3D1)
	=E2=80=A2 model =3D17aa:231e (ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318=
). Mapping 1854:0521 to this fixup directly oopses in try_assign_dacs on pro=
be.
	=E2=80=A2 model=3D1854:0490 (ALC298_FIXUP_LG_GRAM_STYLE_14) and mod=
el=3D1854:0488 (ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS)
	=E2=80=A2 Windows Wid 0x20 coefficient table from RtHDDump, with ma=
tching pin 0x17 routing
	=E2=80=A2 GPIO mask/direction/data sequences (0x01-0x08), alone and=
 after the Windows coefs
	=E2=80=A2 Zhang Heng's test script using ALC1316-compatible tunnel w=
rites (coef 0x22 =3D 0x0010, amp power-on coef 0x10 =3D 0x1b21)
ACPI lists 10EC1308:00 on _SB_.PC00.I2C3.HDC1 at I2C address 0x10, with stat=
us=3D0. Probing 0x10 on that bus (i2c-[1]) during playback gets no response,=
 so the amp appears to be reached only through the codec, not over I2C.

A VFIO verb capture isn't possible on this machine: the audio controller (00=
:1f.3) shares an IOMMU group with LPC, SMBus and SPI.

Kailang, could Realtek share the ALC1318 init sequence used for SSID 1854:05=
21 (or 18540520/0521), or point to which existing ALC1318 fixup is closest f=
or an ALC298 host? I can test patches right away.

System details:
	=E2=80=A2 LG Electronics 16T90SP-G.ADB8U1, BIOS 16T90SPF08 (04/24/2=
024)
	=E2=80=A2 Intel Core Ultra 7 155H, HDA controller 8086:7e28
	=E2=80=A2 Codec: Realtek ALC298 (10ec:0298), subsystem 0x18540521, r=
ev 0x100103
	=E2=80=A2 Kernel 7.0.0-28-generic (Ubuntu 24.04 base)

Thanks,
Cory Mattson

