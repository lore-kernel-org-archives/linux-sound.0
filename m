Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA07212FAD;
	Sat, 11 Apr 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775912749; cv=none; b=e2rcjykQnuGM+79BViMrySDdTdbbpCX8N9/sg+58K1tipJsK2sC1FSKPu/bWUnzkMkzqWTbfvWsHt7xfkJ5VIga4kvRs2AOfCD3YwYax0dO2jLNUZSgfAvJp8B4vNQiJ7OzsQYXJO8xIhTiBmlGAnvRp8VpcyY46FRrCR8A9oXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775912749; c=relaxed/simple;
	bh=be7zMhmeVqmGwJ5Sn93c9K/8LeU2YtbEfSNfdJxAwLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CVLBa1PJnhv9JUriC5O/UWyo2416y0kwW4T6KyGh2PoY4hM0UXgDQG9xL8hP2PPGaktj2h61wJWBkwjGYZRN044aPujb52ibjUh5gyDlR0T/+CDYV2jrbpwB1LQuS4y55LjbDbuNi810C184WsMs3ns2QOgNoPE5EY3qEbuoIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ELUYQtbW; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ELUYQtbW"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A15211329A;
	Sat, 11 Apr 2026 15:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775912745; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=H/2bVD9+SWNW9lwJ4S3qgKFBoL20AdyBPWgGhVtSamo=;
	b=ELUYQtbWsmbdvXQ5mzbwij9GE92ETF2l7k7i6ZCWf9gK66244krygegqHFBGVETBF+yFCJ
	WDAv2CrqvIkfRW2ii3tsvn3yYHjX4N0GD54jk+BpIYEC1fv7/QTa/LyhWHk+iotOuyhtBI
	q0S10LeI/XEbOshfZ+knJe9d9MwgL4U5yP9vXBGMFUfpExJqihhViB2cbRjLlSJoaz3O7V
	1VNK9vuduvp6a5OoVndpBWhoGESUnTQ+Urcy6eYn7BqX784fnvjtpAybG+ueLVX+lRGlT5
	CpvheMMWhgnIXKMy++8kNfdDJOdJd61CkwYDYH5dBMLpOTXmmce54aUqeK4skg==
From: Marek Vasut <marex@nabladev.com>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Lu <kevin-lu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tlv320aic3x: Add multi endpoint support
Date: Sat, 11 Apr 2026 15:05:12 +0200
Message-ID: <20260411130542.19777-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Support multiple endpoints on TLV320AIC3xxx codec port when
used in of_graph context.

This patch allows to share the codec port between two CPU DAIs.

Custom STM32MP255C board uses TLV320AIC3104 audio codec. This codec
is connected to two serial audio interfaces, which are configured
either as rx or tx.

However, when the audio graph card parses the codec nodes, it expects
to find DAI interface indexes matching the endpoints indexes.

The current patch forces the use of DAI id 0 for both endpoints,
which allows to share the codec DAI between the two CPU DAIs
for playback and capture streams respectively.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/tlv320aic3x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index ce22298b43efc..b12c1952823ba 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1689,8 +1689,15 @@ static int aic3x_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static int aic3x_of_xlate_dai_id(struct snd_soc_component *component,
+				   struct device_node *endpoint)
+{
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_aic3x = {
 	.set_bias_level		= aic3x_set_bias_level,
+	.of_xlate_dai_id	= aic3x_of_xlate_dai_id,
 	.probe			= aic3x_component_probe,
 	.controls		= aic3x_snd_controls,
 	.num_controls		= ARRAY_SIZE(aic3x_snd_controls),
-- 
2.53.0

