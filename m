Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778FB340A57
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968713; cv=none; b=WK0nRnxF8tFNIA1uBYKo/rOOFnZgT1qsnz26YUdS5OU7ClVFRX1w6LLGccciRYQN7dY0Evgg3z38QRwEGqqlphJs/+mKTMAmAZrE726dV9Jtk1ahyLfXW6FloXdhyYjxxHl+5/Sf7kUmJx0HQ+oZuWDuHfV7M0X2d8cAmKofCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968713; c=relaxed/simple;
	bh=hoCOcrMSjaAWKeNIF/wdCoUBsEe6mU/OTO9zKbkRgdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dc7ZY3f9A7nEy8G5AAMNEl3rZ3isjkl3DxubY+icmUYhsTrAjB5ydxB1jgXw2jNa1k0OpCH9dR8UOUOT3aRZa0sZyC5Er/W09bDBWPyNl4KaN0jgsFvrViRmM/Fey0KbXfOKrKONtsChva/XXXTR/DBPguc7pMIYhea5+XlbxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Esy6C02X; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Esy6C02X"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso33834225ad.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968710; x=1781573510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++sjJT39ps4CzpziCYW8Pzk1hFHYus8aC6jLUnr2CbM=;
        b=Esy6C02XDUQLLJRx8HU8tSLCGxfpuBZJywUQZsiNuoVVO1bbUU3+TjVJ4TqALXaMGz
         gCcSkzYoTLrir4aB17p9VwwwY3FgBn/7FRNeY9celMTKFVyxXyoXRfrkq97jx6cTcog7
         BzVbf1ukq5XlJMfZ+h+IcINY75Sjg3E4Mk4Kby/ChRaViySIIrKR+8E9fIKvTYsRa02X
         SQW/tQH+FGAbvqMmVBJKNNeqjC9CTBk/28jkDvTp1aQ79POIgsOFMCeSARmHzHVUn3iK
         WL7SrfJRMEXiaa/j98D+3PRK/p/DyKaDRgiRg0BpxMIml6TB1DwkDVQuuatj+iBxOE3t
         ECnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968710; x=1781573510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++sjJT39ps4CzpziCYW8Pzk1hFHYus8aC6jLUnr2CbM=;
        b=ovjTtS93EyHbBuZ18Y5W6nOo8NmYhx8hLmV+gwVGB1ZE2QHKRVuavQ9CRmbl11IH2v
         omywRoTA9LZ7k5Zv30v1jiBqs0w0sXDNZ8z7clME59rWwUtKPkUtXxFBS28biwysPznE
         mewWayB8Vy21HPXxTvVQ3lad6h67/nwoPXtufPc/yHLjX0REWu5M1PaXy65JIPEx/3Ji
         woDg731oESfzRZkDISd3vY8g5fmyoUy8j9Tt2p9RYlCXd6a3luUiJvWjBo58leBMjgR0
         wkj3DLG2673tKr/un2xPHoJwkrHJ+fv6WH2TOFXrwhvyD+P3CHf/jetGO6HsbvYtRNj0
         7ZaA==
X-Forwarded-Encrypted: i=1; AFNElJ8w098igFI2NwpkEaV9/KLI6iFGOvKcqEeuwWvVDDUawVeyK2pP8n3j4Gx2oMI4noC+JGUUKfndZaIyaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuW3cE2svFpkmRh+SFfz8GXNHjPxAdrn9tIpnAAoMLWAx9gIdU
	TAxNUJ5vCYxdTYwJYATx/avyvXnA/7Ns8U1Rl+FJmSzDwrP7oGy5Og6v
X-Gm-Gg: Acq92OH/+7zDU2iiHEZLxUe3S30bsUmm+XXQtWH5GHqa/9PHrKbg/ajXhVakJ0tDRmy
	54a5hbvB4jqPbSHJQHwJlntjGKrC6XtKrxiS8uzcJshrV6LlPNdEBnEbUwMamf+t/lLydQkMmZW
	5P7frQhRTZmx6ce6Wj6dSxkXL+5RKw722QVd9gZYrGDliWyVVJnhzUJzrCv2WqeePfrJBsukH+S
	dFVOEI82ivVIYh1CvRVftg/WZSN+EMSri4nbwvc2b25pECDwocyqXp1wMHsOKKPNbA89mEq52YV
	qyNZuGZ5k2piP/B7VkkdANdK0jNIi/Z5fnxr36sCOGpw0hJtN/4Wgn+3APckXV2j78LOyGp64Q+
	givr/nrJIZ4XBk0J9iYYRgzqaZDLRGk924uDAeeL0o/mdgopnDh4E3NWPs9vRiLM4qUORYvB8l4
	WO61V9Ch8x/viaI92Kev1NuSWesL0nChyn0CvwcYd8BCWb3lwrn0psiyjd1uBxkLyXCWFP
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id d9443c01a7336-2c1e7e527bdmr204388505ad.14.1780968709665;
        Mon, 08 Jun 2026 18:31:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Tue,  9 Jun 2026 08:31:01 +0700
Message-ID: <20260609013107.5995-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - use fsi_stream_is_working instead of running_streams.

 sound/soc/renesas/fsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0bd0e0c8c5a3..3e3c6fd7c56b 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -470,6 +470,10 @@ static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 
 static void fsi_count_fifo_err(struct fsi_priv *fsi)
 {
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	u32 ostatus = fsi_reg_read(fsi, DOFF_ST);
 	u32 istatus = fsi_reg_read(fsi, DIFF_ST);
 
@@ -681,6 +685,10 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
 	u32 data = 0;
 	struct fsi_master *master = fsi_get_master(fsi);
 
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
 
-- 
2.43.0

