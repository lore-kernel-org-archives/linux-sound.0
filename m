Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172667;
	b=eKI2vYnRYuZkULJVPjCd6t80rWaz+XHMlK+uE6abeIrg7ypb6/0Xu5Y1qkTyxKPM7biL
	 bUjnv0jpRWwYRo2lMa8/aWQOVCSxOTbCpod4hKjZCqkgtyIgn+ua0rLkjzAR3Sb/rxTVX
	 QA7bHELp04AE4PdR5dNDZ3Bx9U1XkDxvAkNusfscogJ2eOlZors0UZ8Yc3ZFYg55fhEZ0
	 lHI0Oc1OoFqi21tiRvxiya3lIzSR7nVgitHXdMdxeND4q9UKGye8nUiaVWKN5qwnPFvTS
	 fKO58WFaQ2H27jmWKo4nLR3yux+8MCktkU/KNuIX0hCyfWY8P3IKcwvescHnT+ScCGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ao7rOsKShLgiCy/N5eSfutkWueG04r3VMlQ4Gl+RlVM=;
	b=BFrjAyweDwUtaRenxTDE1O86P8N2s6yHOwQlCb8Di6q57hB0fswsYdHu3Zv7/xxsdvWB
	 /BQ/Wave200cv/NYLI5J88I0ZBbVhV4ssNPv6lixleQ9+hrPsmF6FspzcUXjbUMY4ljXj
	 Vbf3X9jfFl+YwupBLJ+wwEbTyH836MKzELlmjD0n1/IrXBOwyKvc2VYyae1M3AFvuRlPy
	 Xke/uXM6222TOi1kQy+oGqc4mcPdg49GqA3atNRMXPF0RlISp5Whl7MZPHvkZ5b6S1D4J
	 QDWYaHryshofJrm7szbTTmbk8GHtoF6Bm2TIHydegag/s3MO/ZhA290VG/1PT+p5vxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B4VcI/HY";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D5E606A321
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 21:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4VcI/HY
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2035645e9.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 13:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172664; x=1794777464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ao7rOsKShLgiCy/N5eSfutkWueG04r3VMlQ4Gl+RlVM=;
        b=B4VcI/HYe8DP7SjkI4HsU7zsiZQRdb8IaH86C81zOWQUFX8B+gM+n1LvK0ZiImpPNk
         zLffxuZf4rc5u0bXo8Dt/cXxNIzhhC87W/Hdp/uO6ttqK/Ow8xFWCUVObZPPThub+SIe
         4PQDX/2mf5jQlnuoWpf4V+3zQ94mtRl+LUznqz9wiRRL5eAp7x7F6uqwI0ShVopbbuSw
         nkD6/Lp7sdlM70Bo6t00X7mU1sf25fGWpSIo8va0Hn0lIK6YMGxmZSn9O/+42CiYzmjk
         +lN6WOGMEMvcgpXXKpeMeqTAxjdZTZFpfMmh3eURJ+ue6a0ZJQuuVQxA7RxfTHw278ga
         C7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172664; x=1794777464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao7rOsKShLgiCy/N5eSfutkWueG04r3VMlQ4Gl+RlVM=;
        b=iLqSdG0JBkq7/zgqlJR5XfaR/gqMtKRfGy37mEabN1yTtmdSS8onbpj9onHQypBc4f
         DTEkOtL50BtNd24q3tr5l9lEDNKM0zf//+/WRWC7UDJ9SP/qHHVCH9BKJsRlEdupMrxw
         vrFRz000BnyLn0+xng3qjrrTki5Em57aELF4s4x5n/5jKz3SwiSsuskdYFuSRwuOX9+q
         WADuen3mKxwHWCVmIsJNzlGUlo4Z6oHIrCHtKqJhxZe+XcH1Q890EinfBzbOjm1J5aXk
         smQ/3j9Vd3yN7DS6R4TCjb3yJbNtFbh8kVGiY8ocbW+IGxe/wu5o13wUUpf+fe1gn1L4
         japg==
X-Forwarded-Encrypted: i=1; AL+hErEvdvqPYyxvR83AdpDRSjjrqVRczKigZrypgurFM/dknMUQSmYc+uA9/cQGGpTdGe/VV/dChx9NZoJzkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NP+mn3nAJGYNQAkLjUiQc2ND7+jTOorznFiD+bmNw66y1Tqyv
	dm9gTAPyKlinOI2JNGFUJPJPACuXfbUlZCYcoHLL7I0v/osFnAOe/VRr
