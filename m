Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E3032B128
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781801838; cv=pass; b=M7W9WdWfO9hAM11z2Khz7ODrzZrAoUtnGwd2STom1XBNPi1vHnoaKsY8Sb/iABzw3GKpbdRB09xD/BgMZsigO1Ej1FTJJJYSHvzgnx2dCaRw2AkTo2JxxJCkFSjB7LltgDy0NlkgXFXvs9rP0Ymi4sS/VC9ugvOsq1lzcjJX2rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781801838; c=relaxed/simple;
	bh=7toO29jg6uvAbLLstXOZkj3XcgAyGBtFa5/dk1T1ei8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtNI+6FJrn2H9ym808kUjldrL0DNbsnbjrchaKbqdbf/m/2hAAf/ka0KlRvv5h+9GYtqGUjFcjfqz4+Mcd6Iw9E9ba2zptKd+fXon0Xc3gixTQ4dfGWjojdZxD2z235NwLVddaQu4PpSp5aVtFkEV+agX/WFZXIoqEKMy3VN2So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1VyhvNb; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1VyhvNb"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7fe723ca5e5so13785197b3.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 09:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781801837; cv=none;
        d=google.com; s=arc-20240605;
        b=ULIatuQkBRbOSK0rpVOhwERzlBvdDVWzlf0wgGuouwzzIW9N7UaFENtQ1iwUQMpTUv
         GL9zJFSvQuRI3kgcWUVSp+6hXPvd7y6TOS6HPDdwmItKew4TqrfEB5kEyFzHlMNHWmXH
         ujTd7itfTwCYbhjQInO3gFb3ZGynf+XnJMjezTFhnUL4eOpHwiLFfaXZvMqNbGRqxdLn
         k1pnWJ08t3yYxuGsijO9wtjPlkgQTGC7VL5OeietNfmZp63T1Qt6tWInaSZJJDFMaZOn
         5rvIxQDmjKSKfgbu8U12SdlbkZg2qYoKdiBXNJv4inXSG8o8+KSG9B9IHDZWWb7o39Rs
         uzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Htg23kzGOcfdBIlQIkS2gqcM01UAh2rRKeggskZLPVI=;
        fh=rFqmKREa8INut6VLMjJm10TYhY9HtZ1L5BfPGqYvE9A=;
        b=aAOqj2y3tiUz1dHIam0gEHzSiLnANm+8NlzuVezWuN1KrM03ngg9Lt2MyakAlaGKt0
         LcVp1hPZ+/2extEMiL7lHk0gr5szbVWhXtvY95QGU/TQj1TtMGGjUPKSJ8yKUnWeqcn/
         FWuqfLzlGLVSSLUKURZ6XI5bhB1i7I1nEAkOvHBiCSnBtO9rz8+Li/fR4v4vbI+BAlV6
         swhFqHptL+1niNB/BvBhy9Vz9Jg8rvBXhyf3sYLlT/l8sNw15uXhw2dFuHA2hO2P+ThM
         LlMDBIjMIWBaV5AlzRLgDxKh/AJjVIyP5L3qojX6QTdBE7Gf5WJ/rhJu9wHVMzJopB6/
         MPuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801837; x=1782406637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Htg23kzGOcfdBIlQIkS2gqcM01UAh2rRKeggskZLPVI=;
        b=L1VyhvNb1sIs8ZcUKlNXbdPvX1JT0GS7LJ6oyUr0VPieXQyPNBkJmx9HA6PdCwzitS
         2AWlIQekxSWXP95TL8iD1sM24lR6XXHT0VHLRTBI1PyI6LGUBXSvLYbIMWD6ddvoh7Tq
         WKmfzHKvjrbYxb0GuqPAAgcWB4NVxdgA7upKv9z1lz4soJnDocYxGLu9QlAnPHqgDBs+
         DjWlWMuXjv57lGFx4EkxXcytsgW7dpSevRB1T7P44cD9LtP7LcuzbZoK4MzJGZG+Ds88
         ecvmoA+EXUeh2sRdQg9Uie+MU/h00m0ET8IN6HpiMHBaKjzvfRH/yVUsMfM3yMgd58Kp
         raaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801837; x=1782406637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Htg23kzGOcfdBIlQIkS2gqcM01UAh2rRKeggskZLPVI=;
        b=VT980S+yrm5uu3C3mLS8PIsAg2n26Q15RNWfcMfMUMSWU/z9qJe+olcRwc0Dm2DXQN
         lRdCggneqA1G3SesnwC65FpoPC1Ef+7VGlURo7+IXR0j0op7pcoiz15uerFvQwOivn2q
         VuBygJSqhvzHGm9SxKI9+OvteR5bwIbW4INZOhcN4rLVqzzQue8dUfuBTjAmclIKnVYR
         JfIN5mYaigsZGUcn5hdkOcQm1TgAu7xvDani9Lhtm0TomiCahWJpPNqFbeo5/RyR1M7P
         uZL/teMDUO0FlrN+bSvd/6+dbDQ9zMhU2QMmIexGU7R8UlSxO7uSQa4bWSxIwoitVYls
         OEVA==
