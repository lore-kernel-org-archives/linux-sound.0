Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395642550D8
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840689; cv=none; b=QgpkBqdJg5VkPc6aA9zWrmdIRGrY55OzKKbAcv1dSt6hxBcRvT1uND6RpOA+kHIBiaTPCwVKQzT47a9M9MoZgPrMpRbFam7qJRAXNLfqnvW0I6snjJZusXSMuJb4eHU62v9vWp1BwF2iiY5OOYHjlDlL3QfyZuj9caBMNBayjKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840689; c=relaxed/simple;
	bh=FqGy43gfGpC0dhZqZbKkR3fkuGz53QLElVJZ7JhkiUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZ/0OfXhdT3zXDDqJvoSipqV4Imjxs9MwHGUU0hxQ9aRiybvHExdinj3ca0Emzh5fa1dSZnUKjxHZ7uvNHArRrLdUcvLoFRuWu4u6vtMAp69nASeLXltQ/SUa6cQkhBtyFvRa7Kg5kIXxoTsajnHNHcSoRyF6I93nNrUnXUhaqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRzJCkLn; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRzJCkLn"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ae21804971so1987842a34.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759840686; x=1760445486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqGy43gfGpC0dhZqZbKkR3fkuGz53QLElVJZ7JhkiUU=;
        b=iRzJCkLnhUyniN2I/eLUEOUE2I9wysSf0Tn9Bb2TQEJa9b0v6mZsQ8k9G8xqhgdeV0
         Rvd48vtpzE2GmOIeE1FDaOgyrhNwcG7wJDAz3Y8p4JOTZcnXxkwaAAk/VG3N7VZwI2kh
         WGTmoJk8YicGgftmQtiHaF1m+ZanNKN7DNBBedHqj61m7l+0O9iqsOd3rlAczzpGh+qE
         J34ZUJKkHpG67xbsjTdwXqOotJGpr4kBnsxYO8lcecg8s6QnIVCHCotyGqmdpLTatkRK
         jZO/cidf451OnrIOGmqE+bHqjTOMYN4QRODZ/ALWc5q4FmtauGlTkUbodhPM+lQPvSBj
         DSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840686; x=1760445486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqGy43gfGpC0dhZqZbKkR3fkuGz53QLElVJZ7JhkiUU=;
        b=LRMoyu6xVYl4tJ6NUwvn9vu3kYKk3SCb+eDqi7yNNLgR26sBMyYw5FBlBxrxCPsKxv
         KrD08OFhJUffbi3ZmFSqZ41pGsQ+lT9ojjMYh7tKs+Pdu2Ze4ezlKitAZCYw31bJo+2Z
         HS1Q3ALekpDPTh1dCU5nKYN7a18IeLU4zaBAbXrMhUvzkQlVdYbsp2EtP/jGPWDyoiqC
         a2ETz3bJGzj2veqJlBORXOruJ0/B2i+Uxvf7Lxl49NFyk1YvX6XeO3Nm3JxJJEHlxVSZ
         UJ6eamcXxZDUTbxOpJWf4tEK5Bwj39cHcp8HfRstImso3a03Oa/zKPmT8pzwcSmtXlem
         bpyw==
X-Forwarded-Encrypted: i=1; AJvYcCUmqW4ndW29nMuVAjaZgex1wzTRiAYz8xqogaZktt6VXWD3myh6b6SfhhP3vhUoDmOv3Kwr9aahsDzbZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIEGmiy5yhFQRm3d9WRmjsyfytKMS8wAo2sOVbTiXb523pm1mB
	AtaX10ltFQfbbFTZ0ZBqtLm54UUDTuPVZQELwukzGSeET5dOorYKkqBGD1k/4A84B2rVqNd+84W
	EmOLcPRCLuWWSadjU0MsBgxkMULD3WiM=
X-Gm-Gg: ASbGncvIsZQaZZpDhqhnCC7DyojN8Fbbdi5HZtDDQzVL2uufMYtinu3mm1zJ2O0YQNd
	TlQZybAhpvwz5yH+MSYErmBFiyo4PZq+CF3sII15JiXd5utaPtIZywm0Ea/z8/AV5rlEuyOhK6C
	ABN+t2H82BSwrmdERFrenYMztDZ9nuZTOKA+vx8MlOEJhDJK21XQOtBCf02Frq19IwTYI1/1/gv
	vgA9u7bMYWj2F9txrWmLqFQtLbSv7Y=
X-Google-Smtp-Source: AGHT+IHZ4Q1KsuEJ1pqR5+8vtFxL7pJjjIBfDRaQBDyKPZ6VG8AUArxYvBKzVwGtoMC3aCwKA9pzveZXk8T5KqF5SJI=
X-Received: by 2002:a05:6830:498c:b0:74a:1f03:db5a with SMTP id
 46e09a7af769-7bf77207494mr9265727a34.3.1759840686185; Tue, 07 Oct 2025
 05:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <aOTrsYllMst3oR03@opensource.cirrus.com>
 <CAN7C2SB5Re35yGYsqr14hGXde3nTKLX2Aa3ZbuJ9xuT0m07uxg@mail.gmail.com>
 <aOUDbF/i4+9PXc1j@opensource.cirrus.com> <e507ace6-90af-4763-a1e9-08e02f9e63f1@sirena.org.uk>
 <aOUHDJW5aJzD7Ku7@opensource.cirrus.com> <a8d1438d-02b7-4e08-ad4c-17467562a753@sirena.org.uk>
In-Reply-To: <a8d1438d-02b7-4e08-ad4c-17467562a753@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 20:37:55 +0800
X-Gm-Features: AS18NWABs5AF8rfR_3Gk60qIc3MD6zuHTwIjZu8GC4D6Bfwd_ZzLHsR1fhkjW2E
Message-ID: <CAN7C2SAQ0rCZ=qPfh_MfQg_z0u7sWyFpFHUa2-Wwh_iTnNJGLQ@mail.gmail.com>
Subject: Re: [PATCH] sound/soc/codecs/wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Sune Brian <briansune@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Oct 07, 2025 at 01:26:52PM +0100, Charles Keepax wrote:
>
> > I don't see any current users for the manual divider configuration
> > at least in mainline, so we could probably just drop the manual
> > stuff. I don't think I have a strong opinion between that
> > and blocking the automatic configuration if it was previously
> > set manually, but we should do one of them to keep things clear.
>
> Yes, definitely.

if you read that code more clearly. It is a case that is select between
WM8978_OPCLKRATE and WM8978_BCLKDIV.
With the latest test on the dts file.
When running such codec on master mode the bclk had never set to correct
bclk rate. As such even you see that codes exist. It never run as expected.
I am not sure any adjust is required on dts but with proper lrclk and
mclk output.
The bclk is wrong on that version.

This is why I propose the patch of the bclk.
