Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D8B35675F;
	Fri, 22 May 2026 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455556; cv=none; b=uiq2i7yw3sfiJ9V+0FfN4e7az0ttYw89AonYAlY0BhLfxp3IDwQZQzq7lOx6/ykqDV+lrsKGUQgoljozceeLD5RamAHbHFJHo1TqsGqjIaoeD73g32UpnyK+jBLOehi3MPM8dHTjq50fPlzn8aFzJcG2GiIkVAcynICeib01NcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455556; c=relaxed/simple;
	bh=JsTztEtOCXDQSlvZta39qdd0kWNPa/QXuRXyaf1EX7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QevRXWox+cHDyAaHCEJFA6f6m5pZSjAjIOELDIWMcKSK+UeNsY3WzuMEzXvg4XkaoL8E/aMk/DWm78CoAcsZbvdQkXRr+ttWOU3NfqX83UouGSXvj3Ti+HstqNJVrRG0JfCKVnFM0qDa7PDtHXVEA3wvwG0BWkj8fAfMzQBFFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=nboAmI/t; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="nboAmI/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455549;
	bh=sNGKriiR40VmWfFFzwCnZIBf5B7xIayu130MyGqFNhk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=nboAmI/tbwlhS9yKLDGmEbh8LUKlxDpowbr/9yhEHwG/Uuegyjal03022pc9g9nE8
	 IufI6JbtUTTZLE+1Og2A4oS7Hn33WP/6Ll3tTRuJm6Yn7ZichjEYh94aDhr8okBVni
	 ihlVPhHCoCAeunTeKr16jIebMoYjJWLhu4RmBU6s=
X-QQ-mid: zesmtpgz7t1779455546t364b2750
X-QQ-Originating-IP: cH+OXfIEeHuVZdMzFu6pI+Ce7vT+VIferESzO7hFrM0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8738155976280777522
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:12:15 +0800
Subject: [PATCH v3 2/2] ASoC: spacemit: add K3 SoC support with additional
 clocks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-k3-i2s-v3-2-08e3eb811d93@linux.spacemit.com>
References: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
In-Reply-To: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=3766;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=JsTztEtOCXDQSlvZta39qdd0kWNPa/QXuRXyaf1EX7k=;
 b=hZhgyBa5r9WaBK6RB90JU4T4V6eX1l3KokC15CCQU7blElm1vNKU85QWeehz4Dx/RCd4MJWvS
 tMOXXzBkTHSDYMxzvvDWx1AQUMWHd/9N7WsZO2hUFjd1ATUcpO9Wn0K
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MXhM23rn16UwduSu4u3pTAA3okWr9Z4iLq7/tCqpbYbPSGkTB9YIb0D2
	vtTwbwOsejiFInehAn067YhaqHK4I5E34odnMnWM7qk/eim6gsbjG5EhiV70Ft9PrYyYga8
	Dj58Yzgz6wv8kaS7dKP52ctfxWmA5nhTpQ8xDoCVDfD93QyrRViTS/bEccLezO/4RAO5w3g
	WrFU6vnLxk/AHlzRP9Y/9lJIUsAceZGsOp1KAn2tKbVQ/bXxJfjhKQn4C266jA8uxkQtpNE
	BA9PSRSHfqmIuI5Cf6lRfL82E583yhaDqADMdCvuYw/oJ5QDnW1ZqV04lRt2yZblfdqYbV3
	nFhxt9dv/qBsi0uLBTGZrvh0rhSUkoOCz5IiV+T8t75powRTt6QiosHIOCq44EEyaxz1ebc
	Y0+8kX0rKvkbsmMzfAuUdCgxjpNRZ1ICiAztBhuqxo1BsZ/2U1xvx/NPrrVgV/2tHIPsV+w
	8MHQkfcxVFkXvG9bSwPXPCHJTPPC5/SK+ZObcDaxTzX7cVDZ3fMyLx9JhSld7HktR/0bica
	3QlREm1lbFQgZGb73MhzL/K71vO+Q2wTDfIV3maNlJJOwjKAFv9f2sa++/PDoSCHIzTctis
	OVU/qDP5ao4tN3EyJPtxawxHdFPzvGFmQI8SrPSlCK5iNfgMpuD2RBjpbrvg25z20vgdh8+
	B89sIyRX+1RooacSRAPW452xFP35Lj9xS815pGRFQK+QP8tEYVf4HfAf+4CJyDWxUbDmRBn
	buLvLpEHHfWUy3XGSJfIr7gRi99igpk2dt7c3JyUBF7nwqAvppuzRYjoGMFQDBCztC+hy5k
	tlRhrNlQHl4NC7XFnXzLZzpVq06Muop+89QJfYUGaUpJ80dTB+erVTSrN/snxn3hzs3dxmH
	VIQMEGsaY7H+wFyxZmmkk9u+CjdWcyUKZE6Ir38hOYmv8YaRHbxBGjQwGRjm86qQzYNEl6t
	j67y6vlnLW/PFv6DZboj0kq6SBj8t4xHkmlY+tE7q9ySeorUclCjoQ+CnHm5Eef20a+BO4M
	a7c6wyocdLS7eaDOi6swXut/gNyY01khxIpXI4h7zqjnXMK5G5rIs2hXIknjvrcCNxRg8bV
	ZjJVs8tXMoDkRZas5gMPYY8Gtk4LcscE5JRrxb/CH4/7jkRK+nPckaOLWFucvKlYp9MipIo
	193np3Lpiw+2iHBu7O58P6Gk2Yq7f6UkdshTonvZZd9B1nWBeYbsOneilg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Add support for the SpacemiT K3 SoC I2S controller, which shares the
