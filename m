Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D7C33DEC5;
	Fri, 21 Nov 2025 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734358; cv=pass; b=jyOOcsWwIOqvhKpOokoWSVNryQOUi4Ed0B/GBZdOMBZlelt02tqd1Z3HwMpWWCKhWQ2xYeqs/3baRrVmW5tzD7xXeruDB+FB857v6k0t98Eeqlkwl4rtMm00rLLJPzCE3FEFQAALuVtoWYrVFcsyrJftzOrMrS5KoTZ8YSQ1yYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734358; c=relaxed/simple;
	bh=4hN2+mR9RXFyMchseG+eh5R/NumPRLG/RBqLbk3clVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMgOBquhHGV/c1wCl0lMpMnKLeBrr2vCLFc0F4pWWvgX8ikLAgc3Cl5LsnOSJ88yhVrei1/W8kbS81imsYt1AW0IXkoVh9q+lrJDlTtsfd9suj/nudEBRYUwFaknuyyElVuonFeyCNepsYR11KiuZDkVFKR5JFbTZhuwBc2fzmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=TAiklb4M; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="TAiklb4M"
ARC-Seal: i=1; a=rsa-sha256; t=1763734345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GtoJv33B+8F1K6qCaUShRCuQUEcjZTVC3cQ7P+l71niDVhLzK+NIckI8KP3oanPvUbX3u7ROK7wK5dPWBrAhzY0Iqa/Niw+h88Ds+Rf14j6C7RRgks3XjdzQ4PXxyiavVii7gffVMp01PfY0QiT4K0bnZmFOl78rUpgWnIQMxn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763734345; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lP+2wIUwkdEoZx7g500+cPO+PZdEE2LTFPtL4FjU9JE=; 
	b=BqG5FdApNOYxUvUvYDdnL+V/9tUM1BZYs/Ymrlao2Z0040LV6wND1VsspOGcXGA70EHnnzTtxAf6qZ4imJ2NNjgs8L98h3RaZkl8cuBR1JN6iZT0GPYKMP2EP85Ufm1kFKtOUJQahvTdNmIN0uKVoxdUbSUWv0cr53Q8I49VKgY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763734345;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lP+2wIUwkdEoZx7g500+cPO+PZdEE2LTFPtL4FjU9JE=;
	b=TAiklb4M/phFXCitBB/efv0X75TusmgRSZrZst0TvO6q46rAZazU4Azzfree1Yo4
	P4biMnL9cW67fBdMFi/GDz2Rm1pnGtAA75Ul8r4sfRuBX4d9aEW1U7PUP07hQPgtNy2
	BIFoMd+DcrySxDfqoDofBMznRB758RALn9bHSSeLFAM5v6utqU/lmmFsS9rquZOGZu6
	Nk1bPBqVcTmgyh6hF7Qm3sh6eZlAhtVEv9/c0Sb5UeX/DiaO8eaWWohaGxW6AJQaFjP
	gdDrUZRJ486o5rgUCglt3typii85eZ7AyC7vlhhSwV00HlckU9fb18ulF3y7mP023l/
	2KvvDEyeDw==
Received: by mx.zohomail.com with SMTPS id 1763734344182683.0099985326202;
	Fri, 21 Nov 2025 06:12:24 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 2/6] ALSA: ctxfi: Add ADC helper functions for GPIO
Date: Fri, 21 Nov 2025 23:11:57 +0900
Message-ID: <20251121141201.850931-3-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121141201.850931-1-me@harin.net>
References: <20251121141201.850931-1-me@harin.net>
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

