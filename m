Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BED387346
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422966; cv=none; b=FNFi+ApCA47a48yH7UpsAlMrlltAneVnkn92UXQrpPmYMCSHFs0ubbNN95eld9DYU6U8KwpTwnJx7moFBL1dOb9SPqqXSXWQA0SzKBoCZW+NPDw/8XPwfvVof3eoJrWS78fsaswf6CTm87MoS1kWQs8xxW5wQMpd/oDfM9Dy9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422966; c=relaxed/simple;
	bh=YiK1eWX866TSv4gaGiNIvRiRX5TKqQl3pl25bGYgdZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gY/FC5CEwf5GDJ5Zpy+r+Sdkccb5eobdTQSeu/Yb+GeTG+J6faA3YUeIWrF6EYXGfVQ79ufuX6jUGAjAzVuTneD+d25q9UgETKsNzALUHXEPGRCgyWUAota9RpdZFIsS340B1ZP20lf86LD5iWtOkBbvzWW7D0Lt9YDHG8h7Qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+rv9PwN; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+rv9PwN"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bed4cc46252so400054366b.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422964; x=1781027764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7tBctgKen/jX1oVtuZ4foMz/oy/+npcY+u3r9+X8Ng=;
        b=d+rv9PwNHpARbVA99qZZJmNw47h1yV5p2QLQSxCiWrYefXx+wBD3jHqIQUyf2kUGFQ
         ABinU4OdqcmdxI0Ap7Ka/w2ShexHiDGrOWpmpsUc6byhKvNLK24xAmzjLRLSTUasIs6o
         GlqAJxipE+Ujaydbrcf+f9VptqL2yUkez9YCzi7KCSc6yQXfv5EOwbMTqrLfw9HfrkWZ
         i4Ryku5D15GoxqQpZlGkf2aqaAw+PAKgIBsYpr9v0Qd8yjNmJEahowzO0FnT/AY7/BGB
         BdIYc4XF8B7GW+zRkrvH5496/UbFIaHwGA5LbR+d4aVB23tuy9gRrm3GD3hKPqqjMRpJ
         PD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422964; x=1781027764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7tBctgKen/jX1oVtuZ4foMz/oy/+npcY+u3r9+X8Ng=;
        b=b0YvStwPs0JayPrjG1dbySdrdI1MizqRy13gHEA8eGLGwp4kENH4+JU94g+pIVFzfp
         C/idnkqRNjli78+Mniyk659Bzx1x5nJ1J53N3QOv17OxV//xwhv6XLpbHf3ILPFtZjzi
         k3kNuGgRHF/GTor1PdBtf5STw6HjaT7LJpv0V9wiZMkbNE5lF5zGr4oaT6Sd4eQf7SoJ
         OPZXW9ODcfCcxTavx8FRAEw0URnJIzhK3+T+o76W0CXHb1Efikb7+ojItKeC/O/gQ8YB
         sISuTihxqYfw1X2NbnYfeONRDrIGbEOyWOdu1pHzHCdlpos/NPQEIpY6d/DmpZVN/kyq
         aKPA==
X-Forwarded-Encrypted: i=1; AFNElJ+NIYHPD3Hlu3vaG3z1w4vfL/vhL+ij6Yjg2Ei9tFaBvi4eyXC5fEW3iB42sL8b1GgYNIpud2q4xsu1dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2XHwM8Gi3fA6s9JsHu6VWSnomizs80AfkpLmy8vcUSTXm2fq
	Bre3UZkgTkvhhEcjlDdi52eoj0n6m3DHJLTU62t3riFIDI0Y27q/oYHw
