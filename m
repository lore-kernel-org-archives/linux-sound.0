Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046B42AA3;
	Mon,  5 Jan 2026 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.203.221.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582139; cv=none; b=bxcpT0fROFKWHImAaoeqM+y2gzJ6yuycB7jINBNUUGKrfa3e0Cv4M6ISEkpuqUymBTzDtcZns4vXPUGA+vA4oTgVrDHlHsg/t0flPbXxgGpZDr/xQRX8PY6ufiTji02999k+Eln2Ww8QQIrmoZ/qW/vC+TDoJXsxw0JNW8GR4Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582139; c=relaxed/simple;
	bh=zi9x3EPPEK4Yh40bqI+3+mLaNvPm7zKYWzZHed95l70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQVfYkCb6KUC48T3mD1b2HlRptaAZ7fy7cI7kKj63g/m4Wq8BSfaDnPKvFGGMCKkzL6YHsaLWOYu8cURmcnayuRErJW1yyZeyU2zKlvz9ScG6xu7PvviQnIc2q5VcgOMC4w+o7clMxFO5xWmP/0YpVWm7LOtbyeNOLYNlqxyLYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=N5IKHCxK; arc=none smtp.client-ip=159.203.221.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="N5IKHCxK"
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 2B198E27C4;
	Sun,  4 Jan 2026 18:52:43 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UksAOopzHXo; Sun,  4 Jan 2026 18:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1767581562; bh=zi9x3EPPEK4Yh40bqI+3+mLaNvPm7zKYWzZHed95l70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N5IKHCxKjH+8AzqdN/dqkiPSv4/V2gqroHdoNOqpr91vhwM5zgOGIx2igaPKsNFmf
	 GQonP4yZoPD4+/3X6R+AkjtkvQBoAXGjiJKZwdjBzEbF+dQmjZsRYBbgAVIeFftHGp
	 CZSPfX9N2FSY7Z6Jpfi7IPwN27F4i+KtdKr+tu7YYlSSJLR0HtsM0e9cpIUrLIaVC3
	 phkPd3nNGCNgKuuNRYesHf98XOViAPjyJnfxuoPKnPukIoRGisssVvtssARN1N/rQZ
	 liyhctHqoTfPtzmlXvAcVtBpyIWGivQ0vregYeZLMRFhOx1FBnuYc9OfzJvSTbOg4N
	 nrjvpKO0fSdcA==
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Mon, 05 Jan 2026 03:51:55 +0100
Subject: [PATCH 2/4] ASoC: wm8962: Don't disable SYSCLK if it's enabled via
 DAPM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-wm8962-l5-fixes-v1-2-8e047171da2d@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=zi9x3EPPEK4Yh40bqI+3+mLaNvPm7zKYWzZHed95l70=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWyd0nWf4MQoWaGUt+luUBoIBdMSTw7f0Ge1FR
 tWSHRLKDSGJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVsndAAKCRDo8jXPO9vD
 /xMsD/9v5qBB+6lX0cGDO5oPr5GaGVhDSuBZDo2nOkMyF6eDvYdQ/uj3e+eOeFCrfSyfC8RW2rE
 OQIFW4l9gMsRmxgK2GfHIm39WnGcPl+/QdRliShn5nh6RX5l6zH1PStqfxWch65/+eLvXhCANte
 TTe6eQ779yy6KG9HNr5pIq2m9MxkuZgFfMsfuvv5ggfYXVIgURM3bIXrjz+1muoXa5bv5s1/a4K
 7INsbG13Uvsl1cnher8R257xOHoDLAwGIoGXhdEw1xjZRYT8Rhvr6XFt0h+lV8r6O1LJ0gPvSPf
 o7DPAcwfhu4RdBc2cknA+JuqxQleyllUzUAx2wcBhR7bO/jMmp6I47LbjM8EyjjHfRQCyC3rKnC
 W8821bOvrBz+yef6EvvLF43CrZIgH/6+OCBfG73UGLa+BSPRrbdl8depVG/VWUWPb5PBPCFk0cT
 XNpDZ3jhGBUb08QLf+Lt7m9tOWNirseqhjQVNTTnUSwmzPwjRXqLJLyjCzz+5tOox2haAFVqKb5
 H0dM63DjXLaqbrDvo3SSKZCfoJsJn6hNSbPNNOijw8y4g5HVeQ6ZH8rDZzIlbEmPFnVWzVnBwbL
 qyjjkyQyUW2M//nbA2d0bCv4p9/MRvBWWYNdbYh0Sl5bqIW3W/cuJLjSlE86lNKM8+RL9gaattS
 pDNpfytlcZCO0WA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

If SYSCLK pin is enabled via DAPM, wm8962_configure_bclk may turn it off
behind DAPM's back, making it assume that the clock is still enabled even
if it actually isn't, which can end up with it not being enabled for
playback or capture when it's needed.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 sound/soc/codecs/wm8962.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 1040740fc80f..843b8c6b40a4 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2520,7 +2520,8 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 	usleep_range(500, 1000);
 	dspclk = snd_soc_component_read(component, WM8962_CLOCKING1);
 
-	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON)
+	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON
+	    && !snd_soc_dapm_get_pin_status(dapm, "SYSCLK"))
 		snd_soc_component_update_bits(component, WM8962_CLOCKING2,
 				WM8962_SYSCLK_ENA_MASK, 0);
 

-- 
2.52.0

