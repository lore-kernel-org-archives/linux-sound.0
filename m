Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002348;
	b=Tj50SQtV9FfmLnNeOeSxUy6n11vcrSpvfex2BowfPU+tKDYfawKJ0Y45cj3fUIgPI3yc
	 Qdr5hDCvvAzhVg5oNBbUseAF78erPi4zmv2+O1nFFPw8WyOwi7tZi/I8nwW4evLe+ceWu
	 Ex3n0XwATOhaiVLVmDr0Vj6VtEf3/MCsgXDIg/9fE4YUu1+cEX1XiCiwTzU7bUNln6Iwr
	 lbTlPsk3JSl2q1BRNfSz9K2OCuE6wRgmJU22IXeKqgmbsQlrEN8z++rE5V+Lm+io46uB0
	 b9ZO+wfDMqr4IasjStvTvvfOK7+bi4DE1daJsSbutNEzYWymtzArfyuRZzJCSNzQFTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002348;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gUSHZ5ZKjCDTfJqboU75kleuh9jJAS8DzmfcpeawK/k=;
	b=zbNQOA1uvp5jy4l6ZWwF7miyamA4SMuqCA952dRXBe6Z7QlX+hGVeWlJKjKmXsZDYGXQ
	 RRm/Q+Trj1DRWHw1ChX2RJYWAHhbCq/yksi1DjxJZWupDC7CbiYn8L2/kyeyW7UWqrZh6
	 6W6F1Tm7nRpwS4sKZtM4UiVrnMuiA2ARRJ+9x8SRe5scLVuJ9CPP/YUeToczElUDAymm0
	 xj1wN1Bhhz0nuGZGvsHQJF7Bp429zgC/c1qfPxSuZ6odrss+xHTxc5N1DHZUBeJtzfoP4
	 eEuB69ae0uvX3OU6K5Wa5gGSW9zasLUx/YdiUx7sQy/jePG0nyyfg7hyYBvrAS24tdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=aTQBQNx5;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C560A3813;
	Wed, 18 Nov 2026 11:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B68C560A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=aTQBQNx5
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id F105326BC0;
	Wed, 18 Nov 2026 16:45:45 +0500 (+05)
Received: from laptop-ak.home (unknown [5.189.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 2656D26BC4;
	Wed, 18 Nov 2026 16:45:44 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 2656D26BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795002345; bh=gUSHZ5ZKjCDTfJqboU75kleuh9jJAS8DzmfcpeawK/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aTQBQNx5OJnt/ehEo3O6zacOM2/YBBnlYTYlx0DLm8HYg5bDuA9NCz6wK5vZcQeHU
	 P/BkIRmLZAjI56HzdyOErCHtFtb/OHnq9nSgH4Mdi00zWmWj2+HCY4SGyNpA8qhjAy
	 aTcZRJjO3my+ApZBDNULyX0LVWtVRC/EB2V76jXLVi6eWYmsdPp/Zleaymy2EIFfTj
	 JVo9wDOxhfDwzy1m0g86jBjUiez0dquUYJPm8o6eUreFhONv8f1GKSDD/7SMLKuduy
	 XL36iDHag9FxdAS34nJwVay57RkUfbbJTMeqE+Xj6O9/Pl4GahhQqg/riTBw+vbWJo
	 RhoriY2rXTo/Q==
From: Andrey Karelin <a.karelin@ideco.ru>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH RESEND 1/2] ASoC: codecs: wsa881x: propagate sdw_write() error from bus_config
Date: Wed, 18 Nov 2026 16:45:08 +0500
Message-ID: <20261118114521.203207-2-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118114521.203207-1-a.karelin@ideco.ru>
References: <20261118114521.203207-1-a.karelin@ideco.ru>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wsa881x_bus_config() programs the clock divider for the next bank via
sdw_write() but ignores its result and always returns 0. A failed write
is therefore hidden from sdw_notify_config(), which aborts programming
of the stream parameters when a bus_config callback fails, and the
amplifier may keep running with a wrong clock configuration after the
bank switch.

Return the result of sdw_write() instead.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 sound/soc/codecs/wsa881x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index f6cba55288e0..12b81edfbd87 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1093,10 +1093,8 @@ static int wsa881x_port_prep(struct sdw_slave *slave,
 static int wsa881x_bus_config(struct sdw_slave *slave,
 			      struct sdw_bus_params *params)
 {
-	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
-		  0x01);
-
-	return 0;
+	return sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
+			 0x01);
 }
 
 static const struct sdw_slave_ops wsa881x_slave_ops = {
-- 
2.56.1


