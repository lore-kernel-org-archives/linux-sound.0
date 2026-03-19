Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881328030E;
	Thu, 19 Mar 2026 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901612; cv=none; b=DaQJVKKy71+XRqDoqQ+wLBeO5O6jwfR5+S0HnBkBgJK3Uw4kB9wUMYGyDykxN/k3ogSGwFPlB8jh4RX1LtSt2V8WVLbta4YZwqPcyti6lhqeQqQWQct5Cn13k+8SuG/1wHVjMsfSu0UfrePqLqgYR1eCQggAVq4AYdY3gRbmQMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901612; c=relaxed/simple;
	bh=aga+9r1TDPqgS6WVdl5ieAuOs47qTks0SG2L3ovDoQg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=VlpmlXH5P7o08EnPu/eeTwjMkVsokHhsQlvH350WAG7S89xjfMZFIDs+k0R0e4gMDpZp9iI2bzlDK4stP1N3XULig1elZ/c812Nw8wzpi7XEx9S5P+khElFxw2wi9WnHoY6EVXd3FLy9ljjf6C+7YI3s0U6CkD9pGyYWZ2GPcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=U3o9mub8; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="U3o9mub8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773901599; bh=jgWLZjD1oRPWyd+TiqTM0i5dg2si5Vbd7FE3BSqbyV0=;
	h=From:To:Cc:Subject:Date;
	b=U3o9mub8dm3+hf8vADMU2CuWOND6Wul89hSP7kZFDSG4NrAz10LC/IBIT4pGrPolO
	 CzM38s1SS1DnVwIUvNXnySHNYGeaqy8SlIVA42s1J5ngWZRegd0G/Yczbdwfl4+hwM
	 8VuA9Fw+MXTwmaXIt8+JrjrdLaVIwQbTtSzfHy5s=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6A38DCCA; Thu, 19 Mar 2026 14:26:35 +0800
X-QQ-mid: xmsmtpt1773901595t8jj77x6p
Message-ID: <tencent_C6FA39C682B462AE88A77B1D916115E8C205@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XviUsRfFVmUUlS0QM14WKtyGltgNiAcUGe8Xq4wy+V22R13uqz3
	 gMOZkzw+W8tLnehOGOALBajNNuQrWLdGxCEPff0huUKsHHVRq4SprZRkg6c2e0XfGGlBtYmzFmyo
	 oW/Z//Z+j1pQAjcoUEHNCFU39aAiNCx5jfyv+HEy6w+ExIjIrsmgn+3oK8dRGYqsb/mOYX8C41+F
	 DEfh9x2i3CoM/pkI5CYtufq2o/BZsdtusroXi2ivXMLC8QUw2d9QiAQSSjqRgWTUkPw89R9sK+JF
	 TIFk1iIIOS30iW5UfJyGrb48o0VUh3Ar4mnre/Kd+ZFhvMEsrcRyMgj2SepmGizr8CKESaXOG98H
	 VuzKjjAtDSXQJi0v7i5mNGJ1bv8P0PV3fDdcdxlwZ6aevDD/Lx8OeJNxJPnrGOgkAHHhEtrBXh43
	 Inz27guHs9Yvg9plf6rNUZ290nOL1XoQDUcyUXARgMYQ8+e8nfdELWS2icCZquFELrHd1CII3xlY
	 Ci3xjVfamdGq4NXQO+530bDXoCEkMULz7xaogF5S9HxwMGFKSdw8e9IZyWqHTZcfny3ihhPn1Iuh
	 RBk98jVNJTM1QzFTsANomUqastTqtXjmnEootB2Yr73eY/VFgE0PtxeJYaBLGXToLP3gNuYREC8h
	 8r4rh1BzVur7IlX0qK+IiYeAP6kAeoMkxQCePZ2keRPMwx50GxTAVUXtJMMaAV107nCbDEifqpdX
	 5Ysg20ssV+b+TH3SD44vurP4/easPagOd0OhnhP+irK+jKixrwh4FuoxJjEe+oyvGQM90biaQWL3
	 x4+kAUVeO0IUY0kWnZ2Nz4GWNeKWiZWtbA9JPF4kmj2hxwtsoGgV2vFnEAO5D41tsqxzMdNf/P3E
	 MVeBPtzuDIEVGKYDfaEtQdvhwvMpF5hS4bH8H7Zj6ysgkWwvwe/R7nujjMni0dkUopnxjVmjv0xh
	 KVGM7gbMRAIMUeQagnUxO1bforOrAWKwbFnb1FcJxJ2FzWU+CfCDvupTecD2DFoAdlircswd9UjI
	 0nzETfoIrwfYYhY6Bc
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Wenyuan Li <2063309626@qq.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH] ASoC: uda1380: add error handling for I2C operations in write function In uda1380_write(), multiple I2C operations are performed without proper error handling: 1. The return value of the second i2c_master_send() (sending register    address) is not checked 2. The return value of i2c_master_recv() (reading back data) is not    checked 3. Error logging uses pr_debug() which may not capture critical failures
Date: Thu, 19 Mar 2026 14:26:33 +0800
X-OQ-MSGID: <20260319062633.7157-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If any of these I2C operations fail, the driver may continue execution
with invalid data, leading to incorrect device state or silent failures.

