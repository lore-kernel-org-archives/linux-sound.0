Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7D3328FA
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447930; cv=none; b=cGdmA3r+M8VcH+aojs597z74CCE6uINrT3ZNMmI76P1VsbcCPShU25r+08T7j5awSlk+QIGCUpzromzDcpGRO0lksgrJ0w8yPNouApNs5npV3jHQGctLNhUGpe/SQoRsX1WalBiS6yZEEmQthCO5EH40EYOW7TRVHpyG4kPnMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447930; c=relaxed/simple;
	bh=PO0TbLRbiVrKvdhPwH7RKWikT/wKrrUI+0ibUOovsCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scPOte+MsJw/Rm5iQSdc40TiQqBkbOzxQOdvB3a8jmBISd4gJdwQdl7cv8FBNmnYb/qwgJp3x9BpdKT0AaTDYfiVtvia20g/+tC775ZhGK29NrqkSaoMH+zUgfwnz5J/0GjX+pJuDOWNIyyx6h+a6imngbRg5Ixf/DZyHgSWnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a88bfd470so3407259e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 02:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447928; x=1773052728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl7RAWu6mKzowPFnldQghONe5pbsD04RWaX4BUYhOlo=;
        b=TNQO4ky+d5KXsRg2Ldedsa5k6hzHszOsbpM7OrEzGIAHsvs9ycLK4ectgoW4MN3vT+
         AJT3v801hioFgVJrHq73u9l4W2+b7x/344K166H6+g/r26q3ftmYXdv4JZucvx/rSkYt
         +xfGbIkalkmwnKNuzfihh6qdLHRMxdkbVTwxNWte42g91T+oeHoVAHj80v13ahNCk6PQ
         rN8aVAwl+hwA8JMwWkkbHhGYgszt/qI+vQ6xlmQRIWHJVldfFVNAtQg6E1znkmtQi7ph
         NBCNpAeqgo3LvB5j7GamNgn2BpNHfGtfy0RrXLUewweP8uZVVcC66j16V2vGQJgX5/is
         z4tw==
X-Forwarded-Encrypted: i=1; AJvYcCVquGO0/uYAduwZy7Cm66iUJLcPrhENOqpqrF0c1nAVpsT6aHqY27Qi1k+LVI6+rEtnrCNV7UPI/nBVlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzutDZWRnY9CQss0axZrR8N87I7EUUzx131UANnlv0kG+pZYalQ
	q3sOpVzc2mWvpoSYeKuRjN2TQLh/EB8c6DP0PKVFo+5lsmjVK/Myue1t5Poi9MzH
X-Gm-Gg: ATEYQzyPij4PhlVhE0XA4Nv8e0zX6B+ts1vPDoVidgYq54VZDxLuYNGj7ESm3D0Bwlx
	rgy/l5C86l/+H4Y6B8izYNKG9AmR/gZlpcF7DJUpzHMMxsT86UbOEwCKIMeZ9o7ImynQVAw3kr0
	oER4wZWNb7FL1zCQYcMxW2owvB+Aoje2RshQvF4Ctk/eJbZpX4dD0NxYaaHZh3krGJncy/4OBJV
	b9FMd5di2W2rG1LpyAlMeE0Cik8w3TX9c7Oar9dOQTmFifN7NjPorbgHVoRdtKj5Ii5j6LCWEhA
	HmVS+Tp9lEpDIZ7YTreMuYMjJYxDn5ccYo7fJz1vfZ8vy82+A4PeJJ5peO7tL9GIqWNpVnMlptC
	oQJc2iyBoryDPBJtS8l9ruNCcLpWw2wFnSoremd80s8YlXUH6jRDner2RiRqnhZ1KKKFt2nA6il
	z8G/2KbuXz3v5FzEP8w3Zv1gHqJjXmlkF83XDpdTF+qykJR5BP8hoRC2LaCQ6jNqiU
X-Received: by 2002:a05:6122:909:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-56aa0fc16ddmr5650501e0c.6.1772447928375;
        Mon, 02 Mar 2026 02:38:48 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a920493f9sm14936979e0c.13.2026.03.02.02.38.47
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:38:47 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5674f3e80edso4088621e0c.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 02:38:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUnebyfvWAE2tKCccm4Ir6oLcBnOJ8RcY6eB2A+nJOgxecAMoMnG20ZhEhaJkDBb9dsjbvNilWyTw0+g==@vger.kernel.org
X-Received: by 2002:a05:6102:440e:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5ff1cda8e40mr7754538137.5.1772447927548; Mon, 02 Mar 2026
 02:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com> <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
In-Reply-To: <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
X-Gm-Features: AaiRm52rSumTG3nFZ9P6FzWdxvQ0hMzWVlbis5lyqzx4MgKVwMUrLmFH3gE-zLg
Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 2 Mar 2026 at 11:26, Danilo Krummrich <dakr@kernel.org> wrote:
> On Mon Mar 2, 2026 at 11:00 AM CET, Geert Uytterhoeven wrote:
> >> --- a/drivers/base/dd.c
> >> +++ b/drivers/base/dd.c
> >> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
> >>  }
> >>  __exitcall(deferred_probe_exit);
> >>
> >> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> >> +{
> >> +       const char *new, *old;
> >> +       char *cp;
> >> +
> >> +       if (!s)
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> >> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> >> +        * Thus we can store one character less to avoid truncation during sysfs
> >> +        * show.
> >> +        */
> >> +       if (len >= (PAGE_SIZE - 1))
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * Compute the real length of the string in case userspace sends us a
> >> +        * bunch of \0 characters like python likes to do.
> >> +        */
> >> +       len = strlen(s);
> >> +
> >
> > The newline case below is is basically the same case as the empty
> > string.  Hence if you would move the newline check here:
> >
> >     if (len) {
> >             cp = strnchr(s, len, '\n');
> >             if (cp)
> >                     len = cp - s;
> >     }
> >
> > then the "cp != s" check below is no longer needed.
> >
> >> +       if (!len) {
> >> +               /* Empty string passed - clear override */
> >> +               spin_lock(&dev->driver_override.lock);
> >> +               old = dev->driver_override.name;
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +               kfree(old);
> >> +
> >> +               return 0;
> >> +       }
> >
> > Also, this block can be eliminated completely...
> >
> >> +
> >> +       cp = strnchr(s, len, '\n');
> >> +       if (cp)
> >> +               len = cp - s;
> >> +
> >> +       new = kstrndup(s, len, GFP_KERNEL);
> >> +       if (!new)
> >> +               return -ENOMEM;
> >
> > ... by pre-initializing new to NULL, and making the allocation of new
> > conditional on len being non-zero.
> >
> >> +
> >> +       spin_lock(&dev->driver_override.lock);
> >> +       old = dev->driver_override.name;
> >> +       if (cp != s) {
> >> +               dev->driver_override.name = new;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +       } else {
> >> +               /* "\n" passed - clear override */
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +
> >> +               kfree(new);
> >> +       }
> >> +       kfree(old);
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
>
> This is essentially a copy of driver_set_override(). Except for the required
> minor changes I intentionally kept it "as is" as it will go through -fixes and
> we know it works properly.

So I will have two to fix? ;-)

> Do you mind sending a follow-up patch with your suggested improvements?

Adding it to my TODO list, if this patch makes it as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
