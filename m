Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61894221561
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151086; cv=none; b=fhdwEQfjRSXVx0ECzFYbMQs3Eg72M1CjiIq4bytoU0KEXesh/GQw0FccY5W45PO2Gl/HM0J50Qvnc9AzktZWKyJCST7ldPgqVXLcIo5MMLA683j/mhUjP3TFNIMeRXt9Fu35vfwrsUldNctwZnfZbnKOCnqIQmy2S4j/Afj7DEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151086; c=relaxed/simple;
	bh=TdPQaJbh32UEhYb1SCGquDYM63TDq7bR4SXbXy+XeFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky2zRe8+DTGW1baf3UD4hUJfAC7PPoSWpmam/g9eszNr0rNHAxPeO9Gpia6rdCraL/c/8jc+IjlVZKdKEBEtm3rlW8mJ+tPNqnsW05Z96lUz4g26hzm64kNbNCkGngbOzzPeD6qJDRrLtrmi6vRr7ig+827XalrrNvdu0nhYp8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=B9cGhmze; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jXnp74U2; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="B9cGhmze";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jXnp74U2"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F3887A01CC;
	Thu, 10 Jul 2025 08:38:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 10 Jul 2025 08:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1752151082; x=
	1752237482; bh=nlc5+NthHlnUg055AsMjlxWG6V2ptzFq56NSeT0b51M=; b=B
	9cGhmzeZL1NIhWmG+9Af26KbL8aopoiwaFq1mVewpIGTzMtFtzAbLWROmePKNF92
	mNaOxa2izTHeHAuzLRw3mTidwc2Lp/gWEreiQo0s2yLlUlEB3PhoEpSL74xy+T1C
	RFJ3nR1GSBy/TJyBwFedsckWu9JC1T7tLlJPv+tw9ojEL93xO6vUyL9V6fQOdXY9
	KE9EanE3OGKqdm5Avb+VbWzCnYoTfyZDGKEBYQLHYlolMRtVH1iN/R80Do1juHTu
	dKix88pBrfvkRfhRd9aXRKfJFHXXpROsEeSq+fWblSowgzTvcWbIl9XguK3f2Ivc
	1aNuVfPvb72s91u2vvjuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752151082; x=1752237482; bh=nlc5+NthHlnUg055AsMjlxWG6V2ptzFq56N
	SeT0b51M=; b=jXnp74U2es6O6FN3zxHXMcmXJs0l7oPEUz2P9yGqCd9xV/WSdda
	Jo1QEQzAlU7TtDLA+ITBKH7R7fbZhvpuO9CdvNrwTnfu2Tz5Q51fpMJE0FkrorCQ
	aaunGM9dshl2CtHuHmlvw8pHrPTNJhvJU+emiFKzsdZQsC8ezyKciywKviNevkWA
	EGCnNy9gpxiJ9dmCTN9apgOS8V+G4ezLi+EaMzBOlzaAqJRgDCw+Kkppv7r29fta
	4h5iRbhBcsVzX0HDZKxBLkB0twW27nzwb1cFqLRs4v6FAj4Gw/8o15+ty/v2Nj7I
	RoBEl2Zij0ao1RxRYG7Khi6V0YCW31LPHhQ==
X-ME-Sender: <xms:KbRvaFO-YCJSMJuXEs2tYdGGYtaIOdoSkb6nWsDfS88bOwdA_9_oGw>
    <xme:KbRvaIKR_DBychEhaJkhzR5Jf30iV59QWyGNUPVpkeqmNbT5VBa6cQveX_IlMORl-
    oixexarADNLahCus3M>
X-ME-Received: <xmr:KbRvaGEJ981vPqtoqBoMYCmB5wwuHb8F7s9dClBk8em9NeOyXszc31ymeureamd53CnCIKZo7feepX3Lu-BqCtEy6jy0Cb1Axw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhi
    ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
    enucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieeitedv
    leeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgt
    phhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtihifrghisehsuh
    hsvgdruggvpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:KbRvaASizlELnJ-JMJ5fnMA3sW4oqo-Cy1XVYOBELximddoNjesnyg>
    <xmx:KbRvaCF_0us0znK8CK41W2zaDX0AtQK_852V9ljHPWP1SKvbVEq_bQ>
    <xmx:KbRvaM952DKNY_9E0ZEFrXKe58ErFaMrglPTYGu9uMjk4dZyMzdkZA>
    <xmx:KbRvaMLOQaIwEJxS2EHQZASQ7CUV99STTkEfLMTVwRx0fc7a4bORPA>
    <xmx:KrRvaHxfJqBE8XjxAx38PREv3Wz0WhtbaVb9xVK72wEFn2Lt99QF8vIY>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 08:38:01 -0400 (EDT)
Date: Thu, 10 Jul 2025 21:37:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 000/103] ALSA: Use safer strscpy() instead of strcpy()
Message-ID: <20250710123758.GA24485@workstation.local>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>

Hi,

On Thu, Jul 10, 2025 at 12:05:42PM +0200, Takashi Iwai wrote:
> Hi,
> 
> this is a collection of small and pretty trivial patches to replace
> the strcpy() calls with strscpy().  Most of changes (except for a few
> last ones) are systematic replacement with strscpy() where the copy is
> done against arrays, so pretty safe.

To the changes for ALSA firewire stack:

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
