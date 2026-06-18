Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976F29AB1A
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794517; cv=none; b=JnTMYf7EIvpRAAjHKZTIEEZZ3yr62qYcBBzZxYxNKD4XAa5hmqO+yOw75BUXUpmUxfKD6vDka+CTY7JeN+Y7FyH7oZ6nXdb5jsq4ig2E9cclRONxKtjKhTVAYYVSkDGd8gRTCgV2kPcuAvQOEgkewrP/qN1c3E7B21abOL7+5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794517; c=relaxed/simple;
	bh=ncQDyjHpYTAeOOgc+qVpOoFR4WfPO+jdJuHeUmi09dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpRLO17CYqpj/sMfc2/IGjdXxs0wVyVX4ITDKWZhhsqP3dd1eHZ3c4sx/1KLmW/IzQAFKWFIIl5FlEq63sDdtkAz9dKNWYsq+Rx1cKfPWoG1yRmv40dOT1ru/LC7K9bOQ7Q43zFyQTmaZGPJwRItqBccgg9X51tn7BVWCHsuqb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpINyJa6; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpINyJa6"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7dc6fbf3e86so15796197b3.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781794515; x=1782399315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hzrwg+iAunk/pEbZDxZD+LDbqsEqpxl5z4yULJLoqU=;
        b=SpINyJa6UqaiZc30wGZ3IleCeaWThykWaRh2OaTYU4RgVFp88B8jg9jPkizd/q5EoT
         GPYhPymKixkqS5BRpfFsbTDu8vq7S6muwmwW+H5v231SAqpXe7k5fI/M4vujYUd/ICLv
         rbUSUhUg0I56mZeF+ei8yA8rD83Qc5O/8U9HUp+yabV89X4hLWXBMeofwoOS1NgG9nu5
         t5tsqGQ5HZtiWR44D8HI8mfue95wUnUXjaJJZ26YB+3Kl/ZdvtoLzaILZhArOCmwFfBk
         9RXZ/vLkIHXkFYiojPabUQMRT7kEwZU3sotZCZHMgdtR5DlGgigZOPpVFoPLSZLWy+9D
         KbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781794515; x=1782399315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hzrwg+iAunk/pEbZDxZD+LDbqsEqpxl5z4yULJLoqU=;
        b=TYmy07N7BhWLqQK2ks4HT8bIIrwQUAI+W8rPjeVX/Kr5D/Yaj+paIowt/lCvcwWsaN
         fx8xK8H/0S8FnYI1VKDcwfqw7RVvsBDtcGOMBfDrY2ow+stSqD3g17bhAH0Ej592tiMP
         ftz5lZKcI02I6QIQmHm4/cRvFUrVVLtWngiQOdbFXj0O4tiHP+fYV93R3IGpe6ivDzeh
         B5fLkcBbbjh0mtrRkBC9xJ5ci2dy0ZsMhagkz2NO7c+8juWvAwTdeF4smwgUdApArl0A
         hUhGOwjo4tv/+R1w2kAXa0REGSg85ewcwPRQQLQkK199u0xgZwWVxCIZzJ1cAciqII9h
         cM/w==
X-Forwarded-Encrypted: i=1; AFNElJ+izwX/AdGL2C+werWg9QsqzEBE6wMj0NDavaS1MT+qABy9fV/5iI5vc8mw2Nt5QIb/jqa+Wt/WO+YvHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0IvuWXM61M7YRqkgJ6ia0dEZG92tucaVPgBg/KycP6H4H3pW
	dR6j43yor1ZvF7r6T/WjkdotifhDNAn0uuCBmNDA4uVMfe1Cwbwx0W3E
