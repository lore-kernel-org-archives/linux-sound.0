Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D98B3F7AA3
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632937; cv=pass; b=nb20ULZOj1ueYKdsB3hPDi5EpiV5xNxvtoGLiCmZ+N02SNbtt7PhvGPhVi9pqAAvuvhPPNEBjRwLaW/jUBta10miYbOsTaNFzI62o8MAskWHgmJwekyKZiKi0NxcsO8JulCiCwClCN7jwJK+z8eZvz3mIL4N/w1qAnPv2kTJ8Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632937; c=relaxed/simple;
	bh=c/X8plu8x3JfXTP0K2c2B84PgHiiBxWUTLQqOZLIK3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KThh66qxYO36b0ltBmEX8SdeTYFWM4xIFPRvaDWPTK6ZLRl/URJuE4XMOVaTthcLGWV/ceq57tV1Yv8Gn4Qc3MP8sHzJGaYMoHp8YxW4m+I6g2GhFYXEFi+GUrKL57rTbN+6Ai8VqKpYZUr74AK+OL8IuVHl01im1DrdBSPXjO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTyp30d1; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTyp30d1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b94a19fdso2235440f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 10:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774632934; cv=none;
        d=google.com; s=arc-20240605;
        b=ihx+EASc85fzKtxoCoGMAQsIw6FemoQApJurOGEqjQCsHGmydPyyJStZZEbSJM8+ZB
         xwJM7M/EirLCdUVv/0iJcLNM2xxWP+TJk/CbYesF/NXXaOgl5HLr10Sjfb0c/rTJDCi0
         y9vpqli+awq0UgHfj6IVGdLpFIcaibwAw/NYOjKubwUYgmlnfa5icNPz0gyUl2yaChcW
         BmlT3ead1PsZkSBmFA+F+yr1WMT3xDZNBzvfMTPDquk4LzJl52ApEhmZnzURKC6Sef14
         baFbeov8JXYhIF2+b18pX8e3tIhJxqLmvA/OFqWTKmileKZCcdDUypKvHjKPxMkcdUcW
         Jh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c/X8plu8x3JfXTP0K2c2B84PgHiiBxWUTLQqOZLIK3s=;
        fh=u7H4xdaXC24/sxL2yaGRGyf9vjlMVp4HnIwNtBDvJsw=;
        b=gLLZpJqEeuetnl4Xvsg9tXRL9Q7tL6W5ragIKuyr3T/mhvKLmne94QrtIQ21USsq/L
         1GlyjKRBeQbeTSpHfUn4OOtKH6yEHN1fkctF7xk4sDd9cfOwupU6LwcaCC/tY9tKb+aW
         0WO4HkjHYGeiYSah7IC5g4nKVVxAD6DT57AQv5rNxmOIhyliDO279HOkHuxpSFVqRxFS
         nS4wm2FHj7kZGUl5tyC5uy3OgGeiZkPxpMfy75wdTXt4XUdnqLjJWbMi0hRDdgu1w3De
         aqkubsR76Ra6fsXXYJ4v6Pg8/NREq9lnWZPRE4g1BUarz0lb03ePkpGAJowued/+aEld
         TV0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774632934; x=1775237734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c/X8plu8x3JfXTP0K2c2B84PgHiiBxWUTLQqOZLIK3s=;
        b=RTyp30d1oQsMeM9jCgFRNzJCPZAMQBb6yV8W5MOskjkUmf/5h2j05GRMTNsJTTp5KR
         eIWsQ3rHUcGSwr20XzqGate976EyoY8bIQ06MNkqVXbCvLwqXnV1EDiN9Mz5/GMv7Zez
         dNuq0XSvtugGWNepCo0VwG1r1mHe6V1IVvdmvLNI7ggwhBpw6p7eQC8p9YBgLaNkZ/Z0
         AsQDGAGk7zrK6fmEnHI4/QnmciVwFOZRceN+qkoATSwwLjCh715CDgfOLKmiFwOo4Men
         xRn3H8ebbpYLTEM+cbuEGGwQAnBQp9Gbr8hUvUqMXyBnSvqvZCjT/k3Oy/7CCP4ysykb
         nrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632934; x=1775237734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/X8plu8x3JfXTP0K2c2B84PgHiiBxWUTLQqOZLIK3s=;
        b=afLMSIO5kZnoTfR/24AnhHhdfW1jGtDYaE4XFVkthSGcWjfE9zVG0SphKKD2o3h7V/
         vrrja1u6n/jKKDcjnOIcLSF1elHSlVifXc5z6UtlAS6f5j/bD7Byk02j97fg3ziTt6Eh
         68ReNgyFOARkzkPqEEplpI0GEu09u0utDrFMpFPVv8ltCuSBqLr1czlSn8fFvPcfdhPH
         mjwy92R/nJwrWoUGUBIlXoaz5cmwm0bV7gg5/7SRS7waSviVIWYLtKpZ26bbj9ZxsyXu
         VrLFoM0xa+rO8Wir/P8Drt6IAgbGookx/vZXII40uJMGlN04hlLJWWBuYTg9sF/rVzDB
         sUTg==
