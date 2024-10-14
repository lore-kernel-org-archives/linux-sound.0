Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB0139D0B
	for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728921835; cv=none; b=EIlnsGeffaGEyL5iXDStMG8H/edevg9Ejlh7/aCimp7urJIE9IeQLp/QtPXJin+ObCb1n0+Mz+6zFfqHor0duEbzhQHxPUZhNx1W8GwgDnTx1lLplGZ/zB6msbZTS27l5KfwG4qeChiHkpleygXqhnhj7y5YKeuUA0eqrxQwqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728921835; c=relaxed/simple;
	bh=COmcZXpGnVpwik4ozxRAAx5Yuahvbc4v4jdOsnCYfPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGZl3V35ZwWV188trZV7HKwJw5vpI2buV/ktsGPKUgbAY8E1rw/EUUHArEv2ndSahhu/7tXarwYOFEClue+wDwg+cnMC+2yglzFgadNqcaJLC4E0Xsg4JqsTZeDc3yw1QiBvnLsYU11pYOl8mYGThPV+I579tZL0kCv1ZwLgzVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=ILvO8Uuv; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="ILvO8Uuv"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-717da7cb71fso1143065a34.1
        for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1728921831; x=1729526631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+wOzfgNyCeWVC2ETTq/hEZZ3iEU2YyrUqz1kGdk31o=;
        b=ILvO8Uuv6vq0AzNb2XTlWS7IA0t8kWOD/mLYrthM/zJvxFGbf89FRpYZ3mXGwrlN+x
         0i1Yc9icSBiD7MbYL+cWkwT9bc7Gl1BR+drp1Plg6s3fyOcn/oGCiPL/Knr6SnmJ8eIZ
         CHjwBYYShmoNuVF9JXhWH83uHK0nOzvXAly1R39nIbrDV/ZukAWdcDSESK/hR4nwGQPd
         EuzbSr9rxIDPmjPz3ZNkmA79TLBeuRRUecxu4t6qMq07r9hInVPi6gN/4UcpYUBPfbrf
         x6VFc6Y99d1GzsrdikfrhQnhAhyQh8Q0uIwyp31Ve6iSlseEsHnVnJwQCnZdbFm/eWRb
         hKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728921831; x=1729526631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+wOzfgNyCeWVC2ETTq/hEZZ3iEU2YyrUqz1kGdk31o=;
        b=cxudhPLVFN2uRULjrjQcIbkdOFPjmjzrHKHE7WY4K6za6XkyeEzrdZYNZzJtc3JVN1
         7nMe+kNte3e4kdDO7alKGjaDbdxaEGRDQDwRqdycvRvvwGM970RxrmfKtOogGZaZ35iK
         GNpANllhu25Cg3tmqqiwqZBQZ+tTG1X7dDrsjd/jdhVfE5wZdlLqZE/3hBsBVHPiMovv
         KJ/vTaFKo9NIYZFdQwGOF0VzkhILfHt8dVf62jqt1BkHC2/z28gw8uKYHZS6UFl/DLF1
         lV5+YAIJUnsDmAXnWoUxiq5FWGBW+D3gcZm4UFwf9ApM1zubPGXtaKBCYY5MkOhfoNSG
         dpsA==
X-Gm-Message-State: AOJu0YzYGU+RbI1x6vw43A7tkvZk3ZWZ+EjZW7Y5JvoEl5zzjDhjxEoI
	mfvXya3un4Da67Nm+MDh3k6zksWuDH9XNwci+H8vuRF/+MuP315JY/cXgmWYzKNF1iXePuoNkMR
	yXrubYbEMRVIbO4BTK5FVq/5REMYiTzym9QHMm1lAnYeg3RE=
