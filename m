Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022633A75AA;
	Wed, 29 Apr 2026 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448666; cv=none; b=ehnWLt6UTO+bnFwK+GsOkDhYYRAZGi3jSXIRjfhWrvctXm6W1wC0toH0ynFLlfvRTP5/P0D05UlH9zD9REQCmAf/JRGQXHPBhKl9t7ivEwiTKlrSmc7gGF1nnxtvm4uHdwMqHTgDATx96YpIs06ZpeIBBrhJL6ZF31X+wJvkVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448666; c=relaxed/simple;
	bh=XB4PAC9+Xt1SlGkK8fa2uT700JX99DgEJP/N4cZVx6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jxt3aKLQkQ2+WfjouapzBUAVSoUJkrwRVJpRjaayRfW3jtDi4nMuh95tk+j1rMtmXAgUayuIgadI9SxSxe5fFO+f6+QGqZzoT3QyOSfZOrRq8XWsIrhMORG2hwhOXhhowWW0UAD4NWcNlMpIFI5THmKubnt0S/l1FGqr7rW7S4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1X0M2PKq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1X0M2PKq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0E2AC5CD50;
	Wed, 29 Apr 2026 07:45:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFF7E601DF;
	Wed, 29 Apr 2026 07:44:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8490B1072988A;
	Wed, 29 Apr 2026 09:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448662; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ao/Ge/7pzeYgeQwu1DzSFkfa9mVgrNeq6YT9C0YLJQ0=;
	b=1X0M2PKqVM0WS0MleB02urqi7GBYeGMCv8SJ5CPt7amRZfcFD4QlAP5AAXCfjV0lqjvig4
	1A+ju3PTz7wr52GBXbUnkg4h8/rqBdUgUWgp9DKvbU464x6iXf7NMy/ETWsFaMJBMcVNOy
	IA8Y3RVL76ZNeGp3aItjB0mJ5Gw87jMYgngLbHBzaq7kbr768lnm39unfmEWbja9lQdTdQ
	89PTgGUwhzmZH/S1/lH3pf5E7M6AFj7cH73aXUM41yGxxempLqTGC5+Ogsnr363aujRXG8
	gOQaNrf5CpUgka9fFEZtD0EwGZVd/lWjJ3BX/Wg3Dhvwr3IK8Z2uocA1YhF6pw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 05/17] ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
Date: Wed, 29 Apr 2026 09:43:41 +0200
Message-ID: <20260429074356.118420-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429074356.118420-1-herve.codina@bootlin.com>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The simple-amplifier Use CONFIG_OF flag for its of_device_id table
and of_match_ptr() when it assigns the table in the driver declaration.

This is no more needed. Drop them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 5b44bcfef49e..215318ff62fc 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -86,19 +86,17 @@ static int simple_amp_probe(struct platform_device *pdev)
 					       NULL, 0);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id simple_amp_ids[] = {
 	{ .compatible = "dioo,dio2125", },
 	{ .compatible = "simple-audio-amplifier", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, simple_amp_ids);
-#endif
 
 static struct platform_driver simple_amp_driver = {
 	.driver = {
 		.name = "simple-amplifier",
-		.of_match_table = of_match_ptr(simple_amp_ids),
+		.of_match_table = simple_amp_ids,
 	},
 	.probe = simple_amp_probe,
 };
-- 
2.53.0

