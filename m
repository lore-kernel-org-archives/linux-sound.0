Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA50F15199C
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 00:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738801612; cv=none; b=h5kSr0fQokeLOgdo9OZNuAgbtiMC2jsqhqv2cwoVIf2irZpCGsDpOdS7gsM8RXhUdiRpPaLL1H8RhOQH4ovuQSjYwQhoonPPMpMX+iQiW29c+5/WJJUTkfeXUO253HH3Rjs3ScjYE6V0xWZEZskOUAZjNE7R2kRrThVXkLKjF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738801612; c=relaxed/simple;
	bh=fwtOVF6bGBWDaJcWCYkfjLbCeuFvVBy26KdEtfRviw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqnXedFWxM5DbPMrYKid6dQmyzztBKxxb1hYqiqsja7JsF+yEXvRAORkyRHGaM3ZOW7sVb32Waonb9guqhaTwrASktov0tHtVM2R3wmmZFN1/75kOleXXUXHCEbQAaxnyEwpkQR9+5JtblLQ4Q5crrnOpXd0abBskXc4TinCDnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=JUoD8SXB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uTVOw9Is; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="JUoD8SXB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uTVOw9Is"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 8D21E13800F3;
	Wed,  5 Feb 2025 19:26:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 05 Feb 2025 19:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1738801608; x=
	1738888008; bh=qCWfYifZDZtWX0rosBWDfNmyrb6fOcfIrR13UXtulqg=; b=J
	UoD8SXBd0fz3AWjwfXfU2n0/ftXjc9hunlJY4rXhnnGvGbTcwl4yqNmqtVyYg6st
	dtupL5MATS3PupvOKxTOdB2wJr0gkANi3P0TwmCWJRzC7EaU/MUp0iRD4SHSV2vi
	JvY7LLkcIt8lG5lFhDBP/tl9TTMAkfWpABFjG+UnUY+9wwroKDRg68HRC+Flk1Pw
	P+ryPYOacbdjh7wIZR4X7QCqSMe2ZzkMsbR+mu+Wu8xtpMxg1Q6pLn+6yeMSbGzg
	2f3CiS6/OhPdOO3CStzMneuzD+p+X21ryy5VCFD+uf22wOUK3SN6twMksrh6wgIX
	SzRt8CkNHaxui5wNXhOPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738801608; x=1738888008; bh=qCWfYifZDZtWX0rosBWDfNmyrb6fOcfIrR1
	3UXtulqg=; b=uTVOw9Is6u2E5PoQ2BNIX2hW/2WpR8/Ku/Upxae3PVixbW8jQkw
	1+HEswhjgv3gmxN9gpASHfiHxjrnGjoW5yWGNW0CGX3pnLVqfpcb1RJRuxbWcJpm
	1pgqaAAOss5avWV2+JrSp4nE9eZp81eSHs1TbAABJmu5b1uS0Sa0+ahSQrVodfsM
	9syt/KTW42J6cnV7DilEhbR1ScqVQysUpA2l+s/dYRwt/909f/3Ux4x43sZ5VKnP
	XF+R3V9q23PfRPfFKz7cV/8vlUjGB5UYgBB8BBUbxsdKOD0s4hBpnOVXD3cSKug6
	YeVTklVFDRVqVxpcxckXxllSwvhWT2EzTUg==
X-ME-Sender: <xms:yAGkZyDe3USIEeb5TrPSZWEY9D6iVeTO1V_e6EkQxndXk8y1-xZ19g>
    <xme:yAGkZ8hvfnWwb32zwQrlcF5-cBBT4csA7zLgUZ0G4fJflJcLZGsLKorSwOSDsI-er
    dyBxcCXb7hk8YBfPUA>
X-ME-Received: <xmr:yAGkZ1mgAxPZYiY94oD1kdAAw8Qa-PvwAmuF_4QZSsL1COz948pkyI80tSc9pf4XeyiNOp1sp7t3HzSod-_6kmjPKBWI22UFR3rP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdei
    ueffveevueeftdelhfejieeitedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghm
    ohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtohepjhgrtghklhhivhhi
    nhhgohhougestghomhgtrghsthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhsohhunh
    gusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yAGkZwyoip932FYxvLpkf8xs6gXlM_-Ou-QdTrVEUUK7G9Jl9v1dvQ>
    <xmx:yAGkZ3QZWBDuJhlU9aPMh1v9cgucXA3KReQ7cMqAWOvGkKodkTRwmg>
    <xmx:yAGkZ7aqN6zhHYmz6VkKisN0iekcIsbN48HZcJjDWMs3ZNGTwy6djw>
    <xmx:yAGkZwTFeP0D1f1QbP-mvDDdU9HVJ5fPT9SLLXvRL8ESPqOm1m45oQ>
    <xmx:yAGkZxdxKmLEk3NGe2EMfvbVyWbbqYRJa46xLcA4sXW7qbHqOT2BvkO6>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Feb 2025 19:26:46 -0500 (EST)
Date: Thu, 6 Feb 2025 09:26:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de, jack Livingood <jacklivingood@comcast.net>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] sounds: firewire: isight: changed strcpy to strscpy
Message-ID: <20250206002643.GA61558@workstation.local>
References: <20250205192258.358362-1-jacklivingood@comcast.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205192258.358362-1-jacklivingood@comcast.net>

Hi,

On Wed, Feb 05, 2025 at 11:22:58AM -0800, jack Livingood wrote:
> From: Jack Livingood <jacklivingood@comcast.net>
> 
> changed strcpy to strscpy in order to prevent a possible linear
> overflow.
> 
> Signed-off-by: Jack Livingood <jacklivingood@comcast.net>
> ---
>  sound/firewire/isight.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
