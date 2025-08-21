Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314926FA77
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793422; cv=none; b=PK26w+40a4nAfbZijAamgwfCbd8BbiVnEARA6sveB3pWOkotW9LMJuYJV0ykCBAV2n79fe/qw9BkytbWgyGt91giShJyIsU3t3oQLS/1ohVvCo5lSnPS4wCtDOUJ9/3OL/7qnCpiJBmO46+O8VxiF+BB6RNO4XDPd+i7f3x1K4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793422; c=relaxed/simple;
	bh=/2U7CKDLiVIW67bDOr9u9BbBflR6LXcwrKNSlKb5RUg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6/3rw2O44PfhGb2w7xGtNpaML9+fDuTW8rcu7Kvxj0y7EOy240Dp3qQrBo/rTpxjy4ZD/IZNpRT1NUNQyfFKfNOpT5PojhPiYqrtW2G0kvvNwQuvcdp7FTVIuTTQUKQ35BJhEJpER9DqQfEnjy4V6Z+6Rv33Fv8Oq0maEpyWBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KVCPARWL; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KVCPARWL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE7384E40B5C;
	Thu, 21 Aug 2025 16:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83F24606AF;
	Thu, 21 Aug 2025 16:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAA331C22CDE0;
	Thu, 21 Aug 2025 18:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755793415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1M5Nb/GMJtc+X2GXJNcDemzZBR8bSjA86XYehPLVfcM=;
	b=KVCPARWLBBak7ha8ttTM+7mSUp1YOMn44fkE8/H8tGUXMy0+0lnJUZKwja2mTiFQWgTOf/
	h5JQRzU7uU0UKzlfsawb+1jIJunssTSjuvp/WuRJI5SGaIR4c+20C+McMOq9F2hwTWA6w4
	1H6K/QEvyZd3/J8WyJqmnQ17TZTioEQXlKTqdVEUH+hrEjAhh6+j/Xrq0idi/N90oJwrLf
	0FsZf1PAbShVXrLvavCglq5Kta5HoiGUZUrVBOZ+WKoLTKrlq3jcXAvC39cZRfF179V4/O
	ZAOVylEgw9reB1RLQo6ww7MB5XnnP+Pf9eDMwEo3HrKQpWESylbdHy9RM9fAYg==
Date: Thu, 21 Aug 2025 18:23:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/4] soc: fsl: qmc: Only set completion interrupt
 when needed
Message-ID: <20250821182307.2f7c8aeb@bootlin.com>
In-Reply-To: <f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Christophe,

On Mon, 18 Aug 2025 10:20:00 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> When no post-completion processing is expected, don't waste time
> handling useless interrupts.
> 
> Only set QMC_BD_[R/T]X_I when a completion function is passed in,
> and perform seamless completion on submit for interruptless buffers.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 11 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
