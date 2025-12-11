Received: from mail-108-mta135.mxroute.com (mail-108-mta135.mxroute.com [136.175.108.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367E299AAA
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430510; cv=none; b=ur7MxrfsYWf47ZH7zZGTHtO0es5e0cjwaNrQivx/sknhMetgBRXpK7I97Crfc6u3KpF3aH5pStcUDRS5j0ZrwuA94ZQVghOK81OkyAyl0xon5puWsl7+tJiPqL1zLk9cizdbxt7ZJOX2gnzpG2VCOS4xs+PwTkCie6ZbQIA+Mdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430510; c=relaxed/simple;
	bh=erdaaquZhevWBjWE5v0YIe/+dIFyYgbHWhIzHky7VKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6hzi2bvC8DGWY6iUT/wQtCHqxQ5xNlGrRq4+/xTdUhhEfC85JkNAHqNCHrGVKHrijdK4qPntKdXvfIai/QPMrp9xIcWwjbBjmP2HhVLVGMjQ6/LyQBB2YrD73LxL4DelED1b8FEsITyz8OT93cMKivu7KdQgCw5KfSNAXzBFD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bradkelley.org; spf=pass smtp.mailfrom=bradkelley.org; dkim=pass (2048-bit key) header.d=bradkelley.org header.i=@bradkelley.org header.b=SHWLOOYP; arc=none smtp.client-ip=136.175.108.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bradkelley.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bradkelley.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bradkelley.org header.i=@bradkelley.org header.b="SHWLOOYP"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta135.mxroute.com (ZoneMTA) with ESMTPSA id 19b0bd6f7d30004eea.009
 for <linux-sound@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Dec 2025 05:16:36 +0000
X-Zone-Loop: f8d10c641526e3fd489cad3315cd73e6e8ba952100b4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bradkelley.org; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=m+OURuqnL5DPIa7sD/Co7Utci0ox/wlSZDu2Az08lv4=; b=SH
	WLOOYPut3yvq0dKsarKP4FkBoHRk8sqP0RzlZW6Riakgivhz2g3RCcsiLsaD/Oha2fDqog3D2bEjs
	6BlJj7/GgbkLVOWJeRNrbg4kMZUaXf+7AFc5XTdnt8e1IGlFBrJiWLIWVnTCKL7ykgSiVcGpn/Wvs
	IPeQvA5Z+ulD7r2JtGFXP7YKa/h2jsT5atuvvLt2nq5bwWh5y8ajyV7t+k/j8F4AuwR7sWWJ0X0Rr
	YuBMLty33FgcveK+S/aTwI0wA6Txjgi2fOQLu/hvxPaZnAY2C4Sz/ZUOsAn9ov2eJUaUVKVgW6I6f
	lQoDnS6+eYkUu/5N+LfaLBrdADooui9Q==;
From: Brad Kelley <spambake@bradkelley.org>
To: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Brad Kelley <spambake@bradkelley.org>
Subject: [PATCH] Correct a typo which inverted the reset GPIO pin sequence.
Date: Wed, 10 Dec 2025 21:16:28 -0800
Message-ID: <20251211051628.391435-1-spambake@bradkelley.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: brad@bradkelley.org

commit that had typo: 42d1178d223ba9498c1ed40a5fc243a43d35ec97 ASoC: cs4271: Convert to GPIO descriptors

The original commit changed a 1 to a 0 and a 0 to a 1. This inverted the reset sequence
resulting in the IC powering down and not initializing.  Correcting that allows the board to initialized.

Signed-off-by: Brad Kelley <spambake@bradkelley.org>
---
 sound/soc/codecs/cs4271.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 77dfc83a3c01..348f15c36d10 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -486,9 +486,9 @@ static int cs4271_reset(struct snd_soc_component *component)
 {
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 
-	gpiod_direction_output(cs4271->reset, 1);
+	gpiod_direction_output(cs4271->reset, 0);
 	mdelay(1);
-	gpiod_set_value(cs4271->reset, 0);
+	gpiod_set_value(cs4271->reset, 1);
 	mdelay(1);
 
 	return 0;
-- 
2.43.0

