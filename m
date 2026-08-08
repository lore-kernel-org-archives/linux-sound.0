Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E588B351C2F;
	Sat,  8 Aug 2026 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220974; cv=pass; b=uYJBvcux/6hG2zJIGInDIKkkMCoeld7z3JrtGK5uFDdWl39wjuFRtjjkR7FlvTAlWKx35J8+oNR+9KmJY7EJkCiEwlCuesrJtph4s9/UjVKVqv3Dwd4gU0iTW/4ay/8VWY+1j/JVJWqZhl5bvg9gWhRcjLXeLQsG2a43Z5jOKIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220974; c=relaxed/simple;
	bh=+AmvCWyVoHWCi6uaHpY5vR8y5jrXOColHlIO5B5QMR4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MprA7YQJAaMAXa778MBoin46pT3DIyDSbGf7eDfPe63SMdxZ47G9qmcNhvozUzSClz4Xj5CyPszrV46sgcwDso49xb2Ti33tLqJThsolrsZ3o5qOra+XV9YuSW2IoZrR5boJ/u6QqqENOz07kW6N7eoS9W8PogWj1ImpLbLuqB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nSy5/opV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="nSy5/opV"
ARC-Seal: i=1; a=rsa-sha256; t=1786220958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kZdHKL2MeA0yNb7iV9dAucOYKegcnGnBgIckplrUKKkoRvcsic3jCOyUac2BWZV1GtdUpjGLRthHjzm04e4o3SFuW2XegLr5Fyt9VICQhMVw7e5Pt+qa9HPB2yPSNmmDReWmQsyvebLfjXxZFVgQMuyU0fXBwW73+Coi9qzsqmQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786220958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L8donvBbrWCpAi6ksUBHmiDwvnjOq0ZsxKlmYVRqbFg=; 
	b=I0rHRsdN1Ky/rbGNGdUYBFYIbAS8fA44FSdVRFyhOmHiGXdIeGbFxWwY2M85oSVf8Q2vVFXVMG4ueyfNja44xUilO5vOSvelpzfbnsMsI4sROUw+68vbPFh9eaQMq/26H4b3t8SN/K4moquuI3HeCEnAPLLPhbFuElC/bxdCLZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786220958;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=L8donvBbrWCpAi6ksUBHmiDwvnjOq0ZsxKlmYVRqbFg=;
	b=nSy5/opV7xWLWHmMV13+hPW2nc6FzPAbbwNLK8WHyyIVP2phlct6it7ENnsSLDGx
	otgwGgyLha28/4+Bd+uYcFUL7GTENa9wloxFfZbJvY8//K+xG+H51HSueQqc/E0Azf9
	lOcVdRHB/4EdWdemxNvVSqdro2IgokLP/or40GK6Gaw/sY0Jq0A4noo6tFO4dYeUppC
	W56PWWRWXD/7Klx1uChPjvyQkMTKMiPwr0XJ/1EJmR6vABtOfxHVdx51DRMKnBQnuz7
	oXBiyXGaJcVzCXpqJ74dgGjo6SryejVAjHnwSk4g0j0ym4XGWIRnr4gpHrzaciN/dEL
	JaL93kH8AA==
Received: by mx.zohomail.com with SMTPS id 1786220957015100.21039322482738;
	Sat, 8 Aug 2026 13:29:17 -0700 (PDT)
Message-ID: <f7058fc33838e8dd9b8e7235387eb511c43222e6.camel@rong.moe>
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
From: Rong Zhang <i@rong.moe>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Icenowy Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260808221005.683ab7d0.michal.pecio@gmail.com>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
		<20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
		<20260804235515.7346606e.michal.pecio@gmail.com>
		<a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
	 <20260808221005.683ab7d0.michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 04:24:10 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Michal,

On Sat, 2026-08-08 at 22:10 +0200, Michal Pecio wrote:
> On Wed, 05 Aug 2026 22:32:00 +0800, Rong Zhang wrote:
> > On Tue, 2026-08-04 at 23:55 +0200, Michal Pecio wrote:
> > > My $.02 - was there no way to deal with this in userspace,
> > > or to make it opt-in rather than opt-out? =20
> >=20
> > While userspace can ignore hardware mixers via some configurations,
> > the current opt-out model is really about:
> >=20
> >    When we can't distinguish between both, will the extra advantages
> >    of exposing a broken GET_CUR mixer outweigh the disadvantages of
> >    exposing a sticky one?
> >=20
> > My answer is no.
> >=20
> > A sticky hardware mixer breaks volume control completely. If a user
> > doesn't know how to tell the audio stack to ignore it, it will be a
> > terrible out-of-box experience.
>=20
> Being able to work around it by using a different mixer control doesn't
> sound like "completely broken" to me. It seems the whole issue is that
> some mixer controls have no effect and you believe you can detect them
> by changing the control a few times and seeing if the vaule read back
> from HW changes accordingly. Of course, this also falsely catches mixer
> controls which are write-only.
>=20
> I'm not familiar with UAC and ALSA mixer APIs so I don't know, but as
> the whole issue boils down to incluencing userspace mixer selection,
> is there really no way to perform the same heuristic in userspace,=C2=A0
>=20

snd-usb-audio always caches mixer value and tries to provide the cached
value whenever possible. As a side effect, userspace can't detect sticky
mixers using standard mixer control interfaces.

Thanks,
Rong

> move
> the quirk list there as well and let users override it with a click?
>=20
> Regards,
> Michal =20
