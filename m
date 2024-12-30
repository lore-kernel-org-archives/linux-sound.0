Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D41AAA1D
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735574042; cv=none; b=OKn55rt/g/6uURWXE2DJZHaXISgtLLHEUwGi/ppruGtbrVvmhzmgXlI/3vBT1zvsJmXEvO1EiLzIsp4ogN79E4pdB9tutvtFKNQr0FpvxAOqpjPXMGoxnqVjopKfri9PcOgTjrzIcaRKnegk77anaNCdkcx8SL+VFbhw0zRGIh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735574042; c=relaxed/simple;
	bh=u1qZxjTN/I8VeHHrRsLb0Q1awTFftty/vNs7/L0JYCI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXeJOn14xag3J517k22lzrHM/QuTBv6i3j1WF4E3y8+UhRJA/UDrQWB7xQBoMWvVYxRPzpFSDlfeaOWe4iY2ySAxri6prV9+5FQFezsccAUtv0AK8pugD1RKOCcwR8TiNDwsFeYn90ptq5IMnYbiGmbrsBlmJng5XacvjTaNh6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=FVsee92D; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="FVsee92D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735574032; x=1735833232;
	bh=76Xs6lsuPHrwCx42tlON02K42BaMujLBWWScaPLRl4s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FVsee92DXo9b3OFaHjvQcbKFkWz/gAmDujN2nXqmZ26It3q2phJ0QdYjQVXFnJ/T+
	 9GbxwkTHsYywy9g+NuljU6b+9iYlXjRDF3yO47qi4McTAUaiIkfzI9BqEG5vox1wVT
	 SrGPevmXQCO2wQg53nQ/zhvpl4R3fIa3fIEKANJSroCi+6+b0jII0EBp14jGTjtQnW
	 a91W6ylBxcqhPv2EEFU766WajbrBuEkIyFNqF98roAeBYmcg+uh2svm1DH+CuIaGw/
	 hUsLU4ea7zx25uPuqDVY7tXM8lGpPtPWspNnhqZ8X23SjyBchAc6IqqySD6lr1ssed
	 v1MsgLPTbJMuw==
Date: Mon, 30 Dec 2024 15:53:47 +0000
To: David Laight <david.laight.linux@gmail.com>
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Takashi Iwai <tiwai@suse.de>, "wychay@ctl.creative.com" <wychay@ctl.creative.com>, "ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
Message-ID: <7al7kxlm6qlwbm2qwfil2a5mt5w44sgjtwghnwq53jgqguxbqg@2mctepauowki>
In-Reply-To: <20241229133429.5fbed930@dsl-u17-10>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com> <20241229090228.75f8a3ba@dsl-u17-10> <87frm6dfda.wl-tiwai@suse.de> <20241229105722.03ada34f@dsl-u17-10> <87bjwuy9ub.wl-tiwai@suse.de> <20241229133429.5fbed930@dsl-u17-10>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: c7eb97adc54ffa1cf663332866a140c01764d520
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24/12/29 01:34PM, David Laight wrote:
> On Sun, 29 Dec 2024 13:03:56 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
>=20
> > On Sun, 29 Dec 2024 11:57:22 +0100,
> > David Laight wrote:
> > >
> > > On Sun, 29 Dec 2024 10:10:09 +0100
> > > Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > > On Sun, 29 Dec 2024 10:02:28 +0100,
> > > > David Laight wrote:
> > > > >
> > > > > On Tue, 24 Dec 2024 23:16:17 +0000
> > > > > Ethan Carter Edwards <ethan@ethancedwards.com> wrote:
> > > > >
> > > > > > Hello all,
> > > > > >
> > > > > > First of all, happy holidays.
> > > > > >
> > > > > > I was browsing the ctdaio.c code and I noticed a lot of
> > > > > > duplicate code and functions, specifically:
> > > > > >
> > > > > > dao_set_{right,left}_input and
> > > > > > dao_clear_{right,left}_input functions.
> > > > > >
> > > > > > The functions are pretty much identical. They only
> > > > > > differ in the side (left, right). What was the original
> > > > > > idea in doing this? Wouldn't it make more since to just
> > > > > > have an ENUM (left, right) as an argument that would
> > > > > > determine the side and just reduce the function to
> > > > > > dao_set_input and dao_clear_input.
> > > > >
> > > > > Hmmm... you'd have a lot of conditionals inside the function.
> > > > >
> > > > > They also look like a memory leak just waiting to happen.
> > > > > I guess that an earlier implementation used a separate kmalloc()
> > > > > for each imappers[].
> > > > >
> > > > > Why is imappers[] an array of pointers not an array of the items?
> > > > > Each is just 8 bytes plus a 'list_head' (2 pointers?).
> > > >
> > > > AFAIUC, it's a setup of a chained element, so no leak there as of
> > > > now.
> > >
> > > Unless someone calls the functions in the wrong order.
> > > And that seems to be outside the control of this code.
> >
> > Could you elaborate?  The chain element gets released also by the
> > destructor, dao_rsc_uninit().  And this is no exported function to be
> > used by other drivers, but an internal one only for ctxfi driver.
>=20
> The code is just too horrid :-)
> I missed that when dao_set_right_input() calls dao->ops->clear_right_inpu=
t()
> it is just calling the static function just below.
>=20
> I think the two 'clear' functions could be combined as:
>=20
> static int dao_clear_input(struct dao *dao, unsigned int start, unsigned =
int end)
> {
> =09struct imapper *to_free =3D dao->imappers[start];
> =09unsigned int i;
>=20
> =09if (!to_free)
> =09=09return 0;
> =09for (i =3D start; i < end; i++) {
> =09=09dao->mgr->imap_delete(dao->mgr, dao->imappers[i]);
> =09=09dao->imappers[i] =3D NULL;
> =09}
>=20
> =09kfree(to_free);
> =09return 0;
> }
>=20
> static int dao_clear_left_input(struct dao *dao)
> {
> =09return dao_clear_input(dao, 0, dao->rscl.msr);
> }
>=20
> static int dao_clear_right_input(struct dao *dao)
> {
> =09return dao_clear_input(dao, dao->rscl.msr, dao->rscl.msr + dao->rscr.m=
sr);
> }
>=20
> Although I'm missing any other code that actually indexes that imappers[]=
 array.
> So I suspect only [0] and [dao->rscl.msr] are ever used??
>=20
> Stanger things happen in the set functions.
>=20
> =09David
>=20

Hey David,

I used large parts of this email (with some modifications) to submit my
patch [1]. Do I have your permission to add Co-developed-by: and
Signed-off-by: to it? I want to give you proper credit and attribution
and I figured I should ask before putting your name on something.=20

Thanks

[1] https://lore.kernel.org/lkml/rwfdemj7ic7rnxnycnv6sxixtfmyqnoi7u6wgulzps=
jf7qm6oh@xwkyteg6hak4/T/#t
--=20
Ethan Carter Edwards
CompTIA A+, Security+, and ISC2 (CC)
Ham Radio: AE4CE
Website: https://ethancedwards.com
GPG: 2E51 F618 39D1 FA94 7A73  00C2 34C0 4305 D581 DBFE

