Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E89190498;
	Thu,  7 Aug 2025 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754605710; cv=none; b=uuCvR09QhOaNuNxDM/Ek3w7TJ9I3hdXdn5s9B6R1WbXy9ECmW3Pkqe9kKtB+vhEsPlOQ1ctenTCWVEGpjUCmg2kHlCk2rmxtVGtw/hnKLkmCduOWS7fidRJxGaDClAlvaUnbpezYn4jYO+Ou9ePdIWkvwd+0xMmx3OzwJChUoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754605710; c=relaxed/simple;
	bh=tepQER/B3Q2AaKkdBc/YTjlxzZjsKce20rx9wrGtiWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfGNowjmpET+WZ9NTmsb17Mq5B+9CTufRHJPC4zeGcBiVjvEyGZJCvOMrTbugoTpoeZivHXjiIh3/05dcRKAYkIER9SsuEe2qYX+bgSkthuZhhilg+zDyQAePV0oOnEE93cqlRsMEsbO8F2ciMKyUOS5F29FWgds4oBtT8tr0N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2kvjnYw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2kvjnYw"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3218283cf21so259926a91.3;
        Thu, 07 Aug 2025 15:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754605708; x=1755210508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKwkh4VaAp+S1exgnODdmPTJqqGRa7jXrFsl/hUqQzY=;
        b=i2kvjnYw7tg97FkyN6Yqxnp/eKbB/7vQdGrOWabzvdA6Jk1iBbR4O8i20CsDMlBG2N
         CvJBb6uX5Gb1P6BaAioIiX1vc/WO5LLUMlLrotlCB2h+si7BIxYYg4yVb40z3YhaoAtc
         TjHQAqn+B+NDPWBTAsrIiueq/R+ITeu6gIfqipJlU+fUN3dpd9oBBcH0ayVbVAh4jKzr
         LBD4kBaGSgB3rOqlWKvCiVTu5TqOaj9tzVzMYkJxmKys1wojmFBD/of1ta3zg5bD6NeY
         6O00R7Vmrx2qUWi0utACjimcFYWAOvv0szMN1O3lhiDkdM06DteNTXZ6fxtZOn7HaZjO
         BxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754605708; x=1755210508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKwkh4VaAp+S1exgnODdmPTJqqGRa7jXrFsl/hUqQzY=;
        b=VTvVp+B0xx0ZnYSTbb8wkiq3w8PUgAalvGyAoEiZ+NmzgB8xKvg0wCEBHkNI1Mqb+/
         /wOKT8kKNsoNk+hUYuEjAeMe2UTEyUI4bZxphzpDkNDRdtaGAAeL8JgR7J23O8Dwbfti
         Z+rFYNs3LUtKioQdDdVtw+6DlV+HOkDmO2cfLuElWTZORq16/DUzN9dgiWlp6N4UdWQI
         H7ENmE+pgFWh8uPkyq0dKS5l8Bac2s2VOahxffltcpGV7R1uQxHH91LMzZe+LyIefoTh
         oqC0TdwoWuN9HC/5scJafvw8SabX1e2uzsweq6243bIkPanScQ4t/gzqhkpHgdrCEiJ7
         X6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWk6VkWO452g3fenyQjxmSp8yM2NDzENI8pw9aN2mhD646xOc9GASFzUrR58IHp6h7afyriz78TQVHn@vger.kernel.org
X-Gm-Message-State: AOJu0YyTpJz4DdYIDFykedMzBP/UaiA6i8AtRhAVsBXc8Qp8ZoqiQSDJ
	5V75nYrLe5CSNbU6AS9L09IDIEFOGC+/22NxMzUtg3ZIAXarwVsrXiXQVfMymyXSrYzJZa14udm
	bzUSUQDWN0/fQXJVNFP8gHj9ixhKy/vk8pOo=
X-Gm-Gg: ASbGncu/vWakWg1+Kr96/WGH1MUPnA/1HvM10dsqH+piliTk9BwuOvZEkFIPpO7OO5H
	wd6H5KX1sj72okeShJSZHc1vl9qxgppdxDmXh9Lk0Qa2aAGvc78yLk3EHoRzir5yu12Upc6JhjA
	F8CWYTiXRjpIWb+bKe2Ln3XGjJuLcwtqyWID4MfWLaVfZDiqW2E/aAZn7S6D0gLPpGV4vzissAD
	e5ryotb17/YZ0fZnJbgO/+W/c5H8rgccUCd05UG
