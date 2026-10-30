Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379868;
	b=GFqSL25QpiuoK/m7L+w2/jqAIQhtTxMyDHrkCwzvVoZFleOk3svKuFVKTeWPWS9o39qB
	 gpMntQ/1PGNAuaVR1araBmCi8XUxP8+T6goVtThu8vIvVFV1C9r5U7oMmKK1CH7MTr81O
	 Kvnjp+TXJkkLEWN38KnOrfVYTcq2SPzoSQ91JlfVTVDDE+RcstRHNgqumIgVrp7qYxAci
	 Jk22s+G8c5sXohx3XniRhBndXzJYe/ofc+qJI+O7Z5ShSWjn/mdq5wqvqMgclFD5alRpp
	 5RaSeJiGQtCxh3HHpKCqFVnmbYiEXviAgcPn8bvixevxgnW2XUpqIRAtpWSL1GfDxzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lvTI4kYswy8nJRdl9QxlU0eMLqhgVMDUC7UVIheEm08=;
	b=hd+2x/TXCRRpr/GryuE38WKV2tmIExS3zSulPkjd72m5Qtpd0IUt1AokLx74EFMcOcMG
	 z7MceY7A/3HaTO5yOrThTF9uq/2vj0R9yhyRQhwP5Su6EHdY14bdSBqE1cH7XzXUuWVBu
	 A5+QydOXsjtKvgh7zSFAMiivYlMs97dXRjN2bEFgKAV1kTqf1k7W+7qpddpNX69ZEEIfK
	 9o99OyIEqjYcgg69eGQHLSCSGZkiaWtSJwi6ix0LXWzFfAZCcyVffZ1na8vat8aAWsI/U
	 8/xwXy4gNp5dd+1BwLD+/1NeAbx49KKIC3RqkPV2aUg527Yzi338ndu3TFRzrrZimEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qAh5QXhW;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69D606A324
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A69D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qAh5QXhW
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so9950485e9.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379866; x=1793984666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvTI4kYswy8nJRdl9QxlU0eMLqhgVMDUC7UVIheEm08=;
        b=qAh5QXhWpUpVvZMP7HgQmJRPhLlItfGnffF+wryoIEIuocg0Z3gTKtBHdosKEChlxf
         ovHownzIogEm7xNYDI9iJm2f+NYYU1Tx1r/ioHcJxav7mUfXGZPJ0FtMVQxRs9FL9UPQ
         94KTHoT0AoFujNpX6kbCJRQ+LSr5OKQcpEddxTHhwZ3HgLsakt00sIJoDrlEF237XCMq
         +v4m1YZYq5Uw9S7epp/OnOLBuPrClv3Ldw7FIyk6rJ4Fu+2R1UpAA87jNdYMbxEF2kZJ
         vmFWyP0c1Xy7xcrVnk/FIJjG2iFnCjmGjGu/Or93vFfwZj5BkW0JQ83VO9sLO2bMsxpJ
         1emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379866; x=1793984666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvTI4kYswy8nJRdl9QxlU0eMLqhgVMDUC7UVIheEm08=;
        b=wbwsjVas48Tdj1unbTrxGnI8qW8ufcrNpmrlW8OVfpjy+5ivq4monXv/R2H9sI0m9K
         V9vb4AmpCdmXMJLQhrma+fJeFGeMJrxfi8+wRuuEB4JnxDIecLz3moprR46HzcplkKLw
         R6pJXqPAZl92oP+fCZk7KhXPKMo5gweK+0xnZBB0EVFu02c37BXloD++tH7K+HLvhuIK
         96OaQx4duUYL7npYliq49zilCYVR4cEaqONbXerF/JwllMohQEvf0gh7Kte5p2XhyAwl
         9rTQdDgw9ySfmEPvjnx5T9zRdQa8XFZoY3o/zqscVJG6xoMaVVubSuC1ZsMghQXEZQ01
         Xywg==
X-Forwarded-Encrypted: i=1; AKwUvBxD0kFk8DmuRZjf+IbFu5sGPGD/ajplt3eAYM2xpi/OyLZLWw1zN++vOyz6Wkh4r0clcZikKHkHWair4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ89deamadfKTwm84bfMyPf82Yr8blkCtrPjIbAZfaRFCNgmfK/
	FCXkyY65J1rBShY2bXWkwKWakhslvmnLQHCZr1AoSY3zVtairCmpA34=
X-Gm-Gg: AYBFou11QImhvxoGuArHhN81jsULoxa63eLPU2YlowdtNcDmdtCQzwRBL28yEGBn5rD
	++i0lx90dbhzZRSbZYcXJq6iDvdDziPYygCOJZLbsweKhCIST7869xBDSMhrJ6JU/zJQh8dZ2iX
	iOY3MZmUqxmiljc0pdlZhL13yfjDMroLdrd6KBEBLKrBuWSMTJ8S5qFvf39FxQdgwqvnbisV8rE
	l2v3h/KHlMhZKL6EqUSyVfW4mqd1tuMj9RpBiWZUcmTfVYMjWiAoxksZfI1QmrbW/mCmXb0qcSm
	lw1qjz+KsdoxrmP7hjQvCH1tDKDmNUC/hQtILPFDFjN1VHjam4ww0Dpi6VucHug4dQ9iqMTNvpv
	65wh77ltZRNEQiE9Rf69Y5ftWRGugJCkYfrir4qm1tzy5xKGbiu7FiVuEDAq20k+XFpCYAjBDhG
	j+U/j3d5xG5q4FqBY5PFFFOn/OAyXmPmi9mYDkmZtujjfdlO+P5P/qbA4xJJIdcifzzOiKPX3f8
	GCGYrD91bygylStIzKMn0A+eIWClvBafe3tUxh8sv/kE8n8RKQtBWE1mSCxoCy0NXKLMZ9+IVq4
	a+dJGRPMDZxr
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr63464125e9.31.1793379865897;
        Fri, 30 Oct 2026 10:04:25 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm75121785e9.13.2026.10.30.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:24 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4 3/4] ASoC: twl6040: cancel headset jack work on component removal
Date: Fri, 30 Oct 2026 17:04:15 +0000
Message-ID: <20261030170416.3561618-4-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030170416.3561618-1-tristan@talencesecurity.com>
References: <20261030170416.3561618-1-tristan@talencesecurity.com>
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

The twl6040 codec driver initializes a delayed work for headset jack
detection (hs_jack.work) but the component remove callback only frees
the plug IRQ without cancelling the pending work.

Free the IRQ first so that the threaded handler cannot schedule new
work, then cancel any residual queued work synchronously.  This
ordering prevents the race where the handler fires between a cancel
and the free_irq, re-arming the work after it was drained.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..826bde1a9ba46 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.47.3

