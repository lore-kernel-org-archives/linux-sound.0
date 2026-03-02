Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1F3909B9
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490830; cv=none; b=fHl0BanL6e7r2nL35F0BRkE6y4W/nFN3lF5BFxJVqI+UTNzehrty0hcbxUuscyv1v/Jm61gaKJtTScZ6NxLkFUgLOX0h7XrL30RwfBfy5xAjEzu1Bu02aTin15CrZpNkicUA0kaSFWpilwpNfTUOY3clH12Xck5iXDWtj8OkV4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490830; c=relaxed/simple;
	bh=DbxDysGBDAfn7jxE/xCmO94kBp/DjnKbpJy4ybg3nYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eION3U4mxeSGfyaOOdHXYJuEQ35S51KaC3Evla2m+PoZg+tNpLAhjY8oc2k4VDosVtNCsRVgcwk5SxW43+AqbMRdYSXf7tbcFNMIK3Gu9gg3rLNwWsGcamxUBNEjFlUzzOWlQhZlDWpfdkHgQMFI/lteC20w/UZgN6io/5HRvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQmEmM7D; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQmEmM7D"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9361c771e9so790066166b.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 14:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772490827; x=1773095627; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=unrd9v9Hp/E9pxUEuAksZtMa8wpXSjo2kYKtQs7qCV8=;
        b=QQmEmM7D9w2y28m123qYFSba1I/qxCoOF4KcSa/l76OQQylBzOYFgQeiRQgS3hq3oU
         CbLrglBpaoVu0fmC3DmYtdxwiHm2MylJGJCjLK0WJKesQylaB8Nfaifyffwb4TvruKtw
         b9FZUVOFiW8jcrvBJxIP0rSBasMIydYCEr+ij6XMbcZklCucF7XSv9tbx9y/gC6fARoS
         6H+y7iRXdJMeTobSFJLSzPsp4+xaMitehC/mNlP22OImozOE6gv7KC6b82d7yA6zA6xJ
         /Uw2FSNi+WXuYoMuDDjdy30M5TTRU+6KfubEiMn/n8qHoUAQTkSVJjmwUC0THtF4SHxz
         NDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772490827; x=1773095627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unrd9v9Hp/E9pxUEuAksZtMa8wpXSjo2kYKtQs7qCV8=;
        b=S6fGtSIe5QzpeTVlV5/JKgZvXTlw1ctC4sEkfcyGEJtz9DJKw+maNvnxzRNgq7b4bU
         4+XOiLUaiqQgSLIcMg7sj0pf7hxCurzpn78a5XAjqUCNwYEPGTuxAxcM1fMdRwUF2kY6
         3s4ic+4UWi39V5pH9LACmaGuV2BSEZIbecnapuYmu+waYq0Ssd7+pdQDO56WAveSFljU
         CPQqZ+ylwIu9feFcBsy8nvwv4v03/UVXXiKLr3h4XkPx3CBQYoCiaPdQoZ1ip+U9W9yI
         Z88qNbmi+15vfbV5wjd7hEqLKgxEnMYJxc3Uz3wn95BABQXYLJhW6LgnzvasCtgclkjU
         Cvsw==
X-Forwarded-Encrypted: i=1; AJvYcCWLIklfNoROcKxwjUe3RWWTx63UNgv0kqZjlnteclgEsdNWnZ+/SbhNkX3Pu9G50kek/miIOOJhelXbAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAxXLHAB5ewGvjOtJcAMPV2OLFqaKz0g6T7kUcqMXVki1ANTL
	H+fDwN719kpqIV360d5W9GC1eGi67PbYxQDwqk3kN6bWLznnjHgSVaCs
X-Gm-Gg: ATEYQzwTQbbzbtNgOI6uO+LrSOvm/TWK43egv5JV2/4PtPvq6z4l45VEyREZCPPX2Ou
	sHGB6pSfbRlnJH4tYO8CeS4LXbLTH23ERtmpH22Kg5qBDBTDmouSf/N7vbJlRfdjfOBibjpvRom
	2mY25P3pH94TVC1crnRqs4+sV+tM5Sqc5MfsP2QZExORTaoqf9P5dsKf9SuvDKlDwa2n/F/YWMk
	3MDy/iDyIFWP52WZJGdFKqrQHDbES4fNPgzHemduaIEevYKxbkdOTBi4ksiaFuQYQMs7Tk5P2bI
	Gh8TteJ2hDJAnaOyeGGt603do3ja782nultTqc8RfhmhxSHfYPNZxuwKSEB06y+fQYCziyHvh6Y
	eE6ZJpwyvQyTgR1+Ldh0+Arcr4o+Ju0SUjL8GD06IBJjl1KoDG4OZhQGRKjJF57oYkRsgUFL603
	rWgeP0gmq48FqS4g==
X-Received: by 2002:a17:907:94c3:b0:b89:9631:2425 with SMTP id a640c23a62f3a-b93763af2d2mr951582566b.19.1772490826860;
        Mon, 02 Mar 2026 14:33:46 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6560asm534337966b.43.2026.03.02.14.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 14:33:46 -0800 (PST)
Date: Tue, 3 Mar 2026 00:33:45 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
Message-ID: <aaYO8_i0f-5s3Nsq@jekhomev>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-1-adcc7ed40985@gmail.com>
 <e29bd016-b8f4-46d1-8cfb-ace4b2512082@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e29bd016-b8f4-46d1-8cfb-ace4b2512082@linux.intel.com>

On Mon, Mar 02, 2026 at 05:54:05PM +0200, Péter Ujfalusi wrote:
> 
> 
> On 01/03/2026 23:33, Yauhen Kharuzhy wrote:
> > This file contains two types of quirks, both checking DMI for
> > machine-specific strings and returning machine data for a matching entry.
> > 
> > The first one, `cht_quirk`, is used to override the default entry for an
> > existing ACPI codec node if the node's info is invalid. It returns either
> > the matched machine data or the default entry if no match is found.
> > 
> > The second one, `cht_yt3_quirk_cb`, is used for devices (originally the
> > Lenovo Yoga Tab 3 Pro) without a valid codec DSDT entry. It is bound to
> > the SST ACPI node and returns either the matched machine data or NULL if
> > no match is found.
> > 
> > To allow adding new machine entries to the second case and to use a single
> > DMI match entry for both cases (for example, if two variants of one device
> > exist: one with a valid ACPI entry and one without, like the Lenovo Yoga
> > Book YB1-X91 and YB1-X90 - Windows and Android versions), reorganize
> > these quirks functions to use the same approach: machine data is set in
> > the matched dmi_system_id entry as driver_data field.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > ---
> >  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 100 +++++++++-------------
> >  1 file changed, 42 insertions(+), 58 deletions(-)
> > 
> > diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > index e4c3492a0c28..57097c1d011e 100644
> > --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> 
> >  
> > +static struct snd_soc_acpi_mach *cht_quirk_nocodec(void *arg)
> 
> This is confusing, why it is _nocodec?
> cht_quirk_strict() or something might be better?

Something like "a quirk for machines without of codec definition in the
ACPI DSDT". But yes, it is confusing because we have separated "nocodec" entry
in the table. I just couldn't think of anything better. 'strict' doesn't
seem to reflect the meaning for my opinion also.


> 
> -- 
> Péter
> 

-- 
Yauhen Kharuzhy