X-Google-Smtp-Source: AGHT+IEpcFCz1ybklLITp+t8565kqk6CVcH+RpnlsvbfZLJ3cEfVSs1IC8gXXaKYrlQ9KbhcpENQP9okL1tF1oN8uqk=
X-Received: by 2002:a05:6830:3699:b0:710:ff85:42fb with SMTP id
 46e09a7af769-717d642c2a3mr9225138a34.16.1728921831396; Mon, 14 Oct 2024
 09:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFa_cKmDynOwheDU3gH2NMbj2eRAPEkLL+PP3zd4S5+enVK5Ag@mail.gmail.com>
 <87wmibjfuk.wl-tiwai@suse.de> <87seszjfj3.wl-tiwai@suse.de>
In-Reply-To: <87seszjfj3.wl-tiwai@suse.de>
From: Paul Davis <paul@linuxaudiosystems.com>
Date: Mon, 14 Oct 2024 10:03:40 -0600
Message-ID: <CAFa_cKmS-DHykwA=Ej1w9i3+yfz4wyPJTtEG9ADNTJ8t2GSBQw@mail.gmail.com>
Subject: Re: something went wrong with USB iJack data in kernel 6.x
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The thing that puzzles me is that the iJack strings are missing from
the output of libusb -v, which AFAIU is 100% independent of any ALSA
code whatsoever. This makes me suspect that no ALSA code is involved
in this regression. I've also determined since my email that some
other devices (e.g. an Ableton Push 2) do have iJack name data with
the 6.x kernel.

However, things got curiouser as I was trying to get the output of
alsa-info. It seems that under some conditions, the iJack strings for
the problematic device are available/displayed with lsusb. My initial
run of alsa-info showed the iJack strings, subsequent runs of
alsa-info and/or lsusb -v do not. I also see a continuous stream of
USB device resets (though these are not happening directly after being
connected and do not seem related to the presence/absence of iJack
strings).

So my guess is that is a highly device-specific problem and not a
regression in any part of the kernel.


On Mon, Oct 14, 2024 at 1:42=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 14 Oct 2024 09:36:35 +0200,
> Takashi Iwai wrote:
> >
> > On Sun, 13 Oct 2024 18:56:57 +0200,
> > Paul Davis wrote:
> > >
> > > I don't know where to start with this issue, but since I noticed it
> > > trying to use a MIDI device, I thought I would start here. Advice on
> > > where to take it would  be much appreciated.
> > >
> > > High Level symptoms:
> > >
> > > 1. plugin in a Novation Lanchkey mk4 to (a) a system running kernel
> > > 6.x (b) a system running kernel 5.x
> > > 2. run aplaymidi -l or arecordmidi -l
> > >
> > >   Results:
> > >      (a) kernel 6.x: note the presence of two identical MIDI port
> > > names for the device
> > >      (b) kernel 5.x: note the presence of two differently named MIDI
> > > ports for the device
> > >
> > > Mid-level diagnosis:
> > >
> > > Run lsusb -v on both kernels. For 5.x, note that the iJACK displays
> > > include a string for the MIDI port name. For 6.x note that this strin=
g
> > > is missing.
> > >
> > > Working with devices bearing identical ports for multiple names range=
s
> > > from extremely difficult to impossible.
> > >
> > > I have no idea what layer of the stack can be involved here, other
> > > than that it is not hardware. I've run both 5.x and 6.x kernels on th=
e
> > > same system.
> >
> > Could you try to narrow down the regression range, e.g. by testing
> > different 5.x and 6.x kernels?  The best would be git-bisect, but
> > figuring out the first broken kernel version would help a lot
> > already.
> >
> > Also the issue can be very specific to the device, so please give the
> > details of your device.  e.g. the alsa-info.sh outputs from both cases
> > as well as lsusb -v outputs.
>
> And, if it's about iJack handling for MIDI v1.x, the only recent
> change I can see is the upstream commit
> 41c25e193b2befc22462aa41591d397fab174ca1
>     ALSA: usb-audio: More relaxed check of MIDI jack names
>
> You can try to revert it.
>
>
> Takashi
