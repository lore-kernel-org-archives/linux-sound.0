Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE939448E
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445639; cv=none; b=cBgMm8OjJ6NqC+Ip8UF120MFapS7seOIF4BcBBV3fMWmcqMHIQHFaFNf1wXSXixu6VxfBdh2pLySTmPH4UHbl1uiftcnPdNopZ4rkAD2qlAzxRjhXwBgq0pQc3rNWNm1oRBu9Ogrl5jaI2nGjhM87FLaQCjDo6m6QMlbgjdRGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445639; c=relaxed/simple;
	bh=4y2TOHi9TFOVkbjGDV689T/Smv9dTsRouELeh2CzMQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBgOX9RfYUbuS+toX5w8F+zLd0hY+Uj75YPIUkk81oT0IsGI3bjW4IAWB2QPa8G9sq4oI75kU9LiET5FgR9H4+GbK3neQIYnZpHHusQFaIMTiWYikRvZgBaGRfy71VoUUPqeq9DxIJg7ewDa0zNu5RbbPGYY9WltOL/0ijbbz68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fded42aa7cso2900087137.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 02:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445637; x=1773050437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8HkRe6vR1zoQp8bGRDh2bo/ApHTR7KmRx9+/JW4v6E=;
        b=PA0R+1NFCnuPWff00T1XTfa2+JeNJmoYpU9t0pZbfDQ3bcHW/FXDrUqR2jrTm3c6Cl
         283K0NEI9vwRFkmQ4QOQhrpibzWRgSzpQy16RVJaJiMlwQGtqTf5/qCXOBvB33JiVp1a
         Q3vCsI18KtaQ5U4hsxwKA/KU3lu8gMbBAeo2dRiRPkqbkBELEXyNSqiSoKFmw50F/VeQ
         gsefs4/dLIeS+iuBH/H6KZGV79mgQuHIWFimSg2F9DWfPhsTTrU5BlBhIpHNRKflnTU5
         v9wyagfW4E2zW7JUfjfA8Y8lUQSBMs8WSDLU309SfcynKLch1pQ9hyQvgUeukijHf9QX
         gpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVanE8LWr3e9qkKClz4koEeNWw14VOn3AyAmkscDMaADw6y51MhdDsEI1D8iRIfLi8/+h8fV/4boMmooQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoTeuflvGd4QUD/KhEdME22/kvLBTXcbUT1dZeXvpVohtGKPcd
	8c0W59SSTHLb0GSL6x+u7d3EPOdBW31sKFDQu+p1ESn2/S2KzWR6Dgy4ZKzsoz59
X-Gm-Gg: ATEYQzz4dC0xCZABTve8g+dZ4zRiLckuauKipPhrlPiraMj7l/6Ppj7QwnQkjOSxfoV
	QTtKMhwYHVw2hJv0bTRmzmxUhg/J42O+f/fdd696h6ICLjRFOjU+cx2igh1OWgQ1Fae4eAuqbW8
	0rYUCY/ciFL0of2W5Aw13vI0ljCJ1dXTBv/H9H+9HDnXHqNF1giffejr+kBkJP1WaCY1zNKJ6+2
	eE4DvmL6TDIjrp77HHmxWeJbephDu1tAJ8dPmtr8+3cP8ATXdyGysS1/QoK9m3cb/5leuCYLwpm
	SdYq1za9pvkp/Faxlz9HIkKHsOS0JeANrDhAexqMi4EFn/xLIXFdisWZti+0L6FU7crP5ch5wEv
	VrN+EXiGHi9sTd7j3wEQZN+nAlPqrtQI5Bs9o6H4iFz6FQlziQh98zBSvQWkQHCO5OoUFmL2xXo
	0KFJdf0orHdlR18JkFx5xm99TuwBvsdDCI6xs9iXPBT5NYf6v4vAU+HpWcdntLWd/f
X-Received: by 2002:a05:6102:b0a:b0:5f7:24e9:6e91 with SMTP id ada2fe7eead31-5ff325677f4mr6699015137.36.1772445632374;
        Mon, 02 Mar 2026 02:00:32 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea116c8sm12616460137.10.2026.03.02.02.00.31
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:00:31 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3597877e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 02:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCizcH2Tj8vMJSlENl4jXEGwEBJGOnjayBJcGA0D/gBeJVtUMMs275Yifs6BhkLhbf5zHOnR8aaANyPg==@vger.kernel.org
X-Received: by 2002:a05:6122:1c0f:b0:566:22e6:35df with SMTP id
 71dfb90a1353d-56aa09f82acmr5754346e0c.5.1772445631307; Mon, 02 Mar 2026
 02:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
X-Gm-Features: AaiRm52H_j84TKaKZyu39pwrVpDQPCGWPfmBnPTyHzO3FAF2JqSLhA9oDdBhutg
Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
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

On Mon, 2 Mar 2026 at 01:28, Danilo Krummrich <dakr@kernel.org> wrote:
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for your patch!

> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len = strlen(s);
> +

The newline case below is is basically the same case as the empty
string.  Hence if you would move the newline check here:

    if (len) {
            cp = strnchr(s, len, '\n');
            if (cp)
                    len = cp - s;
    }

then the "cp != s" check below is no longer needed.

> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old = dev->driver_override.name;
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }

Also, this block can be eliminated completely...

> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;

... by pre-initializing new to NULL, and making the allocation of new
conditional on len being non-zero.

> +
> +       spin_lock(&dev->driver_override.lock);
> +       old = dev->driver_override.name;
> +       if (cp != s) {
> +               dev->driver_override.name = new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
