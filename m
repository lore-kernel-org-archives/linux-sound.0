Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092731D699
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709937355; cv=none; b=jGq8yPx/KcliRby9xtc3vW+Vjwab+eQcn6/eg0yQpcL6rF95gGxhITPSx038fpZxDRg3ClA0O7Kv76oUqNSq1RyQVuMhyy4vAVsV+QxXSLV5ILhsJDPTY07OTgv/+9XGFHMHznTeE+/hZ5edHmpX3lKn05DfEpjHxZD9KsA/PKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709937355; c=relaxed/simple;
	bh=ONjv0VtUftGGTVaaqppbSyYYxndj4Wvui5PdudKSKsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReIVOAGT8AEBWZG1WuJQSee+GrFdOivBr6KyvmEZG6TJudB9TU2ZeDT3jmAav1sp91CANEKiLDFhxomZi9/4XlM2eCIc3Uwb+DT06/tCo776t14AtoPYiez8b86XFEUTM4L94/0caQii2t0pAhQpJuUYEwg9mO5QzVMmXFSttw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+GWC8yj; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+GWC8yj"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d33986dbc0so27484301fa.2
        for <linux-sound@vger.kernel.org>; Fri, 08 Mar 2024 14:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709937352; x=1710542152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+osjGBHTR09d/MwYxvJc9Om61QsxQtq+K9ltwKLvAc=;
        b=a+GWC8yjXtyq/0ABRc+qE3WDgBSA4qGdSajCyry0+Ic3BJPIPg/4Pc80YTjDg0RI3F
         Xx8OFJ+BdP1Tk1zsg3XNZJoN2oHDVon3UI2eVYg/OFV2GkpT4c8ap/vI5BLGxznLj+l9
         V7GU/Uhx5PNh+ImEjhYFdTLaHPr+uvmyuCnrRXFKYOw+75McgUFDbwnhTocQHruJVvxY
         ZSO8ZQsgFiQkXGeaBVJYcLHZ72Wi7VmVySy5Ln+vEZk6lMAqtUl8vRbmYTuPdkNrCLO3
         CcBJnW5FpuUcmllA34Z7pUfndCsb8pGH47eF5oGOHysS3U3DLXYbUDhj4RGQ46C7ZP2t
         cHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709937352; x=1710542152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+osjGBHTR09d/MwYxvJc9Om61QsxQtq+K9ltwKLvAc=;
        b=t3e3U5fhNRIFVFDDsJEccmn1uT3BxG7WnrtjPlQ0OMqqu94n1294b/fcppcmD87wvW
         QJR4gQcPyCqvIa17EF/WNuJr48vIMoi7SEsWCHTL4hX6TTNUKJYEa6VsJi4qM5HTD4RI
         1EjZMbOc4ZDw5SM4p+p8pyN/JbkxMFf2cJhhp6jWu+iD92sMRTFwUTdlyqrAg2fePFk7
         HgXLEA7XyPicmwqpWDlvqHX53yKUib9WuHc03+sxs63X17QErWGz5WMglYib6XqXw9G2
         kqWvO7Z6/+vw2vjeyXKDEMamcpBz/EhKhBWEb8sTE/bAJSt2T1MhhD/QWVWe0L4i7ixv
         n6eA==
X-Forwarded-Encrypted: i=1; AJvYcCWw5MDYA8FfCYg8LmTSN6mXg3+0ePfo/HSjXv85nvSf/boN+4au6RT48pLpYXlbLr32+EYvV270q22sAldEEF5rECHS4H3o70Vh8eY=
X-Gm-Message-State: AOJu0Yxv4ZeatuTrlLVGslr6OiNATdTzGuwqOZE0a7ykGhtrEvwwoh85
	5fOs1OSLo64Ua2Z7VO3IL/WdRto/ASJM6ahqwcZ5J/sqZ5sWyWzquw7GFnSbFN4KM2QIWzuDvAu
	f7tMYHa+IUfrGPZuFSLGspgjUg/0=
X-Google-Smtp-Source: AGHT+IFTCILwfXto0Mg+Fmlxx6jFy/jU9acKGcQjbmCoHCIpBnJ9WoOt3a8qRrKjY6DtagOCjq2lSdp4C5WpYX9i4+c=
X-Received: by 2002:a05:651c:4c8:b0:2d3:7e8e:de23 with SMTP id
 e8-20020a05651c04c800b002d37e8ede23mr374734lji.23.1709937352038; Fri, 08 Mar
 2024 14:35:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALijGzn7GL_tmdGZXy-tTGCgpT4bwLW2+QU1QBseMRQwjPhbtw@mail.gmail.com>
 <5eb9f2b5-62ef-442d-b93f-ea6b0d85eac3@sirena.org.uk>
In-Reply-To: <5eb9f2b5-62ef-442d-b93f-ea6b0d85eac3@sirena.org.uk>
From: M Cooley <m.cooley.198@gmail.com>
Date: Fri, 8 Mar 2024 17:35:40 -0500
Message-ID: <CALijGznExWW4fujNWwMzmn_K=wo96sGzV_2VkT7NjvEUdkg7Gw@mail.gmail.com>
Subject: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> It's a patch whatever the reason for it - basically your email looks
> like it got almost everything right (assuming git am likes it), you just
> need to delete the process question above from the changelog and add a
> Signed-off-by as covered in submitting-patches.rst.  As that covers
> there's legal stuff with the signoff which means I shouldn't take a
> patch without it.

The ASUS M7600RE (Vivobook Pro 16X OLED) needs a quirks-table entry for the
internal microphone to function properly.

Signed-off-by: Mitch Cooley <m.cooley.198@gmail.com>
---
diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index abb9589b8477..af90da8646ba 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
                        DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
                }
        },
+ {
+         .driver_data =3D &acp6x_card,
+         .matches =3D {
+                 DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+                 DMI_MATCH(DMI_PRODUCT_NAME, "M7600RE"),
+         }
+ },
        {
                .driver_data =3D &acp6x_card,
                .matches =3D {
--
