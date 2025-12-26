Received: from www36.your-server.de (www36.your-server.de [213.133.104.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B799221DB3;
	Fri, 26 Dec 2025 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766770765; cv=none; b=o4AkPfL197pcZu6EweiRUBQUEbD0ru3rpfnTTIrqPRquXwE3yli87DTNf77ZSv4+fIlXgEWVKM12NDHYQBrfCIeD2wjYiRzipBAXJpdzigCwNM7qEbc6qGYvtNfDoSfumYp96HrFnzEZjjrDaF3habm+5CNT4EQuThj1CLPRElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766770765; c=relaxed/simple;
	bh=o8xBsIH1SRbXMuSEnpmBOxR3JEcrb1eygbH6D9oN5yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8JCd5DfkH7x+MCM1IX+OEDb9887sTFBeOrPKIxwcAgfzV5wZIS8etVTqzsoHAcwYjTFvfSIp/uYbcV+eZnVDj552xacuoiRupPo/eDdbD8+H+vBBOCKO2wwVtTq7bM88TqnDCfqQwv/T32kfT9kIluE91GmIetwqbzHUYAw2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de; spf=pass smtp.mailfrom=hohmatik.de; dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b=lxwJXlAK; arc=none smtp.client-ip=213.133.104.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b="lxwJXlAK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hohmatik.de
	; s=default2501; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=o8xBsIH1SRbXMuSEnpmBOxR3JEcrb1eygbH6D9oN5yM=; b=lxwJXlAK8ObY8wB3RNmj+qQ3JX
	ThzdYQbufp4YtjqbogLcP2buu691Ja0bTdl3UBFliq6rwYOmjduXl5zaeoNdW73oU8qPBhgoACtEj
	1vSUnF/vjCmEXgc5tDbtDEYR7lK9djtDnwwmL2+MSt6R6wUfqTg7pgJVjLnYniD39fUhuIOgt7vq6
	SNU+2n42Ckc3X5xUQy/TL7XpF6y41exOrrKTFOT1W4SG7AwukDR+Y9Am9faeuoVC4aS+5BoSQqDp8
	/NLl1VyXcSlYxD3NyNSlRD9RHogS845ym8dze8IJ6ZNSdldzeViXJL0HBTYtAGxPehRlCqE6zQsB3
	O6Oqnxnw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www36.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <linux@hohmatik.de>)
	id 1vZBUu-0007Ag-22;
	Fri, 26 Dec 2025 18:21:04 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@hohmatik.de>)
	id 1vZBUt-000Miy-2A;
	Fri, 26 Dec 2025 18:21:04 +0100
From: Karsten Hohmeier <linux@hohmatik.de>
To: carnil@debian.org
Cc: 1121535@bugs.debian.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de,
	waxhead@dirtcellar.net
Subject: Re: Bug#1121535: UBSAN: array-index-out-of-bounds in [...]sound/pci/ctxfi/ctamixer.c:347:48
Date: Fri, 26 Dec 2025 18:21:03 +0100
Message-ID: <20251226172103.5473-1-linux@hohmatik.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aSqpiDfrvIyUt813@eldamar.lan>
References: <aSqpiDfrvIyUt813@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.0.9/27861/Fri Dec 26 08:26:00 2025)

Hello. I am another affected user.
I applied the suggested patch by Takeshi on top of 6.18.2 (in case it got already fixed).

But this just gives

> Dez 26 17:24:13: dtest kernel: UBSAN: array-index-out-of-bounds in sound/pci/ctxfi/ctamixer.c:344:48
> Dez 26 17:24:13: dtest kernel: index 10 is out of range for type 'unsigned char [9]'

as the error. Making the struct even larger gives

> Dez 26 17:39:35 dtest kernel: UBSAN: array-index-out-of-bounds in sound/pci/ctxfi/ctamixer.c:344:48
> Dez 26 17:39:35 dtest kernel: index 32 is out of range for type 'unsigned char [32]'

Could you take another look?

Regards

Karsten

