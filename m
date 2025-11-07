Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF9B27D77D
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762519953; cv=none; b=tepAEEMfQ26BUKn7nr72jDpYF9CmAyVMOMLUruEicF2uRveqqvL2MqQrzpC+6Ng2A+DqwWS/GKI5qpDpFutoqmRuqhq2BltdNX2Bzhxmd+7PkmNJwz0zGsq5hfJJpFniB6BbMK4td3ZX+PfLVGPY7FWZ0oFYJaVHYJQeL6cMFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762519953; c=relaxed/simple;
	bh=snI4yqGepDdWNnY0kbg2UNmoXx+IQh7u1C5ywqjd/MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4sG7cknx0x9P8mDMh6BLhhW7Vkfyd8qPlQwhaYZaBZnmIQLkEgZNhTnEpLJMLqVHI9ofgJprJsfhk7BnKpXuKqh3rSN/lWkrPo/9/huH+F6z6Tn0LsP6RnLUbypJ/UsmZiDQ/qeL1jVL/nVmndm+A1IUQEvXy3F2qsC9Xna6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QNjRTMBx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QNjRTMBx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so1478622a12.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762519950; x=1763124750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1K/WGyrSvPxGdmHGTAm83AxLQquBqybYtMrmz64lWv4=;
        b=QNjRTMBx9T1Yw861AigEB7mgXG7Psqi/QMo+dMfXkN91Q5iYliuex0rGKMWT6rj7qL
         8bn8ptrpyQWiuGeDyJxQZCFw/EVUlIYCjWK/oi5QxpNtps6YAIKoZDKNgKrHYYjx5KXM
         +oPsZu9VRu6bgzD8v2oHwG/tH6QqH0xs3F/Km7gqEfAMuWX1zCftLp83nmw+3tAhdS9b
         Uu+uI049IB8dMHWkv+JYeJrpV7aiT73Z62y5RnftF9OOh5tFpeaKHfvVo6nD75cU/VWI
         iDE0psv82sm7u9EJk6UjVmVsMW4mZF+8HTa6b1s6uAEJKrydG3LA3bkvZbfCJKohlyiV
         YwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762519950; x=1763124750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1K/WGyrSvPxGdmHGTAm83AxLQquBqybYtMrmz64lWv4=;
        b=CeH62Xg/qeUL4s+eym/+ul3N6pkRxAmZFbhUGX1oppFCtCkVZd7cav+SN6Zy4MLebg
         gXjyqQgKbfqY9MLwLc+Hq/LZ+GRtPZZxndmFIcHPa/Vl2vb2uMoGYDOxQnC8cBNwthdm
         PMU6qqL1kOIenj0YabM9b0vWR5HPhXUEIPbvfJpr5EhJ2WyxetS/+jXv9KMCFMhEoGYW
         GgYXKqT48bEpKR2BhWdahzP7DkjQQED5BlXCJHGwKq6W5T7KSXkJWbr1SuR5FsEZRv9r
         tMiT7W6W6oPSeMhp59sO5XAwX+VB2iXDaxK3aXRlAA/F3sAS4iLL2nPqRnQHU65ReH/N
         e+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNbgTqb5w4ZdcBOZiA2kgsDaueadSQeRDe9QaTwSzm+om5Ss+9Z4D+40t/cvVIhPROnTjWa1LumR+jSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Bl1EUMqhqcy0b8vJWYmio6ezRiUeiV9feskvtfRSCRBQ4mFr
	yyf/GLHOXjQuaR9YIEndeuEgKbxUwA/iBmhuRPRBaeyve5MD1CUIZifKVn+M1I4SJaQ=
X-Gm-Gg: ASbGnctHgyWkC1odChv4HJKGXERaX3fZ0VIj6QNoM/9mpVLB6qFqeQSfZ24AW008C/q
	va3Gzeh8jyMi6LFPbr4pQn+rKPQSqE/aIqEJNexsLSTlW/Yl5OUvgP/4hC2ccWlfuwQQoWHk7DO
	AjCfdLdp5le81g3Q08X9jv1XaZUzvhAr6yy6P83n14ctMaPat2YsLsuwX23EIyGlWeXF6pPZWw1
	DZj0npKZULJzRJZ9TZMmOwsJYuCegNoHQggEZfxhg9n6FPrGmXQ/mKyAr4mv4e5EjT9kHoP3Kt3
	at/sGrk1gqrvgRK21Xdx5nwBn7vUdm0ZgLTSB363uS9FDSTYx20n/28SoCi+df4Dq8lKtSrNPIS
	664YPd9YiLjerPw1/lb9giLWms4NJH84FTMwtw0xjLQmsKg7tA0IwOYG7vwYs2f/XqRYMw+/RjW
	EoAvtKfmm0AhV8lQ==
X-Google-Smtp-Source: AGHT+IFRXKZs5/2DM3+3kiNXkbk52MOjdWuG5THbqAxP2FWnWGBNPVkzgPQQurODQzOo7kyJEIWPlg==
X-Received: by 2002:a05:6402:3551:b0:640:c779:909 with SMTP id 4fb4d7f45d1cf-6413f05a3demr3023096a12.27.1762519949785;
        Fri, 07 Nov 2025 04:52:29 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8142b9sm3988302a12.12.2025.11.07.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 04:52:29 -0800 (PST)
Date: Fri, 7 Nov 2025 13:52:27 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Junrui Luo <moonafterrain@outlook.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org, tiwai@suse.com,
	perex@perex.cz, linux-sound@vger.kernel.org, mchehab@kernel.org,
	awalls@md.metrocast.net, linux-media@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/sprintf: add scnprintf_append() helper function
Message-ID: <aQ3riwUO_3v3UOvj@pathway.suse.cz>
References: <20251107051616.21606-1-moonafterrain@outlook.com>
 <SYBPR01MB788110A77D7F0F7A27F0974FAFC3A@SYBPR01MB7881.ausprd01.prod.outlook.com>
 <20251106213833.546c8eaba8aec6aa6a5e30b6@linux-foundation.org>
 <20251107091246.4e5900f4@pumpkin>
 <aQ29Zzajef81E2DZ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ29Zzajef81E2DZ@smile.fi.intel.com>

On Fri 2025-11-07 11:35:35, Andy Shevchenko wrote:
> On Fri, Nov 07, 2025 at 09:12:46AM +0000, David Laight wrote:
> > On Thu, 6 Nov 2025 21:38:33 -0800
> > Andrew Morton <akpm@linux-foundation.org> wrote:
> > > On Fri,  7 Nov 2025 13:16:13 +0800 Junrui Luo <moonafterrain@outlook.com> wrote:
> 
> ...
> 
> > That is true for all the snprintf() functions.
> > 
> > > I wonder if we should instead implement a kasprintf() version of this
> > > which reallocs each time and then switch all the callers over to that.
> > 
> > That adds the cost of a malloc, and I, like kasprintf() probably ends up
> > doing all the work of snprintf twice.
> > 
> > I'd be tempted to avoid the strlen() by passing in the offset.
> > So (say):
> > #define scnprintf_at(buf, len, off, ...) \
> > 	scnprintf((buf) + off, (len) - off, __VA_ARGS__)

It does not handle correctly the situation when len < off.
Othersise, it looks good.

> > Then you can chain calls, eg:
> > 	off = scnprintf(buf, sizeof buf, ....);
> > 	off += scnprintf_at(buf, sizeof buf, off, ....);
> 
> I like this suggestion. Also note, that the original implementation works directly
> on static buffers.

I would prefer this as well. IMHO, it encourages people to write a better code.

Best Regards,
Petr
