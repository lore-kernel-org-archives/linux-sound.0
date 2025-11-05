Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47357331A5E
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355530; cv=none; b=tSyy0oStI7mY/m0DzAHbFwTlq3ezRxuzqmnE7dkcQk4LZCipiXX4kCFlDCT4hWUYRqjWRPZ0WY/VvfX3x98rRtQDjC6TY/CF6JanDYcGq1n8JfrFZvcQjBBglvQus/imF9mC1pFF4R08B9no1fqEngz845tpo0uMDcV07DuUbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355530; c=relaxed/simple;
	bh=aXYLUN6000x0NsONU2t3i/H9bdmZ2SlZPiI9xwpFxnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4d9LkkCEFyv+818z+R8ljbeF8glw7X4i0kWsTsqsMbkPKRSrbIh+z4BLbAJFagw6DS6bwf+KqNMJ8zHu+h+oRljaMwPPab8pKcfJGc3fWeB093YTABx6xg6oSv5PQAO7EkMV6ykL5n7uL64VclJaMKVdNaywM3ccVtf7E0QGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXd0cDEk; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXd0cDEk"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-65677b3aa4bso3139401eaf.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Nov 2025 07:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762355527; x=1762960327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXYLUN6000x0NsONU2t3i/H9bdmZ2SlZPiI9xwpFxnE=;
        b=FXd0cDEkNZFZ0zTj6OocZtHSZYFgwHkqxGFHPlPXzEmYCb2R7EyUJKcW0pVndIbmgV
         isDLRaSJpVcddQuwjHB8hVRdh+cv5+r8lx4d8BHTzTfMwRADt+72P8o0KH3ZxBURfbAv
         kfskYMad8xvxN9HUAWIqVrwTjHkSTuAmXO/GvdJnecbUp2+QTxEo6piyod83uiCDAGqj
         jNyK+8Y43dMpTGkFYxh5j1PPeuwCGF6oGWeFdLJCy+mdfLStwMBAWLCAqyXWH6P17ARs
         xkJoI2IiYtZwCt3ZcmOnfZlGP4AIIWm3cSeE6k2zOCiOx/6aypS97pYawiItj5HkWxs0
         qTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762355527; x=1762960327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXYLUN6000x0NsONU2t3i/H9bdmZ2SlZPiI9xwpFxnE=;
        b=JgmeHHcUlR9vMAFBP1CqzofAceCXAbOYFCbJ2jBO/Rapx1PrJ9dhz96MiWiYZcJPDK
         xWDk/hWL3lGHR+VhcypdYxFiYL8vAw3q8Mo0tETh0wS3PmGOlybfKXKQIcf0+hvM/gia
         R2RBpuHTkYQCg3NMwmyi3gXg8Lf5kFo/5pgOV662k1nuCjIA6yfwvLejGPD9itU6/OOt
         3Cv/mPiylD80yQaRVs6T7V98xSQYYXYXOcmgUagwRcZCP+zxgJumD06ipp1iUSFzrW9R
         e//IPE65rJ3L/ijDYHqqTDdLjaH4PfWxvLL83fRbT5HwFib0pAd5vAGRD0eBeMiM/lMP
         Rd1w==
X-Forwarded-Encrypted: i=1; AJvYcCXfEW0OxjJVrRFbMmweYnlAjpebuME0j/Rm+2xPL38kaWDhfLsmMgs7fvCOeTOBiscznYmCSg77gX4RIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23Uv2R99MLYDDwxstDaJunWtt3u2lLq2cyCaU9can4JGQL3E1
	u/PSP7rwyBDpMCSi9CB2mQLZEd+cKXHindC56hrysRGd6i9pIDny9KDAdC3Rg5Ow4uk8hjnr5+W
	kcKW23u+s9+xdNW+4EQgMO9+HZAS4/NjzXj0mcgA=
X-Gm-Gg: ASbGncvemmaEwjndzBfPfY/ugs/6LXrMxZwysJvr72xUAk4ZNpj26ezggxAqUdiFVmo
	BkPhY2fJjhmur5YHMfvX5B8INcKUEFnWY8nvLMQ3zzS9M/IRKFmpH8Tvw0yPt5uFl4OvBVR+cbH
	nSJCWB6xXndC6xNHpxYROiKVSkbDdgiyFaVyhEz+wAHLXVJqHUfemgji6YAEb6oo8bhlFnErOVL
	fp7MH5yWtfTil1d+UZ+wtUoQ/n5g/y762LHBK+Fss0bfJFx5pj0VpGN2Avi6A==
X-Google-Smtp-Source: AGHT+IGpN3cph/fTvH9jq+KRBNqMTr6RA5v+48m8NpKXPk/rwPyh4Vcq1cEfPxDOj3gbU9uNlFul82BSyE8W2NvIdis=
X-Received: by 2002:a05:6820:188e:b0:656:6e2f:628c with SMTP id
 006d021491bc7-656bb4ce08fmr1557691eaf.0.1762355527268; Wed, 05 Nov 2025
 07:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHRbhAkDcYQj=VQrNdc7T7WfDfiuDWpnk2s3pjoeouptgy_K1g@mail.gmail.com>
 <66711258-dc14-4469-bcb4-d341f4572488@opensource.cirrus.com>
In-Reply-To: <66711258-dc14-4469-bcb4-d341f4572488@opensource.cirrus.com>
From: Iakov Pustilnik <xyapus@gmail.com>
Date: Wed, 5 Nov 2025 20:41:56 +0530
X-Gm-Features: AWmQ_bnwQdwMX-icaH0OpjGc8Kgg4eMBoQA1sDSRTI1pAys6H15oQSEV58qBkYc
Message-ID: <CAHRbhAm5B7s5DScs8tMVn+kEWG=HaEC7FtPRH0f9RTFS5RHixQ@mail.gmail.com>
Subject: Re: failed to add SPI device CSC3556 from ACPI in v6.17.x for Cirrus
 Logic CS35L56
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: david.rhodes@cirrus.com, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Richard!

Apologize for not finding it myself. The custom SSDT patch from that
bugzilla ticket solved my problem!
What a great community! Appreciate what you're doing here a lot <3

All the best,
Iakov

On Wed, Nov 5, 2025 at 7:51=E2=80=AFPM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
>
> On 05/11/2025 2:13 pm, Iakov Pustilnik wrote:
> > Hello to the Maintainers!
> >
> > I'm using an Asus G16 GU605CW laptop which has a Cirrus Logic CSC3556
> > audio subsystem.
>
> Duplicate of
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220152
>
> We have been told that Asus will release a BIOS update that includes
> a fix for this. Until then, there is a workaround on that bugzilla
> ticket to apply a custom SSDT to override the BIOS ACPI.
