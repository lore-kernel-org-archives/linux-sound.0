Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F838889C;
	Wed, 13 May 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660254; cv=none; b=EkGhhZgQBQViQ8JwdCVhMKvUxGB/R3AaBerraOdOzA3cXfGD3lO5f0kDSY5edtrRcUwF1ClXjn8jzerzyE/pjR/8CsUJmMQgh7Kj1rxxnK0Uiw1pLV43fEO76YL8rpQUifXkg2oOuVcGyQSZzf4MUdwO6T3/Smqlln7xnLXBJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660254; c=relaxed/simple;
	bh=PLXtGH7zPLXfkkIe9EqBxWu/O4wtMDgIlemph7UUw4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3z0ycuTyUctrQtRyDWCoasMof72TAkVT+bHrELiyGCPXu1nNA2byVd+QJeP4uCXEAUAezvPWYdkMzDBfiUPPub8KTOvYyIr/+5Q6brvE/jCQk0EWAOHNPv97NbGN56FJANdHUN0yH0Pce8zD4mWWu5QMTAe2x9FmZhzL6+u0io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b+km4s4u; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b+km4s4u"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 060A71A3596;
	Wed, 13 May 2026 08:17:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA55F606CE;
	Wed, 13 May 2026 08:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02E4A11AF8CB9;
	Wed, 13 May 2026 10:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660248; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qARIMrMbrBENAM5Goh6MMU9ZT8eSkmiHwLsrsbigu1A=;
	b=b+km4s4uGR4r/QDMDdfIbHqae4X7QuYmJL1QzfahNN25I/JvBWGeDsvWRwHZjEUZ02Wfsg
	jqGwAP3+kq/oWp1baXj2+YfjLmqVjIMfWijl/9Qa8GQK81AKVeBYcgSS0bjKqrq5GZoUna
	jV5MU5NC42imaVx9SWqHHtgn21hxy8359wp0VRw6Sjq6cK09Wyx7/zECZFWV5CWl5jf2ZH
	qkP+gFgGSNq3wcsZWXP+5/k4F9f7g3KSVFpdXLtI/Dp3hd9LbsCK9nB8/OqYK9uJNHZ8Q8
	DjKkeelTschpnr0xB00dQ5wBwbQVrGAXHgNdVqd5mSR+F7oq7esLEvnuW37TWA==
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
Subject: [PATCH v3 05/17] ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
Date: Wed, 13 May 2026 10:16:49 +0200
Message-ID: <20260513081702.317117-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
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
2.54.0

