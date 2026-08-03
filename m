Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7553C3456;
	Mon,  3 Aug 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748328; cv=none; b=OcsroY91AW7sIGbA8u7q7yIV4RjgjxvWorw/LuZOjbFHXjLu5HpWOBNdrMeevQYpPALficOXEjkpNmi0CHi4GbKOSHGS9eWPT2VOcOaBAZXloauoV9g2HwAZtwqGRQZmGJaEe/cSveTOBYt5WyllDGeY7r9bw+Mysm64EqDBABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748328; c=relaxed/simple;
	bh=SVkbu7qM6kKj/UWHdgi6I8dzioBVfrW+gk79ez/eOss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tt02oBTIhR0/bG+sEhDLhi0Kz+zexDXm4WLSDeU5jacwdZnljlDJwbKoQTTTJURRKnziWl+RiOIwBDv9fo37RBWTHdrz7cftwRHc3int6VN7NCOp72KiPypPK6n/HkkppEOPWgl+trh36gcLQliGm/SnpGeBSYPnYe6RoGYgXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=qBEAb4av; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="qBEAb4av"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8805928055C;
	Mon,  3 Aug 2026 11:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748323; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rs3tZiKwPXYQXNFkx0QNF8YVFkoxB05/FlZzQu3+H50=;
	b=qBEAb4av4s5atfUBoHvIN1WholYMV5p0cvCCLLP+J3KMNv/nPbGR/xm9T1pMq9yNNY0tZj
	JWoCIrWoT8iuB0k6aYAEWJhVjoTBqDgfLK4q1aB7WIKkL0HAbq4LCkhwuG/H8wliAg2owl
	E9WV0S4dWXPBZsbITkAMxQ8vRvT2XFHTnI9l4+vizlvmM16OUyhxDBnvmYOklDAAk/tQZ3
	dfFbAfnOOPSxIYy24knqNoo0hj5kVOYdjopHI4HVKCC9NDr7kkffhgpcxbUyGVSOgbVjNS
	ZL1EiLmj+OtRLveajdga88iRkie673FVYFeJ2ngNdBkSVxWrDQilkGSXq2sa5w==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] ALSA: hda/realtek: Remove ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1
Date: Mon,  3 Aug 2026 16:10:58 +0700
Message-ID: <20260803091102.107570-10-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1 and
ALC285_FIXUP_SPEAKER2_TO_DAC1 are exactly the same. Remove the former to
avoid redundancy.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 81d535acfd05..481335776ba8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4255,7 +4255,6 @@ enum {
 	ALC274_FIXUP_HP_AIO_BIND_DACS,
 	ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2,
 	ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC,
-	ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1,
 	ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC,
 	ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK,
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
@@ -6853,11 +6852,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1
-	},
-	[ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1
 	},
 	[ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.55.0

