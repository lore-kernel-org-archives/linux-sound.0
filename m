Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED54A15
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728533785; cv=none; b=DohgGy0oS2MftIuidI4Mn56Rcb7qmEO7LlL4opOLLDi5YDFz23vWN8OrwiOMy2qi5V+FVLSUFwNk92BOZ3TG654z5ah9pTfJBHkrbdSRHz0x0gSTI72985wIDDAHwRd9vcyDy6SgTB3URtDIBVRrEeMZVv0L6iqwahPDcgvmqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728533785; c=relaxed/simple;
	bh=/NOfPZ7eMm5ZzTytaiKGiKN9UkLL+n7+0hNpo6cf5sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AURgfVwk9sd26JGEKwICMYKRJPzczHUDrSwWaMhNiOO9crJ7aO/GPtP6Kn7dUGYEFyyBPVBM+UhhFFZh/RS+py8PCGNfK7KUUTzx90LQQrB4tYYrtFZZeMXA9lZL6yY6vVvjUf1uEPTRNbVLcVwabvnvR6CxEkCuO6XYrxYafWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iSjSLg2M; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iSjSLg2M"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so134835e9.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 21:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728533782; x=1729138582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9CK/O4HA+lbmjqu3KI23h4Z9dZBS4xoaBV+wIbWtTc=;
        b=iSjSLg2MsDbrmkufcn5NT3CZZWsnpIZ2tJHIlJF8i0sdfBH5Ci4RFtdCUoHNw4AIlo
         kbWvzKemShGNnuuOeEDHUjSRHcY+xwajTpIseBJXem1pJHnkBNTUYLFPAKJdEXdB2hm3
         uyqd+G8VZpfyVwZylbbvOQvFpUkgdBHecSXOw6wJRKi06l9SLLlSeN/5OfXNrADqwNjl
         jcA1bdkywPpi1GVJITpgGOTaY/+zjPMUpV19MXCKU3YyWyxKo2BfcCKeW1OZSSEZqzbG
         i350bb00VDIqVD0taQjFwFSDpT8f+A/nGVMbWiQWTKYhQmQ5nJTnjHCYiMs87tLpX4KG
         qIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728533782; x=1729138582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9CK/O4HA+lbmjqu3KI23h4Z9dZBS4xoaBV+wIbWtTc=;
        b=u2jSbRVvX1bIr+X4h0GvpXicrZrLFogcUJEtSAvA5XxVcwJyHBD0u9RhQXjwrEZbUE
         VMoyucyieeoOvWJFQx3Dgx77guDamH4kh6qfVNYHBTICK3Rlf69T637y5bLo1X3EKVtH
         ht0fdgKY363ybm0Rk6RKWWgUuCLE0QcScvPMGXrfIO/BjpfxuxHisexmXli5jkGE7Y4w
         vdtwu5FjnbVjs3HEhhXFlwAjeY2LI7KImg8TYsXHXiENvHY6pjkFhCIBwgVUnoUkLQ9X
         Qj9QLcDokKClN2d5BkXmZ2ZaEfRmP8QpFjxwryUA2D4JVnhTFsrgDpiiOIVaHDEkOZQd
         kwLA==
X-Forwarded-Encrypted: i=1; AJvYcCUjUudBfr34s92fnWbnhP3NgaYSbBubbkb7f9oEQY9dUNdZ+++3GqZTwX3pHkaRLKJsffRanuF8cQUnFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeHpi7G3wkJg2LkxIX3MntA0rToEcsnlSZEWOhU6wRzSfRSPqX
	BiU3FgymkssLtjDWfs36mb6pcYB4xWlnHivukX6uT72ip9iB4V/94x2RKVVWAuIK3u9JG7GecJ1
	b0s+76XCC38QzfD5dhoT4I7I1VesBiPrLTcH/
X-Google-Smtp-Source: AGHT+IGP7qugmWppsd+XlsR9KmIIvyoIQhlhHpbvsPc4XOnMNQwrh5jCpIEK9VKbli8xlljzbWSo++KAN7+HMPOUG7g=
X-Received: by 2002:a05:600c:3ec3:b0:426:5d89:896d with SMTP id
 5b1f17b1804b1-43116e075ebmr1681815e9.1.1728533782304; Wed, 09 Oct 2024
 21:16:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-5-guanyulin@google.com> <2024100935-resonate-aneurism-b330@gregkh>
In-Reply-To: <2024100935-resonate-aneurism-b330@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 10 Oct 2024 12:16:00 +0800
Message-ID: <CAOuDEK11OaXX5g-1OvD3ehew=D=_PixL00PrSP2wf=O9zgUPvA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] xhci: sideband: add api to trace sideband usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, elder@kernel.org, oneukum@suse.com, 
	yajun.deng@linux.dev, dianders@chromium.org, kekrby@gmail.com, perex@perex.cz, 
	tiwai@suse.com, tj@kernel.org, stanley_chang@realtek.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, grundler@chromium.org, 
	niko.mauno@vaisala.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 8:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 05:42:58AM +0000, Guan-Yu Lin wrote:
> > --- a/include/linux/usb/hcd.h
> > +++ b/include/linux/usb/hcd.h
> > @@ -84,6 +84,10 @@ struct usb_hcd {
> >       struct urb              *status_urb;    /* the current status urb=
 */
> >  #ifdef CONFIG_PM
> >       struct work_struct      wakeup_work;    /* for remote wakeup */
> > +#ifdef CONFIG_USB_XHCI_SIDEBAND
> > +     /* Number of active sideband accessing the host controller. */
> > +     atomic_t                sb_usage_count;
>
> It's a reference count, use refcount_t please.

Appreciate the clear instructions, let me fix it in the next version.
