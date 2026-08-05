Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FE453A54
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948638; cv=none; b=r1fSUO9g16Gww4Q0CxjDrVdW6WESKvxFqR+coubZuz9tSZ7AHUvKGVixw0IDMsvUUHy+ME4gwmpeQYvcsx0IWRT4kbaPP1UA9OLnbnSKePqelwqMPsOqzYvQmk0ux7KR7ZuAlU1Sfcfr66WxE4nRIQeIV8Afjj1DWrwgzXK67do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948638; c=relaxed/simple;
	bh=46Kwe0oQ/9aU1ITLuzyEaitunthyOZkXOrSnNQHZ+JU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1+SiXmgvQyKj2jbhikZmsTgTZ2QRFUuoCnTZ2TvSqlIjlpH6PvqGkSRpDb9zIW3pFhnLQZArK2JpILOYJOefXk24YvofkfXWXaebOImU80UPCYuARLZPItjRCfNe05+GGWVfHoBiJP0Jq4gLPQMmmNusK73FZY43LxjFksEedk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eHWQeKzM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eHWQeKzM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B4AE4E41100;
	Wed,  5 Aug 2026 16:50:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09029602AB;
	Wed,  5 Aug 2026 16:50:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D12511C34F5D;
	Wed,  5 Aug 2026 18:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785948629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ylHwgYEkmAWVUJb+qOQJSy+O9pVGYu1KodW7MgnAELM=;
	b=eHWQeKzMBwjpaXoTvx3IC7bzpcvckKGEGwMgBDoBnrVZaQiCaEgP2WPKVW469PnnPSMA4v
	57FXJUv+6QmJVyYLY8Oxlh2UQxpRr2NHEcFyRCQMRqPNrqgq9fWOdbquuYL/XCyjpE5MyK
	cYJPd7rNoEoGTeAln36ko5ZmFFQzfbP7n5TG9ZkTdCrU3lxLDXE07f0ZFDLvi8Em0GB4Jk
	0XDp2faCUYOYGsbwUI8Yl4pLOC5Kezd93tewHxXCJkS0il0fFFrWOBgsto3bgzQDTA/W+u
	r8H4+cGSJFd7FtgVA8k8Xg2lPJwFvPy6o/l0qxw4utvLVXKM3IU5uaHAHKQEAQ==
Date: Wed, 5 Aug 2026 18:50:28 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/31] ASoC: peb2466: Use auto-cleanup for firmware
 loading
Message-ID: <20260805185028.0723871b@bootlin.com>
In-Reply-To: <20260805135247.670693-13-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-13-tiwai@suse.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Takashi,

On Wed,  5 Aug 2026 15:52:13 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
> 
> Only the code refactoring, no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/codecs/peb2466.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

LGTM.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