X-Gm-Gg: AYBFou1Q0ujblJFe7unwh8zmn+bmvr3njPZLBkzyF5jdcfKzZUZi3JC8dDBe9OnVRXk
	O4F2TPvkaWeYGQ67bGCtu9KzReaKc99MLV+Au1m2a37H6Jj+HEsns+JFN7Ko0755qg8mo58PGfX
	YldWggQ5hre84FnH9BHlUfWxtJoaMLodEjyIQDLjyoUirNOeJJSqZvkNID44koU5mdp0OclAAff
	yhmSECDDHazMThCu6Dro8SNlGPDRhSSjUwyyjFI67dBreXjB+XEOnfTJQYpt4PsDInevXMlZxGl
	ufgyp5C2iBhsGq0gh4I70QXcmejJncogf9BaPiIhw/DLuWZiIcmkgbqNOLcnfHun+bF0kmhfccg
	oGRPT4pITPCvHSVfrlkipHNPJTL1pHfY7ZvO76IuAYXudBfa2qmpx8vZ06rnU3H7R3BP3NPwPoJ
	fk3th1WXXrUdXv4OKCsvj+G9jXNWbLLWeYSQpG13JpdK2ybH8syJprHyPt4Ks39G9bIRXYxGmGI
	DmawgMBIL57qTdqSH2xBZH8Wg8d5iN+RCBLdQKAhL94cUD5vLgv/bMZ7Fw8hQThg1x3N4CscKnK
	R2rRa0ifAanQ+o47MCVgOmdwwlWk0avMYNiIegdm66GV0zzuRzWch33Uek3lYas2
X-Received: by 2002:a05:600c:8b33:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b963c91287mr40478955e9.20.1794172664282;
        Sun, 08 Nov 2026 13:17:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm299322245e9.0.2026.11.08.13.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:17:43 -0800 (PST)
Date: Sun, 8 Nov 2026 21:17:42 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Blum <blum@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cen Zhang <zzzccc427@gmail.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
Message-ID: <20261108211742.18e4fcf9@pumpkin>
In-Reply-To: <87ld74yc19.wl-tiwai@suse.de>
References: <20261107004338.323417-2-blum@kernel.org>
	<87a4nlypdt.wl-tiwai@suse.de>
	<au8h4SDC6fKaY7st@kernel.org>
	<87tslsycva.wl-tiwai@suse.de>
	<au8uNTlz49yooqNf@kernel.org>
	<87ld74yc19.wl-tiwai@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 07 Nov 2026 15:02:58 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Sat, 07 Nov 2026 14:57:09 +0100,
> Thorsten Blum wrote:
> > 
> > On Sat, Nov 07, 2026 at 02:44:57PM +0100, Takashi Iwai wrote:  
> > > On Sat, 07 Nov 2026 14:04:33 +0100,
> > > Thorsten Blum wrote:  
> > > > 
> > > > On Sat, Nov 07, 2026 at 10:14:38AM +0100, Takashi Iwai wrote:  
> > > > > On Sat, 07 Nov 2026 01:43:37 +0100,
> > > > > Thorsten Blum wrote:  
> > > > > > 
> > > > > > While the current code works correctly, replace the unbounded sprintf()
> > > > > > with snprintf() to bound the formatted string to the str buffer.
> > > > > > 
> > > > > > Signed-off-by: Thorsten Blum <blum@kernel.org>  
> > > > > 
> > > > > Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
> > > > > compiler warning.  
> > > > 
> > > > The only difference between snprintf() and scnprintf() is the return
> > > > value, which is unused here. Both are correct and shouldn't trigger a
> > > > warning.  
> > > 
> > > Well, not really.  For this particular patch, it doesn't make
> > > difference, but in some cases (like the use with %s), snprintf()
> > > causes a spurious compile warning with W=1.  e.g. try below.  
> > 
> > Agreed, although that's a different use case from my patch.  
>  
> Yep.  I guess a warning is triggered only when filling a substring
> that can be large into the fixed size buffer for now, but it's a
> compiler's thing, that can change at any time in future...
> 
> > I don't see a warning when compiling my patch with W=1, but I'm happy to
> > switch to scnprintf() if you prefer.  
> 
> I'd like to bet for a safer way, so let's go with scnprintf().

At some point someone will work out why scnprintf() doesn't generate
the error.
OTOH there really ought to be a way of telling gcc that the overflow
is a false positive or you really don't care.
Doing some checks with the result stops the warning, but a (void)
cast doesn't - much like it doesn't stop a 'must_check' error.

The real this is it that it is somewhat pointless.
It basically assumes that any char[] might be its maximum length and
any integer its maximum value (%d needs 10 characters).
But it can't report for 'char *' because it doesn't know the length.
I can really imagine people breaking code in all sorts of ways while
trying to stop the warning.
In particular code might start trying to 'exactly size' strings instead
of using ones that are 'really far too big' (an on-stack char[4096]
really doesn't matter in userspace) and then getting actual overflows
(or memory leaks) for normal data.

David

> 
> 
> thanks,
> 
> Takashi
> 

