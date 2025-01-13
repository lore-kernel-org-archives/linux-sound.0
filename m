Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAD231CA3
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760033; cv=none; b=OxDwsan/djKfGZXB9uvFikhw9uY4bmcazcXkygOQv9TB0xdkSGou2kf/wLWNdzEG2MB9EBmEkWRsN+pvL+5hEBufm2F5PkTEIPSrm7MSVuFciF0ipEPqsgj5eLgCkoS8gHpHddYrDwYDSutVGPm23gZDkcc/l+wF1u6b9MMpi/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760033; c=relaxed/simple;
	bh=6y6FM5CdvmPb8+MfmKu/FmViiG57nRhmZfNvS1ah05g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMlr8jsGKWRvHR+BHFMSwCnQdAa93wFdvCfkYk1jG4XQw0v1E0rA67PeGFS4FuFG8pNBtt0La/75O4kV031YT3u2qiKvCLpcRR8hLyXu4hvQPtlXvw/mQzc3NZzfJZtmpOdn9HhvyVGge+98wzueN5B1b7XwxYtXAko+3A/Ay44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fVVyH5ax; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fVVyH5ax"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so5019a12.1
        for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736760030; x=1737364830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/4LCm6hqojn+qHFmCLAoYVzfOY4Op+5HV5rfgAUzJ4=;
        b=fVVyH5axlOObJOtkQUmfkzLgdukvVNA8VTlFvT+CT9ifzlx8zDnbS8m4RqB+asPmKK
         P8xTIARUp79jxeMX+kd/aIhRGl3ybwN6Ql4EiBELMNy4p348aEks+/8+DYGLOiwItZQo
         T/w0zZTIVYR5m6rSxTuIpR9U1jWoyQ2Q35Lnlc28RkBzWAzbQWYqDLm+Ml+JTmsuVN3B
         37MS5yM5e0yHEwGuwkibyOMr9cyfJmPrcAK0t+YZCtEm7va3MMmgTbvsq/EDxQLLonBn
         FygqVu5m1TTUwktMmdB67S4651APg6kWxmpXT5yWfjX9KnFf/8/nOmu6CzU6pyOFzIZX
         Bc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760030; x=1737364830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/4LCm6hqojn+qHFmCLAoYVzfOY4Op+5HV5rfgAUzJ4=;
        b=OyZ9zpR8asy4sMbomXm3tWygHua3t6qU/DGlZXaSdWy6W+c/Ib3nB+jSWv+cOtwOWS
         9OzvFwj5dMBP/ycxrK42HjRC1Gxa0Q89HxkUiTeP/CCSEmtXx/9rVxsAmlreQOihbN2V
         ftL1jbfmorom0LIsCf/rSGnO26p98FcKMorhPmXPbKhr8lEAzEG1hM1qjDm7IEcH+gbI
         gStcK7Z1CLanss5zR1ja4Z1WVRO+W3tUZWolV0zxasAHOZ5ybqrOX8KATTyq+IfOy6HJ
         4666CcFOBSqaVV0p0zGaTzENuoo0GVhUQ2glvAq8Sq9lKWfS7iRcIMEtAPb7B817PO5N
         ZTWw==
X-Forwarded-Encrypted: i=1; AJvYcCUZTJVqKLIdjC33gI1ZREj7ho0GEVrbQ/fG+0uFG9Ebd02rDkbyuDBK1oStn4mQnyroiYoGfU6sOrudlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhE0N1nw8Ihg45m27jQhLi85aE0oZaQhd010hXpRmjzHmUcth5
	kAWVGexXYVCMtx8OhIzK9YS/uprUKL++uYMn5sOGXPoaP/vov47IrKURLQEUAp2Pylqeu8yaO3R
	qIoyg/MQdp9OcwAK05Wo+zlsgBxjeDjaGukXi
X-Gm-Gg: ASbGncsaDJfxOnT+kxVrgHxawGQH1tfs1LHw3wD+oSJwaJl5pbf1a6Gvdj07yCm+c0R
	9b7XBsLXOxyLK/w9CyMjp5L54FukUQ0w6bwyCYS0W
X-Google-Smtp-Source: AGHT+IEg7B6sa8kO1AH0hpeIMDR/48l+AHxj6bO46AJ5YTcTQK2k/+3G1LFqJhUr4ugU56tEt6QzsGNIrGSfT6tXGhw=
X-Received: by 2002:aa7:cf19:0:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5d9a0cc9fedmr201810a12.1.1736760029676; Mon, 13 Jan 2025
 01:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
 <20250109035605.1486717-4-guanyulin@google.com> <69a4ae28-dbdc-48eb-b77b-147f58739913@rowland.harvard.edu>
In-Reply-To: <69a4ae28-dbdc-48eb-b77b-147f58739913@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Mon, 13 Jan 2025 17:19:00 +0800
X-Gm-Features: AbW1kvYuELATJIqQAKumBgqZEHTHWxZH3hcbiwOD3x1ACqQRB1c4AQ4z2kZ05z4
Message-ID: <CAOuDEK07M3Zj6uYZ0CeygSn-5tXHoueL5JQc2xZV5jywJR5GAA@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] usb: add apis for offload usage tracking
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:04=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Jan 09, 2025 at 03:55:07AM +0000, Guan-Yu Lin wrote:
> > +     /*
> > +      * offload_usage could only be modified when the device is active=
, since
> > +      * it will alter the suspend flow of the device.
> > +      */
> > +     ret =3D pm_runtime_get_sync(&udev->dev);
>
> Note that this function will increment the runtime PM reference count
> even if it returns an error.  You probably want to call
> pm_runtime_resume_and_get() instead.  Likewise in usb_offload_put().
>

Thanks for the heads up! Let me address this in the next patch.

Regards,
Guan-Yu
