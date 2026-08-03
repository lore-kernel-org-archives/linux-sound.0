Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642383BE630;
	Mon,  3 Aug 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748324; cv=none; b=HDRBkVwtjVDxRuhoRt+Y7/o4Q8nVWZ1KmB3pX6lWviT3lCyar5LuyDoLEPWIL5klQjOtfB8hdOct3Nj8mk69vcOn0uAGg+hwhO8XbL/b/A+KIQP9hnx+pJjK6ZyHNR2h9l3LleSrDEnlrAjUnd3wTBcFceKiWQH3qWtf9aJlsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748324; c=relaxed/simple;
	bh=PdtuXDbDqIMoo6muFRV1GIK9KVGKWBzXKxgcnTfzctU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trkfl240rPrDroY6vvLj3CcIYQVFuwSVTRILyW4jt/bc+Fy/pdZRm7aWw4qO/h1Z0VEajj1zV3TxKyOGed8RYVPy7XPQhuF4a2OSNqdA6gpDEuHzMJI52vlhKGEEjQrX9qVva/SVP/svDvdz2QZ9dxLI1wFNLopKcuPyXQlpe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=Tw7n67/i; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="Tw7n67/i"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9315281793;
	Mon,  3 Aug 2026 11:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mFcawI/zgg92BW0igwCyhElJSwB6szgoaVtLhbOHCZI=;
	b=Tw7n67/iuuqXQNGjtaZ9NaM3lhjM0JLZ1JD0tbdb6k0XUBiSajYPn2f/QCYpK8tzfaEXGL
	ohFMjrRwJfL1HbCDo5mMA/MvAT8Ia/m/iiURCUjgs/TOBV9ADEEq8PvLUm0k/oEUTHkjcv
	aCvhDO+eMJ/jVf0Pxmp/XYW05xhv+UpVkQPwFuaNoNw7GpYExfdAwlQyF20aVxgWLYTZKf
	sGjHTDKjVyW90j8seM4glDQi5fqZcCw/KhIEZlFatnvNKJNG0/9Chq0nzaGOS0hlFwAMm0
	fvM1wZH4gyDhF6O9DwYHhEOwH1fh7Y7TmCjk7+OgjKaFoGCnsDwfv2QVtgBARA==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] ALSA: hda/realtek: Remove ALC294_FIXUP_ASUS_ALLY_SPEAKER
Date: Mon,  3 Aug 2026 16:10:57 +0700
Message-ID: <20260803091102.107570-9-dnaim@cachyos.org>
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

ALC294_FIXUP_ASUS_ALLY_SPEAKER is exactly the same as
ALC285_FIXUP_SPEAKER2_TO_DAC1. Remove the former to avoid redundancy.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1e6f3f262e03..81d535acfd05 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4114,7 +4114,6 @@ enum {
 	ALC294_FIXUP_ASUS_ALLY,
 	ALC294_FIXUP_ASUS_ALLY_PINS,
 	ALC294_FIXUP_ASUS_ALLY_VERBS,
-	ALC294_FIXUP_ASUS_ALLY_SPEAKER,
 	ALC294_FIXUP_ASUS_HPE,
 	ALC294_FIXUP_ASUS_COEF_1B,
 	ALC294_FIXUP_ASUS_GX502_HP,
@@ -5732,11 +5731,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC294_FIXUP_ASUS_ALLY_SPEAKER
-	},
-	[ALC294_FIXUP_ASUS_ALLY_SPEAKER] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1
 	},
 	[ALC285_FIXUP_THINKPAD_X1_GEN7] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.55.0

