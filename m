Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312F7E0E4;
	Thu, 10 Sep 2026 23:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081457; cv=none; b=gqns7aQY7zKODwy3bRdDLg8nHFePKV+UU4KrCnQ2vM3QjiEDvGerSs4pJxTVocZGH38bz/uTz7/3imoj8JsObEnId+Pa2OyQKdehGUrzIZgnrKgdnqn7RPuEqgNv1kYk4cdAWaJFkURBIfYsh1xLmQxqd+AVPWl5AhqNTDfOroM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081457; c=relaxed/simple;
	bh=OBzfpZlz023QHimuzENLrsN98o9/7AJnw5+TE+vVK6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZNQ3C7u2V90ChFDxRXSm7udEfHR5z1NNgOYur/buFzzoqwnokqZVFgH164WLcmJwyi+DffVzjzKjY5mU4tHmC/mmWuWEFdclZDxvmFav+TNTa/NEZEvBqpzTyMXFM9zcxGKQ3pTPqMcNbqbswyVFDrb2uqTOb1muK64S1hmVIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbngF7kU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbngF7kU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496CB1F00898;
	Thu, 10 Sep 2026 23:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081455;
	bh=L6o0sO24fR5jplYTBZROUhXSHEH4jEs4rfwua8EZmxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SbngF7kUHb5VMxYM7twbsyOIPe6Pl83XlLtXlW9HyfuSMQNLas/rna5Ipafil/2Fo
	 ZV10L/i1NlEaiHPmE6lCfTsGMd7mfEhZq8L76HbMGwdC9Ji08YiP5OAu7FnL6AgFVh
	 9bSVeIxoLojsJ0tvBxrYi/1fXrvQAJBDjhWPEmyCMbT8SWZfkfX5uBPSiFtGDeBZ1Q
	 QLRnK4Y5oEXe3XMZKNvogs9xEv8Wq4uOMhE372LESH7PSroQp2yvTviRxA2Pf2V6tO
	 7jETwTf0gBeOYw0mTMmFMchcZuSSsR4njbkJ2tPfwFo6LZ/1yXbsGdyaZyelQg57Sw
	 7wthh7borSgkg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:52 +0200
Subject: [PATCH 9/9] ARM: config: u8500: Enable the simple audio card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-9-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Replace the removed MOP500 machine-driver option with the generic simple
audio card used by the new Ux500 device tree description.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 2fe25f5eb9a5..c469526b04e3 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -122,7 +122,7 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_UX500=y
-CONFIG_SND_SOC_UX500_MACH_MOP500=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_UX500=y
 CONFIG_MUSB_PIO_ONLY=y

-- 
2.55.0

