Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4B82EACEF
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762507605; cv=none; b=n6+3WoGR9d10PK8TB1/3GxW+BpzzL7uUqFZNWmsqNuvdRV9737xkCID8raKWymIyXiSDmmcb5ccQUnqPW44NufiRubKF3mZtymkw+212NuDbMvsMVVeCso/AsRkFY34j7d+4HZjgHCH/xhgBpA2LCrvtYOipFFFEg2JFbcFD680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762507605; c=relaxed/simple;
	bh=td4OKSYMD80/z5WJCXT8z7xuBhE5BGfq1N4Usl4rLM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eJ7UamDMAVEzUNrnMYwH2CYkrm5kC0fxT0E3d7uoLMk/JnVW9ybWSZnlnlpp+SdS1KA6OlS2rN1bqwjz1Q7bPeZZDIPaWi3adNkm2TTnxIUT2kDhNbjVZkgKDu0PeeEnMFCQaoTZHnemKKtiTnTrWdqCnL0igutRrI31cFlilqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r4SGVRuo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r4SGVRuo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60DCB4E41591
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 09:26:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F644606A6;
	Fri,  7 Nov 2025 09:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 481BE11852005;
	Fri,  7 Nov 2025 10:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762507600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=td4OKSYMD80/z5WJCXT8z7xuBhE5BGfq1N4Usl4rLM8=;
	b=r4SGVRuoH670ND8c+kXKTh+Nz8yJs0+6vACVEdgp9LXVs6s48GuylO/0RLlBkzW3wO3O0b
	dR7BXWi+CBkT/k1yc/iM7UTCVpgnxabyhzopk54Yvceg1mfrrlQnScsY5RCmw46+3o80Gp
	VWrkELoH+77Ti+WcZW0/hDwALD5xBRyvLRlKID87+1miwJIOfGd3OF75PWCCD5qzhSAqSS
	tSBuULlBPJbceOEvVIpeI+ptxqIgUWpkhAt26uyEbzIVpC0J8qIfv8nrzaL6lGoZUDjjHc
	1XQ+fOhJRiprJM/p4/s6Z6WxvK5eMzhKTrOH/bIjEwlS9Z7DgFE7xSRdxkBqDw==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 10:26:39 +0100
Message-Id: <DE2CSTCHSWJS.2QKAHZ1K808VX@bootlin.com>
Cc: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dapm-graph: Handle sourd card with space in name
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Yiwei Lin" <s921975628@gmail.com>
X-Mailer: aerc 0.20.1
References: <20251106165802.3780-1-s921975628@gmail.com>
In-Reply-To: <20251106165802.3780-1-s921975628@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Yiwei,

On Thu Nov 6, 2025 at 5:58 PM CET, Yiwei Lin wrote:
> When the name of the sound card has a space between, the
> script will fail to output the dot file. Consider the
> case to generate it correctly.
>
> Signed-off-by: Yiwei Lin <s921975628@gmail.com>

Thanks for your patch!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
