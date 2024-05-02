Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505120B3E
	for <linux-sound@vger.kernel.org>; Thu,  2 May 2024 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714640609; cv=none; b=HcoA1Ma+8YdZav6K2N5q2UjrMKdHtwaZexi3JNjPyTsqesC6e7EOBH9oDg1SJREmp5dZNqN5qtVl0RluYW6SGyFIYadaQEgakjHTkN7X/shSiqhTtlJZ8N3zK7aPY1tNaJ8J1mbvdRAq36yyh60thstXwIg9fC9IGiUWFhMlwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714640609; c=relaxed/simple;
	bh=lEtKJxXSlmQvsqd7yCKAQ50PVGAGqW5J4DYlQOjkAc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=She4j7bGvPTTcLY0n9uhVkQA1uxrOLgwxozrbEIIyLKK+VhDmshzTn/Apt9HOt4ZyFlYASz6g4AF5Y7GCPfX+doUolzlDKz31AI8dFKZ6+dc7RTLSFZmUD9VAugW2f53Zj9pXOVvnuH1U85E1xfn7fUtfxtTzcEXJH55fo+27CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Txti9GQM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Txti9GQM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a58eb9a42d9so657448166b.0
        for <linux-sound@vger.kernel.org>; Thu, 02 May 2024 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714640606; x=1715245406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEtKJxXSlmQvsqd7yCKAQ50PVGAGqW5J4DYlQOjkAc0=;
        b=Txti9GQMAaaj/s9pKlqbZaYFuX8KSjUe0S0djkV8baLwVtgCUO56VFmCG+9CInMLQj
         U+zBjsmNUeckYoQS225J5PbtSbScFnt9jlU3f+h8pYjs2oOttWc2sHK+5Ak6iCg5FnB3
         4DKHxAT38rLUPtq/bmRyaHkpuJLzBC1dufcOBk2D4mRhMPd2uXoBWXlipJnP9LfqHXaN
         QkETqy1LsirpasFxbsW8WWf6tRMGmrI504b/miqLcIa75SH88oNx9YGelGGKPeAhrSUa
         DZz2LmEBQz3Rvx+DOumebaj00S3fyvwd12A/XWra4RiTTfPPDQHcr9kg3yXpHFGKhrH7
         Rs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714640606; x=1715245406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEtKJxXSlmQvsqd7yCKAQ50PVGAGqW5J4DYlQOjkAc0=;
        b=k1eMp+LdaeOTci6ddCAn57rtCqNe3nzYiZqy/V0Ug6/URAamjAV8ATBDS7+N+mqfeg
         YhxJgtw3iJ9J69X1H5EeCXxSblQ9QtoTzHo4AbOIYIZG2KvvzBoUmZCX0y3UhqtLVUeH
         b+i13pEN2QKbS+rLVVR8Uzd/cGV1fa4p2I8b8oeju0l4UqXcsPk6oCoTu1ewWOMDtHmI
         26m7yZlKKvqIL9dQfK74vRyEzYImnby4NMzvaj/8ECcG5Aj7OS/eu8qiGOT3zdgElKSy
         xzj+loTzhzl8JhKffpQq2I9KxdbhM9JFBKE6j9OW0kggyGhZnq/ovfy50x37fRF9BUNc
         JPiw==
X-Forwarded-Encrypted: i=1; AJvYcCXiS5AAZrLehEDgebOk8mUSgZCB8qiaxFJnG4lZCU1yUk5LUUTg9VhO9KzuJry1s0/H46dcVkLHgkA46aTPqMTakiqor2diDQK2/sk=
X-Gm-Message-State: AOJu0Yz2/4lRE+5WbwieMVx/arPh49Ke6FOBargPlkn+a1gWr+oqvTlq
	K2CYLRWIRp/ArcKVPQ19T47Z1PeYHMlnotLRzQFBXnZgw8eW40S+wE+Ep7HGXLCjEi7Z+kgHxCo
	3SY4YPAVd0bs120WfPgJPvaTDmxg=
X-Google-Smtp-Source: AGHT+IGw94Wmij15AjtKfmzjYu/+fDi97bU83JzDlqFnLK4MVTKfhR6YGZCnHgrja/O5jnNNaC6YaeBpl+sPbJB9VJQ=
X-Received: by 2002:a17:906:40c9:b0:a58:e4d9:618b with SMTP id
 a9-20020a17090640c900b00a58e4d9618bmr2903169ejk.19.1714640606290; Thu, 02 May
 2024 02:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 May 2024 12:02:50 +0300
Message-ID: <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 10:47=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.

There are some drivers that have other (than I=C2=B2C) ID tables, which
follow the same format. Can you also do the same with them for the
sake of consistency?

--=20
With Best Regards,
Andy Shevchenko