X-Forwarded-Encrypted: i=1; AJvYcCXqRX03WUtH2Fwj1l3jXV03Fdw9gMFUWPbv+0n/jIUIOunffKTyGZiSfn8tEfaqzhgR/VQM4oNdgX1+nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqKpZgpSMw2vmvXXW77dkswY4ZPetOAeaPzmWQrvfUdqrRUdV
	d5XZIj8RQe/SpP4SBQ5CZB/WG+gx4X2do4pydoWoloTPeK0/C0oiveMwATjRrUZHR5sof1RV3Yv
	dIPhJhb9VUNQhq11MYHcJ1W7L+Fiv1d8=
X-Gm-Gg: ATEYQzwRanENW5WSUVV8r8UEEfojAeWdaxtY1lt4EHbRGxOZJ+VeN2bkKeT92TD2DQx
	n8u/qUbLG1aMzF05JH2BFs3cx0CvievdIUSEbWdWTCZrfUytlpDBa8BfCZbNShAQVn8qgXfMQ4E
	1g/Ae4R6F5g7c9DXM8ENYC44YZxae5GmiG4qxTw26+VkREQB+UMOd6uc1zYemkUWY1PR0boig5V
	iOwhVVqwGu9Xw/uSniBhxwO0n8JfTDjMYyuuMjc+uyT3+jyQduuAvsCKiugcildkF7RfSwwRW3Z
	CmzvFDIQMQQ5mtXQDAaxkW1zzfbduMRp+FQ7q2330v+7MHXdtozeMoJsPIfdkau4e5D/uQ==
X-Received: by 2002:a05:6000:4313:b0:43b:42af:75e with SMTP id
 ffacd0b85a97d-43b9ea62daemr5657789f8f.44.1774632933732; Fri, 27 Mar 2026
 10:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
 <05e1cb0a-18f0-412f-87c6-99319b18af52@amd.com> <87zf3tp6p4.wl-tiwai@suse.de> <8cd14428-24a9-45fd-9286-9d9f142b32b1@amd.com>
In-Reply-To: <8cd14428-24a9-45fd-9286-9d9f142b32b1@amd.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Fri, 27 Mar 2026 17:35:22 +0000
X-Gm-Features: AQROBzDDwC7Gv9FiBUN2O0wKA63LTpqI7EaF6AnmPned2dUbb3tKdLEPnO0H6SQ
Message-ID: <CALTg27=bxnP40aP+AjexxUMF2=hvbXnR4uurceLsJ5h839L9eQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by
 DMI ID
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

> If you end up having a good experience that could be the way we approach
> this problem in the future.

I can certainly try, but I've already got a pile of issues stacking up that
they don't seem to be interested in fixing.

Hopefully this will be a simpler fix for them than the other issues...
