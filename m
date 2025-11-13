Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BB9307494
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048737; cv=none; b=Ph58WO5USpuiJN0gDN7SYgKUV8DMj6Cg9s+2yfceB7pEEEAPB6DEIUrE0SSpRgIWi05Q1UyPxUCg03lPOw63slHnoLqzqAr5iKLpXXeKsnKpM8pS7rTR+n4jcwf4PNxeRHaNElF0l9A8NNImCpCyQsgFDPzGnbcVOicDZiuzMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048737; c=relaxed/simple;
	bh=GwhYoApelHVVE9jUOsAHYc5x6ZTXahYrF0D92jPjL7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5ZCcOVwcBzO9cdTnXIaI2c3z46qfsVX/ZeMXQ7sdpqaMIZrW3GxS+Rh74P6HLmhv2aeyPN0/VQiD7qu4igd0gc8xx/In/rGmtX43O/G6u/bpT57jvflKralVxg9f2K3906l8+HEnMxpbGCclc5JZSQIh964PJrKwzVun7wJb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPnrSVa9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPnrSVa9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b312a089fso585000f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763048734; x=1763653534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjKqZ210vJmo1ohOFjhR6RquaivlDQYg0+nEWmGJGgo=;
        b=lPnrSVa9l6IshACe91D+8Rh+qgYYoMTdAZMn3lVRcwmUowAaSgj+ktFjgcHOPmJ6V7
         csIGp8E+5xViwbd9LWdODJEllbGF9nkfNCg+ZzIHu+UE+/5slaO6xy+PCliYtgS4d0LI
         n4M7i4iwu8dLw2S1znJuwkfUUsib0dLWmUn/qUhjU28OkVyW29f8EFP1BW4anxe3jYtE
         PNcreO/j2jxxHb88r+TMb/PVy++GG4x3/emR8upIh0SeDdFMQ1C4hCzWYIvWNkoYGug8
         XoSsoa2Huj8gv7xoBr8n/I4kwM4OtNdP7Xx2Le0EFcPVocv00/HY0nNewvy7wSuKmqoz
         0PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763048734; x=1763653534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjKqZ210vJmo1ohOFjhR6RquaivlDQYg0+nEWmGJGgo=;
        b=s81BBvEJGw57a9u7NznmAIptNcCQpi+4zaWBy6ave/9mPYxM+GVyRV5tkoNtHjLrtc
         0lRXFZqpEBH6xRHRNZMwb+eAyt8Xr04cv4FaOdHeL5tbuxltpj7CBzrg47JbaKswDeaP
         PKXPjnpUlbr7OYEEBEIURmgtaUDFBBTvZgzxj8gJi5Atnd5YTpAyKihghyKWhVs0RyMl
         drux9PwcFvbIVwwemlKHyElowG6fmg/4Wzz1s/z56ZL58xYsahLr5WFChTtOdqXAYSwJ
         8RebLcH9+hYjqDk7MTwcJ09uD+9b+ziSgW4YC+nmfVpsZQ9+X25BLpDKZnlwcsY46pQn
         WesQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfRycTAHvRKchZ9f1cU5+LYRl6o2lXi0qBPsQxpq6DaBrKqdp+VCFhCOR/qxRFC9B0+78/4poXCfgt3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/FSMRX1RuI/g4upcCraJLDlIUz8eRDNF4Ecf4pS8oVn2MO2i9
	wvUdltASXPUKg6jcy2pidfsuO380XpZQ/4XmuZx4XJ6s1hd+SzrkhNmERMjO8MpbWLH2gEmnLYt
	E2TnbYUeeogLrpL4pNQsgR+n8w1Rau8E=
