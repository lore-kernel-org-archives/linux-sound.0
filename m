Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A3E4C9E18
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352363; cv=pass; b=jF1nmkYlC00IBYpdRIrU5OkfncxjjSqWUKBqGv3B0kzFW1kszQicK7puhPCq2HcXZaiKgbVc+Q8xcCVvHiYhOWLoRoGI5KkUiwO9njikmO9fiN0yJMCxvYiLAALAsmPkJcAnWU/wXG9iQM1mYWblwMvqaDsrKCpufmhokhrOlzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352363; c=relaxed/simple;
	bh=N8W2TnBERDfav+D1ToOJ1Gvhq3bpy6in/FMcjcflXE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eg8BwZ5lac2QglXxQX8QAcEd6Ix0nkmMUnWtEQzBS3uySik8TPpHay9Uel87cneWsPH25ubyH/dSnzIUqAbczGwUl7IqU+pVkaqDyZsUfsVDQ7uKv0cwSWQYWosZ9RtxKjCmNjX9nvE1z425oT4+IJyP9aHqWlGKV2hPjjVQZUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfPJ6ED0; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfPJ6ED0"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so997403e87.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790352354; cv=none;
        d=google.com; s=arc-20260327;
        b=E+3JXzgs2eAUFe20QpE9G5O7oy3Fo402RrmL0FSNGNu1zNcAT2x6CQF7/uIW66QJ2r
         2U5UyJOC18eFUHkOQz06wucUUbowYzyQ976RylfSSWoBIH07rkiW5PX3br1XSZtoOVpX
         DdBFEGIw+1wvSGLfSegH/Ed6TtE5mucYEBy4T1apZVZKzWbEavguYi+pQONhR7knjqQ8
         lxf15o+Fn3zxMlMc2yc8RZCJrBu3VQZOrkq+c0NBk1DL9Vtw4+ucjdhiBQR1onciFpem
         ipGRQVRpK2NEk/1al/Hq/CxrjKUgD9Zq5f/Jh6L3jk0QBpMgC8FmV77k2uoCtoGpI8zD
         vebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYrfSS6k5BXHNWQpa1AoSz3JMXqef2ioppRjAdP1h44=;
        fh=1Eu+RBYXjz+HG5LkXdZ/U9raEHdgQZ+QqMHjCsEkJh4=;
        b=IJRU3z40bv47ShiJHPWVwa7IP3siNhJRTJOpSQQJuH/DfS0FHu/DNbZ6Qdu8iOWMxG
         Jf7Ug/F8r6+qBTWNuxDJj/sgVBC3gFsCagwP7pgtamX0H37bbnjiwu9WLjQdnc/Ce39T
         rAonM41WnvxjDqhRfon22JkJ4TPcTLPelXqe2uLPzlYm+/80O0Om/qi+BSROMUSiD4I9
         UPtJ6kJE3CO8kcMdCuK+4c0rzjtDYVugEt5AKcwGOMsho5IK4nzc4ueuHE4DLNFd7tnI
         ZOOb7JFigkgOqnI6Z6sRtIHj20cXYEywEhf2VUi3TeQlwA89T/izBXMnrkGKilPI7jE6
         YcEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352354; x=1790957154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYrfSS6k5BXHNWQpa1AoSz3JMXqef2ioppRjAdP1h44=;
        b=hfPJ6ED00zGQ/87UqqPzAcKZ8MoH/sOD4+j2WQQfitE/sZbKrrj3p5XbD+qvaypjvi
         rM7nciaxDTZeOZJs2gRa3R45wH4VKCXMfr/7yNVTu2qD8nSIGZ3o7cee4YBDqQqNihy7
         Cftw7z2VTaVrJpPWRcwa8pCyBBkiErstdfSW9o3UUoO6Y+7FLpxSacAC/Xm7dV6J4LE5
         iC3ZqBZz5nDSsMajXATX+oMslJKZ54LwO2HmoOhnZ2vZqX3UW/77sReUESVKun4JZED/
         hlLTH0/ZHAu4fOSMtaYzxC8mTDmhJ+lIiz9QHroRa1v/QOFKchOZiJBA4kxbu0BAIn33
         MGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352354; x=1790957154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYrfSS6k5BXHNWQpa1AoSz3JMXqef2ioppRjAdP1h44=;
        b=Kw20swKXsj28F+A84Y5C7wZENEF+3VfP8uYIOUblpGX/pQHOg3a0Ec8dmCQS+LRstP
         ULrPQwcA4BufKFYyPsWPgO1Z159gNT/x6pzcxN8QYbPi1FA04ZMr3tJkGMMG8WLwjTp8
         YL4VLdNbuGmWaDkcH9B1EMJskewfsLKXFfaweC12ZvdwaStD2fhFOBf9qcGA4hvpN6gY
         05PK1dZJuON9XY9LI/obzLz/3P1A1HEbMvd3xG2B96hdDbfb0Z9zNJGXG/dOAIhWqJtx
         njlIgI5OGkk/kRdvWKYECD5RNGwM4Msi1KvffUTsuykJvtVLFhqPnArKMQ5MRxYGPrtc
         fTuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCHJQcRNN8/hPWVDW2JsqSHlVENJkz2Libi9fVMqLkx6+OQ4VGc9PpHCk2dC3QbrVvF4BKxrxUy1nKjg==@vger.kernel.org
