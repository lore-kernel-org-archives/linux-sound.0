Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BCC30BF71
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755627023; cv=none; b=LLRFyrr1a5isxs8W76kwRRCRhWq0myPH3ihC1YGcH0r00ouMTICD2E9jixIG4z060GBFNZwej5xfTKZ9/wcXJYYzo/rnQAoMV5gNI+xywwe3qwXiRGmaJ+pce5vwhGdQ/XiaPmC+/CgzNdesZLiUyLAatZs/Fw6kNbkjh4CBUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755627023; c=relaxed/simple;
	bh=kuNJRvnuN/bVFQuEWuPFIuTLDNlARqPrsmYpt8pxIJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4R+IxqxyZXY69gdZ4LtGuo8DPNPoKzThxvbeJx3RXnv8dJ/unOczNypau7c6CtKSWoo40/2xe70JiwpmhBryRA40l68U+nt6uQ9/8BbeGl/DJ0X7UfpEw7Yy05qUvKzzt+gxsj79i4/3N+rhr84YhjB0tTkQO01Ko37faUj4gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oWJPyUzO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWJPyUzO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0b6ac4so29476555e9.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755627020; x=1756231820; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJE8lHJlZMiSJCzhASu/N+ZwF8MaTnDzUgcRp3P7wNk=;
        b=oWJPyUzOlN4HAeOwmaqkJbQbwd1cG8EUf7RdN+LXwvwxGXpUUtANQTlPglqvScBSYW
         liRUXJRRLFQJ+iLmrPhUQTRw3IxcWzRJqa4zs+FvrkPTyXp+/DXY765tQJlJEk6n7ILA
         wBxouiTbwjY0z8t4N4iWYt0fM+bxrXZEEnL6By1BkbV3PmWmsOBil66k9QHI82QyYDTh
         NnxUf64xxam79FXXyg2JMpzcisgAfxVPAA/c+Yyvgeh3DXjEDa44pfyI4Ma825tVgHY0
         PI8liOB1rmGqlzh40Oq0+WLtLPjBrLk/pEWmFTwacmps/ohxLNnK6L0f8XfVy4BKapaF
         RA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755627020; x=1756231820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJE8lHJlZMiSJCzhASu/N+ZwF8MaTnDzUgcRp3P7wNk=;
        b=eE90FDZnqkisJsn0LAixTKF319eGg6khHV+imSisJ8a45aHW7yS+BxIWFlccKTu78C
         RddawjQCjHqbO+FGBYr74mb2cHM9hoeOVTtWMIyQCklkrKASdyeFAtUWsYyWZiKrI/ep
         KYkW2GQw15qWuOCB3eVIDjknpwukYPbx90zLVWw7srhUn5M2y7F/SXIEc4ahnTsKf55h
         fHPonU7p5BZUa6moMHiV2BauLjmWyyOSe3ok9CDOJaWubYrTyQr/SSjTgG/mCiIBhlXb
         VgGA5LNP8H5aEHOfNqUAZjlAQUQtmCMBcBbPXFAyV+3FSmt5+Jbl+m7P5BEqE/t8cXBB
         +jqg==
X-Forwarded-Encrypted: i=1; AJvYcCWWMt61w1iD56g/9rntKy7Kn1at55irSsZVrLCKnTYy4DMd/D69XAV9UfWnHNnwx+/fg7q0vO+jeWauAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMrDFACcGbo3VL/0OcXRVmC0gkqkd7DiN2vBXiwAcUeUfoAjt
	ii6R8XlnBhrqxW/p/il7xiENS/bKhq0vwXcC0tG4Rpn3IlSLFyVy2NFJ0IiDQtDf2+E=
