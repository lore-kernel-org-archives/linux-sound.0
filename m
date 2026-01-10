Received: from www36.your-server.de (www36.your-server.de [213.133.104.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C53382FE;
	Sat, 10 Jan 2026 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768043128; cv=none; b=mGnA6Qbz8Eq1O7DfFjO2s5gRqu/WXvBvvscyv1bNHfbmD5VxV3kmrqQNp4E8M6c7inTI67pgjgsC5SMemgWGCoLT5mChB4bxetNbvipn9AahUgfDoH34b4NH3T2Sa9vNjZSndsaPduK9zIinJcHYBQA4OX2FCCP2m0W/iT2aauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768043128; c=relaxed/simple;
	bh=FknxOUJvwhOMi4J9k0cU5dycf609y/lFSOZMbMQHPXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAd9pVWQTHQqm/fAgO24pYD1zrqvh2rdxM1H2cC3Rm35DCxu0TPJB59a8Ys1kpo4Dixs6nnJrlF5PiZP+cG4qSZKjGYDzhq11oZfz9b8gHwBQ+mOqMGaS2eJ7gRbltg69WpOfoAVp/jN9VmZTb5my5RWKwwkUFTTrJ27oDPmymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de; spf=pass smtp.mailfrom=hohmatik.de; dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b=Lo155Il/; arc=none smtp.client-ip=213.133.104.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b="Lo155Il/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hohmatik.de
	; s=default2501; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FknxOUJvwhOMi4J9k0cU5dycf609y/lFSOZMbMQHPXA=; b=Lo155Il/KNGcQS2kUMihCoEuly
	sGLYQF6t9ZXgLWMXph96gg2SMfdFxCrAf23q86+yoh4LSkCxob9VFW20US7XQRXfhnHXkFlo3xITs
	6fItkrpnTmcAUDOWYp7kLPjJy1gKDldh7lxOKmo03n9WcQRBKQT3wOnRwj4a498i39fbmv9VSYptF
	k96+qtIo4vgenfpOtB0WpVm1Ymu1I3o8leNVAwCwbH0KxJCTFlelYYRllELA+s7UsrMm7iX09kwx4
	3wH4KLZAPRmGe/uJ0RFynvrVdgrTtC9L3ul9uY/j0r5LOSJKiUB5V6HTgg1I5Q1jRiXGAOEVezMaC
	DReFDs5g==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www36.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <linux@hohmatik.de>)
	id 1veWO4-000H7T-1g;
	Sat, 10 Jan 2026 11:40:04 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@hohmatik.de>)
	id 1veWO3-0004RI-2V;
	Sat, 10 Jan 2026 11:40:04 +0100
From: Karsten Hohmeier <linux@hohmatik.de>
To: tiwai@suse.de
Cc: 1121535@bugs.debian.org,
	carnil@debian.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux@hohmatik.de,
	perex@perex.cz,
	tiwai@suse.com,
	waxhead@dirtcellar.net
Subject: Re: Bug#1121535: UBSAN: array-index-out-of-bounds in [...]sound/pci/ctxfi/ctamixer.c:347:48
Date: Sat, 10 Jan 2026 11:39:55 +0100
Message-ID: <20260110103955.8318-1-linux@hohmatik.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87pl7lgzd7.wl-tiwai@suse.de>
References: <87pl7lgzd7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.0.9/27876/Sat Jan 10 08:26:01 2026)

Hello Takashi.

Thank you for the suggested patch.
I should have access to the affected machine next weekend and will test it then.

Regards

Karsten
