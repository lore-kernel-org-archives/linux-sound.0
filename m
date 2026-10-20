Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484847;
	b=XnR1Yxadmlm7aHytr+OlHRnKYRTYWhbhNFCVubPhL7rIYj6vYp5U7KM57ygn9t1dfudN
	 JQLgGw4RUWlqsIbcdk5ghEB5cYMBi2PmfSFkMG7bzymAi8r2Zx9NtZGn3O+QgOCBBEJfm
	 3H+xJPpOhAyf6zLNynF0yzNaL3E0MYMYfCoVsVgkjWtxVCx/5omnPabUeIkjS8et5lRV+
	 Suiko+0krEJSlAx/RPh8xSlg8mgsolYtCcXChHQjVULOOk+TWNZdoYILzYSi+APPFpUwP
	 fMxh6F1dXzUCtWmqPiSejYDbkKYPhOZ3khCV8bSRc6ISvtU9lj5CxxRVEKiFKaWBSHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484847;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yIxpS/nuJ0i6AS7+eZWK91Iqf/SzxpUyTm1wvTNr/u0=;
	b=s/hjc33sxBEog8aeP/3RlNF7cz+Gi7D0Pq5L7t1KtviiImYXqaioEiffeSak7ITB1DY1
	 dJa/Q4NsX2jFEg3GEdT9XnP73e98KA14L33aq8RxEgPI3+WhV4eMc7xpb86mA8ZOnz0lz
	 FzAbeK1Pt9UYhg+bWLq/b4CjnSfkUyuHiTDaC/EyZeTsEDemM6e8m31mAfgKNvoxp5fcr
	 znkYAjIQ7F2GTlJTaHp3UBKRiJAFvzyNS4vjN1dElAew02Skm1OPH08Cmo+dMRegooV/6
	 MoiHtvWPXl2gF22av2/8FpPyR2/uktV1GtgrYHjNkJKYAVv8gDjsjb0ysro7ve+wsSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=fS8M2vLn;
	arc=none smtp.remote-ip=95.215.58.151
Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EC260A2617
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 08:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EC260A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=fS8M2vLn
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oOYcLk8SgSFDbJWze+I2ylWBx/emk3yDYK2BxxUumHM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484845; v=1; x=1793089645;
 b=fS8M2vLnm5JXRpF2X4MlviCyLPU8Nxzy6AuKhy/obZNC5zS59PtD+8fNnSGAkqq4KQNHjzyB
 KbTWFwW/725TEDmJMF6RGQZWCs2hrDBmqf3nu1ElubPTyq2a7dJHnBsSTBdvnz0E44mo7Ebw7CG
 OYbDOGqwUeKF+YirVZ9KEtCxRzy3wTVitViakdAu6kyj/RlzjkXYyx6z9KvH0agQQpMCbI57DNG
 Zrbwt9AsDzuj2zvPp4WSUL4g0/z/P1Jjl276hDJZMW810OBtVzdo44EAKjXXIGniX9HX7DQ632Q
 p0lp6KckzXa5m1sRzdU8C01wzXj9uqhRlujY+ahtvJA/Q==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0ee227f5af125605;
	Tue, 20 Oct 2026 08:27:25 +0000
X-Mizu-Trace-ID: 0ee227f5af125605
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in typec_report_(un)plug
Date: Tue, 20 Oct 2026 05:26:25 -0300
Message-ID: <20261020082631.1509275-4-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082631.1509275-1-val@packett.cool>
References: <20261020082631.1509275-1-val@packett.cool>
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

mbhc->cfg is only set by wcd_mbhc_start() which is called by the codec's
set_jack op. wcd_mbhc_typec_report_plug/unplug are called by the platform
device's typec callbacks, which are not synchronized with codec ops, so
a hotplug could be reported before set_jack was called. Though unlikely
to happen in practice, add a check to be safe.

Found by sashiko-bot via review of wcd937x Type-C integration patches.

Cc: stable@vger.kernel.org
Fixes: 0c105997eefd ("ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux")
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 850be84d65ce..fd40c1686d66 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
 int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
 {
 
-	if (!mbhc || !mbhc->cfg->typec_analog_mux)
+	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
 		return -EINVAL;
 
 	if (mbhc->mbhc_cb->clk_setup)
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
 
 int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
 {
-	if (!mbhc || !mbhc->cfg->typec_analog_mux)
+	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
 		return -EINVAL;
 
 	if (mbhc->mbhc_cb->clk_setup)
-- 
2.55.0

