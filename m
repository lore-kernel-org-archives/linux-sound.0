Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350662;
	b=VMgYqJ5SOlN2lWeM20/NrfV3djIFha76t55W26oFu5erwSUMYGKcIwy2pV3RBe2g70mF
	 1izD/G+3Jqc8akOx1ulgjFkVVhXdJfvRhiKVe8DBQ/DmEGA+bChVbrnvTzNcv9XWVPhlQ
	 Vm14PnZv4357CJBEv2jIoakZNvW+3MJ2lMtUrVS+F52Pp2ajuOYbUzeGM8gSf0CrvfYFL
	 7s5qC2DZ48csUp1+Tak0AnqAT4E+L+QJrk9Xb1NTQGmjb6C41SEWcxde6F00aK2UKJTC2
	 bbZw7cQLYADt6MD4BUbdb97/SuS5Z8DIaXjVi2cCEiUYRF8Nv3VmTScOOzZpH/8v4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3f7gS8x9jk1QAEvKWYbIvU++gPKjDJUm616PxTVapbE=;
	b=qKcsD0pOroAgzi+jxRXE67sR1lYIOllgoN38PyupJkpC88tixSgy+7jY7eNaWWeVtrQx
	 JALjdp2sOFsTSlW5JtTqt95v9yCU8nB3fGAsxj0gCwcI+VnnBNqNiIREncVPPNLEe3IxT
	 LUBRJLa+gx/YVnVhyTu4sJaJabJ/0ecDyxlyuTzPVHPuBKzP8jpff4iouHizHs9TMuVsQ
	 OwBskuDErMLrwvNt3Pyo/VskwsaLP/SeS5bCJKjonFfptZ6P5xdQxsa8bsN0DGzkIxa0w
	 3GYHlg6g8aEJ2lziCZImmtf/vUo9UXvDzKjMkXdx6pTYNcBnzmhdg1PSD/4Wdpbb0Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0TdIJ3B;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4D606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C4D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0TdIJ3B
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so3571095e9.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350661; x=1793955461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3f7gS8x9jk1QAEvKWYbIvU++gPKjDJUm616PxTVapbE=;
        b=i0TdIJ3BaFpQ0AKlw7ZKABTcXFp/R61LHO3AZ2kEjTlHdlg291cF1wbdwEWxwC8egx
         dV213izuvfa5Ol5H3/U7V4V1OhhfUbtdy42GRDNgtQ/7m+guqsvshiXmRqhA3lI5Cnhp
         2H28QRcGOwcHr9/P0rutNf5tjmfJmVGM/EjXFv0OgytbHFPvIVCNI1KN39VhdGGv00Kh
         wtVV334voo08DxOwioxYRDVuOUAioWiLcIVBKM4BsEwjWwBAcC73LZ8M+y9Jb+g24UMk
         BE/xhGA3AZ7pEQYn+QhR8u0fkU3jv118ZW6EikkLMbWq2K3nl8jnwC6s6j9E1zwOPrYa
         pcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350661; x=1793955461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3f7gS8x9jk1QAEvKWYbIvU++gPKjDJUm616PxTVapbE=;
        b=2XBrpJoXMmePY01IL/gAbLBHR38yJXD3jPR0Yy5HwtK/EO3eZmXhZuc+YcH2v4tSVZ
         ejWG0pOqFxPE1nd/tOy1QSDH9lrps9OtMeXn7Ay2YgIpMvrHr1NM7RcsrFcajuTL9CfJ
         fGAj/mUHHiNdb2p7hoAuo6mzS4vosSze2Eu8wpnaLw4LE5nMK2mzuJ2yDirQo18Ejezx
         dpl99vAfi6T1IjuSUxYj27roz7/mip2sdv7fff7pkJSQ7KjY2OOJb592XBSE4fx27H4k
         JxqKBladVzlqwwRQQDwRhQK8+pjg5k4TMDSfMmGpDBoYpyFkDXDDDKNLSRyAwGuJ3T0q
         76tA==
