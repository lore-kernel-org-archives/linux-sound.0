Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D633ADA7
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703776; cv=none; b=n/XFNeXVHTaLAcbpi8mB9tnYMwsYdbG+NeeIhWmsKagisDOcbcIhn5bpiFSSbpJb6FLvIJEroUV5elkcuaij0rQKjdfdUPFf4+qBh42ZYWsMlHvXA2CRl4H8QUk0BAb1kavr6xXw1sOZjgfiQ3p7luY/RpeZy4+dRpyVGq73jsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703776; c=relaxed/simple;
	bh=SIU3uxg+81Qix19XaEAi511t2VV4O46Np3YYRpFJ8YU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNxChv18r2Leo3dqttLuwg11sme0vZzgMDxb7aEwaeyMbHnTHKxIyitj77ey1Rkn4N9fKf6/eLuFpt7YNZu8K4LvFgGEZ9BvYTCx1sZ42j9qOe0qY3HW6PY/V/w4x0FqKuVWUBkllsS4eBdGR8knmrpqq2FW6nRe8qpVDMZksO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU5KLKjD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU5KLKjD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fd4531020so1524670f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 13:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785703771; x=1786308571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yt9KqOK03lS3Tt7yaRxdMddOAz2E77gX/5PtdarMJk=;
        b=LU5KLKjDXjSwSFcBHaAUa0/mWhswICbjyDadYfHIjJIFT2JjxyPii2DkKSuUEir2zt
         6kgRSwZ4mmkcS2tx90R4sRiHiggwsChRqsPmUNnn3YDhngL5CBod7HAXchjvZ869BD1M
         iYgYctagLf++02+68J7y80IqHYwxCSEyiIbU6Ewqzt7IJqwLpA5VkJEV4sbLRWvdGg5+
         pPlQt+7dRXid+lMkmXeo6OVvFDorcJ+DngqzpO5/6ozvwYYHX6fneXFPOSfD2HCFtr1U
         XPmRzhluYbmJ88gwPjpeZOijeQQdEKPxerrbp3vREHaIhfc6e3UIO9ukUsoI+TF2oZS/
         ARnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785703771; x=1786308571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yt9KqOK03lS3Tt7yaRxdMddOAz2E77gX/5PtdarMJk=;
        b=ZEQ9kVvMIs+pRDY7quJGizKPMIu+pnHr1QXWa8DmUykejz09+tlupcqi0G0T+ijGJk
         U6uxYamzDyXQcuCkgQMdnSLgxd7bE9vEYL1T8OPlh7gSwjXQk/0GHA5vnegmGiBmPtOi
         P+Ge/cFXJg2fcCDwNyamFfhs49uwC1p1BakeB6rMQqPVmrsNy/CKiUbT2lyBfBMUhnzb
         qEriwRci/1NWiHY4wUNqwJl16ocy3E2x1zXkOPvYoN85eJYRGu/uPwR+mIFhb6vlxYfn
         COgWXpDNH7yymmCGe6vDKjdo+k3d6POLCKHQnoBk3SqipqOl5K9fg5m8KY54Um/qNwzT
         Uwiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7bQsVa+iAM6e6yKimMoIhW0oG62Y++6yckOIbptST3sGLpeRxRsxmkqSfzanm/+4CJ6tSxghamZ9NeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAaDmEcR/sVGLXq5nSrNDc/UW/dD4REr3mjkAOIJhp+kfsMjHp
	PToEKdOTpjlIPONbltAuO3xPFTJrF0FerLASWe/tMdasguyQZW8dHdKH
X-Gm-Gg: AR+sD12LZdydZjuCCaX65Y94+fYSQimWxwn3Pwf0Kx4+Z52H6l6S85JFcptrppiijrT
	d1yeAqADXINKIofo9t/VxiQy725Rm3SvPGzQ3X5IOMu4kTlntVj4rwd9JFX6D8DEgwJr7faS1kk
	h7AB47H49wtfusYn8BNHtDcNm1lo+/G7o7Tg/Q2xwuBMjyv1ROc5xZIH4a5/yYOOpppcsC+NBCy
	9ty7+kd2Y1km7CrbEi11pvJ1EMShxcNzEo/5UBgccB46MUNGqF4B7Muc73N/UI1xHQoW3bpUwt6
	3T4mi1gRdnb9CUjvRhOM233frtnQDwjUXhxIOIqVGmKnGaAka+AlE9vhadU6KFTYdl1NnVRh6Jg
	8ELCpLRll2pQBn4Zh+/twRlZ4bTq4grsFXrwVSIGXV2Yqa1hWR6ECuq4dc+Qx3AampdEtWqhyvE
	mqbVrWFf3HR2OrOSuehuMjVnS/nn9s+e9IqdgRx3CDox/eKI/T/rsejg/WgZFmY0As/n2Yd6MGH
	SXXopmlip5II8EY8XTdiNCvNi+5ga/xd5SnmO+lgAsM5J1j4ukuAbccUKudXbI=
X-Received: by 2002:a05:6000:46cf:b0:47f:973b:71c8 with SMTP id ffacd0b85a97d-47fd72b086cmr11898803f8f.21.1785703771486;
        Sun, 02 Aug 2026 13:49:31 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm28066662f8f.27.2026.08.02.13.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:49:31 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ALSA: ASoC: fix unmet dependency for SND_SOC_DB1200
Date: Sun,  2 Aug 2026 21:49:28 +0100
Message-ID: <20260802204928.608173-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
dependency, I2C is enabled. This causes an unmet dependency when
SND_SOC_DB1200 is enabled without I2C.

Let's add a dependency on I2C, as similar options in this subsystem do.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 9dc15f81baf2 ("ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/au1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index a7630897bc0b..e8986da24d64 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -55,6 +55,7 @@ config SND_SOC_DB1000
 
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
+	depends on I2C
 	depends on SND_SOC_AU1XPSC
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
-- 
2.55.0