X-Gm-Message-State: AFuF++mtDkYRcdvHryV+GXq7731xWqKictY/j49dJ99a6lk2ro8gdcwv
	dWt8edFfz3RkpKtxyATwFiFLza5MOneTIFBAu1jNeYTyx/H5zR0tlzocldYZrcGjT8BkB4mAQ6S
	X2tSPNzysKPTYRBx2tLXVJmP4/cLCK0g=
X-Gm-Gg: AYBFou2PgwQyz7PnLIiG17LyPMEp9dM3tElT8VHaAdEqLB1CzSc87WnDoJgUGXKG4ee
	1XBQFBSijE3X2ctaYGbcD9LeDMAtiu+7QOaaEuBqGYC3tVZ1tz5n3+7f71uXOQwnq6Hv7RGVnH/
	S8ezMcKHWRBZC0/1qU8X80nGsot1xH6lXZtspa+cWPe2ko3xVT8k9pmqgTNXcq7kxj+Rc0kSZnt
	0NF6AIRhh6lNNFyVnqg6CE7lGzdpFDrL0Q33DZQxPMHiQLTJDpR2G2YcBmVdaxqkVs+TWkbw01w
	dT3VImFtEP5N8NvSp9c5VAWCTe1gBw0GytmrovD4dOodMpBE2nSdiEJI6JdpQJvmmgopWFAewuP
	B86vkBDnoZfKTYgLHzLYQCZ/8/R2hS0YwinxpIAhpUNQNqRdOZnoyMw==
X-Received: by 2002:a05:6512:ad4:b0:5ad:55f6:1ec3 with SMTP id
 2adb3069b0e04-5b8df06b3edmr2567328e87.5.1790352354192; Fri, 25 Sep 2026
 09:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com> <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
In-Reply-To: <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 11:05:42 -0500
X-Gm-Features: AclHuK-wF3MJ8QwO73hg0uMSrMhxLAJBYkbJ9MTyCnIniRFNFOf2OMgvN6BsLP0
Message-ID: <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:34AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > - Invert the value to match userspace expectations (in the hardware,
> >   positive numbers represent negative dB attenuation)
>
> That's a very bad compatibility break, if anyone has a profile saved
> they might get excessively loud volume from their existing configuration
> which could be distressing.  It might be better to rename the control.

Mmm. At the risk of sounding like a broken record, is this any
different from the accepted aw88261 change? I wouldn't be specifically
opposed to a new control as my use case, Android, is very tightly
controlled and I can just update the audio config I ship. But more
standard Linux use cases that rely on a standardize control name would
be stuck with a non-standard inverted control forever.

Aaron
