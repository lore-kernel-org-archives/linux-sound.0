Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28511341648
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433520; cv=none; b=gl2xcudSUkpWhFXNRHy+KktC3M4xoYD1hv3Y7cFSRz0PKdBK4jrM6r1dXWTY0VQQF3M242nc6clzpNqMyGOp9+CX56VZNfiomT7cshWAdAP6iu5C+8cZxkzDzlsWOb1h0inFOrYTlTuCX5b9q+JC1b7e0iyOsgvCSAc1VY8WyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433520; c=relaxed/simple;
	bh=0wfh6o/9oM0zW5ixJ6BV+OPXNxdRC+EFukmsaB6zDFc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=LmiSt5H//oq/zDugsYWDY9E8Iq6/adDlYzihk2PRr6pXmHMnL+M8QMczOPSeC6JfNwS9P6dFe9raRqvPTfylHXvhLmXjzwU1SN5IsXejjkNdCIg6N07qvC8s+K1Lh6Vzdxlgl5RWSRnlVy6KgOQVjqkw6z7Bh7HSIs5oV3lfgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DzZ+cb7s; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DzZ+cb7s"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A06B14E4025C;
	Wed, 18 Feb 2026 16:51:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A7155FA23;
	Wed, 18 Feb 2026 16:51:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9052110368B3F;
	Wed, 18 Feb 2026 17:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771433516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q3kKvAtMKyYPFeQYbrwGbLVSY2eZXFval087qSi5JsQ=;
	b=DzZ+cb7swCI8SLIPEuwHkNsoozJZU54YAOTo3h5yFmhWMepNkAu/9bs48NBM727ltQSzbm
	SxrVMRCPFZ0ZHymllEQ+w+ffCTtXXzQrML3jbEtYr5bRqBbNvTbakAq0Uc3lF3tVlII5Bx
	MdUStzhv5BSRnw7KVrQ8kJk0Ptf93J4mHf3nhTwMOioZYtKrMVZS9ByooyIvdYhtMevJHo
	aal+svhAcY9ADm7jhKroJVxm8wTbSr691w6n6PfS8+OuFGuM6yfiaL33Sv4w28ZRgzu1L9
	sce7auUd+y2hX83PzR8gC9NSWUOnoAkN1yd+qKkn1CDymjnSROfn0n4EwdCasQ==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 17:51:51 +0100
Message-Id: <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
Cc: "Nicolas Frattaroli" <frattaroli.nicolas@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <alexandre.belloni@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
X-Mailer: aerc 0.20.1
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
In-Reply-To: <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Detlev,

On Wed Feb 18, 2026 at 5:01 PM CET, Detlev Casanova wrote:
> Hi Lucas, sorry for breaking support on your board.
> I'm also surprised that you were not added in CC of the original patch.
>
> Can you try to keep the patch and apply the attached one instead ?

Thanks for the quick feedback.

About your patch:

--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -665,6 +665,12 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_s=
ubstream *substream,
 			mclk_rate =3D i2s_tdm->mclk_rx_freq;
 		}

+		/* If the dai/component driver didn't call set_sysclk(), simply
+		 * use the freq from the params.
+		 */

The comment is slightly incorrect: set_sysclk() was called in my case, but
only for playback, not for capture. You can reword accordingly.

+		if (!mclk_rate)
+			mclk_rate =3D DEFAULT_MCLK_FS * params_rate(params);

With this, and DEFAULT_MCLK_FS defined to 256, arecord is working again.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
