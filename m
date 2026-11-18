Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002350;
	b=b9sxGNbTN8EvQmOSBudsu3gj9fBB31jK+HqSSTocivWzQylL6I4blM/u5Xz8KbTKcbfQ
	 yaXldtjsqaQkk/GZ41iWZ2TK2058NVZlpnkIpWfJXd0fgcxZ7yCwUTOl9EiYXyalYLbD/
	 I/Zhm9JAysjgSwK/GOeQJbtrtZoRZJgVreVZk7yzyPcGYWFfU3qpNmMZ4mAxgZ7Kifg6P
	 Imzi5ep5xqTyUJOJSpiXYOxXHbstWoeVh4zuYOV/SnTauHIV5iZSzBvTptB6ibOYiNpY+
	 wMDKi77dAx4oPC9W/nKwK8E16R3zBZZcukYQjQSZla7bK7h7/zQ4GvqIzaTLu2MLaaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002350;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1JRIv9JnGPmcxoiqjpUqTov6v+IUBflbTYS4wehLTT8=;
	b=lHWvpLPkU+dfwWE2L519W2qDHnHmAtncnAz8/my0iQWt5knUAqPQ8UbjEfi8OzN1lOg0
	 ERKuGnz+giFdqOsAREOhnP8dffm6bdeT66OARZM1WEFWvH9WWFCOHegInVy0y5ecofx1L
	 LJS6zX1cwAhBv78QDSDM/vSvoBHxDKgyI/V4oyVn63pkIsEWRgt37pWhM3dH5H3wenDoZ
	 H/BdCdbkHBMZCeAO5iiWr4W63tjupY0Pi1f+aqqtzBXieXl8dfVu5LJNx3q8BfkLo3HcY
	 mmDyjBI4uCwlpm7Izl+/nEp7hamuIUc9ghTWmlYM3IiHwkX//8mb1vIjKajEJQX7A/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=lK1PIszr;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA5860A3827;
	Wed, 18 Nov 2026 11:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA5860A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=lK1PIszr
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 7C15026BC9;
	Wed, 18 Nov 2026 16:45:48 +0500 (+05)
Received: from laptop-ak.home (unknown [5.189.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 884BE26BC4;
	Wed, 18 Nov 2026 16:45:46 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 884BE26BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795002347; bh=1JRIv9JnGPmcxoiqjpUqTov6v+IUBflbTYS4wehLTT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lK1PIszrdizNrpkP6n1L+r955Lj/dzIjSYFXHZ8r8QCWCnGWCiryoQonRpBSjG8Hc
	 y1/CCNgLZ2Zyk79eIJSiH1gIRCZ26xilt2ByxAmy/aTcQFd/cDoFIqKVJZQHpW8aiP
	 C/HJKoMlSueGqmcHbEdN2wCXvMy1VrhKT/8u/EIHHjBtF+gdanthuD7/AtgeKPSoOm
	 uNXA8oBi3Nx82OuKKYIbxLMpJYBSPiMVqxVHQ41JG4SXFvj0qwUFuIeD0y+9MmTEvz
	 3bIWIJkLsCSxniFEC9SIMpQ47QlNY34rXr6PKlzCeJFI5uKohuTV9srDQUApQRiCwH
	 xJ0O0u4sEZ6+Q==
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
Subject: [PATCH RESEND 2/2] ASoC: codecs: wcd-common: propagate sdw_write() error from bus_config
Date: Wed, 18 Nov 2026 16:45:09 +0500
Message-ID: <20261118114521.203207-3-a.karelin@ideco.ru>
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

wcd_bus_config() programs the clock divider for the next bank via
sdw_write() but ignores its result and always returns 0. A failed write
is therefore hidden from sdw_notify_config(), which aborts programming
of the stream parameters when a bus_config callback fails, and the
codec may keep running with a wrong clock configuration after the bank
switch.

The callback is shared by the WCD938x and WCD939x SoundWire drivers.
It was moved to the common helper as is by commit 59aebbbb0b47 ("ASoC:
codecs: wcd-common: move status_update callback to common"); the
original per-driver callbacks had the same problem.

Return the result of sdw_write() instead.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Fixes: be2af391cea0 ("ASoC: codecs: Add WCD939x Soundwire devices driver")
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 sound/soc/codecs/wcd-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9016e974582f..74bd718b8a34 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -115,9 +115,7 @@ EXPORT_SYMBOL_GPL(wcd_update_status);
 
 int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params)
 {
-	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
-
-	return 0;
+	return sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
 }
 EXPORT_SYMBOL_GPL(wcd_bus_config);
 
-- 
2.56.1


