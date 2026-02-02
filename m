Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6382D29C2;
	Mon,  2 Feb 2026 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770069616; cv=none; b=NFzrBStxeyWeS/MYsKuy9rYyVfkzId93e3S025e5ezmISw8bjem6pq4U7t2yPCWb/IwCOkxdFR2NWgNVWTkY7W+h93oX1JEWBgorX+iD+3cfo/15g7kIxhxJURX1Qioij9R5xGDAH5coOiLxSkjYkYFyGaqqmSCKzvsAEXZ0GFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770069616; c=relaxed/simple;
	bh=r+k4AqoHDTpCaIwdJQUIdqzxmC7EwLtdInDsyINR6Y4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bHGe51nN3XAG1ido/o8tGnQU7R50AWIyIlQ0tHq5fnN2+m6FJgZaoW+cUC2npooMKiW6LGtUE7mBMO/x8SZWjSQqZCmqAM8eOV8TXVV3hYOGBc0wTcOGE1OfksE/FMy1hRfoMD9ylGvJova9j1kXCyDoCflOCUeVk/ud8Egh8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKvKaYlp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKvKaYlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7F2C19425;
	Mon,  2 Feb 2026 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770069616;
	bh=r+k4AqoHDTpCaIwdJQUIdqzxmC7EwLtdInDsyINR6Y4=;
	h=From:To:Cc:Subject:Date:From;
	b=bKvKaYlpAiDYBUBYRTuAnT9IEx/M8z+c9oPYmj/QPH6wfnXo2nlQ6njNYuJfEyXnd
	 4yG3+qX/pyXT+SnyrNw2rjKP6YR11mTukWNlNvoMjIFwOyK009i6LfxUmuS15bRg1m
	 SRFXt2Z90/cE7s26u8QJ56w3j8B9WgdtAR1RezUJBVcLw6kzEOX9pyYOjn7NFQzCFZ
	 nbgbEjTZXgAn6ttOnksineEkQcVCnRs0cXpu0cTRpRyhjAhGI8LPZNMZlafp4PosjJ
	 uL+UnnBXnTZo8pa4Qt22cKRieLUZjWSxQCA/Vgupduj1tKCEhbRVYzpnXaqxYM163G
	 Q3txcSErqLBgA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ASoC: sophgo: fix 64-bit division build failure
Date: Mon,  2 Feb 2026 22:59:44 +0100
Message-Id: <20260202215956.2127414-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
is rather inefficient on 32-bit systems, and using the plain division
causes a build failure as a result:

ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!

As the input value is actually a 32-bit integer, just change the type
of the temporary value as well.

Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver")
Suggested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sophgo/cv1800b-sound-adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
index 794030b713e9..de1c77014c2f 100644
--- a/sound/soc/sophgo/cv1800b-sound-adc.c
+++ b/sound/soc/sophgo/cv1800b-sound-adc.c
@@ -100,7 +100,7 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_priv *priv, unsigned int rate)
 {
 	u32 val;
 	u32 bclk_div;
-	u64 tmp;
+	u32 tmp;
 
 	if (!priv->mclk_rate || !rate)
 		return -EINVAL;
@@ -117,7 +117,7 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_priv *priv, unsigned int rate)
 	}
 
 	if (tmp > 256) {
-		dev_err(priv->dev, "BCLK divider %llu out of range\n", tmp);
+		dev_err(priv->dev, "BCLK divider %u out of range\n", tmp);
 		return -EINVAL;
 	}
 
-- 
2.39.5

