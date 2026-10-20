Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515883;
	b=nA567iVinCKwQ4WDFMI8D5WMd/y5cqAgYDNy+EwhWZCsAqjPx1YSU1pFBglDXbHF0Aqx
	 bkVwjsCqskIdZBZayEu89qydVtsgWQypfPSiB1eNUl9oColfjXrZop2zKNEbglxj5G5uV
	 4r/0KypdogO02opK854SQp/NPXTda9K3e5kAjbhJriQ5hQytc51ZxW1nFU9CZSLTgJ+Yt
	 SN1N6doeJV/9AQivJsZND7W59cyq9cw1YJhixIzOBoTSUReRHktoDV44pWjcOg1s1bxIa
	 I6BkpT2Vm9r4oyBRKrKULDYucgyRUSiF4Z5oVVhgbDnCWXtDrHh11XXH8Qg8dKNk1zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/NkHEc14ap9EoiYBL29jm9IrWSVRdvFivLVyYI25HxA=;
	b=r+G7JCJNrWGmrAeWU6de+MyjTzOMuoyXjap8WCJkAtqwRwMqAW/uhn8Yj/j7uniXoeeC
	 VjCkTE+U6ZdJwT0Y00UCHtR7a+EgFEY5g/K4YLxdxVFj3B4bJV2OhLhPkWoo11mbaHJlb
	 8cjiquRqfofSc5RxQ18YT8zImzK7tqowiFEXsxG1IL9eQ6ZqbSp9YeXseKQpJ8JexZ4vn
	 voc3Vi6Cl9HWdxCymD9WzHERT0zlnIMHTZBBZjLRfAR2pSB0kg4EQYp6rFPdhnnstC9fj
	 V4oc1vhdZHekzpALSTZSPruWR5CQ2ucyYJknDh8zQ370Vf5SOwz/+jJEgDjjcvt5t2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Umvi28FK;
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4A60A2618
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 17:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F4A60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Umvi28FK
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xIkcM/Fb30wHz4j2T9hWsL27wuK1xhSJcVgYRRZPvLk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515880; v=1; x=1793120680;
 b=Umvi28FKRZepfS/DRoW4dyF5barc4Na7Z2SgA/sKcMqgdUidhvDbV0AJcvHIcz1UXeBD0z2t
 cAhMBGb5jabvqXl/TDRMTGgoko/Rdgx2YxJQ6u9WnHkP6xLFZMC+eoI2aW58St+mvMw0uHfOB+o
 TUAJS4oIgkapPT3vuZcE7PMe+gbInOihz9ikOgB7rsn1EGJR7FWvPiOlbeUpb2jqJCy+K1nbh/z
 s2hmCyf3R+eVQP6MlGxIkNtUuzmM0LrIZxp5L11mHCQw6TcDYr6DtAcVHED7BjCenLGiGXdqXSf
 zg2eb03Cfa0SmnrFywPWyg+NSP9wAbKBo4mYj6QfEEdtA==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d8308d482c88357e;
	Tue, 20 Oct 2026 17:04:40 +0000
X-Mizu-Trace-ID: d8308d482c88357e
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
Subject: [PATCH v3 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in typec_report_(un)plug
Date: Tue, 20 Oct 2026 14:03:27 -0300
Message-ID: <20261020170341.1641325-4-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

