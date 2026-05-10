Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB137E308
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778422683; cv=none; b=O2QOHSGijrbCqiYuaV5gYSlA/76oHhEXm6tF9ZkDZ8CAULJvJLq3WrjeowC0r0uZ3bvp1MnfSVJf8EcZnRgHCGUbALkZiOFVqYxLQGdg80LSWW8QLOQjO5QC6HepR7dc6Z9CRq8b788mb3v584jMWBZO92VUjXzsONUkF0YoJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778422683; c=relaxed/simple;
	bh=eVqgC1xA9M2bklT63Dl+KVIS57bFXdLPYg7dEU4JZVY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=E/IT2DH9od4ZXSSBvxCqePBES3Vw00XE3+p4RxaT8gEsMTSSYAyVAGcf8KDssn1AWkg8DYq3f6BgbfAKJr+bT9C/GEY13iu29yup7EdOhGNXigdlgrX0o+yKnA+PF0GxKYZy/nPZSTbHgO/rzogfd+mvAbpy1tmajDhEvwvNBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvAu5fmO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvAu5fmO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488d2079582so37407475e9.2
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778422681; x=1779027481; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c1v7P9bXIEtU6HTLEaCLE37lPXfLvX4qrIzZK/pCBls=;
        b=MvAu5fmOjS01m6SpsEBS/b1541phLffy8fE2n+qrYXLjRoEGh4Tqbgj6oko3g0xdoG
         R5QyiOuYJCAzmzDAEe/9XGbUgcFhMp0wQTvQoYmDsxRMgxIKXNxA/6Tsc4czJsNzGcnq
         emH4L+7uVne75rge1V30UI12sGVd3wnV1sYD1+2mda2l9fffGIgnC6Dv5lX/B+DlLBXj
         0ltWABqtPvH3qLvaB4uyTHPSX5PAm0Al/8HZ+TzadZRuMgknumvQ/NGdu7MSq5la0Kdq
         6tT0IUiLxpBfEcKvFfzRLCN7dSs3kKLt42DNsusxfhowHj9J5FU6ceKomOmzt9u9vY70
         nU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778422681; x=1779027481;
        h=to:cc:date:message-id:subject:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1v7P9bXIEtU6HTLEaCLE37lPXfLvX4qrIzZK/pCBls=;
        b=k/LWLYPQTL0QWC40krewWxOZTmeyHC4EtXd4ycSJu35ojOFLFv7+jsNkC6JpxoDBGg
         8VtyIfaNT6qa+urnBW5q2Arw682yXsETLOzfFvW/k2K7/eKFI4O26Ff/Bw0sBLvaOBYK
         x5QlFjt2Rw9AJxSR30USJzT7AokBsRKTakXLSgGSqV0VHosc5+yPb+s85jLUTVsPz9u9
         z9GsQ4d1p4YEmU0LIrkVb+NjGdJbgW5sTfivIcVIetb5RuMlPzyooKcjcgABK9rAJEkz
         m00o+ZNVhNp0ODkGPfodCpzRJbj+MEEWaCdSzmCYfUe0nyFIB+31UnRTMXkldcpD0+lZ
         6rIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QJMBt5HIJXA1myGo+2Q5QkddaaJ7zCnC87iGwoyabEaIn57yXrzzg/koK/eZg+PVSBLsaZPIkCWuUdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydjR1TzFOIDCDKXrq8ulVq3A0ygIlPfMBl5yCP4z+mOb6GsFJq
	Gvii2vzDtH4XWW7AMf3fdxqxC8A1N+aDhexdZVK/Y78D3FAprP7+9iGka8XZ
X-Gm-Gg: Acq92OHk7WhD7XKCEJDqJcfMQqvgOBArilQrCPZhrFnmiPmOpo1j3yL371eByxyVzSN
	8i1GOZNplVf9NM7A+5fqpBmnC20Y5pcfk/1Iu4ZpairfZCauOodV7sb/Cwa/m4PKEg993JL0c/M
	PGyyVW1fOFrIai6kP8cV+mPP5cYO8XMEF3CCqMfnQyq/oOSXtihOhXga/AOxL5TrSNQ2zT1Rnqi
	lOgXNJYK63VfAJjc+J6ACTG/e1C7FodgJzUUb8UmHuJLPCE2sSRccPNWzmdd9G/Ee1D1APoM1Ua
	68ygl3ELgBV1/fts6wvzo7bZbeGDpejg0CoGRIu2Z7ESUQOfxGe1dcaomr2mYik8KT+RJsPYn+k
	jb0qgftxU736QCRhFQ2FSvBOOilg6ys2NYtmjegEK6QmZkHmPmnTYaJIf5gdtYFExELnWdVYEOd
	5Z7oaqW8mrCbnrIOVN2PzVFePcH581iY80tDs2k0zMZeLV1hKH1aCG1k7pVFxmUQjZ/5HWcIUEf
	Qp4R1u3TGpdobxrrvE=
X-Received: by 2002:a05:600c:8011:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48e51f3b589mr313409985e9.24.1778422680581;
        Sun, 10 May 2026 07:18:00 -0700 (PDT)
