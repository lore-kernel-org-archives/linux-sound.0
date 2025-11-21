Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29852D8399;
	Fri, 21 Nov 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738567; cv=pass; b=It3yMhWEPIvPUfjRRPKuxHvQPbjR+x97lKZzj2BipJxemyZeo1q7sYRwvGJAFP0juQ48NE3aL4v6M+aO66QHnxtYDzYsjSJN05NYPqsGXSXWr1S396gCGJxEBmVGgH+2OBQeyDx9SllRh3mC+PYK4tcO6y9QcBFPX27hBE0aYLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738567; c=relaxed/simple;
	bh=4hN2+mR9RXFyMchseG+eh5R/NumPRLG/RBqLbk3clVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oq9ewR0o4Z97v8nKddyIWFM4RHmaN1ak/r/icgaKuxHWLrIsXjPn9BG14oPw95j69Lt3/IWj3YtMstSkvEzx9Gyo414mAsFHycKTRrU0s70rN18yu/698eBbA2KU/imc7JTTj9T0QGKG2AprK1ZsYYwGF3erFezCIoYg3pyIKls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=CninAw/V; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="CninAw/V"
ARC-Seal: i=1; a=rsa-sha256; t=1763738556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iBKMFyk3Cg2HcaH6XPiiixhAKHEVo5UYKiTJ5E/icOO22aCXjduapnDQwJ81gwTcMZbBEYH4ZOQMODe8TA0h4cAMugw6EKuVE6/9WlByPdPn4xZCtbANAo0jHlQxp9fNK6b0JXnDSHF7shEQsWAKUjxkzcAdgkozvufRj9/OuzU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763738556; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lP+2wIUwkdEoZx7g500+cPO+PZdEE2LTFPtL4FjU9JE=; 
	b=W8Ipa8woLEX+Ph7+kVyLzSp8xU8UlmFPM4K9xPkesTAYiRukPZMdFcN2lWz1npiSK1X9pQRLRAG7TqMQawH6EruZtcFhXYcFn6BWavX6Mewa64qLNreD8L5SC7qeQaYUff2mwuVykJsA4W58aTMbZaD/W4YD5fN/F6oh3N5VCSk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763738555;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lP+2wIUwkdEoZx7g500+cPO+PZdEE2LTFPtL4FjU9JE=;
	b=CninAw/VG8PbDwrvOc0G4IwAvupTSLX4su3zsELSytxeOtH34r9yQQiEeuhzjoHu
	eIbrhL6g3xpYwbemVVNhPhm4AHHP+eTixTG8voAXSwg+BSuRnS/3aATJO5bUOBSEUQV
	L4Bx0qOfYcSem6L2NFsv3hJMeVREkpRdqQIo8uHt4TOYzKP3Cll8UBUUUzMTKaCyR2f
	Du0ZuuXgBbmv7SIwGxFpnwcoX/9czfm5Ze3IAK40Gy3GjEdK1bvnVmYWRMTCWZbXpRQ
	7PniDpeMun/wJ3PFCjTExN8lLFsGv6WOPV7HGk/Ib0wE5a7lpvQ+gU9ravgN+JhtBBY
	bd2gP4rAGg==
Received: by mx.zohomail.com with SMTPS id 1763738553488366.22871214662166;
	Fri, 21 Nov 2025 07:22:33 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 2/6] ALSA: ctxfi: Add ADC helper functions for GPIO
Date: Sat, 22 Nov 2025 00:22:16 +0900
Message-ID: <20251121152221.1152523-3-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121152221.1152523-1-me@harin.net>
References: <20251121152221.1152523-1-me@harin.net>
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

