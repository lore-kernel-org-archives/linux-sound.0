Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF9A29B78D
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482030; cv=pass; b=jqEqey7nC0cudUnPrWJ+lnYgLl1Q9rf2sg5njVEtQv624fBql+OXtePk2os5yX1a6QU87m1qdMZC18HOKj+zsNcgPQuVo3khUnE4PbHRazA0MAsObD5Mec26dcdSCXrXaqh3t2XU56aSiqWbstUHQQWbZUMg5PXPeGoNLNdbspM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482030; c=relaxed/simple;
	bh=KApMdkmNrz+muMUCWMkMoZkgrXloXX4+14GYMZwV35E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgKtV36Iu5VGMFgJ2kgrKvnR3xvBiCDRQBNowKcQ9ckCpZfldsxa/tGgbj/PxNnV8KBJAARdQub9iIBLLhcvfY42XAe5/MdlcX/8uOzETdpfDvLu37ovNtSvBIZXIS57Uqu3F+RnqYPIpkSEgooJnpyNbon7HKuGSmLipXNJIyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=Oze5VPN2; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="Oze5VPN2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so3750222e87.2
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 23:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778482027; cv=none;
        d=google.com; s=arc-20240605;
        b=MW4CpfrpMv7MfRLvDq4C0fHN6LmYQ9GxQ/mThgwfslvL2dGJ7Wy/WATw4Ij2rotqQ0
         9jlxqI1+Gwv0TJpPT0seCSkyBrj/9ne90LEZS+2+9a3xuko+yKTRiPOuyp6xTcimxucQ
         sJNTUdjhb9X7bpz7b+CGqaJ+/iEGucxpo9ab2Yu1VOVsuRjbam8gS6F2IHEv6hX9X6rx
         RnqRCwR3YVUnRAnBdcI7q7MqEQBQF4PRX/s7alazHYfOOJWlgavP8XaB359MQx12OnNm
         sQe2NN3HBNIpcKh223/RKsUHMucNkOU0UeRxDbzm0gOdKWUFN9CGvznP9IJbVqy+AVkr
         Uwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DT9NqVOrfLa6VbVk/3z+RVBjrJ+tKBjBV48nqurYZl0=;
        fh=SuHytUDezw6vBvHPATjfWEdQo18tLQ9kVLcT0i7mp5Y=;
        b=PDlpg5kuGzcFBC83GcpXBZM+p5NV6v19nVaAwByqRSUDBDN/SFbLJCa9zmiINddMmU
         cQkvtuac0Q+7w8yulSpjzqRSGq0BAO4h1akz/VukzvG3W4hyklW6E+86ikuznz65QBWQ
         WB78ZD/okr7ZTBzTpD6CJDttrYjcfPsSlip1oUELIms2s2qcKi0+r30TBG9bgLZOdF6H
         hE94Pi8LMs5oh8xSyXTHK31Virz4L5wlwOOeUYHEEzmVxlw5YJMotoAe1k+WOYWhL62F
         ffJup3Gd8UcGX7ST+S/EOOrwlJw6ZoA3MIs0Nt4sCR1M+xDZ1toHrCw8Za5qo6k0j/rD
         K5zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778482027; x=1779086827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT9NqVOrfLa6VbVk/3z+RVBjrJ+tKBjBV48nqurYZl0=;
        b=Oze5VPN2W9W573yaa+9R2AGpgeRRKb6uBN+e0onXzNpXYMHOMBloeH2LbWru5ypZyx
         /BOMW8mvQ78l9ZeWxzEBWRAcdx+hLhXVryD+ux40BHtzg+RqSg5P2fXI7GmZXx+86Z+s
         WUvCSd6iHK3HMykCHbjH4170Q7Yd7+V6UfhRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778482027; x=1779086827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DT9NqVOrfLa6VbVk/3z+RVBjrJ+tKBjBV48nqurYZl0=;
        b=e/TGKuvevv+fyiErJyvROvMOYPZW8MwHkx9PCLmEg4nJfrFFola4na7ys5H6l4WG4j
         arxuQk1b5FX09VTYiFFAACv2Ska51jscqIPm4nGFN6DKU5tN+L/j/vhZfJUBzvkb4nyS
         8TcQE64fsrplNe6kU+898HQi9dXg0748bgn3yUT7nJ0GzJNR9EvQ7mnp34R7NJeP6ZPj
         Kb5e5cCeRFHg1TA5ST7ii8/mJLA++GRupwtUGigYUkKBYz/BBT6YRiqeURIvnt7Aqvx1
         /q/YNstwFGSb6OHKlkFLjRAyucEPhytxcW/4XeXNk+DXYxCg2MlyZ1UhLMby+DistvOM
         nxoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zu+ItoBpOid/f6JHCtGNeK9sYArUlLMFlWLyeLIboBPvRaI7o7T8Ld/gUnLRdyPuXa6oz0Jxwcvpydw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJQU6MsRTDUSfkbitX7vqGB8vLxPXZDMkPGbtcGVMyCDMx0lJ
	tsgISVisgc8qExDf9OBMIflrH/KjtMGtoR9Elpuaj/nmFtkaZs4vhS3obn6EPPlrFnXOQzsxDPI
	DJB+Y81hQFTKrtwd9WyCWww4UrTFreWL/h8ADIN78
