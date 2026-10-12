Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEAF41CB5E
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791164; cv=pass; b=X+ilMPS/kGtVxMHeud91Z8zQIjXelAHChhlrMhT6pQSsqC9m25qBOctraRBVhkiS0/3Z2neF6Kojdjouq4E1QjzY+LWX/8jhWUNxDgFdOjFTxnwHaZ7dZcl3zZtwAxw9OThlFMPhP8Gm3yEq4NvkbZyj1z9C6Q/LwE4HPZpKfx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791164; c=relaxed/simple;
	bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEuUyAeERKM72wIGEHjqegN/36/FIotE0QY7IepVz/bct2/zFLIk1iMCYdoo/fKwtdQSVj39uP4/ailOyRIghHBVa4AkCrHnNzCnYBnc983CsFzhYReOEtwluoRfZbiDCUD2kRgpA6vQpUky5t6CBRuTyzhefmaskfyIcse4rjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF26TUf2; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF26TUf2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-892734ce7e6so513080b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 00:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791791162; cv=none;
        d=google.com; s=arc-20260327;
        b=qJc0Qd9Xp1G4IfCJAFaZLEb/5K+fm8lGEVrFcxL+WxNw6Knmn18gfMBxRt0KMm/Byq
         M4Hx/+Qdtr7XDOPkRJhLNCVpszVJuhAiFjL/K0MDDPTjDoufPOuEGe1b6N/vXTv2/iGf
         C+QLLbXCIbsZrwQdKx8YxrM7x0TLM2X747Q/+zgFM4qbzIcoz1E7m1bECMT9FJbtye7Q
         pqqF0OXraBpFtGZJKbtKjb1+Yl5ZKJsdZfSlcsz+tCDB37HH/n6nEO7HVFL8TSszKHhn
         BbP46ST7kwLdR6gLXp9dJQFYA0SVghxMEvaEkorem5HD/If0MN6yZk6+y0xQ64c8jT8h
         gDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
        fh=foQyaEsDgvG674BcmVRhSHUiLqotCFjK0YMzlVrogyY=;
        b=DCvexhudMiUHvyxhX15SxS2G0R2xNCBuh6wdQb9zzemw/B/iC5cF5HuKXwXsEVkrb8
         4RHhq3BS9z2u3uubFzKPwrwXZ7gPITCo/ttePrhYpy1mZw2eqmsAB78eoSJYFsKmQTRU
         OvHGXLA/JsS3A1WiWjyDYyf+VYu/ssgbS6TOomECpztrCH3sU8etW59jQq3bKJOJu3ZT
         I/bg7mvbREVY+pheWrioTZiamypTtkmsTZHTRZ3Y4/qNssTgxZKwRDnGN6SUrQUWiRls
         Pvc23bQKvKCIYxAfmIUbQOD4xsViA7u/UACN1775R8ckGhIT7Hi7L3tQDaMMEPKiOrs5
         3I5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791791162; x=1792395962; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
        b=fF26TUf2koF29nK5bydBNUF9POvGn62O+OyV/4pu9jcPMCC10dm9SgueTDMByD39A0
         xVBRQhp3kLHrvMcjNMRxqE4K3jBF2oEdwYuLPEQGWZsgxNOeR2j2tQPkTvCsNgbI8Wcy
         nHSCPkA+Dwd5dMmCyhdvQmH8j1ec2THMKV0nggr4oEBuEYJlNcCJpW9MUjfG8zssGoBA
         km9MIWDMLXkcut6+nVyQ4UIPNhJGhsrjB5IsCKfh8L+9XKj6GrsZ9AsEDMSF4oIJ9221
         /ecitbrr7s4yIWSbR/kU+LOb2a6Fh4SvQwfTQ5l52wB+zccLkMVgaYrViw2emEr6VKkk
         N77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791162; x=1792395962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
        b=uLGBgjGRo+mYubps2OH/QAQJsb5DuODRDt0PDZUtS/jhDeBX4uQC8IckTRytCnXjMD
         IYeH+HzZ6uhaIDli5H6UxH6EWZeWJUytZYwKc61dv0QPIQZsddxJCW1Xqi6x1KSsRHIn
         LtXEm47nBb12553B/NjVZ7S4u+GW/tDJeiQqqH/n0R5OHy524XX9BBzjVSs4gTiDGATS
         qOytVXdZRQkcdaNjoVsGZKAgvgUsIUyHa8R6Ml1gb9uLEKrpBAkJYVvxicV9oFvwZfOu
         FWBgCVB97RzHfO2FK1IEQ4Vsz4o3P+5Ve9+QIUfQuS2ji5A2J+p0vnm4f5ifmN87dXEq
         PeXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzwbfr5DGxlVr4zRcO/thIn/67T/eTll+IncEWl5k7KmNa2V8fpCxDLWi9C3WLsCqd5s9Coxlrf1X5uw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNjJDFfqvvhqamgMt5u4l+U76ZSGxryHBXHF9LZLmUKDGpwdVS
	owKnUgJP+zGNf1zwbHVEPPnux09tYJhk/yenlRnAWgU9hM0ikhLQVkHoDgi58utOF8bQ/lQGBot
	7uL+9obWtKSdEtnjQn1xDrhCQxzlZEc4=
X-Gm-Gg: AYBFou3Q8/hbvpt4w5xuPGfko6PgQ6uZyFsR/5lxLfVisaobnyMp5d/qI/ppFSyoWEM
	WTfw/IcxdLb5MHvWlHemWFvlqAa22P41jdeblgI8ZuaPaCl2P/pTsl6NTsY2SBbOL7dbyUCvsyN
	RwLQIfNOEn9FUaBf4yXeWI+JXlwVAjKmPPs9gdznOPCOb6ayrQ3YY+MTJZ8ed0fC/XIhbcnaNoG
	oxmEjZnR1m0Nl4esf4FvWBW14B3IYrlGctRNW7YCVxqhlMEKbRiC2KC/ViPLrDHTUc1KaF73DOS
	PfeuiRWb7qwB4tfYfiKdjvk7aS+NwXKQwnYumk7aWbbMC16/c8FOx7X8EWezYzRthFEVxdPEnBQ
	FKNwhlEBYt8AbGRLRIeau1yZ7Unq+16R++p4p1ra4Po4RgRmk7LuVxxTJ+ufy4usVVJg=
X-Received: by 2002:a05:6300:83:b0:3e1:482c:77ca with SMTP id
 adf61e73a8af0-3e16bb73c5emr7893611637.5.1791791162214; Mon, 12 Oct 2026
 00:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011221350.1690703-1-aliamemis@disroot.org>
 <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com> <877bjniedr.wl-tiwai@suse.de>
In-Reply-To: <877bjniedr.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 14:45:50 +0700
X-Gm-Features: AclHuK-Q86C9Y0OI9UGDfKzaTjtWGzcrWp2NkSpn4NgBhSFI1e7NrtpiZ0nLAMs
Message-ID: <CAABR9nFoYG2kGcnKvcp7VNG8FDjCKScROLqYjsDv10tAqGttFw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core: Use the allocated major number with major=0
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san,

> > Note that major=0 has never worked, even before bd8f21876189: the old
> > code treated the positive return value of register_chrdev() as an
> > error and failed with -EIO. bd8f21876189 only changed the symptom.
> >
> > So this patch adds support for a dynamic major rather than fixing a
> > regression. Takashi-san, is a dynamic major something ALSA wants to
> > support?
>
> No, it's supposed to be only the fixed one.
>
> If there is a real demand, we can extend the implementation, but I
> don't know of such a request.
>

Thank you for the clarification.

Best regards,
Phuc