Fix this by:
- Adding proper return value checks for all I2C operations
- Converting pr_debug() to dev_err() with %pe format for human-readable
  error codes
- Moving variable declaration to function beginning (C90 style)
- Providing detailed error messages including register address and
  expected values

This ensures the driver properly detects and reports I2C communication
failures, maintaining correct device state.

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 sound/soc/codecs/uda1380.c | 44 ++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 9e9c540a45ca..4d2a653b8c59 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -95,6 +95,8 @@ static int uda1380_write(struct snd_soc_component *component, unsigned int reg,
 {
 	struct uda1380_priv *uda1380 = snd_soc_component_get_drvdata(component);
 	u8 data[3];
+	unsigned int val;
+	int ret;
 
 	/* data is
 	 *   data[0] is register offset
@@ -112,22 +114,36 @@ static int uda1380_write(struct snd_soc_component *component, unsigned int reg,
 	 */
 	if (!snd_soc_component_active(component) && (reg >= UDA1380_MVOL))
 		return 0;
+
 	pr_debug("uda1380: hw write %x val %x\n", reg, value);
-	if (i2c_master_send(uda1380->i2c, data, 3) == 3) {
-		unsigned int val;
-		i2c_master_send(uda1380->i2c, data, 1);
-		i2c_master_recv(uda1380->i2c, data, 2);
-		val = (data[0]<<8) | data[1];
-		if (val != value) {
-			pr_debug("uda1380: READ BACK VAL %x\n",
-					(data[0]<<8) | data[1]);
-			return -EIO;
-		}
-		if (reg >= 0x10)
-			clear_bit(reg - 0x10, &uda1380_cache_dirty);
-		return 0;
-	} else
+	ret = i2c_master_send(uda1380->i2c, data, 3);
+	if (ret != 3) {
+		dev_err(component->dev, "write failed: %pe\n", ERR_PTR(ret));
+		return ret < 0 ? ret : -EIO;
+	}
+
+	ret = i2c_master_send(uda1380->i2c, data, 1);
+	if (ret != 1) {
+		dev_err(component->dev, "send address failed: %pe\n", ERR_PTR(ret));
+		return ret < 0 ? ret : -EIO;
+	}
+
+	ret = i2c_master_recv(uda1380->i2c, data, 2);
+	if (ret != 2) {
+		dev_err(component->dev, "read back failed: %pe\n", ERR_PTR(ret));
+		return ret < 0 ? ret : -EIO;
+	}
+
+	val = (data[0] << 8) | data[1];
+	if (val != value) {
+		dev_err(component->dev, "read back val %x (expected %x)\n", val, value);
 		return -EIO;
+	}
+
+	if (reg >= 0x10)
+		clear_bit(reg - 0x10, &uda1380_cache_dirty);
+
+	return 0;
 }
 
 static void uda1380_sync_cache(struct snd_soc_component *component)
-- 
2.43.0