X-Google-Smtp-Source: AGHT+IESYxBHFA4uYPN/+uA3OHnZMD9hYgNrtllwU+PZefaQWJDWtjUg0+OCZc7iktp5NIl4QTrN3pl96XeW9OTHtNE=
X-Received: by 2002:a17:90b:3902:b0:31e:8203:4b9d with SMTP id
 98e67ed59e1d1-32183e4f157mr781964a91.29.1754605707866; Thu, 07 Aug 2025
 15:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANBuOYpLNAtLVWBvR9E74Ju4cM1K7H_bS2Z_UhthQFrJaZXmiQ@mail.gmail.com>
 <aIOHm4AOrhHBf6Xv@finisterre.sirena.org.uk>
In-Reply-To: <aIOHm4AOrhHBf6Xv@finisterre.sirena.org.uk>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Fri, 8 Aug 2025 00:28:16 +0200
X-Gm-Features: Ac12FXzK2GC3jOYi6VfNhIpak5X5ZBvlkLFU0I4pabgsBuIDIGVE8v3R54fc1UU
Message-ID: <CANBuOYrtmA-UgTo6X87pND9eTfub-R633scTzDef56gVvBVwig@mail.gmail.com>
Subject: Re: [Guidance Request] LFX Mentee looking to contribute to ASoC / DT
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shuah@kernel.org, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 3:33=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jul 25, 2025 at 12:50:15AM +0200, Jihed Chaibi wrote:
>
> > My name is Jihed Chaibi. I am currently a mentee in the Linux
> > Foundation Mentorship Program, working with Shuah Khan.
>
> > With a professional background in embedded systems and a strong
> > personal interest in audio that extends to my own projects, the ASoC
> > subsystem seems like the perfect place to blend these two passions.
> > I'm eager to apply my experience with hardware bring-up and Device
> > Trees by becoming an active contributor.
>
> That's great.  To be honest it sounds like you're already very up to
> speed so I'm not sure I'm going to have anything here that isn't pretty
> generic.
>
> > As I look to deepen my involvement, I am writing to seek advice on
> > where I can best apply my efforts. I'm particularly interested in
> > finding a substantive task where my skills would be a good fit, such
> > as:
>
> >     - Enabling audio support for a new board using Device Trees.
> >     - Assisting with bug fixes or small feature additions in the ASoC C=
 drivers.
> >     - Tackling items from the TODO list where my DT experience would
> > be applicable.
> >     - Helping with other driver enhancements or cleanups within the
> > ASoC framework.
>
> > Any guidance on finding a suitable project would be highly appreciated!
>
> One big thing with embedded stuff like this is hardware access to test -
> an awful lot of stuff is going to be hard to work on just purely with
> software.  Given that it's probably useful to take a look at what
> systems you have or can readily get hold of and then consider what
> problems they have that might be good to work on - things like board
> enablement would be an obvious example there, and it's common that
> boards have some support but pretty basic so there's useful things can
> be done extending that (eg, leaving a lot of features unused and just
> supporting basic playback/capture).  Knowing what you've got to hand
> would make it a lot easier to suggest concrete ideas.
>
> It's worth noting that a lot of x86 laptops these days are ASoC based,
> their SoCs are built in the same way as mobile SoCs, so might be worth
> considering those too.

Hi Mark, and everyone,

Thank you for the thoughtful advice, I am currently researching a few
newer boards to order, specifically looking for ones with incomplete
audio support.

For an immediate contribution that I can start on without specific
hardware, I've been digging into the DT bindings and identified a
challenge I'd like to help solve.

While learning to configure audio, I found that discovering the valid
routing strings (simple-audio-card,routing) for a lot of codecs is
kind of difficult. Currently, for most codecs, the only way to find
those is to read the ASoC C driver source for the specific codec. This
seems problematic for a few reasons:

    - It creates a high barrier for developers who are focused on
board bring-up, forcing them to navigate complex C driver code just to
configure a (simple) device tree node.

    - The process is inefficient and error-prone, as typos when
copying strings can lead to audio routes failing silently and being
difficult to debug.

I believe documenting these strings directly in each codec's DT
binding file (.yaml) would be a significant improvement. It would make
the binding self-contained and greatly improve the experience for
anyone setting up audio on a board.

Does this seem like a useful contribution? If you agree, I can get
started immediately on preparing a patch for a popular codec to serve
as an example.

Thanks again for your time,
Jihed