X-Forwarded-Encrypted: i=1; AFNElJ9dXWRzo7QiojwBY4auxvlFfI10+0lrNPUDaFRvv45fOPM/+C0JFckNZXFbPLfOFNynYsYfY8Cn7BHytQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnJyOL5uN6khT/3/X8598H6iGjmBsyBUKBGdzlbWzC0gVM+LA
	NMDN7eCqQvR+iul051Z2P/sn3O2Tg5dJEfhd/8LXmHLgcXwlOk2opn3jKbXa5Q8ax8yYwUrn7dx
	GMdrpRIgXYfbExz7+8n9qLuxjBfOMbfU=
X-Gm-Gg: AfdE7cmbE5DexQ04XE69YBFs6f9ncUHcMycuZ09Lir6noXXUrWDtGk8sK0gOL1TiUu1
	OK0P6ZiK2FBw0FAdiImxpizNr0rj0QD4+n7ZQpyWy7CgAnsUmzjpR6W99aOTGwFuR5T5Fpl5qJ+
	ifWPgNbyDcmASIhdV6EiJufgXe/HzKXGGS2vmCvtj502kKAWTLaRtl/4FJNsl90ttrFs+fJUZdb
	dEsT+roqKP9esLWLunq5vrQwnABph7BJqycyr6NoiWolnan7Q6cOyA2IqyF2Nc+135dxFpxKlE=
X-Received: by 2002:a05:690c:e1da:20b0:7ff:ec2:ae84 with SMTP id
 00721157ae682-7ff0ec2cd9bmr65962897b3.46.1781801836500; Thu, 18 Jun 2026
 09:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618122209.3655881-1-zzzccc427@gmail.com> <87fr2jkg3p.wl-tiwai@suse.de>
In-Reply-To: <87fr2jkg3p.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 19 Jun 2026 00:57:04 +0800
X-Gm-Features: AVVi8Ceda-SLWdErbRE-wMVAqKlvcTBseBrTUXAMgFH5DlSTit1x2WbrKRzOSEw
Message-ID: <CAFRLqsU-6VxBGfXmSLoKAq9juT0f+kmQKo5uRQ=aUQ7DGLJEFA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: Disconnect components on probe errors
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

> Please split this to two patches.  One is a quick fix for
> free_midi2_endpoint() based on your original one, and another is
> usb_audio_disconnect_components() I suggested -- those are basically
> two distinct fixes.  And, the latter one isn't tied with the MIDI2
> issue, rather a generic hardening, and I'm going to apply the second
> one after 7.2 merge window, while taking the first one for 7.2-rc1.
>

Thanks for the clarification.

Sorry, I misunderstood your suggestion earlier and mixed the two fixes together.

I will split the change into two patches as suggested:

Best regards,
Cen Zhang
