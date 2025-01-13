Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBFE1CA8D
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784902; cv=none; b=iXrL/u0aY475bBU758bHB1BIRW8CqxIi963yZ+O63ccEKw7WNZIIVv53L/ZTHhTXfMn/rDOhLMYy5EMkEGqUGRUU+4yabnJnxJcZ/qLsFXJw3ZnSxRIFXAwCeGzBEDfZyXKU9BB0rjlLsVZIypj/yc5YRFVS2h+0nP2j3XHT9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784902; c=relaxed/simple;
	bh=B9BBV050L1aecQPyYu7lAbyfZYdXk+T6yzMHGJUTUz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIOepjW33foyTobH8ufo/ovnqM07Y+2LcAfOAvNuYzuLm9U9mwo1J0fs6ZbIcQ7Dr6R6ByEXjhAT83Cojo9cwEBlElTL3/m+Pip8P+DGM3YNuuK1EiRXU2x8iTePSU1/zN4xxjY0GRkpo/ccy5mAT9Swfuqac10in2pRFuVVFIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xfE+kLa9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xfE+kLa9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so8805a12.1
        for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736784899; x=1737389699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QShTnDTQ8IHjQQz+4aG3jXHA0yIDJFzr0SGW6gyyWZk=;
        b=xfE+kLa9vg8qurJiAEFHy4/c/qLcFIdjrooh3WmfFdlX4smWhD6ova6QCV8aFtzYvH
         DRIC0KbH5OOqO0+sB8DmbUfb8MznlOPSTt6c0AeIiFw0+DSecnCqJbCHEEWqoNLyVuzJ
         bn5YTj9xCwVKM9H0uz8yX3OK6TXZ4nURgf0JnF2ETgocTyh4TTiXjyHQUtmjDLJ45gY/
         /7ra5fyP22AMyC7duEbgAsYXtB6mx3zcC0fKwhzW0swwEM2fx5hZ6IM01NSsZVUS2RO7
         s/1duC93JFqdgPeagEXtVNTTu+rfrxmv58j6UxhQZMNKo4zDVzoq9VX+qO6b1XZJZqjM
         SjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784899; x=1737389699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QShTnDTQ8IHjQQz+4aG3jXHA0yIDJFzr0SGW6gyyWZk=;
        b=nGgtIzBRObSDEs9FVRz3pZ6gceJs0yJJ9GFRBOXMfiPLPlk/UFCBSTReAHdf+1IF4W
         K31U7zRMZXrV+BhsvKGJyUq+fJHs4sFvRw5FoRaElE7VMNb7iYIpvxJzIcCoQ8AJ5YTp
         qSD/GI/R/fqYchlLIju+tSBUd4ssOEc+f9EQ8xSHjQKkZKkBtxZANSQ/TUDNY9R7EDbJ
         7M/vXvCR8hdX1i/xUrnE9KNiQFu4OVW8pDmJb7+LzjcSxTjrRdHjPQoSo0GB8I6c6pIM
         q5kz5feARl35Aw0UoMMkh/w1oqMma1bdGOfXqMArsr7gfRRjUByP9lZdIXDOXgM+D0Q9
         aKJw==
X-Forwarded-Encrypted: i=1; AJvYcCUlT9Liwjl+tR7D9vFm21cXCkyOmdOzy2oItp4JF6YZvU8BOsntXADzKxkLHvYH+Mk9LcR6IunbZC66Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCOglooiP8iDI1HnqH1tSmSE06nisGfEc0RQqb5DWcCrs30VIF
	GgVuhDhEnTspD8SBaDh2LdhQ7ni1eykUPmChGd1oB1/ny4jLOhoOcPnOm7gyLKLyTuJdi/tu6e6
	8JwtjaAVk0dFODeJhMmzKJy2q0vmflWr4QK/D
X-Gm-Gg: ASbGnctpZ1uerCnc74TbpdgeAPsyBbjHVAKPAI0gEBiEy8ancoxSlt9wORRT+dszcth
	fR0qiQS2n0rUpA++I/H0O8zP//Ocuw2aedTofVmkB
X-Google-Smtp-Source: AGHT+IEJmuDgymat/mpM2w1X1B9v8DJdUfMBCtBUnEyqa90eiWvc9ZY/XouqD+U+64QHR2U7Agi8HY3FQnq/fCx/tJQ=
X-Received: by 2002:a50:934a:0:b0:5d0:8752:cecd with SMTP id
 4fb4d7f45d1cf-5d9a0cca0a0mr219019a12.3.1736784899141; Mon, 13 Jan 2025
 08:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
 <20250109035605.1486717-6-guanyulin@google.com> <e8de4837-4c4a-4acd-bb33-6811d7381d20@rowland.harvard.edu>
In-Reply-To: <e8de4837-4c4a-4acd-bb33-6811d7381d20@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 14 Jan 2025 00:14:00 +0800
X-Gm-Features: AbW1kvYwXaUbFjPK9wIVT04AzGYANqAMNH3YYWmL8F7mYAvOMFgPmFNG0hcSTdA
Message-ID: <CAOuDEK0jNn-nSb7Rk_0EYtFg+Mxybij6cGnOenq4FPJdTKyjng@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] usb: host: enable USB offload during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:08=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Jan 09, 2025 at 03:55:09AM +0000, Guan-Yu Lin wrote:
> > Sharing a USB controller with another entity via xhci-sideband driver
> > creates power management complexities. To prevent the USB controller
> > from being inadvertently deactivated while in use by the other entity, =
a
> > usage-count based mechanism is implemented. This allows the system to
> > manage power effectively, ensuring the controller remains available
> > whenever needed.
> > In order to maintain full functionality of an offloaded USB devices,
> > several changes are made within the suspend flow of such devices:
> > - skip usb_suspend_device() so that the port/hub are still active for
> >   USB transfers via offloaded path.
> > - not flushing the endpoints which are used by USB interfaces marked
> >   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
> >   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves =
a
> >   pending interrupt urb during system suspend for handling the interrup=
t
> >   transfer, which is necessary since remote wakeup doesn't apply in the
> >   offloaded USB devices when controller is still active.
>
> Does this reasoning apply to interrupt-OUT as well as interrupt-IN?
>

Interrupt-OUT endpoints seem unnecessary in our current use cases. Our
primary concern lies with interrupt-IN endpoints, specifically those
associated with the remote wakeup feature.
Remote wakeup presents a unique challenge within our audio offloading
model during system suspend. Functions typically reliant on remote
wakeup, such as key-events, bypass remote wakeup because the
controller remains active during system suspend. Consequently, these
functions are handled as if the system were active, with events
received by a pending URB. Flushing the endpoint would remove this
pending URB, leaving no mechanism to handle these interrupt events.
Therefore, we should avoid flushing endpoints associated with remote
wakeup to ensure continued functionality for audio offloading during
system suspend.

>
> Or looking at it another way: Since the device's endpoints are being
> used by the coprocessor, should the system flush any of them at all?
>
Our local experiments reveal issues when we flush interrupt endpoints.
For other endpoints, we didn't see any problem. However, since
usb_hcd_flush_endpoint() still modifies the endpoints, it'll be better
to avoid flushing the endpoints associated with the offloaded USB
devices. This could mitigate potential conflicts in the future.

Regards,
Guan-Yu
