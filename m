Received: from sonic315-22.consmr.mail.ne1.yahoo.com (sonic315-22.consmr.mail.ne1.yahoo.com [66.163.190.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ABA482EF
	for <linux-sound@vger.kernel.org>; Tue, 17 Sep 2024 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726555356; cv=none; b=PzIUPZKJhJN/7sad30oWUnGxBkAHw1zqRtRBcKXVJibdC7BIyDmshu8o6Qdmweg9/kr9jnvU7YVd6TdDFYRVR/ke8Ls3WhW2mWJ1JSxIlYcYRr+eJ2f9ECCLa7WuuM3SDeGCLKF+dY5ciSx9KmnW7PX1IUxa79iSeDU7Udeg/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726555356; c=relaxed/simple;
	bh=ar2RqSH5NFYxuZhKfyHpRoUSG+H9LjpfQJulrmGBxeo=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=BFzUCDnqY8UEUO4CH/AES6yl7N2PTK4l008yy2B8vwwRccag7SM4hTem4aEHZRIJ8XaXo6IB13ZzNNSHwwn1YUEaxAIcotdtj/sa5wMytMSD7EcPBodfJ4BlgMGpo5HC0l+HijycOTfLaw4JkAAhYM+aNaBlNB5Mzei5EAniYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=gACFksCk; arc=none smtp.client-ip=66.163.190.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="gACFksCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726555353; bh=ar2RqSH5NFYxuZhKfyHpRoUSG+H9LjpfQJulrmGBxeo=; h=Date:From:Reply-To:To:Cc:Subject:References:From:Subject:Reply-To; b=gACFksCkwz+srmvlUepmIrdgy29/0Fe4VwhbHkpjcvy6u9H5UWxsTQ+SmImD64vzoWnbmbFmc2LE1BSFwt5YrNrEf5FrQNW5oSMlrHkxoZnX3e2Za4A6v1NgOih8ID+zFe53BSK7J+U/wS0tet1JPpN8d00S6xMPv/4pSv4LwPwrrG0s1tVuRtnL27ksTthkT00mOqjwua/a68/o19A6LBjtMc/wnXTPJQLCb6SS3ZIQHamYztBHq5Uum67PX7f/DC5w2mhi3gk16fK6WberS4EIwYcUsxEyU8Mrfjru58HGmoZ1VFmgjTcv+46FwYXZwlsuDtRuqfBEULTmN5PFmg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726555353; bh=OBriKw/+ttCw9qWR3daUT0mJF2jfslrIRAP9PJaon85=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=TFe3pUxYsAbWk4DOp2GSjKN3syyOLyppYLUm6TyyeGnFZzTB6FRzwuEAW+FzT82vFhTgP1/4TuyscvfVfy6XeCoYoVs89Zh6f79Jr/NNctr1Ojl90toxL5bCKnVVkh4yImC4arkfc57qi2Uqm1tiPrQHkji+f5yu62IL76gtoNwLbarAfJ005XNC2bnbh5kfn8tusRHWU1hEVAILIdp9c/fuBqny+QUskqt/9bgocjZLKMwyXWJN6jR7bwIKfaWfZlai9/rnFKQA9XZhomtaiQJ5Is4dkK6LIUnElT1RTyLKNFbpOIEvG4AfmrViMr6IwrJ6eFAVdNd7i3hrg6qrzA==
X-YMail-OSG: .CvJllAVM1nprL.L0f7si1o2GDt81R0cTSt144NQhcAptHkZSzKa_hXufxTqKt1
 L1H_RPpt1N4LJRJ987gGv6mqPC_0kbBOHNQ8ecoarP56SQymRNUz7QZx.3ylfoA3zsWLVsnEx7Q5
 gwVD2EzCmrdRfsvzWVn0vZhxkzSuaLHqde1qSjxtIL0QPkP5pjPR0HwZVvAr7kVY7CkcTQFW743K
 5CfEwvTJf9bQTuEmOgSOuh1zinE388HUjT1XKQylOiNNvjiD9YRGpwJ41i9EMf5BstVYomH5cNHh
 deNOhPFAsEa5_vAKUNJb_ZE0TJOtRkT380fij_CD1daqdxHJ_pVoyKb0qp4aT6AxKs_L3CaXqArs
 dBLgeBLWEQYspF.TZCzGymDQ7LZH9lAQ7NwW03HBLFafx1tPJsWyw9ELZuw.5UyIBWhtTYPrEkOQ
 Mk2bWbenyixbQT3_9YklTyhfsPQCb7v3A_.PzrUNpzHNcd0cPRjj.lmwuxHwBNLzENdIGYCZuAHk
 kVBEBS9jIRX5jWVIXEBLn2Lw57Kd7s_1iuEkPEpPUtPgUls9XE38ManDhzqn2IVk35zlgiM1Oxrm
 hmgVt998PZ4gcPv1vyCZweYpq_FaszkLvw5CrfZj4AwRrFxBT9.w8tGhWQl4l3Iio1T1MkHi7B2i
 DwF8SDZiT5ykILFT0WvbNgylG3rkYYHJFgCjlSWkhmJ3mCkjHjFxj_EdBgseNkYSctz_7OsxRjpa
 0NfdS4b4mkECVl0jSROS1VbQSyYZH1hcnJn9sFavMk1TfvrRiALafj6s5cyD2b_rFHYpohZH6Fij
 mSehNR_fiAtkBnBoHjATiZk2qbpogjqlAoPsYBqQZ2j1X3PbfWAEYigjTdUWvwu7XS8dvQyYGB_4
 5kS.ZXOofbZxOS9VykSmO.S8FB6he1lfXmUdzzjh8glUBbBapOU1pgVmM2_1g5g3pSnXitNZke1Y
 hiD9ZxJPy60XCexdQEH3dqhhm4Mx_ug0Tj_f.3ImHAZ_AjyZCxBpmgMdtX7o0ERZwmfniqZmkg4P
 ZWQ9J9ZP10VKY4xitUC4OJS80IYYukkgrs_jlXqLq4TpFqbstMDgxycbJoQm7TY.l0MPxQSc.ASl
 0Gn0PRIRJGxU0x.xElV.WrdqTUcDApBPPyLMLFBFxfY.apOtXe74Kqg11xGICwT8DgnPMhUn9inO
 mVIy3v_ZsPzBwEVc9sOHn8jrNTiAcXB7fcGB.QH42MqaTPUv3y_rW0B.JumTcFf3HitOUVEXx.TH
 XSi9Hw8Vsv3tMNd_UMjkcRNX8mx6XdKC2q494PJvpu5HLj0otWIFnr10G.4.wj5enUo.R9YQMyiD
 HFCBrdKFSdKozQC4roFJzDiPtZjr6bnHtHkHmav1i0VvEHicXvdP6X2GcFmeXyoK2fX4phIkVqGM
 NXA_2mHb_6dwc8q4BvaxG6AnBZfZW.gsrVpmwuhJbDpfcFOaqu0p9yY._XQBykm2kWvVBXKs31Jt
 eD5NCyQJdDy.Qkl1F6Y8U26HGtbcnyv4.YVT9576FMpL5y3UTbQrNxMNU4rMwYEcSD1HkTT2Im3F
 6CAJFfqnTtMK4dK5z4L80YIDM.iRzIzUD83j4wGz_N9MFJLtRjtzvZT_2rwWyjriJXgPaHHuOw1s
 ta6em5tAppgIlhr8Y1YVO5EdPv1DMxrSNf9R6yLad0.0G_Aixq2VeQefkS_FXht25a6h_SH6deut
 bVYwQQlNG18uNkzWW5N7.0FGwvLd7B7Xdf0bDrnAPhldlq.mr79nDoLd4F7LRNuY5k7RLuOVGk_R
 h4P3ClygokxKsH9FYR8YwBgTUQS85dYmQOWUwVFK8Iu5cvlMRZq8poVxRC3Iw2SwsYIEa2ErdBXQ
 ZNdg076NXKQ6AHe3V5OSCOyGxk.aFyk3Sj6_Ug8mmAy.0V0aITlvRKyhbInjerffXZKsfQN7.I12
 Y4a1N1iF7Lw5h83zN_fR9FDWZiUiug6kRH2VKavtC3bdNGcyOHU4GU.bXCeZXW7nY5HKsRUGw8yg
 xu4p1nMQfmni_oHpDTJoaRlzKapV5kDF_WhbOb4gGGUDFOOXZg.HKxDezOCLTX3Ghnxp4JYht5qK
 BvXoA.j6U2sxVkY4nPB8YmfnpwycMcxrXZ1pAXhPfR7_YP1mtCCvFpZFjca0PhLMleErZUKFmrgP
 kgY5vZpTrw1F6kHwwXTtCgjeQgH5lyohJN5YSu0wlFUTU7ZI4UKmMazfTPIlgvu1ArN71hH4UT9C
 HxadIw5DhLViy5bSFhP4BJs3bV438oUCXiJBjac03ewGYQX3TgfhdhBTu860AnDKTvPW7fGcDDav
 NWgOV4vpHxWJIvo2QMg--
X-Sonic-MF: <davidglanzman@yahoo.com>
X-Sonic-ID: d5fd1558-5a9d-4cb0-b2db-869be1c6d754
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Sep 2024 06:42:33 +0000
Date: Tue, 17 Sep 2024 05:31:40 +0000 (UTC)
From: David Glanzman <davidglanzman@yahoo.com>
Reply-To: David Glanzman <davidglanzman@yahoo.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Message-ID: <229243264.8919425.1726551100908@mail.yahoo.com>
Subject: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <229243264.8919425.1726551100908.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.22645 YMailNorrin


Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop

Signed-off-by: David Lawrence Glanzman <davidglanzman@yahoo.com>
---
=C2=A0sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
=C2=A01 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 06349bf0b658..ace6328e91e3 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -444,6 +444,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MATCH(D=
MI_BOARD_NAME, "8A3E"),
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .driver_data =3D &acp6x_card,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .matches =3D {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MATCH(DMI_=
BOARD_VENDOR, "HP"),
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MATCH(DMI_=
BOARD_NAME, "8A7F"),
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .driver_data =3D &acp6x_card,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .matches =3D {
--
2.43.0
