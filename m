Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46944191F89
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473799; cv=none; b=Wugv5KTQ932P/4jxQv84a6Xvg/8ubgsxFy+pXJ4lWGOEJbzJ5I98PcHDeG2yH1/xLhHcdkqrLreeO/ylRiSUNrDuYDHAdoFNchFUJQQhMbvan4MDfHhVtdUGwLWxizRJi3Vf2Izsl3UA553SSrNUYGE5viPkIsQEIATKB2BG5ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473799; c=relaxed/simple;
	bh=2UcU/0RtPhKNhvF75glrExZYJbVt3PfbtvA++YZnAZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1p03OTowhQGVETIJM0qvpDZOn8gelgd+AzrQuI4jsN0MbUux2H5RjsZLkt+rkbCTxQS3CzivLVR9ej/tMPmqb/i92gJLdMGgRmBVkVIlnBA/co8xCR0F1InmXWVhUe/vU+ech7MrgVwDYICqIZ1bwZfTxZZA7fupLV3ClNeYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXghI08I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXghI08I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so237855e9.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 04:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728473796; x=1729078596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26JiU8VHKWoZ3njFmpEz3ylcfDTsVxNL+ck1QcmMiWk=;
        b=JXghI08IJvHzsidCaZxISnDwGe/hyiLQN/VjsGk1vH6EPPiZcim29IozovgzYqXmJD
         uirYLjl3WnXo7o20zIXgjrwV4h3D9S3MwsAgh/VXLOzCeEuGgtf1pyEuIHB0VK1Xyjan
         YxLioLWQ5GC0Dy1+0t8ApNJodxiuBUSAZ+5U14c2V1GSf3TZk7ZrN+jsOEZjPO2XEfxH
         XmTJ8LBx99dHrvVDxp2qWi4gsYupBbJ6ZUI/CXtnECncAf7fxahkxixGT6Aqq6lDpLn4
         MF6L8Y3FuvNcdQ1fhvdf8ib4dShKg6ozHJdG+MWCvLXle+67s/asR6SdG6oZIQs90B3M
         iYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473796; x=1729078596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26JiU8VHKWoZ3njFmpEz3ylcfDTsVxNL+ck1QcmMiWk=;
        b=uuIcHaYfFmQd+2DzKLy9AQ6bnao1EkzBTXZ44lKVKPvDgDD+n6Jo6dF+R7sBPrmHkG
         c8Kt0pbXwS/xe+vjfSrrnsS6agaAaPs9cqtGT6lgjx1Go4X/Ijw7kLcYqULN4SahRPUW
         fHLuGYpQlOdcVYn025JkMziK89pJ53/rfNjsbCnnhLmDT4hLwUNjMs8DIlARhGgQbZLe
         28YytKkYhQVgGwHIDh6BYN2hotSO7Tg5qtHEgpvfMHWU3qE6OakQoJNWZaMy2bQ7Cl+k
         PtA7Mq07oWfb9FJ8Yo2uKB16WWFys4w8TGqlCG8mj7Lss2Yn82SXh5PaOJTMMp3B9C0R
         A/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVMnBp68NUHdy21dJHaRwkDHe4JvnNVt0BQ86U80P8cd5VQci5MqSIDynhFErj3/mY/bweWf6qz6gGBbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ls9osciIdklK03Yh8NnZSyx3ZwoYvKkhtQmW4LPpI2gf2RJi
	hcQlipLedlAmtc7NsDeN1NgDvKnTi5gn7Owkouq923frDitVRLPfxBwJaGk6tJzc3KtMEEtTwIw
	OD91RsYf2r3w9SIywpPX29i2ZJU0+Hiz0CVgc
X-Google-Smtp-Source: AGHT+IGKWLOazhBj7mWGSjUC0jjh31+NRgp4kNmDT13H0EjvYGZiGvvd2lLhjCqnoT37E/MkhleYdk7a/22l9VV0YdE=
X-Received: by 2002:a05:600c:a015:b0:42c:abae:2ed5 with SMTP id
 5b1f17b1804b1-430c3a9a4b0mr3088625e9.3.1728473796283; Wed, 09 Oct 2024
 04:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-4-guanyulin@google.com> <737eeb51-b5eb-4585-a9d2-f1578b21d86f@linux.intel.com>
In-Reply-To: <737eeb51-b5eb-4585-a9d2-f1578b21d86f@linux.intel.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 9 Oct 2024 19:36:00 +0800
Message-ID: <CAOuDEK1=X7NdWLMdbHzpO_g15p6JeU0_vb+YOs6TXc2hNfxmJQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] usb: add apis for sideband uasge tracking
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, elder@kernel.org, 
	oneukum@suse.com, yajun.deng@linux.dev, dianders@chromium.org, 
	kekrby@gmail.com, perex@perex.cz, tiwai@suse.com, tj@kernel.org, 
	stanley_chang@realtek.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, quic_jjohnson@quicinc.com, 
	ricardo@marliere.net, grundler@chromium.org, niko.mauno@vaisala.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 3:33=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 10/9/2024 7:42 AM, Guan-Yu Lin wrote:
> >
> > +void usb_sideband_get(struct usb_device *udev)
> > +{
> > +     struct usb_device *parent =3D udev;
>
> Is it really "parent" in this case? Perhaps better variable name would
> just be "device".
>
Thanks for the heads-up, will change it to "device" in the next patchset.
> > +
> > +     do {
> > +             atomic_inc(&parent->sb_usage_count);
> > +             parent =3D parent->parent;
> > +     } while (parent);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_sideband_get);
> > +
>
> Similarly here.
>
> > +
> > +     do {
> > +             atomic_dec(&parent->sb_usage_count);
> > +             parent =3D parent->parent;
> > +     } while (parent);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_sideband_put);
> > +

Regards,
Guan-Yu
