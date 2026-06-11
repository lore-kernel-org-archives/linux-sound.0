Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E70279DAF
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201147; cv=none; b=UhXOXfkpUJA6xnSsssUrmVT0FtHrOG5b4LJNTI158Qw+9Uzm61RCbfP8L8F0g0cOC2ppwFHNJi9goMX7/e+q2uB03fnI2kL/gieY8C5U3sc8QvRPOExlNfB9o1qxRXSS/yybjpD3ozi6IfkJNK6nYzAz0lGgiGCRcHlLaAMJawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201147; c=relaxed/simple;
	bh=6ybZjF8WB3thr+HC6EOAjzU8Gf3FoTdo60yU0MEBigg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtpIElXo+LgaRu2A6J1RDpmNAJG+DqnFJC92L4W6iK5UIPVYyN3SEHPfocc3w2DvuI2lsyvUmRXO0B9VHiNyElDmSvZ9pZnkx8YIXkMhUPxSHoxd1hBNpfPWUWrbYRribGEToi+/z+6g9HOysOfzvj0kWQ8w2C0zi758DDQz20Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1SJMeuk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1SJMeuk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so222649a12.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781201145; x=1781805945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kf7F+OUmrvvD7GUsSTcz0x1Z1cMC6+OLO5k3eupXxk=;
        b=H1SJMeuk6wjQ+UjWk/ZWqyN0uDH6MyqRcApKRWFJsPoWaCQd8iRy+hzWKTq/wnULrV
         KNSBl9TSPqN3hn6WXJXbwhMRfXXr32oxMcyfukzfJanjuqBybolDvDLbhsapHjLQYOJh
         gqZVV2ol5sBK0SVQBKOoRqauQbYmWYG2H0qLrZLOsRPrXfuDfc4ZROmOXH9e1CSQgQZ+
         /yjjoFHaEKs6lON63CuSDIc1Q4futEh97G1aGLbijmHDKyKLeoDjP0DkwBadBLt3F0Me
         5g7gvVXWZ+9OAaGxmo0P+aKrBf5/y4c9fJq/yw4IixTU8b7tF0q5BpPMJfLnRftphNob
         /HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781201145; x=1781805945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kf7F+OUmrvvD7GUsSTcz0x1Z1cMC6+OLO5k3eupXxk=;
        b=RSCoQsogTmlioJmbcZgcdBGC9ntf/NCerbr1p84KglrMg9uPOmG42qCIghf8f3Lvcd
         xKxrF/d9Dmaa1ooqBiRtSIHNuLaUCFGRWvuiGfmJV5Oo9fFa5Jtm/2ps2Q82zNEd9V69
         otfMFo9TwEWnpEw0/RJei9DbR+pVdcioYthZgoSXbs/g1hc6GZNB8K8tHmD5V2Ayh14a
         CTHvJlnQHgTRikApMkfa2g6htZxvVgSLNAJkuTZLW/Mv2GuJVwUJXu4q7TQbFgS9dysk
         vWJ0521EjJaLE0bZiI2IneAWFKR5+8oo9JO2+nToUH/L5H/Ex+vBcV+JazT2rQAMljAE
         TZ9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9GlVfB/3kzUCzqIg4KayRkJbYfhQxEptldHl/Z08PDMa/R3QAlj7okyDnMsPBACFZaMV8teB8irwgV7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaYgax5YpqcLwxt5X9vkBTQxBRm3ZoSrYcdvNAkaZVCLmRoVFz
	1sVUJKT8JzQO/evyzK2mSJpnQ6K7ns/1ZoRKxW1IZWS6/uX0mviFIwO1
X-Gm-Gg: Acq92OEPTAcLTh+6nc0sWphyXAFUcExjaDS3e1rrcGAItfCv5zPnMjAfBn6+W4iddaS
	aAwLbzjlXC1n5l2Hxvd28dsxApF/aMcQBHJOa8Phpm4Q5rTHacozz9Dy1Z4uQeM+USG4K9dlxOj
	X5UXXlGbX2R/EkHC23J7wHmxcoVjt5WF2nkZ5Jx912qbro0gQ2xZt6uI+YAK0AlbsJ4wgcg9CrE
	C61hq4obAabm3IyRvzc+NhuBpi/BBzXSxpCN0ExXY/jK0Fx6lm+RLXJYBLzNKyIp1RR1gj8gbW1
	2dt3Ngj/JygHL1ytGsOxAdtZ7J5bOaoIWMHRs2Ih0/9cAPxNRh/5v1rL1fhtoBIF1pf5hCM0Mkn
	idGJAJTgjje+TXPOWip6qQkiFJAiva2rgO8tJyzuQUQRuPtwarG4yzbVDm3s7z2DKJ/95lBa5rF
	peIRr7AFlUTb51EQ==
X-Received: by 2002:a05:6402:1ed4:b0:692:4759:ac57 with SMTP id 4fb4d7f45d1cf-6930e26599dmr2106107a12.2.1781201144414;
        Thu, 11 Jun 2026 11:05:44 -0700 (PDT)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2ef2dsm10948615a12.1.2026.06.11.11.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:05:43 -0700 (PDT)
Date: Thu, 11 Jun 2026 21:05:41 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v3 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
Message-ID: <air4BYZvl5Gl_bsP@jekhomev>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
 <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
 <airB2kIl_R_CH4vO@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <airB2kIl_R_CH4vO@sirena.co.uk>

On Thu, Jun 11, 2026 at 03:10:34PM +0100, Mark Brown wrote:
> On Thu, Jun 11, 2026 at 02:51:55AM +0300, Yauhen Kharuzhy wrote:
> 
> > This file contains two types of quirks, both checking DMI for
> > machine-specific strings and returning machine data for a matching entry.
> 
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

Hi,

Sorry, but your email is present in To: header of every patch in the
series, could you explain what do you mean?

-- 
Yauhen Kharuzhy