X-Gm-Gg: AfdE7clc+23ZU8JNSR8gDdmbydyj7IK2uCOCW9Y6UotpmLPszfdRooEDnOh8LDF1NGh
	Q5LCOfQGsvNxpDnMKQv1wy37YqhZcL7jjbK48MDOk/H0snqbGYEfigO3cDtSA618YpveNSZfsT1
	uHkNOQg11pMPy55xPOz2HYh+DvSjBIbm/Fdzo4bO6mVsxHy8g3Ys7vPGn5Yub7WSA99wroEVzKZ
	13hpEO0jiZJd3MCSxIO/qQkPt9vWBVIO2bE/PQacSSTw66iPuSK96R6Rtu8XMV+Pv8yxLhBTTs8
	C1XXtKuznz0NbDBizlp1TquTDPZeIZH451yEQddagffGCJf/TRGAUqfMQPZ7M3GsCkFeZaGXM8K
	c1K3kxi4jKVCP+4eZujK2IqaLsXFcVP8PlJTzObDtTlTDqMbWV/EQLHC7ZVEH/v0ZoPM6Rxl+TN
	8ZkLHRnNAgw7jJQ+gwfRLRPYOWKq/iPAvR96dJww41gqHhLGbLlzl1HokerDuy+f1QYHFf70xXO
	dFy3p7yE1ZJnmLp
X-Received: by 2002:a05:690c:7403:b0:7dd:3f36:59e3 with SMTP id 00721157ae682-7fe5de9ccfemr97542467b3.36.1781794515180;
        Thu, 18 Jun 2026 07:55:15 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7fcd3c3d307sm70520887b3.47.2026.06.18.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:55:14 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:55:11 -0400
From: Frank van de Pol <fvdpol@gmail.com>
To: Julian Braha <julianbraha@gmail.com>, tiwai@suse.de
Cc: perex@perex.cz, ramiserifpersia@gmail.com, rmxpzlb@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ
 controllers
Message-ID: <b2hn56c75seqh3d46fai5p4pwzsjwum526pdhvik2s3bsjgzvh@t7db45vod257>
References: <20260617203937.1273852-1-fvdpol@gmail.com>
 <20260617203937.1273852-2-fvdpol@gmail.com>
 <f6b5a124-63c7-41ba-b268-ff6e76cfe57e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b5a124-63c7-41ba-b268-ff6e76cfe57e@gmail.com>

On Thu, Jun 18, 2026 at 11:53:33AM +0100, Julian Braha wrote:
> Hi Frank,
> 
> On 6/17/26 21:39, Frank van de Pol wrote:
> 
> > +source "sound/usb/jockey3/Kconfig"
> >  
> >  endif	# SND_USB
> >  
> > diff --git a/sound/usb/Makefile b/sound/usb/Makefile
> > index e62794a87e73..1f045c00dbc9 100644
> > --- a/sound/usb/Makefile
> > +++ b/sound/usb/Makefile
> > @@ -37,3 +37,4 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
> >  
> >  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
> >  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
> > +obj-$(CONFIG_SND_USB_JOCKEY3) += jockey3/
> > diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
> > new file mode 100644
> > index 000000000000..a1ac80f04450
> > --- /dev/null
> > +++ b/sound/usb/jockey3/Kconfig
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config SND_USB_JOCKEY3
> > +	tristate "Reloop Jockey 3 support"
> > +	default m
> > +	depends on SND_USB && USB
> > +	select SND_PCM
> > +	select SND_RAWMIDI
> 
> The dependency on SND_USB is unnecessary here, since the:
> 'source "sound/usb/jockey3/Kconfig"'
> is already inside of an 'if SND_USB' so every config option in that file
> depends on SND_USB.
> 
> - Julian Braha

Thank you Julian, good point. I'll update this when I'll prepare v3 of my patch for this driver.

I saw that the Sashiko review / code analysis found some more issues I
introduced with my latest changes, including a potential AB-BA deadlock
which I want to address.

https://sashiko.dev/#/patchset/20260617203937.1273852-2-fvdpol%40gmail.com


@Takashi, please do not yet merge this patch. I'd like to do more analysis
on the Sashiko feedback and further improve the code quality for this
driver.


Any further feedback and suggestions for improvement are more than welcome,
best regards,
Frank.
