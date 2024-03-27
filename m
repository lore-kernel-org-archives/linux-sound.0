Received: from au-smtp-delivery-130.mimecast.com (au-smtp-delivery-130.mimecast.com [103.96.23.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CB12FF7E
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.96.23.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556042; cv=none; b=QKRNd+dTz2GpoGgLOe9rJTjjETzAsYJCsb+UMT9kwz6IYOyt/ZsWbqTh1kiLsvtX3V+kevXPp0UxNQLGLcZxBU/IRRbtLWpKbtVBK6LYkQb1OHXIo8Au076JUNWoRT+Y4qxDIMo6MheZEVSJYwp7Wa+opMJoIyO7VrSTTw2p9uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556042; c=relaxed/simple;
	bh=/y/wXYkvZUwQ6aZOHOVkwbYEtR4a3rReP6uO5F9VV0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXxinlTxm13lN7DlIltIFziLL3ag4SeIHTj00FXduxr8yxUOPQeMJfYVqaKzSXgxvcGu7lCqvOnBBI0u22cSiQTKOXKaL6VfjMnQtngnc7l5FhV97YJB2M2GbdUMoPzyTpZxrP+c7gCgRZYNNbzLVFvkddYH/TRiZH2thRPG/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.unimelb.edu.au; spf=pass smtp.mailfrom=student.unimelb.edu.au; dkim=pass (1024-bit key) header.d=student.unimelb.edu.au header.i=@student.unimelb.edu.au header.b=RiY7eNmB; arc=none smtp.client-ip=103.96.23.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.unimelb.edu.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.unimelb.edu.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=student.unimelb.edu.au header.i=@student.unimelb.edu.au header.b="RiY7eNmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.unimelb.edu.au;
	s=mimecast20230627; t=1711556036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcfPdMWg8b9kMxsSpO32LzhpUMnzHJ+N3SuGFzHCbCQ=;
	b=RiY7eNmBY3pWvSykENkX0U3orD1CtSTSmb6y8D1r9JGD31J0ZxEPuTQdajXdIFWhD0TsNB
	sL4TapgaGAzX/HFpXPX8kPZ4qxJnsJqiwxsiZZM2WF1DqPVMsea4aTBmXy1NQ8qNoDy561
	8yttK8OVDiIkflMz3CGqH3SH9gDfCjk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 au-mta-44-HdXwsh-PMrO7AdMjvCi8pQ-1; Thu, 28 Mar 2024 03:13:55 +1100
X-MC-Unique: HdXwsh-PMrO7AdMjvCi8pQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29df3d9c644so26963a91.1
        for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 09:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711556033; x=1712160833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcfPdMWg8b9kMxsSpO32LzhpUMnzHJ+N3SuGFzHCbCQ=;
        b=Hv+cIcSqjYKjdJLrqOJEoso7rbp11/ueP4TbT0BejAe4hQP1MzEOvdm2cQZ5k/0Gcj
         A3kghEdeTUrxblQKdQVsvuEW30Z8dYvMTv/0dEazVmbnRcAYhDf0i04VAUEDnEHZIXW8
         OtSFKOtcXaTEBxKEdn1cidnfWuiljMhNQlXLppc69gSmgcZ4xpkgVkJJnDXKGSu2+1J3
         sfYpkBk5q1RQMlFiP8A86H9Sk2LSWlv1n6jEslMD/EX14JCcxz8NpRDel+NcFEDbBg7a
         UNB6y2I61LMn8QBOTOKHLS+xaT6+gfY7HuaKwvW/216Zodna+qfZg8UPvLbQV3GenWE5
         6pWA==
X-Gm-Message-State: AOJu0Yy/p3t4WCKMRMNPVzOMhtNZlK0gOcc9bGNqsHGIv6nNY6oX5MP+
	IhXtE+Kfwm3Qny7eNOj5SUzB370iCOcNLOxZn8k1Ls8wx9IexajQ4L2zIQBqPKdCvkFSuptVT66
	HlqLKOhqzp4DxUu0rWYJbXPd8PN5Qvy6RF2FIjUVcW35031qmYfLYg7KTVOf1/i4RQdQ24pYMZp
	x3Bvnii2j5luxZsKzXb4NE2usRJLz+6QKe5Gq1ryR8huhzlYzuRrPeGlEztzqPHm0Y1o4ttjVzK
	4wLX+9VAxIGMozM2y5RGA8Z1SznrN0bdf7VW3dZUgHd8oEg57Nl
X-Received: by 2002:a17:90a:7e8b:b0:29c:775c:14f with SMTP id j11-20020a17090a7e8b00b0029c775c014fmr108294pjl.19.1711556033281;
        Wed, 27 Mar 2024 09:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESOvJp/wWk3xUb0CtSkJnC2IDbQggJ34vB3frVNOXgdyIdspeQITDFCqnx0532T6tk/nSi4MJHcHnZvosrh3U=
X-Received: by 2002:a17:90a:7e8b:b0:29c:775c:14f with SMTP id
 j11-20020a17090a7e8b00b0029c775c014fmr108269pjl.19.1711556032788; Wed, 27 Mar
 2024 09:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE1pm7Pn3p9-9N4CDDL6mnS2KBw62FYypvBVKPQzoS6_RSLJOQ@mail.gmail.com>
 <39f47d0d-337e-41f3-b110-2f6326f6f4ae@sirena.org.uk> <CAE1pm7OFXv9fC+Oxh3nWpxQNQCuNLZUGpmfY+aG+8HGhy4GFiA@mail.gmail.com>
 <01a85207-990f-4fb3-8852-a61094664815@sirena.org.uk>
In-Reply-To: <01a85207-990f-4fb3-8852-a61094664815@sirena.org.uk>
From: Sukai Huang <sukaih@student.unimelb.edu.au>
Date: Thu, 28 Mar 2024 03:13:41 +1100
Message-ID: <CAE1pm7P=67MXD5zsPTean390zQrmeFTk+ju+SeuQVr31VX+MrA@mail.gmail.com>
Subject: Re: Request to Add DMI Quirk for Lenovo IdeaPad Pro 5 16AHP9
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: student.unimelb.edu.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From bfe53271fce81b87b8a0ff63c94f05
dba2f39d43 Mon Sep 17 00:00:00 2001
Date: Wed, 27 Mar 2024 10:23:23 +1100
Subject: Request to ASoC: amd: yc: Fix non-functional mic on Lenovo 83D5

Like many other models, the Lenovo 83D5 (IdeaPad Pro 5 16AHP9) needs a
quirk entry for the internal microphone to function. Once added, DMIC
capture dmic-hifi-0 device can be found by `arecord -l`

Signed-off-by: Sukai Huang <sukaih@student.unimelb.edu.au>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 69c68d8e7a6b..a3fd83494e5a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -269,6 +269,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
  DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
  }
  },
+ {
+ .driver_data =3D &acp6x_card,
+ .matches =3D {
+ DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+ DMI_MATCH(DMI_PRODUCT_NAME, "83D5"),
+ }
+ },
  {
  .driver_data =3D &acp6x_card,
  .matches =3D {
--

On Thu, Mar 28, 2024 at 1:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 27, 2024 at 10:48:16AM +1100, Sukai Huang wrote:
> > From bfe53271fce81b87b8a0ff63c94f05dba2f39d43 Mon Sep 17 00:00:00 2001
> > Date: Wed, 27 Mar 2024 10:23:23 +1100
> > Subject: Request to ASoC: amd: yc: Fix non-functional mic on Lenovo 83D=
5
> >
> > Like many other models, the Lenovo 83D5 (IdeaPad Pro 5 16AHP9) needs a
> > quirk entry for the internal microphone to function. Once added, DMIC
> > capture dmic-hifi-0 device can be found by `arecord -l`
> >
> > Reported by: Sukai Huang <sukaih@student.unimelb.edu.au>
> > ---
>
> Sorry, for licensing reasons you need to add a Signed-off-by here (see
> submitting-patches.rst for an explanation of what that's about).

