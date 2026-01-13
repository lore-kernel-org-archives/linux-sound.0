Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3137C119;
	Tue, 13 Jan 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292709; cv=pass; b=NxjQotXAb0w/ZIdR0PUWO8UUAMuxZ+BhjNEFwBd/KiVQndrnLeo2BbMzNDPXaqhruu0LmYjfXGAkyFQTXKJMndWP5PfTobXdckTd0wrysaL45uWwkY2xY0iNlt3f4N5GzejuHS850Fhew3KdEt3uCRTdgDNaiOaqoRAOqE31ZrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292709; c=relaxed/simple;
	bh=c3gb6l61bYgoUUWsADIoZVZnfTLYdBh7GmdrQ4ckeRQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=gEZ6g7k8MsfUfOAVwbz37Y+a1VqL3sTSCE5Y+Wf4HBfFJEtytpXGaH1DRAv62g6rjlxtpGMhjJIfY8bxupXYCYj0ATTy0VT+LYScP3OVIJAWC13XfF2Otic58sgjj/TpMuZCBDYLC78UKjO4NNZ8OOv/bkHmOtFdtfYpN8icG68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=G+CF3uiu; arc=pass smtp.client-ip=136.143.169.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="G+CF3uiu"
ARC-Seal: i=1; a=rsa-sha256; t=1768292689; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ggLwUH/iZ6PLapnXP9Myy9FiNqKk+vgQsvH48A8xa0U0Panm32yVCc+7tbE1aZLIuH97erOWGMm7n7WdON04rRDjkLDD8Nwmtu5YL1JiS+v47WuuZ9geRH2BBEx17Zux6pPSjlWIcbT98t4HfuHQpZ9gYAQ64zUm+Tyhswra3AA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768292689; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SF+D0cRSzEGK7QgPPoQMNNKSHz2t2jV4CuDOPHoV8kk=; 
	b=hGauqUk9fvELH58xvhz264eLpKC5lOIBRGhALPv1MBntG8JVq+vm/Uizdrb9d8/Rf7cgRFXNbQbxPdDgQuWJrWHV5LRyuv6wxJZECdB7Hh3XXBeCLAD25ef+ctH8uEN911MDZBwYE1d3g/S3bXsr6F69cACK8dI7Sw1rixH13fg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768292689;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SF+D0cRSzEGK7QgPPoQMNNKSHz2t2jV4CuDOPHoV8kk=;
	b=G+CF3uiuWumhp9E8gXcLy4NPoHkMXkNQJT35QkY7wl65t0ZvabjjQ5gIWdY5bW7l
	QHC+bJ7ow0qyUX4OPGpwj3/htc8tISp2uXhQmwzF6VfoEcq8AXphX8pmVWWnHKcImQK
	5qsEFyJoATmSu8cD94yO19l6zLCTipXUtsRz7aI8=
Received: from mail.zoho.eu by mx.zoho.eu
	with SMTP id 1768292687120897.3629929634897; Tue, 13 Jan 2026 09:24:47 +0100 (CET)
Date: Tue, 13 Jan 2026 09:24:47 +0100
From: Fabio <development@redaril.me>
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
	"Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
	"linux-sound" <linux-sound@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19bb6751cf4.c072e63c5407.2942878463240323196@redaril.me>
In-Reply-To: <87v7h6p7mn.wl-kuninori.morimoto.gx@renesas.com>
References: <20260112231855.193030-1-development@redaril.me>
	<20260112231855.193030-2-development@redaril.me> <87v7h6p7mn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC 1/3] ASoC: simple-card: Do not print "parse error" twice
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Thank you for your fast review, Kuninori!

> I think this patch effect will be removed/freshed by [3/3] patch anyway ?
> Same comment to [2/3] patch

Yes, definitely. I kept my commit history to document my flow of thought and to address specific problems.
At this point I'll just squash #1 and #2 into one commit in v2. 


