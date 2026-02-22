Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024E2046BA
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771763175; cv=none; b=SIgAsUlhsMJjIkaJNeX/EHaja7LvXn8ZJX2+04u24nBzR98v/j86jUdt41mjVsuptuJe3my+gXsfev79lJiKlZxWrhN+KM3oqb44trAsFAvXOb9ceNiMlx08XDFZwgDHG+NVZx9yW4YubNZ7Jf1bTv6mdS6sXgxN3NRvSh3s9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771763175; c=relaxed/simple;
	bh=hGd8RjJcLkhxXpiwAbyrgRWvswqH7r+T9SscVabbvo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=de6Rp+scJnzKn49fj/2P7clF0okuma+zWdXs9AUESRUDCTT53K4IlgyO3EU0FX/2tp/vG1Jp+i9dH2VMs4rdU1x9HDCLnbQVSzHOp25vgiFhsNBa/RPIdTvPZz2ESUSTGPGJbYzi0MF5/p18/+qKQTsQ4hhPua5R5j2ml52f2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jd+FjGYb; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd+FjGYb"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6e266a3572so1148411a12.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 04:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771763174; x=1772367974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jab/06e1zia4iBapr6aB3V9FEmhexkRh2fXXZsF5Egw=;
        b=jd+FjGYbQ1AD9plbwpprA2n+b0JtvWMFuFh38PhvupZasAm8lf0enhLdJqMM9wPXUH
         P2dXPR3Epoca4E6L3IxPSdpM72rZuu/Uy6AxDRfFSclxkTnG33udJ4jcKWJoynoSkTg7
         Ye4Vvu0MC2ZLM5j+2Kv1ZupioZjgfIhWj9Tg636r3s0BFDl2z9ZdAO8/YfQhLFRlMHES
         b8/qCyEcVfRgHEh/FLd+bXXKaPdu0kKu754z0bcokUovEgEHQ6+doHRjJ5UovwJSI8du
         g4ECuhaK35TEG1iurhdhKgMfxGaGmtePLF6w8xrP2cyLbbFfcPpPMc6ton2w6Kv4MiHl
         mdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771763174; x=1772367974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jab/06e1zia4iBapr6aB3V9FEmhexkRh2fXXZsF5Egw=;
        b=cJVMSjfZW35K82rABaMy24G6a4Je/3obLOMKetGwvTF1/iRMFGH/9p2DH2h4CJRiMN
         0MeNIFTAKM23x0FG4ReLDjxylEB2zQTFa96Q75gyt2u0yJECRhAp/PpPb2rpGIbhuGWO
         kOpIKOlWa/DinK2IjlTLOs44bpkWbefd6XN+e64aVU/CjUFiMsFjSZoh2aaHEeW1IlqR
         CA/F+FaseeSCAR7kJwTRqysqBaSwWtNiG+EpIQnGh1SlwC7MKnYceX/zyKAFyjDdHT8F
         QrjBpo0/8VWwxGLh20JIxziQBcs/hXtRYXm/k4QoQ8j2ywRgFmT2kjE50xJAWqENbQ0i
         Vwog==
X-Gm-Message-State: AOJu0YxwZ7anFWRIFGrFut4pomK5B0T1ftvP0khN1QgpbmtskQ+gmd4h
	IiZacoInQ3Yh60xffkKSO9JBNEEfPinOeIrQh1yVbi4cp07CDqhfsG+5ccsvIvwd82E=
X-Gm-Gg: AZuq6aJCUMjWst+iBTwmTpJEH7Hpm2i1U17VyyNDEnjZqohM/J8KqwEMx78kZOI0g/K
	zNtrFi4jrsro9h5ACTEdhhZFLvrz71k88VEwI7BKytlZVz0kSJZZtYNod5yl1LZyokIEqyRx1NC
	uODGHjBV7BRrazCyhFwshxNCthilfMH3im6432pPbo7DeZpHEhmYhz/C/xP04FVzrGpaw50aj6+
	AljZPYY4w2DgDBWVIJyz/zfj9+UUBr12WciU6P3A0+0molo3O/s1FJ8+6cS8n33Z8B1+E+geyYW
	75wg8nVBIp3cs3FG+Ww27yJMdJ8T/asIxoLKbUZsTWjzYfhiCiHbrmwqJBwcJX1Skkln3f/iU1Q
	3N6AEhFu/sL/0aXIO8iwyF1iwWxBD0cK9px8W87s/6rIyVTaYt6L8/YDsJ562AfzgVrBbgSjvcd
	cRxNqkTicmZDhBdkpLoCYzbjxMaw3J8r71PjbKhKAW2Gxk6PqrGOYVM44g
X-Received: by 2002:a05:6a20:3943:b0:394:f6b5:3998 with SMTP id adf61e73a8af0-39545f495dbmr4944705637.45.1771763173717;
        Sun, 22 Feb 2026 04:26:13 -0800 (PST)
Received: from arter97-x1 ([58.124.177.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7180613sm4408021a12.3.2026.02.22.04.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 04:26:13 -0800 (PST)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Juhyung Park <qkrwngud825@gmail.com>
Subject: [PATCH 1/2] ALSA: hda/realtek: fix model name typo for Samsung Galaxy Book Flex (NT950QCG-X716)
Date: Sun, 22 Feb 2026 21:26:08 +0900
Message-ID: <20260222122609.281191-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no product named "Samsung Galaxy Flex Book".
Use the correct "Samsung Galaxy Book Flex" name.

Link: https://www.samsung.com/sec/support/model/NT950QCG-X716
Link: https://www.samsung.com/us/computing/galaxy-books/galaxy-book-flex/galaxy-book-flex-15-6-qled-512gb-storage-s-pen-included-np950qcg-k01us
Cc: <stable@vger.kernel.org>
Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 36053042ca77..421a84b9fb44 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7311,7 +7311,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
-	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Book Flex (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc1a3, "Samsung Galaxy Book Pro (NP935XDB-KC1SE)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc1a4, "Samsung Galaxy Book Pro 360 (NT935QBD)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.53.0