Received: from smtpclient.apple ([151.43.111.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702f4042sm127081015e9.14.2026.05.10.07.17.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 May 2026 07:17:59 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_F5FE587A-12D7-475B-AC16-577BDBC51A0C"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: [PATCH] ALSA: pcm_drm_eld: rate-limit ELD parsing errors
Message-Id: <8104462D-BF7C-4C66-9442-0F3874A128E3@gmail.com>
Date: Sun, 10 May 2026 16:17:47 +0200
Cc: broonie@kernel.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: perex@perex.cz,
 tiwai@suse.com
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_F5FE587A-12D7-475B-AC16-577BDBC51A0C
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Hi all,

Sending this via attachment because my Postfix relay setup wasn't usable.
Patch is straightforward: rate-limit two dev_info() calls in
snd_parse_eld() that get triggered on every PCM open against an
HDMI codec with no sink attached.

Equivalent fix to the one Mark Brown did for hdac_hdmi in June 2025
(lkml.kernel.org/lkml/2025/6/13/1380), just for the generic helper used
by ASoC hdmi-codec.

Tested on Rock 5B+ (RK3588): two HDMI outputs, only one cable plugged
in. Before: ~30 "HDMI: Unknown ELD version 0" lines per probe burst.
After: 0.

Let me know if anything needs adjusting.

Thanks,
Sav
--Apple-Mail=_F5FE587A-12D7-475B-AC16-577BDBC51A0C
Content-Disposition: attachment;
	filename=0001-ALSA-pcm_drm_eld-rate-limit-ELD-parsing-errors.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-ALSA-pcm_drm_eld-rate-limit-ELD-parsing-errors.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=205c740f52f5bc1629125588cc7e5a2731baf91e8b=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Sav=20=
<62543096+dongioia@users.noreply.github.com>=0ADate:=20Sun,=2010=20May=20=
2026=2010:54:00=20+0000=0ASubject:=20[PATCH]=20ALSA:=20pcm_drm_eld:=20=
rate-limit=20ELD=20parsing=20errors=0A=0Asnd_parse_eld()=20is=20the=20=
generic=20helper=20used=20by=20ASoC=20hdmi-codec,=20equivalent=0Ato=20=
the=20hdac_hdmi=20parse=20path=20Mark=20Brown=20rate-limited=20in=0A=
lkml.kernel.org/lkml/2025/6/13/1380.=20The=20same=20spam=20shows=20up=20=
here=20for=20the=0Asame=20reason.=0A=0AWhen=20a=20HDMI=20sink=20is=20not=20=
connected=20(for=20example=20a=20board=20with=20two=20HDMI=0Aoutputs=20=
and=20a=20cable=20in=20only=20one=20of=20them),=20userspace=20audio=20=
servers=20like=0APipeWire=20keep=20opening=20the=20empty=20card.=20=
snd_parse_eld()=20then=20logs=0A=0A=20=20=20=20HDMI:=20Unknown=20ELD=20=
version=200=0A=0Aon=20every=20retry.=20On=20rk3588=20that=20easily=20=
produces=2030+=20messages=20per=20burst.=0AA=20malformed=20ELD=20(MNL=20=
out=20of=20range)=20hits=20the=20same=20code=20path.=20Neither=20is=0A=
worth=20a=20separate=20dev_info()=20per=20occurrence;=20switch=20both=20=
to=0Adev_info_ratelimited().=0A=0ASigned-off-by:=20Sav=20=
<62543096+dongioia@users.noreply.github.com>=0A---=0A=20=
sound/core/pcm_drm_eld.c=20|=204=20++--=0A=201=20file=20changed,=202=20=
insertions(+),=202=20deletions(-)=0A=0Adiff=20--git=20=
a/sound/core/pcm_drm_eld.c=20b/sound/core/pcm_drm_eld.c=0Aindex=20=
cb2eebaac85f..1941ee520063=20100644=0A---=20a/sound/core/pcm_drm_eld.c=0A=
+++=20b/sound/core/pcm_drm_eld.c=0A@@=20-334,7=20+334,7=20@@=20int=20=
snd_parse_eld(struct=20device=20*dev,=20struct=20snd_parsed_hdmi_eld=20=
*e,=0A=20=09e->eld_ver=20=3D=20GRAB_BITS(buf,=200,=203,=205);=0A=20=09if=20=
(e->eld_ver=20!=3D=20ELD_VER_CEA_861D=20&&=0A=20=09=20=20=20=20=
e->eld_ver=20!=3D=20ELD_VER_PARTIAL)=20{=0A-=09=09dev_info(dev,=20"HDMI:=20=
Unknown=20ELD=20version=20%d\n",=20e->eld_ver);=0A+=09=09=
dev_info_ratelimited(dev,=20"HDMI:=20Unknown=20ELD=20version=20%d\n",=20=
e->eld_ver);=0A=20=09=09goto=20out_fail;=0A=20=09}=0A=20=0A@@=20-357,7=20=
+357,7=20@@=20int=20snd_parse_eld(struct=20device=20*dev,=20struct=20=
snd_parsed_hdmi_eld=20*e,=0A=20=09e->product_id=09=20=20=3D=20=
get_unaligned_le16(buf=20+=2018);=0A=20=0A=20=09if=20(mnl=20>=20=
ELD_MAX_MNL)=20{=0A-=09=09dev_info(dev,=20"HDMI:=20MNL=20is=20reserved=20=
value=20%d\n",=20mnl);=0A+=09=09dev_info_ratelimited(dev,=20"HDMI:=20MNL=20=
is=20reserved=20value=20%d\n",=20mnl);=0A=20=09=09goto=20out_fail;=0A=20=09=
}=20else=20if=20(ELD_FIXED_BYTES=20+=20mnl=20>=20size)=20{=0A=20=09=09=
dev_info(dev,=20"HDMI:=20out=20of=20range=20MNL=20%d\n",=20mnl);=0A--=20=0A=
2.54.0=0A=0A=

--Apple-Mail=_F5FE587A-12D7-475B-AC16-577BDBC51A0C--
