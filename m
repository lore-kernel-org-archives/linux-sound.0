Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CC346AF8
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519885; cv=none; b=nLv5UuYAyAO0nItthfnRvxvlI3QyQEzlcKDPv2Mc6FByEnWYj9dqutyJJwVFSbqxHRgvuqa5uOYHAssDh6sULr/wJixKxD8RpZuA1yqC+ZAc9Mq8lRctm8vQamthB4Kz40dhJUCx4EAsZ7WKLP0EnDww2qzz4ugErBG3AESEDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519885; c=relaxed/simple;
	bh=KtWJUFwr2nejLGtWeMnXg73B+n8sSCwVl1nqee/L/AE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lOuikCNRyTzKAL7Ej8laMrbOR2HtQzaNhCW/RtHsFRyEHq4vQXFS61WhE0w0OHj53cEQH+w+p28oLeDxV9Ci/XHbg7l4722WAXUgXrvZPttwNLp50RkK5ezep1T5OV/wIujMKD+HeILHZ6f4AcBYZR6vxIsYHbslRoXQxKT7+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=emtHyDpf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="emtHyDpf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E7AD4E405C5;
	Thu, 19 Feb 2026 16:51:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD6DD5FA72;
	Thu, 19 Feb 2026 16:51:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02A3810368C89;
	Thu, 19 Feb 2026 17:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771519880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KtWJUFwr2nejLGtWeMnXg73B+n8sSCwVl1nqee/L/AE=;
	b=emtHyDpfSn0flo7E/zC9a7V+yot9ZrKtLFqruZ5xew9UH6/ln5wq1OuzAPYQwdOIxuGiHe
	D2nzLEMxgwWQNLHvzGw9ixeEtY5HqSEc+O+MWR8eKEV5HTgGWBJ36X2oqHlo4ZTN+QPNzw
	HxAFPmnv7P/U2jkK25lI1LBfajwlm5POrE3OcJSASiWAPgS2McXGoJHa3GKfRp05Ek+b44
	6/NhetLuCM8D7Usm6fjGtvZXDqprcw3FTXaKphcjkubAdOofDlDW5ON+4TtVMbEZJXeofT
	3RTx/ElcBrj5Hw4kjVdt2eg2F8lXoGlYsq3bB5SRj/nrp3aRlp17exxC3kopPw==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:51:13 +0100
Message-Id: <DGJ3DV155EFE.143J88CZKWBN4@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Cc: "Nicolas Frattaroli" <frattaroli.nicolas@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
 <a024ba9c-f2d3-4bba-93d3-33c0d0bd868b@collabora.com>
In-Reply-To: <a024ba9c-f2d3-4bba-93d3-33c0d0bd868b@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Detlev, all,

On Wed Feb 18, 2026 at 10:02 PM CET, Detlev Casanova wrote:
> Hi,
>
> This could also use a
>
> Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Luca, feel free to add your Tested-by as well :)

Ouch, too late, patch applied already.

Anyway, it looks correct, but I'm going to triple check in a couple days
and get back in the remote case there is any issue.

Thanks for the responsiveness in sending the fix!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