X-Gm-Gg: ASbGncu4o/MAaNn5K1dio8jPyYODXCUJidxlQiskZKr6yLU8RlxXBn1thiJV4fRhnTZ
	QKdFvknl71gLiAb5R4Zr+41YULc57YuaVqaAOaadOtprVpNVuLCYiOA8H8GjSxB9rrQFrjmGtnb
	d1k8lASnpboB2A43W93bH5rAIZWTI/mEfL3JZl1wQFXra0iRkGG4W+EYDuB26luKEyty0FOiOSE
	PfaRNoCq6BmpENE+EFu7S6CdXv874r1uz635h25CydFPhHNHyZkhgmp8vRD0pem8RKTA45puLGZ
	jlHCEBDCSPwqibSVI9P8jmrQ44EAGKUhKVon9mEvelttPrzs0Exet24OzeXR2dtBakSgW5JZi1g
	=
X-Google-Smtp-Source: AGHT+IFyI6x5RJm95yRlsUC+iSGTHktfcGN76wSiyQxdFS2fnEAIOWwjv4+oZtv8N0EO0DATlsveTOJR8O4h83YjDyY=
X-Received: by 2002:a05:6000:40cd:b0:429:d0b8:3850 with SMTP id
 ffacd0b85a97d-42b4bdb4884mr5867291f8f.48.1763048734320; Thu, 13 Nov 2025
 07:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com> <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
 <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
In-Reply-To: <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
From: The-Luga <lugathe2@gmail.com>
Date: Thu, 13 Nov 2025 12:45:22 -0300
X-Gm-Features: AWmQ_blIL-znisBibURF-59XWVCNK3O7x4L-ZqBPMnE2bLlz0feBpIaVurcSNiU
Message-ID: <CALvgqEBVQsoQ3wewP+37u5Ms398O5gC8YaELm0UJdZSDBHzPPw@mail.gmail.com>
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, michal.pecio@gmail.com, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You might want to wait a couple of days before sending a v3 so other
> reviewers can get a chance to make comments.

Yes, I shall wait. I was just *too eager*.

> You should include the HID: tag in the subject--
> ...] HID: Apply...
>
> The patch should be sent
>
> To:  the HID subsystem maintainers
> bentiss@kernel.org
> jikos@kernel.org
>
> Cc:  at a minimum
> linux-input@vger.kernel.org
> linux-kernel@vger.kernel.org
>
> plus any of the others already part of this thread.

This is very helpful. Thank you!

I read the documentation, but I was really waiting for comments before
finally sending it, as I didn=E2=80=99t want to create noise with all the
iterations of the patch. I didn=E2=80=99t realize I should wait before maki=
ng
a bigger final change.

> Vendor ID 0x2d99 belongs to Edifier International Limited not Jieli
> Can you change to USB_VENDOR_ID_EDIFIER instead and move to the
> alphabetically correct location?

Could you kindly tell me where this info is?
Searching the internet I only found this website with this info:
https://the-sz.com/products/usbid/index.php?v=3D0x2D99

I just checked the vendor from `lsusb`, and I was hesitant whether to
write Jieli or Edifier.
I also decided to write QR30 instead of Hal0. Should I add a comment
mentioning Jieli as I did with the device?

> One more thing about patch style: The Signed-off-by: line should go
> above the --- line, whereas the revision information goes below it (as
> it is here).  The second --- line isn't needed (but it doesn't hurt).
>
> Look at other patch submissions in the email archives to see more
> examples of the style.
>
> Alan Stern

This is also very helpful. I should have done it in the first place. Thank =
you!

> Thanks for the patch!
> Regards,
> Terry Junge

It's me who is *super thankful*. I learned how to do packet capture,
hexcode/table analysis, and even wrote a script to time out the RGB
lights when idle, show a simple brightness animation (increasing and
decreasing steps before coming back to the default) when changing
volume, and synchronize it with my keyboard. I have more functionality
here than with the vendor software on those supported OS's. All thanks
to everyone who helped me debug and showed me the tools needed to do
this.

And even invited me to write my first patch. I believe this process
should be repetitive, with new people coming and going. I=E2=80=99m gratefu=
l
for the support and patience.
