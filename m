Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F821E098
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608121; cv=none; b=ssF9HeNVypgQ7ak8KDuIzdd9Ztg0vGzf1MA8/Jz9IVEGaTiTD8aC7ccQtyg7MHLQof5wTxHVhNBOG27jy5MM5IS1hdB1oPYU17d6S31M5dSj7hfXej4Xt0Hr9t5rtyZ73mRqOmJw5gYvf+omOHQ59W4/bS5GccnqilbjLor1MNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608121; c=relaxed/simple;
	bh=ya/Nc4NXGMyxIJGKwIkJ/SkYZ/jnDvAcJOZ9BBhVolk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juTA8adP2f3dUkEIlhezUA+TZ3rUDDSxW41dKy3ZqPh1Efvx3zokEY6ybAmEGFa7NgzbMTBhHD/HciI+Vag3V22wlpp+XF8AKS2QD94sFfAb01nObrCWJlPMmfCdmL/A4Je+4ARlXJLH9K57LdZwXSvScNTukASDvCap1V0PavQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEUr80Bx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEUr80Bx"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a40bcc8d69so43217b6e.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783608119; x=1784212919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GLaBo325G8i/2XbPeT3G07gnosccj1DXEjpr0zCugwc=;
        b=gEUr80BxtR8g/yUEZP5tmcKn0eqGg1+AfDXkgOxGXj4ykeB8EgGuU3UA5UNin9ZNLE
         XPx/mau46B6mrOlf1y19bMkKOPOqtk5/TU2z0GJVIDwcnBoils7OTD7nufeUq87Z/77N
         7R4MCvkTNI+hx6MJSceytnEti1dj4/gmwlJSE/pWd0jxEfHLX1z2X9uhQyTEEMYNVFgs
         yKpLtVmmeLbPwFc125TNdhbNrYYj3KrmaTziOqkZIeZCzWznVaFDtzSISl3ee7JzNwbV
         LIIf4tKTOKVARskW2VlU0ixvDnt+89hIQ/4suIXfLp9JYcumOy18A4164qci5ufGB7w6
         k04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608119; x=1784212919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLaBo325G8i/2XbPeT3G07gnosccj1DXEjpr0zCugwc=;
        b=PTUSfY/KrcJIuTHtlU2W5SfL7WvjW3xLqvXVyhFFp+MSK6Xxq/VYD0F+YLtfDHx8Qv
         O0EFU7tsMK+jOkd1IzybHr9hJV22bSCXMpp7BWsXcPIDOqoCrFTnqQR2heN16SQQxlOc
         kpHeKPk6rsqFYL+C2rMb18hAFeBXhfWL4ookKC9+4L1uRfWCSTQZ/kjfuV53SXzCu6Ut
         OLP5l23JFdoAACi2lQYZ46m5DilLk5pIhf76mPykFA0B3Wc69fthyphamBXVkBQeT11y
         BIMVd3nrygA+0q7ChyArn7r3AQXXK8pYjWZiiFdX/REHAiYw7zDBMiJYGfLCbiEwTA59
         d4Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8t+HpGis/YOzPIvJVrSsj4wYZ9o/XMNYhZDi0PeYP7zQ+kiocYARon522c+ILz9xrHBqm2wW8aHoTfyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfLZVLHidsICPWyHGdaac6MT5o4+LPnPgLSOKuDj/q8b3hYBmW
	cQKZp9N1PQbtuDj/rb2M8yVlAQ2vFVkjFbonDYako17QHru7bbw/T0ZP
X-Gm-Gg: AfdE7ckNb+YE+yd4PWWQresBphjiqI89v1U8JAmPEFVvKeRelDYSAPeJtJkdM1lpIJ2
	6bvyliqk8XqwnSFbi2VbHZKNfgYtOEz2aTUWMl2GE6J3U94jCQCOg6obNwaijdSV+fseeCTT+Sq
	vuKHHNjE0QIFow4vYag8q5Y9bdT6QadZHC3IaOViFqNjfIfH0H2YK/iYUPQV9BkMzQJ394tj/JI
	biGIVShxaeFY+nemCYBf843FcZZKBvsAPIoNPMg2tVyLlLLF5ws3nxaXcDy5jJCQlRdZhR5ypig
	ZmdIKCQXxdmuQ+V51e2LfhiU5SRpH+5L19pMJYyX5LVRj1TiL1ZMnq7GbPyd8yZriJDTL4UNt22
	fjAGk6dbeqYjYwyAtuXugVI6hsrNXyB9m7oOQ9J4n+d3XnsGBPKOCWmRypmu+KsDi3ZtGJ+UTHC
	9rx0vB
X-Received: by 2002:a05:6808:308e:b0:494:e494:8c38 with SMTP id 5614622812f47-4a201ae2d75mr7781693b6e.7.1783608119199;
        Thu, 09 Jul 2026 07:41:59 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm3884746b6e.3.2026.07.09.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:41:58 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:41:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com, Kees Cook <kees@kernel.org>,
	Cen Zhang <zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in
 snd_ctl_open()
Message-ID: <ak-zMNq_gSa9g8nx@stanley.mountain>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
 <20260706084950.49331-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706084950.49331-2-phucduc.bui@gmail.com>

On Mon, Jul 06, 2026 at 03:49:45PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>

When you're sending email, then you always capitalize your name but
when you're sending patches then you don't.  The Signed-off-by lines
are supposed to be formal like signing a legal document.  So which
ever way you sign off a legal document is fine...

I normally don't capitalize my name on email because I guess at some
point I decided it would be fun to disobey the rules.  But I do for
patches.

regards,
dan carpenter