X-Forwarded-Encrypted: i=1; AKwUvBzMYxbGkwMrgXPOf2Gk2yqyIIjfpGl6soeLFWP5it3bDsbnDO9FD43zzktVHYTN5TbMGgDIXvx3cj4JeA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwj1gwFcpAluhckqrKoj1v9BSOf2KqpC1eC6lOqfswaBPWhrJa
	gQ4L1GjGf8XjEWr6+Qe8xqjKtCc+qbu0kgdma87dUEtC62R+b2NnxooP
X-Gm-Gg: AYBFou17l9kNyqDy8GgcH90RV0souscriB54DT7tzlkUKrd2SR6yML10YIAJi8Ti8/B
	vzOObaXm6GZVPaL7IEgDbrVP4moU2Mcj6X7wYXulFeo1ZXjXCHsmifXKpmITSMt7g+ziD2SoeJH
	V2W1i24wS19A5YIW2hbK6mxZsLUrbA6WaVkAeTPbEybILb/Fbmlb/gG3YRkoLVAExTP02p8GJN7
	Hspv7UO5fwfzThqybkFOKUFkKSxliyxZy2BBpA5K5cVs7zjecDtTopvVB4Dx0UArpYsQQZ46P8u
	JFAyrTHOOaXqpMREjWfLfP9faBWlvoXhK/csTnebAyb5mQ5fAn+8RZ8PeMr4pb8YBWdlhGu5ZWp
	nCCsP0HKiZeieWxD/QymOu7Wa0ysqs4av1LBYIZjpnLqiCiVPcPiaXfRloTNluzymeddTbNZLCB
	/Yj3OdbcKP3dBD/mXkjMXQYf/vxKs6upgFhA4q0qfcD3r9X26S1rRcXER3ULVgfiSCA6uFLt9zy
	3JmsvToys96tBBhUOvNlPOoUfjpbTuu13g8dn57PTlBLjunoQ7BdKdKkY+evUjIAld8pXwwYZrZ
	Rn+caE32uz2UzJCL2BPXzbDaE/IBum/u3DNLiyfIowYwT68=
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr30142445e9.9.1793350660432;
        Fri, 30 Oct 2026 01:57:40 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:6ca3:c7d9:c03f:68c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm28215155e9.2.2026.10.30.01.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:57:39 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ASoC: rt721-sdca: handle HID button read errors
Date: Fri, 30 Oct 2026 10:57:32 +0200
Message-ID: <20261030085735.2146047-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rt_sdca_button_detect() returns zero when a regmap read fails,
so RT721 treats the error as a valid no-button result.

Return the original error and skip button reporting when a read
fails. Still report jack changes, and clear button state if the
headset is removed.

Fixes: bbca8e7050e0 ("ASoC: rt-sdw-common: Common functions for Realtek soundwire driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/codecs/rt-sdw-common.c |  5 ++++-
 sound/soc/codecs/rt721-sdca.c    | 13 +++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt-sdw-common.c b/sound/soc/codecs/rt-sdw-common.c
index ad61943ce75ff..e4139e6393b1c 100644
--- a/sound/soc/codecs/rt-sdw-common.c
+++ b/sound/soc/codecs/rt-sdw-common.c
@@ -199,7 +199,7 @@ int rt_sdca_button_detect(struct regmap *map, unsigned int entity_id,
 	ret = regmap_read(map, SDW_SDCA_CTL(SDCA_NUM_HID, entity_id,
 			RT_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -229,6 +229,9 @@ int rt_sdca_button_detect(struct regmap *map, unsigned int entity_id,
 			SDW_SDCA_CTL(SDCA_NUM_HID, entity_id,
 				RT_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 EXPORT_SYMBOL_GPL(rt_sdca_button_detect);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 9f567caecb70a..95c028efec01c 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -248,6 +248,19 @@ static void rt721_sdca_jack_detect_handler(struct work_struct *work)
 					RT721_SDCA_ENT_HID01, RT721_BUF_ADDR_HID1,
 					RT721_SDCA_HID_ID);
 
+	if (btn_type < 0) {
+		if (rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
+			unsigned int mask = SND_JACK_HEADSET;
+
+			if (rt721->jack_type != SND_JACK_HEADSET)
+				mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+			snd_soc_jack_report(rt721->hs_jack, rt721->jack_type, mask);
+		}
+		return;
+	}
+
 	if (rt721->jack_type == 0)
 		btn_type = 0;
 
