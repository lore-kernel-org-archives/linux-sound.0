Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789279;
	b=RTQUQIdeqTv30l1uZ4hRTYJ+B1IU5XaXDrlcozQ8yrwAMcypn37Z7v+Zn30Q256Ll+jb
	 Zh2wHXX5nZNpMNzgFS9BKRgOGYRbkmvePkX73YV4Y6fvzSy+Fk9YtmtWFXlWeO6vuWY/F
	 C6kf9S73qU/7WEJKlr+VLKWlsPq/YlqFwgRy/HApWVJBo3z8GIRYiuUdySpbrxAPN7pwz
	 wcY00I1gzhuTbQZQOetuVBO01l58eVl/BDn0M3pO6QvVVKSmeaLNynOvQLtSbfOAJ4zfx
	 j0gCz7r/GHNOODXvdfArm30iLaZ2lK/H3YPS5mpYuQTZlk9RbceyjqjQe7tv3+9FGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/FhZ2gLZhVlx6sNQ93mhe7dJyMjd0gId+bxgk46J8aY=;
	b=jWiyjlvS262H7ut9T7Js/8W8pTs9nf5WMusd9x4H36MsHC3of2sAV+44zjkzMm3D8v3p
	 ePBGlVDFICWGwaC1g25jpUKrO8gEPfh+7/AvV0WNqnQX15Uj3sj8VQP80NiY3KltQ8p1S
	 w5jYB7RrIlMFlA6+S1V1LLz9fZrXeUUZq2/50QpmtZ3O2CvPNWI589kyCsbdYF84MD19d
	 x0Y5j49F+vbbs59yX865CrxuiyFlqJIaXFpf0fP121dwgrS9E9i5oJNzeEOcNk66DIsjS
	 4X7Z+hRCljya+Kh7kYBw+pKg454r1ITLBOqhop1IyHtv6+TNbX1xniswvwKf0vK1PMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bFkc6Km9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24BB606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bFkc6Km9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8336235e9.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792789276; x=1793394076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/FhZ2gLZhVlx6sNQ93mhe7dJyMjd0gId+bxgk46J8aY=;
        b=bFkc6Km9gMu+tBV4XTN8kkvN/8KHDDC2ym1PxsDRQs1yyXuBI1eI9Uh90kY7bOyv/j
         k00wKZBhSGWqqf8Gsz7Hf9rEKWXJsPEBZCBRv24Roco3FrcO0r6M1c08ZPilem6B/My2
         vzKwLaLz5svyZmHwqSep1n76CPZEKH39UEeS/4AN34aeptGw3k+ENP8jS+8lvvtOkwk1
         z9yZHDVZ6S9WbMkikRmW5zU+jztPUtyVC9RosB+JJO5LByB9PlwKku5Hqz1LEe2saszI
         6y4wUsjYGE3pvIalAyRAgygjPdKGU4w9r2jxWeEmv6WRtBG1bLsAkfax7eV8OJPuwPCW
         0CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789276; x=1793394076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FhZ2gLZhVlx6sNQ93mhe7dJyMjd0gId+bxgk46J8aY=;
        b=lzvRUVjRVSHyBL6VF7cibEu7bWVDfUbBVTs3owK7RJ6qpcLZUslbUnpac7IYWSDHsz
         aRQuHv3vPvO0D0KfO5fradtkLflh0pqU7OmYZrV1UnofJtKpmHYClgZBmr6ra+8VBiGk
         X4lSzzU+CiYzrEdueKdPWw/SJLpMUUhs1P2MSmaH4To2vDOb0VSZLhhmLEkRGQKLSOQi
         sIMIMQWI1AiQweS8fYoc5zVTs1WjgXBMm2TF2CPNJVvGF+8cchTsdmnvoAsqc1gvvDop
         D2FgOCnHF0U8ISBIZP9NIX2RsUILvtVFPXUi6eTCK0DS001vFEDZwmAydAoBtI8TfcpY
         uLnA==
X-Forwarded-Encrypted: i=1; AKwUvBy/mDkRoMlHEzIEXQWnyjlqNnU/MQyUZ2UNKCoPlhL3ppEp0Tw11FvYV8fXTwS/gVV7gDp9u4OH7KlAqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdo1wdjYIFVMOB21YIKov5Ro6V3TvgDR+YW4+Gvl6lU5o1msS0
	TB+zS/e6uaG819MBCS2pTHxMaxP1wf5UiHVnxHhs4mjMLsMCK98s1eQO
