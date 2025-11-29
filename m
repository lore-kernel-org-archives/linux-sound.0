Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096121EA7DB
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764446208; cv=none; b=mxOAvbHalT9fvXxX9YxdzR7M24ZC43/hwenVvJh/dKqXiZ/6DPkHdAMnlEQmggnbK5ywd59A2tzAuM/FC162ws3dP8yfbHnoxU5OmRca0jXKz2LejjUyzzkOtTYOZHvWlrAi7UNRwG4sOC1cRDAtbdJ0TG1b8kS8AmhmizHdeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764446208; c=relaxed/simple;
	bh=+hgh/g0BnBWw+qpebLsXCl14iSXwIPV4LuJw0I8YUTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhfoIKQ6CxoHzZOYddIizX0l56LJTAbaHv709wkeDRkaczwGZ7KjbjaQLP2Lyjq4+nu9FtHmEmyrf5GfVYQ6Ny5PyRbiLyRSonV82N30cFJG0hJlclgOY8DPrP17W6i+qL8QDp5mdpBA6ljGOerrTHSBlThGRCHRE38k1UuzXY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt1EmtVx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt1EmtVx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b735ce67d1dso482627666b.3
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 11:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764446205; x=1765051005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3AMeoVRXqR0tzI1TxjtI8lh/zxUBR98DSX18SQBkvQ=;
        b=Vt1EmtVxKUdoFIx0UPko4CiJ+3uSzYLGB6cutz6raw12cCOUXMGzj1tlMjr16Vv87y
         GWFtObxCRluaFohRUSjGnfmGjPas1FU8dmQhsrsVM6g47DmQ/60JzIXsG1ZZvHed+wyh
         dlQMT5btQD/vBw+yLAQ2g6yLNkUbgbBflZvG7XM7zrIHg40XHGj+BGrwyPQZQrZeb7p1
         P1TcKNiX/2Eqdu/7KZBjlkABTgsVKLSbRqPTxCV1awDUs6kEdV/O59bsQdNw8CZNFJ4T
         ebtHTn9kkEW6y+7BYwaEa0McEBPSu3xKYDKObBjS1TLZ9g7g6EPQzEeOuwcsfmAplY27
         fbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764446205; x=1765051005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3AMeoVRXqR0tzI1TxjtI8lh/zxUBR98DSX18SQBkvQ=;
        b=m5gd3gZjMWAqDSkrHgOfLKXJrkY6rKwqCaoFeqiVpdNBhHTNWAZOjRWGgwjqqe5H6a
         1wS6fyA5deuL1mHSi5P/ezfxj0VF3aa/OBOMQa+LLbK3bRQZxW3cUwZZGpa+2UWVW8CR
         9DXjHu+ua0htAkFkl0bH2T4oXdt9QaexTmvcMPKkV5RlvbrGeAOLbCZzv+6CmSss4R7w
         86AdK9rJTYyVT4tiX1457rEFsc+FTAEMKBB2qeX2BC4YyD6oHWQ0MSZCaI8DIgFYMKTf
         YZwKCTtauhRtYFRzFWZTRH5B3578LARwXOB75vCx0TaVqA1EDQ+9W+CElZkrYn2VWaNt
         NPCA==
X-Gm-Message-State: AOJu0YzVzLvxfr6ig7w3fMywfsj6fieepsgTHwJvM6RAtz8llOxt3776
	RiogMZlSBb821uU7nJz5oUjhTUZyC7pa/qKEauOfo2pP/DtL7Cw9DAEQ
X-Gm-Gg: ASbGncuhROFtGd5unQdg36JAUvttG7f0hdNUZWyn8Okv4pRacj224flS/GM/1X65b5q
	iMVcay/z4Fn7LkLS49gtIj0oFiUkQuITT/6erXsMNJFcr9cQUFDJ8aX5oCINg6hC7R7V7DkErro
	W0/K1K4Kj4ChDw0cOxVgKl1IYFn3VUKX3AjFy6vXV6IqskEpqU18gRFvWgssc93oLumeiyNdpxT
	SeTQxXk8ND1JKFgMU/zHqZ2H4nhnCTh5mGs200Pexgkze3ajkvsQTOPInNmjeovoDmkAnsi3cPp
	fPCGUCbQz8h6Iy4z9SWpOhJMhehzKGzU6zHFiZdEP/77nDozwhmzPyZ/YqK6vM/rSqQxTSL/o2V
	y+z51S1QpqRgEoAfszL0FMa4g5AmI/5B6jr6GgjDG58tlphwNXsw6OIWx6y39Ox+L8AIpkgi9mK
	1WwT8+Y1eZQlvQeZdhWKQCw6k=
