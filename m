Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68E1E501C
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 23:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736294388; cv=none; b=sg3534giB++1wpOjjqdOgjQNhD1y9sq7+SO2aLIPisL6q8jT6qQctIG84ZAaKHbEY7AcgdSljuu4zEgVmdPZstTF7FmwkQaPoqRF+1dEG6MAYb+iRpMFdVt2V+4DYylqKvQfmcOZ70VwY3NmAgVLgRTLDwxAuVBDZYjweKSs8Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736294388; c=relaxed/simple;
	bh=uZa/eV/ouGW+0xYQuW2yFI3isuAgHPinS48+hjo9GjY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BeOnz88SpK8VKaYjbLmBHT08clvGprLEoSWWizZurnEDumRJ8a9QW8L2xD7LabCXFqLYt5Fug0QGlIuCsXSJ/MG6Urfg8a3KRzy37HXFVXrWqen9SdTyt1kMAVBgm573cW0xq7DGNWQ/atkwLHlKgvcdBmsxe3bxzToGBc3GkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=EXIRT2Qk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KNXzQjBL; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="EXIRT2Qk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KNXzQjBL"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 42A5F1380237;
	Tue,  7 Jan 2025 18:59:44 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Tue, 07 Jan 2025 18:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736294384;
	 x=1736380784; bh=mXmZLXNQoxoDAobMaeOW+os7GFKCghOZC6q2BzZOfOY=; b=
	EXIRT2Qk1rMG+GkYHakOrR04coaUjnUiVGJDxY3aTfgDQeVuUC2rBDtLA1PtTjl1
	l83zZsv5kUpnoqbCKTgJlfaHQDr66bIRN7ycIDh01YQxS2stuDU0hiln/YfJB1DJ
	EATyo+PXUy6O2fDAHBjfY7wh1Ye+z2S8wnsJNQCdvTX1ZUwrGdVg1Y6c2zR+3n18
	OTVW22lc/aN9LBsEd0IkgVoAgNlDP6zOl6eH/Hm1kU8A/9fmd2ht4ML7MSyPJV4s
	aVVzESEXdUTsM2HnhZaiDv8Cc02hyyuwCNmV8K1GjMahyx1pHPL4CyHPmDBSGpVs
	5jpaIEDLdaul6cjyZVwD4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1736294384; x=1736380784; bh=m
	XmZLXNQoxoDAobMaeOW+os7GFKCghOZC6q2BzZOfOY=; b=KNXzQjBLUF8DWER3C
	Ou3wZIwkc5r8iLWAiovGFzvT55vaJD4m0IKiGNW+PZbDvzb/v53veMDk9eHCTFdx
	eqZV06Lp85EiwIHkAV8kdcmUVdjsrclavD+weQcIfTisf9bJ4XbzkgT4vOGsvBS2
	Xbz1yCaGNRy3pA+EX9uUmWhFUXRKRbF3ux8Pa4048hAG+kVVfovHCziGvI+gMo4a
	V+xHL1xNd4c1fbBBDV49Vd61b9Re4AWNxihkd7aqj4B0nQuvXXF3MAYfLULS+OYW
	n7jrEDLID2ChrrmJgODrBV19goIP6h1isk9NBJT2q+M8ygNSsz6vwlnMF2FYE1MI
	59wPQ==
X-ME-Sender: <xms:7799Z4dDluGF-eX2cle46x8cWYs1OSQGzRS7G6Tpq5bp6JYnarf9ZQ>
    <xme:7799Z6MmEKgU33FO8cvNgw4TJ3bL5xDHe1Za0ng-5CGMKFVSibtlYHFckfYomnQg2
    yuBBH1Mz4azBvqJG0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegfedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdfvrghkrghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhih
    esshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepueeigefhleevgeek
    ieefkeefiefgvdevheethfdvgeefgffhvdeikeehleefffetnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgr
    mhhotggthhhirdhjphdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepthhifigrihesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhs
    ohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7799Z5g9OwEubCzNHJp0yPnunJef7fF5l8UG5RY4R5Y3ozeWYoCgyg>
    <xmx:7799Z981k5yi2KwjMhNhOhEi7s2MDJszsZ6DpFZx0iROebkv0Mcvag>
    <xmx:7799Z0sO7DQ8qsPucuMAR9g61xjwKooeOXdGx-PbRKp9524uXrIO4w>
    <xmx:7799Z0EUZFWBXEJwCA-3jcKIX2T2IJOGptQRRvI1RoFmusgJ2MMf5w>
    <xmx:8L99ZxV-AQPeCOogpM18VMSQb3TLYurU_Y2o8Ny8wVqKL-OC5dtUEEUy>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE2323C0069; Tue,  7 Jan 2025 18:59:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 08:59:20 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
Message-Id: <f0a9e099-b349-4ef6-9ea1-80a39a7148a2@app.fastmail.com>
In-Reply-To: <20250107155641.4435-6-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
 <20250107155641.4435-6-tiwai@suse.de>
Subject: Re: [PATCH 5/7] ALSA: firewire: Simplify with str_on_off()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, Jan 8, 2025, at 00:56, Takashi Iwai wrote:
> Use the standard helper str_on_off() to simplify the code.
> Only code refactoring, no behavior change.
>
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/fireface/ff-protocol-former.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

It was in my TODO list, good.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


# Akeome & Kotoyoro

Takashi Sakamoto