same IP as K1 but requires additional clocks: sysclk_div, c_sysclk,
and c_bclk. These clocks only exist on K3 and are not present on K1.
The sysclk_div clock is present on most K3 I2S controllers except I2S1.
The c_sysclk and c_bclk clocks are shared across multiple I2S
controllers on K3.

Use devm_clk_get_optional_enabled() to acquire these clocks so that
the driver works on both K1 (where they are absent) and K3 without
needing SoC-specific match data. For K3, the sysclk_div rate is set
before sysclk in set_sysclk, and the common clock rates are configured
in hw_params based on the sample rate.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 1cb99f1abc7c..4e655d714623 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -53,6 +53,9 @@ struct spacemit_i2s_dev {
 	struct clk *sysclk;
 	struct clk *bclk;
 	struct clk *sspa_clk;
+	struct clk *sysclk_div;
+	struct clk *c_sysclk;
+	struct clk *c_bclk;
 
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
@@ -189,6 +192,14 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 		    params_rate(params) *
 		    data_bits;
 
+	ret = clk_set_rate(i2s->c_sysclk, bclk_rate * 2);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(i2s->c_bclk, bclk_rate);
+	if (ret)
+		return ret;
+
 	ret = clk_set_rate(i2s->bclk, bclk_rate);
 	if (ret)
 		return ret;
@@ -200,10 +211,17 @@ static int spacemit_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
 				   unsigned int freq, int dir)
 {
 	struct spacemit_i2s_dev *i2s = dev_get_drvdata(cpu_dai->dev);
+	int ret;
 
 	if (freq == 0)
 		return 0;
 
+	if (i2s->sysclk_div) {
+		ret = clk_set_rate(i2s->sysclk_div, freq);
+		if (ret)
+			return ret;
+	}
+
 	return clk_set_rate(i2s->sysclk, freq);
 }
 
@@ -418,6 +436,21 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
 				     "failed to enable sspa clock\n");
 
+	i2s->sysclk_div = devm_clk_get_optional_enabled(i2s->dev, "sysclk_div");
+	if (IS_ERR(i2s->sysclk_div))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sysclk_div),
+				     "failed to enable sysclk_div clock\n");
+
+	i2s->c_sysclk = devm_clk_get_optional_enabled(i2s->dev, "c_sysclk");
+	if (IS_ERR(i2s->c_sysclk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->c_sysclk),
+				     "failed to enable c_sysclk clock\n");
+
+	i2s->c_bclk = devm_clk_get_optional_enabled(i2s->dev, "c_bclk");
+	if (IS_ERR(i2s->c_bclk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->c_bclk),
+				     "failed to enable c_bclk clock\n");
+
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
@@ -444,6 +477,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 static const struct of_device_id spacemit_i2s_of_match[] = {
 	{ .compatible = "spacemit,k1-i2s", },
+	{ .compatible = "spacemit,k3-i2s", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_i2s_of_match);
@@ -458,4 +492,4 @@ static struct platform_driver spacemit_i2s_driver = {
 module_platform_driver(spacemit_i2s_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("I2S bus driver for SpacemiT K1 SoC");
+MODULE_DESCRIPTION("I2S bus driver for SpacemiT K1/K3 SoC");

-- 
2.54.0

