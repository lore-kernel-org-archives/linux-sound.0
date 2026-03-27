Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C521FF4D
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617725; cv=none; b=bubKpyA/7bW8UQEiVeCwCVCwPA54PgCD/YLyjyEC7bYj8XU3X2iFs6lavvst7eg5MFkiC4Dd8wiaCGOyMUeR11z/HMLO5JaTgelmLyZVt7ugazHgAEVxR3PdHaTIkjcaWB2LtwYx8YZEj0ZxYHceJyvrvQnaiZrbfUO3Hwoj8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617725; c=relaxed/simple;
	bh=qhU661/wzeRCVyJnpV0oxL6yo2BCSdYSVG9yuepBkeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFjB3igMmtktrPhAcg7v/kBXJ63exmjDvF3++BdM4UR1R9qPmz0+HpuxiqnB5H+nnn3NKLofciKU9Gu+rVn9BGZInNnx913zbv9UxAEdcUaEVI1tJJiGaK11ClWrcsf4B1w0bE+9eH1taZpZ1rEeszyzrY8USyjwNun835xdxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTsYiWU2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTsYiWU2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso325985466b.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774617723; x=1775222523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVXxpx97e4D7ri61A8B6ZuELHHvFW02wBp882dzy1Lw=;
        b=RTsYiWU22N6eWQJuol0KG7Llr00JjmYEIqaAwHrzqGFyzoHjqVI+EbnWV3G+8MPBDf
         MhZ3h3NFV56+G0TkNy7rxkk6PHPM1TyUm5ie1ghKIRlVnr3opwnTVZ6ibU3mBe/9pu87
         09ngU8tZLw7VPS8pvORKf76YZ3SvwMKtgGHBGMxx6TI+bEmNAAjaNwb0LeDVIJo2lnKs
         M6xgR6O/rud2scUxNZQsbxK4NK/cSfzMUKWEh2z5HVnQbLT04NS2JF5380iJcRlU+SE1
         BzdS0P0W2ipDJ7HjVbCRWwzyDcPykcJ0ngHnAq9IObDpAvw8VXH/buqclvC19WKNIrkF
         qaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617723; x=1775222523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVXxpx97e4D7ri61A8B6ZuELHHvFW02wBp882dzy1Lw=;
        b=JeCIPIQCwKRjGWZPzaDigs0SL1RO3ekrnc4aQRMWhoUpEgqgP8EpDxKQuvaLcPn8rH
         kJxoDR0Uc1N/bwO+/Nioc46WqAz4V+a4eM9cEdo+MwZAmvYk7cJH8l0hvuJLxmvppDtM
         C4WxgSfgXtd3D0BPgLwA1wpUmP1KEUPfNCzd73F2Ecx9gl66fthREHBEsXGRPTOkgmRP
         2v4lfrQbRy+2ncgnIELkCj8v2pIpTxGnRWsGFLR8crb/WJjOW4v6lZuJgYJzOeNybm3U
         RFbcp8PcWRsbLqGffVPePhldYraqHAeTTSoas2OTLROTZDVmrMkJUQcZblKnshvrV//d
         sURA==
X-Gm-Message-State: AOJu0YybmijNHF0PNmXgbv1POT9+tin5Ha+Wk9EV+ymXMxE8nlduweUW
	6DdnxZ8uFtF/Wo/Kt9wFGr6U2x2Ys8uVWw/hAH6lXG6hjft6NvsbM7rntPwW6u0m
X-Gm-Gg: ATEYQzy/S6mcanjzK4RcJ5xeOb0IbTkntvaoxfjOUzscUimO4yRc6CPPPqz7Zsd9qU9
	4/ekKH+El9hYOS+1DAK0YjpMvoUmC76AZkQec+MSN8ApGiGBfbDUxyPA4DYtVdCaD3hin/AIrDr
	U1T2s7ocLkSIoCIF/ld7MOTMQUQPq0l7b17F6YLurjAlahiDjes2nFaZH6aVxoZb85vn88pMQEp
	eD6+jnO1q049qHc5io5eo6GKPZjpPnljwEC6NpnqB45LvN0MfKNiP5V9ZC/qpXyffzApL0EHduc
	wJ4UDnBMjALycbframmIn/Cn5QR6x+S3tgDRknMqR3gtcORGAYGI4kJcr2z7Sixhfh6SIaf8Q4S
	TLUL7ojkAdiw7spb/JGionpQyAVHedVHdZ0TpRsaQeJyZBiAkHx7Pst1IzO6fqt6KPhXnTEhfik
	V3gTxyFWIjR7+rYHAXS4TbOjOKHv6tCIgkDKfi
X-Received: by 2002:a17:907:86a1:b0:b97:bd6a:470e with SMTP id a640c23a62f3a-b9b50169c49mr166618166b.10.1774617722457;
        Fri, 27 Mar 2026 06:22:02 -0700 (PDT)
Received: from linux-workstation.localnet ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm15832257f8f.8.2026.03.27.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:22:01 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA:usb-audio: Disable Arturia Audiofuse 16Rig
Date: Fri, 27 Mar 2026 13:22:01 +0000
Message-ID: <3610608.LZWGnKmheA@linux-workstation>
In-Reply-To: <87fr5lqx90.wl-tiwai@suse.de>
References:
 <20260319143212.149090-1-willerz@gmail.com>
 <20260319143212.149090-2-willerz@gmail.com> <87fr5lqx90.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 27 March 2026 12:20:59 Greenwich Mean Time you wrote:
> On Thu, 19 Mar 2026 15:32:12 +0100,
> Phil Willoughby wrote:
> > 
> > There's an out of tree driver which works for some use-cases here:
> > 
> > Link: https://github.com/WillerZ/arturia-af16rig-driver
> > 
> > Signed-off-by: Phil Willoughby <willerz@gmail.com>
> > Tested-by: Phil Willoughby <willerz@gmail.com>
> 
> In general, we don't care much about the out-of-tree driver.
> If it's upstreamed, of course we'd love to help.  But this kind of
> change is no-go.

I'm happy to work on patches for an in-tree driver.

It would need the patch chain you sent me that replaces the
hardcoded channel max with MAX_CHANNELS and makes the channel mask
64-bits, because it has 34 channels.

I'd also need to add one or two new quirk flags or device-id matching
branches: which approach is preferred?

Phil


