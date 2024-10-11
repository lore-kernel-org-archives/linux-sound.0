Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673120A5D2
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632056; cv=none; b=sT5fT/v28tPz2EXd1Qhw2PO7MguJQK3rukd3VMcO43TXG5SbNHD/zxQTMg2RtO+w4thdvR2xwxiJu/TDAKn8fW3Fa0VzIGkQRwtWcPgrMhz1vlGgb/VnByd/dGJrnwabZgb/bZ/dEjMST6+xP3OsBPQpenNSI4VBT6Vh/8VmDr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632056; c=relaxed/simple;
	bh=rYT4uQmVdXAeVfVgATTeY2o325ruc+Os/sSnMHYh3Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxUjvv6GaHWWwUJ9S3vYTTmj5IJWlfrI96wvGqHUcKFW+xVTU62JdpiDV8Aj1FVEqfsj03YZsHEfqryGC7H81MfLjgGShRiwOV6Qt3fwokngCr8KPEYF0zqff9ILqr8HvegNNIpbNVuNF0RRqc5KlaECtozZbcPfmsjAjSVqYSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLR8Rw4A; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLR8Rw4A"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398c2e4118so3573e87.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728632052; x=1729236852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2LlN4EC7rQinlo0QxLPVDYc259IxpJpbWsupslGt9A=;
        b=FLR8Rw4ALl+FCz1vTNG0cetrTSfvTNueFmU/Th8Q2kwUHxfmAta9ss6i3N8+zxcUFH
         YApQT0Ci2vwQ+8Jb1fCVbNLB2q+jZn9SZzgOXPvJujOEB/YC2cGVH+SoKtbhM1Cu86QW
         AB6pp6UGOVymA1mdgT8PoU37YNdCXxgbNHcs+8whKrPAAk13mTjN3xZ7/PP6kaYEsl/z
         aTgLTVHR1xHBWR49zJzafYWCX3HJbX3YZD8q0VjinI8XAGyKOdfSjx/g0M+FkpkL3bjE
         AgBBNcib9F/BWD3Zgyk43fXofCT6PycNQLELiA4j7kUzdDReaLD9lxobJXIvjNoKFSNh
         PeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728632052; x=1729236852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2LlN4EC7rQinlo0QxLPVDYc259IxpJpbWsupslGt9A=;
        b=qsiDUj4HgI3tdC+KG2Yw9WxiMyG/cCe2N9kmuOiUp42vm8mkyIQxzg8ytjYEoX2hHP
         Zr1avaPpYhVVPW3LcwVkR98I7wQLLQYuWpV45CzgjcQ7bDyOwCIu7Dg/x9+ETLixuMAY
         KT9WaShjfoDOmfA30KjrZ0c5NBnlbJPHVPRFG1lkaN6kL0WIlv6h8YzmfQHjQPJEpbE1
         vVXLP+hxJZKuxZfQrZ0FF1xi7c/QPb6CENIuGxZA/Q6Teoucs0q134LEeiVnQ4OPAaLk
         Pi5is3zylQJieY+GVAK/D7+uachB9RBXYJ7Uvm0emg5/tKZzfmK7EZsKAq9zCQ4IG9/y
         ikjA==
X-Forwarded-Encrypted: i=1; AJvYcCXrkW9XNSIcNRKnNueZLrVgsF+LHifEocJuz5EjXlv3t+fenn5sTCqXAFZBWI6Ad00HtzYSYx39cIZXfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfus66J2VBbCMRP7DH7l+O7vwtukXmBt4vLUeyOqduXoRuTmq
	NSY7hwnnsCB6fKalNe6ENqf8IyolEQSvUovPTDmiCum6Fd5Q1XQHebQgA/mMJ93gydOd9b+zhBS
	iCCZLg/lK667erHVhqU0wG628YYBwAmncN05l
X-Google-Smtp-Source: AGHT+IHQhl4J5Wh7IGTJOZT4LmbIcd39vxI77m6/dL7wtCxN0nNQ42YfEeKIZCEvsbYuTVna8itZPBncU6/toHIEuFM=
X-Received: by 2002:a05:6512:3f26:b0:533:49ab:780e with SMTP id
 2adb3069b0e04-539d6659c02mr55119e87.2.1728632052129; Fri, 11 Oct 2024
 00:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-6-guanyulin@google.com> <2024100931-blabber-wilder-1ad1@gregkh>
In-Reply-To: <2024100931-blabber-wilder-1ad1@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 11 Oct 2024 15:34:00 +0800
Message-ID: <CAOuDEK1RGgOTWF3ja+UaAYzMbDU0kJ0GQ7b+wjSQVjr1Fo=40A@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] usb: host: enable sideband transfer during system sleep
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

On Wed, Oct 9, 2024 at 8:47=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 05:42:59AM +0000, Guan-Yu Lin wrote:
> > @@ -1583,6 +1583,11 @@ int usb_suspend(struct device *dev, pm_message_t=
 msg)
> >       struct usb_device       *udev =3D to_usb_device(dev);
> >       int r;
> >
> > +     if (msg.event =3D=3D PM_EVENT_SUSPEND && usb_sideband_check(udev)=
) {
> > +             dev_info(dev, "device active, skip %s", __func__);
>
> When drivers work properly, they are quiet.  Why all of the loud
> shouting in this patch as it goes about it's business?
>
> also, __func__ is redundant in dev_*() calls :)
>
> thanks,
>
> greg k-h

Thanks for the suggestions. Let me switch to dev_dbg and remove
__func__ in the next patch.

Regards,
Guan-Yu
