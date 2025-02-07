Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BB1A2645
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926050; cv=none; b=rW3az8su3MpP4hFhycy/doB9ZOnsXiSEsGjgnptClcWIueXF0asu4v7dQiZYnyzinOr56i09gy7ZeXEOUWZWG7JCPSu40C6BTIenlykdSU9Vkm1aFsVZMYayV/ViRDclBWrkD77XTZWQN3kL4pk07dau88bALNIgvNC+T3NPE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926050; c=relaxed/simple;
	bh=ElkCd0VSmZ1y7aJo1xSkdXaYuOZ//Q71DJVBY+TzsMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyrckIyoHZyn8ihElC/Fod0gSKBPxHPOTsY1EWp/lPjxvwAGaCsU7tFr+Zsbb5m0ppaUPDp6t97ibwj4/RSFjD35iInNlJjdSrCefqRF1EfErH8sTP0BSEtRYvXprR2jWzPwqCiuiT34V1SDu1fIxBiU9qBnuAls06NBSSRDkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v0fiYgzR; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v0fiYgzR"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso8356a12.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Feb 2025 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738926046; x=1739530846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPNEh3d8SXd4UyVBzDYe+DWkKrqBsXALhs4HDck1znw=;
        b=v0fiYgzR3YU7cPppw9/J+DWXjC3a22NO3H+m0Dxy4+K1O5YZJdp6f6rVKIwUzVr5cU
         4iwvJH9Hgkm7e5TDT5ABeIpZ/PEqd39XJExp6BEuKNwHqyWXO0jRaPTrYASv9Oye2A0T
         gJGrpaTH6cfdzBzersaOGgIhDDtzJIhGCMyau063Mih95d6b8OXUecD8cfXpbsmba6vh
         5Osm++ilG1cm02U6vR0j0PHPyFsMalNPhW+ikrPVnf5zGhhzE6BkgehoxxH1S0NhBf10
         Q/5B5XoSCnmHCEH3QSJaHxQ4X8545dPNrPhk6iZtNxhDuNkbmzZTjzeGH1JrXTO3o9wi
         5SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738926046; x=1739530846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPNEh3d8SXd4UyVBzDYe+DWkKrqBsXALhs4HDck1znw=;
        b=n1Mxt+xBdVtxHwObaAcaAZJr5IOJSomCJC/59e905RLXymKKQOyDnFgAg5s4o+yyEo
         I55cFnZH0XIzy1KB5y5ZMmJQdH86XxN7tD2gKytydQUWZBUQNwwBpKysf7zyNN39s+S7
         eFQJqih1C66DnjNm/mwo1Lx13mg2uES+NBxLHtQ/CubfOTXgaKtC2g8v0hy0TOJzhrIM
         lpEDP0C1CE4YcN7dXDMyG6YqBzdFl0gk6Styb376QIta3DAcxk4oaCgAUsK4uJmR6+KQ
         7HCL+RW57bafR03KNwfPWnSMSvAL7JXRa4b/qYIl971i5Qnk3/RHaBAdNkBVZnkIZ6lz
         wuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPgVbpjlIspjwx69k+ueMLuCy+Q1FuwD07d9D3nvVX7rLYZmA7mkojaU8u6fKPC618934mBJjkbc3Y+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZBwW+WYcTvlOx3OimX4tOclB1z7slBG8nFgWmoEstK3UNLLq
	JNHCw8Rui60At84ndSyswMKDA0ma1HPpYbF40QaY7Y7+0wodGwWj41bk+G06kz5de/j2J78MsL5
	PNOqi0g2L8thigZKiG4+TpdW6yMAdkKVVjmx+
X-Gm-Gg: ASbGncvStZk+R+iPSwlDA1NjRQqT7lZfOtTV4OvvOvFgO3+PZD5ilYIvYBXIwBVR7I4
	uyamOOmWZIyWKLHI01WGjZzTJTwmhWdWFM/9FIr+7Yyw/dKnp4RF2Kf6heABPNi8Pou2AqK1TJL
	V5zdjLAtpmmmhq8aZRBCXuqVNB
X-Google-Smtp-Source: AGHT+IGKGJth5652Acd+gw45CCa0RFZ/zp8RtL4d3FGKWPR2wRFDG4a+498kMReRGmDCy02tEid8QT1Lvxxfgod8Vaw=
X-Received: by 2002:a05:6402:299:b0:5dc:59ca:8f3b with SMTP id
 4fb4d7f45d1cf-5de47d9504fmr74611a12.3.1738926046475; Fri, 07 Feb 2025
 03:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-6-guanyulin@google.com> <20250206011324.4729b548@foxbook>
In-Reply-To: <20250206011324.4729b548@foxbook>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 7 Feb 2025 19:00:00 +0800
X-Gm-Features: AWEUYZnVEvD7t_Dz9KkFhfaKqY6-yN5VtxdJYuumvbaB5-jEOXHVpXFPVyLQTDM
Message-ID: <CAOuDEK2c-F8dEyR894c5=OVYTJiLX6y1e1vd1RKoxusNa5PFig@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] usb: host: enable USB offload during system sleep
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, kekrby@gmail.com, 
	lijiayi@kylinos.cn, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, oneukum@suse.com, 
	perex@perex.cz, quic_jjohnson@quicinc.com, ricardo@marliere.net, 
	stern@rowland.harvard.edu, sumit.garg@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:13=E2=80=AFAM Micha=C5=82 Pecio <michal.pecio@gmai=
l.com> wrote:
>
> Hi,
>
> > - not flushing the endpoints of actively offloaded USB devices. Given
> >   that the USB devices is used by another entity, unilaterally flush
> >   the endpoint might lead to unexpected behavior on another entity.
>
> This doesn't seem right, because flushing applies to URBs managed by
> the kernel, so it should have no effect on offloaded endpoints.
>
> As far as I understand from your earlier discussion with Alan Stern,
> the real reason is that it disrupted operation of class drivers, in
> particular causing kernel-managed interrupt endpoints not to be polled
> during suspend and some events were being lost.
>
> Or maybe the real problem was that if the INT IN endpoint isn't being
> polled, device events don't trigger xHCI IRQs that wake up the CPU?
>

The main reason is as you described above. Without polling the INT IN
endpoint, some functions (e.g. hid, hub) failed during system suspend.

>
> And by the way, usb_hcd_flush_endpoint() doc states that no new URBs
> may be submitted during this call. I wonder if this can be guaranteed
> if the interface has not been suspended first? Perhaps this alone is
> good reason not to flush.
>
> Regards,
> Michal

To my understanding if the interface creates another URB, then the
interface might be able to submit it. Is there a reason to not
flushing all endpoints on a USB device when we have offloaded transfer
happening during system suspend? If there is, we'll identify what kinds
of endpoints are influenced and not flush them independently.
Otherwise, not flushing all of them might maintain a simpler code
logic.

Regards,
Guan-Yu