X-Gm-Gg: AYBFou3fPp/EHYIM33LyvaoDiNCWlYr3woCaPbVn+w+0RJeRKnqAtGL28HH2B0LV+Zc
	IZNHwRe98mb/0iFSX546noFI6LeAEi4obe/r6hA203WMUrdhVAH14ZfnA+ZsqlzTSpFz3qslCqY
	gOG09b9lJMbwAG806eDOWKBAF9N/K+VMlnvMVtXCMlGR7nbDv64dO0IIIgGChOgoHIfOlVXK+c0
	LpIc1ni+OluMQXZj5isNp7zENCV5fc1CpP7R7HrYNwL4ycMcM/Uv4E319+IuiUhUNcBZFEZzV4A
	l+X/RAr49XKgKm+lOQ4cCc1X5GSC5h4FQ9tn1b9mzMgTjaHafCztwg9JHFe4GX0TSrIItdh2VZP
	ehcaRo6H01bJxtef9KQ5zguycUxRR+GsRrwwfFxTePbjDPKBtIWEmZjoRWpA/8xauwD/dvH30DD
	eerYhiOhdBg7idflg0bnTwtuofTiYRsjoG4SZfBsJDVatg7kUduAdO+IsLb6PCRjJWlLVZCJKer
	WYTjisi77L8pv7iCJHHTyfvPXYSXpCHzZPgscqg/c/tF1L5lUbjGeU9WVgF/zEZVHPRPlmxpjPb
	dL+6d92xQeMW3iCd
X-Received: by 2002:a05:600c:5308:b0:4a2:86b8:7e9 with SMTP id 5b1f17b1804b1-4a35ac9d077mr1208455e9.16.1792789276136;
        Fri, 23 Oct 2026 14:01:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0a9cafsm9983885e9.5.2026.10.23.14.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:01:15 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:01:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Blum <blum@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The
 Capable Hub)" <u.kleine-koenig@baylibre.com>, Zhao Dongdong
 <zhaodongdong@kylinos.cn>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
Message-ID: <20261023220114.2d8af17b@pumpkin>
In-Reply-To: <87qzhg8axd.wl-tiwai@suse.de>
References: <20261022164013.95811-2-blum@kernel.org>
	<20261023194059.4e307a32@pumpkin>
	<87qzhg8axd.wl-tiwai@suse.de>
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

On Fri, 23 Oct 2026 21:38:22 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Fri, 23 Oct 2026 20:40:59 +0200,
> David Laight wrote:
> > 
> > On Thu, 22 Oct 2026 18:40:11 +0200
> > Thorsten Blum <blum@kernel.org> wrote:
> >   
> > > To prepare for removing strlcat() from the kernel [1], use strscpy()
> > > instead with the current driver name length as the append offset. Also
> > > use size_t in the multi-channel branch to match strlen()'s return type.
> > > 
> > > No functional change.
> > > 
> > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > ---
> > >  sound/pci/cmipci.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
> > > index 9d9f784e3a8c..5722b722da95 100644
> > > --- a/sound/pci/cmipci.c
> > > +++ b/sound/pci/cmipci.c
> > > @@ -2980,11 +2980,15 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
> > >  		query_chip(cm);
> > >  	/* added -MCx suffix for chip supporting multi-channels */
> > >  	if (cm->can_multi_ch) {
> > > -		int l = strlen(cm->card->driver);
> > > +		size_t l = strlen(cm->card->driver);
> > > +
> > >  		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
> > >  			  "-MC%d", cm->max_channels);
> > > -	} else if (cm->can_ac3_sw)
> > > -		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
> > > +	} else if (cm->can_ac3_sw) {
> > > +		size_t l = strlen(cm->card->driver);
> > > +
> > > +		strscpy(cm->card->driver + l, "-SWIEC", sizeof(cm->card->driver) - l);
> > > +	}  
> > 
> > There are all sorts of reasons for not using strlcat() and various ways
> > of changing code so that it doesn't need to do the string concatenation.
> > But replacing calls with strlen() and strscpy() is just plain stupid.
> > 
> > It has no benefits and lots of downsides.  
> 
> Right.  The whole actions look to me like a crusade to a wrong goal.

There are places where you either know the length from earlier
or can get the string all built at once.
Changing those does make sense.
Similarly changing places which repeatedly strcat() bits of string.
But these ones are silly.

David

> 
> I was too tired of discussing the same thing again and again, so I
> gave and took it once; but now I change mind and drop it again from
> the queue.  The other patches from Thomas were OK as they can be seen
> as optimizations, but this one has only downsides.
> 
> 
> thanks,
> 
> Takashi

