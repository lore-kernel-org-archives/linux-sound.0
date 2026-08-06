Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6832DF13B
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024832; cv=none; b=F98CwbJIC+37Kd2MknxTcotU7FTWDJetagq5VJy8dTx+xthiuEomjxOWXZ3+cd9qAh72t/RsGsgnrXhoBq+pEIsXCb+UI1Fu8YRWxSU4JvEeMoY4GS1WadEtcl4GxsZe7m4/YK9j6t+wvhERs8IgnRPjNlG+LXBQUQzwyCBjvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024832; c=relaxed/simple;
	bh=DcvEPe6XuVjqPUdMdjswlMMXNHRP2pJt2EAc24Ztm6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jimMTQQ1bZB8lJO5tAm+ECPkGoTIIP36rdU5h7IVXEuTojmbhDBGp6Cd5GktSSdDdmZmgmQa8CA/X1IIEvr+6dnGfTHD2C4EzFmTYMbpfZSliBkxXBudz+X+cGUH/MveJ/EAEcPwL2n0qJDlmdDgfmGfcyl3fceY058xnIN/N/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HKW1lhC8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cYKjUXYv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zs6+b/BJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ONVochdJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HKW1lhC8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cYKjUXYv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zs6+b/BJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ONVochdJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBEF5800B7;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXQM6kBGKZu5xQpA6hsLxEf2r3cScBc3tqENYu+ntiw=;
	b=HKW1lhC8KR8/ISEttfksAXLKjg2omh5KMVPT892aoTBsRcXoibRmfnN7aLeXMWZD3Mv4L1
	0m1MXxc05EKP2iqwiYXMB3QMJkhU2hPuygpUUvGSTOWd5qw6nIQPjnbtOyIMqM/MCGYlIC
	QGdNhFYW0UgU7j3OuMdfOhuTMCIHfo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXQM6kBGKZu5xQpA6hsLxEf2r3cScBc3tqENYu+ntiw=;
	b=cYKjUXYvQO9oK2n2ZyoDLX6PLs1m3Sn1rG0GDF9pZE92P4YMjBYkl+mBCwbctCmLhsi59s
	gyc8alb2B+EeBpDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXQM6kBGKZu5xQpA6hsLxEf2r3cScBc3tqENYu+ntiw=;
	b=zs6+b/BJEWncQHmaw+hJpGa+08HMyqw7c+lR8kqiojO87cDN/skt0QfD78TsHBQ3PmJRhl
	01uYiLxVM7x1nOq3EyPpnYGZLdWgb87b4NYmkHDDi4wMag4rpJi2YQdj1Dqp5U3Hg1MY+H
	NAUnY/HE7U6bwseF+lctTR/FyJeLSm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXQM6kBGKZu5xQpA6hsLxEf2r3cScBc3tqENYu+ntiw=;
	b=ONVochdJAMwOZB9DJVG5Iv+i1SW+B9WMK7Cjhfeo5qyAyL7N7yxLeLwPpLDP9r0DJP47Dr
	c/Kx25oJEIJHMqBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93265779F5;
	Thu,  6 Aug 2026 14:00:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gL5sImyTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v2 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:45 +0200
Message-ID: <20260806140006.1412298-14-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,realtek.com:email,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix warnings about mixture with goto

 sound/soc/codecs/rt1320-sdw.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 3a5eebcfefdd..8d2d6697a502 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1786,7 +1786,7 @@ static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
 static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 {
 	struct sdw_slave *slave = rt1320->sdw_slave;
-	const struct firmware *patch;
+	const struct firmware *patch __free(firmware) = NULL;
 	const char *filename;
 	unsigned int addr, val, min_addr, max_addr;
 	const unsigned char *ptr;
@@ -1840,17 +1840,15 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 
 				if (addr > max_addr || addr < min_addr) {
 					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
-					goto _exit_;
+					return;
 				}
 				if (val > 0xff) {
 					dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
-					goto _exit_;
+					return;
 				}
 				regmap_write(rt1320->regmap, addr, val);
 			}
 		}
-_exit_:
-		release_firmware(patch);
 	}
 }
 
@@ -1924,7 +1922,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	struct device *dev = &rt1320->sdw_slave->dev;
 	static const char func_tag[] = "FUNC";
 	static const char xu_tag[] = "XU";
-	const struct firmware *rae_fw = NULL;
+	const struct firmware *rae_fw __free(firmware) = NULL;
 	unsigned int fw_offset;
 	unsigned char *fw_data;
 	unsigned char *param_data;
@@ -1977,7 +1975,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			}
 			if (!retry && !(value & 0x40)) {
 				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
-				release_firmware(rae_fw);
 				return -ETIMEDOUT;
 			}
 			break;
@@ -1998,7 +1995,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			}
 			if (!retry && !(value & 0x40)) {
 				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
-				release_firmware(rae_fw);
 				return -ETIMEDOUT;
 			}
 			break;
@@ -2057,7 +2053,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 		}
 
 		regcache_cache_bypass(rt1320->regmap, false);
-		release_firmware(rae_fw);
 
 	} else {
 		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
@@ -2124,7 +2119,7 @@ struct rt1320_dspfwheader {
 	struct rt1320_dspfwheader *fwheader;
 	struct rt1320_imageinfo *ptr_img;
 	struct sdw_bpt_section sec[10];
-	const struct firmware *fw = NULL;
+	const struct firmware *fw __free(firmware) = NULL;
 	unsigned char *fw_data;
 	bool dev_fw_match = false;
 	static const char hdr_sig[] = "AFX";
@@ -2178,7 +2173,6 @@ struct rt1320_dspfwheader {
 
 		if (fwheader->sync != 0x0a1c5679) {
 			dev_err(dev, "%s: FW sync error\n", __func__);
-			release_firmware(fw);
 			goto _exit_;
 		}
 
@@ -2256,7 +2250,6 @@ struct rt1320_dspfwheader {
 		}
 
 		regcache_cache_bypass(rt1320->regmap, false);
-		release_firmware(fw);
 
 		if (!dev_fw_match) {
 			dev_err(dev, "%s: FW file doesn't match to device\n", __func__);
-- 
2.55.0

