Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2A400DEF
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005164; cv=none; b=QABbm8nCpYxk+iAwwHYjJJndB4pc8/dmggEbCF3lrrcsGIET4bJ2pyNrRVA0KIEGuKOHmn3RpPEzCrpgNT79gySJ6m6+Ehp6M8mDBJ076OB8Nno6KhN3tFa5NqYyoEHViRbJHTjt0yYh42H3vKvvQyK1NzecFMa550ZAeCgwuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005164; c=relaxed/simple;
	bh=KLBeFBd8zRYhdnRHp7jNIs9piYCuaRzWB6QekH1GJ9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5M4Gnu4PuJm9SjtYVO5ZOBv/9p3bXq/jV7D154PM/gblkWtRq4+FwB4KPVBd3naaiC7Vzz0EM6T+3gvNvUqpEaDNvZhgRWhkS/G2DgnKNEqQYu/+1mVBD6EYWe6DWqMjUe0s5tpLdwkl+BdRg65nogWg6xsBuoqr7Vxn/7qziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osmFXvay; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osmFXvay"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf237e1433so60493485ad.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005163; x=1781609963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E47jwlvDyMcrvrKHDjZ9gREZbPczY+LcNlcn/JdbBhI=;
        b=osmFXvayH0xWIaeQOzBVnU1TOqhOYUrrizKNqnaaSdJ1MtgVdkPg1wnq7X3OAn+sWM
         EuKw/WR87sbLH7miyucJMBuHRT45EWO5WJWiuKC2zQNCB42thvU+JM8n0LDyMlAtE9hV
         WMTeqURnlTw9yvHhVSUOUmh6A7gBQPSWjhogEJc5kxVkVWEt14tosEYbZZMCRSMwhuQW
         ZkZG7ynYnOEUUT6wHjkmFSJAIp0T/oIOx9yvln/tSaCn1lqmYjk5ITa2ja2nJyOTi7FO
         bmiey9INihUfnAQzVdqEkqsFbAOF90mM9vyfBcm6LtIT15mqnAoq8eTMZR69DZ8oJdZP
         eA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005163; x=1781609963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E47jwlvDyMcrvrKHDjZ9gREZbPczY+LcNlcn/JdbBhI=;
        b=sUNVQtatpnGBaIanHeZnhcyDzedWZwLca1IgX6qkDY9isFAdcrwqvt/kT1envMO0QN
         2r4murKGpHl2UJrogHlKHNgpecJK12dzCsf7uHv3yaUHdlVtfA/GwgyeO4X9twW1RFgC
         WbaDFsbfKMmsNaFqbmZ8oSu3i77dLqMWtEpTPnLPvGh7z3W2ab/ECSi01zuaUBMH92O6
         jAxtN6Ti/g0X0m/UyFzr+bgEyUybgak9qOz2WikaTHsb91+h31ulhWM1XxJfhVFncQfP
         n5x0uCJ4sxOMxXPKsTxFc1cb77bmJ4absbt+bA45aWPlPo4XNE6DukgC8eryMiHNTUF5
         W1Qw==
X-Forwarded-Encrypted: i=1; AFNElJ+oySP+nlhUXDE+XSQbr+dW6PG7k3n2ia+N9EojCh+woz2S0qIDIEO/HYg6Va3G9eHcvmHqineRvWzewA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9+ZD/7LJfGiNm9VEUBcYC/q28MaqVZK6UW4PKzOywSc9g/A2
	MNHjdi9VYO7a6k/GVllwedO/R7AOfYY9+l9wEyyl07H30Hrr0nypDAy6
X-Gm-Gg: Acq92OEZgTj/GKMZf1gBNpc+5Nb60uDQ8SnFja6PAPO1g1uu3vNAGCVAh1OcGDgiyBD
	VmFYjET8szdw5zZzYILEXv3jx1KNRHXMFcqPpojYImfIwQMq6agtnnhrW1nujp9j+rOGmGL/SyM
	xNyUalK7uOEG/ZgElioOQVmrnUftafHmt/eAojWoAFuPntxgdovayO3Eruc0PXd6EKVQSKRukQW
	vaducvC3d7WqGTXK9SoDrHOTW7ateFxaCfqTFkUJtRaZRhFAVTxoo5lGV7hsM3FTsth3rZ0KD6R
	qe0ztbtQnzSGzOUNR9zwJdcU3oU6PJoqeEeCSH190EPzVDiEdi8uQ3v/Vraj1hc6PPz72DBlHHn
	0wN94bmWrG8K/nAIrBtmvvMM747mFwSeloq6mIX4dtqm5nfIYSiQIuU2rXw4ZB7hnEqC/frVDL4
	nMkkgzs//ZAbwwjg+Fd8KXHtsqgBdJ21Y3c0WeC/1z93YerbOeUXw0xP9zZkE4mE+wJlAC
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr241805645ad.31.1781005162565;
        Tue, 09 Jun 2026 04:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:22 -0700 (PDT)
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
Subject: [PATCH v6 05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Tue,  9 Jun 2026 18:38:30 +0700
Message-ID: <20260609113836.45079-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
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

