Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B371F0995
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758899435; cv=none; b=Quex5u6rlVsXzZRUc46o4ItJh1/VBUJuVXGY5XIMAjO9OvYkJfKTy8V9jp39KBF/0uPIzWozmpDhKneCm6xIlMe+Td8d639O8EOt1tz4m979jra6rByQw4NxhtHZlAEeiuRPmgFHJLHgvYHrVB+pQMcbq2SRb71AqDMfU583Lec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758899435; c=relaxed/simple;
	bh=wpGV2gJsJ1WEc/5syG26CALS6HQvJdzFYAQDuVBvwOw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=oYcs2NwEtYAYFXouWpgh4G+Q7caO/VTatB5ShIVXl/n3Ni7nVSKmJQNCpDgqdtBSKfiqv4U4vdrjhvoi5sEctxegGRo8Hjfk0pAtH3WZZOFuAnpFALo3fq97Ms2iPKoqW/Ejf+W8poWfYRw6iBjcTe63zxREpVZ0aDv0IZ4l1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3Mo96JE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3Mo96JE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e317bc647so15572155e9.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758899432; x=1759504232; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8pTkw/bkLPpefb2q29FPsOuNRVWJa66W7CQDDkpLXc=;
        b=S3Mo96JEH9vmSVgfKAxVsP61fT2AU1Q8TuCDtIYM8VgWPX9GMGguStoklVY7qWbNvo
         84ZUb/1wcPXgBD7DnOm0xRMoygnJ75DNaLJ1928maSr52W1V7HaIunzm/nmWMU7wijUz
         eyPkN82O2CWIP4NacRFg5iZK1Zrwe4MKDzGmqZ1uueubboWfuy4TuJEExJvL6B8y5rGn
         zkXXWHNTqG7FVDraAxvbhRAoe988l38kKC+mjqvlMXgVZKz6d58RtE2B+2/tggxhYaHY
         eIyl8J5673zSGmldnYmreXAzaxwxMe3g7EdnzooTtcKFiTRig20KJolIDIuezxytTaKp
         qh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758899432; x=1759504232;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt:date:cc
         :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j8pTkw/bkLPpefb2q29FPsOuNRVWJa66W7CQDDkpLXc=;
        b=QhZKPa8Y6vVTlXle9yPtX53A/D0SNeYtzMgc9xqBrzZgCwWTEyPRwhwEnKsXcwFszx
         SKWj2QSHEW0kY7Z0FpJRj+asPckRNgyXURPwWe0oJLZlVVRRZd7c2s9pFQw3y6D9zifb
         BoPvjbT9Y+EH6dxSHTGg7Fuz98Z6yr4EQ+4xG4ZLuBPm3qC0UjDM09ikPgtNxuIrEHIM
         wWiAC8CJUNvwJxsG4oWLVV2HwkUBjAbf94wOuCvqdsKDOEkEVVzgqFsxDK/chUye0gTQ
         x6H5bo3LV7ROu2fFWeqp2fZ4DmD1hdzUq3ZAlog3Z6foZoGVEGo0O+3QKHHf2JoNBXrT
         s39Q==
X-Gm-Message-State: AOJu0YxGl2j4cBhM1vVDRfy+HCCCa7JTGonP+GTu3lyJ+CFBfVNOY1ge
	ntyjWKrRSa+zzSAmUczJQ9iSfMCq7cmCjl5UwAhYdrSxrmlmQYE9GNfeJopJ4WFD
X-Gm-Gg: ASbGnct9f1u/WMmUW594g0ulf/WrzB4VU0gCmzxd0H1zFDcPc5Iby6rVYud+dummgch
	fKrWzM2oAA5dm0gcgX4MUIcygGIbd0EP8XJElBfTmyPN0MzAXwdKM6zEwD9pJqCX4qOoBJ4F6dw
	N93TVjVNWGT41uxVGyEA8eb4dMC61ja7DiE3NxiKzqfiUCLlDbpKgLJrzqjkWac1JNm/o4JJEoP
	fvyIU3trtCOtLs8mTE4e2pQfkX0qEcZ2gYc+h5dEvf6RVRRWbIBXjDR9IzpKFE/nZykBM/ITXtq
	ub3cA9rrErRYPBn7U9tt+OBJaf1EGbtbACq///v7P7k8qjGLc07TGHVkpeREDugAwtVtOzdi4QE
	FzOhRCWnXE/0uSldJR5JAkYgpE8iuaxQ9PYIs6JKUIjrYXEYtrsVwxK/fgIhNbGHc9/shKBEigB
	EMBk4wvfo6s6o=