X-Gm-Gg: Acq92OH8Q4L9jCcPscVAiwFMewvB8lSB+iMyrvFrYAex1kwP8F8dUvnqeszD50DdbvR
	UqiNpxwnByf8/cm7R/kQbgiZoTXQIaFLljMddZ+wI3SU0N2GNYc8+TQvgwpErKxQ7g4XbJdEvBL
	vWaWfUz7ofd7ZeL5aDCXedo076oYISSFyTjZy1qU8R/qYJa0bsPCPrqbRdsBRu715KUSD/uPrY9
	vyE2Iq1tweW4porBqMvaEhnAgixQM8nHye0pSb6+xK11oAzGT9YmhN9ElHQ4M00x45XAQqNKLx7
	RYxzSRzgyZ/74DlOjoPh9/PN7GycXmwBIiOaK3SXKWQ9se5d/A==
X-Received: by 2002:a05:6512:3f29:b0:5a8:80c0:8e0e with SMTP id
 2adb3069b0e04-5a887cde872mr7723832e87.20.1778482026866; Sun, 10 May 2026
 23:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
In-Reply-To: <agExLK2GR0w0Z_N2@geday>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 09:46:53 +0300
X-Gm-Features: AVHnY4J53lmTtBaTv0FQGgtHKCM9AIui4wGYptEFMYJ-hrRFcL7X3qOVd2fPOUg
Message-ID: <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: david.laight.linux@gmail.com, 
	"Alexander A. Klimov" <grandmaster@al2klimov.de>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-edac@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Furthermore the one in versalnet_edac.c looks like beyond fixing a
buffer overflow risk and code smell, it also introduces a behavior
change (bugfix?), because the old code I believe cuts off the last
character from the copied string. (Because it was using just strlen()
and not using strlen() + 1)

So I think the effects of this behavioral change should be documented
in the commit message. (I.e. where did the incorrect string end up
being visible, and could there be side effects from fixing this? e.g.
Could some userspace scripts/applications start breaking that were
expecting the incorrect shorter string? Etc...)

Andrei.


On Mon, May 11, 2026 at 4:30=E2=80=AFAM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Hi David,
>
> On Sun, May 10, 2026 at 11:08:53PM +0100, David Laight wrote:
> > On Sun, 10 May 2026 20:24:41 +0200
> > "Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:
> >
> > > In the changed files, strings were copied like this:
> > >
> > >      strscpy(DST, SRC, strlen(SRC));
> > >
> > > A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> > > Actually, strscpy() must be used this way:
> > >
> > >      strscpy(DST, SRC, sizeof(DST));
> > >      strscpy(DST, SRC); // defaults to sizeof(DST)
> >
> > Nak.
> >
> > This is test code and deliberately doing things 'wrong'.
> >
> > -- David
>
> while the change to fortify.c is what you described, the other two look
> like good catches to me.
>
> Thanks,
> Geraldo Nascimento
> >
> > >
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   drivers/edac/versalnet_edac.c | 3 +--
> > >   drivers/misc/lkdtm/fortify.c  | 6 +-----
> > >   sound/soc/codecs/fs210x.c     | 2 +-
> > >   3 files changed, 3 insertions(+), 8 deletions(-)
>