X-Gm-Gg: ASbGncvZJtXOsQ4we3/7dwhpI3raaDSUQcewrg2chDbbG9zhYKhkYBxXDsF3397isbN
	6M8fMG7ODZ63Nf6HdyiH4lr0/w32+E8/cWrjawq34YP4WQF5rVh/WpG9PBteudZ6fvMLafCqwLY
	xHCayv1kxLajQ+7uCs97ngY6Zn7jzcNWRAdaWVDKbSuMp/jnjA87g2AFiJl49QvUq1qedj04FEP
	pKdI0cUg18oeJkDyvBZVseRPgnWC+aS/oCfPdxMZGPHdJLOvJyR07dgwFI9u8Fj1/eQq/s6c1ID
	IuacpHNn/6fY5ykiotC+wvrJ2yfnpt0g/XHJwHcbuy6EQ1R9YCgHbLwXvlBv469PHzoIT9J8HNq
	k/lXyDqCMcFHZRocSI2HCwJbUmc3xucX3ND81SQ==
X-Google-Smtp-Source: AGHT+IFyHk8mmEI+TpEqA6cIWlRXNslVPoQY2NmHYpNY6v+LH4dZYi3eOnQH9PMTCE1vn0vVN+xiVA==
X-Received: by 2002:a05:600c:468d:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-45b43e0bbbdmr32598415e9.29.1755627019687;
        Tue, 19 Aug 2025 11:10:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b42a771d1sm47286665e9.7.2025.08.19.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:10:19 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:10:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	"open list:SOUND" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: usb-audio: us144mkii: Fix null-deref in
 tascam_midi_in_urb_complete()
Message-ID: <aKS-B6O8ZEAN_X7x@stanley.mountain>
References: <20250819173831.30818-1-ramiserifpersia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819173831.30818-1-ramiserifpersia@gmail.com>

On Tue, Aug 19, 2025 at 07:38:30PM +0200, Šerif Rami wrote:
> The smatch tool reported a potential null pointer dereference in
> tascam_midi_in_urb_complete(). The 'tascam' variable, derived from
> 'urb->context', was checked for nullity in one place, but dereferenced
> without a check in several other places.
> 
> This patch fixes the issue by adding a null check at the beginning of
> the function. If 'tascam' is null, the function now safely exits.
> This prevents any potential crashes from null pointer dereferences.
> 
> It also fixes a latent bug where 'usb_put_urb()' could
> be called twice for the same URB on submission failure, which would
> lead to a use-after-free error.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202508192109.lcMrINK1-lkp@intel.com/
> Signed-off-by: Šerif Rami <ramiserifpersia@gmail.com>
> ---
>  sound/usb/usx2y/us144mkii_midi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/usx2y/us144mkii_midi.c b/sound/usb/usx2y/us144mkii_midi.c
> index 5759f6010..1aca38f38 100644
> --- a/sound/usb/usx2y/us144mkii_midi.c
> +++ b/sound/usb/usx2y/us144mkii_midi.c
> @@ -41,6 +41,9 @@ void tascam_midi_in_urb_complete(struct urb *urb)
>  	struct tascam_card *tascam = urb->context;
>  	int ret;
>  
> +	if (!tascam)
> +		goto out;
> +
>  	if (urb->status) {
>  		if (urb->status != -ENOENT && urb->status != -ECONNRESET &&
>  		    urb->status != -ESHUTDOWN && urb->status != -EPROTO) {
> @@ -51,7 +54,7 @@ void tascam_midi_in_urb_complete(struct urb *urb)
>  		goto out;
>  	}
>  
> -	if (tascam && atomic_read(&tascam->midi_in_active) &&
> +	if (atomic_read(&tascam->midi_in_active) &&
>  	    urb->actual_length > 0) {
>  		kfifo_in_spinlocked(&tascam->midi_in_fifo, urb->transfer_buffer,
>  				    urb->actual_length, &tascam->midi_in_lock);
> @@ -66,11 +69,14 @@ void tascam_midi_in_urb_complete(struct urb *urb)
>  			"Failed to resubmit MIDI IN URB: error %d\n", ret);
>  		usb_unanchor_urb(urb);
>  		usb_put_urb(urb);

usb_put_urb() is still called twice, though?

> +		goto out;
>  	}
> +
>  out:
>  	usb_put_urb(urb);
>  }
>  
> +

You accidentally added a double blank line here.

>  /**
>   * tascam_midi_in_open() - Opens the MIDI input substream.
>   * @substream: The ALSA rawmidi substream to open.

regards,
dan carpenter