X-Google-Smtp-Source: AGHT+IE/UBE7p41wpOKLlfjF00ixFo194P01kZkhZBHkvBWcUo8NOBksU50m+mqZx06zuhlN/J2YVw==
X-Received: by 2002:a05:6000:2dc9:b0:3eb:c276:a362 with SMTP id ffacd0b85a97d-40e3d69c099mr6761556f8f.0.1758899431779;
        Fri, 26 Sep 2025 08:10:31 -0700 (PDT)
Received: from ?IPv6:2001:738:80e:b5f3:51ba:c885:8ac2:fd5d? ([2001:738:80e:b5f3:51ba:c885:8ac2:fd5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9c32734sm7583734f8f.25.2025.09.26.08.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:10:31 -0700 (PDT)
Message-ID: <ffef657cce57b7bce005b99f9b14dc81c9ae4535.camel@gmail.com>
Subject: ASoC: sun4i-codec: Missing snd_soc_component_driver names causing
 NULL pointer dereference
From: =?ISO-8859-1?Q?Baltaz=E1r?= Radics <baltazar.radics@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 26 Sep 2025 17:10:30 +0200
Autocrypt: addr=baltazar.radics@gmail.com; prefer-encrypt=mutual;
 keydata=mDMEZnVTDhYJKwYBBAHaRw8BAQdAtpC9qT14DuOjPzGgdexbNQZyEnLt6DjuzRWlHijeR
 9O0OUJhbHRhesOhciBSYWRpY3MgKHNpbmNlIDIwMjQpIDxiYWx0YXphci5yYWRpY3NAZ21haWwuY2
 9tPoiWBBMWCgA+AhsDBQkDwmcAAheAFiEEawqK7sHYKkvA+pEbc5h6JDBgwKQFAmZ1dZYECwkIBwY
 VCgkICwIFFgIDAQACHgUACgkQc5h6JDBgwKTyJwD/ag4A5WYQACsRblfo12eV5Fwq1GGbCmqBcwpQ
 Zkyr2DABALZOBJAUuc3SqO6cgya71DsUu2ODfMf/n3PFXG7jopQK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

I ran into an issue where the kernel would panic depending on sun4i-
codec vs sun8i-codec-analog driver load order. (If both are compiled-
in, the default order does reproduce the crash.)If sun4i-codec was
loaded before its analog component, snd_soc_register_card would return
-EPROBE_DEFER. During cleanup snd_soc_unregister_component_by_driver
tries to find components by driver name leading to the following oops:

[    0.841199] 8<--- cut here ---
[    0.844315] Unable to handle kernel NULL pointer dereference at virtual =
address 00000000 when read
[    0.853268] [00000000] *pgd=3D00000000
[    0.856885] Internal error: Oops: 5 [#1] SMP ARM
[    0.861507] Modules linked in:
[    0.864569] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.5 #1 N=
ONE=20
[    0.871617] Hardware name: Allwinner sun8i Family
[    0.876316] PC is at strcmp+0x0/0x34
[    0.879911] LR is at snd_soc_lookup_component_nolocked+0x64/0xa4
[    0.885923] pc : [<c08e8824>]    lr : [<c075679c>]    psr: 00000013
[    0.892184] sp : e0821de0  ip : 00000000  fp : c0c615e8
[    0.897404] r10: 00000006  r9 : c0c49854  r8 : 0000001b
[    0.902624] r7 : c0b04de8  r6 : c125b010  r5 : c0dde7e8  r4 : c1a95a40
[    0.909146] r3 : c09b1d50  r2 : 0000006e  r1 : c0b04de8  r0 : 00000000
[    0.915669] Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    0.922802] Control: 10c5387d  Table: 4000406a  DAC: 00000051
[    0.928541] Register r0 information: NULL pointer
[    0.933250] Register r1 information: non-slab/vmalloc memory
[    0.938908] Register r2 information: non-paged memory
[    0.943958] Register r3 information: non-slab/vmalloc memory
[    0.949615] Register r4 information: slab kmalloc-256 start c1a95a00 poi=
nter offset 64 size 256
[    0.958327] Register r5 information: non-slab/vmalloc memory
[    0.963984] Register r6 information: slab kmalloc-1k start c125b000 poin=
ter offset 16 size 1024
[    0.972693] Register r7 information: non-slab/vmalloc memory
[    0.978350] Register r8 information: non-paged memory
[    0.983400] Register r9 information: non-slab/vmalloc memory
[    0.989057] Register r10 information: non-paged memory
[    0.994193] Register r11 information: non-slab/vmalloc memory
[    0.999937] Register r12 information: NULL pointer
[    1.004726] Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
[    1.010730] Stack: (0xe0821de0 to 0xe0822000)
[    1.015091] 1de0: c0b04de8 c125b010 c125b010 e0821e18 0000001b c0758f20 =
c1a95c0c c125b010
[    1.023264] 1e00: c125b010 c076c86c c1a9bc00 c1a9bc80 c125b010 c058804c =
c112b780 c1a95d00
[    1.031436] 1e20: 00000007 75b58edd c125b010 00000205 c0ddec6c 00000000 =
c1a9b3b8 c05821b0
[    1.039608] 1e40: c125b010 c0582960 c125b010 c0ddec6c c125b010 00000000 =
c1a9b3b8 c0582a90
[    1.047781] 1e60: 60000013 c0c49854 c0e25818 c0ddec6c c125b010 00000000 =
c1a9b3b8 c0582c74
[    1.055953] 1e80: c125b010 c0ddec6c c125b054 c1016000 c1a9b3b8 c0582eec =
00000000 c0ddec6c
[    1.064126] 1ea0: c0582e5c c0580950 c1016000 c1016058 c10f7234 75b58edd =
c1016000 c0ddec6c
[    1.072298] 1ec0: c1a9b380 00000000 c1016000 c0581b74 c0b0534c 00000000 =
c0ddec6c c1050000
[    1.080471] 1ee0: 00000000 c0deb000 c0deb000 c0583bf8 c0c2ddd8 c1050000 =
00000000 c010e26c
[    1.088643] 1f00: 000004bf 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    1.096814] 1f20: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    1.104986] 1f40: 00000000 00000000 00000000 75b58edd c11a6200 000000f3 =
c11a6200 c0c49834
[    1.113158] 1f60: c0deb000 c0b14140 c0c49854 c0c01264 00000006 00000006 =
00000000 c0c004d0
[    1.121331] 1f80: c08f37a8 c0d04e80 c08f37a8 00000000 00000000 00000000 =
00000000 00000000
[    1.129503] 1fa0: 00000000 c08f37c4 00000000 c010014c 00000000 00000000 =
00000000 00000000
[    1.137674] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    1.145846] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
00000000 00000000
[    1.154014] Call trace:=20
[    1.154030]  strcmp from snd_soc_lookup_component_nolocked+0x64/0xa4
[    1.162926]  snd_soc_lookup_component_nolocked from snd_soc_unregister_c=
omponent_by_driver+0x2c/0x44
[    1.172065]  snd_soc_unregister_component_by_driver from snd_dmaengine_p=
cm_unregister+0x28/0x64
[    1.180773]  snd_dmaengine_pcm_unregister from devres_release_all+0x98/0=
xfc
[    1.187749]  devres_release_all from device_unbind_cleanup+0xc/0x60
[    1.194028]  device_unbind_cleanup from really_probe+0x220/0x2c8
[    1.200046]  really_probe from __driver_probe_device+0x88/0x1a0
[    1.205977]  __driver_probe_device from driver_probe_device+0x30/0x110
[    1.212515]  driver_probe_device from __driver_attach+0x90/0x178
[    1.218533]  __driver_attach from bus_for_each_dev+0x7c/0xcc
[    1.224203]  bus_for_each_dev from bus_add_driver+0xcc/0x1ec
[    1.229871]  bus_add_driver from driver_register+0x80/0x11c
[    1.235457]  driver_register from do_one_initcall+0x58/0x23c
[    1.241134]  do_one_initcall from kernel_init_freeable+0x1dc/0x238
[    1.247324]  kernel_init_freeable from kernel_init+0x1c/0x12c
[    1.253079]  kernel_init from ret_from_fork+0x14/0x28
[    1.258137] Exception stack(0xe0821fb0 to 0xe0821ff8)
[    1.263187] 1fa0:                                     00000000 00000000 =
00000000 00000000
[    1.271359] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    1.279530] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    1.286145] Code: e5e32001 e3520000 1afffffb e12fff1e (e4d03001)=20
[    1.292290] ---[ end trace 0000000000000000 ]---