X-Google-Smtp-Source: AGHT+IHQ9zaUNVzgGxTzwCaTHRqZMx3oRsllkErV5jlogBMB6LB/zgVFb1daPizSnIDSerIbfOQWIQ==
X-Received: by 2002:a17:907:7f16:b0:b73:5f48:6159 with SMTP id a640c23a62f3a-b76c5354c01mr2103475166b.5.1764446205151;
        Sat, 29 Nov 2025 11:56:45 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5199852sm772266166b.15.2025.11.29.11.56.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 29 Nov 2025 11:56:44 -0800 (PST)
Date: Sat, 29 Nov 2025 20:56:39 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
Message-ID: <20251129205639.48fdbdf9.michal.pecio@gmail.com>
In-Reply-To: <20251124210518.90054-1-dylan_robinson@motu.com>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:
> The maxpacksize field in struct audioformat represents the maximum number
> of bytes per isochronous interval. The current implementation only
> special-cases high-speed endpoints and does not account for the different
> computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> result, USB audio class devices operating at these speeds may fail to
> stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> which requires more than 1024 bytes per interval at SuperSpeed.
> 
> This patch replaces the existing logic with a helper that computes the
> correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> used in drivers/usb/core/urb.c.

Hi,

Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
like the exact function you need. It is already used by uvcvideo and
xhci_hcd, the latter being particularly important because it ensures
that your endpoints will get the bandwidth allocation you expect.

The copy-pasta in urb.c should probably be cleaned up at this point,
but that would be a separate and unrelated patch, of course.

Regards,
Michal

> Signed-off-by: Dylan Robinson <dylan_robinson@motu.com>
> ---
>  sound/usb/stream.c | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/usb/stream.c b/sound/usb/stream.c
> index 5c235a5ba7e1..074a61215de6 100644
> --- a/sound/usb/stream.c
> +++ b/sound/usb/stream.c
> @@ -684,6 +684,37 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
>  	return NULL;
>  }
>  
> +static unsigned int
> +snd_usb_max_bytes_per_interval(struct snd_usb_audio *chip,
> +					struct usb_host_interface *alts)
> +{
> +	struct usb_host_endpoint *ep = &alts->endpoint[0];
> +	unsigned int max_bytes = usb_endpoint_maxp(&ep->desc);
> +
> +	/* SuperSpeed isoc endpoints have up to 16 bursts of up to 3 packets each */
> +	if (snd_usb_get_speed(chip->dev) >= USB_SPEED_SUPER) {
> +		int burst = 1 + ep->ss_ep_comp.bMaxBurst;
> +		int mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
> +		max_bytes *= burst;
> +		max_bytes *= mult;
> +	}
> +
> +	if (snd_usb_get_speed(chip->dev) == USB_SPEED_SUPER_PLUS &&
> +		USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)) {
> +		max_bytes = le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> +	}
> +
> +	/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
> +	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH) {
> +		if (usb_endpoint_is_hs_isoc_double(chip->dev, ep))
> +			max_bytes = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> +		else
> +			max_bytes *= usb_endpoint_maxp_mult(&ep->desc);
> +	}
> +
> +	return max_bytes;
> +}
> +
>  static struct audioformat *
>  audio_format_alloc_init(struct snd_usb_audio *chip,
>  		       struct usb_host_interface *alts,
> @@ -703,11 +734,8 @@ audio_format_alloc_init(struct snd_usb_audio *chip,
>  	fp->ep_attr = get_endpoint(alts, 0)->bmAttributes;
>  	fp->datainterval = snd_usb_parse_datainterval(chip, alts);
>  	fp->protocol = protocol;
> -	fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
> +	fp->maxpacksize = snd_usb_max_bytes_per_interval(chip, alts);
>  	fp->channels = num_channels;
> -	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH)
> -		fp->maxpacksize = (((fp->maxpacksize >> 11) & 3) + 1)
> -				* (fp->maxpacksize & 0x7ff);
>  	fp->clock = clock;
>  	INIT_LIST_HEAD(&fp->list);
>  
> -- 
> 2.51.1
> 
