Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2D282F18
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 06:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271850; cv=none; b=DdO8pfBcKc/XBzfKXTDpx2MF46pvM2GjAWI//9Z8+JvkkoT+R0lmQiSMK5CiinDsjsCtPiYnYe8Gtlq46WpMyONk+CaiJUXq0YIytb+2wvLjYhkrAEMWmqDBGGChICLQaTfOJXnT+baX1EqqXO34L6oFE6X8Ix5PKEvysPi1oW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271850; c=relaxed/simple;
	bh=mZ6uUNz03jsYgNmhxSQjw8vpNhoL8/WYS6cwn0Zk9RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJGBjbTi9hAgtZoiXeFc45xZ5bOZBHUJ1xiA7KYmpYrE5IclpAifelwOWXQMS+DzzbHSTSAKJPt6VeqZs05H3dLxQ8wzHjKgm/wVs4kn+gJIN+CG4bVGIyiLZheSAr5PPFcgNHoyX2nJdDJ04ocR5EXvpDw5zhFnXQg+KMvq2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=QRomogZ9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CTfbzrM1; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="QRomogZ9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CTfbzrM1"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id AC5861D0018F;
	Mon, 27 Apr 2026 02:37:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 27 Apr 2026 02:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1777271846; x=1777358246; bh=JQ3jX8b45w8e7K1rh1Scy9p9GYcqQJqT
	FHq7yLZacpY=; b=QRomogZ9/FO6Xf9+1ThQ2fgu5cMghsqXMgSnKxaGLhR2RMXC
	ZeNUp1i5XN8KfpdU6L9fHA0IgT5fjIpg7LA9xDr3nHvXrTZdiXEXDuaki8Gu/Ms7
	Jx9nIC9MQYWIJdAs1lh973ap91i1WC6iDFpGAYAGwxzfIy48AudfQB00uzrkXYcT
	pbLJZ06aiLv2wJMkK2pjInT7R3waA7jLmRtqFpoiv+Gq/C7iVqqp5S4TAcI44onm
	HtyQanW19pcwQ9J0h8gN0OoaSM/ikYcJlrbnfk+4Kkklv2Q8zA693jMCaWVa7xRw
	dGbbipC3HVzQIn8nB/pWek5g9MnIGReoUftNMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777271846; x=
	1777358246; bh=JQ3jX8b45w8e7K1rh1Scy9p9GYcqQJqTFHq7yLZacpY=; b=C
	TfbzrM11yMbj30X6TZc4tP9tRncb8/KnWJgBQAqeMpAdJLii8ct0mSjuOQ78k0zY
	/ddBCmyfynUJB2G6HdYtt3bAtjF/QNl7x6pyLTyRCPxi4YMtouSM4OVZzyLkmkqf
	emYY8lOD4MIqA0B0BrDmkjMKqaefjc4cJ5bkFrVFzoSqogfkYnGEjUMYMhu8a2HI
	tcLus2nvDDnmlMUscySrm/pndKAXD8WVbAjpdPMPhlHuJDmARIB9Hf/Va8GggCoQ
	Sazbsi58C5naXtucXSPOHNpAr8JqrNHET19rRaKh4nurwk3a4Zm58XT1MEGFRZOX
	N3FKxSUMooUkEX8AmiKNQ==
X-ME-Sender: <xms:JQTvaYDP6xZQiCZ2NcRnJ0vJHXF79GIhCkKiMsGeHoYaeH28KZFLlQ>
    <xme:JQTvaQjR1sG2Fm9V4QGloMX12gH9SoRdrJUXgUsZBeECbLJP1YQRmcOvVx-aeBGN_
    vTP0Mt3zBJBodjBrPu-qTl6qEdq9eof1IIvWNNH1GtDwK-rADNnLg>
X-ME-Received: <xmr:JQTvaWaZZL9-ZDc4UTUaBeFiD9wknIy_i1sVYlbU_yXRC0pwIdBTAAQwDm9CBm9G6fLau5h6Kypx2JsIBbV84ZiJL_IFug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejjeellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhepfeevfeelgfefveeffedvgeffhefghfevgfelvedviedv
    udekgedtheeukefhteeunecuffhomhgrihhnpeduqdhrtgdurdhmhidpkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    ohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtohepud
    dtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghn
    ihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegtlhgvmhgvnhhssehlrgguih
    hstghhrdguvgdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthho
    pehtihifrghisehsuhhsvgdrtghomhdprhgtphhtthhopehlkhestgdqqdgvrdguvgdprh
    gtphhtthhopegthhhrihhsthhirghnrdgvhhhrhhgrrhguthestghouggrshhiphdrtgho
    mhdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurh
    gtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghngh
    dqvghnghhinhgvvghrihhnghdrtghomh
X-ME-Proxy: <xmx:JQTvaRkFIYDhs1-x88yUg0rzhAYA1Xzj50gTKFTJe3inxX2DAemW5g>
    <xmx:JQTvachjKiO9lTs_-n-B_5gA3DZc6gFtimeZVSjBmHgCYRy-IgLXwA>
    <xmx:JQTvaTSyit15DOgN2z5EZp24PeMEyGJdLNMlzVb4pVQGjNPiqzvMGg>
    <xmx:JQTvadbbZkcmfEqNST3BjpEhP5xyQy-Eyy5lk8mfPnjQQ_nQK413Xg>
    <xmx:JgTvaZXmuO-_EFgV9hh_dMCnamB1BIjEgI535aXOJQ2c47iXNienjWyr>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Apr 2026 02:37:22 -0400 (EDT)