The specific hardware in my case is a FriendlyARM NanoPi Duo2. Note
that the current device tree has the relevant node disabled, so I'm
running with the following patch applied:

---
arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts b/arch/ar=
m/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
index 2b0566d4b386..6301b1a78301 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
@@ -137,6 +137,14 @@ &reg_usb0_vbus {
 	status =3D "okay";
 };
=20
+&codec {
+	status =3D "okay";
+	allwinner,audio-routing =3D
+	       "Line Out", "LINEOUT",
+	       "MIC1", "Mic",
+	       "Mic", "MBIAS";
+};
+
 &uart0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&uart0_pa_pins>;
--


I'm not sure if it's the correct solution, but setting the names of
these snd_soc_component_driver instances does seem to fix my issue:

---
 sound/soc/sunxi/sun4i-codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 93733ff2e32a..f00537f7f97d 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -959,6 +959,7 @@ static const struct snd_soc_dapm_route sun4i_codec_code=
c_dapm_routes[] =3D {
 };
=20
 static const struct snd_soc_component_driver sun4i_codec_codec =3D {
+	.name			=3D "sun4i-codec-codec",
 	.controls		=3D sun4i_codec_controls,
 	.num_controls		=3D ARRAY_SIZE(sun4i_codec_controls),
 	.dapm_widgets		=3D sun4i_codec_codec_dapm_widgets,
@@ -971,6 +972,7 @@ static const struct snd_soc_component_driver sun4i_code=
c_codec =3D {
 };
=20
 static const struct snd_soc_component_driver sun7i_codec_codec =3D {
+	.name			=3D "sun7i-codec-codec",
 	.controls		=3D sun7i_codec_controls,
 	.num_controls		=3D ARRAY_SIZE(sun7i_codec_controls),
 	.dapm_widgets		=3D sun4i_codec_codec_dapm_widgets,
@@ -1278,6 +1280,7 @@ static const struct snd_soc_dapm_route sun6i_codec_co=
dec_dapm_routes[] =3D {
 };
=20
 static const struct snd_soc_component_driver sun6i_codec_codec =3D {
+	.name			=3D "sun6i-codec-codec",
 	.controls		=3D sun6i_codec_codec_widgets,
 	.num_controls		=3D ARRAY_SIZE(sun6i_codec_codec_widgets),
 	.dapm_widgets		=3D sun6i_codec_codec_dapm_widgets,
@@ -1307,6 +1310,7 @@ static const struct snd_soc_dapm_widget sun8i_a23_cod=
ec_codec_widgets[] =3D {
 };
=20
 static const struct snd_soc_component_driver sun8i_a23_codec_codec =3D {
+	.name			=3D "sun8i-a23-codec-codec",
 	.controls		=3D sun8i_a23_codec_codec_controls,
 	.num_controls		=3D ARRAY_SIZE(sun8i_a23_codec_codec_controls),
 	.dapm_widgets		=3D sun8i_a23_codec_codec_widgets,
@@ -1527,6 +1531,7 @@ static const struct snd_soc_dapm_route suniv_codec_co=
dec_dapm_routes[] =3D {
 };
=20
 static const struct snd_soc_component_driver suniv_codec_codec =3D {
+	.name			=3D "suniv-codec-codec",
 	.controls		=3D suniv_codec_codec_widgets,
 	.num_controls		=3D ARRAY_SIZE(suniv_codec_codec_widgets),
 	.dapm_widgets		=3D suniv_codec_codec_dapm_widgets,
@@ -1952,6 +1957,7 @@ static const struct snd_soc_dapm_widget sun50i_h616_c=
odec_codec_widgets[] =3D {
 };
=20
 static const struct snd_soc_component_driver sun50i_h616_codec_codec =3D {
+	.name       =3D "sun50i-h616-codec-codec",
 	.controls   =3D sun50i_h616_codec_codec_controls,
 	.num_controls   =3D ARRAY_SIZE(sun50i_h616_codec_codec_controls),
 	.dapm_widgets   =3D sun50i_h616_codec_codec_widgets,
--=20
2.51.0
