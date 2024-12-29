Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31D07083D;
	Sun, 29 Dec 2024 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470254; cv=none; b=l1IOy9k05dysaac5scD7+OfBP7eaP9BYj31nXmvL74h05fHThZsW/n/BGw014WJzX7BNg68S+HhPtdyayeXkykO01zT/4QozfVlZAvG7Qpo0TOgo7sVNg0DzU85FjhlOrGMaOtc7aZY6afCpS8WJ3cWpUwRAtcDSmG8bV7zmQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470254; c=relaxed/simple;
	bh=N7g0aAD4urza1R/ntvq7yaNOZvZ75DVUaevZTEe0reU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iy79XpBUUymXOdztMHYyWEN+fE9XV55jPAHQI8wns3XLdp/z5PGXWYsmDrJkSo7yHqb0mmGEWhH4mZOGqzqWH9QASyL6E8TwoLxWSMWWTnUnbHHJZsNf0iQrYIFuhm0XVX/XqXvSVh1vcDEJrTWDTPFF0oGgvyGo58A9d1u/RYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL+cAarl; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL+cAarl"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa68b513abcso1600997266b.0;
        Sun, 29 Dec 2024 03:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470251; x=1736075051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAKni6p8F9Hc3gH4N8jFZdu7AL6EacUl9VvoLKQMiog=;
        b=UL+cAarlgCQnxzT4SR9jt5IjA9i/pJfuK8CubipG55gY6NAuJqOBJ2E2rQQGcOrpno
         xkrE9N72NpvrBwVQr1Ne/NEoo9PEBB13zQtjPjNAQRJZJYlxMPoyv4syuJ2bz2wmuvXP
         u4kVS8UJOc8z5epGmp1SBO41xpCFaS+X6axgdt81xalMN0gcXUCYOYe6vmNdaJZPby6j
         IMs8WoRwuuSVEW5kejXvRkeIBJZK3x96rY3EMILyoVFqjqgkGgX1sUP9/LYBOkdDAAZE
         GAuITOmOy1wm/Z0VleblSAxO7FK2EFGhFaTDYdg7M4eoIOqwbOIQEfOl0MrlqOMC/sFe
         pqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470251; x=1736075051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAKni6p8F9Hc3gH4N8jFZdu7AL6EacUl9VvoLKQMiog=;
        b=UFKXeNL5Sz3YKTXl5HIt8OLRIgTBUxzMglwhPzILTGizPsqGo/6y8FThVVJyLYys6V
         ISYU57E+ndjUNlxfgmr5cF6FtU3/5jVAGc47D3MHxFRJnoEeF14n2m19VUcrH0kZyYOl
         keXo5bBuHUabtFAu+caao4ohuvex4+VopEPVhJZP/JalApS0p+OB39V+axX/k0sjH+rK
         dLQiUlejE6kXBcfjCJL4zX/uHGTYB0T4JMeLCbIywdfOBB+QFkh1VG5n8i3sPtryGmQ3
         AoIIOpPmkCKukI+0JYwKOhYHlqSOmT/3I4Kis/KWRNkuCcC9R1OHOuF6d27lj/jcvCTG
         hX6w==
X-Forwarded-Encrypted: i=1; AJvYcCVqSM18Zb+T8ofjdcGOJzDPzcFN2kdXcDwwTsD9YwCPcDfkuLG369rN7VQs6hM7pL74FqcFQh8f61kf5UA=@vger.kernel.org, AJvYcCWXPeBVdtx3GSlvlpL/vDwuUTb8ndEfnxG5gPl4Rcjpyan4XF7m812CNKql1HjdqcUWHZifua80J/0ljoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPDK4NchdK994wqufOZrZwXgwZ3ONKi3snnqaO/tCVvPvQwaSU
	Ox8YmlwWfiEm24pAKN9nYmqCScQMf/hiIGbFdQrX3B0hzzah9TKcFIyzkb1ElNcda6sfRkC8lXH
	y5MCtQqJUfxWYA4QyevDxDWrxBnk=
X-Gm-Gg: ASbGnctGmHK6k6lDeN8mjf31SZRna/OAbfiQO8FgQE+e2Q5hTulZ891pLDVV4R7Etjq
	8fN1xZ5jwyvBiFrddyqmlQDxv5X94FfX9v7MU
X-Google-Smtp-Source: AGHT+IF6RIXkR6GJzwIYtJs1wDYhY2Z0/GkM9O+RXIp3meSVz07tJJRF/Ob2kUg5NiANAPvJ0+Gj2V5AmaAqK8p/ODc=
X-Received: by 2002:a17:907:7fa9:b0:aa6:61b7:938f with SMTP id
 a640c23a62f3a-aac2874b192mr2734249066b.6.1735470250681; Sun, 29 Dec 2024
 03:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229060240.1642-1-tanyaagarwal25699@gmail.com> <87r05qdhbm.wl-tiwai@suse.de>
In-Reply-To: <87r05qdhbm.wl-tiwai@suse.de>
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Date: Sun, 29 Dec 2024 16:33:59 +0530
Message-ID: <CAPdGtUz8MsbhCPktRwdwuS2OzsW=4oE+xrP7=FJX4q6Co4o82A@mail.gmail.com>
Subject: Re: [PATCH V2] ALSA: usb-audio: US16x08: Initialize array before use
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, onkel@paraair.de, 
	Markus Elfring <Markus.Elfring@web.de>, linux-sound@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Anup Sharma <anupnewsmail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 1:57=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 29 Dec 2024 07:02:42 +0100,
> Tanya Agarwal wrote:
> >
> > From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> >
> > Initialize meter_urb array before use in mixer_us16x08.c.
> >
> > CID 1410197: (#1 of 1): Uninitialized scalar variable (UNINIT)
> > uninit_use_in_call: Using uninitialized value *meter_urb when
> > calling get_meter_levels_from_urb.
> >
> > Coverity Link:
> > https://scan7.scan.coverity.com/#/project-view/52849/11354?selectedIssu=
e=3D1410197
> >
> > Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk"=
)
> > Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
>
> Applied now.  Thanks.


Thanks, Takashi.

Regards,
Tanya
