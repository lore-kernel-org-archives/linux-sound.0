Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7140A18872C
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 23:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293330; cv=none; b=HIYzLRANxHKcWwFDbhMrfwkFqZuamVml+m6XQYTDN75DPd2C5h6xvwmBKEHRJ0iR1BCGEr69s22/y3m30KY2fe/Z0c/TIQoKaw7Xw3sNMXDKF+xTrsfAyN4KuR21ORU36dFX4TEtDlurzjxUTG9DVhW+/mCO+jP/5toLC6L8+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293330; c=relaxed/simple;
	bh=WmM4mn1uG+W/QaiKQsfsqfIu6rhTJ+JkhO0oc8Vsrjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nx6FYa+7eARzlG7Dpvi5TdqUyRL9YwYyaOm49MsjRfLJOTeldIK67aBe7sIITygCSSnU2JCkDyIT3H/S/HEX+XGuF6eoG+dVPrPXXpTOSfPKKo0hb+DObyna2mgdARepxmlGlVMoY0HBT6qbzheZAXAulbdf3IVxLr/TNvzitbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=hvpc2sPa; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="hvpc2sPa"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso1699528b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 16:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1729293328; x=1729898128; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WmM4mn1uG+W/QaiKQsfsqfIu6rhTJ+JkhO0oc8Vsrjg=;
        b=hvpc2sPaHUDu5/Plq5+IFe77gD8Szzp/9bLmO5tvGngy9Op3C2opksJ20ZoOBxsYsd
         xUAffjV0nj9F6E9hwRvVHDsKlj1hIbsnmj65FXcrkefvx5YpeUJ259RD84N4ty0eBi3a
         rTz651egMbQGkFnabE/smdbwk/rSsUXKLdjljMbksrv6whRdgQllO84DiPWaif7fUi6T
         qHEDGu51AxURLUn9dzmTdiQmi7gbHJ6+Q1usDHAuYrdeKr7aPKm4W+/++RhX+e4bhGHs
         ztyCwSZmyHAs+DA6NSZWmGL7yT8/V7urSTfUrCJOhbAhep+GUCUChBiT3FyCUb2USiAk
         r+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729293328; x=1729898128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmM4mn1uG+W/QaiKQsfsqfIu6rhTJ+JkhO0oc8Vsrjg=;
        b=GgzBFuJmmoHq21krSNVtYCevreKlhCV8rXtgMho13GFw4CVETzPNcdU7J2L6SWdOaH
         XxZ2m6DfakAfxOZJT8LwtRsO8PPcvtcKWbI8nwl+NkDE7Lr71jQdOnkrWMB1N1crCjer
         oCvMvJlIk0KbgMgZDm2/MjaR3zm4qfIvFb9DNsk9B914/lRunwc9dX2YQZAopZsEqPxH
         BsNlhHDduSImUCUeF+3S3WULqJAjAYXhRm9DGWVioeqKgd51ThF8m6B7RkywULne8rvj
         yRDcjvzzMD8X4bwb/7xBv3qOMOsTpSVPD/UrPMeoMTrd09QWLXt7xjMfwqsggBb+4+x9
         de5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZhShOwLRrpDRgXMySlxjN8vyJqI8cMbtT2R3SDyOsEd+mTviEC5B0qewNV6CsPGfQ9M4Dihz7yjMlDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqMBq8onVHc00SnZGleAVizEygdT5Ie/G7+mH6RFFQa6/xOBw
	yTZpxTXvbS1KTzzdLoxA6zrbJwqrzir33CFzKJAQ5WIcVOxqH3SUNYDGznEfPnGRJPX5ZIsXuc5
	tX2gVi1w8JsANMGLCa6GiCrqorV2Z+m2BOWns1Q==
X-Google-Smtp-Source: AGHT+IHy0LHp2WpuZYGexp0T+Ju3IBaRu7XGQRgALvxfryYO/CTNmMzVsBhM8KF5jWh1WNbD0P1cW0f5eHkYYwt+r6U=
X-Received: by 2002:a05:6a00:3c8d:b0:71e:e3:608 with SMTP id
 d2e1a72fcca58-71ea3224f36mr5582634b3a.26.1729293327633; Fri, 18 Oct 2024
 16:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de>
In-Reply-To: <87cyjzrutw.wl-tiwai@suse.de>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Fri, 18 Oct 2024 18:14:51 -0500
Message-ID: <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Takashi Iwai <tiwai@suse.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linux Sound System <linux-sound@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I tried the patch on the Thinkpad X1 Carbon Gen 12 but it didn't work.
There is still no sound from the speakers.