Date: Mon, 27 Apr 2026 15:37:19 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <20260427063719.GA37068@sakamocchi.jp>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260423141959.GA268626@sakamocchi.jp>
 <aepEedmf6sA83XpQ@monoceros>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aepEedmf6sA83XpQ@monoceros>

Hi,

On Thu, Apr 23, 2026 at 06:53:12PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello Takashi,
> 
> On Thu, Apr 23, 2026 at 11:19:59PM +0900, Takashi Sakamoto wrote:
> > It is unclear who is responsible for maintaining the 'ieee1394_device_id'
> > structure in include/linux/mod_devicetable.h, but if it falls under my
> > responsibility (which seems likely),
> 
> It matches my understanding that it's indeed you who is responsible for
> ieee1394_device_id.
> 
> > I would prefer to postpone applying these patches, or at least exclude
> > them from this merge window.
> 
> I don't expect them to go in for v7.1-rc1. My idea was to send this kind
> of patch during the merge window to allow to get it into next soon after
> the merge window closed to allow some cooking in next.
>  
> > After reading the discussions around the UAPI, I am not fully convinced
> > that your patches appear to provide clear benefits to existing
> > IEEE 1394 bus users or their software. From my perspective, the motivation
> > appears to be primarily related to the CHERI extension work.
> 
> Yes and no. My motivation to work on these is triggered by CHERI indeed.
> But I already worked on this kind of update even before I knew about
> CHERI to get rid of the casts. (Back then it was about i2c, see
> https://lore.kernel.org/all/20240426213832.915485-2-u.kleine-koenig@pengutronix.de/.)
> 
> For me this series is a sweet spot, because it allows to reduce the
> CHERI patch stack but at the same time reduces the amount of (IMHO ugly)
> casts involved in handling pointers in .driver_data. With my mainline
> maintainer hat on, I consider the latter alone a good enough reason to
> apply patches like this. One issue it addresses en passant is that a
> part of the casts back to a pointer drop the const attribute, see the
> output of
> 
> 	git grep '\*).*driver_data' | grep -v '\<const\>'
> 
> . I didn't check for false positives in this list, but I guess there are
> not many. This doesn't affect firewire though, there the casts are all
> fine.
> 
> As my patch series doesn't introduce changes to the compiled drivers,
> the effect on bus users or their software is admittedly quite limited of
> course :-), but I'd hope that you see a benefit in the 2nd patch even if
> CHERI isn't (and probably shouldn't be) a motivation for you.
> 
> The reason I mentioned CHERI was mainly to be transparent about my
> motivation, but this triggered more discussion than I liked, distracting
> from the advantages of the changes for non-CHERI archs.
> 
> > As you know, this subsystem is quite marginal in the Linux kernel
> > codebase. Given that, it might be worth considering whether this
> > subsystem should be excluded from the build target when capability
> > pointers are enabled (e.g. via Kconfig, if available), since it does not
> > appear to work outside the ILP32 or LP64 data models. It may be worth
> > carefully considering where effort is best spent. I can understand the
> > merits of CHERI extensions, but changes related to this subsystem would
> > likely be acceptable only after the kernel core functions have been
> > updated.
> 
> I wasn't aware about this limitation. struct ieee1394_device_id just
> happend to be near the top of include/linux/mod_devicetable.h. (There is
> only pci_device_id before, but I wanted to start with a smaller part of
> this quest.)
>  
> > That said, this is just my current view. I would welcome any feedback or
> > objections. Besides, it is still one of my tasks to figure out how to
> > adapt the UAPI structures and the firewire core implementations to
> > non-ILP32/LP64 data models.
> 
> With you talking much about UAPI I wonder if you're aware that for all
> current Linux architectures my patch set doesn't introduce any changes
> in the binary interface because all have sizeof(unsigned long) ==
> sizeof(union { unsigned long; const void *; }). And the two adaptions
> (my introduction of the union for driver_data + your UAPI structure
> adaptions) should not restrict each other, right?
> 
> So I'd be glad if you forgot about CHERI and just judge the patchset for
> the things it achieves for current mainline. Of course I hope you agree
> it's a nice cleanup eventually and apply it.

Setting aside CHERI-related considerations, what concrete benefits do
these patches provide to the current kernel? Are those benefits clearly
explained in the cover letter and the patch comments?

From the cover letter, I understand that:

> A considerable amount of drivers for the first category uses the
> unsigned long variable to store a pointer. This involves casting both
> for assignment and usage.

The conversion between 'unsigned long' and 'void *' are not inherently
invalid within ILP32/LP64 data models. As I see it, the main significant
effect of these patches is to add a 'const' qualifier to pointer values
(and improve type safety, presumably in your view).

If that is the case, why do the patch comments spend so much lines
describing the size of unsigned long and pointer types, and CHERI
extension? These points do not seem directly relevant to the practical
benefits described above.

It would be better to repost the patches with clearer and more focused
comments so that subsystem maintainers are more likely to apply them
without the background discussion about the CHERI extension.


Thanks

Takashi Sakamoto
