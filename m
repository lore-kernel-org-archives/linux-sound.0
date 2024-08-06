Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A316A95C
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941706; cv=none; b=BgIXGYL1SmuuiyM8it+L+qXRgAI+msc99+tgcu0S90RiNRrPW4wTxt6c0F/ANRJXwTSv0T5ihEOtIFXrvjfStoUrd3FqUrkEv24TyCzastC8tC+25iEUo+f4VSluIHfo1+we96OOttjmWOnQas7cSw0i7fQtt8nHWiR9jCkdpDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941706; c=relaxed/simple;
	bh=D2mEX8kDercjOrBqgIFWbfKvjQUqPDWgcpij/uiEQv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5rfpfJZ/7lsg+AD8/5RnD+d9wqLS2iR6ELbS4qlypNbTUfSGRl7KQqjzswTP44DF5EetOaqmce4uuyT5fIR+fQRGwAzr9AeXApLx+TGQrM7sYTrUH+NuHL7xwq+hVjcCWBNJEs8thOsn72hHahS472hOeT9ytwI9P4RQD1JOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G//nlT5z; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G//nlT5z"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-81f921c418eso17985839f.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722941704; x=1723546504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2mEX8kDercjOrBqgIFWbfKvjQUqPDWgcpij/uiEQv8=;
        b=G//nlT5zyAIRd8FO5QOTVdF/O3ahZWtRhWMcAF9XNxlwqF7Uo+0NTw2L5lgTHHm1r6
         Wo/EyU61dJvSdpVTJmxM1NI0XUL58gqQBU69R4to4jhPMh4cEwEiUPqebOlUZK6D6TP9
         0AdFA5WfeUSePR+xz2qd5da0eX+d76sjd78ZoMBNzDwV8bNxzkxlS+w7FAYUelGc9nOm
         LA5U4oZS2NwA92itw2NnirwXnf+/BFGLrymmb1egOR8hAj2c8OI4hK5/Lg7c/d8qRs9G
         t6zdMAyPJEfZS92arQzhV2giRGbloiauaW3LGeIsXoH7CsGsd3WhOkA0BijVRb2c6Wyo
         lFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722941704; x=1723546504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2mEX8kDercjOrBqgIFWbfKvjQUqPDWgcpij/uiEQv8=;
        b=m2z/Leczf5/UAdxkD2eA2GCvK8oHs82NrHRwZ6puAkTnzU2vfteMMfgnBRdQUmQN9N
         62eD104U3wlGlM1sLEjpHkq4IbzQH+WDhOXssKgKvH5PuHZBQLClyyQEcbzXIlLfZFqe
         9S/892xY44A04z90/NzCn/DE2dA5iWWaGikPWiSGJpUqAYpNZNuZHF2mF0B/QFl8HJyg
         wxqGY/gK/3sRnNJuxd4HWERmMm2wJ5sJzZ0s9FEp3LcSbEpWhyzZdUnE4c6RJDcB8TTy
         anpaT7UdcIUM7sYIojEZZrC4Tb2jpCUH/ue0rF2/+fCdOuClo88FMuA1cyfb/74mMe4M
         p/+w==
X-Gm-Message-State: AOJu0YweBaTW6vJRAY1Ygp80EuFe/dgTVH4GXmx5cBmBQTMg9DDTQTDr
	56j15jkW+FeJjT636xZ7T5c1TQ2ZRBlGqNFI/4LX0vIbnkp4s3X/nLo9jwgxZ8lsNAdzoCmqG5B
	MQ9fPhAd6hkXRqfr7duOAYQZY/etwdfgn
X-Google-Smtp-Source: AGHT+IGWj+j8/VlbnGlN+IGBZl1r8vWpNgfTnJA95ZfUgmXeHAivsabxgTgMXOY/odGXV3nYpj70TAVzVvR9ZfcB+tU=
X-Received: by 2002:a05:6e02:1a4e:b0:375:acd3:31b3 with SMTP id
 e9e14a558f8ab-39b2016a9a9mr158124485ab.5.1722941704160; Tue, 06 Aug 2024
 03:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731083843.59911-1-perex@perex.cz> <87mslq9el4.wl-tiwai@suse.de>
In-Reply-To: <87mslq9el4.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Aug 2024 18:54:53 +0800
Message-ID: <CAA+D8APHT8-wsKjqbkP+0gEYXWRFfpNuSpjAQ6Uf_RxZzNQT-g@mail.gmail.com>
Subject: Re: [PATCH v5] ALSA: compress_offload: introduce accel operation mode
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 5:37=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 31 Jul 2024 10:38:43 +0200,
> Jaroslav Kysela wrote:
> >
> > There is a requirement to expose the audio hardware that accelerates va=
rious
> > tasks for user space such as sample rate converters, compressed
> > stream decoders, etc.
> >
> > This is description for the API extension for the compress ALSA API whi=
ch
> > is able to handle "tasks" that are not bound to real-time operations
> > and allows for the serialization of operations.
> >
> > For details, refer to "compress-accel.rst" document.
> >
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > Cc: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>
> Shengjiu, does this framework fit and work for your device?
> I'd take the change only if there is a real user.
>

Thanks. It can work.

But I'd like to send my implementation which is based on the patch
to let you have a review if my understanding is correct.

The patch set is:
[RFC PATCH 0/6] ASoC: fsl: add memory to memory function for ASRC

Best regards
Shengjiu Wang