X-Gm-Gg: Acq92OHgZ4wg0JVdWfhZzNySFl5hrgwfAfaXYXFnEszgibE2qa1jB6w29ssPa/clzWg
	R1+jLh+iO0cx7tDcQtBj6aOL9uGT67f7ZhMB1SutPlyKW63nnhfNFFgueP4GOoeHCVxIpTC9wVC
	Lxa4vpnqMFH01EnR3q4PH7RzPRQAQWnABnbmvRMM/HFtehTtW7G9g18oPwCbb9iJlRPSW9do1LK
	lCi7QV6ehB01avAyKX0iX0frk3aEI2YY023IPNXbGYunWYCWMVsdEEwO220PBRqieLB6IRiXbyR
	6zshj3OYkAuDoq9HZUEvn8l+XUkbqR/vYeD3HMYhD888zX1UwXqR9MNvkRYUb21bBpZzOffcsIr
	yHbObc4MWQI9BAyw3IzptCtuPMzz6WLEcwj4ExG2iR1owNIx/K1VHtZ9cj8pzNfqSsC+A5nX2Ik
	J8Pf/5ahptpwY1DGyhJzMa89QY9cy7ePJYaXKedvcJbQL37acr8RhbEGyWWgCfKbxbZrAaxdSj0
	y8PhGfQH/KnZl8WOs4vttYMxBtdz5HDVU7c2BafKQucnMPVnQ==
X-Received: by 2002:a17:907:9286:b0:bd6:4d8c:bbff with SMTP id a640c23a62f3a-bf0605e3329mr37094266b.22.1780422963616;
        Tue, 02 Jun 2026 10:56:03 -0700 (PDT)
Received: from fedora (89-67-127-240.dynamic.play.pl. [89.67.127.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm22167766b.38.2026.06.02.10.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:56:03 -0700 (PDT)
From: Bartosz Juraszewski <bjuraszewski@gmail.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Juraszewski <bjuraszewski@gmail.com>
Subject: [PATCH] ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519
Date: Tue,  2 Jun 2026 19:53:59 +0200
Message-ID: <20260602175359.22439-1-bjuraszewski@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In linux-firmware commit from 2026-05-19 `2f90f4fe5c67f51a8410907a...`
`ASoC: tas2783: Add Firmware files for tas2783A projects` by Baojun Xu
138 new firmware files for tas2783 were added, none of which are loaded
by the kernel. Kernel expects files to be named with the following
convention: "%04X-%1X-%1X.bin". However the added firmware files follow
"-0x%1X.bin" naming instead with `0x` hex prefix, which fails to load
resulting in following dmesg log:

  slave-tas2783 sdw:0:1:0102:0000:01:8: Direct firmware load for 1714-1-8.bin failed with error -2
  slave-tas2783 sdw:0:1:0102:0000:01:8: Failed to read fw binary 1714-1-8.bin
  slave-tas2783 sdw:0:1:0102:0000:01:b: Direct firmware load for 1714-1-B.bin failed with error -2
  slave-tas2783 sdw:0:1:0102:0000:01:b: Failed to read fw binary 1714-1-B.bin
  slave-tas2783 sdw:0:1:0102:0000:01:8: error playback without fw download
  slave-tas2783 sdw:0:1:0102:0000:01:8: ASoC error (-22): at snd_soc_dai_hw_params() on tas2783-codec

This same commit removes all 22 symlinks from WHENCE, that used naming
without the '0x' prefix to only 6 prevoiusly existing .bin files.

This patch adds `0x` prefix explicitly to the generated firmware name
allowing file to successfully load. This results in functioning audio on
my device - ASUS ProArt PX13 HN7306EAC, which uses 1714-1-0x8.bin and
1714-1-0xB.bin firmware files.

Tested on top of 7.1.0-rc6, but no changes exist in newest linux-next.

Signed-off-by: Bartosz Juraszewski <bjuraszewski@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 90008d2d06e2..58074d18f78a 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1120,7 +1120,7 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 	for (; dev; dev = dev->parent) {
 		if (dev->bus == &pci_bus_type) {
 			pci = to_pci_dev(dev);
-			scnprintf(name, size, "%04X-%1X-%1X.bin",
+			scnprintf(name, size, "%04X-%1X-0x%1X.bin",
 				  pci->subsystem_device, bus->link_id, unique_id);
 			pci_found = true;
 			break;
-- 
2.54.0

