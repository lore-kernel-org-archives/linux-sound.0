Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B08635A
	for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124227; cv=none; b=IRFnLDE/VqFzU+qXuQVZfK5IK+brFYEf1FbpzJJJyefVkpRtiwtAhr+mpw9c4g/MSyfEU3yRG2l6Ggt9L4T54VVIuMGvjpRvjA/9vUpO6H90ALGIDjOGKmSC56E0thEY7CqCnG6dK3AkuL026oc59wh9CLemUHIdPnxXq0iltH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124227; c=relaxed/simple;
	bh=3ZoBcQYWnpivOk8DNzonzHODyr/xCMs+CiCMktCbRQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCNJv/sis254UM3v67oitOonT9iht7PriePD5CDPReaV3q5GK6fBXiTqx0a38cSeWiq3wCNGGDTUsekHSxskKdxevkxT4cYH0u7veRWyJrODwbIOy1x0MtHqJrm/K2U5gMmk4KeppcBAAWosDnKXkFtPi4KSJYV2GTSs8H1zNcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xOyqehja; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xOyqehja"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so6675a12.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 06:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737124224; x=1737729024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE1gz38tm9i8dqhh/IVwPPWFXbRGt8z4lP7xQ93NBNg=;
        b=xOyqehjaRVZqipUKWewrBZ0CS/fKdfS2jtMYsOkfSRgmgncD4GrhxUOgJ7IMkYHEJd
         CgXUzGViWD2VCKQFAabvZxxp/7IO+3hXXJ6sibHeL93+FNpRihT18qB7sGLTxt2ayAIP
         Gf56deSQxjda2eMcQKogbfWNisZyHYAIKVD9DqEBlJbpnprfrESaF6BZJj523TGfParB
         D/W9xtyXzxGRFOO4SIze1TLeRSDLfLDSu/3qFLOT6jxd5jFloEs3xY+DKvF0hhRAsSxT
         n0jwkSfmQhJW/I2KjzeROD0o80LUlKw6CjJRJ2A7oPZLjUc3JAeW2mDgs+j66xXWfds1
         DP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737124224; x=1737729024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nE1gz38tm9i8dqhh/IVwPPWFXbRGt8z4lP7xQ93NBNg=;
        b=KiWpxBU6Xzp9PxRuQdeS9sJ8GNCeskzT2vV7AljegwJ9SH4yty49PWoTmLgEe/k9k+
         +1PY59Ip2yldqq9H3w08kPh357yWL2o+3B63pJ1vDRBdaa6hI15CAvVkzxv3QpLYfdQM
         qpDztBQyjeqpDo5spBbQqcG44wfzsU1soTqQkjP/FgxjEmO94sbvv8gaL0LlF0ZWUkF+
         TR8JGFbuvLXLF4WsWXvCFvrDc5yy/oQo/FqVsQvYcixvfSUYAA1uxFkYBtBsVo5xVsQ4
         zZwBbOKhzeKn4RJ1Ux6smc6BXOLiITaB/Y3/wSc8DRdlFbeja+yUpEzYjdEnOLbFCxGs
         4EUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMmlxOrB250fHkOPslykG8sHhF53AXQrF+YY39w1wTeYUBYnjR6f2/01fb9ey4YY8hTsmUbzCY2LY3qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJyb95cI3B+fBPWPZRAe5eZyRXevquUMO1bm2bH3jEwKWG+lY
	HZMNc/sxQ/l1JIUYio+7FlMpqsyO2hfH4qh2+JHjIrC9RGNXj69QzddAQ0h1Zu5R3hKWPbB2Y/6
	NAXSFlw8UMBL8iaH1cGRB8vuuW45k3NewiiOw
X-Gm-Gg: ASbGncumweGZJq+d3K2izeG8XN+jVHMH6L+hQMWVUgipO2NBLKUrMphoYv3ZBqlj5Vv
	HtPtaohf5lohUz+AZFHcmS3aQnql9e3uSdLt8g7wU8lvB1YSoGlZPqnX7eRYgdXJcfHOY
X-Google-Smtp-Source: AGHT+IEpOPNAq7Dfi91eoTHtxZ+VRJsH4a7VPNmXj64ZKtZaVBEtSES/DS3H44APONyTeXkbpevgU1cBa1zTsZ/IEJQ=
X-Received: by 2002:aa7:d586:0:b0:5d0:d935:457b with SMTP id
 4fb4d7f45d1cf-5db770e0b5cmr107293a12.0.1737124223604; Fri, 17 Jan 2025
 06:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
 <20250116135358.2335615-6-guanyulin@google.com> <47efaf4a-8237-4030-8386-5e67a50c3030@rowland.harvard.edu>
In-Reply-To: <47efaf4a-8237-4030-8386-5e67a50c3030@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 17 Jan 2025 22:30:00 +0800
X-Gm-Features: AbW1kvYBGqBneN3Qh_esCRtWPuqLg1h_18om6-0Eg6rVJvff3d3pAVHlnFiycSw
Message-ID: <CAOuDEK1VvETzWeYjZzKLSoqU_BPwrAjRN039YuEFSivPw2X=Mw@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] usb: host: enable USB offload during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 11:06=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, Jan 16, 2025 at 01:50:17PM +0000, Guan-Yu Lin wrote:
>
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index 1bbf9592724f..6441742869ff 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> > @@ -1413,19 +1413,31 @@ static int usb_resume_interface(struct usb_devi=
ce *udev,
> >   */
> >  static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
> >  {
> > -     int                     status =3D 0;
> > -     int                     i =3D 0, n =3D 0;
> > -     struct usb_interface    *intf;
> > +     int                      status =3D 0;
> > +     int                      i =3D 0, n =3D 0;
> > +     bool                     offload =3D false;
> > +     struct usb_interface     *intf;
>
> Unnecessary whitespace change.  Please remove this from the patch.
>
> Alan Stern

Thanks for catching this, let me fix it in the next patch.

Regards,
Guan-Yu
