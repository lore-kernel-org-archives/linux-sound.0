Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D23E30DEA2
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416882; cv=none; b=Cap5D7i8Grw4mc2wW6XS1bhf+YjAw6OR+k6GK+X1ZalGQZJ1rLZQWn9noA4CKtRbT9Lrmarh3LAC7WpZZ0M73FPKHPH+4X4Tds+Z6BPfg3kj8bdPV9doygmMdCr0CIC0gQkOSrZtQUMidh4jkjNnSiUgGpBdkensts/cxFpp/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416882; c=relaxed/simple;
	bh=H1SEXdCn6Ivy44E3s/UlBooYRFgSXnmehGPBAK+5r7w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uAS0YYuemzEQyL351w5mRCFl3kvLy7QXpzaXiyjej+K3q+lho76Tel37xEtnbeh2Tx+rv4HdHAEVqdvk7GmRq8zUGMidtE7bk6BV0XGGUtMJIUV0BA7V78nahzR2DN/7OrPIXmPoSsmZjGGaoKfflQNKtUVafApB3dqF3zKwKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HYTBvtLM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HYTBvtLM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CFBD64E40F58;
	Wed, 18 Feb 2026 12:14:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B45F60738;
	Wed, 18 Feb 2026 12:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB03810368B5D;
	Wed, 18 Feb 2026 13:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771416878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H1SEXdCn6Ivy44E3s/UlBooYRFgSXnmehGPBAK+5r7w=;
	b=HYTBvtLMo0ZI1vTmR3shXPdXnQSaLhlps7FOcyorYrgRXMTUk3zc08EhkeCDdsPXDollAH
	wUscZMnh7Z2pdfMI0cNNN3NGXBn0pRc6R4BIwenYaV7G62cZOFca+FqCGHGf6foul7WObY
	GgJtZWzZim0ZGTnRsJYoQlMW2q06dXb9ee3f1CwSYfehu0pnlJEa5VKn7/W7t4wX0ByweI
	kiB/LFKr8WFqi8AKUaDvl5Az/3bxmfZTrRKkMiTwhjc9R4x1Vp0aKL0olbGxn2zAa+E3It
	z1Y9JKzH8DUP5ybferD/yQqjdn00yhKc4qx9g4UBWcUcQkkYhP0ifv5Zwh7Tvg==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 13:14:36 +0100
Message-Id: <DGI2VIKQYD6Y.2R4TM6UD58OSU@bootlin.com>
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Cc: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>, "Nicolas Frattaroli"
 <frattaroli.nicolas@gmail.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko
 Stuebner" <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <alexandre.belloni@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <49e43733-1366-4a4a-a787-f7221b9612d2@sirena.org.uk>
In-Reply-To: <49e43733-1366-4a4a-a787-f7221b9612d2@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

Hello Mark,

On Tue Feb 17, 2026 at 8:22 PM CET, Mark Brown wrote:
> On Tue, Feb 10, 2026 at 10:54:04AM +0100, Luca Ceresoli wrote:
>
>> I'm afraid I just found this commit breaks audio capture on the RK3308.
>
> Can you please send a revert explaining the issue so we can drop the
> patch (unless a fix is forthcoming which doesn't seem likely right now,
> we can always re-add the support later)?

Thanks for the feedback! Revert patch sent.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
