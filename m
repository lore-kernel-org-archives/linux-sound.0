Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E83F164D
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621740; cv=none; b=oaeoyrJyH60nMUNG4mBVitETW3qvnfMvCTOF3Gz04F2CZ0+sAxsbMyed0Gs+Wx/l1tdecE65jf6Q7LeSviWdQEzyFnFoXGNOn+LltLR36dosJhGXWyoRt3QPRdR0YJYofHj4brv1BjVKKt5y94/cuvGgLS2LJ7ZyBe1xOw7tZ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621740; c=relaxed/simple;
	bh=itCE97GetdjhJ1mCFZ8r6FCd3SfvCLfAVih8FSZBw94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+HPr75UNyRKTDmlrRFcoXyIMaC2mX0Chahju7pdTlSa//a7XYjS0OtavRqt/h204e/N60fd63ACe1Lwrq073gpBR8uz3i8cVs1PK2vprQF5Yt5pi7jRo9BmKlR4Zdyj6cj5tT0CUYnpOzyxopykkibk23oPB5tPhwZVu8yDyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sISg4eQI; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sISg4eQI"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c742723c863so1354861a12.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621737; x=1775226537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUSU1xSC29TgfkGjkqsyqB9Aeajan9NX1aSuNMNNxok=;
        b=sISg4eQIZxvdsxRv8e4V/1ROJ6EHij691xGx7tD3pNKWovPfI+EJGve+CzrTka9aRo
         Qtbydh10fpkK20aQEUHYKTaok8xmt6ZbX34qYEPToLYQw07SZD0XmVjts4AwlBLeQkFy
         qvF3/FrDEhSqlbuXk4zSiI1VMF5BNTWrj54fwjVw2TL1/Lw9azFKVktexJSi7XcIRjY8
         am+fj2Ono7Y0/BOgtky+HT2BHmsdDKKMB3ykNc1FuI54Y5TIJU6c04YK1jSAyIGCbRYQ
         8HwPbjbEfZDEazjQY7/TmjPDSNliYVyKUHv95XBDsv5bH96AfjbJdDyJlPiTxsAsRlTl
         63Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621737; x=1775226537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUSU1xSC29TgfkGjkqsyqB9Aeajan9NX1aSuNMNNxok=;
        b=M6tV3VF0x0dMfusca9Eew5wlShLqenGT6oM3oiCEyKa9mCRP9uUCyS32d8jzO+I2vG
         Q3ltwfZMsDuSdBWJ2S6DNzKWWLcehVhVdBF+bfhqHPFpgImD+8sS48uzHbojkcxp7O69
         VrCYWGw6b9aZN92DOPFr3LzCCBeFvqsdjPfzqazlaB27lxmHOZjqShhGbVOCWLj4233M
         yAp012iX1q9fs5vvVEPCQDP8mz6XBOQBZc5ThlSkxr0ddVRdLiNE7OxdAm/kfQxyFClL
         Zttt/937Vg3+ddDcR9fGYxCqZmJ0Ro39F0bhrbJMaKXZBCgMeoIZGXPrF8By3VlSMszY
         hexg==
X-Forwarded-Encrypted: i=1; AJvYcCVaATVy2Vvi3wFDXNC5KAhzsCDOLfmN+dB5Z08IT7L+MF9+H4D9zV/UuH49FgUiQ6jTDu24dDJQN+2wgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LqANtyQvYhrtTjpyLsxnC2Rzb2JBFeQ5vgfyv7FUPoLppsuY
	DNHwkSmhvnpiQXvZ71JydIL3hbR1wXWt5IKzZ8J1MiNtGcnw5oD7oQnA
X-Gm-Gg: ATEYQzzgpjJMASwMSJhlMrIoCAUS32An7kqdfT0k69TylsoGHxUGk5GsyHmoV+7kwXg
	rSqGqP1ndDxT8siwbU6VI0CxtKrsud8HYp6HTI1GI/O77GtOUmjFuNH9cPuzA3JPC/JeAlJ4pwk
	7GlwOF8Ix7zz0cr06VfqH0NhXeVD7b2Ny1wjNto9iB9plnKXubwvo2RBGopMEaKAKsSzHnTcRQH
	OstBy3QvCTyzeokbG9lLdr4i0cbiBPqxkhx/BKcD1yUYN+/2rsk/qtKeNzvIJ9+Ew7huDNmsY26
	rG6zmW2U4t1+M/xEsNtNNtZ5yagRQjrPey4us7ktiLjYdIs0CQLyHbXS6oHGYDl5jqluoh7RYlQ
	43wWLToqvQJAZ6LLqYuOUnYdg1EkvFEA+/5VwB5UDcNKiIK80jd2/Q/USpRb2ZaYDdem9y+JqRB
	EsP5QmiqREe/leyZcnee1F6hUfB3qF5NvjEAWPvDUiXwo1
X-Received: by 2002:a05:6a21:32a5:b0:398:8766:4d0a with SMTP id adf61e73a8af0-39c878aa568mr3193205637.19.1774621737176;
        Fri, 27 Mar 2026 07:28:57 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e2:1a2:687:d90c:7dc8:7860:bbd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28d6sm5557230a12.6.2026.03.27.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:28:56 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: nonameblank007@gmail.com
Cc: greg@kroah.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
Date: Fri, 27 Mar 2026 19:58:05 +0530
Message-ID: <20260327142805.17139-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAJ9UwXAYD2PwdBnt=hFKkbKUTm9kY8zXacAgE6zXDKOLhBKmKQ@mail.gmail.com>
References: <CAJ9UwXAYD2PwdBnt=hFKkbKUTm9kY8zXacAgE6zXDKOLhBKmKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a mute led quirck for HP Victus 15-fb0xxx (103c:8a3d) model

- As it used 0x8(full bright)/0x7f(little dim) for mute led on and other values as 0ff (0x0, 0x4, ...)

- So, use ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT insted for safer approach

Cc: <stable@vger.kernel.org>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ab4b22fcb..7f3e88999 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6954,6 +6954,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

