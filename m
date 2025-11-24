Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027D2318146;
	Mon, 24 Nov 2025 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007525; cv=pass; b=gPbfgPzc/jH5v+Tq2khxCoj3QT097iBeceCmGrCK2ClIT6zQC6eYhT49NJja76Iim1WEqb7V8ndUBUgxxEzXtdSKnpRB/kRn8ydGU/zzoPBcVgplpngv/OhKs+m/Ymrq9OYm8DHmedVq9xHQdAFSlTbfHEcAifTi4X93/ciUv0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007525; c=relaxed/simple;
	bh=4hN2+mR9RXFyMchseG+eh5R/NumPRLG/RBqLbk3clVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0qEUSma2Lp17rg1TgvFgtATAZSIkvUg4vE9fw5ZorX5mgM4Sd5K8Cz6yOCm4BqALCz3PSuoGWkQ2Q6tQCXp+jSkJrKWpl1jyYn+boHYv9SruXQZoWpOM1XW7jgqTbu/6NQoW+Cou0+n3qJcBq6fjjhNG7Lmv3t2/OZHlNYnQuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=AqEBgztS; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="AqEBgztS"
ARC-Seal: i=1; a=rsa-sha256; t=1764007512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ECTXlq1JajjdDgnfh2xW3M6m05k0VNmuxzewLB5C9dhlnRLJUuENcaIos870GZ8eMwhtWOL8sUxJZvODmUuLyZWY48DGe+0T/t8gswoN/TT8yV8h644Ufm46YLoY12NvXCGe9q3SoPkW6pGbmLfXIr/OQEHb/p2d+i+OKDoX+MQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764007512; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lP+2wIUwkdEoZx7g500+cPO+PZdEE2LTFPtL4FjU9JE=; 
	b=kPtKC5L/MDvmvbkp2zc7F/3nVGpk6vyxzIxY6/ZsYruTl3hNmPOQY2bFTnKlEECeKUXl4YNv7pXfCaUS89D8r4Q4B09dFxbS3EhwgjCydhseCwUSd4h194fEfdXKKv4NQTzPtwPCh8+EGN+wPCQ1HEV8Dh7IUDxr3iuZ5Z/esa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764007512;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lP+2wIUwkdEoZx7g500+cPO+PZdEE2LTFPtL4FjU9JE=;
	b=AqEBgztS7FigRFOMurt9P1FQs73nv1IkTHBsIHbL3RToZ2pHIc/WPcofdTLeaCWW
	twnV1bUF1b4cE8skhrwj+Qfv4djanHIyoa+q0rX2dqCGtY1/O0Tr1kKIbZmVUIXiRTL
	5argYKawZN8C2JZicjHbwNp6CxiPsXCqVlI8uLuFj55hXX11Cu2xmJsJ7CHnA/LFBgl
	daLvn8QbtxWzy0TFp2VeSjR1KtyLfWnTsWkBYItT2e3Xj5BPCRG7+ODT4FMT7P4e7rI
	9Ll2MWKcUjE5G0OayjPpfzbOrkZWS+kiw1c5Y+ISE7sSMWFUrWVnaNao7yvVNNS4q+S
	UPNT+xOUxQ==
Received: by mx.zohomail.com with SMTPS id 1764007510338893.6534700293031;
	Mon, 24 Nov 2025 10:05:10 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v3 2/6] ALSA: ctxfi: Add ADC helper functions for GPIO
Date: Tue, 25 Nov 2025 03:04:57 +0900
Message-ID: <20251124180501.2760421-3-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124180501.2760421-1-me@harin.net>
References: <20251124180501.2760421-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add helper functions hw_adc_stop(), hw_adc_start(), and hw_adc_reset()
to encapsulate ADC reset sequence operations. These functions reduce
duplication by centralizing the GPIO-based ADC control logic.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/cthw20k2.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index 1a085e7e5786..5d39bc943648 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -1826,6 +1826,32 @@ static int hw_adc_input_select(struct hw *hw, enum ADCSRC type)
 	return 0;
 }
 
+static void hw_adc_stop(struct hw *hw)
+{
+	u32 data;
+	/* Reset the ADC (reset is active low). */
+	data = hw_read_20kx(hw, GPIO_DATA);
+	data &= ~(0x1 << 15);
+	hw_write_20kx(hw, GPIO_DATA, data);
+	usleep_range(10000, 11000);
+}
+
+static void hw_adc_start(struct hw *hw)
+{
+	u32 data;
+	/* Return the ADC to normal operation. */
+	data = hw_read_20kx(hw, GPIO_DATA);
+	data |= (0x1 << 15);
+	hw_write_20kx(hw, GPIO_DATA, data);
+	msleep(50);
+}
+
+static void __maybe_unused hw_adc_reset(struct hw *hw)
+{
+	hw_adc_stop(hw);
+	hw_adc_start(hw);
+}
+
 static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 {
 	int err;
@@ -1843,10 +1869,7 @@ static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 		goto error;
 	}
 
-	/* Reset the ADC (reset is active low). */
-	data = hw_read_20kx(hw, GPIO_DATA);
-	data &= ~(0x1 << 15);
-	hw_write_20kx(hw, GPIO_DATA, data);
+	hw_adc_stop(hw);
 
 	if (hw->model == CTSB1270) {
 		/* Set up the PCM4220 ADC on Titanium HD */
@@ -1860,11 +1883,7 @@ static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 		hw_write_20kx(hw, GPIO_DATA, data);
 	}
 
-	usleep_range(10000, 11000);
-	/* Return the ADC to normal operation. */
-	data |= (0x1 << 15);
-	hw_write_20kx(hw, GPIO_DATA, data);
-	msleep(50);
+	hw_adc_start(hw);
 
 	/* I2C write to register offset 0x0B to set ADC LRCLK polarity */
 	/* invert bit, interface format to I2S, word length to 24-bit, */
-- 
2.52.0

